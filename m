Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3D622315B
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 04:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgGQC4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 22:56:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:62736 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726547AbgGQC4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 22:56:09 -0400
X-UUID: 27f7371c8da245f0b08f325999e74b6c-20200717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wCLKb3yPS8hNZ31S4lTnFBdedwdsPAnHErcvpS6x+ZY=;
        b=REJTMCZX44bfUf6i0OA8SnT1KgLXaknhwWJAPWBkzfZOXNa9kAJnt8OQ2hsEnwBrXxwT6/xWzG1mjh8+hx1El0clyL+kc2o0X2wRaL+Bk5vkSUDw+O1ukwUL6YxnBlF6W5xnKPfN5Fp38aFuHnLeOiOljUEoW9pq+LiLshNOPb4=;
X-UUID: 27f7371c8da245f0b08f325999e74b6c-20200717
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1760332511; Fri, 17 Jul 2020 10:56:02 +0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jul 2020 10:55:59 +0800
Received: from MTKMBS02N2.mediatek.inc ([fe80::f0a0:c826:1c1d:15c4]) by
 mtkmbs02n2.mediatek.inc ([fe80::f0a0:c826:1c1d:15c4%13]) with mapi id
 15.00.1497.000; Fri, 17 Jul 2020 10:55:59 +0800
From:   =?utf-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>
To:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "keiichiw@chromium.org" <keiichiw@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?utf-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        =?utf-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= 
        <Jerry-ch.Chen@mediatek.com>,
        =?utf-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?utf-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        =?utf-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?utf-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= 
        <Frederic.Chen@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
