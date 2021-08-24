Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD3B3F5BEB
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 12:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhHXKWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 06:22:38 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:47496 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236120AbhHXKWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 06:22:37 -0400
X-UUID: c770831e8cc144d9bb474aff35d7fffc-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nSqLnW0/e7tRkrLPR2Yjtna5rd1Ta+Kd5fx61UGVvec=;
        b=NjUmPKZVZowRkc6t+vW2bGaKHFgERb/HFeeUUhXpLcE5tWN5LarhvX8iyp2uPhhvkS7ULb7z6zUzoOfZWLCTUHK2WKkVqkUAyxlclO81MJLFgsAIYp61FBB21DDDKNFBuRQKPkD3eExWkk3bYhYKypadj9u7ChS5t9UA4nhKgcw=;
X-UUID: c770831e8cc144d9bb474aff35d7fffc-20210824
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 621387850; Tue, 24 Aug 2021 18:21:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:21:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 18:21:47 +0800
Message-ID: <6224223ec1ead769f281af54f93bd3142a8e212b.camel@mediatek.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        George Sun <george.sun@mediatek.com>
Date:   Tue, 24 Aug 2021 18:21:48 +0800
In-Reply-To: <CAAEAJfCdvj4drV+YSbvyR30b0+50RpJcOYdEoNODTdrAoL6+vA@mail.gmail.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
         <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
         <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
         <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
         <1629446378.18871.27.camel@mhfsdcap03>
         <CAAEAJfCdvj4drV+YSbvyR30b0+50RpJcOYdEoNODTdrAoL6+vA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KDQpPbiBTdW4sIDIw
