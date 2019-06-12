Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACCF42344
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408294AbfFLLBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 07:01:19 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:51442 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408277AbfFLLBS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 07:01:18 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,365,1557212400"; 
   d="scan'208";a="34098083"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2019 04:01:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Jun 2019 04:01:15 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 12 Jun 2019 04:01:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNXc0ffetkG/f3/NLmaiKurBlauEMW77VvM8HBkEo9I=;
 b=dpDer3FOWg+hrMOfB+Aeqavecb+ooB9NpfYw3W43T9jScjV6iOgzgNcnYoOLII5p6/mZw00IhsLT6qNtId/2My57snSxwCjikK0vwLHNTbD66iGKzGzX8eIqGJSQ/tjm3LQEBo5hrgKaCPSYxu+OBZAaToAEMPUwzDM5A3WJmX4=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1818.namprd11.prod.outlook.com (10.175.92.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 11:01:14 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9%9]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 11:01:14 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v5 2/3] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Topic: [PATCH v5 2/3] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Index: AQHVIQ4mHp1M8bBCGk67ILJ1Q++zTg==
Date:   Wed, 12 Jun 2019 11:01:13 +0000
Message-ID: <1560336983-16843-2-git-send-email-eugen.hristev@microchip.com>
References: <1560336983-16843-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1560336983-16843-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::24) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0abadfa-e627-46a7-0666-08d6ef2548ff
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1818;
x-ms-traffictypediagnostic: DM5PR11MB1818:
x-microsoft-antispam-prvs: <DM5PR11MB18183937BDEBFE108657537AE8EC0@DM5PR11MB1818.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(366004)(39860400002)(346002)(189003)(199004)(51234002)(66066001)(14444005)(14454004)(316002)(2201001)(68736007)(305945005)(53936002)(3846002)(2906002)(66556008)(86362001)(256004)(73956011)(5660300002)(71190400001)(7736002)(71200400001)(186003)(110136005)(478600001)(6512007)(476003)(11346002)(6486002)(81166006)(81156014)(8936002)(446003)(6436002)(2501003)(8676002)(66946007)(6506007)(76176011)(486006)(52116002)(2616005)(4326008)(72206003)(36756003)(102836004)(99286004)(386003)(26005)(6116002)(66476007)(50226002)(66446008)(64756008)(107886003)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1818;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aFtSgtcGmiNA+rqQIR42Qlno1eWYojSqelod4aS8R4TNyQ6DVoxKAQiXsxbe/K/CON5LR1BwR0D4y81kTtfbE/ieFgGufp5ciIRDh5St+otHEFtFwThn7Ele8e5vJTeNTanN91uzsScY86plF5KntzbUJxE8NF+wIDSjaQgUbkBsxr6C65go4szXBhCdr7ZfrMneDITAwhcInOhsOMb0m4pFLpQyTUy3R2bqhc6RSA7DmUqjrmiVwvRDdt59A3K1N3oOC9YRsfWN23oh3HkXlhZxJiByXCcEDipUlyBtFNn24kQ/j3Y1EbAwrjUmSE6bWoYsK/LGfD73lG+qhiebceF+kEXZ2ZsDhkVkJckToK0DqTLRD+Ney7lMxLjtPc7E1NDQH4PeEFHdTNN1E3b98XaIXCHsX7LP0WYYIxv0chQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0abadfa-e627-46a7-0666-08d6ef2548ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 11:01:13.9977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1818
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpDaGVj
a3BhdGNoIGNvbXBsYWluaW5nIHRoYXQgbG9ja3MgZG8gbm90IGhhdmUgY29tbWVudHMsDQp1bmFs
aWduZWQgY29kZSBhbmQgbWFjcm8gcmV1c2Ugb2Ygc2FtZSBhcmd1bWVudCBpbiB0b19pc2NfY2xr
Lg0KRml4ZWQgdGhlbSBieSByZW5hbWluZywgcmVhbGlnbmluZyBhbmQgYWRkaW5nIHN0cnVjdCBj
b21tZW50cw0KDQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1p
Y3JvY2hpcC5jb20+DQpBY2tlZC1ieTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXgu
aW50ZWwuY29tPg0KLS0tDQpDaGFuZ2VzIGluIHY1Og0KLSBub25lDQoNCkNoYW5nZXMgaW4gdjQ6
DQotIHMvc3luYy9zZXJpYWxpemUgYXMgcmVxdWVzdGVkIGJ5IFNha2FyaQ0KDQpDaGFuZ2VzIGlu
IHYzOg0KLSBuZXcgcGF0Y2gsIGFkZHJlc3NlcyB0aGUgY2hlY2twYXRjaCBpc3N1ZXMgdGhhdCBI
YW5zIGFza2VkIHRvIGZpeA0KDQoNCg0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRt
ZWwtaXNjLmggICAgICAgICB8IDUxICsrKysrKysrKysrKysrKysrKysrKy0tLQ0KIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYyB8ICA0ICstDQogMiBmaWxl
cyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaCBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLmgNCmluZGV4IGY2MzNlMTAuLjViZTViMDkgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oDQorKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oDQpAQCAtMjQsMTQgKzI0
LDE0IEBAIHN0cnVjdCBpc2NfY2xrIHsNCiAJc3RydWN0IGNsa19odyAgIGh3Ow0KIAlzdHJ1Y3Qg
Y2xrICAgICAgKmNsazsNCiAJc3RydWN0IHJlZ21hcCAgICpyZWdtYXA7DQotCXNwaW5sb2NrX3QJ
bG9jazsNCisJc3BpbmxvY2tfdAlsb2NrOwkvKiBzZXJpYWxpemUgYWNjZXNzIHRvIGNsb2NrIHJl
Z2lzdGVycyAqLw0KIAl1OAkJaWQ7DQogCXU4CQlwYXJlbnRfaWQ7DQogCXUzMgkJZGl2Ow0KIAlz
dHJ1Y3QgZGV2aWNlCSpkZXY7DQogfTsNCiANCi0jZGVmaW5lIHRvX2lzY19jbGsoaHcpIGNvbnRh
aW5lcl9vZihodywgc3RydWN0IGlzY19jbGssIGh3KQ0KKyNkZWZpbmUgdG9faXNjX2Nsayh2KSBj
b250YWluZXJfb2Yodiwgc3RydWN0IGlzY19jbGssIGh3KQ0KIA0KIHN0cnVjdCBpc2NfYnVmZmVy
IHsNCiAJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAgdmI7DQpAQCAtMTQ2LDYgKzE0Niw0NyBAQCBz
dHJ1Y3QgaXNjX2N0cmxzIHsNCiANCiAjZGVmaW5lIElTQ19QSVBFX0xJTkVfTk9ERV9OVU0JMTEN
CiANCisvKg0KKyAqIHN0cnVjdCBpc2NfZGV2aWNlIC0gSVNDIGRldmljZSBkcml2ZXIgZGF0YS9j
b25maWcgc3RydWN0DQorICogQHJlZ21hcDoJCVJlZ2lzdGVyIG1hcA0KKyAqIEBoY2xvY2s6CQlI
Y2xvY2sgY2xvY2sgaW5wdXQgKHJlZmVyIGRhdGFzaGVldCkNCisgKiBAaXNwY2s6CQlpc2NwY2sg
Y2xvY2sgKHJlZmVyIGRhdGFzaGVldCkNCisgKiBAaXNjX2Nsa3M6CQlJU0MgY2xvY2tzDQorICoN
CisgKiBAZGV2OgkJUmVnaXN0ZXJlZCBkZXZpY2UgZHJpdmVyDQorICogQHY0bDJfZGV2OgkJdjRs
MiByZWdpc3RlcmVkIGRldmljZQ0KKyAqIEB2aWRlb19kZXY6CQlyZWdpc3RlcmVkIHZpZGVvIGRl
dmljZQ0KKyAqDQorICogQHZiMl92aWRxOgkJdmlkZW8gYnVmZmVyIDIgdmlkZW8gcXVldWUNCisg
KiBAZG1hX3F1ZXVlX2xvY2s6CWxvY2sgdG8gc2VyaWFsaXplIHRoZSBkbWEgYnVmZmVyIHF1ZXVl
DQorICogQGRtYV9xdWV1ZToJCXRoZSBxdWV1ZSBmb3IgZG1hIGJ1ZmZlcnMNCisgKiBAY3VyX2Zy
bToJCWN1cnJlbnQgaXNjIGZyYW1lL2J1ZmZlcg0KKyAqIEBzZXF1ZW5jZToJCWN1cnJlbnQgZnJh
bWUgbnVtYmVyDQorICogQHN0b3A6CQl0cnVlIGlmIGlzYyBpcyBub3Qgc3RyZWFtaW5nLCBmYWxz
ZSBpZiBzdHJlYW1pbmcNCisgKiBAY29tcDoJCWNvbXBsZXRpb24gcmVmZXJlbmNlIHRoYXQgc2ln
bmFscyBmcmFtZSBjb21wbGV0aW9uDQorICoNCisgKiBAZm10OgkJY3VycmVudCB2NDJsIGZvcm1h
dA0KKyAqIEB1c2VyX2Zvcm1hdHM6CWxpc3Qgb2YgZm9ybWF0cyB0aGF0IGFyZSBzdXBwb3J0ZWQg
YW5kIGFncmVlZCB3aXRoIHNkDQorICogQG51bV91c2VyX2Zvcm1hdHM6CWhvdyBtYW55IGZvcm1h
dHMgYXJlIGluIHVzZXJfZm9ybWF0cw0KKyAqDQorICogQGNvbmZpZzoJCWN1cnJlbnQgSVNDIGZv
cm1hdCBjb25maWd1cmF0aW9uDQorICogQHRyeV9jb25maWc6CQl0aGUgY3VycmVudCBJU0MgdHJ5
IGZvcm1hdCAsIG5vdCB5ZXQgYWN0aXZhdGVkDQorICoNCisgKiBAY3RybHM6CQlob2xkcyBpbmZv
cm1hdGlvbiBhYm91dCBJU0MgY29udHJvbHMNCisgKiBAZG9fd2JfY3RybDoJCWNvbnRyb2wgcmVn
YXJkaW5nIHRoZSBET19XSElURV9CQUxBTkNFIGJ1dHRvbg0KKyAqIEBhd2Jfd29yazoJCXdvcmtx
dWV1ZSByZWZlcmVuY2UgZm9yIGF1dG93aGl0ZWJhbGFuY2UgaGlzdG9ncmFtDQorICoJCQlhbmFs
eXNpcw0KKyAqDQorICogQGxvY2s6CQlsb2NrIGZvciBzZXJpYWxpemluZyB1c2Vyc3BhY2UgZmls
ZSBvcGVyYXRpb25zDQorICoJCQl3aXRoIElTQyBvcGVyYXRpb25zDQorICogQGF3Yl9sb2NrOgkJ
bG9jayBmb3Igc2VyaWFsaXppbmcgYXdiIHdvcmsgcXVldWUgb3BlcmF0aW9ucw0KKyAqCQkJd2l0
aCBETUEvYnVmZmVyIG9wZXJhdGlvbnMNCisgKg0KKyAqIEBwaXBlbGluZToJCWNvbmZpZ3VyYXRp
b24gb2YgdGhlIElTQyBwaXBlbGluZQ0KKyAqDQorICogQGN1cnJlbnRfc3ViZGV2OgljdXJyZW50
IHN1YmRldmljZTogdGhlIHNlbnNvcg0KKyAqIEBzdWJkZXZfZW50aXRpZXM6CWxpc3Qgb2Ygc3Vi
ZGV2aWNlIGVudGl0aXRlcw0KKyAqLw0KIHN0cnVjdCBpc2NfZGV2aWNlIHsNCiAJc3RydWN0IHJl
Z21hcAkJKnJlZ21hcDsNCiAJc3RydWN0IGNsawkJKmhjbG9jazsNCkBAIC0xNTcsNyArMTk4LDcg
QEAgc3RydWN0IGlzY19kZXZpY2Ugew0KIAlzdHJ1Y3QgdmlkZW9fZGV2aWNlCXZpZGVvX2RldjsN
CiANCiAJc3RydWN0IHZiMl9xdWV1ZQl2YjJfdmlkcTsNCi0Jc3BpbmxvY2tfdAkJZG1hX3F1ZXVl
X2xvY2s7DQorCXNwaW5sb2NrX3QJCWRtYV9xdWV1ZV9sb2NrOyAvKiBzZXJpYWxpemUgYWNjZXNz
IHRvIGRtYSBxdWV1ZSAqLw0KIAlzdHJ1Y3QgbGlzdF9oZWFkCWRtYV9xdWV1ZTsNCiAJc3RydWN0
IGlzY19idWZmZXIJKmN1cl9mcm07DQogCXVuc2lnbmVkIGludAkJc2VxdWVuY2U7DQpAQCAtMTc1
LDggKzIxNiw4IEBAIHN0cnVjdCBpc2NfZGV2aWNlIHsNCiAJc3RydWN0IHY0bDJfY3RybAkqZG9f
d2JfY3RybDsNCiAJc3RydWN0IHdvcmtfc3RydWN0CWF3Yl93b3JrOw0KIA0KLQlzdHJ1Y3QgbXV0
ZXgJCWxvY2s7DQotCXNwaW5sb2NrX3QJCWF3Yl9sb2NrOw0KKwlzdHJ1Y3QgbXV0ZXgJCWxvY2s7
IC8qIHNlcmlhbGl6ZSBhY2Nlc3MgdG8gZmlsZSBvcGVyYXRpb25zICovDQorCXNwaW5sb2NrX3QJ
CWF3Yl9sb2NrOyAvKiBzZXJpYWxpemUgYWNjZXNzIHRvIERNQSBidWZmZXJzIGZyb20gYXdiIHdv
cmsgcXVldWUgKi8NCiANCiAJc3RydWN0IHJlZ21hcF9maWVsZAkqcGlwZWxpbmVbSVNDX1BJUEVf
TElORV9OT0RFX05VTV07DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9h
dG1lbC9hdG1lbC1zYW1hNWQyLWlzYy5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9h
dG1lbC1zYW1hNWQyLWlzYy5jDQppbmRleCA5M2ZiODM5Li4xMjdlNzljIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1zYW1hNWQyLWlzYy5jDQorKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLXNhbWE1ZDItaXNjLmMNCkBAIC04Nyw4
ICs4Nyw4IEBAIHN0YXRpYyBpbnQgaXNjX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGlzY19kZXZpY2UgKmlzYykNCiAJCQlicmVhazsNCiAJCX0NCiANCi0JCXN1YmRldl9lbnRp
dHkgPSBkZXZtX2t6YWxsb2MoZGV2LA0KLQkJCQkJICBzaXplb2YoKnN1YmRldl9lbnRpdHkpLCBH
RlBfS0VSTkVMKTsNCisJCXN1YmRldl9lbnRpdHkgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yo
KnN1YmRldl9lbnRpdHkpLA0KKwkJCQkJICAgICBHRlBfS0VSTkVMKTsNCiAJCWlmICghc3ViZGV2
X2VudGl0eSkgew0KIAkJCW9mX25vZGVfcHV0KHJlbSk7DQogCQkJcmV0ID0gLUVOT01FTTsNCi0t
IA0KMi43LjQNCg0K