Thread-Topic: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
Thread-Index: AQHWVRQxu0cDZLQO7EuJa9V6uCinf6j+tQMAgAxq4+A=
Date:   Fri, 17 Jul 2020 02:55:59 +0000
Message-ID: <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
In-Reply-To: <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbXRrMDg0MTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0wOWI5ZTVjYy1jN2Q5LTExZWEtOTE5Yy0zODJjNGFjOTFiMDVcYW1lLXRlc3RcMDliOWU1Y2QtYzdkOS0xMWVhLTkxOWMtMzgyYzRhYzkxYjA1Ym9keS50eHQiIHN6PSI0ODM5IiB0PSIxMzIzOTQyODE1ODM1NDI2MzEiIGg9IjdJU293RGJRakxlVUxtNFBYM2pXVzFWbDdIVT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.21.101.239]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQ2h1bi1LdWFuZywNCg0KU2luY2UgcGh5IGRyaXZlciBpcyBub3QgYmVsb25nIHRvIFY0TDIg
c2NvcGUNCg0KU2hvdWxkIEkgbmVlZCB0byB1cHN0ZWFtIDgxODMgbWlwaSBwaHkgZHJpdmVyIHdp
dGggbmV3IGEgcGF0Y2ggb3RoZXIgdGhhbiB0aGlzIG9uZSA/DQoNCkJScw0KTG91aXMNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENodW4tS3VhbmcgSHUgW21haWx0bzpjaHVu
a3VhbmcuaHVAa2VybmVsLm9yZ10gDQpTZW50OiBUaHVyc2RheSwgSnVseSA5LCAyMDIwIDk6MTMg
UE0NClRvOiBMb3VpcyBLdW8gKOmDreW+t+WvpykNCkNjOiBoYW5zLnZlcmt1aWxAY2lzY28uY29t
OyBsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbTsgVG9tYXN6IEZpZ2E7
IGtlaWljaGl3QGNocm9taXVtLm9yZzsgTWF0dGhpYXMgQnJ1Z2dlcjsgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgU2VhbiBDaGVuZyAo6YSt5piH5byY
KTsgc3J2X2hldXBzdHJlYW07IEplcnJ5LWNoIENoZW4gKOmZs+aVrOaGsik7IEp1bmdvIExpbiAo
5p6X5piO5L+KKTsgU2ogSHVhbmcgKOm7g+S/oeeSiyk7IHl1emhhb0BjaHJvbWl1bS5vcmc7IG1v
ZGVyYXRlZCBsaXN0OkFSTS9NZWRpYXRlayBTb0Mgc3VwcG9ydDsgendpc2xlckBjaHJvbWl1bS5v
cmc7IENocmlzdGllIFl1ICjmuLjpm4Xmg6ApOyBGcmVkZXJpYyBDaGVuICjpmbPkv4rlhYMpOyBM
aW51eCBBUk07IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtSRkMg
UEFUQ0ggVjcgMS8zXSBtZWRpYTogcGxhdGZvcm06IG10ay1pc3A6IEFkZCBNZWRpYXRlayBzZW5z
b3IgaW50ZXJmYWNlIGRyaXZlcg0KDQpIaSwgTG91aXM6DQoNCkxvdWlzIEt1byA8bG91aXMua3Vv
QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ35pyIOOaXpSDpgLHkuIkg5LiL5Y2INjo0MeWvq+mB
k++8mg0KPg0KPiBUaGlzIHBhdGNoIGFkZHMgTWVkaWF0ZWsncyBzZW5zb3IgaW50ZXJmYWNlIGRy
aXZlci4gU2Vuc29yIGludGVyZmFjZSANCj4gZHJpdmVyIGlzIGEgTUlQSS1DU0kyIGhvc3QgZHJp
dmVyLCBuYW1lbHksIGEgSFcgY2FtZXJhIGludGVyZmFjZSBjb250cm9sbGVyLg0KPiBJdCBzdXBw
b3J0IGEgd2lkZWx5IGFkb3B0ZWQsIHNpbXBsZSwgaGlnaC1zcGVlZCBwcm90b2NvbCBwcmltYXJp
bHkgDQo+IGludGVuZGVkIGZvciBwb2ludC10by1wb2ludCBpbWFnZSBhbmQgdmlkZW8gdHJhbnNt
aXNzaW9uIGJldHdlZW4gDQo+IGNhbWVyYXMgYW5kIGhvc3QgZGV2aWNlcy4gVGhlIG10ay1pc3Ag
ZGlyZWN0b3J5IHdpbGwgY29udGFpbiBkcml2ZXJzIA0KPiBmb3IgbXVsdGlwbGUgSVAgYmxvY2tz
IGZvdW5kIGluIE1lZGlhdGVrIElTUCBzeXN0ZW0uIEl0IHdpbGwgaW5jbHVkZSANCj4gSVNQIFBh
c3MgMSBkcml2ZXIsIHNlbnNvciBpbnRlcmZhY2UgZHJpdmVyLCBESVAgZHJpdmVyIGFuZCBmYWNl
IGRldGVjdGlvbiBkcml2ZXIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IExvdWlzIEt1byA8bG91aXMu
a3VvQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL01ha2Vm
aWxlICAgICAgICAgICAgICAgfCAgICAxICsNCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWlzcC9LY29uZmlnICAgICAgICB8ICAgMTggKw0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstaXNwL01ha2VmaWxlICAgICAgIHwgICAgMyArDQo+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRr
LWlzcC9zZW5pbmYvTWFrZWZpbGUgICAgfCAgICA3ICsNCj4gIC4uLi9wbGF0Zm9ybS9tdGstaXNw
L3NlbmluZi9tdGtfc2VuaW5mLmMgICAgICB8ICA5NzQgKysrKysrKysrKysNCj4gIC4uLi9wbGF0
Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX2RwaHkuYyB8ICAzNTMgKysrKw0KDQpJIHRo
aW5rIHBoeSBkcml2ZXIgc2hvdWxkIGJlIHBsYWNlZCBpbiBkcml2ZXJzL3BoeS9tZWRpYXRlayBh
bmQgc2VwYXJhdGUgcGh5IGRyaXZlciB0byBhbiBpbmRlcGVuZGVudCBwYXRjaC4NCg0KPiAgLi4u
L3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcmVnLmggIHwgMTQ5MSArKysrKysr
KysrKysrKysrKw0KPiAgLi4uL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcnhfcmVnLmggICAg
ICAgIHwgIDUxNSArKysrKysNCj4gIDggZmlsZXMgY2hhbmdlZCwgMzM2MiBpbnNlcnRpb25zKCsp
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL0tj
b25maWcNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1p
c3AvTWFrZWZpbGUNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay1pc3Avc2VuaW5mL01ha2VmaWxlDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mLmMNCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCANCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2Vu
aW5mX2RwaHkuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPiBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcmVnLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCANCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX3J4
X3JlZy5oDQo+DQoNCltzbmlwXQ0KDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4g
KyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L29mX2dy
YXBoLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+DQoNCk5vIGlycSBoYW5kbGVyLCBz
byByZW1vdmUgdGhpcy4NCg0KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvdmlkZW9kZXYyLmg+DQo+ICsjaW5jbHVkZSA8bWVkaWEv
djRsMi1hc3luYy5oPg0KPiArI2luY2x1ZGUgPG1lZGlhL3Y0bDItY3RybHMuaD4NCj4gKyNpbmNs
dWRlIDxtZWRpYS92NGwyLWV2ZW50Lmg+DQo+ICsjaW5jbHVkZSA8bWVkaWEvdjRsMi1md25vZGUu
aD4NCj4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLXN1YmRldi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4
L3BoeS9waHkuaD4NCj4gKyNpbmNsdWRlICJtdGtfc2VuaW5mX3JlZy5oIg0KPiArDQoNCltzbmlw
XQ0KDQo+ICsNCj4gK3N0YXRpYyBpbnQgc2VuaW5mX3NldF9jdHJsKHN0cnVjdCB2NGwyX2N0cmwg
KmN0cmwpIHsNCj4gKyAgICAgICBzdHJ1Y3QgbXRrX3NlbmluZiAqcHJpdiA9IGNvbnRhaW5lcl9v
ZihjdHJsLT5oYW5kbGVyLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgbXRrX3NlbmluZiwgDQo+ICtjdHJsX2hhbmRsZXIpOw0KPiArDQo+ICsg
ICAgICAgc3dpdGNoIChjdHJsLT5pZCkgew0KPiArICAgICAgIGNhc2UgVjRMMl9DSURfVEVTVF9Q
QVRURVJOOg0KPiArICAgICAgICAgICAgICAgaWYgKGN0cmwtPnZhbCA9PSBURVNUX0dFTl9QQVRU
RVJOKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gc2VuaW5mX2VuYWJsZV90ZXN0
X3BhdHRlcm4ocHJpdik7DQoNCldpdGhvdXQgdGhpcywgdGhpcyBkcml2ZXIgc3RpbGwgd29ya3Ms
IHNvIG1vdmUgdGhpcyB0byBhbiBpbmRlcGVuZGVudCBwYXRjaC4NCg0KPiArICAgICAgICAgICAg
ICAgZWxzZSBpZiAoY3RybC0+dmFsID09IFRFU1RfRFVNUF9ERUJVR19JTkZPKQ0KPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gc2VuaW5mX2R1bXBfZGVidWdfaW5mbyhwcml2KTsNCg0K
RGl0dG8uDQoNCj4gKyAgICAgICAgICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAgICAgfQ0KPiArDQo+ICsgICAgICAgcmV0dXJuIDA7
DQo+ICt9DQo+ICsNCg0KW3NuaXBdDQoNCj4gKw0KPiArI2lmZGVmIENPTkZJR19PRg0KPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX21pcGlfZHBoeV9vZl9tYXRjaFtdID0g
ew0KPiArICAgICAgIHsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtbWlwaV9kcGh5In0s
DQoNCldoZXJlIGlzIHRoZSBkZWZpbml0aW9uIG9mICJtZWRpYXRlayxtdDgxODMtbWlwaV9kcGh5
Ij8NCg0KUmVnYXJkcywNCkNodW4tS3VhbmcuDQoNCj4gKyAgICAgICB7fSwNCj4gK307DQo+ICtN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfbWlwaV9kcGh5X29mX21hdGNoKTsgI2VuZGlmDQo+
ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1pcGlfZHBoeV9wZHJ2ID0gew0K
PiArICAgICAgIC5wcm9iZSAgPSBtaXBpX2RwaHlfcHJvYmUsDQo+ICsgICAgICAgLmRyaXZlciA9
IHsNCj4gKyAgICAgICAgICAgICAgIC5uYW1lICAgPSAibWlwaV9kcGh5IiwNCj4gKyAgICAgICAg
ICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihtdGtfbWlwaV9kcGh5X29mX21h
dGNoKSwNCj4gKyAgICAgICB9LA0KPiArfTsNCj4gKw0KPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZl
cihtaXBpX2RwaHlfcGRydik7DQo+ICsNCg==
