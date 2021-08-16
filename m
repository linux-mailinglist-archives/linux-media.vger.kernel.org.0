Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5683E3ECC2C
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 03:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbhHPBGc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 21:06:32 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:10761 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230124AbhHPBGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 21:06:32 -0400
X-UUID: ccd23a6d65b844c88c27015bb99eb98c-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=cCh/bJfAbZNucKLCPO13R09wwwch9hhcF+Y61K8xM1c=;
        b=VJHimzQ9bSUPPXfyGJDfKkS1mhXs3C9YrgOCizWSCkaiEAN4+1KefLCmisxE4v7+kufYkqb93uUGy5BrpOOUcWq1EHYHtY42lP8rwdIwRXCTlzGS0emAfJrGu2WNfKhC0JToC+K4u73n7CxEaXFEfLbIYGKwqIjH7t3HgbhQLwg=;
X-UUID: ccd23a6d65b844c88c27015bb99eb98c-20210816
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1651534672; Mon, 16 Aug 2021 09:05:58 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 09:05:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 09:05:53 +0800
Message-ID: <aef8182ffa2142f2c8ed6bda463d3c127530deae.camel@mediatek.com>
Subject: Re: [PATCH v6 2/9] mtk-mdp: add driver to probe mdp components
From:   houlong wei <houlong.wei@mediatek.com>
To:     Eizan Miyamoto <eizan@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wenst@chromium.org" <wenst@chromium.org>,
        "Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?=" <Yong.Wu@mediatek.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=" 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?=" 
        <Minghsiu.Tsai@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date:   Mon, 16 Aug 2021 09:05:54 +0800
In-Reply-To: <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
         <20210802220943.v6.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A659D5C5114DCB0D519E7AE6BF06F886D97DA649E2D55A72D3EC3A65199A1B172000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTA4LTAyIGF0IDIwOjEyICswODAwLCBFaXphbiBNaXlhbW90byB3cm90ZToN
