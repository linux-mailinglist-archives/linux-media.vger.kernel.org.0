Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32725C0860
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 17:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfI0PNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 11:13:55 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:15704 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfI0PNy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 11:13:54 -0400
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
IronPort-SDR: et80TLzL+ohAM3rgB5VYQc7oXYud70fvTYt5XaxsSDjvsqpDNzJniO3uLvHKjzp+nXVFwfgvlX
 3DGq9TxWOqMA0VKWEEBc2nvx+a1CdhuXyWHouWVIXj3sF40Q3JDYRtTfKrz1KNjLG7u4uHrsnI
 kNBLpzPXTFKqiQGy1lbnFDyDuRxDQkPJqvABq65xArn688JLQmB0iu6yiiL/zIuIWuhXT3+W2/
 0IqmRhqvtZk9s0IEVXUhoOC7wj5Y5+7i9VKTrf72LlTabcv8/C4CouRYnuyS+BBqcYJBdTlFjb
 N+M=
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; 
   d="scan'208";a="49307074"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2019 08:13:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Sep 2019 08:13:53 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 27 Sep 2019 08:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGbb18GbqoxpyG6uQVjSzINDc5bEQOP/S3hLhaS88j3yTdUytbvpTXhD9rjV6Rb0p4Nn03lDXDQ9sbSI9RwA9gZfcrCWi+qDkJf4iHlsny2bIV/CYcC6byrv/JdN+fn8HSYAN2oBYwavVXPWTJ/fMFoXQS4mYKhvfDnaomTN/hxaIxNadFadKfsvkJIj+Jxt/qC9XrFn06Ptxe9cgaEnCaIjxQ9NtQxoDNp7KJs30xt0uSFM79GEXjEYU5eZY3kvc73UAiaH8zVzqhbbC/QMdH1vZrMuCQdMpof3eVF57Nujje7+WFX6urk8lEjbR1VR11z8sC8dsXlxNsZgMC3xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW2Ru57WsQfzkwmMHBPzcLnD4AJuNPzfX2sEtaoll+M=;
 b=PGtdm0lGCF8VH1cDsJRR6Wn4ZO9TmWvdlYi8FMBa2DQBhn55fj/4tvEETf5QaprMxKh6+jvW2Yj4+nhfuRstoofShL4IbBmWRlZFXBz6EOVABc7eW9LB1FB0zuHNAt/G6EKHo8js7XIlvl1NHAYtEC1uQ5dwTSirSc0/qpiWoRTLXVeupAdsUNSdkSctR0/VFa0DMIM7W6FywHFkWULfuElJspTNA54QNGfCjJ0af1Np1pS5BFL4Gm8d5ZHTLdH3nh5GENPI6XHdBoPX1wVMG+YjGSwF5U0bJu27C0bzqGpty+iK0/1DG+rOR2OB9ZAabO9AlvXVbmJ0XwTbDNPmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW2Ru57WsQfzkwmMHBPzcLnD4AJuNPzfX2sEtaoll+M=;
 b=AlVP8TbWnp0CZEsg4znsuGYnWNKtUH54azvTWmjp36nZoakifZTFRWW3enXeBYqbOGd8wTw5BgbnSucy0EHle5WuELhrSQqO/QnxonfHCHc+CkFm2Gjnwg9E1/S9I2nJqfhN0H8/IarDzYyBD2NZERtvh7JK9bBp3d5saQkX6a0=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1977.namprd11.prod.outlook.com (10.175.86.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 27 Sep 2019 15:13:52 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2305.017; Fri, 27 Sep
 2019 15:13:52 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <boris.brezillon@collabora.com>, <acourbot@chromium.org>,
        <nicolas@ndufresne.ca>, <tfiga@chromium.org>,
        <ezequiel@collabora.com>, <daniel@qtec.com>,
        <dafna.hirschfeld@collabora.com>, <paul.kocialkowski@bootlin.com>,
        <helen.koike@collabora.com>, <m.tretter@pengutronix.de>
CC:     <jacopo+renesas@jmondi.org>, <laurent.pinchart@ideasonboard.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
Thread-Topic: [ANN] Media sessions in Lyon in October: codecs
Thread-Index: AQHVchkKkpRc9U3tskCgi45TDmM0fac/ppQA
Date:   Fri, 27 Sep 2019 15:13:51 +0000
Message-ID: <58401a03-8c17-96a9-64af-911ec6aecccf@microchip.com>
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
In-Reply-To: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::32) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190927180816081
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff266c29-66bb-4d2b-b6d4-08d7435d4e23
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1977;
x-ms-traffictypediagnostic: DM5PR11MB1977:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR11MB1977C1A73AEE2D07B2347D5AE8810@DM5PR11MB1977.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(39860400002)(366004)(376002)(497574002)(53754006)(199004)(189003)(52116002)(76176011)(186003)(36756003)(26005)(25786009)(66066001)(4326008)(66446008)(53546011)(6512007)(6246003)(2616005)(66476007)(476003)(561944003)(486006)(11346002)(6506007)(66556008)(64756008)(6306002)(99286004)(6436002)(6116002)(3846002)(5660300002)(2906002)(256004)(66946007)(446003)(102836004)(386003)(31686004)(7416002)(8676002)(6486002)(14444005)(81166006)(229853002)(71190400001)(966005)(14454004)(54906003)(305945005)(8936002)(81156014)(71200400001)(7736002)(31696002)(478600001)(86362001)(110136005)(316002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1977;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hxdzn8io4aXUd0E9qBV/oa3WnIhN3Kpn9Bj1ADqM6HeBs0ktJ/o4C2863caeOYHhbHIAmC1YR+ppB6jLOKedOsFytMELhwi1vEtri7Q26EF9jvm8vpcxJvxHxrPhrXfi+vgCXfVHiaeT2TLYkW2AnOxXPQs39J6ueRB6F2ShgnaPnJbAH+njbWHb2ZQipn3NjxFWxwyk/GKCLwEbQ4daVofRimyzWYGkdyOF7eVZtykGXmUFKzTCCUKKAJ7rlbupqE85l8K2Dw9RTpAvgubMMJ1jDyQ1c5Rjp0PFN2ykWSRCh/JN6L2sIeKnd0IcEFK35fUAmze7PkJIweBVjCI5pFgpc4883FCV1W86cCSjPG+9/Eq2Ze5emRPRP+Y/UX0o7mXRsQ4gSF6yrzgKEjcGaswdEWXsxiXFc93s1DyCPCy3VZ60nWS0IZ6pQYFnR5dAnuBN7IUqskzQz0HXFh1ARg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2AE9679562FCC4293876A117EB2AEA9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ff266c29-66bb-4d2b-b6d4-08d7435d4e23
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 15:13:52.0036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AucKa9kbdRz9z9WGx0O+1CTezaqAg3X/n++g+p75nGv7UDYlgzmnm5Zt+v+FRU0uSj2nB/jyIlZjtfwFWwS0iQvwIIWoqPhzT3pfR22SeGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1977
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDIzLjA5LjIwMTkgMTc6MTIsIEhhbnMgVmVya3VpbCB3cm90ZToNCj4gSGkgYWxsLA0K
PiANCj4gU2luY2Ugd2UgaGF2ZSB0aHJlZSBzZXBhcmF0ZSBoYWxmLWRheSBzZXNzaW9ucyBmb3Ig
ZGlmZmVyZW50IHRvcGljcyBJIGRlY2lkZWQNCj4gdG8gc3BsaXQgdGhlIGFubm91bmNlbWVudCBm
b3IgdGhpcyBpbiB0aHJlZSBlbWFpbHMgYXMgd2VsbCwgc28gdGhlc2UgdGhpbmdzDQo+IGNhbiBi
ZSBkaXNjdXNzZWQgaW4gc2VwYXJhdGUgdGhyZWFkcy4NCj4gDQo+IEFsbCBzZXNzaW9ucyBhcmUg
aW4gcm9vbSBUZXJyZWF1eCBWSVAgTG91bmdlIC0gTGV2ZWwgMC4NCj4gVGhlcmUgaXMgYSBtYXhp
bXVtIG9mIDE1IHBlb3BsZS4NCj4gDQo+IFRoZSBmaXJzdCBzZXNzaW9uIGRlYWxzIHdpdGggdGhl
IGNvZGVjIEFQSSBhbmQgaXMgb24gVHVlc2RheSBtb3JuaW5nIGZyb20NCj4gODozMCAodGVudGF0
aXZlLCBtaWdodCBjaGFuZ2UpIHRvIDEyOjAwICh3ZSBoYXZlIHRvIHZhY2F0ZSB0aGUgcm9vbSBh
dCB0aGF0DQo+IHRpbWUpLg0KPiANCj4gQ29uZmlybWVkIGF0dGVuZGVlcyBmb3IgdGhpcyBzZXNz
aW9uOg0KPiANCj4gQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4NCj4gQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9yZz4NCj4gTmljb2xh
cyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+DQo+IFRvbWFzeiBGaWdhIDx0ZmlnYUBj
aHJvbWl1bS5vcmc+DQo+IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4N
Cj4gRGFuaWVsIEdvbWV6IDxkYW5pZWxAcXRlYy5jb20+DQo+IERhZm5hIEhpcnNjaGZlbGQgPGRh
Zm5hLmhpcnNjaGZlbGRAY29sbGFib3JhLmNvbT4NCj4gRXVnZW4gSHJpc3RldiA8RXVnZW4uSHJp
c3RldkBtaWNyb2NoaXAuY29tPg0KPiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dz
a2lAYm9vdGxpbi5jb20+DQo+IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEuY29t
Pg0KPiBNaWNoYWVsIFRyZXR0ZXIgPG0udHJldHRlckBwZW5ndXRyb25peC5kZT4NCj4gSGFucyBW
ZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+DQo+IA0KPiBUZW50YXRpdmU6DQo+IA0KPiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IEphY29w
byBNb25kaSA8amFjb3BvQGptb25kaS5vcmc+DQo+IA0KPiBKYWNvcG8sIHBsZWFzZSBjb25maXJt
IGlmIHlvdSB3YW50IHRvIGF0dGVuZCB0aGlzIHNlc3Npb24uIEkgZGlkbid0IGZpbmQNCj4gYW4g
ZW1haWwgd2l0aCBleHBsaWNpdCBjb25maXJtYXRpb24sIHNvIGl0IHdhcyBwcm9iYWJseSBkb25l
IHZpYSBpcmMuIEJ1dCBzaW5jZQ0KPiB0aGlzIHNlc3Npb24gaXMgZ2V0dGluZyBjbG9zZSB0byBj
YXBhY2l0eSBJIHdvdWxkIHByZWZlciB0byBrZWVwIGF0dGVuZGFuY2UgdG8NCj4gdGhvc2UgYXJl
IGFjdHVhbGx5IHdvcmtpbmcgd2l0aCBjb2RlY3MgKG9yIHdpbGwgd29yayB3aXRoIGl0IGluIHRo
ZSBuZWFyIGZ1dHVyZSkuDQo+IA0KDQpIaSBIYW5zLA0KDQpJIGFtIG9uICdqdXN0IGludGVyZXN0
ZWQnLiBJZiBzb21lb25lIGlzIGRpcmVjdGx5IGludm9sdmVkICwgdGhleSBjYW4gDQp0YWtlIG15
IHBsYWNlIG9uIHRoaXMgdG9waWMuIEkgd2lsbCBzZWUgYXQgY29uZmVyZW5jZSB0aW1lIGlmIHRo
ZXJlIGFyZSANCnN0aWxsIG9wZW4gc2VhdHMgaWYgSSB3aWxsIGpvaW4gb3Igbm90Lg0KDQpFdWdl
bg0KDQo+IElmIEkgbWlzc2VkIHNvbWVvbmUsIG9yIHlvdSBhcmUgb24gdGhlIGxpc3QgYnV0IHdv
bid0IGF0dGVuZCBhZnRlciBhbGwsIHRoZW4NCj4gcGxlYXNlIGxldCBtZSBrbm93Lg0KPiANCj4g
DQo+IA0KPiBBZ2VuZGE6DQo+IA0KPiAtIFN0YXR1cyBvZiBhbnkgcGVuZGluZyBwYXRjaGVzIHJl
bGF0ZWQgdG8gY29kZWMgc3VwcG9ydC4NCj4gDQo+IC0gUmVxdWlyZW1lbnRzIG9mIG1vdmluZyBj
b2RlYyBkcml2ZXJzIG91dCBvZiBzdGFnaW5nLg0KPiANCj4gLSBGaW5hbGl6ZSB0aGUgc3RhdGVm
dWwgZW5jb2RlciBBUEkuIFRoZXJlIGFyZSB0d28gcGllY2VzIHRoYXQgbmVlZA0KPiAgICB0byBi
ZSBkZWZpbmVkOg0KPiANCj4gMSkgU2V0dGluZyB0aGUgZnJhbWUgcmF0ZSBzbyBiaXRyYXRlIGNv
bnRyb2wgY2FuIG1ha2Ugc2Vuc2UsIHNpbmNlDQo+ICAgICB0aGV5IG5lZWQgdG8ga25vdyB0aGlz
IGluZm9ybWF0aW9uLiBUaGlzIGlzIGFsc28gcmVsZXZhbnQgZm9yIHRoZQ0KPiAgICAgc3RhdGVs
ZXNzIGNvZGVjIChhbmQgdGhpcyBtYXkgaGF2ZSB0byBjaGFuZ2Ugb24gYSBwZXItZnJhbWUgYmFz
aXMNCj4gICAgIGZvciBzdGF0ZWxlc3MgY29kZWNzISkuDQo+IA0KPiAgICAgVGhpcyBjYW4gZWl0
aGVyIGJlIGltcGxlbWVudGVkIHZpYSBFTlVNX0ZSQU1FSU5URVJWQUxTIGZvciB0aGUgY29kZWQN
Cj4gICAgIHBpeGVsZm9ybWF0cyBhbmQgU19QQVJNIHN1cHBvcnQsIG9yIHdlIGp1c3QgYWRkIGEg
bmV3IGNvbnRyb2wgZm9yIHRoaXMuDQo+ICAgICBFLmcuIFY0TDJfQ0lEX01QRUdfVklERU9fRlJB
TUVfSU5URVJWQUwgKG9yIHBlcmhhcHMgRlJBTUVfUkFURSkuIElmIHdlDQo+ICAgICBnbyBmb3Ig
YSBjb250cm9sLCB0aGVuIHdlIG5lZWQgdG8gY29uc2lkZXIgdGhlIHVuaXQuIFdlIGNhbiB1c2Ug
YQ0KPiAgICAgZnJhY3Rpb24gYXMgd2VsbC4gU2VlIHRoaXMgc2VyaWVzIHRoYXQgcHV0cyBpbiB0
aGUgZm91bmRhdGlvbiBmb3IgdGhhdDoNCj4gICAgIGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYu
b3JnL2NvdmVyLzU4ODU3Lw0KPiANCj4gICAgIEkgYW0gaW5jbGluZWQgdG8gZ28gd2l0aCBhIGNv
bnRyb2wsIHNpbmNlIHRoZSBzZW1hbnRpY3MgZG9uJ3QgcmVhbGx5DQo+ICAgICBtYXRjaCBFTlVN
X0ZSQU1FSU5URVJWQUxTL1NfUEFSTS4gVGhlc2UgaW9jdGxzIHN0aWxsIG5lZWQgdG8gYmUgc3Vw
cG9ydGVkDQo+ICAgICBmb3IgbGVnYWN5IGRyaXZlcnMuIE9wZW4gcXVlc3Rpb246IHNvbWUgZHJp
dmVycyAobWVkaWF0ZWssIGh2YSwgY29kYSkNCj4gICAgIHJlcXVpcmUgU19QQVJNKE9VVFBVVCks
IHNvbWUgKHZlbnVzKSBhbGxvdyBib3RoIFNfUEFSTShDQVBUVVJFKSBhbmQNCj4gICAgIFNfUEFS
TShPVVRQVVQpLiBJIGFtIGluY2xpbmVkIHRvIGFsbG93IGJvdGggc2luY2UgdGhpcyBpcyBub3Qg
YSBDQVBUVVJFDQo+ICAgICB2cyBPVVRQVVQgdGhpbmcsIGl0IGlzIGdsb2JhbCB0byBib3RoIHF1
ZXVlcy4NCj4gDQo+IDIpIEludGVyYWN0aW9ucyBiZXR3ZWVuIE9VVFBVVCBhbmQgQ0FQVFVSRSBm
b3JtYXRzLg0KPiANCj4gICAgIFRoZSBtYWluIHByb2JsZW0gaXMgd2hhdCB0byBkbyBpZiB0aGUg
Y2FwdHVyZSBzaXplaW1hZ2UgaXMgdG9vIHNtYWxsDQo+ICAgICBmb3IgdGhlIE9VVFBVVCByZXNv
bHV0aW9uIHdoZW4gc3RyZWFtaW5nIHN0YXJ0cy4NCj4gDQo+ICAgICBQcm9wb3NhbDogd2lkdGgg
YW5kIGhlaWdodCBvZiBTX0ZNVChPVVRQVVQpIGFyZSB1c2VkIHRvDQo+ICAgICBjYWxjdWxhdGUg
YSBtaW5pbXVtIHNpemVpbWFnZSAoYXBwIG1heSByZXF1ZXN0IG1vcmUpLiBUaGlzIGlzDQo+ICAg
ICBkcml2ZXItc3BlY2lmaWMuIChJcyBpdD8gT3IgaXMgdGhpcyBjb2RlYy1zcGVjaWZpYz8pDQo+
IA0KPiAgICAgVjRMMl9GTVRfRkxBR19GSVhFRF9SRVNPTFVUSU9OIGlzIGFsd2F5cyBzZXQgZm9y
IGNvZGVjIGZvcm1hdHMNCj4gICAgIGZvciB0aGUgZW5jb2RlciAoaS5lLiB3ZSBkb24ndCBzdXBw
b3J0IG1pZC1zdHJlYW0gcmVzb2x1dGlvbg0KPiAgICAgY2hhbmdlcyBmb3Igbm93KSBhbmQgVjRM
Ml9FVkVOVF9TT1VSQ0VfQ0hBTkdFIGlzIG5vdA0KPiAgICAgc3VwcG9ydGVkLiBTZWUgaHR0cHM6
Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcGF0Y2gvNTY0NzgvIGZvcg0KPiAgICAgdGhlIHBhdGNo
IGFkZGluZyB0aGlzIGZsYWcuDQo+IA0KPiAgICAgT2YgY291cnNlLCBpZiB3ZSBzdGFydCB0byBz
dXBwb3J0IG1pZC1zdHJlYW0gcmVzb2x1dGlvbg0KPiAgICAgY2hhbmdlcyAob3Igb3RoZXIgY2hh
bmdlcyB0aGF0IHJlcXVpcmUgYSBzb3VyY2UgY2hhbmdlIGV2ZW50KSwNCj4gICAgIHRoZW4gdGhp
cyBmbGFnIHNob3VsZCBiZSBkcm9wcGVkIGJ5IHRoZSBlbmNvZGVyIGRyaXZlciBhbmQNCj4gICAg
IGRvY3VtZW50YXRpb24gb24gaG93IHRvIGhhbmRsZSB0aGUgc291cmNlIGNoYW5nZSBldmVudCBz
aG91bGQNCj4gICAgIGJlIGRvY3VtZW50ZWQgaW4gdGhlIGVuY29kZXIgc3BlYy4gSSBwcmVmZXIg
dG8gcG9zdHBvbmUgdGhpcw0KPiAgICAgdW50aWwgd2UgaGF2ZSBhbiBlbmNvZGVyIHRoYW4gY2Fu
IGFjdHVhbGx5IGRvIG1pZC1zdHJlYW0NCj4gICAgIHJlc29sdXRpb24gY2hhbmdlcy4NCj4gDQo+
ICAgICBJZiBzaXplaW1hZ2Ugb2YgdGhlIE9VVFBVVCBpcyB0b28gc21hbGwgZm9yIHRoZSBDQVBU
VVJFDQo+ICAgICByZXNvbHV0aW9uIGFuZCBWNEwyX0VWRU5UX1NPVVJDRV9DSEFOR0UgaXMgbm90
IHN1cHBvcnRlZCwNCj4gICAgIHRoZW4gdGhlIHNlY29uZCBTVFJFQU1PTiAoZWl0aGVyIENBUFRV
UkUgb3IgT1VUUFVUKSB3aWxsDQo+ICAgICByZXR1cm4gLUVOT01FTSBzaW5jZSB0aGVyZSBpcyBu
b3QgZW5vdWdoIG1lbW9yeSB0byBkbyB0aGUNCj4gICAgIGVuY29kZS4NCj4gDQo+ICAgICBJZiBW
NEwyX0ZNVF9GTEFHX0ZJWEVEX1JFU09MVVRJT04gaXMgc2V0IChpLmUuIHRoYXQgc2hvdWxkDQo+
ICAgICBiZSB0aGUgY2FzZSBmb3IgYWxsIGN1cnJlbnQgZW5jb2RlcnMpLCB0aGVuIGFueSBiaXRy
YXRlIGNvbnRyb2xzDQo+ICAgICB3aWxsIGJlIGxpbWl0ZWQgaW4gcmFuZ2UgdG8gd2hhdCB0aGUg
Y3VycmVudCBzdGF0ZSAoQ0FQVFVSRSBhbmQNCj4gICAgIE9VVFBVVCBmb3JtYXRzIGFuZCBmcmFt
ZSByYXRlKSBzdXBwb3J0cy4NCj4gDQo+IC0gU3RhdGVsZXNzIGVuY29kZXJzPw0KPiANCj4gLSBB
bnl0aGluZyBlbHNlPyAoSSBoYXZlIGEgZmVlbGluZyBJIG1pc3NlZCBhIGNvZGVjLXJlbGF0ZWQg
dG9waWMsIGJ1dA0KPiAgICBJIGNhbid0IGZpbmQgaXQgaW4gbXkgbWFpbGJveCkNCj4gDQo+IFJl
Z2FyZHMsDQo+IA0KPiAJSGFucw0KPiANCg==
