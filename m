Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CC33FFAE3
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 09:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347582AbhICHQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 03:16:37 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:42958 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234713AbhICHQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 03:16:36 -0400
X-UUID: 70314ab0c9184b6785df8aa596aa496f-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jkQ8GlgO4m2Y/GUZwg2HJt2/bsPC1xOfAKtALF6ap1s=;
        b=RKtMgiOufNtxSzepG+Hjf3nLO70d5ONn9tiG9NI5sNw4cV8xZGXZdsAeOdeSHrw0nez7/70ltbc6von/zUFDAqblDPFJW29WcH5e1aBMFL8wzyCIHl28chLN7LGf9KWPR9/fSvTAJbHo63UKTzz/NeyLpuHLR2pi3vyKMauz2vY=;
X-UUID: 70314ab0c9184b6785df8aa596aa496f-20210903
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 626104524; Fri, 03 Sep 2021 15:15:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Sep 2021 15:15:30 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 3 Sep 2021 15:15:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 15:15:29 +0800
Message-ID: <ca5acabdae7b0a9c929c662c35dee10a88646f83.camel@mediatek.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From:   moudy ho <moudy.ho@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>
CC:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        Randy Wu <randy.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Hsin-Yi Wang <hsinyi@google.com>
Date:   Fri, 3 Sep 2021 15:15:29 +0800
In-Reply-To: <CAGXv+5GtDNwKpXEnont+UshVrSugQnTPyNF7VF3dVzTX9ruNdw@mail.gmail.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
         <20210824100027.25989-4-moudy.ho@mediatek.com>
         <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
         <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
         <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
         <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
         <CAGXv+5GtDNwKpXEnont+UshVrSugQnTPyNF7VF3dVzTX9ruNdw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA5LTAxIGF0IDE4OjE2ICswODAwLCBDaGVuLVl1IFRzYWkgd3JvdGU6DQo+
