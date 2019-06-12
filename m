Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF68424EB
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 14:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbfFLMAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 08:00:42 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:49899 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbfFLMAm (ORCPT
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
   d="scan'208";a="37199916"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2019 05:00:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Jun 2019 05:00:35 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 12 Jun 2019 05:00:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YuRnxTs0RDJUJXBj9wsuq+Sa1JvkAORhgjlpvlf3M8=;
 b=kE2abQcrQHD/FgxdrMx5md0ndL1r1e3/S8pHhHYfsR3PY8971Gw7zBrbOzkaKg1X9OYGSClg0r0wKHhEnOIFJczAs8L8EPC6VB3pzxvAbZ3Wo2LuRGFlIFfl+QcK9I+2+ubOs6fOWH/4AqrI+2Shd9L4JFZW/x0yaGZJbi77EQI=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1497.namprd11.prod.outlook.com (10.172.38.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 12:00:34 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9%9]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 12:00:34 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v6 2/3] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Topic: [PATCH v6 2/3] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Index: AQHVIRZwiWhlUaIZ7EGWGzm1FQXXQw==
Date:   Wed, 12 Jun 2019 12:00:34 +0000
Message-ID: <1560340575-21021-2-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 49fb159e-7033-428d-f551-08d6ef2d92eb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1497;
x-ms-traffictypediagnostic: DM5PR11MB1497:
x-microsoft-antispam-prvs: <DM5PR11MB1497F4772FA80BDB214546C3E8EC0@DM5PR11MB1497.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(39860400002)(396003)(136003)(366004)(51234002)(189003)(199004)(66476007)(26005)(73956011)(66946007)(66446008)(66556008)(53936002)(64756008)(107886003)(4326008)(5660300002)(110136005)(316002)(6486002)(14444005)(71200400001)(25786009)(99286004)(256004)(2501003)(66066001)(476003)(6512007)(6506007)(71190400001)(86362001)(6436002)(2906002)(52116002)(6116002)(446003)(386003)(11346002)(186003)(2616005)(3846002)(36756003)(2201001)(486006)(72206003)(102836004)(478600001)(68736007)(8676002)(14454004)(50226002)(81156014)(81166006)(8936002)(305945005)(7736002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1497;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fdR+WV8AEVP8oQX82nG9tJ06LlfFJ4y+5Py8TQTY9Hq43Z7PHAGH+eFos0dCAnfvNDJgu8Tja/2DloxiMCe2mdrtDdKRYtapJPEP+86moYofg/hRDdLeVplqFS2BxsoArq8rTUZRjEfSeC3ewlIWK/rcuDg/IsVjmw1FY8Mb6SEUb1UJYo+9VRv4gxJdaZisd6y3oqsiAoScKsQsutVWXRFCLtv/p0WObdEBdmgrDQL+zL/YaDCQTFm3aY8HZdwc2aBGv3uabrHH1e3zwN5a+RAM0w3vlXjZfK/8YtqkSspmhyhpxKnSIwEtydRt1H5hpxgVKDxb4q1+HKq3b7yDD2a09WaZnYUE7FRGD47900CH/mqI1Gwq6ET/s0+HXLRKM06/YosD4uE9AcpoQxLLwVnIG96bhJPIyzrQF2f1F8k=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fb159e-7033-428d-f551-08d6ef2d92eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 12:00:34.0370
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

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpDaGVj
a3BhdGNoIGNvbXBsYWluaW5nIHRoYXQgbG9ja3MgZG8gbm90IGhhdmUgY29tbWVudHMsDQp1bmFs
aWduZWQgY29kZSBhbmQgbWFjcm8gcmV1c2Ugb2Ygc2FtZSBhcmd1bWVudCBpbiB0b19pc2NfY2xr
Lg0KRml4ZWQgdGhlbSBieSByZW5hbWluZywgcmVhbGlnbmluZyBhbmQgYWRkaW5nIHN0cnVjdCBj
b21tZW50cw0KDQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1p
Y3JvY2hpcC5jb20+DQpBY2tlZC1ieTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXgu
aW50ZWwuY29tPg0KLS0tDQoNCkNoYW5nZXMgaW4gdjUsIHY2Og0KLSBub25lDQoNCkNoYW5nZXMg
aW4gdjQ6DQotIHMvc3luYy9zZXJpYWxpemUgYXMgcmVxdWVzdGVkIGJ5IFNha2FyaQ0KDQpDaGFu
Z2VzIGluIHYzOg0KLSBuZXcgcGF0Y2gsIGFkZHJlc3NlcyB0aGUgY2hlY2twYXRjaCBpc3N1ZXMg
dGhhdCBIYW5zIGFza2VkIHRvIGZpeA0KDQoNCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVs
L2F0bWVsLWlzYy5oICAgICAgICAgfCA1MSArKysrKysrKysrKysrKysrKysrKystLS0NCiBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLXNhbWE1ZDItaXNjLmMgfCAgNCArLQ0KIDIg
ZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLmggYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oDQppbmRleCBmNjMzZTEwLi41YmU1YjA5
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaA0K
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaA0KQEAgLTI0LDE0
ICsyNCwxNCBAQCBzdHJ1Y3QgaXNjX2NsayB7DQogCXN0cnVjdCBjbGtfaHcgICBodzsNCiAJc3Ry
dWN0IGNsayAgICAgICpjbGs7DQogCXN0cnVjdCByZWdtYXAgICAqcmVnbWFwOw0KLQlzcGlubG9j
a190CWxvY2s7DQorCXNwaW5sb2NrX3QJbG9jazsJLyogc2VyaWFsaXplIGFjY2VzcyB0byBjbG9j
ayByZWdpc3RlcnMgKi8NCiAJdTgJCWlkOw0KIAl1OAkJcGFyZW50X2lkOw0KIAl1MzIJCWRpdjsN
CiAJc3RydWN0IGRldmljZQkqZGV2Ow0KIH07DQogDQotI2RlZmluZSB0b19pc2NfY2xrKGh3KSBj
b250YWluZXJfb2YoaHcsIHN0cnVjdCBpc2NfY2xrLCBodykNCisjZGVmaW5lIHRvX2lzY19jbGso
dikgY29udGFpbmVyX29mKHYsIHN0cnVjdCBpc2NfY2xrLCBodykNCiANCiBzdHJ1Y3QgaXNjX2J1
ZmZlciB7DQogCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgIHZiOw0KQEAgLTE0Niw2ICsxNDYsNDcg
QEAgc3RydWN0IGlzY19jdHJscyB7DQogDQogI2RlZmluZSBJU0NfUElQRV9MSU5FX05PREVfTlVN
CTExDQogDQorLyoNCisgKiBzdHJ1Y3QgaXNjX2RldmljZSAtIElTQyBkZXZpY2UgZHJpdmVyIGRh
dGEvY29uZmlnIHN0cnVjdA0KKyAqIEByZWdtYXA6CQlSZWdpc3RlciBtYXANCisgKiBAaGNsb2Nr
OgkJSGNsb2NrIGNsb2NrIGlucHV0IChyZWZlciBkYXRhc2hlZXQpDQorICogQGlzcGNrOgkJaXNj
cGNrIGNsb2NrIChyZWZlciBkYXRhc2hlZXQpDQorICogQGlzY19jbGtzOgkJSVNDIGNsb2Nrcw0K
KyAqDQorICogQGRldjoJCVJlZ2lzdGVyZWQgZGV2aWNlIGRyaXZlcg0KKyAqIEB2NGwyX2RldjoJ
CXY0bDIgcmVnaXN0ZXJlZCBkZXZpY2UNCisgKiBAdmlkZW9fZGV2OgkJcmVnaXN0ZXJlZCB2aWRl
byBkZXZpY2UNCisgKg0KKyAqIEB2YjJfdmlkcToJCXZpZGVvIGJ1ZmZlciAyIHZpZGVvIHF1ZXVl
DQorICogQGRtYV9xdWV1ZV9sb2NrOglsb2NrIHRvIHNlcmlhbGl6ZSB0aGUgZG1hIGJ1ZmZlciBx
dWV1ZQ0KKyAqIEBkbWFfcXVldWU6CQl0aGUgcXVldWUgZm9yIGRtYSBidWZmZXJzDQorICogQGN1
cl9mcm06CQljdXJyZW50IGlzYyBmcmFtZS9idWZmZXINCisgKiBAc2VxdWVuY2U6CQljdXJyZW50
IGZyYW1lIG51bWJlcg0KKyAqIEBzdG9wOgkJdHJ1ZSBpZiBpc2MgaXMgbm90IHN0cmVhbWluZywg
ZmFsc2UgaWYgc3RyZWFtaW5nDQorICogQGNvbXA6CQljb21wbGV0aW9uIHJlZmVyZW5jZSB0aGF0
IHNpZ25hbHMgZnJhbWUgY29tcGxldGlvbg0KKyAqDQorICogQGZtdDoJCWN1cnJlbnQgdjQybCBm
b3JtYXQNCisgKiBAdXNlcl9mb3JtYXRzOglsaXN0IG9mIGZvcm1hdHMgdGhhdCBhcmUgc3VwcG9y
dGVkIGFuZCBhZ3JlZWQgd2l0aCBzZA0KKyAqIEBudW1fdXNlcl9mb3JtYXRzOglob3cgbWFueSBm
b3JtYXRzIGFyZSBpbiB1c2VyX2Zvcm1hdHMNCisgKg0KKyAqIEBjb25maWc6CQljdXJyZW50IElT
QyBmb3JtYXQgY29uZmlndXJhdGlvbg0KKyAqIEB0cnlfY29uZmlnOgkJdGhlIGN1cnJlbnQgSVND
IHRyeSBmb3JtYXQgLCBub3QgeWV0IGFjdGl2YXRlZA0KKyAqDQorICogQGN0cmxzOgkJaG9sZHMg
aW5mb3JtYXRpb24gYWJvdXQgSVNDIGNvbnRyb2xzDQorICogQGRvX3diX2N0cmw6CQljb250cm9s
IHJlZ2FyZGluZyB0aGUgRE9fV0hJVEVfQkFMQU5DRSBidXR0b24NCisgKiBAYXdiX3dvcms6CQl3
b3JrcXVldWUgcmVmZXJlbmNlIGZvciBhdXRvd2hpdGViYWxhbmNlIGhpc3RvZ3JhbQ0KKyAqCQkJ
YW5hbHlzaXMNCisgKg0KKyAqIEBsb2NrOgkJbG9jayBmb3Igc2VyaWFsaXppbmcgdXNlcnNwYWNl
IGZpbGUgb3BlcmF0aW9ucw0KKyAqCQkJd2l0aCBJU0Mgb3BlcmF0aW9ucw0KKyAqIEBhd2JfbG9j
azoJCWxvY2sgZm9yIHNlcmlhbGl6aW5nIGF3YiB3b3JrIHF1ZXVlIG9wZXJhdGlvbnMNCisgKgkJ
CXdpdGggRE1BL2J1ZmZlciBvcGVyYXRpb25zDQorICoNCisgKiBAcGlwZWxpbmU6CQljb25maWd1
cmF0aW9uIG9mIHRoZSBJU0MgcGlwZWxpbmUNCisgKg0KKyAqIEBjdXJyZW50X3N1YmRldjoJY3Vy
cmVudCBzdWJkZXZpY2U6IHRoZSBzZW5zb3INCisgKiBAc3ViZGV2X2VudGl0aWVzOglsaXN0IG9m
IHN1YmRldmljZSBlbnRpdGl0ZXMNCisgKi8NCiBzdHJ1Y3QgaXNjX2RldmljZSB7DQogCXN0cnVj
dCByZWdtYXAJCSpyZWdtYXA7DQogCXN0cnVjdCBjbGsJCSpoY2xvY2s7DQpAQCAtMTU3LDcgKzE5
OCw3IEBAIHN0cnVjdCBpc2NfZGV2aWNlIHsNCiAJc3RydWN0IHZpZGVvX2RldmljZQl2aWRlb19k
ZXY7DQogDQogCXN0cnVjdCB2YjJfcXVldWUJdmIyX3ZpZHE7DQotCXNwaW5sb2NrX3QJCWRtYV9x
dWV1ZV9sb2NrOw0KKwlzcGlubG9ja190CQlkbWFfcXVldWVfbG9jazsgLyogc2VyaWFsaXplIGFj
Y2VzcyB0byBkbWEgcXVldWUgKi8NCiAJc3RydWN0IGxpc3RfaGVhZAlkbWFfcXVldWU7DQogCXN0
cnVjdCBpc2NfYnVmZmVyCSpjdXJfZnJtOw0KIAl1bnNpZ25lZCBpbnQJCXNlcXVlbmNlOw0KQEAg
LTE3NSw4ICsyMTYsOCBAQCBzdHJ1Y3QgaXNjX2RldmljZSB7DQogCXN0cnVjdCB2NGwyX2N0cmwJ
KmRvX3diX2N0cmw7DQogCXN0cnVjdCB3b3JrX3N0cnVjdAlhd2Jfd29yazsNCiANCi0Jc3RydWN0
IG11dGV4CQlsb2NrOw0KLQlzcGlubG9ja190CQlhd2JfbG9jazsNCisJc3RydWN0IG11dGV4CQls
b2NrOyAvKiBzZXJpYWxpemUgYWNjZXNzIHRvIGZpbGUgb3BlcmF0aW9ucyAqLw0KKwlzcGlubG9j
a190CQlhd2JfbG9jazsgLyogc2VyaWFsaXplIGFjY2VzcyB0byBETUEgYnVmZmVycyBmcm9tIGF3
YiB3b3JrIHF1ZXVlICovDQogDQogCXN0cnVjdCByZWdtYXBfZmllbGQJKnBpcGVsaW5lW0lTQ19Q
SVBFX0xJTkVfTk9ERV9OVU1dOw0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRt
ZWwvYXRtZWwtc2FtYTVkMi1pc2MuYw0KaW5kZXggOTNmYjgzOS4uMTI3ZTc5YyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYw0KKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1zYW1hNWQyLWlzYy5jDQpAQCAt
ODcsOCArODcsOCBAQCBzdGF0aWMgaW50IGlzY19wYXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBpc2NfZGV2aWNlICppc2MpDQogCQkJYnJlYWs7DQogCQl9DQogDQotCQlzdWJkZXZf
ZW50aXR5ID0gZGV2bV9remFsbG9jKGRldiwNCi0JCQkJCSAgc2l6ZW9mKCpzdWJkZXZfZW50aXR5
KSwgR0ZQX0tFUk5FTCk7DQorCQlzdWJkZXZfZW50aXR5ID0gZGV2bV9remFsbG9jKGRldiwgc2l6
ZW9mKCpzdWJkZXZfZW50aXR5KSwNCisJCQkJCSAgICAgR0ZQX0tFUk5FTCk7DQogCQlpZiAoIXN1
YmRldl9lbnRpdHkpIHsNCiAJCQlvZl9ub2RlX3B1dChyZW0pOw0KIAkJCXJldCA9IC1FTk9NRU07
DQotLSANCjIuNy40DQoNCg==
