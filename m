Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 011DD42D6A
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 19:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407805AbfFLR0U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 13:26:20 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:43189 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407713AbfFLR0U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 13:26:20 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,366,1557212400"; 
   d="scan'208";a="38684018"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2019 10:24:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with ShadowRedundancy id
 15.1.1713.5; Wed, 12 Jun 2019 17:23:35 +0000
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 10 Jun 2019 00:33:22 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 10 Jun 2019 00:33:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT/RvVOS7HfJX2mL2DWOBOc9Y3YwqCH10I3oKmMPLFg=;
 b=iWjKQPuzh+1OnHuzGq4a+p03oE4pJV32+/M3K0SI82oB621G55DpS7h7ENQDxbvrrSSbWre0i0IArAbV1Q5MQakzVtLdCJwkkcKT6GIiSpksNu2ue2r4vqEqxLbGeMmFYRHD9hWMRZR07eYBfosDNwx/6K3IgMr8teDIZHDFyRk=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0057.namprd11.prod.outlook.com (10.164.155.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 07:33:19 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9%9]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 07:33:19 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v4 2/2] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Topic: [PATCH v4 2/2] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Index: AQHVH17GIKx4fa+Jn0q5K1bk3HE+OQ==
Date:   Mon, 10 Jun 2019 07:33:19 +0000
Message-ID: <1560151741-2574-2-git-send-email-eugen.hristev@microchip.com>
References: <1560151741-2574-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1560151741-2574-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0901CA0102.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::28) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f878d904-1722-4c5c-47b8-08d6ed75e8d8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0057;
x-ms-traffictypediagnostic: DM5PR11MB0057:
x-microsoft-antispam-prvs: <DM5PR11MB005799BE2C50005B25D9091DE8130@DM5PR11MB0057.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(366004)(136003)(396003)(376002)(51234002)(199004)(189003)(86362001)(3846002)(486006)(107886003)(2201001)(6436002)(14444005)(25786009)(6512007)(102836004)(6116002)(6506007)(386003)(256004)(66066001)(8676002)(110136005)(81166006)(476003)(6486002)(81156014)(76176011)(53936002)(316002)(64756008)(66446008)(72206003)(478600001)(11346002)(8936002)(99286004)(26005)(66556008)(446003)(66476007)(66946007)(2616005)(73956011)(4326008)(71190400001)(52116002)(2906002)(36756003)(71200400001)(50226002)(305945005)(2501003)(68736007)(186003)(7736002)(5660300002)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0057;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 30LeaC8cXljPF6E2dyac45o9pStcdWc/zcbZU7aQKM21hGnfWyRwpx7bOhfTGgwWuQOEl6VWIY/sVVpJ5VY6cu95wDwcbEvNoB7t21pQ+6ZbBHdXNx8D1+ORrYoGKARKgaucZ8/tNWYi2/lwbM6vg2igHkudsnhlcV5CIPTqlxBi7ISx6aARjCKKGlG8kgdlbRVrHjkTZmrggXv2B2Yud95/AxGMpdv6VKZXAKvemFKTgr9k3T+UiD4DAFEXGbEwWnq3d4yZnjHtHSzb8h4eYOhTBXjZwWizsFL7MtQWyclS/gkUMue4RKIMXiQaVDoTi9G9zSFrYBOtL2ltbx47AMr0QyjHSLsAwCrFeGxUXBrSBD515oQL0E3LwLK1c14/89cR9ff5ig2Cbl6z5g+sshWvDgmH5iiAAohQLJT30Yc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f878d904-1722-4c5c-47b8-08d6ed75e8d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 07:33:19.6261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0057
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpDaGVj
a3BhdGNoIGNvbXBsYWluaW5nIHRoYXQgbG9ja3MgZG8gbm90IGhhdmUgY29tbWVudHMsDQp1bmFs
aWduZWQgY29kZSBhbmQgbWFjcm8gcmV1c2Ugb2Ygc2FtZSBhcmd1bWVudCBpbiB0b19pc2NfY2xr
Lg0KRml4ZWQgdGhlbSBieSByZW5hbWluZywgcmVhbGlnbmluZyBhbmQgYWRkaW5nIHN0cnVjdCBj
b21tZW50cw0KDQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1p
Y3JvY2hpcC5jb20+DQotLS0NCkNoYW5nZXMgaW4gdjQ6DQotIHMvc3luYy9zZXJpYWxpemUgYXMg
cmVxdWVzdGVkIGJ5IFNha2FyaQ0KDQpDaGFuZ2VzIGluIHYzOg0KLSBuZXcgcGF0Y2gsIGFkZHJl
c3NlcyB0aGUgY2hlY2twYXRjaCBpc3N1ZXMgdGhhdCBIYW5zIGFza2VkIHRvIGZpeA0KDQoNCiBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oICAgICAgICAgfCA1MSArKysr
KysrKysrKysrKysrKysrKystLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVs
LXNhbWE1ZDItaXNjLmMgfCAgNCArLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
YXRtZWwvYXRtZWwtaXNjLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlz
Yy5oDQppbmRleCBmNjMzZTEwLi41YmU1YjA5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaA0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9h
dG1lbC9hdG1lbC1pc2MuaA0KQEAgLTI0LDE0ICsyNCwxNCBAQCBzdHJ1Y3QgaXNjX2NsayB7DQog
CXN0cnVjdCBjbGtfaHcgICBodzsNCiAJc3RydWN0IGNsayAgICAgICpjbGs7DQogCXN0cnVjdCBy
ZWdtYXAgICAqcmVnbWFwOw0KLQlzcGlubG9ja190CWxvY2s7DQorCXNwaW5sb2NrX3QJbG9jazsJ
Lyogc2VyaWFsaXplIGFjY2VzcyB0byBjbG9jayByZWdpc3RlcnMgKi8NCiAJdTgJCWlkOw0KIAl1
OAkJcGFyZW50X2lkOw0KIAl1MzIJCWRpdjsNCiAJc3RydWN0IGRldmljZQkqZGV2Ow0KIH07DQog
DQotI2RlZmluZSB0b19pc2NfY2xrKGh3KSBjb250YWluZXJfb2YoaHcsIHN0cnVjdCBpc2NfY2xr
LCBodykNCisjZGVmaW5lIHRvX2lzY19jbGsodikgY29udGFpbmVyX29mKHYsIHN0cnVjdCBpc2Nf
Y2xrLCBodykNCiANCiBzdHJ1Y3QgaXNjX2J1ZmZlciB7DQogCXN0cnVjdCB2YjJfdjRsMl9idWZm
ZXIgIHZiOw0KQEAgLTE0Niw2ICsxNDYsNDcgQEAgc3RydWN0IGlzY19jdHJscyB7DQogDQogI2Rl
ZmluZSBJU0NfUElQRV9MSU5FX05PREVfTlVNCTExDQogDQorLyoNCisgKiBzdHJ1Y3QgaXNjX2Rl
dmljZSAtIElTQyBkZXZpY2UgZHJpdmVyIGRhdGEvY29uZmlnIHN0cnVjdA0KKyAqIEByZWdtYXA6
CQlSZWdpc3RlciBtYXANCisgKiBAaGNsb2NrOgkJSGNsb2NrIGNsb2NrIGlucHV0IChyZWZlciBk
YXRhc2hlZXQpDQorICogQGlzcGNrOgkJaXNjcGNrIGNsb2NrIChyZWZlciBkYXRhc2hlZXQpDQor
ICogQGlzY19jbGtzOgkJSVNDIGNsb2Nrcw0KKyAqDQorICogQGRldjoJCVJlZ2lzdGVyZWQgZGV2
aWNlIGRyaXZlcg0KKyAqIEB2NGwyX2RldjoJCXY0bDIgcmVnaXN0ZXJlZCBkZXZpY2UNCisgKiBA
dmlkZW9fZGV2OgkJcmVnaXN0ZXJlZCB2aWRlbyBkZXZpY2UNCisgKg0KKyAqIEB2YjJfdmlkcToJ
CXZpZGVvIGJ1ZmZlciAyIHZpZGVvIHF1ZXVlDQorICogQGRtYV9xdWV1ZV9sb2NrOglsb2NrIHRv
IHNlcmlhbGl6ZSB0aGUgZG1hIGJ1ZmZlciBxdWV1ZQ0KKyAqIEBkbWFfcXVldWU6CQl0aGUgcXVl
dWUgZm9yIGRtYSBidWZmZXJzDQorICogQGN1cl9mcm06CQljdXJyZW50IGlzYyBmcmFtZS9idWZm
ZXINCisgKiBAc2VxdWVuY2U6CQljdXJyZW50IGZyYW1lIG51bWJlcg0KKyAqIEBzdG9wOgkJdHJ1
ZSBpZiBpc2MgaXMgbm90IHN0cmVhbWluZywgZmFsc2UgaWYgc3RyZWFtaW5nDQorICogQGNvbXA6
CQljb21wbGV0aW9uIHJlZmVyZW5jZSB0aGF0IHNpZ25hbHMgZnJhbWUgY29tcGxldGlvbg0KKyAq
DQorICogQGZtdDoJCWN1cnJlbnQgdjQybCBmb3JtYXQNCisgKiBAdXNlcl9mb3JtYXRzOglsaXN0
IG9mIGZvcm1hdHMgdGhhdCBhcmUgc3VwcG9ydGVkIGFuZCBhZ3JlZWQgd2l0aCBzZA0KKyAqIEBu
dW1fdXNlcl9mb3JtYXRzOglob3cgbWFueSBmb3JtYXRzIGFyZSBpbiB1c2VyX2Zvcm1hdHMNCisg
Kg0KKyAqIEBjb25maWc6CQljdXJyZW50IElTQyBmb3JtYXQgY29uZmlndXJhdGlvbg0KKyAqIEB0
cnlfY29uZmlnOgkJdGhlIGN1cnJlbnQgSVNDIHRyeSBmb3JtYXQgLCBub3QgeWV0IGFjdGl2YXRl
ZA0KKyAqDQorICogQGN0cmxzOgkJaG9sZHMgaW5mb3JtYXRpb24gYWJvdXQgSVNDIGNvbnRyb2xz
DQorICogQGRvX3diX2N0cmw6CQljb250cm9sIHJlZ2FyZGluZyB0aGUgRE9fV0hJVEVfQkFMQU5D
RSBidXR0b24NCisgKiBAYXdiX3dvcms6CQl3b3JrcXVldWUgcmVmZXJlbmNlIGZvciBhdXRvd2hp
dGViYWxhbmNlIGhpc3RvZ3JhbQ0KKyAqCQkJYW5hbHlzaXMNCisgKg0KKyAqIEBsb2NrOgkJbG9j
ayBmb3Igc2VyaWFsaXppbmcgdXNlcnNwYWNlIGZpbGUgb3BlcmF0aW9ucw0KKyAqCQkJd2l0aCBJ
U0Mgb3BlcmF0aW9ucw0KKyAqIEBhd2JfbG9jazoJCWxvY2sgZm9yIHNlcmlhbGl6aW5nIGF3YiB3
b3JrIHF1ZXVlIG9wZXJhdGlvbnMNCisgKgkJCXdpdGggRE1BL2J1ZmZlciBvcGVyYXRpb25zDQor
ICoNCisgKiBAcGlwZWxpbmU6CQljb25maWd1cmF0aW9uIG9mIHRoZSBJU0MgcGlwZWxpbmUNCisg
Kg0KKyAqIEBjdXJyZW50X3N1YmRldjoJY3VycmVudCBzdWJkZXZpY2U6IHRoZSBzZW5zb3INCisg
KiBAc3ViZGV2X2VudGl0aWVzOglsaXN0IG9mIHN1YmRldmljZSBlbnRpdGl0ZXMNCisgKi8NCiBz
dHJ1Y3QgaXNjX2RldmljZSB7DQogCXN0cnVjdCByZWdtYXAJCSpyZWdtYXA7DQogCXN0cnVjdCBj
bGsJCSpoY2xvY2s7DQpAQCAtMTU3LDcgKzE5OCw3IEBAIHN0cnVjdCBpc2NfZGV2aWNlIHsNCiAJ
c3RydWN0IHZpZGVvX2RldmljZQl2aWRlb19kZXY7DQogDQogCXN0cnVjdCB2YjJfcXVldWUJdmIy
X3ZpZHE7DQotCXNwaW5sb2NrX3QJCWRtYV9xdWV1ZV9sb2NrOw0KKwlzcGlubG9ja190CQlkbWFf
cXVldWVfbG9jazsgLyogc2VyaWFsaXplIGFjY2VzcyB0byBkbWEgcXVldWUgKi8NCiAJc3RydWN0
IGxpc3RfaGVhZAlkbWFfcXVldWU7DQogCXN0cnVjdCBpc2NfYnVmZmVyCSpjdXJfZnJtOw0KIAl1
bnNpZ25lZCBpbnQJCXNlcXVlbmNlOw0KQEAgLTE3NSw4ICsyMTYsOCBAQCBzdHJ1Y3QgaXNjX2Rl
dmljZSB7DQogCXN0cnVjdCB2NGwyX2N0cmwJKmRvX3diX2N0cmw7DQogCXN0cnVjdCB3b3JrX3N0
cnVjdAlhd2Jfd29yazsNCiANCi0Jc3RydWN0IG11dGV4CQlsb2NrOw0KLQlzcGlubG9ja190CQlh
d2JfbG9jazsNCisJc3RydWN0IG11dGV4CQlsb2NrOyAvKiBzZXJpYWxpemUgYWNjZXNzIHRvIGZp
bGUgb3BlcmF0aW9ucyAqLw0KKwlzcGlubG9ja190CQlhd2JfbG9jazsgLyogc2VyaWFsaXplIGFj
Y2VzcyB0byBETUEgYnVmZmVycyBmcm9tIGF3YiB3b3JrIHF1ZXVlICovDQogDQogCXN0cnVjdCBy
ZWdtYXBfZmllbGQJKnBpcGVsaW5lW0lTQ19QSVBFX0xJTkVfTk9ERV9OVU1dOw0KIA0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtc2FtYTVkMi1pc2MuYw0KaW5kZXgg
OTNmYjgzOS4uMTI3ZTc5YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRt
ZWwvYXRtZWwtc2FtYTVkMi1pc2MuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1l
bC9hdG1lbC1zYW1hNWQyLWlzYy5jDQpAQCAtODcsOCArODcsOCBAQCBzdGF0aWMgaW50IGlzY19w
YXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBpc2NfZGV2aWNlICppc2MpDQogCQkJ
YnJlYWs7DQogCQl9DQogDQotCQlzdWJkZXZfZW50aXR5ID0gZGV2bV9remFsbG9jKGRldiwNCi0J
CQkJCSAgc2l6ZW9mKCpzdWJkZXZfZW50aXR5KSwgR0ZQX0tFUk5FTCk7DQorCQlzdWJkZXZfZW50
aXR5ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpzdWJkZXZfZW50aXR5KSwNCisJCQkJCSAg
ICAgR0ZQX0tFUk5FTCk7DQogCQlpZiAoIXN1YmRldl9lbnRpdHkpIHsNCiAJCQlvZl9ub2RlX3B1
dChyZW0pOw0KIAkJCXJldCA9IC1FTk9NRU07DQotLSANCjIuNy40DQoNCg==
