Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E12C71345
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 09:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732758AbfGWHvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 03:51:43 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:23326 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfGWHvn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 03:51:43 -0400
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
IronPort-SDR: QHOTRyl9Z/muA+ib80Y2oO7dIzavl8zcq2/orlrKQlV7HynpWRV5v9ugkkL/aPLUl9w11npjwo
 6CPnN5CzBU1Zxp+3XN9vNG5IxwOVLwHMWMcw0MMd/m14fKPtVwa8l6oYjAFLWzu1REHr3PKeQc
 S9ThRBY3wCZxP9wnnE0vXHeClGIStc3JONTdvpvdps15tHfCGPXCwMosynG9no4/noM20a8CJb
 nDxq3bt3/8qpr5cvrQfbX+73xVdlnXlFArKoXHXjy0eMjIcqWU8XrwcrIkClJjdxsXO2dKo94p
 tVk=
X-IronPort-AV: E=Sophos;i="5.64,298,1559545200"; 
   d="scan'208";a="40716501"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jul 2019 00:51:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 23 Jul 2019 00:51:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 23 Jul 2019 00:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey56FQZgTq4UMkzYASnIvLjPwqnpWoFUd6BEjNvfqsuO5/jtV8g6m/9m3XcR/QVlN3zfYD5RdTaLtlnJQgfYDTFDl/wNWh/PjtN7mEN1PeFjOsrchwRbfHcltWAEK2NmOWkTpR54FJA4bsgwbqaNN/nWr0um6bp7+CpCU8M6LW3W8S9wqCCI73ZkVkd2OSJQsb/ulDZ+Rvz48pWjA3kiYEWXFfUBDHBBYccnqi3FrsEbsr7T6AYghn5QexX5OBsTj6aYSTmK8braYR+Z7KJuORPDwA0pLAaYfWFVkmr0TD3LQms/F0ZOJVMEW7Dzh2ITQA+GVH+BLh4RlrjmDGMUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ai/P55NjnGI90Pn2FWilyhbHet48L35Effl+w2SKeM=;
 b=nKpgr+p98WmAAmhnLQ1zho6arhQkgPBPiuWy9CXl81NH1lZJFhKL1eiFEmIddHMQJ86Th86YeLjN7KkoIvw2YtgJ3O+1KkjtEOpwMmwWRuUnGMoGFWe8yEG7Oc1YpIYNqoBHdim2aNwFeVn00lo+wOJR15Sy6qCK/Ys1dKKIFJk9gL0nqpVzTNOpKU1cmqw/Y6Ltc5SNfLOvjjeijt43UjIBADlG1kZ9NHdQS+YHDbRWAFYE/1jXBbUkGrXJ/XU+aW0FT+jqJKJ+AbdmOwRbp8u0HnyfV9rLnpIWoZW0eV7t/XzyyzigZDVk4tW/6udUyAiUcLljUZ4EryVKN/5COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ai/P55NjnGI90Pn2FWilyhbHet48L35Effl+w2SKeM=;
 b=OeEBAM/+GEr8mzvB5KBM1czhdW8dyz7IEZNUVp6EuEP2EQW1e6P3NirFDkFfLI7Obi/2FPGBttxsE4ZeAV6s8bwTzBXJUgbUHhr2QthdkSgpOo/D4b1Wflcjy/7WRQkk3Ll5BNH6pCA7KAGJWMf53B/dfIwSJcaehCEVP5kobnY=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0057.namprd11.prod.outlook.com (10.164.155.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 07:51:40 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6999:99b5:cb0c:e173]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6999:99b5:cb0c:e173%2]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 07:51:40 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <eric@nelint.com>, <laura.nao@kynetics.com>, <festevam@gmail.com>,
        <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>
CC:     <loic.poulain@linaro.org>, <linux-media@vger.kernel.org>
Subject: Re: Issues with ov5640 camera on i.MX6Q
Thread-Topic: Issues with ov5640 camera on i.MX6Q
Thread-Index: AQHVPWleEB7bAtF2Nke7Oi70Wrj1H6bWm8wAgAAzx4CAAAm/AIABAVMA
Date:   Tue, 23 Jul 2019 07:51:40 +0000
Message-ID: <c2ad1ba3-a93e-8fb0-8720-aacf3075c6d6@microchip.com>
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
 <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
 <913336b5-c2a1-5c2c-f893-6a28ccfedd63@nelint.com>
