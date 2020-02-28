Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4579317396C
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 15:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgB1OFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 09:05:48 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:50382 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgB1OFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 09:05:48 -0500
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: WZUNXil6wvgMJoc44Po4P7/FVtpdT5u9Hxebp3D+oNvs66phMQrttje9wmXzHKoVNcMvIQzWW8
 dPiCle7Tg+D248UPtgi/RAuBMz6Ws1BzKx6UnC2qhHt3EiPxMcRksI1mdvlsyZjnxNRQxTUQ3X
 eMwU5Vxhhv5h/6TiX1gMJUPMbOUhUAdYjRvaWzOBmE9F2QwhkJUXtrRj617SN79c9tZp3YvIG3
 R5c9SIfrOwuav815E08WaHEC6mFQPOTTIHM7YrmHEHHPRJeYY45KdFVzsTAAWA5gcSjVvkO7mU
 On8=
X-IronPort-AV: E=Sophos;i="5.70,496,1574146800"; 
   d="scan'208";a="67077920"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Feb 2020 07:05:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Feb 2020 07:05:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Feb 2020 07:05:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRVORDbQknYZ1dZXvprCQfFRT4AiB5Gz/5dMR3LHTj/JyBiZAonUK7EMkHWLkxFhZ8ddK5mcgabgoY0yx/tMHU9WbndDgmuWrCzg9dCLiEdOm8ugP/wW3wnDf4XQA13S2JmjrrMoBPsiVoLAc/UfL+40hTbd5X1sx539v5JO3DzZNHGbKVyfn6i+HhgbAG6t3y23IDRQ37gs/K9yti8Jv5YAJGoVzT4p0qYFpN/fsyOgdRMO/K9b/uXXpr6CrSJHn1CxwrNe0ONiILHm6Fx55Ai7vPdmhAtZIrZmQv7nbP1PrJfsEAcE4DopfodHlbsQa9mI+CM7/CdVjb1EnxWM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l3RcIyKFiAgZmLo3YCp7FUMu0sc69uPmvP8GHjcUPk=;
 b=M6688s9nOQcdiipVgAfA8LiBKjOoJAdlbV4mYaQJ5DLeq0YussA5CtexDU+k9TdyeAJQdGBPOlk+bCtLPB24T/zaqfzUv2iArP2wyp0BJkYjDDzKtOIevMD/biikLyb+gZaAzE+NSS4uasZDbYjq56hwCsvOC9P5Ybi5GLT37dr6B+z74da9CjpzR4bwLK+IcxrL6GHGcnKpZ+uGgyOKC1kVN06yu60FZFO7VjDEv9v5liIxODyneSXROHI1zqFmZMIJLSQAyfd5pFJQE22Xg9Jt0UhDQW+rNRjx7VMjGxWCXPVaDdnTndWgy9BcOPF2NZ7XCHKNEuUBhVqCZOpecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l3RcIyKFiAgZmLo3YCp7FUMu0sc69uPmvP8GHjcUPk=;
 b=FfQeMqCn54+XjlG/yDsd1aFC43YedtCq/92v+YQtVahonD3GiMMKKZtJO8xWsND55I4QUTt1W54yB/IBJ7zlrdfXjt6Oh9jRcOTQf/Tb/ygSKlI9m4+u0B5JIpotz8EvqAbp+SPZli5B5OJX1APxLiT6Uf0uxLo3ploBbmQMmp4=
Received: from DM6PR11MB4123.namprd11.prod.outlook.com (2603:10b6:5:196::12)
 by DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 28 Feb
 2020 14:05:14 +0000
Received: from DM6PR11MB4123.namprd11.prod.outlook.com
 ([fe80::f42c:82b3:ecda:5ff4]) by DM6PR11MB4123.namprd11.prod.outlook.com
 ([fe80::f42c:82b3:ecda:5ff4%6]) with mapi id 15.20.2750.021; Fri, 28 Feb 2020
 14:05:14 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <dave.stevenson@raspberrypi.com>