Cj4gQnJvYWRseSwgdGhpcyBwYXRjaCAoMSkgYWRkcyBhIGRyaXZlciBmb3IgdmFyaW91cyBNVEsg
TURQIGNvbXBvbmVudHMNCj4gdG8NCj4gZ28gYWxvbmdzaWRlIHRoZSBtYWluIE1USyBNRFAgZHJp
dmVyLCBhbmQgKDIpIGhvb2tzIHRoZW0gYWxsIHRvZ2V0aGVyDQo+IHVzaW5nIHRoZSBjb21wb25l
bnQgZnJhbWV3b3JrLg0KPiANCj4gKDEpIFVwIHVudGlsIG5vdywgdGhlIE1USyBNRFAgZHJpdmVy
IGNvbnRyb2xzIDggZGV2aWNlcyBpbiB0aGUgZGV2aWNlDQo+IHRyZWUgb24gaXRzIG93bi4gV2hl
biBydW5uaW5nIHRlc3RzIGZvciB0aGUgaGFyZHdhcmUgdmlkZW8gZGVjb2RlciwNCj4gd2UNCj4g
Zm91bmQgdGhhdCB0aGUgaW9tbXVzIGFuZCBMQVJCcyB3ZXJlIG5vdCBiZWluZyBwcm9wZXJseSBj
b25maWd1cmVkLg0KPiBUbw0KPiBjb25maWd1cmUgdGhlbSwgYSBkcml2ZXIgZm9yIGVhY2ggYmUg
YWRkZWQgdG8gbXRrX21kcF9jb21wIHNvIHRoYXQNCj4gbXRrX2lvbW11X2FkZF9kZXZpY2UoKSBj
YW4gKGV2ZW50dWFsbHkpIGJlIGNhbGxlZCBmcm9tDQo+IGRtYV9jb25maWd1cmUoKQ0KPiBpbnNp
ZGUgcmVhbGx5X3Byb2JlKCkuDQo+IA0KPiAoMikgVGhlIGludGVncmF0aW9uIGludG8gdGhlIGNv
bXBvbmVudCBmcmFtZXdvcmsgYWxsb3dzIHVzIHRvIGRlZmVyDQo+IHRoZQ0KPiByZWdpc3RyYXRp
b24gd2l0aCB0aGUgdjRsMiBzdWJzeXN0ZW0gdW50aWwgYWxsIHRoZSBNRFAtcmVsYXRlZA0KPiBk
ZXZpY2VzDQo+IGhhdmUgYmVlbiBwcm9iZWQsIHNvIHRoYXQgdGhlIHJlbGV2YW50IGRldmljZSBu
b2RlIGRvZXMgbm90IGJlY29tZQ0KPiBhdmFpbGFibGUgdW50aWwgaW5pdGlhbGl6YXRpb24gb2Yg
YWxsIHRoZSBjb21wb25lbnRzIGlzIGNvbXBsZXRlLg0KPiANCj4gU29tZSBub3RlcyBhYm91dCBo
b3cgdGhlIGNvbXBvbmVudCBmcmFtZXdvcmsgaGFzIGJlZW4gaW50ZWdyYXRlZDoNCj4gDQo+IC0g
VGhlIGRyaXZlciBmb3IgdGhlIHJkbWEwIGNvbXBvbmVudCBzZXJ2ZXMgZG91YmxlIGR1dHkgYXMg
dGhlDQo+ICJtYXN0ZXIiDQo+ICAgKGFnZ3JlZ2F0ZSkgZHJpdmVyIGFzIHdlbGwgYXMgYSBjb21w
b25lbnQgZHJpdmVyLiBUaGlzIGlzIGEgbm9uLQ0KPiBpZGVhbA0KPiAgIGNvbXByb21pc2UgdW50
aWwgYSBiZXR0ZXIgc29sdXRpb24gaXMgZGV2ZWxvcGVkLiBUaGlzIGRldmljZSBpcw0KPiAgIGRp
ZmZlcmVudGlhdGVkIGZyb20gdGhlIHJlc3QgYnkgY2hlY2tpbmcgZm9yIGEgIm1lZGlhdGVrLHZw
dSINCj4gcHJvcGVydHkNCj4gICBpbiB0aGUgZGV2aWNlIG5vZGUuDQo+IA0KPiAtIFRoZSBsaXN0
IG9mIG1kcCBjb21wb25lbnRzIHJlbWFpbnMgaGFyZC1jb2RlZCBhcw0KPiBtdGtfbWRwX2NvbXBf
ZHRfaWRzW10NCj4gICBpbiBtdGtfbWRwX2NvcmUuYywgYW5kIGFzIG10a19tZHBfY29tcF9kcml2
ZXJfZHRfbWF0Y2hbXSBpbg0KPiAgIG10a19tZHBfY29tcC5jLiBUaGlzIHVuZm9ydHVuYXRlIGR1
cGxpY2F0aW9uIG9mIGluZm9ybWF0aW9uIGlzDQo+ICAgYWRkcmVzc2VkIGluIGEgZm9sbG93aW5n
IHBhdGNoIGluIHRoaXMgc2VyaWVzLg0KPiANCj4gLSBUaGUgY29tcG9uZW50IGRyaXZlciBjYWxs
cyBjb21wb25lbnRfYWRkKCkgZm9yIGVhY2ggZGV2aWNlIHRoYXQgaXMNCj4gICBwcm9iZWQuDQo+
IA0KPiAtIEluIG10a19tZHBfcHJvYmUgKHRoZSAibWFzdGVyIiBkZXZpY2UpLCB3ZSBzY2FuIHRo
ZSBkZXZpY2UgdHJlZSBmb3INCj4gICBhbnkgbWF0Y2hpbmcgbm9kZXMgYWdhaW5zdCBtdGtfbWRw
X2NvbXBfZHRfaWRzLCBhbmQgYWRkIGNvbXBvbmVudA0KPiAgIG1hdGNoZXMgZm9yIHRoZW0uIFRo
ZSBtYXRjaCBjcml0ZXJpYSBpcyBhIG1hdGNoaW5nIGRldmljZSBub2RlDQo+ICAgcG9pbnRlci4N
Cj4gDQo+IC0gV2hlbiB0aGUgc2V0IG9mIGNvbXBvbmVudHMgZGV2aWNlcyB0aGF0IGhhdmUgYmVl
biBwcm9iZWQNCj4gY29ycmVzcG9uZHMNCj4gICB3aXRoIHRoZSBsaXN0IHRoYXQgaXMgZ2VuZXJh
dGVkIGJ5IHRoZSAibWFzdGVyIiwgdGhlIGNhbGxiYWNrIHRvDQo+ICAgbXRrX21kcF9tYXN0ZXJf
YmluZCgpIGlzIG1hZGUsIHdoaWNoIHRoZW4gY2FsbHMgdGhlIGNvbXBvbmVudCBiaW5kDQo+ICAg
ZnVuY3Rpb25zLg0KPiANCj4gLSBJbnNpZGUgbXRrX21kcF9tYXN0ZXJfYmluZCgpLCBvbmNlIGFs
bCB0aGUgY29tcG9uZW50IGJpbmQgZnVuY3Rpb25zDQo+ICAgaGF2ZSBiZWVuIGNhbGxlZCwgd2Ug
Y2FuIHRoZW4gcmVnaXN0ZXIgb3VyIGRldmljZSB0byB0aGUgdjRsMg0KPiAgIHN1YnN5c3RlbS4N
Cj4gDQo+IC0gVGhlIGNhbGwgdG8gcG1fcnVudGltZV9lbmFibGUoKSBpbiB0aGUgbWFzdGVyIGRl
dmljZSBpcyBjYWxsZWQNCj4gYWZ0ZXINCj4gICBhbGwgdGhlIGNvbXBvbmVudHMgaGF2ZSBiZWVu
IHJlZ2lzdGVyZWQgYnkgdGhlaXIgYmluZCgpIGZ1bmN0aW9ucw0KPiAgIGNhbGxlZCBieSBtdGtf
bXRwX21hc3Rlcl9iaW5kKCkuIEFzIGEgcmVzdWx0LCB0aGUgbGlzdCBvZg0KPiBjb21wb25lbnRz
DQo+ICAgd2lsbCBub3QgY2hhbmdlIHdoaWxlIHBvd2VyIG1hbmFnZW1lbnQgY2FsbGJhY2tzIG10
a19tZHBfc3VzcGVuZCgpLw0KPiAgIHJlc3VtZSgpIGFyZSBhY2Nlc3NpbmcgdGhlIGxpc3Qgb2Yg
Y29tcG9uZW50cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEVpemFuIE1peWFtb3RvIDxlaXphbkBj
aHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiANCg0KUmV2aWV3ZWQtYnk6IEhvdWxvbmcgV2VpIDxob3Vs
b25nLndlaUBtZWRpYXRlay5jb20+DQoNCj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+IA0KWy4u
Ll0NCg==

