Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590193825E3
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 09:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235381AbhEQHx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 03:53:28 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:27925 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229736AbhEQHx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 03:53:28 -0400
X-UUID: ad15c8c4012d447e8ec36526ea48e42a-20210517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=h+98Z93ZAZ7sxTZlhBFEYtH38irCUScH0nEBanpBnHA=;
        b=eMNtV5VJoC6YvMkt2o6hFXY5Nl09N9VEdsJT8WZACcPNjxpkGm4yw84kipbQkILZg22F04lfCLx/kqQ57yjHtROi+CEm3Hj577tDakkc/liVKzaz4zD7p5sg283Lao3EVriSpg0WWjr0ylMC4pmYKdFn+NYhbEEmArbQ57u6W5g=;
X-UUID: ad15c8c4012d447e8ec36526ea48e42a-20210517
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1774268038; Mon, 17 May 2021 15:52:00 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 May
 2021 15:51:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 May 2021 15:51:57 +0800
Message-ID: <1621237917.25594.7.camel@mhfsdcap03>
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Rob Herring <robh@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Fritz Koenig" <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date:   Mon, 17 May 2021 15:51:57 +0800
In-Reply-To: <2b97b41c-d5d8-ac32-a9cf-c7bef09ed8ef@xs4all.nl>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
         <20210203083752.12586-2-irui.wang@mediatek.com>
         <20210210225323.GA2961490@robh.at.kernel.org>
         <1614581129.14457.0.camel@mhfsdcap03>
         <2b97b41c-d5d8-ac32-a9cf-c7bef09ed8ef@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AC0AA144FDC81F6D769A28429EE706EB2A987DF65EC0BB169DF477EAD59927522000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVhciBIYW5zLCBSb2IgYW5kIE1haW50YWluZXJzLA0KDQpNdWNoIGFwcHJlY2lhdGVkIGZvciBy
