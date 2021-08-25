Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C283F6EF9
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 07:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238125AbhHYFtc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 01:49:32 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:60454 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232442AbhHYFtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 01:49:31 -0400
X-UUID: b65beb87375343b1ae9a1d1c9ae97f4e-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ONQtWu3lv3dTBvMzZk9BAuNwnHHvjPfkOuyx0omprNw=;
        b=LjIbk9QKaR8xdXI8xERPdtOW6CvcoCEQjiAdT3CJw9eBjKpA+QQozkT9z0EiYzPIrSFcXsNZ1GqgwBYRyIJ33IfF4XKp3xrPYBJHz9fQSCqwYjqM3spkV0t6/Y7EYlQ+kfS4Gf1fomPAoGbeL1ujbxD3barG+yIm/3lE1h0UWcU=;
X-UUID: b65beb87375343b1ae9a1d1c9ae97f4e-20210825
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1136702878; Wed, 25 Aug 2021 13:48:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 13:48:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 13:48:34 +0800
Message-ID: <24aa6baa63408c4cb9809e3f5c82e5f5df8b916f.camel@mediatek.com>
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
Date:   Wed, 25 Aug 2021 13:48:35 +0800
In-Reply-To: <6224223ec1ead769f281af54f93bd3142a8e212b.camel@mediatek.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
         <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
         <1b79a67b703d2c894bc4d9458c760e082fc42958.camel@mediatek.com>
         <CAAEAJfCTrKj9AFExN-L-TKww4E=us1VVh8LHtZ8Q0j_eaCD4Eg@mail.gmail.com>
         <1629446378.18871.27.camel@mhfsdcap03>
         <CAAEAJfCdvj4drV+YSbvyR30b0+50RpJcOYdEoNODTdrAoL6+vA@mail.gmail.com>
         <6224223ec1ead769f281af54f93bd3142a8e212b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQoNCllvdSBjYW4gZ2V0IHRoZSBkdHNpIGluZm9ybWF0aW9uIGZyb20gcGF0
