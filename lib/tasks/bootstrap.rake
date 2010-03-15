namespace :bootstrap do
      desc "Add the default file types"
      task :add_types => :environment do
      
      [FileType].each(&:delete_all)

        FileType.create( :extension => '.rb', :description => 'Ruby' )
        FileType.create( :extension => '.cpp', :description => 'C++' )
        FileType.create( :extension => '.as', :description => 'ActionScript' )
      end

      desc "Run all bootstrapping tasks"
      task :all => [:add_types]
    end

