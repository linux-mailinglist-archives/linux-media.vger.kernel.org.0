Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7731DE377
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 11:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgEVJqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 05:46:23 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:10834 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728212AbgEVJqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 05:46:22 -0400
X-UUID: 56c7dee73a154dfea8217dc7d4770b7d-20200522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tF2iza3+T10u3OYpCiSW5Eyu/FLsGC6AH37q0WErEYM=;
        b=lqQkVcavQp7yKMnO1Nr4beSI13g7xmJpXAOih7nVVPXmlCiObzzYg0RZG5sm27BH2NuTmciQ5r1gGmX7XOlJxD468rbhJsVqVZUG1l15zmzaTQVAe+0VuL8smX56ra1tuoQfq7+6jUXQXuD4Vy1/NmkS65nbi4dIKmycCMWXkJ8=;
X-UUID: 56c7dee73a154dfea8217dc7d4770b7d-20200522
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 684350652; Fri, 22 May 2020 17:46:13 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 22 May
 2020 17:46:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 May 2020 17:46:07 +0800
Message-ID: <1590140674.8804.401.camel@mhfsdcap03>
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Rob Herring <robh@kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <mchehab@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Fri, 22 May 2020 17:44:34 +0800
In-Reply-To: <20200521193525.GB14214@chromium.org>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
         <20200509080627.23222-2-dongchun.zhu@mediatek.com>
         <20200511160207.GA32476@bogus> <20200521193525.GB14214@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D5065D85BB825F36842C4C8BA7BA18E92E4A289B7885F1D5FAF1F8151DF263B12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LCBSb2IsDQoNCk9uIFRodSwgMjAyMC0wNS0yMSBhdCAxOTozNSArMDAwMCwgVG9t