Y2ggMTMsIGl0IGlzIGRlY29kZXIgeWFtbCBmaWxlDQphYm91dCBjb21wb25lbnQgYXJjaGl0ZWN0
dXJlOg0KDQpbUEFUQ0ggdjQsIDEzLzE1XSBkdC1iaW5kaW5nczogbWVkaWE6IG10ay12Y29kZWM6
IEFkZHMgZGVjb2RlciBkdC0NCmJpbmRpbmdzIGZvciBtdDgxOTINCg0KVGhhbmtzDQpZdW5mZWkg
RG9uZw0KDQpPbiBUdWUsIDIwMjEtMDgtMjQgYXQgMTg6MjEgKzA4MDAsIHl1bmZlaS5kb25nQG1l
ZGlhdGVrLmNvbSB3cm90ZToNCj4gSGkgRXplcXVpZWwsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
c3VnZ2VzdGlvbi4NCj4gDQo+IE9uIFN1biwgMjAyMS0wOC0yMiBhdCAxMTozMiAtMDMwMCwgRXpl
cXVpZWwgR2FyY2lhIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAgQXVnIDIwMjEgYXQgMDQ6NTksIHl1
bmZlaS5kb25nQG1lZGlhdGVrLmNvbQ0KPiA+IDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+IHdy
b3RlOg0KPiA+ID4gDQo+ID4gPiBIaSBFemVxdWllbCwNCj4gPiA+IA0KPiA+ID4gVGhhbmtzIGZv
ciB5b3VyIGRldGFpbCBmZWVkYmFjay4NCj4gPiA+IA0KPiA+ID4gT24gVGh1LCAyMDIxLTA4LTE5
IGF0IDExOjEwIC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwg
MTkgQXVnIDIwMjEgYXQgMDQ6MTMsIHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbQ0KPiA+ID4gPiA8
eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBI
aSBFemVxdWllbCwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGFua3MgZm9yIHlvdXIgc3VnZ2Vz
dGlvbi4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiBXZWQsIDIwMjEtMDgtMTggYXQgMTE6MTEg
LTAzMDAsIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4gPiA+ID4gPiA+ICtkYW52ZXQNCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gSGksDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IE9uIFR1
ZSwgMTAgQXVnIDIwMjEgYXQgMjM6NTgsIFl1bmZlaSBEb25nIDwNCj4gPiA+ID4gPiA+IHl1bmZl
aS5kb25nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBtdWx0aSBoYXJkd2Fy
ZSBkZWNvZGUgaW50bw0KPiA+ID4gPiA+ID4gPiBtdGstdmNvZGVjLA0KPiA+ID4gPiA+ID4gPiBi
eSBmaXJzdA0KPiA+ID4gPiA+ID4gPiBhZGRpbmcgY29tcG9uZW50IGZyYW1ld29yayB0byBtYW5h
Z2UgZWFjaCBoYXJkd2FyZQ0KPiA+ID4gPiA+ID4gPiBpbmZvcm1hdGlvbjoNCj4gPiA+ID4gPiA+
ID4gaW50ZXJydXB0LA0KPiA+ID4gPiA+ID4gPiBjbG9jaywgcmVnaXN0ZXIgYmFzZXMgYW5kIHBv
d2VyLiBTZWNvbmRseSBhZGQgY29yZSB0aHJlYWQNCj4gPiA+ID4gPiA+ID4gdG8gZGVhbA0KPiA+
ID4gPiA+ID4gPiB3aXRoIGNvcmUNCj4gPiA+ID4gPiA+ID4gaGFyZHdhcmUgbWVzc2FnZSwgYXQg
dGhlIHNhbWUgdGltZSwgYWRkIG1zZyBxdWV1ZSBmb3INCj4gPiA+ID4gPiA+ID4gZGlmZmVyZW50
DQo+ID4gPiA+ID4gPiA+IGhhcmR3YXJlDQo+ID4gPiA+ID4gPiA+IHNoYXJlIG1lc3NhZ2VzLiBM
YXN0bHksIHRoZSBhcmNoaXRlY3R1cmUgb2YgZGlmZmVyZW50DQo+ID4gPiA+ID4gPiA+IHNwZWNz
DQo+ID4gPiA+ID4gPiA+IGFyZSBub3QNCj4gPiA+ID4gPiA+ID4gdGhlIHNhbWUsDQo+ID4gPiA+
ID4gPiA+IHVzaW5nIHNwZWNzIHR5cGUgdG8gc2VwYXJhdGUgdGhlbS4NCj4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdvb2QgaWRl
YSB0byBpbnRyb2R1Y2UgdGhlIGNvbXBvbmVudA0KPiA+ID4gPiA+ID4gQVBJDQo+ID4gPiA+ID4g
PiBpbiB0aGUNCj4gPiA+ID4gPiA+IG1lZGlhIHN1YnN5c3RlbS4gSXQgZG9lc24ndCBzZWVtIHRv
IGJlIG1haW50YWluZWQsIElSQw0KPiA+ID4gPiA+ID4gdGhlcmUncyBub3QNCj4gPiA+ID4gPiA+
IGV2ZW4NCj4gPiA+ID4gPiA+IGEgbWFpbnRhaW5lciBmb3IgaXQsIGFuZCBpdCBoYXMgc29tZSBp
c3N1ZXMgdGhhdCB3ZXJlIG5ldmVyDQo+ID4gPiA+ID4gPiBhZGRyZXNzZWQuDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IEl0IHdvdWxkIGJlIHJlYWxseSBpbXBvcnRhbnQgdG8gYXZvaWQgaXQu
IElzIGl0IHJlYWxseQ0KPiA+ID4gPiA+ID4gbmVlZGVkDQo+ID4gPiA+ID4gPiBpbiB0aGUNCj4g
PiA+ID4gPiA+IGZpcnN0IHBsYWNlPw0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGFua3Ms
DQo+ID4gPiA+ID4gPiBFemVxdWllbA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZvciB0aGVyZSBh
cmUgbWFueSBoYXJkd2FyZSBuZWVkIHRvIHVzZSwgbXQ4MTkyIGlzIHRocmVlIGFuZA0KPiA+ID4g
PiA+IG10ODE5NSBpcw0KPiA+ID4gPiA+IGZpdmUuIE1heWJlIG5lZWQgbW9yZSB0byBiZSB1c2Vk
IGluIHRoZSBmZWF0dXJlLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEVhY2ggaGFyZHdhcmUgaGFz
IGluZGVwZW5kZW50IGNsay9wb3dlci9pb21tdSBwb3J0L2lycS4NCj4gPiA+ID4gPiBVc2UgY29t
cG9uZW50IGludGVyZmFjZSBpbiBwcm9iIHRvIGdldCBlYWNoIGNvbXBvbmVudCdzDQo+ID4gPiA+
ID4gaW5mb3JtYXRpb24uDQo+ID4gPiA+ID4gSnVzdCBlbmFibGUgdGhlIGhhcmR3YXJlIHdoZW4g
bmVlZCB0byB1c2UgaXQsIHZlcnkgY29udmVuaWVudA0KPiA+ID4gPiA+IGFuZA0KPiA+ID4gPiA+
IHNpbXBsZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJIGZvdW5kIHRoYXQgdGhlcmUgYXJlIG1h
bnkgbW9kdWxlcyB1c2UgY29tcG9uZW50IHRvIG1hbmFnZQ0KPiA+ID4gPiA+IGhhcmR3YXJlDQo+
ID4gPiA+ID4gaW5mb3JtYXRpb24sIHN1Y2ggYXMgaW9tbXUgYW5kIGRybSBldGMuDQo+ID4gPiA+
ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBNYW55IGRyaXZlcnMgc3VwcG9ydCBtdWx0aXBsZSBoYXJk
d2FyZSB2YXJpYW50cywgd2hlcmUgZWFjaA0KPiA+ID4gPiB2YXJpYW50DQo+ID4gPiA+IGhhcyBh
IGRpZmZlcmVudCBudW1iZXIgb2YgY2xvY2tzIG9yIGludGVycnVwdHMsIHNlZSBmb3INCj4gPiA+
ID4gaW5zdGFuY2UNCj4gPiA+ID4gc3RydWN0IGhhbnRyb192YXJpYW50IHdoaWNoIGFsbG93cyB0
byBleHBvc2UgZGlmZmVyZW50IGNvZGVjDQo+ID4gPiA+IGNvcmVzLA0KPiA+ID4gPiBzb21lIGhh
dmluZyBib3RoIGRlY29kZXIvZW5jb2RlciwgYW5kIHNvbWUgaGF2aW5nIGp1c3QgYQ0KPiA+ID4g
PiBkZWNvZGVyLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIGNvbXBvbmVudCBBUEkgaXMgbW9zdGx5
IHVzZWQgYnkgRFJNIHRvIGFnZ3JlZ2F0ZQ0KPiA+ID4gPiBpbmRlcGVuZGVudA0KPiA+ID4gPiBz
dWJkZXZpY2VzIChjYWxsZWQgY29tcG9uZW50cykgaW50byBhbiBhZ2dyZWdhdGVkIGRyaXZlci4N
Cj4gPiA+ID4gDQo+ID4gPiA+IEZvciBpbnN0YW5jZSwgYSBEUk0gZHJpdmVyIG5lZWRzIHRvIGds
dWUgdG9nZXRoZXIgdGhlIEhETUksDQo+ID4gPiA+IE1JUEksDQo+ID4gPiA+IGFuZCBwbGFueSBj
b250cm9sbGVyLCBvciBhbnkgb3RoZXIgaGFyZHdhcmUgYXJyYW5nZW1lbnQgd2hlcmUNCj4gPiA+
ID4gZGV2aWNlcyBjYW4gYmUgZGVzY3JpYmVkIGluZGVwZW5kZW50bHkuDQo+ID4gPiA+IA0KPiA+
ID4gDQo+ID4gPiBUaGUgdXNhZ2Ugc2NlbmFyaW8gaXMgdmVyeSBzaW1pbGFyIHdpdGggZHJtIGFu
ZCBpb21tdSwgU28gZGVjaWRlDQo+ID4gPiB0bw0KPiA+ID4gdXNlDQo+ID4gPiBjb21wb25lbnQg
ZnJhbWV3b3JrLg0KPiA+ID4gRGVjb2RlIGhhcyB0aHJlZS9maXZlIG9yIG1vcmUgaGFyZHdhcmVz
LCB0aGVzZSBoYXJkd2FyZSBhcmUNCj4gPiA+IGluZGVwZW5kZW50Lg0KPiA+ID4gRm9yIG10ODE4
MyBqdXN0IG5lZWQgY29yZSBoYXJkd2FyZSB0byBkZWNvZGUsIGJ1dCBtdDgxOTIgaGFzDQo+ID4g
PiBsYXQsc29jIGFuZA0KPiA+ID4gY29yZSBoYXJkd2FyZSB0byBkZWNvZGUuIFdoZW4gbGF0IG5l
ZWQgdG8gdXNlLCBqdXN0IGVuYWJsZSBsYXQNCj4gPiA+IGhhcmR3YXJlLA0KPiA+ID4gY29yZSBp
cyB0aGUgc2FtZS5BbmQgbXQ4MTk1IHdpbGwgaGFzIHR3byBjb3JlcywgZWFjaCBjb3JlIGNhbg0K
PiA+ID4gd29yaw0KPiA+ID4gd2VsbA0KPiA+ID4gaW5kZXBlbmRlbnQuDQo+ID4gPiANCj4gPiA+
IEZvciBlYWNoIGNvbXBvbmVudCBkZXZpY2UganVzdCB1c2VkIHRvIG9wZW4gdGhlaXIgcG93ZXIv
Y2xrL2lvbW11DQo+ID4gPiBwb3J0L2lycSB3aGVuIG1hc3RlciBuZWVkIHRvIGVuYWJsZSBpdC4g
VGhlIG1haW4gbG9naWMgaXMgaW4NCj4gPiA+IG1hc3Rlcg0KPiA+ID4gZGV2aWNlLg0KPiA+ID4g
DQo+ID4gPiA+IFRoZSBjb21wb25lbnQgQVBJIG1heSBsb29rIHNpbXBsZSBidXQgaGFzIHNvbWUg
aXNzdWVzLCBpdCdzIG5vdA0KPiA+ID4gPiBlYXN5DQo+ID4gPiA+IHRvIGRlYnVnLCBhbmQgY2Fu
IGNhdXNlIHRyb3VibGVzIGlmIG5vdCB1c2VkIGFzIGV4cGVjdGVkIFsxXS4NCj4gPiA+ID4gSXQn
cyB3b3J0aCBtYWtpbmcgc3VyZSB5b3UgYWN0dWFsbHkgbmVlZCBhIGZyYW1ld29yaw0KPiA+ID4g
PiB0byBnbHVlIGRpZmZlcmVudCBkZXZpY2VzIHRvZ2V0aGVyLg0KPiA+ID4gPiANCj4gPiA+IA0K
PiA+ID4gRWFjaCBoYXJkd2FyZSBoYXMgaXRzIGluZGV4LCBtYXN0ZXIgY2FuIGdldCBoYXJkd2Fy
ZSBpbmZvcm1hdGlvbg0KPiA+ID4gYWNjb3JkaW5nIHRoZXNlIGluZGV4LCBsb29rcyBub3QgY29t
cGxleC4gV2hhdCBkbyB5b3UgbWVhbiBhYm91dA0KPiA+ID4gbm90DQo+ID4gPiBlYXN5IHRvIGRl
YnVnPw0KPiA+ID4gDQo+ID4gPiA+ID4gRG8geW91IGhhdmUgYW55IG90aGVyIHN1Z2dlc3Rpb24g
Zm9yIHRoaXMgYXJjaGl0ZWN0dXJlPw0KPiA+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gTG9v
a2luZyBhdCB0aGUgZGlmZmVyZW50IHBhdGNoc2V0cyB0aGF0IGFyZSBwb3N0ZWQsIGl0J3Mgbm90
DQo+ID4gPiA+IGNsZWFyDQo+ID4gPiA+IHRvIG1lIHdoYXQgZXhhY3RseSBhcmUgdGhlIGRpZmZl
cmVudCBhcmNoaXRlY3R1cmVzIHRoYXQgeW91DQo+ID4gPiA+IGludGVuZA0KPiA+ID4gPiB0byBz
dXBwb3J0LCBjYW4geW91IHNvbWUgZG9jdW1lbnRhdGlvbiB3aGljaCBjbGFyaWZpZXMgdGhhdD8N
Cj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEhhdmUgZml2ZSBoYXJkd2FyZXMgbGF0LHNvYyxjb3Jl
MCxjb3JlMSBhbmQgbWFpbi4gTGF0IHRocmVhZCBjYW4NCj4gPiA+IHVzZSBsYXQNCj4gPiA+IHNv
YyBhbmQgbWFpbiwgY29yZSB0aHJlYWQgY2FuIHVzZSBzb2MsbGF0LCBjb3JlMCBhbmQgY29yZTEu
IENvcmUNCj4gPiA+IHRocmVhZA0KPiA+ID4gY2FuIGJlIHVzZWQgb3Igbm90IGZvciBkaWZmZXJl
bnQgcHJvamVjdC4NCj4gPiANCj4gPiBDYW4geW91IGV4cGxhaW4gd2hhdCBhcmUgdGhlc2UgbGF0
LHNvYyBhbmQgY29yZSB0aHJlYWRzIGZvcj8NCj4gPiANCj4gDQo+IFlvdSBjYW4gcmVnYXJkcyBs
YXQsc29jIGFuZCBjb3JlIGFzIGhhcmR3YXJlLCBlYWNoIGhhcmR3YXJlIGNhbiB3b3JrDQo+IGlu
ZGVwZW5kZW50LiBMYXQgYW5kIGNvcmUgdGhyZWFkcyB1c2VkIHRvIGNvbnRyb2wgaGFyZHdhcmUg
dG8gZGVjb2RlLg0KPiA+ID4gQWxzbyBOZWVkIHRvIHVzZSB0aGVzZQ0KPiA+ID4gaGFyZHdhcmUg
ZHluYW1pYyBhdCB0aGUgc2FtZSB0aW1lLiBTbyBJIHVzZSBjb21wb25lbnQgZnJhbWV3b3JrLA0K
PiA+ID4ganVzdA0KPiA+ID4gbmVlZCB0byBrbm93IHRoZSB1c2VkICBoYXJkd2FyZSBpbmRleCBh
Y2NvcmRpbmcgdG8gZGlmZmVyZW50DQo+ID4gPiBwcm9qZWN0Lk5lZWQgbm90IHRvIGRvIGNvbXBs
ZXggbG9naWMgdG8gbWFuYWdlIHRoZXNlIGhhcmR3YXJlcy4NCj4gPiA+IA0KPiA+IA0KPiA+IEkg
YW0gbm90IHRocmlsbGVkIHRvIHNlZSB0aGUgY29tcG9uZW50IGZyYW1ld29yayBpbnRyb2R1Y2Vk
IHRvIHRoZQ0KPiA+IG1lZGlhIHN1YnN5c3RlbS4gTGlrZSBJIHNhaWQsIGl0IGhhcyBubyBjbGVh
ciBtYWludGFpbmVyLCBhbmQgaXQncw0KPiA+IG5vdA0KPiA+IGVhc3kgdG8gdXNlLg0KPiA+IA0K
PiANCj4gSG93IGRvIHlvdSB0aGluayBhYm91dCBEZW5pZWwgVmV0dGVyJ3MgbWFpbCA/IEl0IGxv
b2tzIHRoYXQgdGhlcmUgYXJlDQo+IG1haW50YWluZXIgZm9yIGl0Lg0KPiA+IFRoZSBtZWRpYSBz
dWJzeXN0ZW0gaGFzIHNvbWUgc3VwcG9ydCB3aGljaCBBRkFJSyBkb2VzIHRoZSBzYW1lDQo+ID4g
dGhpbmcsDQo+ID4gc2VlIHY0bDItYXN5bmMsIHdoaWNoIGlzIG1haW50YWluZWQgYnkgbWVkaWEg
cGVvcGxlLg0KPiA+IA0KPiANCj4gSWYgY29tcG9uZW50IGNhbiBiZSB1c2VkLCBJIHByZWZlciB0
byB1c2UgaXQuIEF0IHRoZSBvdGhlciBoYW5kLCBJDQo+IHdpbGwNCj4gdHJ5IHRvIHVzZSB0aGVz
ZSBtZXRob2QgYXMgY29tcGFyZWQuDQo+ID4gUGxlYXNlIHB1c2ggYSBicmFuY2ggYmFzZWQgb24g
bWVkaWEvbWFzdGVyIGNvbnRhaW5pbmcgdGhlc2UNCj4gPiBjaGFuZ2VzLg0KPiA+IEkgc2VlIHRo
ZXJlIGFyZSBvdGhlciBwYXRjaCBzZXJpZXMgZm9yIHRoaXMgZGV2aWNlLCBidXQgaXQncyBoYXJk
DQo+ID4gdG8NCj4gPiB0cmFjaw0KPiA+IHdoaWNoIGdvZXMgZmlyc3QsIGV0Yy4NCj4gPiANCj4g
DQo+IEkgbmVlZCB0aW1lIHRvIHB1c2ggYSBicmFuY2gsIG9yIHlvdSBjYW4gZ2V0IHRoZSBsYXRl
c3Qga2VybmVsIGFuZA0KPiBnaXQNCj4gYW0gdGhlc2UgcGF0Y2hlcywgbWF5YmUgbXVjaCBxdWlj
a2VyLg0KPiA+IFRoYW5rcywNCj4gPiBFemVxdWllbA0KPiANCj4gVGhhbmtzLA0KPiBZdW5mZWkg
RG9uZw0K

