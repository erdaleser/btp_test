sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'bkpf/bkpf/test/integration/FirstJourney',
		'bkpf/bkpf/test/integration/pages/bkpfList',
		'bkpf/bkpf/test/integration/pages/bkpfObjectPage',
		'bkpf/bkpf/test/integration/pages/bukrsObjectPage'
    ],
    function(JourneyRunner, opaJourney, bkpfList, bkpfObjectPage, bukrsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('bkpf/bkpf') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThebkpfList: bkpfList,
					onThebkpfObjectPage: bkpfObjectPage,
					onThebukrsObjectPage: bukrsObjectPage
                }
            },
            opaJourney.run
        );
    }
);