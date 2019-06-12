Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC317424E9
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 14:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbfFLMAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 08:00:42 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:49899 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727503AbfFLMAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 08:00:42 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,365,1557212400"; 
   d="scan'208";a="37199917"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2019 05:00:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Jun 2019 05:00:36 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 12 Jun 2019 05:00:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ymny9NBtiK/EPtbaDdnmHlxTqlmp8mEJ1x+ebnttbFY=;
 b=s8PXeq+J7NYarSioYVFYbWgZD40mzg5TTeGsTG6uTveV0DPbAuLF/OUW2vBFqUT4vS5F9VS2/y/BRueZbqvVoq+AHjE2Bm+tiE5z7nFE0EwxrVfmaZbRLDkJwNmV3Rr6l4yE2CIp3Py8FQFFMesGtiGgvMKOnZKDhrVVxrKMXYo=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1497.namprd11.prod.outlook.com (10.172.38.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 12:00:36 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9%9]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 12:00:36 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v6 3/3] media: atmel: atmel-isc: fix and cleanup potential
 bugs
Thread-Topic: [PATCH v6 3/3] media: atmel: atmel-isc: fix and cleanup
 potential bugs
Thread-Index: AQHVIRZxGvQ1XJ/T2EmZQJVIjLN7ag==
Date:   Wed, 12 Jun 2019 12:00:35 +0000
Message-ID: <1560340575-21021-3-git-send-email-eugen.hristev@microchip.com>
References: <1560340575-21021-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1560340575-21021-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR03CA0065.eurprd03.prod.outlook.com
 (2603:10a6:803:50::36) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5379ad7-c010-49ba-6df1-08d6ef2d9417
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1497;
x-ms-traffictypediagnostic: DM5PR11MB1497:
x-microsoft-antispam-prvs: <DM5PR11MB149712950AF85B6D4EC02D27E8EC0@DM5PR11MB1497.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(66476007)(26005)(73956011)(66946007)(66446008)(66556008)(53936002)(64756008)(107886003)(4326008)(5660300002)(110136005)(316002)(6486002)(14444005)(71200400001)(25786009)(99286004)(256004)(2501003)(66066001)(476003)(6512007)(6506007)(71190400001)(86362001)(6436002)(2906002)(52116002)(6116002)(446003)(386003)(11346002)(186003)(2616005)(3846002)(36756003)(2201001)(486006)(72206003)(102836004)(478600001)(68736007)(8676002)(14454004)(50226002)(81156014)(81166006)(8936002)(305945005)(7736002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1497;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Axz2O2xJ2thiWJd8gfW1gcK+Enktyv4sR0Zws/aXC8vgkM6DkyDWUWRy/THr1dSXLbyFKSNZhKsn7JKDxugSpD2bHK6DZe8rL3727yNcVynA3NN0YjQ82BKfB9rMbtQF/5mgpsrBu1g0GfiMZbem2Fe+YscG7C8x6D0VBQZmsKdLo9eKTVE8fTZP4XeM/WKoA6zcVYK3cDincvvvchf2Borr29brIA8IGIGi2xZwcn+qI3Xm8jVmX+mCE+66qwU92EMIiDAgE6bD5C5yTQWAPh7hAMCpmguM4q4+xkjdywhX9TDRh/MQeiCTCX9LCjsrFkjD07DLT5xVcxPaH+iHxjYCNbRInMjvoS/RfOdarpSgAag+HnH9BNEy4MD8+xwlmmjEtn+sBKOvIwr0VIOl8UTH8jOlYsR1CanFPNs//Kc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e5379ad7-c010-49ba-6df1-08d6ef2d9417
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 12:00:36.1047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1497
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpGaXhl
ZCBpc3N1ZXMgdGhhdCBjYW4gbGVhZCB0byBwb3RlbnRpYWwgYnVncy4NCkNsZWFudXAgb3JkZXIg
aW4gdGhlIGRyaXZlcg0KVGFraW5nIGludG8gY29uc2lkZXJhdGlvbiBzdGQgY29udHJvbCBjcmVh
dGlvbiBjYW4gZmFpbA0KbXV0ZXhfZGVzdHJveSBjYWxsDQpjaGFuZ2luZyBjb250cm9sbGVyX2Zv
cm1hdHMgd2l0aCBjb25zdCBzcGVjaWZpZXINCnNvbWUgY29zbWV0aWMgY2xlYW51cHMNCg0KU2ln
bmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0K
LS0tDQpDaGFuZ2VzIGluIHY2Og0KLSBhZGRlZCBiYWNrICJyZXR1cm4gMCIgbGluZSB3aGljaCB3
YXMgZGVsZXRlZA0KDQpDaGFuZ2VzIGluIHY1Og0KLSBuZXcgcGF0Y2ggdGhhdCBmaXhlcyBpc3N1
ZXMgcmV2aWV3ZWQgYnkgU2FrYXJpDQoNCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0
bWVsLWlzYy1iYXNlLmMgICAgfCAyOCArKysrKysrKysrKysrKysrLS0tLS0tLS0NCiBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oICAgICAgICAgfCAgMiArLQ0KIGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYyB8IDE0ICsrKysrKyst
LS0tLQ0KIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1i
YXNlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMNCmlu
ZGV4IGVkZmQ3ZTAuLmViMWY1ZDQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRt
ZWwvYXRtZWwtaXNjLWJhc2UuYw0KQEAgLTQ1LDcgKzQ1LDcgQEAgTU9EVUxFX1BBUk1fREVTQyhz
ZW5zb3JfcHJlZmVycmVkLA0KIAkJICJTZW5zb3IgaXMgcHJlZmVycmVkIHRvIG91dHB1dCB0aGUg
c3BlY2lmaWVkIGZvcm1hdCAoMS1vbiAwLW9mZiksIGRlZmF1bHQgMSIpOw0KIA0KIC8qIFRoaXMg
aXMgYSBsaXN0IG9mIHRoZSBmb3JtYXRzIHRoYXQgdGhlIElTQyBjYW4gKm91dHB1dCogKi8NCi1z
dHJ1Y3QgaXNjX2Zvcm1hdCBjb250cm9sbGVyX2Zvcm1hdHNbXSA9IHsNCitjb25zdCBzdHJ1Y3Qg
aXNjX2Zvcm1hdCBjb250cm9sbGVyX2Zvcm1hdHNbXSA9IHsNCiAJew0KIAkJLmZvdXJjYwkJPSBW
NEwyX1BJWF9GTVRfQVJHQjQ0NCwNCiAJfSwNCkBAIC0yMzEsNyArMjMxLDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIGlzY191cGRhdGVfYXdiX2N0cmxzKHN0cnVjdCBpc2NfZGV2aWNlICppc2MpDQog
DQogc3RhdGljIGlubGluZSB2b2lkIGlzY19yZXNldF9hd2JfY3RybHMoc3RydWN0IGlzY19kZXZp
Y2UgKmlzYykNCiB7DQotCWludCBjOw0KKwl1bnNpZ25lZCBpbnQgYzsNCiANCiAJZm9yIChjID0g
SVNDX0hJU19DRkdfTU9ERV9HUjsgYyA8PSBJU0NfSElTX0NGR19NT0RFX0I7IGMrKykgew0KIAkJ
LyogZ2FpbnMgaGF2ZSBhIGZpeGVkIHBvaW50IGF0IDkgZGVjaW1hbHMgKi8NCkBAIC0xNDU2LDcg
KzE0NTYsNyBAQCBzdGF0aWMgaW50IGlzY19lbnVtX2ZyYW1laW50ZXJ2YWxzKHN0cnVjdCBmaWxl
ICpmaWxlLCB2b2lkICpmaCwNCiAJCS53aGljaCA9IFY0TDJfU1VCREVWX0ZPUk1BVF9BQ1RJVkUs
DQogCX07DQogCWludCByZXQgPSAtRUlOVkFMOw0KLQlpbnQgaTsNCisJdW5zaWduZWQgaW50IGk7
DQogDQogCWZvciAoaSA9IDA7IGkgPCBpc2MtPm51bV91c2VyX2Zvcm1hdHM7IGkrKykNCiAJCWlm
IChpc2MtPnVzZXJfZm9ybWF0c1tpXS0+Zm91cmNjID09IGZpdmFsLT5waXhlbF9mb3JtYXQpDQpA
QCAtMTg4Myw2ICsxODgzLDEyIEBAIHN0YXRpYyBpbnQgaXNjX2N0cmxfaW5pdChzdHJ1Y3QgaXNj
X2RldmljZSAqaXNjKQ0KIAlpc2MtPmRvX3diX2N0cmwgPSB2NGwyX2N0cmxfbmV3X3N0ZChoZGws
IG9wcywgVjRMMl9DSURfRE9fV0hJVEVfQkFMQU5DRSwNCiAJCQkJCSAgICAwLCAwLCAwLCAwKTsN
CiANCisJaWYgKCFpc2MtPmRvX3diX2N0cmwpIHsNCisJCXJldCA9IGhkbC0+ZXJyb3I7DQorCQl2
NGwyX2N0cmxfaGFuZGxlcl9mcmVlKGhkbCk7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQogCXY0
bDJfY3RybF9hY3RpdmF0ZShpc2MtPmRvX3diX2N0cmwsIGZhbHNlKTsNCiANCiAJdjRsMl9jdHJs
X2hhbmRsZXJfc2V0dXAoaGRsKTsNCkBAIC0yMDEwLDcgKzIwMTYsNyBAQCBzdGF0aWMgaW50IGlz
Y19hc3luY19jb21wbGV0ZShzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZpZXIpDQog
CQkJCQkgICAgICBzdHJ1Y3QgaXNjX2RldmljZSwgdjRsMl9kZXYpOw0KIAlzdHJ1Y3QgdmlkZW9f
ZGV2aWNlICp2ZGV2ID0gJmlzYy0+dmlkZW9fZGV2Ow0KIAlzdHJ1Y3QgdmIyX3F1ZXVlICpxID0g
JmlzYy0+dmIyX3ZpZHE7DQotCWludCByZXQ7DQorCWludCByZXQgPSAwOw0KIA0KIAlJTklUX1dP
UksoJmlzYy0+YXdiX3dvcmssIGlzY19hd2Jfd29yayk7DQogDQpAQCAtMjA0MSw3ICsyMDQ3LDcg
QEAgc3RhdGljIGludCBpc2NfYXN5bmNfY29tcGxldGUoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZp
ZXIgKm5vdGlmaWVyKQ0KIAlpZiAocmV0IDwgMCkgew0KIAkJdjRsMl9lcnIoJmlzYy0+djRsMl9k
ZXYsDQogCQkJICJ2YjJfcXVldWVfaW5pdCgpIGZhaWxlZDogJWRcbiIsIHJldCk7DQotCQlyZXR1
cm4gcmV0Ow0KKwkJZ290byBpc2NfYXN5bmNfY29tcGxldGVfZXJyOw0KIAl9DQogDQogCS8qIElu
aXQgdmlkZW8gZG1hIHF1ZXVlcyAqLw0KQEAgLTIwNTMsMTkgKzIwNTksMTkgQEAgc3RhdGljIGlu
dCBpc2NfYXN5bmNfY29tcGxldGUoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXIgKm5vdGlmaWVy
KQ0KIAlpZiAocmV0IDwgMCkgew0KIAkJdjRsMl9lcnIoJmlzYy0+djRsMl9kZXYsDQogCQkJICJJ
bml0IGZvcm1hdCBmYWlsZWQ6ICVkXG4iLCByZXQpOw0KLQkJcmV0dXJuIHJldDsNCisJCWdvdG8g
aXNjX2FzeW5jX2NvbXBsZXRlX2VycjsNCiAJfQ0KIA0KIAlyZXQgPSBpc2Nfc2V0X2RlZmF1bHRf
Zm10KGlzYyk7DQogCWlmIChyZXQpIHsNCiAJCXY0bDJfZXJyKCZpc2MtPnY0bDJfZGV2LCAiQ291
bGQgbm90IHNldCBkZWZhdWx0IGZvcm1hdFxuIik7DQotCQlyZXR1cm4gcmV0Ow0KKwkJZ290byBp
c2NfYXN5bmNfY29tcGxldGVfZXJyOw0KIAl9DQogDQogCXJldCA9IGlzY19jdHJsX2luaXQoaXNj
KTsNCiAJaWYgKHJldCkgew0KIAkJdjRsMl9lcnIoJmlzYy0+djRsMl9kZXYsICJJbml0IGlzYyBj
dHJvbHMgZmFpbGVkOiAlZFxuIiwgcmV0KTsNCi0JCXJldHVybiByZXQ7DQorCQlnb3RvIGlzY19h
c3luY19jb21wbGV0ZV9lcnI7DQogCX0NCiANCiAJLyogUmVnaXN0ZXIgdmlkZW8gZGV2aWNlICov
DQpAQCAtMjA4NSwxMCArMjA5MSwxNCBAQCBzdGF0aWMgaW50IGlzY19hc3luY19jb21wbGV0ZShz
dHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZpZXIpDQogCWlmIChyZXQgPCAwKSB7DQog
CQl2NGwyX2VycigmaXNjLT52NGwyX2RldiwNCiAJCQkgInZpZGVvX3JlZ2lzdGVyX2RldmljZSBm
YWlsZWQ6ICVkXG4iLCByZXQpOw0KLQkJcmV0dXJuIHJldDsNCisJCWdvdG8gaXNjX2FzeW5jX2Nv
bXBsZXRlX2VycjsNCiAJfQ0KIA0KIAlyZXR1cm4gMDsNCisNCitpc2NfYXN5bmNfY29tcGxldGVf
ZXJyOg0KKwltdXRleF9kZXN0cm95KCZpc2MtPmxvY2spOw0KKwlyZXR1cm4gcmV0Ow0KIH0NCiAN
CiBjb25zdCBzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllcl9vcGVyYXRpb25zIGlzY19hc3luY19v
cHMgPSB7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1p
c2MuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLmgNCmluZGV4IDVi
ZTViMDkuLmY1ZjU5MzIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVs
L2F0bWVsLWlzYy5oDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlz
Yy5oDQpAQCAtMjM1LDcgKzIzNSw3IEBAIGV4dGVybiB1bnNpZ25lZCBpbnQgZGVidWc7DQogZXh0
ZXJuIHVuc2lnbmVkIGludCBzZW5zb3JfcHJlZmVycmVkOw0KIA0KIGV4dGVybiBzdHJ1Y3QgaXNj
X2Zvcm1hdCBmb3JtYXRzX2xpc3RbXTsNCi1leHRlcm4gc3RydWN0IGlzY19mb3JtYXQgY29udHJv
bGxlcl9mb3JtYXRzW107DQorZXh0ZXJuIGNvbnN0IHN0cnVjdCBpc2NfZm9ybWF0IGNvbnRyb2xs
ZXJfZm9ybWF0c1tdOw0KIGV4dGVybiBjb25zdCB1MzIgaXNjX2dhbW1hX3RhYmxlW0dBTU1BX01B
WCArIDFdW0dBTU1BX0VOVFJJRVNdOw0KIGV4dGVybiBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZp
ZyBpc2NfcmVnbWFwX2NvbmZpZzsNCiBleHRlcm4gY29uc3Qgc3RydWN0IHY0bDJfYXN5bmNfbm90
aWZpZXJfb3BlcmF0aW9ucyBpc2NfYXN5bmNfb3BzOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYw0KaW5kZXggMTI3ZTc5Yy4uMjY2ZGYxNCAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1p
c2MuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1zYW1hNWQyLWlz
Yy5jDQpAQCAtMTIyLDggKzEyMiw3IEBAIHN0YXRpYyBpbnQgaXNjX3BhcnNlX2R0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGlzY19kZXZpY2UgKmlzYykNCiAJCQkJCUlTQ19QRkVfQ0ZHMF9D
Q0lSNjU2Ow0KIA0KIAkJc3ViZGV2X2VudGl0eS0+YXNkLT5tYXRjaF90eXBlID0gVjRMMl9BU1lO
Q19NQVRDSF9GV05PREU7DQotCQlzdWJkZXZfZW50aXR5LT5hc2QtPm1hdGNoLmZ3bm9kZSA9DQot
CQkJb2ZfZndub2RlX2hhbmRsZShyZW0pOw0KKwkJc3ViZGV2X2VudGl0eS0+YXNkLT5tYXRjaC5m
d25vZGUgPSBvZl9md25vZGVfaGFuZGxlKHJlbSk7DQogCQlsaXN0X2FkZF90YWlsKCZzdWJkZXZf
ZW50aXR5LT5saXN0LCAmaXNjLT5zdWJkZXZfZW50aXRpZXMpOw0KIAl9DQogDQpAQCAtMjgyLDEz
ICsyODEsMTQgQEAgc3RhdGljIGludCBhdG1lbF9pc2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQogCXN0cnVjdCBpc2NfZGV2aWNlICppc2MgPSBwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YShwZGV2KTsNCiANCiAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KLQljbGtf
ZGlzYWJsZV91bnByZXBhcmUoaXNjLT5pc3Bjayk7DQotCWNsa19kaXNhYmxlX3VucHJlcGFyZShp
c2MtPmhjbG9jayk7DQogDQogCWlzY19zdWJkZXZfY2xlYW51cChpc2MpOw0KIA0KIAl2NGwyX2Rl
dmljZV91bnJlZ2lzdGVyKCZpc2MtPnY0bDJfZGV2KTsNCiANCisJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGlzYy0+aXNwY2spOw0KKwljbGtfZGlzYWJsZV91bnByZXBhcmUoaXNjLT5oY2xvY2spOw0K
Kw0KIAlpc2NfY2xrX2NsZWFudXAoaXNjKTsNCiANCiAJcmV0dXJuIDA7DQpAQCAtMzEzLDcgKzMx
MywxMSBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGlzY19ydW50aW1lX3Jlc3VtZShzdHJ1
Y3QgZGV2aWNlICpkZXYpDQogCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KIA0KLQlyZXR1cm4g
Y2xrX3ByZXBhcmVfZW5hYmxlKGlzYy0+aXNwY2spOw0KKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFi
bGUoaXNjLT5pc3Bjayk7DQorCWlmIChyZXQpDQorCQljbGtfZGlzYWJsZV91bnByZXBhcmUoaXNj
LT5oY2xvY2spOw0KKw0KKwlyZXR1cm4gcmV0Ow0KIH0NCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGRldl9wbV9vcHMgYXRtZWxfaXNjX2Rldl9wbV9vcHMgPSB7DQotLSANCjIuNy40DQoNCg==