ZXZpZXdpbmcgdGhpcyBwYXRjaHNldCwgd2UgaGF2ZSBzZW50IFBBVENILVYzIGZvcg0KdGhlIHBh
dGNoc2V0IHdpdGggUm9iJ3MgY29tbWVudHM6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtbWVkaWF0ZWsvY292ZXIvMjAyMTA0MTIxMjQ1NTUuMjY4OTctMS1pcnVp
LndhbmdAbWVkaWF0ZWsuY29tLw0KDQpKdXN0IEdlbnRsZSBwaW5nIGZvciB0aGlzIFYzIHBhdGNo
Lg0KDQpUaGFua3MsDQpCZXN0IFJlZ2FyZHMNCg0KT24gVGh1LCAyMDIxLTA0LTI5IGF0IDEzOjE1
ICswMjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+IEhpIFJvYiwNCj4gDQo+IE9uIDAxLzAzLzIw
MjEgMDc6NDUsIElydWkgV2FuZyB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjEtMDItMTAgYXQgMTY6
NTMgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+PiBPbiBXZWQsIEZlYiAwMywgMjAyMSBh
dCAwNDozNzo0OFBNICswODAwLCBJcnVpIFdhbmcgd3JvdGU6DQo+ID4+PiBBZGRzIGRtYS1yYW5n
ZXMgcHJvcGVydHkgZm9yIERNQSBhZGRyZXNzZXMgdHJhbnNsYXRpb24uDQo+ID4+Pg0KPiA+Pj4g
U2lnbmVkLW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiA+Pj4g
LS0tDQo+ID4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLXZjb2RlYy50eHQgfCAyICsrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMudHh0DQo+ID4+PiBpbmRleCBmODUy
NzZlNjI5YmYuLmU0NjQ0ZjhjYWVlOSAxMDA2NDQNCj4gPj4+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMudHh0DQo+ID4+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVj
LnR4dA0KPiA+Pj4gQEAgLTIzLDYgKzIzLDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPj4+
ICAtIGlvbW11cyA6IHNob3VsZCBwb2ludCB0byB0aGUgcmVzcGVjdGl2ZSBJT01NVSBibG9jayB3
aXRoIG1hc3RlciBwb3J0IGFzDQo+ID4+PiAgICBhcmd1bWVudCwgc2VlIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS50eHQNCj4gPj4+ICAgIGZv
ciBkZXRhaWxzLg0KPiA+Pj4gKy0gZG1hLXJhbmdlcyA6IGRlc2NyaWJlcyBob3cgdGhlIHBoeXNp
Y2FsIGFkZHJlc3Mgc3BhY2Ugb2YgdGhlIElPTU1VIG1hcHMNCj4gPj4+ICsgIHRvIG1lbW9yeS4N
Cj4gPj4NCj4gPj4gZG1hLXJhbmdlcyBpcyBzdXBwb3NlZCB0byBiZSBpbiBhIGJ1cy9wYXJlbnQg
bm9kZS4NCj4gPiBEZWFyIFJvYiwNCj4gPiANCj4gPiBUaGUgbXQ4MTkyIGlvbW11IHN1cHBvcnQg
MH4xNkdCIGlvdmEuIFdlIHNlcGFyYXRlIGl0IHRvIGZvdXIgYmFua3M6DQo+ID4gMH40RzsgNEd+
OEc7IDhHfjEyRzsgMTJHfjE2Ry4NCj4gPiANCj4gPiBUaGUgImRtYS1yYW5nZXMiIGNvdWxkIGJl
IHVzZWQgdG8gYWRqdXN0IHRoZSBiYW5rIHdlIGxvY2F0ZS4NCj4gPiBJZiB3ZSBkb24ndCBzZXQg
dGhpcyBwcm9wZXJ0eS4gVGhlIGRlZmF1bHQgcmFuZ2UgYWx3YXlzIGlzIDB+NEcuDQo+ID4gDQo+
ID4gSGVyZSB3ZSBkb24ndCBoYXZlIGFjdHVhbCBidXMvcGFyZW50IGNvbmNlcHQgaGVyZS4gIEFu
ZCB0aGUgaW92YQ0KPiA+IHJlcXVpcmVtZW50IGlzIGZvciBvdXIgSFcuIFRodXMgcHV0IHRoZSBw
cm9wZXJ0eSBpbiBvdXIgbm9kZS4NCj4gPiANCj4gPiBJcyB0aGlzIE9LPyBJZiB0aGlzIGlzIG9r
IGZvciB5b3UsIEkgd2lsbCBwdXQgdGhpcyBtZXNzYWdlIGluIHRoZSBjb21taXQNCj4gPiBtZXNz
YWdlIGFuZCBiaW5kaW5nIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+IENhbiB5b3UgYW5zd2VyIEly
dWkncyBxdWVzdGlvbj8gSnVzdCBhIHJlbWluZGVyLi4uDQo+IA0KPiBNdWNoIGFwcHJlY2lhdGVk
IQ0KPiANCj4gUmVnYXJkcywNCj4gDQo+IAlIYW5zDQo+IA0KPiA+IA0KPiA+IFJlZ2FyZHMNCj4g
Pj4NCj4gPj4+ICBPbmUgb2YgdGhlIHR3byBmb2xsb3dpbmcgbm9kZXM6DQo+ID4+PiAgLSBtZWRp
YXRlayx2cHUgOiB0aGUgbm9kZSBvZiB0aGUgdmlkZW8gcHJvY2Vzc29yIHVuaXQsIGlmIHVzaW5n
IFZQVS4NCj4gPj4+ICAtIG1lZGlhdGVrLHNjcCA6IHRoZSBub2RlIG9mIHRoZSBTQ1AgdW5pdCwg
aWYgdXNpbmcgU0NQLg0KPiA+Pj4gLS0gDQo+ID4+PiAyLjI1LjENCj4gPj4+DQo+ID4gDQo+IA0K
DQo=

