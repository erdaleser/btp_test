namespace appbkpf;
using {
  managed
}
from '@sap/cds/common';

entity bkpf: managed {
  key ID: UUID @(Core.Computed: true);
  asd: String(4); 
  bukrs: Association to t_bukrs;
  buktx: String(10);
  belnr: Association to t_belnr;
  gjahr: String(4);
  blart: Association to t_blart;
  bldat: Date @assert.range: [
    '2018-01-01',
    '2024-01-01'
  ];
  budat: Date @assert.range: [
    '2018-01-01',
    '2024-01-01'
  ];
}

entity t_bukrs: managed {
  key ID: UUID @(Core.Computed: true);
  bukrs: String(4);
  buktx: String(20);
}

entity t_belnr: managed {
  key ID: UUID @(Core.Computed: true);
  belnr: String(10);
}

entity t_blart: managed {
  key ID: UUID @(Core.Computed: true);
  blart: String(2);
}