In-Reply-To: <913336b5-c2a1-5c2c-f893-6a28ccfedd63@nelint.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0051.eurprd04.prod.outlook.com
 (2603:10a6:802:2::22) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190723104628208
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98d34b12-33b2-4868-d190-08d70f429896
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0057;
x-ms-traffictypediagnostic: DM5PR11MB0057:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR11MB0057B55BFECBD8E5A37E85E9E8C70@DM5PR11MB0057.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(186003)(68736007)(76176011)(31686004)(64756008)(66446008)(66946007)(5660300002)(36756003)(6506007)(66556008)(31696002)(71190400001)(102836004)(71200400001)(26005)(54906003)(53546011)(386003)(4326008)(6246003)(229853002)(2906002)(81166006)(81156014)(2616005)(6306002)(316002)(478600001)(3846002)(53936002)(110136005)(25786009)(6116002)(8676002)(446003)(14444005)(305945005)(486006)(6436002)(14454004)(99286004)(6486002)(256004)(11346002)(8936002)(66066001)(86362001)(66476007)(476003)(52116002)(7736002)(966005)(6512007)(15519875007);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0057;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Li31PZqoJkAe05QQvG2v77V3VE2SP7s/RgQQuHmgBnQCRr05V2nDs+lR/G0qOfBJHh5GGjFb3X98LRiyv4Kk+MN7yjshuo1nxFlpRudiylyCa6qLqg+HXwkyLa1z1CrciQ2X7YTKe3pU8kXd1tJuv6qkG+XAxFWX57W/CSkEq4q8spJgNPAHNDCh2nlSIrvezLP7NGDGWg3sIx+EyqxMlxatxZx9JDIrp++8d1T5UZ0UV0KaAM7g/1/VZGimvXigvig2mDw8F/w/xXvyPZfHzN69FUzVbzzWYSCC5jMpUwFhwvH5QSjawpMmTgK0J0zDW+XfBXQFUtpQU1oVc3hTUtv6ls6QRRDCZcGIBSeGrmePQHV/7Yod/nVW29LXvcxr2jR0gLC0oVQs5BFHhzbBh0u0Zd8MmJvY0nykBuhXUlY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30A784D1EEFD054F8E32F1E3D08C398D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d34b12-33b2-4868-d190-08d70f429896
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 07:51:40.3007
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