CC:     <andrey.konovalov@linaro.org>, <sakari.ailus@iki.fi>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx219: add support for enum frame interval
Thread-Topic: [PATCH] media: i2c: imx219: add support for enum frame interval
Thread-Index: AQHV7YFRL4HEUFiYjUmuc7e6XxI0FKgwn2yAgAAFgAA=
Date:   Fri, 28 Feb 2020 14:05:14 +0000
Message-ID: <c6c1082d-3f40-c709-39cf-d1547f0c0308@microchip.com>
References: <20200227151752.21985-1-eugen.hristev@microchip.com>
 <CAPY8ntB17QjCSyefwTrMhudwkiFYT_5x3i1=KjzFv+p6tbrQEA@mail.gmail.com>
In-Reply-To: <CAPY8ntB17QjCSyefwTrMhudwkiFYT_5x3i1=KjzFv+p6tbrQEA@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a45664c-4a86-4eb1-5b21-08d7bc573bb1
x-ms-traffictypediagnostic: DM6PR11MB4514:
x-microsoft-antispam-prvs: <DM6PR11MB451456FFAD6C791BA5D5C856E8E80@DM6PR11MB4514.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(39860400002)(396003)(346002)(136003)(376002)(189003)(199004)(186003)(71200400001)(6486002)(36756003)(2906002)(316002)(26005)(2616005)(54906003)(6506007)(6512007)(4326008)(53546011)(8936002)(81166006)(81156014)(5660300002)(8676002)(478600001)(31696002)(66476007)(66446008)(66556008)(91956017)(76116006)(31686004)(66946007)(64756008)(6916009)(86362001)(966005)(461764006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB4514;H:DM6PR11MB4123.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eUSLbR/RaY5bFF5NR8JTMqmqO+S/cKHyeeI2SiWFJeSzOTG/A0+TURdFjLqaZ/zwQmYxZC8VW4gJ9VXQgM7A57BFOba7e9NWV2kubITXkS7A7t8iVGQ+kdnNYAkrbtLHNdTE7MAaQGlKTxt3L8i6thVzhYKudg5RDXbcbU8DKRBprMBwmdxElPcWFKnzBRJD4p0EFGJ5/c8ZsjgIsOu3Ug2IBOBwhx5OfoZzyUTSwk19cShnBg8KXWX/v/77fKEUJJmWx6dD47r0Q152z0JczGOI452hYKnzNLtAlF6TsZpHaLnHBLuzuqvbTEDxEde0Q1knxM2imuPsbQpZrOrB3by08PTcHxgIIBDjeZhqNtv0sDLs2M6/R3OukKqAdtcrzt3QATiXP5DBCb07CTdaDsWYolMgRDgDQpC05kj2x4+h9KEcaJSTQlktPSLqQPHFmmInNkcfcM2tidvezcfMjHEOx+fQMBcAX8MyEVBj59MFxDmmk3NbpN+XWQGC6/Q8sbGB9gQqeS2u8cdTPCu9DtnK7KEQs82vopSONn1hCxLgXSK3RUM4YYlCWWpXSvBH
x-ms-exchange-antispam-messagedata: y8CImj0apT3AqjXkTUCYqiQNl3oCzPmxkEtt8fwnPepG7cTQ+Zx9qeQXM23nr0RqgpKM7HYFIBpJmS1qgvn7lIeIUisZ1MR3b+q+pxsfC8kx7rkA8PqVVPexYgWiu9vPTEW9kkR0ITSVQ53gAIfADA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <68606579D5557D42ABB0521098F21E4F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a45664c-4a86-4eb1-5b21-08d7bc573bb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 14:05:14.4760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jZC47bbOtdkage7ayyx+g8uWbFjZZj1hjeJZ/g5txihKeLAGilkBzqNCLfwQRf85BGbjj+UTSpSstBRoI498jM3Cna4Tn6EEEheW10cDzKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjguMDIuMjAyMCAxNTo0NCwgRGF2ZSBTdGV2ZW5zb24gd3JvdGU6DQo+IEhpIEV1Z2VuLg0K
PiANCj4gT24gVGh1LCAyNyBGZWIgMjAyMCBhdCAxNToxOSwgRXVnZW4gSHJpc3RldiA8ZXVnZW4u
aHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4+DQo+PiBBZGQgc3VwcG9ydCBmb3IgZW51
bSBmcmFtZSBpbnRlcnZhbHMgSU9DVEwuDQo+PiBUaGUgY3VycmVudCBzdXBwb3J0ZWQgZnJhbWVy
YXRlcyBhcmUgb25seSBhdmFpbGFibGUgYXMgY29tbWVudHMgaW5zaWRlDQo+PiB0aGUgY29kZS4N
Cj4+IEFkZCBzdXBwb3J0IGZvciBWSURJT0NfRU5VTV9GUkFNRUlOVEVSVkFMUyBhcyB0aGUgZW51
bV9mcmFtZV9pbnRlcnZhbA0KPj4gY2FsbGJhY2sgYXMgcGFkIG9wcy4NCj4+DQo+PiAgICMgdjRs
Mi1jdGwgLS1saXN0LWZyYW1laW50ZXJ2YWxzIHdpZHRoPTE5MjAsaGVpZ2h0PTEwODAscGl4ZWxm
b3JtYXQ9UkcxMA0KPj4gICBpb2N0bDogVklESU9DX0VOVU1fRlJBTUVJTlRFUlZBTFMNCj4+ICAg
ICAgICAgIEludGVydmFsOiBEaXNjcmV0ZSAwLjA2N3MgKDE1LjAwMCBmcHMpDQo+PiAgICAgICAg
ICBJbnRlcnZhbDogRGlzY3JldGUgMC4wMzNzICgzMC4wMDAgZnBzKQ0KPj4gICAgICAgICAgSW50
ZXJ2YWw6IERpc2NyZXRlIDAuMDMzcyAoMzAuMDAwIGZwcykNCj4gDQo+IEJ1dCB0aGUgZnJhbWUg
cmF0ZXMgYXJlIG5vdCBkaXNjcmV0ZS4gWW91IGhhdmUgZnJhbWUgcmF0ZSBjb250cm9sIHZpYQ0K
PiBWNEwyX0NJRF9WQkxBTkssIHdoaWNoIGNhbiBiZSB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGgg
VjRMMl9DSURfSEJMQU5LDQo+IGFuZCBWNEwyX0NJRF9QSVhFTF9SQVRFIHRvIGRldGVybWluZSBh
Y3R1YWwgZnJhbWUgcGVyaW9kLg0KPiANCj4gU2VlIGh0dHBzOi8vbGludXh0di5vcmcvZG93bmxv
YWRzL3Y0bC1kdmItYXBpcy1uZXcvdWFwaS92NGwvZXh0LWN0cmxzLWltYWdlLXNvdXJjZS5odG1s
P2hpZ2hsaWdodD12NGwyX2NpZF92YmxhbmsNCj4gSSBiZWxpZXZlIHRoaXMgaXMgdGhlIHByZWZl
cnJlZCByb3V0ZSB0byBkb2luZyBmcmFtZSByYXRlIGNvbnRyb2wgb24NCj4gaW1hZ2Ugc2Vuc29y
cy4gSSBhc3N1bWUgc29tZW9uZSB3aWxsIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nIG9uIHRoYXQu
DQoNCg0KT2theS4uLiAsIEkgd2FzIGd1aWRlZCB0b3dhcmRzIHRoaXMgYnkgdGhlIGNvbW1lbnRz
IGluIHRoZSBjb2RlLCBzYXlpbmcgDQp0aGF0IHRoZSB0aHJlZSBzdXBwb3J0ZWQgbW9kZXMgYXJl
IGF0IGEgY29uc3RhbnQgZnJhbWUgcGVyIHNlY29uZC4uLg0KDQpUaG9zZSBjb21tZW50cyBhcmUg
d3JvbmcgdGhlbiA/DQoNClRoYW5rcyBmb3IgcmVwbHlpbmcsDQoNCkV1Z2VuDQoNCj4gDQo+ICAg
IERhdmUNCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2
QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+DQo+PiBIZWxsbywNCj4+DQo+PiBUaGlzIGlzIG9u
IHRvcCBvZiBTYWthcmkncyB0cmVlIGluIGxpbnV4dHYub3JnDQo+Pg0KPj4gVGhhbmtzDQo+PiBF
dWdlbg0KPj4NCj4+ICAgZHJpdmVycy9tZWRpYS9pMmMvaW14MjE5LmMgfCAyNyArKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvaW14MjE5LmMgYi9kcml2ZXJz
L21lZGlhL2kyYy9pbXgyMTkuYw0KPj4gaW5kZXggZjFlZmZiNWE1ZjY2Li4xN2ZjZWRkNGVkYjYg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgyMTkuYw0KPj4gKysrIGIvZHJp
dmVycy9tZWRpYS9pMmMvaW14MjE5LmMNCj4+IEBAIC0xMjcsNiArMTI3LDggQEAgc3RydWN0IGlt
eDIxOV9tb2RlIHsNCj4+ICAgICAgICAgIHVuc2lnbmVkIGludCB3aWR0aDsNCj4+ICAgICAgICAg
IC8qIEZyYW1lIGhlaWdodCAqLw0KPj4gICAgICAgICAgdW5zaWduZWQgaW50IGhlaWdodDsNCj4+
ICsgICAgICAgLyogRnJhbWUgcmF0ZSAqLw0KPj4gKyAgICAgICB1OCBmcHM7DQo+Pg0KPj4gICAg
ICAgICAgLyogVi10aW1pbmcgKi8NCj4+ICAgICAgICAgIHVuc2lnbmVkIGludCB2dHNfZGVmOw0K
Pj4gQEAgLTM4MSw2ICszODMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDIxOV9tb2RlIHN1
cHBvcnRlZF9tb2Rlc1tdID0gew0KPj4gICAgICAgICAgICAgICAgICAvKiA4TVBpeCAxNWZwcyBt
b2RlICovDQo+PiAgICAgICAgICAgICAgICAgIC53aWR0aCA9IDMyODAsDQo+PiAgICAgICAgICAg
ICAgICAgIC5oZWlnaHQgPSAyNDY0LA0KPj4gKyAgICAgICAgICAgICAgIC5mcHMgPSAxNSwNCj4+
ICAgICAgICAgICAgICAgICAgLnZ0c19kZWYgPSBJTVgyMTlfVlRTXzE1RlBTLA0KPj4gICAgICAg
ICAgICAgICAgICAucmVnX2xpc3QgPSB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgLm51
bV9vZl9yZWdzID0gQVJSQVlfU0laRShtb2RlXzMyODB4MjQ2NF9yZWdzKSwNCj4+IEBAIC0zOTEs
NiArMzk0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXgyMTlfbW9kZSBzdXBwb3J0ZWRfbW9k
ZXNbXSA9IHsNCj4+ICAgICAgICAgICAgICAgICAgLyogMTA4MFAgMzBmcHMgY3JvcHBlZCAqLw0K
Pj4gICAgICAgICAgICAgICAgICAud2lkdGggPSAxOTIwLA0KPj4gICAgICAgICAgICAgICAgICAu
aGVpZ2h0ID0gMTA4MCwNCj4+ICsgICAgICAgICAgICAgICAuZnBzID0gMzAsDQo+PiAgICAgICAg
ICAgICAgICAgIC52dHNfZGVmID0gSU1YMjE5X1ZUU18zMEZQU18xMDgwUCwNCj4+ICAgICAgICAg
ICAgICAgICAgLnJlZ19saXN0ID0gew0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIC5udW1f
b2ZfcmVncyA9IEFSUkFZX1NJWkUobW9kZV8xOTIwXzEwODBfcmVncyksDQo+PiBAQCAtNDAxLDYg
KzQwNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MjE5X21vZGUgc3VwcG9ydGVkX21vZGVz
W10gPSB7DQo+PiAgICAgICAgICAgICAgICAgIC8qIDJ4MiBiaW5uZWQgMzBmcHMgbW9kZSAqLw0K
Pj4gICAgICAgICAgICAgICAgICAud2lkdGggPSAxNjQwLA0KPj4gICAgICAgICAgICAgICAgICAu
aGVpZ2h0ID0gMTIzMiwNCj4+ICsgICAgICAgICAgICAgICAuZnBzID0gMzAsDQo+PiAgICAgICAg
ICAgICAgICAgIC52dHNfZGVmID0gSU1YMjE5X1ZUU18zMEZQU19CSU5ORUQsDQo+PiAgICAgICAg
ICAgICAgICAgIC5yZWdfbGlzdCA9IHsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAubnVt
X29mX3JlZ3MgPSBBUlJBWV9TSVpFKG1vZGVfMTY0MF8xMjMyX3JlZ3MpLA0KPj4gQEAgLTY4MCw2
ICs2ODUsMjcgQEAgc3RhdGljIGludCBpbXgyMTlfZW51bV9mcmFtZV9zaXplKHN0cnVjdCB2NGwy
X3N1YmRldiAqc2QsDQo+PiAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgfQ0KPj4NCj4+ICtzdGF0
aWMgaW50IGlteDIxOV9lbnVtX2ZyYW1lX2ludGVydmFsKHN0cnVjdCB2NGwyX3N1YmRldiAqc2Qs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2NGwyX3N1
YmRldl9wYWRfY29uZmlnICpjZmcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCB2NGwyX3N1YmRldl9mcmFtZV9pbnRlcnZhbF9lbnVtICpmaWUpDQo+PiAr
ew0KPj4gKyAgICAgICBzdHJ1Y3QgaW14MjE5ICppbXgyMTkgPSB0b19pbXgyMTkoc2QpOw0KPj4g
Kw0KPj4gKyAgICAgICBpZiAoZmllLT5pbmRleCA+PSBBUlJBWV9TSVpFKHN1cHBvcnRlZF9tb2Rl
cykpDQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArICAgICAg
IGlmIChmaWUtPmNvZGUgIT0gaW14MjE5X2dldF9mb3JtYXRfY29kZShpbXgyMTkpKQ0KPj4gKyAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKyAgICAgICBpZiAoZmllLT5w
YWQpDQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArDQo+PiArICAgICAg
IGZpZS0+aW50ZXJ2YWwubnVtZXJhdG9yID0gMTsNCj4+ICsgICAgICAgZmllLT5pbnRlcnZhbC5k
ZW5vbWluYXRvciA9IHN1cHBvcnRlZF9tb2Rlc1tmaWUtPmluZGV4XS5mcHM7DQo+PiArDQo+PiAr
ICAgICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgaW14MjE5X3Jl
c2V0X2NvbG9yc3BhY2Uoc3RydWN0IHY0bDJfbWJ1c19mcmFtZWZtdCAqZm10KQ0KPj4gICB7DQo+
PiAgICAgICAgICBmbXQtPmNvbG9yc3BhY2UgPSBWNEwyX0NPTE9SU1BBQ0VfU1JHQjsNCj4+IEBA
IC0xMDA0LDYgKzEwMzAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3ViZGV2X3BhZF9v
cHMgaW14MjE5X3BhZF9vcHMgPSB7DQo+PiAgICAgICAgICAuZ2V0X2ZtdCA9IGlteDIxOV9nZXRf
cGFkX2Zvcm1hdCwNCj4+ICAgICAgICAgIC5zZXRfZm10ID0gaW14MjE5X3NldF9wYWRfZm9ybWF0
LA0KPj4gICAgICAgICAgLmVudW1fZnJhbWVfc2l6ZSA9IGlteDIxOV9lbnVtX2ZyYW1lX3NpemUs
DQo+PiArICAgICAgIC5lbnVtX2ZyYW1lX2ludGVydmFsID0gaW14MjE5X2VudW1fZnJhbWVfaW50
ZXJ2YWwsDQo+PiAgIH07DQo+Pg0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3ViZGV2
X29wcyBpbXgyMTlfc3ViZGV2X29wcyA9IHsNCj4+IC0tDQo+PiAyLjIwLjENCj4+DQoNCg==
