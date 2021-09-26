Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35EA6418757
	for <lists+linux-media@lfdr.de>; Sun, 26 Sep 2021 10:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhIZI30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Sep 2021 04:29:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39904 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229532AbhIZI30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Sep 2021 04:29:26 -0400
X-UUID: 604b53aa6af04ceb8aaa1c2c31d94e5c-20210926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Acv790oOGOjZXUxMhyPqWQCJIZJ6gwtwZjAYR4X2LnA=;
        b=fhm1W9MBX1qwGCQqEAddW8uFXHm3GzuuPfwz/NCv49Sbm5jngJHW7rqfh1ao0rdhOKg83uLr9VxXIgA82S3Fahn8vCO4P3H337sITRwgs/qdsyiBAAzOe/DVe8M9ODy50N2AWaM0ClpiQ3ihFKjbAQKohQM2fY3ihQjIiw+Fu0g=;
X-UUID: 604b53aa6af04ceb8aaa1c2c31d94e5c-20210926
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 783859681; Sun, 26 Sep 2021 16:27:48 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 16:27:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Sep 2021 16:27:45 +0800
Message-ID: <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Sun, 26 Sep 2021 16:27:48 +0800
In-Reply-To: <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
         <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
         <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
         <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQoNCkNvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBnaXZlIHNvbWUgZmVlZGJh