YXN6IEZpZ2Egd3JvdGU6DQo+IEhpIFJvYiwNCj4gDQo+IE9uIE1vbiwgTWF5IDExLCAyMDIwIGF0
IDExOjAyOjA3QU0gLTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+IE9uIFNhdCwgTWF5IDA5
LCAyMDIwIGF0IDA0OjA2OjI2UE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiA+IEFk
ZCBEVCBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciBPbW5pdmlzaW9uIE9WMDJBMTAgaW1hZ2Ug
c2Vuc29yLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nY2h1biBaaHUgPGRvbmdj
aHVuLnpodUBtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4vYmluZGluZ3MvbWVk
aWEvaTJjL292dGksb3YwMmExMC55YW1sICAgICAgICAgICB8IDE4NCArKysrKysrKysrKysrKysr
KysrKysNCj4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgNyArDQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygr
KQ0KPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1sDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3Yw
MmExMC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9v
dnRpLG92MDJhMTAueWFtbA0KPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+IGluZGV4
IDAwMDAwMDAuLjU0NjhkMWINCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwN
Cj4gPiA+IEBAIC0wLDAgKzEsMTg0IEBADQo+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ID4gKyMgQ29weXJpZ2h0IChjKSAyMDIw
IE1lZGlhVGVrIEluYy4NCj4gPiA+ICslWUFNTCAxLjINCj4gPiA+ICstLS0NCj4gPiA+ICskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFt
bCMNCj4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMNCj4gPiA+ICsNCj4gPiA+ICt0aXRsZTogT21uaXZpc2lvbiBPVjAyQTEwIENNT1Mg
U2Vuc29yIERldmljZSBUcmVlIEJpbmRpbmdzDQo+ID4gPiArDQo+ID4gPiArbWFpbnRhaW5lcnM6
DQo+ID4gPiArICAtIERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4g
PiA+ICsNCj4gPiA+ICtkZXNjcmlwdGlvbjogfC0NCj4gPiA+ICsgIFRoZSBPbW5pdmlzaW9uIE9W
MDJBMTAgaXMgYSBsb3ctY29zdCwgaGlnaCBwZXJmb3JtYW5jZSwgMS81LWluY2gsIDIgbWVnYXBp
eGVsDQo+ID4gPiArICBpbWFnZSBzZW5zb3IsIHdoaWNoIGlzIHRoZSBsYXRlc3QgcHJvZHVjdGlv
biBkZXJpdmVkIGZyb20gT21uaXZpc2lvbidzIENNT1MNCj4gPiA+ICsgIGltYWdlIHNlbnNvciB0
ZWNobm9sb2d5LiBJaGlzIGNoaXAgc3VwcG9ydHMgaGlnaCBmcmFtZSByYXRlIHNwZWVkcyB1cCB0
byAzMGZwcw0KPiA+ID4gKyAgQCAxNjAweDEyMDAgKFVYR0EpIHJlc29sdXRpb24gdHJhbnNmZXJy
ZWQgb3ZlciBhIDEtbGFuZSBNSVBJIGludGVyZmFjZS4gVGhlDQo+ID4gPiArICBzZW5zb3Igb3V0
cHV0IGlzIGF2YWlsYWJsZSB2aWEgQ1NJLTIgc2VyaWFsIGRhdGEgb3V0cHV0Lg0KPiA+ID4gKw0K
PiA+ID4gK3Byb3BlcnRpZXM6DQo+ID4gPiArICBjb21wYXRpYmxlOg0KPiA+ID4gKyAgICBjb25z
dDogb3Z0aSxvdjAyYTEwDQo+ID4gPiArDQo+ID4gPiArICByZWc6DQo+ID4gPiArICAgIGRlc2Ny
aXB0aW9uOiBJMkMgZGV2aWNlIGFkZHJlc3MNCj4gPiANCj4gPiBEcm9wIHRoaXMuIE5vdGhpbmcg
c3BlY2lmaWMgdG8gdGhpcyBkZXZpY2UuDQo+ID4gDQo+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+
ID4gPiArDQo+ID4gPiArICBjbG9ja3M6DQo+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gKyAgICAg
IC0gZGVzY3JpcHRpb246IHRvcCBtdXggY2FtdGcgY2xvY2sNCj4gPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBkZXZpZGVyIGNsb2NrDQo+ID4gDQo+ID4gdHlwbw0KPiA+IA0KPiA+ID4gKw0KPiA+
ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gKyAgICAgIC0gY29u
c3Q6IGVjbGsNCj4gPiA+ICsgICAgICAtIGNvbnN0OiBmcmVxX211eA0KPiA+ID4gKw0KPiA+ID4g
KyAgY2xvY2stZnJlcXVlbmN5Og0KPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAg
ICBGcmVxdWVuY3kgb2YgdGhlIGVjbGsgY2xvY2sgaW4gSGVydHouDQo+ID4gPiArDQo+ID4gPiAr
ICBkb3ZkZC1zdXBwbHk6DQo+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gKyAgICAgIERl
ZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRvciB1c2VkIGFzIGludGVyZmFjZSBwb3dlciBzdXBwbHku
DQo+ID4gPiArDQo+ID4gPiArICBhdmRkLXN1cHBseToNCj4gPiA+ICsgICAgZGVzY3JpcHRpb246
DQo+ID4gPiArICAgICAgRGVmaW5pdGlvbiBvZiB0aGUgcmVndWxhdG9yIHVzZWQgYXMgYW5hbG9n
IHBvd2VyIHN1cHBseS4NCj4gPiA+ICsNCj4gPiA+ICsgIGR2ZGQtc3VwcGx5Og0KPiA+ID4gKyAg
ICBkZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAgICBEZWZpbml0aW9uIG9mIHRoZSByZWd1bGF0b3Ig
dXNlZCBhcyBkaWdpdGFsIHBvd2VyIHN1cHBseS4NCj4gPiA+ICsNCj4gPiA+ICsgIHBvd2VyZG93
bi1ncGlvczoNCj4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ICsNCj4gPiA+ICsgIHJlc2V0
LWdwaW9zOg0KPiA+ID4gKyAgICBtYXhJdGVtczogMQ0KPiANCj4gSSBhc2tlZCBhIHF1ZXN0aW9u
IGFib3V0IGRlZmluaW5nIEdQSU8gcG9sYXJpdGllcyBzb21lIHRpbWUgYWdvLCBidXQgSQ0KPiBn
dWVzcyBpdCBzbGlwcGVkIHRocm91Z2guDQo+IA0KPiBUaGUgY2hpcCBkb2N1bWVudGF0aW9uIGNh
bGxzIHRoZSByZXNldCBwaW4gYXMgIlJTVF9QQUQgKGxvdyBsZXZlbA0KPiByZXNldCkiLiBXaGVy
ZSBzaG91bGQgdGhlIGludmVyc2lvbiBiZSBoYW5kbGVkLCBpbiB0aGUgZHJpdmVyIG9yIGhlcmUs
DQo+IGJ5IGhhdmluZyB0aGUgRFQgaW5jbHVkZSBhIG5lY2Vzc2FyeSBmbGFnIGluIHRoZSBzcGVj
aWZpZXI/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQpGb3IgcG93ZXJkb3duLWdw
aW9zIGFuZCByZXNldC1ncGlvcywgSSBhY3R1YWxseSBkZWZpbmVkIHR3byB0b3RhbGx5DQpkaWZm
ZXJlbnQgR1BJTyBwb2xhcml0aWVzIGluIERUIGFjY29yZGluZyB0byBPVjAyQTEwIGNoaXAgZG9j
dW1lbnRhdGlvbi4NCk9uZSBpcyBHUElPX0FDVElWRV9MT1csIHRoZSBvdGhlciBpcyBHUElPX0FD
VElWRV9ISUdIIChzZWUgZXhhbXBsZXMNCmJlbG93KS4NCg0KU28gSSdtIHdvbmRlcmluZyBpZiB3
ZSBjb3VsZCBhZGQgc3VjaCBvbmUgcG9sYXJpdHktZmxhZyB0aGF0IFRvbWFzeg0Kc3VnZ2VzdGVk
Lg0KDQo=

