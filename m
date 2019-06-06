Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E68136D8F
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 09:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfFFHnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 03:43:51 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:23789 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFHnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 03:43:51 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,558,1557212400"; 
   d="scan'208";a="37787026"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2019 00:43:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Jun 2019 00:43:48 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 6 Jun 2019 00:43:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxUaxfUF16SrrG6LmI5Z40i9ZX7L0zOteUQtVFuPFeI=;
 b=02pCeqF2o2AX5+D7hb3JeXHuZ5szUDRkRc0PRH2LA6+sv1SvJJCzRfxnGNHxuPpc3TsCtBkHq3tiGIgGEmzjzfdRgMRHW18ZhGtNdlf1nKSxRjKB+tNSkXt9/wfqtJHl8mIrgWbp57OcaO7ktw31RTYsX2PnulD9VDyOirweyec=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1628.namprd11.prod.outlook.com (10.172.38.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 07:43:47 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::2807:f606:3b7c:cce9%9]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 07:43:47 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 2/2] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Topic: [PATCH v3 2/2] media: atmel: atmel-sama5d2-isc: fixed checkpatch
 warnings
Thread-Index: AQHVHDuT5UCMUNFMLE2y7UE951xenw==
Date:   Thu, 6 Jun 2019 07:43:47 +0000
Message-ID: <1559806756-16683-2-git-send-email-eugen.hristev@microchip.com>
References: <1559806756-16683-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1559806756-16683-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P193CA0001.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::11) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 737dfef9-47be-4e3b-73b5-08d6ea52b555
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1628;
x-ms-traffictypediagnostic: DM5PR11MB1628:
x-microsoft-antispam-prvs: <DM5PR11MB162869A437DD15C3E1A1B3C7E8170@DM5PR11MB1628.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(136003)(376002)(39860400002)(396003)(189003)(199004)(51234002)(26005)(186003)(2906002)(66066001)(316002)(8676002)(86362001)(5660300002)(8936002)(50226002)(81166006)(68736007)(81156014)(72206003)(6116002)(3846002)(446003)(305945005)(7736002)(36756003)(476003)(2616005)(66946007)(66476007)(73956011)(11346002)(66446008)(66556008)(486006)(64756008)(6512007)(107886003)(14444005)(102836004)(110136005)(256004)(99286004)(14454004)(6436002)(2501003)(6486002)(71200400001)(4326008)(71190400001)(25786009)(52116002)(53936002)(76176011)(386003)(2201001)(6506007)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1628;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fuIVOibtO+umRiPxIociwL/fROSV23VELqYabOofHw5FQGusK+3n9pEUDUpkZmnpurgnETqS4GkgeFsTNHOuq/hC7CcUoiE1bhTKvgrp0XCO3nWgGWPv8h8l4KK3H437Rut8vDfwBDLuH79fvUl+kV3mYliPE5qSPad9sgOiZAQ9hr2jcjqYHWu42WtUCQDEKf2VOS+dzKxXFKR9fzmijvYxz6ABlbwlXF2XX3yzFJeYBW3ZgvInXbU47ojmFKYH93IM0xHCIb1EZ86UsFN67zdw7IPWVwPVBaKMkXWYP1Btaw7sZKWEgE/F0J26YmHCkarx8RxkQRImrlze7dFz1HRcWRcUCesSaLZrLjjza1PWrTVOyeA5fjRDdYgtXGhEYlmTx4NzSO1L+MnANbN7lPPgyx2q1djtuZy9on86e5I=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 737dfef9-47be-4e3b-73b5-08d6ea52b555
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 07:43:47.4331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1628
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpDaGVj
a3BhdGNoIGNvbXBsYWluaW5nIHRoYXQgbG9ja3MgZG8gbm90IGhhdmUgY29tbWVudHMsDQp1bmFs
aWduZWQgY29kZSBhbmQgbWFjcm8gcmV1c2Ugb2Ygc2FtZSBhcmd1bWVudCBpbiB0b19pc2NfY2xr
Lg0KRml4ZWQgdGhlbSBieSByZW5hbWluZywgcmVhbGlnbmluZyBhbmQgYWRkaW5nIHN0cnVjdCBj
b21tZW50cw0KDQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1p
Y3JvY2hpcC5jb20+DQotLS0NCkNoYW5nZXMgaW4gdjM6DQotIG5ldyBwYXRjaCwgYWRkcmVzc2Vz
IHRoZSBjaGVja3BhdGNoIGlzc3VlcyB0aGF0IEhhbnMgYXNrZWQgdG8gZml4DQoNCiBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oICAgICAgICAgfCA1MSArKysrKysrKysr
KysrKysrKysrKystLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLXNhbWE1
ZDItaXNjLmMgfCAgNCArLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwv
YXRtZWwtaXNjLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy5oDQpp
bmRleCAwYmQ1ZGZmLi42ZmY5ZmE4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9hdG1lbC9hdG1lbC1pc2MuaA0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9h
dG1lbC1pc2MuaA0KQEAgLTI0LDE0ICsyNCwxNCBAQCBzdHJ1Y3QgaXNjX2NsayB7DQogCXN0cnVj
dCBjbGtfaHcgICBodzsNCiAJc3RydWN0IGNsayAgICAgICpjbGs7DQogCXN0cnVjdCByZWdtYXAg
ICAqcmVnbWFwOw0KLQlzcGlubG9ja190CWxvY2s7DQorCXNwaW5sb2NrX3QJbG9jazsJLyogc3lu
Y2hyb25pemUgYWNjZXNzIHRvIGNsb2NrIHJlZ2lzdGVycyAqLw0KIAl1OAkJaWQ7DQogCXU4CQlw
YXJlbnRfaWQ7DQogCXUzMgkJZGl2Ow0KIAlzdHJ1Y3QgZGV2aWNlCSpkZXY7DQogfTsNCiANCi0j
ZGVmaW5lIHRvX2lzY19jbGsoaHcpIGNvbnRhaW5lcl9vZihodywgc3RydWN0IGlzY19jbGssIGh3
KQ0KKyNkZWZpbmUgdG9faXNjX2Nsayh2KSBjb250YWluZXJfb2Yodiwgc3RydWN0IGlzY19jbGss
IGh3KQ0KIA0KIHN0cnVjdCBpc2NfYnVmZmVyIHsNCiAJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAg
dmI7DQpAQCAtMTQ2LDYgKzE0Niw0NyBAQCBzdHJ1Y3QgaXNjX2N0cmxzIHsNCiANCiAjZGVmaW5l
IElTQ19QSVBFX0xJTkVfTk9ERV9OVU0JMTENCiANCisvKg0KKyAqIHN0cnVjdCBpc2NfZGV2aWNl
IC0gSVNDIGRldmljZSBkcml2ZXIgZGF0YS9jb25maWcgc3RydWN0DQorICogQHJlZ21hcDoJCVJl
Z2lzdGVyIG1hcA0KKyAqIEBoY2xvY2s6CQlIY2xvY2sgY2xvY2sgaW5wdXQgKHJlZmVyIGRhdGFz
aGVldCkNCisgKiBAaXNwY2s6CQlpc2NwY2sgY2xvY2sgKHJlZmVyIGRhdGFzaGVldCkNCisgKiBA
aXNjX2Nsa3M6CQlJU0MgY2xvY2tzDQorICoNCisgKiBAZGV2OgkJUmVnaXN0ZXJlZCBkZXZpY2Ug
ZHJpdmVyDQorICogQHY0bDJfZGV2OgkJdjRsMiByZWdpc3RlcmVkIGRldmljZQ0KKyAqIEB2aWRl
b19kZXY6CQlyZWdpc3RlcmVkIHZpZGVvIGRldmljZQ0KKyAqDQorICogQHZiMl92aWRxOgkJdmlk
ZW8gYnVmZmVyIDIgdmlkZW8gcXVldWUNCisgKiBAZG1hX3F1ZXVlX2xvY2s6CWxvY2sgdG8gc3lu
Y2hyb25pemUgdGhlIGRtYSBidWZmZXIgcXVldWUNCisgKiBAZG1hX3F1ZXVlOgkJdGhlIHF1ZXVl
IGZvciBkbWEgYnVmZmVycw0KKyAqIEBjdXJfZnJtOgkJY3VycmVudCBpc2MgZnJhbWUvYnVmZmVy
DQorICogQHNlcXVlbmNlOgkJY3VycmVudCBmcmFtZSBudW1iZXINCisgKiBAc3RvcDoJCXRydWUg
aWYgaXNjIGlzIG5vdCBzdHJlYW1pbmcsIGZhbHNlIGlmIHN0cmVhbWluZw0KKyAqIEBjb21wOgkJ
Y29tcGxldGlvbiByZWZlcmVuY2UgdGhhdCBzaWduYWxzIGZyYW1lIGNvbXBsZXRpb24NCisgKg0K
KyAqIEBmbXQ6CQljdXJyZW50IHY0MmwgZm9ybWF0DQorICogQHVzZXJfZm9ybWF0czoJbGlzdCBv
ZiBmb3JtYXRzIHRoYXQgYXJlIHN1cHBvcnRlZCBhbmQgYWdyZWVkIHdpdGggc2QNCisgKiBAbnVt
X3VzZXJfZm9ybWF0czoJaG93IG1hbnkgZm9ybWF0cyBhcmUgaW4gdXNlcl9mb3JtYXRzDQorICoN
CisgKiBAY29uZmlnOgkJY3VycmVudCBJU0MgZm9ybWF0IGNvbmZpZ3VyYXRpb24NCisgKiBAdHJ5
X2NvbmZpZzoJCXRoZSBjdXJyZW50IElTQyB0cnkgZm9ybWF0ICwgbm90IHlldCBhY3RpdmF0ZWQN
CisgKg0KKyAqIEBjdHJsczoJCWhvbGRzIGluZm9ybWF0aW9uIGFib3V0IElTQyBjb250cm9scw0K
KyAqIEBkb193Yl9jdHJsOgkJY29udHJvbCByZWdhcmRpbmcgdGhlIERPX1dISVRFX0JBTEFOQ0Ug
YnV0dG9uDQorICogQGF3Yl93b3JrOgkJd29ya3F1ZXVlIHJlZmVyZW5jZSBmb3IgYXV0b3doaXRl
YmFsYW5jZSBoaXN0b2dyYW0NCisgKgkJCWFuYWx5c2lzDQorICoNCisgKiBAbG9jazoJCWxvY2sg
Zm9yIHN5bmNocm9uaXppbmcgdXNlcnNwYWNlIGZpbGUgb3BlcmF0aW9ucw0KKyAqCQkJd2l0aCBJ
U0Mgb3BlcmF0aW9ucw0KKyAqIEBhd2JfbG9jazoJCWxvY2sgZm9yIHN5bmNocm9uaXppbmcgYXdi
IHdvcmsgcXVldWUgb3BlcmF0aW9ucw0KKyAqCQkJd2l0aCBETUEvYnVmZmVyIG9wZXJhdGlvbnMN
CisgKg0KKyAqIEBwaXBlbGluZToJCWNvbmZpZ3VyYXRpb24gb2YgdGhlIElTQyBwaXBlbGluZQ0K
KyAqDQorICogQGN1cnJlbnRfc3ViZGV2OgljdXJyZW50IHN1YmRldmljZTogdGhlIHNlbnNvcg0K
KyAqIEBzdWJkZXZfZW50aXRpZXM6CWxpc3Qgb2Ygc3ViZGV2aWNlIGVudGl0aXRlcw0KKyAqLw0K
IHN0cnVjdCBpc2NfZGV2aWNlIHsNCiAJc3RydWN0IHJlZ21hcAkJKnJlZ21hcDsNCiAJc3RydWN0
IGNsawkJKmhjbG9jazsNCkBAIC0xNTcsNyArMTk4LDcgQEAgc3RydWN0IGlzY19kZXZpY2Ugew0K
IAlzdHJ1Y3QgdmlkZW9fZGV2aWNlCXZpZGVvX2RldjsNCiANCiAJc3RydWN0IHZiMl9xdWV1ZQl2
YjJfdmlkcTsNCi0Jc3BpbmxvY2tfdAkJZG1hX3F1ZXVlX2xvY2s7DQorCXNwaW5sb2NrX3QJCWRt
YV9xdWV1ZV9sb2NrOyAvKiBzeW5jIGFjY2VzcyB0byBkbWEgcXVldWUgKi8NCiAJc3RydWN0IGxp
c3RfaGVhZAlkbWFfcXVldWU7DQogCXN0cnVjdCBpc2NfYnVmZmVyCSpjdXJfZnJtOw0KIAl1bnNp
Z25lZCBpbnQJCXNlcXVlbmNlOw0KQEAgLTE3NSw4ICsyMTYsOCBAQCBzdHJ1Y3QgaXNjX2Rldmlj
ZSB7DQogCXN0cnVjdCB2NGwyX2N0cmwJKmRvX3diX2N0cmw7DQogCXN0cnVjdCB3b3JrX3N0cnVj
dAlhd2Jfd29yazsNCiANCi0Jc3RydWN0IG11dGV4CQlsb2NrOw0KLQlzcGlubG9ja190CQlhd2Jf
bG9jazsNCisJc3RydWN0IG11dGV4CQlsb2NrOyAvKiBzeW5jIGFjY2VzcyB0byBmaWxlIG9wZXJh
dGlvbnMgKi8NCisJc3BpbmxvY2tfdAkJYXdiX2xvY2s7IC8qIHN5bmMgYWNjZXNzIHRvIERNQSBi
dWZmZXJzIGZyb20gYXdiIHdvcmsgcXVldWUgKi8NCiANCiAJc3RydWN0IHJlZ21hcF9maWVsZAkq
cGlwZWxpbmVbSVNDX1BJUEVfTElORV9OT0RFX05VTV07DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1zYW1hNWQyLWlzYy5jIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1zYW1hNWQyLWlzYy5jDQppbmRleCA2OWZhYWFmLi4yOTky
NDNmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1zYW1h
NWQyLWlzYy5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLXNhbWE1
ZDItaXNjLmMNCkBAIC04Nyw4ICs4Nyw4IEBAIHN0YXRpYyBpbnQgaXNjX3BhcnNlX2R0KHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGlzY19kZXZpY2UgKmlzYykNCiAJCQlicmVhazsNCiAJCX0N
CiANCi0JCXN1YmRldl9lbnRpdHkgPSBkZXZtX2t6YWxsb2MoZGV2LA0KLQkJCQkJICBzaXplb2Yo
KnN1YmRldl9lbnRpdHkpLCBHRlBfS0VSTkVMKTsNCisJCXN1YmRldl9lbnRpdHkgPSBkZXZtX2t6
YWxsb2MoZGV2LCBzaXplb2YoKnN1YmRldl9lbnRpdHkpLA0KKwkJCQkJICAgICBHRlBfS0VSTkVM
KTsNCiAJCWlmICghc3ViZGV2X2VudGl0eSkgew0KIAkJCW9mX25vZGVfcHV0KHJlbSk7DQogCQkJ
cmV0ID0gLUVOT01FTTsNCi0tIA0KMi43LjQNCg0K