Y2sgd2hlbiB5b3UgYXJlIGZyZWUgZm9yIGlvbW11DQpsaW1pdGF0aW9uPw0KDQpBY2NvcmRpbmcg
dG8gZ29vZ2xlJ3Mgc3VnZ2VzdGlvbiwgaXQncyBiZXR0ZXIgbm90IHRvIHVzZSB2NGwyIGFzeW5j
DQphbHNvLg0KSWYgdGhlcmUgYXJlIG5vIGZ1cnRoZXIgY29tbWVudHMsIEkgZG9uJ3QgaGF2ZSBv
dGhlciBjaG9pY2UgZm9yIHRoaXMNCmFyY2hpdGVjdHVyZS4NCg0KVGhhbmtzLA0KWXVuZmVpIERv
bmcNCk9uIFR1ZSwgMjAyMS0wOS0xNCBhdCAyMDoxNiArMDgwMCwgeXVuZmVpLmRvbmdAbWVkaWF0
ZWsuY29tIHdyb3RlOg0KPiBIaSBFemVxdWllbCwNCj4gDQo+IE9uIEZyaSwgMjAyMS0wOS0wMyBh
dCAxMTowOCArMDgwMCwgeXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tIHdyb3RlOg0KPiA+IEhpIEV6
ZXF1aWVsLA0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KPiA+IE9uIFRo
dSwgMjAyMS0wOS0wMiBhdCAxMzozMCAtMDMwMCwgRXplcXVpZWwgR2FyY2lhIHdyb3RlOg0KPiA+
ID4gT24gV2VkLCAxIFNlcHQgMjAyMSBhdCAwNTozMiwgWXVuZmVpIERvbmcgPA0KPiA+ID4geXVu
ZmVpLmRvbmdAbWVkaWF0ZWsuY29tDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiB3cm90ZToNCj4g
PiA+ID4gDQo+ID4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgbXVsdGkgaGFyZHdh
cmUgZGVjb2RlIGludG8gbXRrLQ0KPiA+ID4gPiB2Y29kZWMsIA0KPiA+ID4gPiBieSBmaXJzdA0K
PiA+ID4gPiBhZGRpbmcgY29tcG9uZW50IGZyYW1ld29yayB0byBtYW5hZ2UgZWFjaCBoYXJkd2Fy
ZSBpbmZvcm1hdGlvbjoNCj4gPiA+ID4gaW50ZXJydXB0LA0KPiA+ID4gPiBjbG9jaywgcmVnaXN0
ZXIgYmFzZXMgYW5kIHBvd2VyLiBTZWNvbmRseSBhZGQgY29yZSB0aHJlYWQgdG8NCj4gPiA+ID4g
ZGVhbA0KPiA+ID4gPiB3aXRoIGNvcmUNCj4gPiA+ID4gaGFyZHdhcmUgbWVzc2FnZSwgYXQgdGhl
IHNhbWUgdGltZSwgYWRkIG1zZyBxdWV1ZSBmb3IgZGlmZmVyZW50DQo+ID4gPiA+IGhhcmR3YXJl
DQo+ID4gPiA+IHNoYXJlIG1lc3NhZ2VzLiBMYXN0bHksIHRoZSBhcmNoaXRlY3R1cmUgb2YgZGlm
ZmVyZW50IHNwZWNzIGFyZQ0KPiA+ID4gPiBub3QNCj4gPiA+ID4gdGhlIHNhbWUsDQo+ID4gPiA+
IHVzaW5nIHNwZWNzIHR5cGUgdG8gc2VwYXJhdGUgdGhlbS4NCj4gPiA+ID4gDQo+ID4gPiA+IFRo
aXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIGJvdGggTVQ4MTgzIGFuZCBNVDgxNzMuDQo+
ID4gPiA+IERlY29kaW5nDQo+ID4gPiA+IHdhcyB3b3JraW5nDQo+ID4gPiA+IGZvciBib3RoIGNo
aXBzLg0KPiA+ID4gPiANCj4gPiA+ID4gUGF0Y2hlcyAxfjMgcmV3cml0ZSBnZXQgcmVnaXN0ZXIg
YmFzZXMgYW5kIHBvd2VyIG9uL29mZg0KPiA+ID4gPiBpbnRlcmZhY2UuDQo+ID4gPiA+IA0KPiA+
ID4gPiBQYXRjaCA0IGFkZCBjb21wb25lbnQgZnJhbWV3b3JrIHRvIHN1cHBvcnQgbXVsdGkgaGFy
ZHdhcmUuDQo+ID4gPiA+IA0KPiA+ID4gPiBQYXRjaCA1IHNlcGFyYXRlIHZpZGVvIGVuY29kZXIg
YW5kIGRlY29kZXIgZG9jdW1lbnQNCj4gPiA+ID4gDQo+ID4gPiA+IFBhdGNoZXMgNi0xNSBhZGQg
aW50ZXJmYWNlcyB0byBzdXBwb3J0IGNvcmUgaGFyZHdhcmUuDQo+ID4gPiA+IC0tLS0NCj4gPiA+
ID4gVGhpcyBwYXRjaCBkZXBlbmRlbnRzIG9uIDogIm1lZGlhOiBtdGstdmNvZGVjOiBzdXBwb3J0
IGZvcg0KPiA+ID4gPiBNVDgxODMNCj4gPiA+ID4gZGVjb2RlciJbMV0gYW5kDQo+ID4gPiA+ICJN
ZWRpYXRlayBNVDgxOTIgY2xvY2sgc3VwcG9ydCJbMl0uDQo+ID4gPiA+IA0KPiA+ID4gPiAxOiBN
dWx0aSBoYXJkd2FyZSBkZWNvZGUgaXMgYmFzZWQgb24gc3RhdGVsZXNzIGRlY29kZXIsIE1UODE4
Mw0KPiA+ID4gPiBpcw0KPiA+ID4gPiB0aGUgZmlyc3QgdGltZQ0KPiA+ID4gPiB0byBhZGQgc3Rh
dGVsZXNzIGRlY29kZXIuIE90aGVyd2lzZSBpdCB3aWxsIGNhdXNlIGNvbmZsaWN0Lg0KPiA+ID4g
PiBUaGlzDQo+ID4gPiA+IHBhdGNoIHdpbGwgYmUNCj4gPiA+ID4gYWNjZXB0ZWQgaW4gNS4xNVsx
XS4NCj4gPiA+ID4gDQo+ID4gPiA+IDI6IFRoZSBkZWZpbml0aW9uIG9mIGRlY29kZXIgY2xvY2tz
IGFyZSBpbiBtdDgxOTItY2xrLmgsIHRoaXMNCj4gPiA+ID4gcGF0Y2gNCj4gPiA+ID4gYWxyZWFk
eSBpbiBjbGsgdHJlZVsyXS4NCj4gPiA+ID4gDQo+ID4gPiA+IFsxXQ0KPiA+ID4gPiANCj4gDQo+
IGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3QvbGludXgtbWVkaWEvbGlzdC8/
c2VyaWVzPTU4MjYNCj4gPiA+ID4gWzJdDQo+ID4gPiA+IA0KPiANCj4gDQpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jbGsvbGludXguZ2l0L2NvbW1pdC8/
aD1jbGstbmV4dCZpZD1mMzVmMWEyM2UwZTEyZTMxNzNlOWU5ZGVkYmMxNTBkMTM5MDI3MTg5DQo+
ID4gPiA+IC0tLS0NCj4gPiA+ID4gQ2hhbmdlcyBjb21wYXJlZCB3aXRoIHY1Og0KPiA+ID4gPiAt
QWRkIGRlY29kZXIgaGFyZHdhcmUgYmxvY2sgZGlhZ3JhbSBmb3IgcGF0Y2ggMTMvMTUNCj4gPiA+
ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhlIGRpc2N1c3Npb24gb24gdjUgd2FzIHN0aWxs
IG9uLWdvaW5nLCBzbyBzZW5kaW5nIHRoaXMgdjYNCj4gPiA+IGlzIG5vdCBoZWxwZnVsLiBUaGUg
Y29udGV4dCBmb3IgdjUncyBkaXNjdXNzaW9uIGlzIG5vdyBoYXJkZXIgdG8NCj4gPiA+IGZpbmQu
DQo+ID4gPiANCj4gPiA+IFBsZWFzZSBhdm9pZCBzZW5kaW5nIGEgbmV3IHZlcnNpb24gd2l0aG91
dCBwcm9wZXJseQ0KPiA+ID4gZGlzY3Vzc2luZyBhbGwgdGhlIGZlZWRiYWNrLCBhbmQgd2l0aG91
dCByZWFjaGluZyBjb25zZW5zdXMuDQo+ID4gPiBUaGlzIGlzIHZlcnkgaW1wb3J0YW50LCBwbGVh
c2Uga2VlcCBpdCBpbiBtaW5kLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB5b3VyIHJl
bWluZCwgSSB3aWxsIGtlZXAgdGhpcyBwYXRjaCB1bnRpbCBnZXQgdGhlDQo+ID4gc29sdXRpb24u
DQo+ID4gDQo+ID4gPiBTcGVjaWZpY2FsbHksIHRoZSBmZWVkYmFjayBvbiB2NSB3YXMgTkFLLCB3
aXRoIHRoZSByZXF1ZXN0IHRvDQo+ID4gPiBhdm9pZA0KPiA+ID4gdXNpbmcgYW55IGFzeW5jIGZy
YW1ld29yaywgYW5kIGluc3RlYWQgdHJ5IHRvIGZpbmQgYSBzaW1wbGVyDQo+ID4gPiBzb2x1dGlv
bi4NCj4gPiA+IA0KPiA+ID4gRm9yIGluc3RhbmNlLCB5b3UgY2FuIG1vZGVsIHRoaW5ncyB3aXRo
IGEgYnVzLWxpa2UgcGF0dGVybiwNCj4gPiA+IHdoaWNoIHRpZXMgYWxsIHRoZSBkZXZpY2VzIHRv
Z2V0aGVyLCB1bmRlciBhIHBhcmVudCBub2RlLg0KPiA+ID4gVGhpcyBwYXR0ZXJuIGlzIGNvbW1v
biBpbiB0aGUga2VybmVsLCB0aGUgcGFyZW50DQo+ID4gPiBub2RlIGNhbiB1c2Ugb2ZfcGxhdGZv
cm1fcG9wdWxhdGUgb3Igc2ltaWxhcg0KPiA+ID4gKGdpdCBncmVwIG9mX3BsYXRmb3JtX3BvcHVs
YXRlLCB5b3Ugd2lsbCBzZWUgcGxlbnR5IG9mIGV4YW1wbGVzKS4NCj4gPiA+IA0KPiA+ID4gWW91
IHdpbGwgc3RpbGwgaGF2ZSB0byBkbyBzb21lIHdvcmsgdG8gaGF2ZSB0aGUgcHJvcGVyDQo+ID4g
PiByZWdzIHJlc291cmNlcywgYnV0IHRoaXMgaXMgZG9hYmxlLiBFYWNoIGNoaWxkIGlzIGEgZGV2
aWNlLA0KPiA+ID4gc28gaXQgY2FuIGhhdmUgaXRzIG93biByZXNvdXJjZXMgKGNsb2NrcywgaW50
ZXJydXB0cywgaW9tbXVzKS4NCj4gPiA+IA0KPiA+ID4gWW91IGRvbid0IG5lZWQgYW55IGFzeW5j
IGZyYW1ld29yay4NCj4gPiA+IA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24gdmVy
eSBtdWNoLCBhbmQgdGhlcmUgYXJlIHNldmVyYWwgYWN0aW9ucw0KPiBuZWVkIHRvIGNoZWNrLg0K
PiANCj4gMTogVGhlIGlvbW11IHJlZ2lzdGVyIGxpa2UgdGhpczoNCj4gcmV0ID0gYnVzX3NldF9p
b21tdSgmcGxhdGZvcm1fYnVzX3R5cGUsDQo+ICZtdGtfaW9tbXVfb3BzKTsgDQo+IEl0IGV4cGVj
dCB0aGUgY29uc3VtZXIgaXMgYSBzdGFuZGFyZCBwbGF0Zm9ybSBkZXZpY2UuDQo+IG90aGVyd2lz
ZSBpdA0KPiBjb3VsZCBub3QgZW50ZXIgdG8gdGhlIGlvbW11IG9mX3hsYXRlLikNCj4gDQo+IFNv
IGlmIHB1dHRpbmcgdGhlIGlvbW11cyBwcm9wZXJ0eSBpbiB0aGUgY2hpbGQgbm9kZSwgYWxsIHRo
ZSBjaGlsZA0KPiBkZXZpY2UgbmVlZCB0byByZWdpc3RlcmVkIGFzIHBsYXRmb3JtIGRldmljZS4N
Cj4gDQo+IDI6IEZvciB0aGUgaW50ZXJydXB0IGluIGVhY2ggY2hpbGQgbm9kZSwgYnV0IHRoZSBs
b2dpY2FsIHByb2Nlc3NpbmcNCj4gaW4NCj4gcGFyZW50IHBhcnQuIENoaWxkIGFuZCBwYXJlbnQg
bmVlZCB0byBzZW5kIG1lc3NhZ2UgZm9yIGVhY2ggb3RoZXIuIEluDQo+IG9yZGVyIHRvIGNvbnRy
b2wgY2xrL3Bvd2VyL2lycSBmb3IgbXVsdGkgaW5zdGFuY2UsIG5lZWQgc2VuZCBtZXNzYWdlDQo+
IHRvDQo+IGNoaWxkIHRvIHNlcGFyYXRlIGRpZmZlcmVudCBoYXJkd2FyZTsgY2hpbGQgYWxzbyBu
ZWVkIHNlbmQgbWVzc2FnZSB0bw0KPiBwYXJlbnQgd2hlbiBnZXQgaW50ZXJydXB0Lg0KPiANCj4g
MzogQWJvdXQgQ2hlbi1ZdSdzIG1haWwsIGRvIHlvdSBoYXZlIGFueSBhZHZpY2U/DQo+IA0KPiBE
byB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbiBhYm91dCB0aGVzZSB0d28gc2NlbmFyaW9zPw0KPiBJ
J20gdmVyeSBoYXBweSB0byBnZXQgeW91ciByZXBseS4NCj4gDQo+IFRoYW5rcw0KPiBZdW5mZWkg
RG9uZw0KPiANCj4gPiA+ICAgICB2Y29kZWNfZGVjOiB2Y29kZWNfZGVjQDE2MDAwMDAwIHsNCj4g
PiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItdmNvZGVjLWRlYyI7DQo+
ID4gPiAgICAgICAgIHJlZyA9IDxzb21ldGhpbmc+Ow0KPiA+ID4gICAgICAgICBtZWRpYXRlayxz
Y3AgPSA8JnNjcD47DQo+ID4gPiAgICAgICAgIGlvbW11cyA9IDwmaW9tbXUwIE00VV9QT1JUX0w0
X1ZERUNfTUNfRVhUPjsNCj4gPiA+ICAgICAgICAgZG1hLXJhbmdlcyA9IDwweDEgMHgwIDB4MCAw
eDQwMDAwMDAwIDB4MCAweGZmZjAwMDAwPjsNCj4gPiA+IA0KPiA+ID4gICAgICAgICB2Y29kZWNf
bGF0QDB4MTAwMDAgew0KPiA+ID4gICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dGstdmNvZGVjLWxhdCI7DQo+ID4gPiAgICAgICAgICAgICByZWcgPSA8MHgxMDAwMCAweDgwMD47
ICAgICAgLyogVkRFQ19NSVNDICovDQo+ID4gPiAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJ
Q19TUEkgNDI2IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47DQo+ID4gPiAgICAgICAgICAgICAvLyBl
dGMNCj4gPiA+ICAgICAgICAgfTsNCj4gPiA+IA0KPiA+ID4gICAgICAgICB2Y29kZWNfY29yZUAw
eDI1MDAwIHsNCj4gPiA+ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdGstdmNv
ZGVjLWNvcmUiOw0KPiA+ID4gICAgICAgICAgICByZWcgPSA8MHgyNTAwMCAweDEwMDA+OyAgICAg
IC8qIFZERUNfQ09SRV9NSVNDICovDQo+ID4gPiAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lD
X1NQSSA0MjUgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsNCj4gPiA+ICAgICAgICAgICAgLy8gZXRj
DQo+ID4gPiAgICAgICAgIH07DQo+ID4gPiAgICAgfTsNCj4gPiA+IA0KPiA+ID4gVGhhbmtzLA0K
PiA+ID4gRXplcXVpZWwNCg==

