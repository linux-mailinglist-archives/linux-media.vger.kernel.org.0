Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8B2202280
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2020 10:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgFTIAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 04:00:05 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:53834 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725835AbgFTIAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 04:00:04 -0400
X-UUID: 5609df74216e4ea4a95d363fe9f82b09-20200620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LuqsD+9fiN2lbFcHMP7DdOurh+jzglg3Fw7+z8J7wlk=;
        b=D4QugH2KtbTPIDAo/1AKY0beehS7jeHrNHQzdcRxFjyhimScv9Z9akH2ZvErns9qbRVqSsnwFRfd3li3eoabtLWz2Uy1tm3XCpUBcz9u7/WxgrfyJ5nKA+uB5QzPpi7u8Ezlil7RJvrLC/BDWsIKAIH/cIycz2WGpeEX4J6Hg48=;
X-UUID: 5609df74216e4ea4a95d363fe9f82b09-20200620
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1327748995; Sat, 20 Jun 2020 15:59:57 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 20 Jun
 2020 15:59:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Jun 2020 15:59:54 +0800
Message-ID: <1592639841.8804.720.camel@mhfsdcap03>
Subject: Re: [PATCH V10 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Sat, 20 Jun 2020 15:57:21 +0800
In-Reply-To: <20200618191332.GB73379@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
         <20200615122937.18965-2-dongchun.zhu@mediatek.com>
         <20200618191332.GB73379@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 63B8FA9AB489015592CF4E8009CC603B34CB263B9B48686989F7BDC7D8E93AB32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMC0wNi0x
OCBhdCAxOToxMyArMDAwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IEhpIERvbmdjaHVuLA0KPiAN
Cj4gT24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMDg6Mjk6MzZQTSArMDgwMCwgRG9uZ2NodW4gWmh1
IHdyb3RlOg0KPiA+IEFkZCBEVCBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciBPbW5pdmlzaW9u
IE9WMDJBMTAgaW1hZ2Ugc2Vuc29yLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVu
IFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRp
bmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbCAgICAgICAgICAgfCAxNzEgKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA3ICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNzggaW5zZXJ0aW9u
cygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbA0KPiA+IA0KPiANCj4gVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2guIFBsZWFzZSBzZWUgbXkgY29tbWVudHMgaW5saW5lLg0KPiANCj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9v
dnRpLG92MDJhMTAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGlu
ZGV4IDAwMDAwMDAuLmY4NGJlMWINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbA0K
PiA+IEBAIC0wLDAgKzEsMTcxIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArIyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVkaWFU
ZWsgSW5jLg0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1sIw0KPiA+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiAr
DQo+ID4gK3RpdGxlOiBPbW5pdmlzaW9uIE9WMDJBMTAgQ01PUyBTZW5zb3IgRGV2aWNlIFRyZWUg
QmluZGluZ3MNCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gRG9uZ2NodW4gWmh1
IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246IHwt
DQo+ID4gKyAgVGhlIE9tbml2aXNpb24gT1YwMkExMCBpcyBhIGxvdy1jb3N0LCBoaWdoIHBlcmZv
cm1hbmNlLCAxLzUtaW5jaCwgMiBtZWdhcGl4ZWwNCj4gPiArICBpbWFnZSBzZW5zb3IsIHdoaWNo
IGlzIHRoZSBsYXRlc3QgcHJvZHVjdGlvbiBkZXJpdmVkIGZyb20gT21uaXZpc2lvbidzIENNT1MN
Cj4gPiArICBpbWFnZSBzZW5zb3IgdGVjaG5vbG9neS4gSWhpcyBjaGlwIHN1cHBvcnRzIGhpZ2gg
ZnJhbWUgcmF0ZSBzcGVlZHMgdXAgdG8gMzBmcHMNCj4gPiArICBAIDE2MDB4MTIwMCAoVVhHQSkg
cmVzb2x1dGlvbiB0cmFuc2ZlcnJlZCBvdmVyIGEgMS1sYW5lIE1JUEkgaW50ZXJmYWNlLiBUaGUN
Cj4gPiArICBzZW5zb3Igb3V0cHV0IGlzIGF2YWlsYWJsZSB2aWEgQ1NJLTIgc2VyaWFsIGRhdGEg
b3V0cHV0Lg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+
ICsgICAgY29uc3Q6IG92dGksb3YwMmExMA0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBt
YXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBpdGVtczoNCj4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogdG9wIG11eCBjYW10ZyBjbG9jaw0KPiA+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBkaXZpZGVyIGNsb2NrDQo+ID4gKw0KPiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+
ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IGVjbGsNCj4gPiArICAgICAgLSBjb25z
dDogZnJlcV9tdXgNCj4gPiArDQo+ID4gKyAgY2xvY2stZnJlcXVlbmN5Og0KPiA+ICsgICAgZGVz
Y3JpcHRpb246DQo+ID4gKyAgICAgIEZyZXF1ZW5jeSBvZiB0aGUgZWNsayBjbG9jayBpbiBIZXJ0
ei4NCj4gPiArDQo+ID4gKyAgZG92ZGQtc3VwcGx5Og0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+
ID4gKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRvciB1c2VkIGFzIERpZ2l0YWwgSS9P
IHZvbHRhZ2Ugc3VwcGx5Lg0KPiA+ICsNCj4gPiArICBhdmRkLXN1cHBseToNCj4gPiArICAgIGRl
c2NyaXB0aW9uOg0KPiA+ICsgICAgICBEZWZpbml0aW9uIG9mIHRoZSByZWd1bGF0b3IgdXNlZCBh
cyBBbmFsb2cgdm9sdGFnZSBzdXBwbHkuDQo+ID4gKw0KPiA+ICsgIGR2ZGQtc3VwcGx5Og0KPiA+
ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRv
ciB1c2VkIGFzIERpZ2l0YWwgY29yZSB2b2x0YWdlIHN1cHBseS4NCj4gPiArDQo+ID4gKyAgcG93
ZXJkb3duLWdwaW9zOg0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIE11c3QgYmUg
dGhlIGRldmljZSB0cmVlIGlkZW50aWZpZXIgb2YgdGhlIEdQSU8gY29ubmVjdGVkIHRvIHRoZQ0K
PiA+ICsgICAgICBQRF9QQUQgcGluLiBUaGlzIHBpbiBpcyB1c2VkIHRvIHBsYWNlIHRoZSBPVjAy
QTEwIGludG8gU3RhbmRieSBtb2RlDQo+ID4gKyAgICAgIG9yIFNodXRkb3duIG1vZGUuIEFzIHRo
ZSBsaW5lIGlzIGFjdGl2ZSBsb3csIGl0IHNob3VsZCBiZQ0KPiA+ICsgICAgICBtYXJrZWQgR1BJ
T19BQ1RJVkVfTE9XLg0KPiANCj4gVGhpcyBsaW5lIGlzIG5vdCBhY3RpdmUgbG93LiBJdCBuZWVk
cyB0byBiZSBoaWdoIGZvciB0aGUgcG93ZXJkb3duIG1vZGUNCj4gdG8gYmUgYWN0aXZlLg0KPiAN
Cg0KU29ycnksIEkgbWFkZSBhIG1pc3VuZGVyc3RhbmRpbmcgb2YgdGhlIHJlYWwgbWVhbmluZyBv
ZiAnbGluZSBhY3RpdmUnLg0KRm9yIFBEX1BBRCBwaW4sICdlZmZlY3RpdmUnIG1lYW5zICdzZW5z
b3IgaXMgc2h1dCBkb3duJy4NClllcywgaXQncyBhICdzaHV0IGRvd24nIHNpZ25hbCwgbm90IGEg
J2VuYWJsZScgc2lnbmFsLg0KDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBy
ZXNldC1ncGlvczoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBNdXN0IGJlIHRo
ZSBkZXZpY2UgdHJlZSBpZGVudGlmaWVyIG9mIHRoZSBHUElPIGNvbm5lY3RlZCB0byB0aGUNCj4g
PiArICAgICAgUlNUX1BEIHBpbi4gSWYgc3BlY2lmaWVkLCBpdCB3aWxsIGJlIGFzc2VydGVkIGR1
cmluZyBkcml2ZXIgcHJvYmUuDQo+ID4gKyAgICAgIEFzIHRoZSBsaW5lIGlzIGFjdGl2ZSBoaWdo
LCBpdCBzaG91bGQgYmUgbWFya2VkIEdQSU9fQUNUSVZFX0hJR0guDQo+IA0KPiBUaGlzIGxpbmUg
aXMgbm90IGFjdGl2ZSBoaWdoLiBJdCBuZWVkcyB0byBiZSBsb3cgZm9yIHRoZSByZXNldCB0byBi
ZQ0KPiBhY3RpdmUuDQo+IA0KDQpGaXhlZCBpbiBuZXh0IHJlbGVhc2UuDQoNCj4gQmVzdCByZWdh
cmRzLA0KPiBUb21hc3oNCg0K