MjEtMDgtMjIgYXQgMTE6MzIgLTAzMDAsIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4gT24gRnJp
LCAyMCBBdWcgMjAyMSBhdCAwNDo1OSwgeXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tDQo+IDx5dW5m
ZWkuZG9uZ0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEhpIEV6ZXF1aWVsLA0KPiA+
IA0KPiA+IFRoYW5rcyBmb3IgeW91ciBkZXRhaWwgZmVlZGJhY2suDQo+ID4gDQo+ID4gT24gVGh1
LCAyMDIxLTA4LTE5IGF0IDExOjEwIC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6DQo+ID4g
PiBPbiBUaHUsIDE5IEF1ZyAyMDIxIGF0IDA0OjEzLCB5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20N
Cj4gPiA+IDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+
ID4gSGkgRXplcXVpZWwsDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgc3VnZ2Vz
dGlvbi4NCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFdlZCwgMjAyMS0wOC0xOCBhdCAxMToxMSAtMDMw
MCwgRXplcXVpZWwgR2FyY2lhIHdyb3RlOg0KPiA+ID4gPiA+ICtkYW52ZXQNCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBIaSwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiBUdWUsIDEwIEF1ZyAyMDIx
IGF0IDIzOjU4LCBZdW5mZWkgRG9uZyA8DQo+ID4gPiA+ID4geXVuZmVpLmRvbmdAbWVkaWF0ZWsu
Y29tPg0KPiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGlzIHNl
cmllcyBhZGRzIHN1cHBvcnQgZm9yIG11bHRpIGhhcmR3YXJlIGRlY29kZSBpbnRvDQo+ID4gPiA+
ID4gPiBtdGstdmNvZGVjLA0KPiA+ID4gPiA+ID4gYnkgZmlyc3QNCj4gPiA+ID4gPiA+IGFkZGlu
ZyBjb21wb25lbnQgZnJhbWV3b3JrIHRvIG1hbmFnZSBlYWNoIGhhcmR3YXJlDQo+ID4gPiA+ID4g
PiBpbmZvcm1hdGlvbjoNCj4gPiA+ID4gPiA+IGludGVycnVwdCwNCj4gPiA+ID4gPiA+IGNsb2Nr
LCByZWdpc3RlciBiYXNlcyBhbmQgcG93ZXIuIFNlY29uZGx5IGFkZCBjb3JlIHRocmVhZA0KPiA+
ID4gPiA+ID4gdG8gZGVhbA0KPiA+ID4gPiA+ID4gd2l0aCBjb3JlDQo+ID4gPiA+ID4gPiBoYXJk
d2FyZSBtZXNzYWdlLCBhdCB0aGUgc2FtZSB0aW1lLCBhZGQgbXNnIHF1ZXVlIGZvcg0KPiA+ID4g
PiA+ID4gZGlmZmVyZW50DQo+ID4gPiA+ID4gPiBoYXJkd2FyZQ0KPiA+ID4gPiA+ID4gc2hhcmUg
bWVzc2FnZXMuIExhc3RseSwgdGhlIGFyY2hpdGVjdHVyZSBvZiBkaWZmZXJlbnQgc3BlY3MNCj4g
PiA+ID4gPiA+IGFyZSBub3QNCj4gPiA+ID4gPiA+IHRoZSBzYW1lLA0KPiA+ID4gPiA+ID4gdXNp
bmcgc3BlY3MgdHlwZSB0byBzZXBhcmF0ZSB0aGVtLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gSSBkb24ndCB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIGludHJvZHVjZSB0
aGUgY29tcG9uZW50IEFQSQ0KPiA+ID4gPiA+IGluIHRoZQ0KPiA+ID4gPiA+IG1lZGlhIHN1YnN5
c3RlbS4gSXQgZG9lc24ndCBzZWVtIHRvIGJlIG1haW50YWluZWQsIElSQw0KPiA+ID4gPiA+IHRo
ZXJlJ3Mgbm90DQo+ID4gPiA+ID4gZXZlbg0KPiA+ID4gPiA+IGEgbWFpbnRhaW5lciBmb3IgaXQs
IGFuZCBpdCBoYXMgc29tZSBpc3N1ZXMgdGhhdCB3ZXJlIG5ldmVyDQo+ID4gPiA+ID4gYWRkcmVz
c2VkLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEl0IHdvdWxkIGJlIHJlYWxseSBpbXBvcnRhbnQg
dG8gYXZvaWQgaXQuIElzIGl0IHJlYWxseSBuZWVkZWQNCj4gPiA+ID4gPiBpbiB0aGUNCj4gPiA+
ID4gPiBmaXJzdCBwbGFjZT8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGFua3MsDQo+ID4gPiA+
ID4gRXplcXVpZWwNCj4gPiA+ID4gDQo+ID4gPiA+IEZvciB0aGVyZSBhcmUgbWFueSBoYXJkd2Fy
ZSBuZWVkIHRvIHVzZSwgbXQ4MTkyIGlzIHRocmVlIGFuZA0KPiA+ID4gPiBtdDgxOTUgaXMNCj4g
PiA+ID4gZml2ZS4gTWF5YmUgbmVlZCBtb3JlIHRvIGJlIHVzZWQgaW4gdGhlIGZlYXR1cmUuDQo+
ID4gPiA+IA0KPiA+ID4gPiBFYWNoIGhhcmR3YXJlIGhhcyBpbmRlcGVuZGVudCBjbGsvcG93ZXIv
aW9tbXUgcG9ydC9pcnEuDQo+ID4gPiA+IFVzZSBjb21wb25lbnQgaW50ZXJmYWNlIGluIHByb2Ig
dG8gZ2V0IGVhY2ggY29tcG9uZW50J3MNCj4gPiA+ID4gaW5mb3JtYXRpb24uDQo+ID4gPiA+IEp1
c3QgZW5hYmxlIHRoZSBoYXJkd2FyZSB3aGVuIG5lZWQgdG8gdXNlIGl0LCB2ZXJ5IGNvbnZlbmll
bnQNCj4gPiA+ID4gYW5kDQo+ID4gPiA+IHNpbXBsZS4NCj4gPiA+ID4gDQo+ID4gPiA+IEkgZm91
bmQgdGhhdCB0aGVyZSBhcmUgbWFueSBtb2R1bGVzIHVzZSBjb21wb25lbnQgdG8gbWFuYWdlDQo+
ID4gPiA+IGhhcmR3YXJlDQo+ID4gPiA+IGluZm9ybWF0aW9uLCBzdWNoIGFzIGlvbW11IGFuZCBk
cm0gZXRjLg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gTWFueSBkcml2ZXJzIHN1cHBvcnQgbXVs
dGlwbGUgaGFyZHdhcmUgdmFyaWFudHMsIHdoZXJlIGVhY2gNCj4gPiA+IHZhcmlhbnQNCj4gPiA+
IGhhcyBhIGRpZmZlcmVudCBudW1iZXIgb2YgY2xvY2tzIG9yIGludGVycnVwdHMsIHNlZSBmb3Ig
aW5zdGFuY2UNCj4gPiA+IHN0cnVjdCBoYW50cm9fdmFyaWFudCB3aGljaCBhbGxvd3MgdG8gZXhw
b3NlIGRpZmZlcmVudCBjb2RlYw0KPiA+ID4gY29yZXMsDQo+ID4gPiBzb21lIGhhdmluZyBib3Ro
IGRlY29kZXIvZW5jb2RlciwgYW5kIHNvbWUgaGF2aW5nIGp1c3QgYSBkZWNvZGVyLg0KPiA+ID4g
DQo+ID4gPiBUaGUgY29tcG9uZW50IEFQSSBpcyBtb3N0bHkgdXNlZCBieSBEUk0gdG8gYWdncmVn
YXRlIGluZGVwZW5kZW50DQo+ID4gPiBzdWJkZXZpY2VzIChjYWxsZWQgY29tcG9uZW50cykgaW50
byBhbiBhZ2dyZWdhdGVkIGRyaXZlci4NCj4gPiA+IA0KPiA+ID4gRm9yIGluc3RhbmNlLCBhIERS
TSBkcml2ZXIgbmVlZHMgdG8gZ2x1ZSB0b2dldGhlciB0aGUgSERNSSwgTUlQSSwNCj4gPiA+IGFu
ZCBwbGFueSBjb250cm9sbGVyLCBvciBhbnkgb3RoZXIgaGFyZHdhcmUgYXJyYW5nZW1lbnQgd2hl
cmUNCj4gPiA+IGRldmljZXMgY2FuIGJlIGRlc2NyaWJlZCBpbmRlcGVuZGVudGx5Lg0KPiA+ID4g
DQo+ID4gDQo+ID4gVGhlIHVzYWdlIHNjZW5hcmlvIGlzIHZlcnkgc2ltaWxhciB3aXRoIGRybSBh
bmQgaW9tbXUsIFNvIGRlY2lkZSB0bw0KPiA+IHVzZQ0KPiA+IGNvbXBvbmVudCBmcmFtZXdvcmsu
DQo+ID4gRGVjb2RlIGhhcyB0aHJlZS9maXZlIG9yIG1vcmUgaGFyZHdhcmVzLCB0aGVzZSBoYXJk
d2FyZSBhcmUNCj4gPiBpbmRlcGVuZGVudC4NCj4gPiBGb3IgbXQ4MTgzIGp1c3QgbmVlZCBjb3Jl
IGhhcmR3YXJlIHRvIGRlY29kZSwgYnV0IG10ODE5MiBoYXMNCj4gPiBsYXQsc29jIGFuZA0KPiA+
IGNvcmUgaGFyZHdhcmUgdG8gZGVjb2RlLiBXaGVuIGxhdCBuZWVkIHRvIHVzZSwganVzdCBlbmFi
bGUgbGF0DQo+ID4gaGFyZHdhcmUsDQo+ID4gY29yZSBpcyB0aGUgc2FtZS5BbmQgbXQ4MTk1IHdp
bGwgaGFzIHR3byBjb3JlcywgZWFjaCBjb3JlIGNhbiB3b3JrDQo+ID4gd2VsbA0KPiA+IGluZGVw
ZW5kZW50Lg0KPiA+IA0KPiA+IEZvciBlYWNoIGNvbXBvbmVudCBkZXZpY2UganVzdCB1c2VkIHRv
IG9wZW4gdGhlaXIgcG93ZXIvY2xrL2lvbW11DQo+ID4gcG9ydC9pcnEgd2hlbiBtYXN0ZXIgbmVl
ZCB0byBlbmFibGUgaXQuIFRoZSBtYWluIGxvZ2ljIGlzIGluIG1hc3Rlcg0KPiA+IGRldmljZS4N
Cj4gPiANCj4gPiA+IFRoZSBjb21wb25lbnQgQVBJIG1heSBsb29rIHNpbXBsZSBidXQgaGFzIHNv
bWUgaXNzdWVzLCBpdCdzIG5vdA0KPiA+ID4gZWFzeQ0KPiA+ID4gdG8gZGVidWcsIGFuZCBjYW4g
Y2F1c2UgdHJvdWJsZXMgaWYgbm90IHVzZWQgYXMgZXhwZWN0ZWQgWzFdLg0KPiA+ID4gSXQncyB3
b3J0aCBtYWtpbmcgc3VyZSB5b3UgYWN0dWFsbHkgbmVlZCBhIGZyYW1ld29yaw0KPiA+ID4gdG8g
Z2x1ZSBkaWZmZXJlbnQgZGV2aWNlcyB0b2dldGhlci4NCj4gPiA+IA0KPiA+IA0KPiA+IEVhY2gg
aGFyZHdhcmUgaGFzIGl0cyBpbmRleCwgbWFzdGVyIGNhbiBnZXQgaGFyZHdhcmUgaW5mb3JtYXRp
b24NCj4gPiBhY2NvcmRpbmcgdGhlc2UgaW5kZXgsIGxvb2tzIG5vdCBjb21wbGV4LiBXaGF0IGRv
IHlvdSBtZWFuIGFib3V0DQo+ID4gbm90DQo+ID4gZWFzeSB0byBkZWJ1Zz8NCj4gPiANCj4gPiA+
ID4gRG8geW91IGhhdmUgYW55IG90aGVyIHN1Z2dlc3Rpb24gZm9yIHRoaXMgYXJjaGl0ZWN0dXJl
Pw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gTG9va2luZyBhdCB0aGUgZGlmZmVyZW50IHBhdGNo
c2V0cyB0aGF0IGFyZSBwb3N0ZWQsIGl0J3Mgbm90DQo+ID4gPiBjbGVhcg0KPiA+ID4gdG8gbWUg
d2hhdCBleGFjdGx5IGFyZSB0aGUgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgdGhhdCB5b3UNCj4g
PiA+IGludGVuZA0KPiA+ID4gdG8gc3VwcG9ydCwgY2FuIHlvdSBzb21lIGRvY3VtZW50YXRpb24g
d2hpY2ggY2xhcmlmaWVzIHRoYXQ/DQo+ID4gPiANCj4gPiANCj4gPiBIYXZlIGZpdmUgaGFyZHdh
cmVzIGxhdCxzb2MsY29yZTAsY29yZTEgYW5kIG1haW4uIExhdCB0aHJlYWQgY2FuDQo+ID4gdXNl
IGxhdA0KPiA+IHNvYyBhbmQgbWFpbiwgY29yZSB0aHJlYWQgY2FuIHVzZSBzb2MsbGF0LCBjb3Jl
MCBhbmQgY29yZTEuIENvcmUNCj4gPiB0aHJlYWQNCj4gPiBjYW4gYmUgdXNlZCBvciBub3QgZm9y
IGRpZmZlcmVudCBwcm9qZWN0Lg0KPiANCj4gQ2FuIHlvdSBleHBsYWluIHdoYXQgYXJlIHRoZXNl
IGxhdCxzb2MgYW5kIGNvcmUgdGhyZWFkcyBmb3I/DQo+IA0KWW91IGNhbiByZWdhcmRzIGxhdCxz
b2MgYW5kIGNvcmUgYXMgaGFyZHdhcmUsIGVhY2ggaGFyZHdhcmUgY2FuIHdvcmsNCmluZGVwZW5k
ZW50LiBMYXQgYW5kIGNvcmUgdGhyZWFkcyB1c2VkIHRvIGNvbnRyb2wgaGFyZHdhcmUgdG8gZGVj
b2RlLg0KPiA+IEFsc28gTmVlZCB0byB1c2UgdGhlc2UNCj4gPiBoYXJkd2FyZSBkeW5hbWljIGF0
IHRoZSBzYW1lIHRpbWUuIFNvIEkgdXNlIGNvbXBvbmVudCBmcmFtZXdvcmssDQo+ID4ganVzdA0K
PiA+IG5lZWQgdG8ga25vdyB0aGUgdXNlZCAgaGFyZHdhcmUgaW5kZXggYWNjb3JkaW5nIHRvIGRp
ZmZlcmVudA0KPiA+IHByb2plY3QuTmVlZCBub3QgdG8gZG8gY29tcGxleCBsb2dpYyB0byBtYW5h
Z2UgdGhlc2UgaGFyZHdhcmVzLg0KPiA+IA0KPiANCj4gSSBhbSBub3QgdGhyaWxsZWQgdG8gc2Vl
IHRoZSBjb21wb25lbnQgZnJhbWV3b3JrIGludHJvZHVjZWQgdG8gdGhlDQo+IG1lZGlhIHN1YnN5
c3RlbS4gTGlrZSBJIHNhaWQsIGl0IGhhcyBubyBjbGVhciBtYWludGFpbmVyLCBhbmQgaXQncw0K
PiBub3QNCj4gZWFzeSB0byB1c2UuDQo+IA0KSG93IGRvIHlvdSB0aGluayBhYm91dCBEZW5pZWwg
VmV0dGVyJ3MgbWFpbCA/IEl0IGxvb2tzIHRoYXQgdGhlcmUgYXJlDQptYWludGFpbmVyIGZvciBp
dC4NCj4gVGhlIG1lZGlhIHN1YnN5c3RlbSBoYXMgc29tZSBzdXBwb3J0IHdoaWNoIEFGQUlLIGRv
ZXMgdGhlIHNhbWUgdGhpbmcsDQo+IHNlZSB2NGwyLWFzeW5jLCB3aGljaCBpcyBtYWludGFpbmVk
IGJ5IG1lZGlhIHBlb3BsZS4NCj4gDQpJZiBjb21wb25lbnQgY2FuIGJlIHVzZWQsIEkgcHJlZmVy
IHRvIHVzZSBpdC4gQXQgdGhlIG90aGVyIGhhbmQsIEkgd2lsbA0KdHJ5IHRvIHVzZSB0aGVzZSBt
ZXRob2QgYXMgY29tcGFyZWQuDQo+IFBsZWFzZSBwdXNoIGEgYnJhbmNoIGJhc2VkIG9uIG1lZGlh
L21hc3RlciBjb250YWluaW5nIHRoZXNlIGNoYW5nZXMuDQo+IEkgc2VlIHRoZXJlIGFyZSBvdGhl
ciBwYXRjaCBzZXJpZXMgZm9yIHRoaXMgZGV2aWNlLCBidXQgaXQncyBoYXJkIHRvDQo+IHRyYWNr
DQo+IHdoaWNoIGdvZXMgZmlyc3QsIGV0Yy4NCj4gDQpJIG5lZWQgdGltZSB0byBwdXNoIGEgYnJh
bmNoLCBvciB5b3UgY2FuIGdldCB0aGUgbGF0ZXN0IGtlcm5lbCBhbmQgZ2l0DQphbSB0aGVzZSBw
YXRjaGVzLCBtYXliZSBtdWNoIHF1aWNrZXIuDQo+IFRoYW5rcywNCj4gRXplcXVpZWwNCg0KVGhh
bmtzLA0KWXVuZmVpIERvbmcNCg==

