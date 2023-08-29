using { appbkpf as my } from '../db/bkpf-schema';
@path: 'service/bkpf'
service bkpfService {
  entity bkpf as projection on my.bkpf ;
    annotate bkpf with @odata.draft.enabled;
  entity bukrs as projection on my.t_bukrs;
    annotate bukrs with @odata.draft.enabled;
  entity belnr as projection on my.t_belnr;
    annotate belnr with @odata.draft.enabled;
  entity blart as projection on my.t_blart;
    annotate blart with @odata.draft.enabled;
}
