Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471603FD50C
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243029AbhIAIPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:15:33 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:43940 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S242870AbhIAIPc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:15:32 -0400
X-UUID: c9345401f09e4879a2d8af68d2165922-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=aQczDb7Ur1z09Hhq0WSHuu1d90/3MPLqR+HcJ6VmReA=;
        b=OpJzlFEBDHvco0jaGOLjkEZV1r2rjRwS/HtlWNHdHfcTKrB9vld4Lyruz/s8QC6Rcj2sGtgJ+yAcjw7s+8tWDNF15VYHI/Kvr0s8JLzKZnMaO2QVT92dgcI77+P1pTNxiZA6Ei91YUY08rkT3BDGC+jaUVCWsFNtov/eAFDpRjs=;
X-UUID: c9345401f09e4879a2d8af68d2165922-20210901
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1051800409; Wed, 01 Sep 2021 16:14:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 16:14:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:14:30 +0800
Message-ID: <39cec599a65eeb142cb7e729f954098a25652b2b.camel@mediatek.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
From:   moudy ho <moudy.ho@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Jernej Skrabec" <jernej.skrabec@siol.net>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "Alexandre Courbot" <acourbot@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Hsin-Yi Wang <hsinyi@google.com>
Date:   Wed, 1 Sep 2021 16:14:30 +0800
In-Reply-To: <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
         <20210824100027.25989-4-moudy.ho@mediatek.com>
         <YSU0TrfFCsaI1TqV@robh.at.kernel.org>
         <0092244acd520acac81208b8863b15fba58f4193.camel@mediatek.com>
         <CAL_JsqJ_cProt35pdd2MjoHsSKtd+0n1Dwq6ooV+CJH5sfOFWg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTA4LTMwIGF0IDEwOjA1IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gTW9uLCBBdWcgMzAsIDIwMjEgYXQgMjo1OCBBTSBtb3VkeSBobyA8bW91ZHkuaG9AbWVkaWF0
ZWsuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiBUdWUsIDIwMjEtMDgtMjQgYXQgMTM6MDIg
LTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+ID4gT24gVHVlLCBBdWcgMjQsIDIwMjEgYXQg
MDY6MDA6MjVQTSArMDgwMCwgTW91ZHkgSG8gd3JvdGU6DQo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRk
cyBEVCBiaW5kaW5nIGRvY3VtZW50IGZvciBNZWRpYSBEYXRhIFBhdGggMw0KPiA+ID4gPiAoTURQ
MykNCj4gPiA+ID4gYSB1bml0IGluIG11bHRpbWVkaWEgc3lzdGVtIHVzZWQgZm9yIHNjYWxpbmcg
YW5kIGNvbG9yIGZvcm1hdA0KPiA+ID4gPiBjb252ZXJ0Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0t
DQo+ID4gPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1jY29yci55YW1sICAg
fCAgNTcgKysrKysNCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJk
bWEueWFtbCAgICB8IDIwNw0KPiA+ID4gPiArKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIC4u
Li9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJzei55YW1sICAgICB8ICA2NSArKysrKysN
Cj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXdkbWEueWFtbCAgICB8
ICA3MSArKysrKysNCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXdy
b3QueWFtbCAgICB8ICA3MSArKysrKysNCj4gPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNDcxIGlu
c2VydGlvbnMoKykNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiA+ID4g
Y2NvcnIueWFtbA0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJkbWEueWFtbA0K
PiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJzei55YW1sDQo+ID4gPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL21lZGlhdGVrLG1kcDMtd2RtYS55YW1sDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPiA+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLG1kcDMtd3JvdC55YW1sDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMt
DQo+ID4gPiA+IGNjb3JyLnlhbWwNCj4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy0NCj4gPiA+ID4gY2NvcnIueWFtbA0KPiA+ID4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU5ZmQ2
OGI0NjAyMg0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLQ0KPiA+ID4gPiBjY29y
ci55YW1sDQo+ID4gPiA+IEBAIC0wLDAgKzEsNTcgQEANCj4gPiA+ID4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ID4gPiArJVlB
TUwgMS4yDQo+ID4gPiA+ICstLS0NCj4gPiA+ID4gKyRpZDoNCj4gPiA+ID4gDQpodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVk
aWF0ZWssbWRwMy1jY29yci55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchMUMwQ2hMcXppN1px
OEQyZDRfUzRJcUNFZWk0R1hkZ3kzX1ZDUWc4TWRzSlA3bjhUbHhiR3lhamlwdXNmSDhoaSQNCj4g
PiA+ID4gDQo+ID4gPiA+ICskc2NoZW1hOg0KPiA+ID4gPiANCmh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJ
dyEhQ1RSTktBOXdNZzBBUmJ3ITFDMENoTHF6aTdacThEMmQ0X1M0SXFDRWVpNEdYZGd5M19WQ1Fn
OE1kc0pQN244VGx4Ykd5YWppcGktT0luaXgkDQo+ID4gPiA+IA0KPiA+ID4gPiArDQo+ID4gPiA+
ICt0aXRsZTogTWVkaWF0ZWsgTWVkaWEgRGF0YSBQYXRoIDMgQ0NPUlIgRGV2aWNlIFRyZWUgQmlu
ZGluZ3MNCj4gPiA+ID4gKw0KPiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ICsgIC0gRGFv
eXVhbiBIdWFuZyA8ZGFveXVhbi5odWFuZ0BtZWRpYXRlay5jb20+DQo+ID4gPiA+ICsgIC0gTW91
ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gKw0KPiA+ID4gPiArZGVzY3Jp
cHRpb246IHwNCj4gPiA+ID4gKyAgT25lIG9mIE1lZGlhIERhdGEgUGF0aCAzIChNRFAzKSBjb21w
b25lbnRzIHVzZWQgdG8gZG8gY29sb3INCj4gPiA+ID4gY29ycmVjdGlvbiB3aXRoIDNYMyBtYXRy
aXguDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3Byb3BlcnRpZXM6DQo+ID4gPiA+ICsgIGNvbXBhdGli
bGU6DQo+ID4gPiA+ICsgICAgaXRlbXM6DQo+ID4gPiA+ICsgICAgICAtIGVudW06DQo+ID4gPiA+
ICsgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLW1kcDMtY2NvcnINCj4gPiA+ID4gKw0KPiA+ID4g
PiArICBtZWRpYXRlayxtZHAzLWlkOg0KPiA+ID4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4g
PiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiA+ID4gKyAgICAgIEhXIGluZGV4IHRvIGRpc3Rp
bmd1aXNoIHNhbWUgZnVuY3Rpb25hbGl0eSBtb2R1bGVzLg0KPiA+ID4gDQo+ID4gPiBJZiB3ZSB3
YW50ZWQgaC93IGluZGV4ZXMgaW4gRFQsIHdlJ2QgaGF2ZSBhIHN0YW5kYXJkIHByb3BlcnR5Lg0K
PiA+ID4gV2h5DQo+ID4gPiBkbw0KPiA+ID4geW91IG5lZWQgdGhpcz8NCj4gPiA+IA0KPiA+IA0K
PiA+IEknbSBzb3JyeSBub3QgcXVpdGUgc3VyZSB3aGF0IEhXIGluZGV4ZXMgbWVhbnMgKHNvbWV0
aGluZyBsaWtlDQo+ID4gYWxpYXNlcz8pDQo+IA0KPiBJdCBtZWFucyB3aGF0ZXZlciB5b3Ugc2Fp
ZCBpbiB5b3VyIGRlc2NyaXB0aW9uLg0KPiANCj4gQW5kIG5vLCBJJ20gbm90IHN1Z2dlc3Rpbmcg
eW91IHVzZSBhbGlhc2VzLg0KDQpTb3JyeSBmb3IgdGhlIGluYWNjdXJhY3kgZGVzY3JpYmVkIGhl
cmUsIHRoZSBjb21tZW50IGkgbWVudGlvbmVkIGJlZm9yZQ0Kc2hvdWxkIGJlICJzdGFuZGFyZCBw
cm9wZXJ0eSIgaW5zdGVhZCBvZiAiSFcgaW5kZXgiLg0KDQo+ID4gSXQgd2FzIG9yaWdpbmFsbHkg
dXNlZCB0byBtYXJrIG11bHRpcGxlIGlkZW50aWNhbCBtb2R1bGVzIGluIHRoZQ0KPiA+IE1EUA0K
PiA+IGRhdGEgcGF0aCBhbGdvcml0aG0sIHNvIHRoYXQgYXBwcm9wcmlhdGUgcGF0aHMgY2FuIGJl
IGR5bmFtaWNhbGx5DQo+ID4gZGlzcGF0Y2hlZC4NCj4gDQo+IElmIHRoZXkgYXJlIGlkZW50aWNh
bCwgdGhlbiB3aHkgZG8geW91IG5lZWQgdG8gZGlzdGluZ3Vpc2ggdGhlbSBpbg0KPiBEVD8NCj4g
SWYgdGhlcmUncyBzb21lIGRpZmZlcmVuY2UgeW91IG5lZWQgdG8ga25vdyBhYm91dCBzdWNoIGFz
IGNvbm5lY3Rpb25zDQo+IHRvIG90aGVyIGJsb2NrcywgdGhlbiBkZXNjcmliZSB0aGF0LiBBbm90
aGVyIGNvbW1vbiBleGFtcGxlIGlzDQo+IG5lZWRpbmcNCj4gdG8ga25vdyB3aGF0IGJpdHMvcmVn
aXN0ZXJzIHRvIGFjY2VzcyBpbiBhIHN5c2NvbiBwaGFuZGxlLiBGb3IgdGhhdCwNCj4gbWFrZSB0
aGUgcmVnaXN0ZXIgb2Zmc2V0IG9yIGJpdHMgYmUgYXJncyB0byB0aGUgcGhhbmRsZSBwcm9wZXJ0
eS4gIA0KPiAgDQo+IFJvYg0KDQpJbnRlZ3JhdGluZyB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiwg
bWF5YmUgSSBjYW4gcmV2aXNlIHRoZSBkZXNjcmlwdGlvbg0KdG8gdGhlIGZvbGxvd2luZzoNCiAg
ICBkZXNjcmlwdGlvbjogfA0KICAgICAgVGhlcmUgbWF5IGJlIG11bHRpcGxlIGJsb2NrcyB3aXRo
IHRoZSBzYW1lIGZ1bmN0aW9uIGJ1dCBkaWZmZXJlbnQNCiAgICAgIGFkZHJlc3NlcyBpbiBNRFAz
LiBJbiBvcmRlciB0byBkaXN0aW5ndWlzaCB0aGUgY29ubmVjdGlvbiB3aXRoDQogICAgICBvdGhl
ciBibG9ja3MsIGEgdW5pcXVlIElEIGlzIG5lZWRlZCB0byBkeW5hbWljYWxseSB1c2Ugb25lIG9y
DQogICAgICBtb3JlIGlkZW50aWNhbCBibG9ja3MgdG8gaW1wbGVtZW50IG11bHRpcGxlIHBpcGVs
aW5lcy4NCg0KTW91ZHkNCg==