IE9uIFdlZCwgU2VwIDEsIDIwMjEgYXQgNTowNCBQTSBtb3VkeSBobyA8bW91ZHkuaG9AbWVkaWF0
ZWsuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiBNb24sIDIwMjEtMDgtMzAgYXQgMTA6MDUg
LTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBBdWcgMzAsIDIwMjEgYXQg
Mjo1OCBBTSBtb3VkeSBobyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29tPg0KPiA+ID4gd3JvdGU6DQo+
ID4gPiA+IA0KPiA+ID4gPiBPbiBUdWUsIDIwMjEtMDgtMjQgYXQgMTM6MDIgLTA1MDAsIFJvYiBI
ZXJyaW5nIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgQXVnIDI0LCAyMDIxIGF0IDA2OjAwOjI1
UE0gKzA4MDAsIE1vdWR5IEhvIHdyb3RlOg0KPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIERU
IGJpbmRpbmcgZG9jdW1lbnQgZm9yIE1lZGlhIERhdGEgUGF0aCAzDQo+ID4gPiA+ID4gPiAoTURQ
MykNCj4gPiA+ID4gPiA+IGEgdW5pdCBpbiBtdWx0aW1lZGlhIHN5c3RlbSB1c2VkIGZvciBzY2Fs
aW5nIGFuZCBjb2xvcg0KPiA+ID4gPiA+ID4gZm9ybWF0DQo+ID4gPiA+ID4gPiBjb252ZXJ0Lg0K
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8bW91ZHku
aG9AbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAgLi4uL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLG1kcDMtY2NvcnIueWFtbCAgIHwgIDU3ICsrKysrDQo+ID4gPiA+
ID4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtcmRtYS55YW1sICAgIHwgMjA3
DQo+ID4gPiA+ID4gPiArKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ICAuLi4vYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1yc3oueWFtbCAgICAgfCAgNjUgKysrKysrDQo+ID4gPiA+
ID4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtd2RtYS55YW1sICAgIHwgIDcx
ICsrKysrKw0KPiA+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXdy
b3QueWFtbCAgICB8ICA3MSArKysrKysNCj4gPiA+ID4gPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQ3
MSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+
ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRw
My0NCj4gPiA+ID4gPiA+IGNjb3JyLnlhbWwNCj4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPiA+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayxtZHAzLQ0KPiA+ID4gPiA+ID4gcmRtYS55YW1sDQo+ID4gPiA+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0DQo+ID4gPiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiA+ID4gPiA+IHJzei55YW1sDQo+ID4gPiA+ID4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiA+ID4gPiA+IHdkbWEueWFtbA0K
PiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtDQo+ID4gPiA+ID4gPiB3
cm90LnlhbWwNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiA+
ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRw
My0NCj4gPiA+ID4gPiA+IGNjb3JyLnlhbWwNCj4gPiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtDQo+ID4gPiA+ID4gPiBjY29y
ci55YW1sDQo+ID4gPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi41OWZkNjhiNDYwMjINCj4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiA+ID4gPiA+ICsrKw0KPiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiA+ID4gPiA+IGNjb3JyLnlhbWwNCj4g
PiA+ID4gPiA+IEBAIC0wLDAgKzEsNTcgQEANCj4gPiA+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiA+ID4gPiA+ICsl
WUFNTCAxLjINCj4gPiA+ID4gPiA+ICstLS0NCj4gPiA+ID4gPiA+ICskaWQ6DQo+ID4gPiA+ID4g
PiANCj4gPiANCj4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9tZWRpYXRlayxtZHAzLWNjb3JyLnlhbWwqX187SXchIUNU
Uk5LQTl3TWcwQVJidyExQzBDaExxemk3WnE4RDJkNF9TNElxQ0VlaTRHWGRneTNfVkNRZzhNZHNK
UDduOFRseGJHeWFqaXB1c2ZIOGhpJA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiArJHNjaGVt
YToNCj4gPiA+ID4gPiA+IA0KPiA+IA0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJO
S0E5d01nMEFSYnchMUMwQ2hMcXppN1pxOEQyZDRfUzRJcUNFZWk0R1hkZ3kzX1ZDUWc4TWRzSlA3
bjhUbHhiR3lhamlwaS1PSW5peCQNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ID4gK3RpdGxlOiBNZWRpYXRlayBNZWRpYSBEYXRhIFBhdGggMyBDQ09SUiBEZXZpY2UgVHJl
ZQ0KPiA+ID4gPiA+ID4gQmluZGluZ3MNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICttYWlu
dGFpbmVyczoNCj4gPiA+ID4gPiA+ICsgIC0gRGFveXVhbiBIdWFuZyA8ZGFveXVhbi5odWFuZ0Bt
ZWRpYXRlay5jb20+DQo+ID4gPiA+ID4gPiArICAtIE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRl
ay5jb20+DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArZGVzY3JpcHRpb246IHwNCj4gPiA+
ID4gPiA+ICsgIE9uZSBvZiBNZWRpYSBEYXRhIFBhdGggMyAoTURQMykgY29tcG9uZW50cyB1c2Vk
IHRvIGRvDQo+ID4gPiA+ID4gPiBjb2xvcg0KPiA+ID4gPiA+ID4gY29ycmVjdGlvbiB3aXRoIDNY
MyBtYXRyaXguDQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArcHJvcGVydGllczoNCj4gPiA+
ID4gPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gPiA+
ID4gKyAgICAgIC0gZW51bToNCj4gPiA+ID4gPiA+ICsgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgz
LW1kcDMtY2NvcnINCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsgIG1lZGlhdGVrLG1kcDMt
aWQ6DQo+ID4gPiA+ID4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQzMg0KPiA+ID4gPiA+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ID4gPiA+ID4gKyAg
ICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiA+ID4gKyAgICAgIEhXIGluZGV4IHRvIGRpc3Rpbmd1
aXNoIHNhbWUgZnVuY3Rpb25hbGl0eSBtb2R1bGVzLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IElm
IHdlIHdhbnRlZCBoL3cgaW5kZXhlcyBpbiBEVCwgd2UnZCBoYXZlIGEgc3RhbmRhcmQNCj4gPiA+
ID4gPiBwcm9wZXJ0eS4NCj4gPiA+ID4gPiBXaHkNCj4gPiA+ID4gPiBkbw0KPiA+ID4gPiA+IHlv
dSBuZWVkIHRoaXM/DQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBJJ20gc29ycnkgbm90
IHF1aXRlIHN1cmUgd2hhdCBIVyBpbmRleGVzIG1lYW5zIChzb21ldGhpbmcgbGlrZQ0KPiA+ID4g
PiBhbGlhc2VzPykNCj4gPiA+IA0KPiA+ID4gSXQgbWVhbnMgd2hhdGV2ZXIgeW91IHNhaWQgaW4g
eW91ciBkZXNjcmlwdGlvbi4NCj4gPiA+IA0KPiA+ID4gQW5kIG5vLCBJJ20gbm90IHN1Z2dlc3Rp
bmcgeW91IHVzZSBhbGlhc2VzLg0KPiA+IA0KPiA+IFNvcnJ5IGZvciB0aGUgaW5hY2N1cmFjeSBk
ZXNjcmliZWQgaGVyZSwgdGhlIGNvbW1lbnQgaSBtZW50aW9uZWQNCj4gPiBiZWZvcmUNCj4gPiBz
aG91bGQgYmUgInN0YW5kYXJkIHByb3BlcnR5IiBpbnN0ZWFkIG9mICJIVyBpbmRleCIuDQo+ID4g
DQo+ID4gPiA+IEl0IHdhcyBvcmlnaW5hbGx5IHVzZWQgdG8gbWFyayBtdWx0aXBsZSBpZGVudGlj
YWwgbW9kdWxlcyBpbg0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gTURQDQo+ID4gPiA+IGRhdGEgcGF0
aCBhbGdvcml0aG0sIHNvIHRoYXQgYXBwcm9wcmlhdGUgcGF0aHMgY2FuIGJlDQo+ID4gPiA+IGR5
bmFtaWNhbGx5DQo+ID4gPiA+IGRpc3BhdGNoZWQuDQo+ID4gPiANCj4gPiA+IElmIHRoZXkgYXJl
IGlkZW50aWNhbCwgdGhlbiB3aHkgZG8geW91IG5lZWQgdG8gZGlzdGluZ3Vpc2ggdGhlbQ0KPiA+
ID4gaW4NCj4gPiA+IERUPw0KPiA+ID4gSWYgdGhlcmUncyBzb21lIGRpZmZlcmVuY2UgeW91IG5l
ZWQgdG8ga25vdyBhYm91dCBzdWNoIGFzDQo+ID4gPiBjb25uZWN0aW9ucw0KPiA+ID4gdG8gb3Ro
ZXIgYmxvY2tzLCB0aGVuIGRlc2NyaWJlIHRoYXQuIEFub3RoZXIgY29tbW9uIGV4YW1wbGUgaXMN
Cj4gPiA+IG5lZWRpbmcNCj4gPiA+IHRvIGtub3cgd2hhdCBiaXRzL3JlZ2lzdGVycyB0byBhY2Nl
c3MgaW4gYSBzeXNjb24gcGhhbmRsZS4gRm9yDQo+ID4gPiB0aGF0LA0KPiA+ID4gbWFrZSB0aGUg
cmVnaXN0ZXIgb2Zmc2V0IG9yIGJpdHMgYmUgYXJncyB0byB0aGUgcGhhbmRsZSBwcm9wZXJ0eS4N
Cj4gPiA+IA0KPiA+ID4gUm9iDQo+ID4gDQo+ID4gSW50ZWdyYXRpbmcgdGhlIHByZXZpb3VzIGRp
c2N1c3Npb24sIG1heWJlIEkgY2FuIHJldmlzZSB0aGUNCj4gPiBkZXNjcmlwdGlvbg0KPiA+IHRv
IHRoZSBmb2xsb3dpbmc6DQo+ID4gICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gICAgICAgVGhlcmUg
bWF5IGJlIG11bHRpcGxlIGJsb2NrcyB3aXRoIHRoZSBzYW1lIGZ1bmN0aW9uIGJ1dA0KPiA+IGRp
ZmZlcmVudA0KPiA+ICAgICAgIGFkZHJlc3NlcyBpbiBNRFAzLiBJbiBvcmRlciB0byBkaXN0aW5n
dWlzaCB0aGUgY29ubmVjdGlvbg0KPiA+IHdpdGgNCj4gPiAgICAgICBvdGhlciBibG9ja3MsIGEg
dW5pcXVlIElEIGlzIG5lZWRlZCB0byBkeW5hbWljYWxseSB1c2Ugb25lIG9yDQo+ID4gICAgICAg
bW9yZSBpZGVudGljYWwgYmxvY2tzIHRvIGltcGxlbWVudCBtdWx0aXBsZSBwaXBlbGluZXMuDQo+
IA0KPiBXaXRoIGRpc3BsYXkgcGlwZWxpbmVzIGl0IGlzIGNvbW1vbiB0byBkZXNjcmliZSB0aGUg
cGlwZWxpbmUgd2l0aCBhbg0KPiBPRg0KPiBncmFwaC4gV2l0aCB0aGUgcGlwZWxpbmUgZHJhd24g
b3V0LCB5b3UgYWxzbyBnZXQgd2F5cyB0byBkZXJpdmUNCj4gaWRlbnRpZmllcnMNCj4gZm9yIG90
aGVyd2lzZSBpZGVudGljYWwgYmxvY2tzLCBzdWNoIGFzIGZyb20gcG9ydCBJRHMuDQo+IA0KPiBT
ZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYWxsd2lubmVyLHN1
bjRpLWExMC0NCj4gZGlzcGxheS1lbmdpbmUueWFtbA0KPiBhbmQgYXJjaC9hcm0vYm9vdC9kdHMv
c3VuOWktYTgwLmR0c2kgZm9yIHN1Y2ggYW4gZXhhbXBsZS4NCj4gDQo+IA0KPiBDaGVuWXUNCg0K
RnJvbSB0aGUgTURQIHJvdXRpbmcgdGFibGUgZGVmaW5lZCBpbiBtdDgxODMtbW1zeXMuaA0KKFt2
NywyLzVdIHNvYzogbWVkaWF0ZWs6IG1tc3lzOiBBZGQgc3VwcG9ydCBmb3IgTURQKSwNCkl0IGNh
biBiZSBzZWVuIHRoYXQgZWFjaCBjb21wb25lbnQgaGFzIGl0cyBvd24gaW5kZXBlbmRlbnQNCm9u
ZS10by1tYW55IG1hcHBpbmcgdGFibGUsIGFuZCBpdHMgbmV4dC1sZXZlbCByZWNlaXZlciBtYXkN
CmhhdmUgaXRzIG93biBtdWx0aXBsZSBpbnB1dHMgYW5kIGlzIGRpZmZpY3VsdCB0byBicmllZmx5
DQpkZXNjcmliZSB0aGVzZSByZWxhdGlvbnNoaXBzLg0KIA0KSW4gYWRkaXRpb24sIGR1ZSB0byBo
YXJkd2FyZSBsaW1pdGF0aW9ucywgUlNaMCAoZm9yIGV4YW1wbGUpDQpjYW5ub3QgYmUgY29tcGxl
dGVseSByZWdhcmRlZCBhcyBSU1oxIGluIG1tc3lzLCBhbmQgbXVzdCBiZQ0KcmVnYXJkZWQgYXMg
YW4gaW5kZXBlbmRlbnQgZW50aXR5LCBhbiBleGFtcGxlIG1lbnRpb25lZA0KaW4gbGluZSAjNjcg
ZnJvbSBtdGstbWRwMy1jbWRxLmMNCihbdjcsNS81XSBtZWRpYTogcGxhdGZvcm06IG10ay1tZHAz
OiBBZGQgTWVkaWF0ZWsgTURQMyBkcml2ZXIpLg0KDQpNb3VkeQ0K