DQoNCk9uIDIyLjA3LjIwMTkgMTk6MjUsIEVyaWMgTmVsc29uIHdyb3RlOg0KPiBIaSBMYXVyYSwN
Cj4gDQo+IE9uIDcvMjIvMTkgODo1MCBBTSwgTGF1cmEgTmFvIHdyb3RlOg0KPj4gVGhhbmtzIEZh
YmlvIQ0KPj4NCj4+IEkgdHJpZWQgdHdlYWtpbmcgdGhlIFBMTCBjb25maWd1cmF0aW9uIGluIHRo
ZSBkcml2ZXIgYW5kIGRpZCBzb21lIA0KPj4gZnVydGhlciB0ZXN0cyBvbiA1LjIga2VybmVsLg0K
Pj4NCj4+IEkgd2FzIGZpbmFsbHkgYWJsZSB0byBjYXB0dXJlIFJBVyBmcmFtZXMgdGhhdCBtYXRj
aCB0aGUgdGVzdCBwYXR0ZXJuIA0KPj4gZm9yIDEyODB4NzIwIGFuZCAxOTIweDEwODAgcmVzb2x1
dGlvbnMuIFRoZSAyNTkyeDE5NDQgZnJhbWUgaXMgc3RpbGwgDQo+PiBub3QgcGVyZmVjdGx5IGFs
aWduZWQsIGJ1dCBpdCBsb29rcyBtdWNoIGNsb3NlciB0byB0aGUgdGVzdCBwYXR0ZXJuLg0KPj4N
Cj4+IEkgdXBsb2FkZWQgdGhlIGltYWdlcyBoZXJlOg0KPj4NCj4+IGh0dHBzOi8vaW1ndXIuY29t
L2EveXdIb2tNZg0KPj4NCj4+IFRoZSBjaGFuZ2VzIEkgbWFkZSBpbiB0aGUgZHJpdmVyIGFyZSBi
ZWxvdy4gTm90IHN1cmUgdGhlc2UgY2hhbmdlcyANCj4+IG1ha2UgbXVjaCBzZW5zZSwgYnV0IHRo
ZXkgc2VlbSB0byBmaXggMTI4MHg3MjAgYW5kIDE5MjB4MTA4MCBmcmFtZXMuDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMv
b3Y1NjQwLmMNCj4+IGluZGV4IDc1OWQ2MGM2Li5jZmE2NzhlIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0
MC5jDQo+PiBAQCAtNzk1LDEzICs3OTUsMTMgQEAgc3RhdGljIGludCBvdjU2NDBfbW9kX3JlZyhz
dHJ1Y3Qgb3Y1NjQwX2RldiANCj4+ICpzZW5zb3IsIHUxNiByZWcsDQo+PiDCoMKgICogRklYTUU6
IHRvIGJlIHJlLWNhbGN1YWx0ZWQgZm9yIDEgZGF0YSBsYW5lcyBzZXR1cHMNCj4+IMKgwqAgKi8N
Cj4+IMKgwqAjZGVmaW5lIE9WNTY0MF9NSVBJX0RJVl9QQ0xLwqDCoMKgIDINCj4+IC0jZGVmaW5l
IE9WNTY0MF9NSVBJX0RJVl9TQ0xLwqDCoMKgIDENCj4+ICsjZGVmaW5lIE9WNTY0MF9NSVBJX0RJ
Vl9TQ0xLwqDCoMKgIDINCj4+DQo+PiDCoMKgLyoNCj4+IMKgwqAgKiBUaGlzIGlzIHN1cHBvc2Vk
IHRvIGJlIHJhbmdpbmcgZnJvbSAxIHRvIDIsIGJ1dCB0aGUgdmFsdWUgaXMgYWx3YXlzDQo+PiDC
oMKgICogc2V0IHRvIDIgaW4gdGhlIHZlbmRvciBrZXJuZWxzLg0KPj4gwqDCoCAqLw0KPj4gLSNk
ZWZpbmUgT1Y1NjQwX1BMTF9ST09UX0RJVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMg0KPj4gKyNk
ZWZpbmUgT1Y1NjQwX1BMTF9ST09UX0RJVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMQ0KPj4gwqDC
oCNkZWZpbmUgT1Y1NjQwX1BMTF9DVFJMM19QTExfUk9PVF9ESVZfMsKgwqDCoMKgwqDCoMKgIEJJ
VCg0KQ0KPj4NCj4+IMKgwqAvKg0KPj4gQEAgLTgzNiw4ICs4MzYsOCBAQCBzdGF0aWMgdW5zaWdu
ZWQgbG9uZyBvdjU2NDBfY29tcHV0ZV9zeXNfY2xrKHN0cnVjdCANCj4+IG92NTY0MF9kZXYgKnNl
bnNvciwNCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBzeXNjbGsgPSBzZW5zb3ItPnhjbGtf
ZnJlcSAvIHBsbF9wcmVkaXYgKiBwbGxfbXVsdDsNCj4+DQo+PiDCoMKgwqDCoMKgIC8qIFBMTDEg
b3V0cHV0IGNhbm5vdCBleGNlZWQgMUdIei4gKi8NCj4+IC3CoMKgwqAgaWYgKHN5c2NsayAvIDEw
MDAwMDAgPiAxMDAwKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gK8KgwqDCoCAv
LyBpZiAoc3lzY2xrIC8gMTAwMDAwMCA+IDEwMDApDQo+PiArwqDCoMKgIC8vwqDCoMKgwqAgcmV0
dXJuIDA7DQo+Pg0KPj4gwqDCoMKgwqDCoCByZXR1cm4gc3lzY2xrIC8gc3lzZGl2Ow0KPj4gwqDC
oH0NCj4+IEBAIC0xODE4LDcgKzE4MjQsNyBAQCBzdGF0aWMgaW50IG92NTY0MF9zZXRfbW9kZShz
dHJ1Y3Qgb3Y1NjQwX2RldiANCj4+ICpzZW5zb3IpDQo+PiDCoMKgwqDCoMKgwqAgKiBBbGwgdGhl
IGZvcm1hdHMgd2Ugc3VwcG9ydCBoYXZlIDE2IGJpdHMgcGVyIHBpeGVsLCBzZWVtcyB0byANCj4+
IHJlcXVpcmUNCj4+IMKgwqDCoMKgwqDCoCAqIHRoZSBzYW1lIHJhdGUgdGhhbiBZVVYsIHNvIHdl
IGNhbiBqdXN0IHVzZSAxNiBicHAgYWxsIHRoZSB0aW1lLg0KPj4gwqDCoMKgwqDCoMKgICovDQo+
PiAtwqDCoMKgIHJhdGUgPSBtb2RlLT52dG90ICogbW9kZS0+aHRvdCAqIDE2Ow0KPj4gK8KgwqDC
oCByYXRlID0gbW9kZS0+dnRvdCAqIG1vZGUtPmh0b3QgKiA4Ow0KPj4gwqDCoMKgwqDCoCByYXRl
ICo9IG92NTY0MF9mcmFtZXJhdGVzW3NlbnNvci0+Y3VycmVudF9mcl07DQo+PiDCoMKgwqDCoMKg
IGlmIChzZW5zb3ItPmVwLmJ1c190eXBlID09IFY0TDJfTUJVU19DU0kyX0RQSFkpIHsNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCByYXRlID0gcmF0ZSAvIHNlbnNvci0+ZXAuYnVzLm1pcGlfY3NpMi5u
dW1fZGF0YV9sYW5lczsNCj4+DQo+IA0KPiBIb3cgbWFueSBmcmFtZXMgcGVyIHNlY29uZCBhcmUg
eW91IGdldHRpbmcgb3V0IG9mIHRoaXM/DQo+IA0KPiBJZiBJJ20gcmVhZGluZyB0aGlzIHJpZ2h0
LCB0aGUgY2hhbmdlIHRvIG92NTY0MF9zZXRfbW9kZSBpcyByZWR1Y2luZw0KPiB0aGUgZnJhbWUg
cmF0ZSAodG8gNy41IGZwcz8pLCBidXQgSSBkb24ndCBmb2xsb3cgaG93IHRoZSBjaGFuZ2VzDQo+
IHRvIE9WNTY0MF9NSVBJX0RJVl9TQ0xLIGFuZCBPVjU2NDBfUExMX1JPT1RfRElWIGFyZSBhZmZl
Y3RpbmcgdGhpbmdzDQo+IGFuZCB0aGUgZGF0YSBzaGVldCBpc24ndCB2ZXJ5IGNsZWFyLg0KPiAN
Cg0KSGVsbG8gLA0KDQpBcmUgeW91IHVzaW5nIHBhcmFsbGVsIG9yIGNzaTIgaW50ZXJmYWNlIGZv
ciB0aGlzIHNlbnNvciA/DQoNCkR1cmluZyBteSB0ZXN0cyB3aXRoIGF0bWVsIGltYWdlIHNlbnNv
ciBjb250cm9sbGVyIChwYXJhbGxlbCksICBJIGNvdWxkIA0Kbm90IGdldCBSQVcgZnJhbWVzIGF0
IGFsbC4gdGhleSB3ZXJlIGFsbCBnYXJibGVkLCBhcyB5b3UgZGVzY3JpYmVkLg0KDQpJIHdvdWxk
IGJlIGhhcHB5IHRvIHRlc3QgcGF0Y2hlcyBpZiB5b3UgZml4ZWQgdGhlIFJBVyBmb3JtYXRzIGZv
ciB0aGlzIA0Kc2Vuc29yLg0KKGN1cnJlbnRseSwgaXQgd29ya3MgaW4gWVVWNDIyIGFuZCBSR0I1
NjUgZGlyZWN0bHkgZnJvbSB0aGUgc2Vuc29yIGZvciBtZSkNCg0KVGhhbmtzLA0KDQpFdWdlbg0K
