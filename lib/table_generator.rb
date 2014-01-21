require 'terminal-table'

class TableGenerator

  attr_reader :logs, :harvests

  def initialize
    current_dir = File.join(File.dirname(File.expand_path(__FILE__)))
    @logs = Dir.glob(current_dir+'/../benchmarks/*.log')
    @harvests = []
    parse_logs
    prep_data
  end

  def generate
    render
  end

  private

    def parse_logs
      logs.each do |log|
        log = File.read(log)
        log.gsub(/ using \w+/,'')
        @titles  = log.scan(/^.*_\w+/).uniq
        datas    = log.scan(/\(.*\)/).each do |datum|
          datum.gsub!(/\)/,'')
          datum.gsub!(/\(/,'')
          datum.strip!
        end
        count = 0
        harvest = []
        @titles.count.times do |i|
          if i == 0
            harvest << [datas[i], datas[i+1]]
          else
            harvest << [datas[count], datas[count+1]]
          end
          count += 2
        end
        harvests << harvest
      end
    end

    def prep_data
      @row = []
      @titles.each {|title| @row << [title] }
      harvests.each do |harvest|
        harvest.count.times do |i|
          @row[i] << harvest[i][0]
          @row[i] << harvest[i][1]
        end
      end
    end

    def get_table_headings
      headings = ['']
      logs.each do |log|
        slug = log.scan(/benchmarks\/(.*).log/)[0][0]
        browser_name = slug.scan(/(.*)_/)[0][0]
        browser_number = slug.scan(/_(.*)/)[0][0]
        headings << "#{browser_name[0].capitalize} #{browser_number}"
        headings << "#{browser_name[0].capitalize} #{browser_number}"
      end
      headings
    end

    def render
      headings = get_table_headings

      tmp = ['']
      (headings.count-1)/2.times do |count|
        unless count == 0
          tmp << 'CSS'
          tmp << 'XPath'
        end
      end
      rows = []
      rows << tmp

      @row.each do |ro|
        rows << ro
      end

      puts Terminal::Table.new headings: headings, rows: rows
    end
end