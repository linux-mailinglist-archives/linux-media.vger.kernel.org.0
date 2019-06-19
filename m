Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D4C4B300
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 09:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfFSHYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 03:24:45 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:17764 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfFSHYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 03:24:45 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="34995411"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2019 00:24:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Jun 2019 00:24:43 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 19 Jun 2019 00:24:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJej5PKt9TVAm8hYABNvHeoX3jQV+mw4zAYUK0+ogMo=;
 b=sLBvCVZue/MWe7S3tZdsGzJ9O7HXHZ8j9Q1XEEh3PMMygAt/aOs++pQY9YEygbJZclXXinrmDDr5/oYy6spYQu5xtxJHms6+v89qp/y86cN3pnMe1y67bIkRZCHwBOM6ng+1MuNdWbu+LZl1BmNUvvpUtt6L5Fn8WaeIAcD0eaY=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1500.namprd11.prod.outlook.com (10.172.37.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 07:24:41 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 07:24:41 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH] media: atmel: atmel-isc: fix i386 build error
Thread-Topic: [PATCH] media: atmel: atmel-isc: fix i386 build error
Thread-Index: AQHVJnAPpYn50G6JgEmaux5BLDnFhg==
Date:   Wed, 19 Jun 2019 07:24:41 +0000
Message-ID: <1560928828-31471-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0177.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::25) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 401107cc-9bfc-4ff9-0088-08d6f4873162
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DM5PR11MB1500;
x-ms-traffictypediagnostic: DM5PR11MB1500:
x-microsoft-antispam-prvs: <DM5PR11MB150027794B5B8C490BB80359E8E50@DM5PR11MB1500.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(376002)(136003)(396003)(366004)(189003)(199004)(3846002)(8936002)(386003)(64756008)(25786009)(8676002)(256004)(66556008)(66446008)(6506007)(36756003)(6116002)(14454004)(2201001)(99286004)(50226002)(52116002)(53936002)(86362001)(316002)(5660300002)(2501003)(68736007)(71190400001)(478600001)(26005)(71200400001)(73956011)(66946007)(66476007)(186003)(107886003)(102836004)(4326008)(72206003)(6486002)(486006)(305945005)(6512007)(110136005)(81156014)(2906002)(476003)(81166006)(66066001)(2616005)(7736002)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1500;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9l9N9Gbzf0gd3o4zdFBmPQni6YwBDhBuuePPFjsAp3oNDDL9aajm34rtJ3LkFoNr8q2dmgGZnABQBX4K0xfquHglexs0myt4vNQke2VDUMkRfiQYaCZAaYahlhmLPEZuqigrbzjx3jBavrbwxXwW3LHrsxMI1NnwfjKYrtEGzFuinhM9W1xZIlVBhphbCsmu60sDi1gTL1q6JbZ+EXKoorsFEjyeHKZD6Z3A7ul/MjqywEoPoLq3ZKsv2RgXSGjLimfPjuvkcTtH0cZ/Lf7qX1mg1oj0TDlyLqsWXhdl5HX5VV2k3JWOP/AqI3RdKLiiuP5SWFC1FbzakDChIXeAmWMUM2dURLU2FeFuTXkvCTZzG5/Da/xIvkELOLYMun7u0/WJNpggwkLZsFRWN+vO/uEfawvimeJtADE+EKqOtew=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 401107cc-9bfc-4ff9-0088-08d6f4873162
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 07:24:41.0496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1500
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpsZDog
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5vOiguYnNzKzB4MCk6
IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYGRlYnVnJzsgYXJjaC94ODYvZW50cnkvZW50cnlfMzIu
bzooLmVudHJ5LnRleHQrMHgyMWFjKTogZmlyc3QgZGVmaW5lZCBoZXJlDQoNCkNoYW5nZWQgbW9k
dWxlIHBhcmFtZXRlcnMgdG8gc3RhdGljLg0KDQpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5o
cmlzdGV2QG1pY3JvY2hpcC5jb20+DQotLS0NCg0KSGVsbG8gSGFucywNCg0KU29ycnkgZm9yIHRo
aXMsIGl0IGxvb2tzIGxpa2UgaTM4NiBoYXMgYSBzdHJheSB3ZWlyZCAnZGVidWcnIHN5bWJvbCB3
aGljaA0KY2F1c2VzIGFuIGVycm9yLg0KSSBjaGFuZ2VkIHRoZSBtb2R1bGUgcGFyYW1ldGVycyBv
ZiB0aGUgYXRtZWwtaXNjIHRvICdzdGF0aWMnIGJ1dCBub3cgdGhleQ0KY2Fubm90IGJlIGFjY2Vz
c2VkIGluIHRoZSBvdGhlciBtb2R1bGUgZmlsZXMuDQpXaWxsIGhhdmUgdG8gY3JlYXRlIGEgZ2V0
IGZ1bmN0aW9uIHRvIGJlIHVzZWQgaW4gdGhlIG90aGVyIGZpbGVzIGlmIG5lZWRlZA0KbGF0ZXIu
IEFueSBvdGhlciB3YXkgdG8gbWFrZSBhIHN5bWJvbCBzdGF0aWMgdG8gY3VycmVudCBtb2R1bGUg
YW5kIG5vdA0KY3VycmVudCBmaWxlID8gSXQgd291bGQgYmUgdXNlZnVsIGZvciBvdGhlciBjb25m
aWcgdmFyaWFibGVzIGFzIHdlbGwuDQpJIHdhcyBub3Qgc3VyZSBpZiB5b3Ugd2FudCB0byBzcXVh
c2ggdGhpcyBvdmVyIHRoZSBmYXVsdHkgcGF0Y2ggb3IgYWRkIGl0DQphcyBhIHNlcGFyYXRlIHBh
dGNoLg0KSWYgeW91IHdhbnQgbWUgdG8gc3F1YXNoIGl0IGxldCBtZSBrbm93IGFuZCBJIHdpbGwg
Y29tZSB1cCB3aXRoIGEgc3F1YXNoZWQNCm5ldyB2ZXJzaW9uLg0KDQpUaGFua3MsDQpFdWdlbg0K
DQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jIHwgNCArKy0t
DQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MuaCAgICAgIHwgNCAtLS0t
DQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMNCmluZGV4IGVi
MWY1ZDQuLmMxYzc3NmIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVs
L2F0bWVsLWlzYy1iYXNlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRt
ZWwtaXNjLWJhc2UuYw0KQEAgLTM1LDExICszNSwxMSBAQA0KICNpbmNsdWRlICJhdG1lbC1pc2Mt
cmVncy5oIg0KICNpbmNsdWRlICJhdG1lbC1pc2MuaCINCiANCi11bnNpZ25lZCBpbnQgZGVidWc7
DQorc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1ZzsNCiBtb2R1bGVfcGFyYW0oZGVidWcsIGludCwg
MDY0NCk7DQogTU9EVUxFX1BBUk1fREVTQyhkZWJ1ZywgImRlYnVnIGxldmVsICgwLTIpIik7DQog
DQotdW5zaWduZWQgaW50IHNlbnNvcl9wcmVmZXJyZWQgPSAxOw0KK3N0YXRpYyB1bnNpZ25lZCBp
bnQgc2Vuc29yX3ByZWZlcnJlZCA9IDE7DQogbW9kdWxlX3BhcmFtKHNlbnNvcl9wcmVmZXJyZWQs
IHVpbnQsIDA2NDQpOw0KIE1PRFVMRV9QQVJNX0RFU0Moc2Vuc29yX3ByZWZlcnJlZCwNCiAJCSAi
U2Vuc29yIGlzIHByZWZlcnJlZCB0byBvdXRwdXQgdGhlIHNwZWNpZmllZCBmb3JtYXQgKDEtb24g
MC1vZmYpLCBkZWZhdWx0IDEiKTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2F0bWVsL2F0bWVsLWlzYy5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1p
c2MuaA0KaW5kZXggZjVmNTkzMi4uYmZhZWQyZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLmgNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
YXRtZWwvYXRtZWwtaXNjLmgNCkBAIC0yMzAsMTAgKzIzMCw2IEBAIHN0cnVjdCBpc2NfZGV2aWNl
IHsNCiANCiAjZGVmaW5lIEFUTUVMX0lTQ19OQU1FICJhdG1lbC1pc2MiDQogDQotLyogbW9kdWxl
IHBhcmFtZXRlcnMgKi8NCi1leHRlcm4gdW5zaWduZWQgaW50IGRlYnVnOw0KLWV4dGVybiB1bnNp
Z25lZCBpbnQgc2Vuc29yX3ByZWZlcnJlZDsNCi0NCiBleHRlcm4gc3RydWN0IGlzY19mb3JtYXQg
Zm9ybWF0c19saXN0W107DQogZXh0ZXJuIGNvbnN0IHN0cnVjdCBpc2NfZm9ybWF0IGNvbnRyb2xs
ZXJfZm9ybWF0c1tdOw0KIGV4dGVybiBjb25zdCB1MzIgaXNjX2dhbW1hX3RhYmxlW0dBTU1BX01B
WCArIDFdW0dBTU1BX0VOVFJJRVNdOw0KLS0gDQoyLjcuNA0KDQo=
