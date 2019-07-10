Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4BD56419A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 08:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfGJGxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 02:53:09 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:37189 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfGJGxI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 02:53:08 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: c1kqcoaWxQQwE2ytptLNu0JoRQm8waVa6cA2ymSzllr7iTSqFX557sM8HtBD9YBxkz9KOwmU00
 uRqzyl0X28nA4uyuct7vMH0l881Fde7tjizAy/UC/IK9F328vBWN7E/oqdNye54N97BFoLGIdR
 tRABoO8e1ZK9Xi0L4D8uKIzrpTYYBfPuUfR3ds2JkfYKwwkK5U0fzmDgOYFEl6BTCea3FsC6bc
 RdOrYNatAx2HFcgjvbHjLmV7zbVmW294fGx4IoKFnn6t9vH5ftccL9V0opZANOcvz2erp8L83d
 KPE=
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; 
   d="scan'208";a="39981315"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 23:53:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 23:53:05 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 9 Jul 2019 23:53:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QszqPquWi2Cwmxq0scFQ3dnsfRgbQpxNm7FP7u2f4h4=;
 b=kVMFvVeHtKFb65D/ycjvCRyIR3Yn7J4tEOhDdizlGOE2LetNBPE0lIrXg/4lVtM80SLXMnK8z2vUTntMg1hxLkhTaCCcGIPla8ayXPgmSdrcJmhKj/B04UYKTrbUu1ZPfa/4umF8s1scfLw1rYTrY+bhQQL70HD5rxbJ9o2qM0I=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1482.namprd11.prod.outlook.com (10.172.34.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 06:53:03 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Wed, 10 Jul 2019
 06:53:03 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <Luis.Oliveira@synopsys.com>, <mchehab@kernel.org>,
        <davem@davemloft.net>, <gregkh@linuxfoundation.org>,
        <Jonathan.Cameron@huawei.com>, <robh@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <paulmck@linux.ibm.com>,
        <mark.rutland@arm.com>, <kishon@ti.com>,
        <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Joao.Pinto@synopsys.com>
Subject: Re: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Topic: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2
 Host
Thread-Index: AQHVIIsOR6hPk+qKFEm1tQz6OC6yVqbChBwAgAAsw4CAAOTRgA==
Date:   Wed, 10 Jul 2019 06:53:02 +0000
Message-ID: <415416c4-c6d8-f81e-82cb-126e4702801b@microchip.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
 <ae0ffeca-9305-b5a2-3480-da623d15ce67@microchip.com>
 <MN2PR12MB3710465D7065DAF1F2D45C45CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3710465D7065DAF1F2D45C45CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0003.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::13) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190710094749622
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd317b9f-61b5-4077-05a1-08d7050340de
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1482;
x-ms-traffictypediagnostic: DM5PR11MB1482:
x-microsoft-antispam-prvs: <DM5PR11MB14820B5F117EB09E3DA27F0AE8F00@DM5PR11MB1482.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(39860400002)(366004)(376002)(346002)(199004)(189003)(54534003)(66946007)(64756008)(66476007)(486006)(66446008)(66556008)(14454004)(305945005)(25786009)(2201001)(68736007)(86362001)(7736002)(2501003)(110136005)(316002)(446003)(5660300002)(2906002)(2616005)(476003)(256004)(11346002)(53936002)(229853002)(99286004)(52116002)(186003)(26005)(81166006)(102836004)(8676002)(6512007)(6506007)(8936002)(53546011)(386003)(6436002)(76176011)(81156014)(66066001)(31686004)(4326008)(7416002)(6116002)(3846002)(31696002)(36756003)(6486002)(71200400001)(71190400001)(478600001)(6246003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1482;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9lR5Rts7XH280xcUxmymlRxaMbMCFfM0ihxBWIQk+iEczfjgCkrF1UKPqZlPCN94KNrJBXUcJ2u60Cy28YA9bOLj39sb/N8QDkRzjAYL85KOyQOXfoh3OC6TPybFURD+qok3QN6SFYNsvuM8h+UxiJlfWijewrGovWSEsFRcsSuBsS1HzcZ0vtt2nQQaGeDYCw/ms1uhZm2YQA7o4P2zYexxOqWgXiLUgp30Sk7JO9yGJhIG2tPIWqHW1WtuaXCdIacxnzUBJqiicpibcrvIM/Lumlffr2j6sT1/Zaf/ola7wCtZUVGQAOE828Xhfzj++hwdqUW5rROQkYkcQviraWzPqrAYi6RLCmHvz1/YAvIadiwImUiKVfPW4YbaBQVIv6vL6sUC+uFHN+tPhciWW9fmro8gtkZMM0IubDS6E1I=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F13DBCDAA972C418C3611B5F6E35780@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd317b9f-61b5-4077-05a1-08d7050340de
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 06:53:03.0990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1482
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDA5LjA3LjIwMTkgMjA6MDgsIEx1aXMgZGUgT2xpdmVpcmEgd3JvdGU6DQoNCj4gDQo+
IEhpIEV1Z2VuLA0KPiANCj4gDQo+IEZyb206IEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbSA8
RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPg0KPiBEYXRlOiBUdWUsIEp1bCAwOSwgMjAxOSBh
dCAxNTozMzo1MA0KPiANCj4+DQo+Pg0KPj4gT24gMTEuMDYuMjAxOSAyMjoyMCwgTHVpcyBPbGl2
ZWlyYSB3cm90ZToNCj4+PiBGcm9tOiBMdWlzIE9saXZlaXJhIDxsb2xpdmVpQHN5bm9wc3lzLmNv
bT4NCj4+Pg0KPj4+IEFkZCBiaW5kaW5ncyBmb3IgU3lub3BzeXMgRGVzaWduV2FyZSBNSVBJIENT
SS0yIGhvc3QuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWlzIE9saXZlaXJhIDxsb2xpdmVp
QHN5bm9wc3lzLmNvbT4NCj4+PiAtLS0NCj4+PiBDaGFuZ2Vsb2cNCj4+PiB2My12NA0KPj4+IC0g
cmVtb3ZlICJwbGF0IiBmcm9tIHRoZSBibG9jayBuYW1lIEByb2IgQGxhdXJlbnQNCj4+PiAtIHJl
bW92ZSAicGh5LW5hbWVzIiB3aGVuIHNpbmdsZS1lbnRyeSBAcm9iDQo+Pj4gLSByZW1vdmUgInNu
cHMsb3V0cHV0LXR5cGUiIC0+IHdlbnQgdG8gdGhlIGRyaXZlciBjb25maWcgQGxhdXJlbnQNCj4+
Pg0KPj4+ICAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3NucHMsZHctY3NpLnR4dCAg
ICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0
MSBpbnNlcnRpb25zKCspDQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zbnBzLGR3LWNzaS50eHQNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc25wcyxkdy1j
c2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3NucHMsZHct
Y3NpLnR4dA0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAwMC4uNjEz
YjdmOQ0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvc25wcyxkdy1jc2kudHh0DQo+Pj4gQEAgLTAsMCArMSw0MSBAQA0K
Pj4+ICtTeW5vcHN5cyBEZXNpZ25XYXJlIENTSS0yIEhvc3QgY29udHJvbGxlcg0KPj4+ICsNCj4+
PiArRGVzY3JpcHRpb24NCj4+PiArLS0tLS0tLS0tLS0NCj4+PiArDQo+Pj4gK1RoaXMgSFcgYmxv
Y2sgaXMgdXNlZCB0byByZWNlaXZlIGltYWdlIGNvbWluZyBmcm9tIGFuIE1JUEkgQ1NJLTIgY29t
cGF0aWJsZQ0KPj4+ICtjYW1lcmEuDQo+Pj4gKw0KPj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
Pj4+ICstIGNvbXBhdGlibGUJCTogc2hhbGwgYmUgInNucHMsZHctY3NpIg0KPj4+ICstIHJlZwkJ
CTogcGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBkZXZpY2UgbWVtb3J5DQo+
Pj4gKwkJCSAgbWFwcGVkIHJlZ2lzdGVyczsNCj4+PiArLSBpbnRlcnJ1cHRzCQk6IERXIENTSS0y
IEhvc3QgaW50ZXJydXB0cw0KPj4+ICstIHBoeXMJCQk6IExpc3Qgb2Ygb25lIFBIWSBzcGVjaWZp
ZXIgKGFzIGRlZmluZWQgaW4NCj4+PiArCQkJICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L3BoeS1iaW5kaW5ncy50eHQpLg0KPj4+ICsJCQkgIFRoaXMgUEhZIGlzIGEgTUlQ
SSBEUEhZIHdvcmtpbmcgaW4gUlggbW9kZS4NCj4+PiArLSByZXNldHMJCTogUmVmZXJlbmNlIHRv
IGEgcmVzZXQgY29udHJvbGxlciAob3B0aW9uYWwpDQo+Pj4gKw0KPj4+ICtUaGUgcGVyLWJvYXJk
IHNldHRpbmdzOg0KPj4+ICsgLSBwb3J0IHN1Yi1ub2RlIGRlc2NyaWJpbmcgYSBzaW5nbGUgZW5k
cG9pbnQgY29ubmVjdGVkIHRvIHRoZSBjYW1lcmEgYXMNCj4+PiArICAgZGVzY3JpYmVkIGluIHZp
ZGVvLWludGVyZmFjZXMudHh0WzFdLg0KPj4+ICsNCj4+PiArRXhhbXBsZToNCj4+PiArDQo+Pj4g
Kwljc2kyOiBjc2kyQDMwMDAgew0KPj4+ICsJCWNvbXBhdGlibGUgPSAic25wcyxkdy1jc2kiOw0K
Pj4+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4+ICsJCSNzaXplLWNlbGxzID0gPDA+Ow0K
Pj4+ICsJCXJlZyA9IDwgMHgwMzAwMCAweDdGRj47DQo+Pj4gKwkJcGh5cyA9IDwmbWlwaV9kcGh5
X3J4PjsNCj4+PiArCQlyZXNldHMgPSA8JmR3X3JzdCAxPjsNCj4+PiArCQlpbnRlcnJ1cHRzID0g
PDI+Ow0KPj4+ICsNCj4+PiArCQlwb3J0QDAgew0KPj4+ICsJCQlyZWcgPSA8MD47DQo+Pj4gKwkJ
CWNzaV9lcDE6IGVuZHBvaW50IHsNCj4+PiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmY2FtZXJh
XzE+Ow0KPj4+ICsJCQkJZGF0YS1sYW5lcyA9IDwxIDI+Ow0KPj4+ICsJCQl9Ow0KPj4NCj4+IEhl
bGxvIEx1aXMsDQo+Pg0KPj4gV2hpY2ggaXMgdGhlIG91dHB1dCBwb3J0IChlbmRwb2ludCkgOiBo
b3cgdG8gY29ubmVjdCB0aGUgb3V0cHV0IG9mDQo+PiBjc2kyaG9zdCB0byBhbm90aGVyIG5vZGUg
Pw0KPj4gSSBtZWFuLCB0aGUgc2Vjb25kIHBvcnQgb2YgdGhpcyBibG9jaywgb3IsIGhvdyBpcyB0
aGUgZGF0YSB0YWtlbiBmcm9tDQo+PiBjc2kyaG9zdCA/DQo+Pg0KPiANCj4gSSB1bmRlcnN0YW5k
IHlvdXIgcXVlc3Rpb24sIEkgdGhpbmsgeW91IGd1ZXNzZWQgdGhpcyBpcyBub3QgdGhlIGNvbXBs
ZXRlDQo+IHBpcGVsaW5lIChJIGhhdmUgYSB0b3AgZHJpdmVyIHRoYXQgaW50ZXJhY3RzIHdpdGgg
dGhpcyBvbmUpLg0KPiBJIHdhcyBub3QgcGxhbm5pbmcgdG8gc3VibWl0IGl0LCBkbyB5b3UgdGhp
bmsgSSBzaG91bGQ/DQoNClllcyBwbGVhc2UsIHlvdSBjYW4gaGF2ZSB0aGUgcGF0Y2ggd2l0aCBz
dWJqZWN0IERPIE5PVCBNRVJHRSBpZiB5b3UgZG8gDQpub3Qgd2FudCB0aGF0IHBhdGNoIHRvIGJl
IGluY2x1ZGVkIGluIHRoZSBrZXJuZWwgYW5kIGp1c3QgZm9yIHJlZmVyZW5jZS4NCmJ1dCBpdCB3
b3VsZCBoZWxwIG1lIGluIHVuZGVyc3RhbmRpbmcgeW91ciBzZXR1cA0KDQpUaGFua3MgIQ0KDQo+
IA0KPiBUaGUgYmVoYXZpb3IgaXMgdmVyeSBzaW1pbGFyIHdpdGggdGhpcyBvbmUNCj4gLi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL2V4eW5vczQtaXMvbWVkaWEtZGV2LmMNCj4gDQo+IA0KPj4gVGhh
bmtzLA0KPj4NCj4+IEV1Z2VuDQo+Pg0KPj4+ICsJCX07DQo+Pj4gKwl9Ow0KPj4+DQo+IA0KPiBU
aGFua3MsDQo+IEx1aXMNCj4gDQo=
