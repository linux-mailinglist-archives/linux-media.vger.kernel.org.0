Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD4342346
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438170AbfFLLBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 07:01:21 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:33120 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408304AbfFLLBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 07:01:20 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,365,1557212400"; 
   d="scan'208";a="35527222"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2019 04:01:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Jun 2019 04:01:18 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 12 Jun 2019 04:01:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l90ZqAjLuZ3F/yUQfh/uxTH/5T8+xFw17ieWhNatCI=;
 b=YnwuBYZlr5rzcLOSEQzrcD9A+9/kA1FJIcgMpwF1JLgAJvSpX+vP5qALyjvWdQJUhFtJv/WixwfSl3nU4OLg2Ukcpn4ToLUCRmY4UGbJmfryV+t+HLkQtzXtXXN0aSORqi7GfAv4FSMo24KHVmkd1oLWUtiWbh61k4x/gBkFSRc=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1818.namprd11.prod.outlook.com (10.175.92.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Wed, 12 Jun 2019 11:01:16 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9%9]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 11:01:15 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v5 3/3] media: atmel: atmel-isc: fix and cleanup potential
 bugs
Thread-Topic: [PATCH v5 3/3] media: atmel: atmel-isc: fix and cleanup
 potential bugs
Thread-Index: AQHVIQ4nAXoA9SEVe0C/kbFc5jT6cg==
Date:   Wed, 12 Jun 2019 11:01:15 +0000
Message-ID: <1560336983-16843-3-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: bf01dd5d-7c49-42a5-73a3-08d6ef254a11
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1818;
x-ms-traffictypediagnostic: DM5PR11MB1818:
x-microsoft-antispam-prvs: <DM5PR11MB181823DDF617462B3C61B5F9E8EC0@DM5PR11MB1818.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(366004)(39860400002)(346002)(189003)(199004)(66066001)(14444005)(14454004)(316002)(2201001)(68736007)(305945005)(53936002)(3846002)(2906002)(66556008)(86362001)(256004)(73956011)(5660300002)(71190400001)(7736002)(71200400001)(186003)(110136005)(478600001)(6512007)(476003)(11346002)(6486002)(81166006)(81156014)(8936002)(446003)(6436002)(2501003)(8676002)(66946007)(6506007)(76176011)(486006)(52116002)(2616005)(4326008)(72206003)(36756003)(102836004)(99286004)(386003)(26005)(6116002)(66476007)(50226002)(66446008)(64756008)(107886003)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1818;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oULTkQKvkzuX5iX3A0+1+2U8Cc693hXQK8CHEZI9XemoXcX4G+VwkYKPjAuT9oe9l01LKaEL4Qagl+hzaBaIObZDridjDRrPIJr/K5cmktgBiEXyULaMwKPmI5gq1406RQ8qNkWiIJNUd7r+5UHarXFz2JW8/dYyQo3Kco86szWg3g5tTUdV7FfJBqZhziXEjb2NtazmCKPnkBiVKz4QhIs43sZQrOKxzLRBwcho0rQ7Zf7+rheZkI4YiaYlIg2qiT+d71z6hYrEMr9ZnCdBJO24nox4RV/0Pji7XesQQxmxcql4vLYUIx74+gMOQDez7A7HuT14C4e3rBQjqtthX2f3OHr1Z8WeOkEQn1Pl96YJ8zPzadNx8D3YPwcXxhXmaIdH/2j0NWK2PRCDk/exUYaznG4MwZUyuBN528W8+/M=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf01dd5d-7c49-42a5-73a3-08d6ef254a11
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 11:01:15.8362
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

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpGaXhl
ZCBpc3N1ZXMgdGhhdCBjYW4gbGVhZCB0byBwb3RlbnRpYWwgYnVncy4NCkNsZWFudXAgb3JkZXIg
aW4gdGhlIGRyaXZlcg0KVGFraW5nIGludG8gY29uc2lkZXJhdGlvbiBzdGQgY29udHJvbCBjcmVh
dGlvbiBjYW4gZmFpbA0KbXV0ZXhfZGVzdHJveSBjYWxsDQpjaGFuZ2luZyBjb250cm9sbGVyX2Zv
cm1hdHMgd2l0aCBjb25zdCBzcGVjaWZpZXINCnNvbWUgY29zbWV0aWMgY2xlYW51cHMNCg0KU2ln
bmVkLW9mZi1ieTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0K
LS0tDQpDaGFuZ2VzIGluIHY1Og0KLSBuZXcgcGF0Y2ggdGhhdCBmaXhlcyBpc3N1ZXMgcmV2aWV3
ZWQgYnkgU2FrYXJpDQoNCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1i
YXNlLmMgICAgfCAyOCArKysrKysrKysrKysrKystLS0tLS0tLS0NCiBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYyB8IDE0ICsrKysrKystLS0tLQ0KIDMg
ZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMNCmluZGV4IGVkZmQ3
ZTAuLjY3ODM4M2UgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0
bWVsLWlzYy1iYXNlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwt
aXNjLWJhc2UuYw0KQEAgLTQ1LDcgKzQ1LDcgQEAgTU9EVUxFX1BBUk1fREVTQyhzZW5zb3JfcHJl
ZmVycmVkLA0KIAkJICJTZW5zb3IgaXMgcHJlZmVycmVkIHRvIG91dHB1dCB0aGUgc3BlY2lmaWVk
IGZvcm1hdCAoMS1vbiAwLW9mZiksIGRlZmF1bHQgMSIpOw0KIA0KIC8qIFRoaXMgaXMgYSBsaXN0
IG9mIHRoZSBmb3JtYXRzIHRoYXQgdGhlIElTQyBjYW4gKm91dHB1dCogKi8NCi1zdHJ1Y3QgaXNj
X2Zvcm1hdCBjb250cm9sbGVyX2Zvcm1hdHNbXSA9IHsNCitjb25zdCBzdHJ1Y3QgaXNjX2Zvcm1h
dCBjb250cm9sbGVyX2Zvcm1hdHNbXSA9IHsNCiAJew0KIAkJLmZvdXJjYwkJPSBWNEwyX1BJWF9G
TVRfQVJHQjQ0NCwNCiAJfSwNCkBAIC0yMzEsNyArMjMxLDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IGlzY191cGRhdGVfYXdiX2N0cmxzKHN0cnVjdCBpc2NfZGV2aWNlICppc2MpDQogDQogc3RhdGlj
IGlubGluZSB2b2lkIGlzY19yZXNldF9hd2JfY3RybHMoc3RydWN0IGlzY19kZXZpY2UgKmlzYykN
CiB7DQotCWludCBjOw0KKwl1bnNpZ25lZCBpbnQgYzsNCiANCiAJZm9yIChjID0gSVNDX0hJU19D
RkdfTU9ERV9HUjsgYyA8PSBJU0NfSElTX0NGR19NT0RFX0I7IGMrKykgew0KIAkJLyogZ2FpbnMg
aGF2ZSBhIGZpeGVkIHBvaW50IGF0IDkgZGVjaW1hbHMgKi8NCkBAIC0xNDU2LDcgKzE0NTYsNyBA
QCBzdGF0aWMgaW50IGlzY19lbnVtX2ZyYW1laW50ZXJ2YWxzKHN0cnVjdCBmaWxlICpmaWxlLCB2
b2lkICpmaCwNCiAJCS53aGljaCA9IFY0TDJfU1VCREVWX0ZPUk1BVF9BQ1RJVkUsDQogCX07DQog
CWludCByZXQgPSAtRUlOVkFMOw0KLQlpbnQgaTsNCisJdW5zaWduZWQgaW50IGk7DQogDQogCWZv
ciAoaSA9IDA7IGkgPCBpc2MtPm51bV91c2VyX2Zvcm1hdHM7IGkrKykNCiAJCWlmIChpc2MtPnVz
ZXJfZm9ybWF0c1tpXS0+Zm91cmNjID09IGZpdmFsLT5waXhlbF9mb3JtYXQpDQpAQCAtMTg4Myw2
ICsxODgzLDEyIEBAIHN0YXRpYyBpbnQgaXNjX2N0cmxfaW5pdChzdHJ1Y3QgaXNjX2RldmljZSAq
aXNjKQ0KIAlpc2MtPmRvX3diX2N0cmwgPSB2NGwyX2N0cmxfbmV3X3N0ZChoZGwsIG9wcywgVjRM
Ml9DSURfRE9fV0hJVEVfQkFMQU5DRSwNCiAJCQkJCSAgICAwLCAwLCAwLCAwKTsNCiANCisJaWYg
KCFpc2MtPmRvX3diX2N0cmwpIHsNCisJCXJldCA9IGhkbC0+ZXJyb3I7DQorCQl2NGwyX2N0cmxf
aGFuZGxlcl9mcmVlKGhkbCk7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQogCXY0bDJfY3RybF9h
Y3RpdmF0ZShpc2MtPmRvX3diX2N0cmwsIGZhbHNlKTsNCiANCiAJdjRsMl9jdHJsX2hhbmRsZXJf
c2V0dXAoaGRsKTsNCkBAIC0yMDEwLDcgKzIwMTYsNyBAQCBzdGF0aWMgaW50IGlzY19hc3luY19j
b21wbGV0ZShzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZpZXIpDQogCQkJCQkgICAg
ICBzdHJ1Y3QgaXNjX2RldmljZSwgdjRsMl9kZXYpOw0KIAlzdHJ1Y3QgdmlkZW9fZGV2aWNlICp2
ZGV2ID0gJmlzYy0+dmlkZW9fZGV2Ow0KIAlzdHJ1Y3QgdmIyX3F1ZXVlICpxID0gJmlzYy0+dmIy
X3ZpZHE7DQotCWludCByZXQ7DQorCWludCByZXQgPSAwOw0KIA0KIAlJTklUX1dPUksoJmlzYy0+
YXdiX3dvcmssIGlzY19hd2Jfd29yayk7DQogDQpAQCAtMjA0MSw3ICsyMDQ3LDcgQEAgc3RhdGlj
IGludCBpc2NfYXN5bmNfY29tcGxldGUoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXIgKm5vdGlm
aWVyKQ0KIAlpZiAocmV0IDwgMCkgew0KIAkJdjRsMl9lcnIoJmlzYy0+djRsMl9kZXYsDQogCQkJ
ICJ2YjJfcXVldWVfaW5pdCgpIGZhaWxlZDogJWRcbiIsIHJldCk7DQotCQlyZXR1cm4gcmV0Ow0K
KwkJZ290byBpc2NfYXN5bmNfY29tcGxldGVfZXJyOw0KIAl9DQogDQogCS8qIEluaXQgdmlkZW8g
ZG1hIHF1ZXVlcyAqLw0KQEAgLTIwNTMsMTkgKzIwNTksMTkgQEAgc3RhdGljIGludCBpc2NfYXN5
bmNfY29tcGxldGUoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXIgKm5vdGlmaWVyKQ0KIAlpZiAo
cmV0IDwgMCkgew0KIAkJdjRsMl9lcnIoJmlzYy0+djRsMl9kZXYsDQogCQkJICJJbml0IGZvcm1h
dCBmYWlsZWQ6ICVkXG4iLCByZXQpOw0KLQkJcmV0dXJuIHJldDsNCisJCWdvdG8gaXNjX2FzeW5j
X2NvbXBsZXRlX2VycjsNCiAJfQ0KIA0KIAlyZXQgPSBpc2Nfc2V0X2RlZmF1bHRfZm10KGlzYyk7
DQogCWlmIChyZXQpIHsNCiAJCXY0bDJfZXJyKCZpc2MtPnY0bDJfZGV2LCAiQ291bGQgbm90IHNl
dCBkZWZhdWx0IGZvcm1hdFxuIik7DQotCQlyZXR1cm4gcmV0Ow0KKwkJZ290byBpc2NfYXN5bmNf
Y29tcGxldGVfZXJyOw0KIAl9DQogDQogCXJldCA9IGlzY19jdHJsX2luaXQoaXNjKTsNCiAJaWYg
KHJldCkgew0KIAkJdjRsMl9lcnIoJmlzYy0+djRsMl9kZXYsICJJbml0IGlzYyBjdHJvbHMgZmFp
bGVkOiAlZFxuIiwgcmV0KTsNCi0JCXJldHVybiByZXQ7DQorCQlnb3RvIGlzY19hc3luY19jb21w
bGV0ZV9lcnI7DQogCX0NCiANCiAJLyogUmVnaXN0ZXIgdmlkZW8gZGV2aWNlICovDQpAQCAtMjA4
NSwxMCArMjA5MSwxMiBAQCBzdGF0aWMgaW50IGlzY19hc3luY19jb21wbGV0ZShzdHJ1Y3QgdjRs
Ml9hc3luY19ub3RpZmllciAqbm90aWZpZXIpDQogCWlmIChyZXQgPCAwKSB7DQogCQl2NGwyX2Vy
cigmaXNjLT52NGwyX2RldiwNCiAJCQkgInZpZGVvX3JlZ2lzdGVyX2RldmljZSBmYWlsZWQ6ICVk
XG4iLCByZXQpOw0KLQkJcmV0dXJuIHJldDsNCisJCWdvdG8gaXNjX2FzeW5jX2NvbXBsZXRlX2Vy
cjsNCiAJfQ0KIA0KLQlyZXR1cm4gMDsNCitpc2NfYXN5bmNfY29tcGxldGVfZXJyOg0KKwltdXRl
eF9kZXN0cm95KCZpc2MtPmxvY2spOw0KKwlyZXR1cm4gcmV0Ow0KIH0NCiANCiBjb25zdCBzdHJ1
Y3QgdjRsMl9hc3luY19ub3RpZmllcl9vcGVyYXRpb25zIGlzY19hc3luY19vcHMgPSB7DQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaCBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLmgNCmluZGV4IDViZTViMDkuLmY1ZjU5
MzIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5o
DQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oDQpAQCAtMjM1
LDcgKzIzNSw3IEBAIGV4dGVybiB1bnNpZ25lZCBpbnQgZGVidWc7DQogZXh0ZXJuIHVuc2lnbmVk
IGludCBzZW5zb3JfcHJlZmVycmVkOw0KIA0KIGV4dGVybiBzdHJ1Y3QgaXNjX2Zvcm1hdCBmb3Jt
YXRzX2xpc3RbXTsNCi1leHRlcm4gc3RydWN0IGlzY19mb3JtYXQgY29udHJvbGxlcl9mb3JtYXRz
W107DQorZXh0ZXJuIGNvbnN0IHN0cnVjdCBpc2NfZm9ybWF0IGNvbnRyb2xsZXJfZm9ybWF0c1td
Ow0KIGV4dGVybiBjb25zdCB1MzIgaXNjX2dhbW1hX3RhYmxlW0dBTU1BX01BWCArIDFdW0dBTU1B
X0VOVFJJRVNdOw0KIGV4dGVybiBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBpc2NfcmVnbWFw
X2NvbmZpZzsNCiBleHRlcm4gY29uc3Qgc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXJfb3BlcmF0
aW9ucyBpc2NfYXN5bmNfb3BzOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
YXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwv
YXRtZWwtc2FtYTVkMi1pc2MuYw0KaW5kZXggMTI3ZTc5Yy4uMjY2ZGYxNCAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYw0KKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1zYW1hNWQyLWlzYy5jDQpAQCAtMTIy
LDggKzEyMiw3IEBAIHN0YXRpYyBpbnQgaXNjX3BhcnNlX2R0KHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGlzY19kZXZpY2UgKmlzYykNCiAJCQkJCUlTQ19QRkVfQ0ZHMF9DQ0lSNjU2Ow0KIA0K
IAkJc3ViZGV2X2VudGl0eS0+YXNkLT5tYXRjaF90eXBlID0gVjRMMl9BU1lOQ19NQVRDSF9GV05P
REU7DQotCQlzdWJkZXZfZW50aXR5LT5hc2QtPm1hdGNoLmZ3bm9kZSA9DQotCQkJb2ZfZndub2Rl
X2hhbmRsZShyZW0pOw0KKwkJc3ViZGV2X2VudGl0eS0+YXNkLT5tYXRjaC5md25vZGUgPSBvZl9m
d25vZGVfaGFuZGxlKHJlbSk7DQogCQlsaXN0X2FkZF90YWlsKCZzdWJkZXZfZW50aXR5LT5saXN0
LCAmaXNjLT5zdWJkZXZfZW50aXRpZXMpOw0KIAl9DQogDQpAQCAtMjgyLDEzICsyODEsMTQgQEAg
c3RhdGljIGludCBhdG1lbF9pc2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQogCXN0cnVjdCBpc2NfZGV2aWNlICppc2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsN
CiANCiAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0KLQljbGtfZGlzYWJsZV91bnBy
ZXBhcmUoaXNjLT5pc3Bjayk7DQotCWNsa19kaXNhYmxlX3VucHJlcGFyZShpc2MtPmhjbG9jayk7
DQogDQogCWlzY19zdWJkZXZfY2xlYW51cChpc2MpOw0KIA0KIAl2NGwyX2RldmljZV91bnJlZ2lz
dGVyKCZpc2MtPnY0bDJfZGV2KTsNCiANCisJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGlzYy0+aXNw
Y2spOw0KKwljbGtfZGlzYWJsZV91bnByZXBhcmUoaXNjLT5oY2xvY2spOw0KKw0KIAlpc2NfY2xr
X2NsZWFudXAoaXNjKTsNCiANCiAJcmV0dXJuIDA7DQpAQCAtMzEzLDcgKzMxMywxMSBAQCBzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIGlzY19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQogCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KIA0KLQlyZXR1cm4gY2xrX3ByZXBhcmVf
ZW5hYmxlKGlzYy0+aXNwY2spOw0KKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaXNjLT5pc3Bj
ayk7DQorCWlmIChyZXQpDQorCQljbGtfZGlzYWJsZV91bnByZXBhcmUoaXNjLT5oY2xvY2spOw0K
Kw0KKwlyZXR1cm4gcmV0Ow0KIH0NCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMg
YXRtZWxfaXNjX2Rldl9wbV9vcHMgPSB7DQotLSANCjIuNy40DQoNCg==
