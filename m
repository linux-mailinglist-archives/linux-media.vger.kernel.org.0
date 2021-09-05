Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579B74010E9
	for <lists+linux-media@lfdr.de>; Sun,  5 Sep 2021 18:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbhIEQkh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 12:40:37 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:16264 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231847AbhIEQkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 12:40:37 -0400
X-UUID: 37cda44658b14df1af6b188bf2a8d76e-20210906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=IYHM/TW5iLucDN1aj78GLAplFLu5DgDEPRT7Egaqg3A=;
        b=hep3aRWZPwctP/Wcd5mL9NsoVlr7OdC8OhSErAh8uASP2Bu4fjo6GJwIAiiFhaG+IOCsMujxpOPRLUNhDlMK6YFrydIeLcm4PpNawfj66BOWtEz60oi1Bcts17JZPTrIeVM5aW/861TTnYsP7zZnjE6bm5IffyYgGr9pTevFt70=;
X-UUID: 37cda44658b14df1af6b188bf2a8d76e-20210906
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1438420773; Mon, 06 Sep 2021 00:39:27 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 6 Sep
 2021 00:39:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Sep 2021 00:39:24 +0800
Message-ID: <801231146ab32f9e8aafafd05e9730a383b610e8.camel@mediatek.com>
Subject: Re: [PATCH v7 2/7] mtk-mdp: add driver to probe mdp components
From:   houlong wei <houlong.wei@mediatek.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Eizan Miyamoto <eizan@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= 
        <Yong.Wu@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
        CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= 
        <ck.hu@mediatek.com>,
        "Enric Balletbo i Serra" <enric.balletbo@collabora.com>,
        Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?= 
        <yongqiang.niu@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date:   Mon, 6 Sep 2021 00:39:26 +0800
In-Reply-To: <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
References: <20210825063323.3607738-1-eizan@chromium.org>
         <20210825163247.v7.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
         <CAAEAJfDNDXdJFfB-bHhFcqnnKZ0TY--d_wLGddKRymQOLQY4TQ@mail.gmail.com>
         <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F9A8D31A1C3CFFD16F950366DDA0F36054B66FEBF3FB52A11BC2F7D75F8661A82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U29ycnksIEkgZml4IGEgbGluayBlcnJvciBiZWxvdy4NCg0KT24gTW9uLCAyMDIxLTA5LTA2IGF0
IDAwOjIzICswODAwLCBob3Vsb25nIHdlaSB3cm90ZToNCj4gSGkgRXplcXVpZWwsDQo+IA0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgYXR0ZW50aW9uIHRvIHRoaXMgc2VyaWVzIG9mIHBhdGNoZXMuIEkg
YW5zd2VyDQo+IHBhcnRpYWwgb2YgeW91ciBxdWVzdGlvbnMgYmVsb3cuDQo+IFJlZ2FyZHMsDQo+
IEhvdWxvbmcNCj4gDQo+IE9uIFNhdCwgMjAyMS0wOS0wNCBhdCAyMDozNCArMDgwMCwgRXplcXVp
ZWwgR2FyY2lhIHdyb3RlOg0KPiA+IEhpIEVpemFuLA0KPiA+IA0KPiA+IFNvcnJ5IGZvciBzZWVp
bmcgdGhpcyBzZXJpZXMgc28gbGF0ZS4NCj4gPiANCj4gPiBPbiBXZWQsIDI1IEF1ZyAyMDIxIGF0
IDAzOjM1LCBFaXphbiBNaXlhbW90byA8ZWl6YW5AY2hyb21pdW0ub3JnPg0KPiA+IHdyb3RlOg0K
PiA+ID4gDQo+ID4gPiBCcm9hZGx5LCB0aGlzIHBhdGNoICgxKSBhZGRzIGEgZHJpdmVyIGZvciB2
YXJpb3VzIE1USyBNRFANCj4gPiA+IGNvbXBvbmVudHMgdG8NCj4gPiA+IGdvIGFsb25nc2lkZSB0
aGUgbWFpbiBNVEsgTURQIGRyaXZlciwgYW5kICgyKSBob29rcyB0aGVtIGFsbA0KPiA+ID4gdG9n
ZXRoZXINCj4gPiA+IHVzaW5nIHRoZSBjb21wb25lbnQgZnJhbWV3b3JrLg0KPiA+ID4gDQo+ID4g
PiAoMSkgVXAgdW50aWwgbm93LCB0aGUgTVRLIE1EUCBkcml2ZXIgY29udHJvbHMgOCBkZXZpY2Vz
IGluIHRoZQ0KPiA+ID4gZGV2aWNlDQo+ID4gPiB0cmVlIG9uIGl0cyBvd24uIFdoZW4gcnVubmlu
ZyB0ZXN0cyBmb3IgdGhlIGhhcmR3YXJlIHZpZGVvDQo+ID4gPiBkZWNvZGVyLA0KPiA+ID4gd2UN
Cj4gPiA+IGZvdW5kIHRoYXQgdGhlIGlvbW11cyBhbmQgTEFSQnMgd2VyZSBub3QgYmVpbmcgcHJv
cGVybHkNCj4gPiA+IGNvbmZpZ3VyZWQuDQo+ID4gDQo+ID4gV2h5IHdlcmUgbm90IGJlaW5nIHBy
b3Blcmx5IGNvbmZpZ3VyZWQ/IFdoYXQgd2FzIHRoZSBwcm9ibGVtPw0KPiA+IFdoeSBub3QgZml4
aW5nIHRoYXQgaW5zdGVhZD8NCj4gPiANCj4gPiBEb2VzIHRoaXMgbWVhbiB0aGUgZHJpdmVyIGlz
IGN1cnJlbnRseSBicm9rZW4gYW5kIHVudXNhYmxlPw0KPiANCj4gVGhpcyBzZXJpZXMgb2YgcGF0
Y2hlcyBhcmUgc3VwcGxlbWVudHMgdG8gYW5vdGhlciBzZXJpZXMsIHBsZWFzZQ0KPiByZWZlcg0K
PiB0byAgDQo+IA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrL2xpc3QvP3Nlcmllcz01MTUxMjljDQoNCkZpeCB0aGUgbGluayBhZGRyZXNzOiANCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9z
ZXJpZXM9NTIzNzcxDQoNCj4gLCB3aGljaCBhZGQgZGV2aWNlIGxpbmsgYmV0d2VlbiB0aGUgbXRr
LWlvbW11IGNvbnN1bWVyIGFuZCB0aGUgbXRrLQ0KPiBsYXJiIA0KPiBkZXZpY2VzLiBXaXRob3V0
IHRoYXQgc2VyaWVzIG9mIHBhdGNoZXMsIHRoZSBtdGstbWRwIGRyaXZlciBjYW4gd29yaw0KPiB3
ZWxsIHNvIGZhci4NCj4gQnV0IHdpdGggdGhhdCBzZXJpZXMsIGl0IHNlZW1zIHRoZSBkZXZpY2Ug
bGluayBvbmx5IGNhbiBiZQ0KPiBlc3RhYmxpc2hlZA0KPiBmb3IgdGhlIGRldmljZSB3aGljaCBp
cyByZWdpc3RlcmVkIGFzIGEgcGxhdGZvcm0gZHJpdmVyLiBUaGF0J3Mgd2h5DQo+IEVpemFuIGFk
ZHMgdGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyB0byBtYWtlIGFsbCBtZHAgY29tcG9uZW50cyB0byBi
ZQ0KPiByZWdpc3RlcmVkIGFzIHBsYXRmb3JtIGRyaXZlcnMuDQo+IA0KPiA+IA0KPiA+ID4gVG8N
Cj4gPiA+IGNvbmZpZ3VyZSB0aGVtLCBhIGRyaXZlciBmb3IgZWFjaCBiZSBhZGRlZCB0byBtdGtf
bWRwX2NvbXAgc28NCj4gPiA+IHRoYXQNCj4gPiA+IG10a19pb21tdV9hZGRfZGV2aWNlKCkgY2Fu
IChldmVudHVhbGx5KSBiZSBjYWxsZWQgZnJvbQ0KPiA+ID4gZG1hX2NvbmZpZ3VyZSgpDQo+ID4g
PiBpbnNpZGUgcmVhbGx5X3Byb2JlKCkuDQo+ID4gPiANCj4gPiA+ICgyKSBUaGUgaW50ZWdyYXRp
b24gaW50byB0aGUgY29tcG9uZW50IGZyYW1ld29yayBhbGxvd3MgdXMgdG8NCj4gPiA+IGRlZmVy
DQo+ID4gPiB0aGUNCj4gPiA+IHJlZ2lzdHJhdGlvbiB3aXRoIHRoZSB2NGwyIHN1YnN5c3RlbSB1
bnRpbCBhbGwgdGhlIE1EUC1yZWxhdGVkDQo+ID4gPiBkZXZpY2VzDQo+ID4gPiBoYXZlIGJlZW4g
cHJvYmVkLCBzbyB0aGF0IHRoZSByZWxldmFudCBkZXZpY2Ugbm9kZSBkb2VzIG5vdA0KPiA+ID4g
YmVjb21lDQo+ID4gPiBhdmFpbGFibGUgdW50aWwgaW5pdGlhbGl6YXRpb24gb2YgYWxsIHRoZSBj
b21wb25lbnRzIGlzIGNvbXBsZXRlLg0KPiA+ID4gDQo+ID4gPiBTb21lIG5vdGVzIGFib3V0IGhv
dyB0aGUgY29tcG9uZW50IGZyYW1ld29yayBoYXMgYmVlbiBpbnRlZ3JhdGVkOg0KPiA+ID4gDQo+
ID4gPiAtIFRoZSBkcml2ZXIgZm9yIHRoZSByZG1hMCBjb21wb25lbnQgc2VydmVzIGRvdWJsZSBk
dXR5IGFzIHRoZQ0KPiA+ID4gIm1hc3RlciINCj4gPiA+ICAgKGFnZ3JlZ2F0ZSkgZHJpdmVyIGFz
IHdlbGwgYXMgYSBjb21wb25lbnQgZHJpdmVyLiBUaGlzIGlzIGENCj4gPiA+IG5vbi0NCj4gPiA+
IGlkZWFsDQo+ID4gPiAgIGNvbXByb21pc2UgdW50aWwgYSBiZXR0ZXIgc29sdXRpb24gaXMgZGV2
ZWxvcGVkLiBUaGlzIGRldmljZSBpcw0KPiA+ID4gICBkaWZmZXJlbnRpYXRlZCBmcm9tIHRoZSBy
ZXN0IGJ5IGNoZWNraW5nIGZvciBhICJtZWRpYXRlayx2cHUiDQo+ID4gPiBwcm9wZXJ0eQ0KPiA+
ID4gICBpbiB0aGUgZGV2aWNlIG5vZGUuDQo+ID4gPiANCj4gPiANCj4gPiBBcyBJIGhhdmUgc3Rh
dGVkIGluIFl1bmZlaSwgSSBhbSBub3QgY29udmluY2VkIHlvdSBuZWVkIGFuIGFzeW5jDQo+ID4g
ZnJhbWV3b3JrDQo+ID4gYXQgYWxsLiBJdCBzZWVtcyBhbGwgdGhlc2UgZGV2aWNlcyBjb3VsZCBo
YXZlIGJlZW4gbGlua2VkIHRvZ2V0aGVyDQo+ID4gaW4gdGhlIGRldmljZSB0cmVlLCBhbmQgdGhl
biBoYXZlIGEgbWFzdGVyIGRldmljZSB0byB0aWUgdGhlbS4NCj4gPiANCj4gPiBJLmUuIHNvbWV0
aGluZyBsaWtlDQo+ID4gDQo+ID4gbWRwIHsNCj4gPiAgIG1kcF9yZG1hMCB7DQo+ID4gICB9DQo+
ID4gICBtZHBfcnN6MCB7DQo+ID4gICB9DQo+ID4gICBtZHBfcnN6MSB7DQo+ID4gICB9DQo+ID4g
fQ0KPiA+IA0KPiANCj4gVGhlIGNvbW1pdCBtZXNzYWdlIG9mIHRoZSBwYXRjaCBiZWxvdyBleHBs
YWlucyB0aGF0ICIgSWYgdGhlIG1kcF8qDQo+IG5vZGVzIGFyZSB1bmRlciBhbiBtZHAgc3ViLW5v
ZGUsIHRoZWlyIGNvcnJlc3BvbmRpbmcgcGxhdGZvcm0gZGV2aWNlDQo+IGRvZXMgbm90IGF1dG9t
YXRpY2FsbHkgZ2V0IGl0cyBpb21tdSBhc3NpZ25lZCBwcm9wZXJseS4iDQo+IFBsZWFzZSByZWZl
ciB0byANCj4gDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE3My5kdHNpP2g9djUuMTQuMSZpZD04MTI3ODgxZjc0MWRiYmY5YTFkYTllOWJjNTkxMzM4MjAx
NjBiMjE3DQo+IA0KPiA+IEFsbCB0aGlzIGFzeW5jIGdhbWVzIHNlZW0gbGlrZSBtYWtpbmcgdGhl
IGRyaXZlciByZWFsbHkgb2JmdXNjYXRlZCwNCj4gPiB3aGljaCB3aWxsIG1lYW4gaGFyZGVyIHRv
IGRlYnVnIGFuZCBtYWludGFpbi4NCj4gPiBJIGFtIG5vdCBzdXJlIHdlIHdhbnQgdGhhdCBidXJk
ZW4uDQo+ID4gDQo+ID4gRXZlbiBpZiB3ZSBhcmUgYWxsIGZ1bGx5IGNvbnZpbmNlZCB0aGF0IHlv
dSBhYnNvbHV0ZWx5IG5lZWQNCj4gPiBhbiBhc3luYyBmcmFtZXdvcmssIHRoZW4gd2hhdCdzIHdy
b25nIHdpdGggdjRsMi1hc3luYz8NCj4gPiANCj4gPiBJIHdvdWxkIHN0YXJ0IGJ5IGFkZHJlc3Np
bmcgd2hhdCBpcyB3cm9uZyB3aXRoIHRoZSBJT01NVXMNCj4gPiBpbiB0aGUgY3VycmVudCBkZXNp
Z24uDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IEV6ZXF1aWVsDQo+ID4gDQo+ID4gPiAtIFRoZSBs
aXN0IG9mIG1kcCBjb21wb25lbnRzIHJlbWFpbnMgaGFyZC1jb2RlZCBhcw0KPiA+ID4gbXRrX21k
cF9jb21wX2R0X2lkc1tdDQo+ID4gPiAgIGluIG10a19tZHBfY29yZS5jLCBhbmQgYXMgbXRrX21k
cF9jb21wX2RyaXZlcl9kdF9tYXRjaFtdIGluDQo+ID4gPiAgIG10a19tZHBfY29tcC5jLiBUaGlz
IHVuZm9ydHVuYXRlIGR1cGxpY2F0aW9uIG9mIGluZm9ybWF0aW9uIGlzDQo+ID4gPiAgIGFkZHJl
c3NlZCBpbiBhIGZvbGxvd2luZyBwYXRjaCBpbiB0aGlzIHNlcmllcy4NCj4gPiA+IA0KPiA+ID4g
LSBUaGUgY29tcG9uZW50IGRyaXZlciBjYWxscyBjb21wb25lbnRfYWRkKCkgZm9yIGVhY2ggZGV2
aWNlIHRoYXQNCj4gPiA+IGlzDQo+ID4gPiAgIHByb2JlZC4NCj4gPiA+IA0KPiA+ID4gLSBJbiBt
dGtfbWRwX3Byb2JlICh0aGUgIm1hc3RlciIgZGV2aWNlKSwgd2Ugc2NhbiB0aGUgZGV2aWNlIHRy
ZWUNCj4gPiA+IGZvcg0KPiA+ID4gICBhbnkgbWF0Y2hpbmcgbm9kZXMgYWdhaW5zdCBtdGtfbWRw
X2NvbXBfZHRfaWRzLCBhbmQgYWRkDQo+ID4gPiBjb21wb25lbnQNCj4gPiA+ICAgbWF0Y2hlcyBm
b3IgdGhlbS4gVGhlIG1hdGNoIGNyaXRlcmlhIGlzIGEgbWF0Y2hpbmcgZGV2aWNlIG5vZGUNCj4g
PiA+ICAgcG9pbnRlci4NCj4gPiA+IA0KPiA+ID4gLSBXaGVuIHRoZSBzZXQgb2YgY29tcG9uZW50
cyBkZXZpY2VzIHRoYXQgaGF2ZSBiZWVuIHByb2JlZA0KPiA+ID4gY29ycmVzcG9uZHMNCj4gPiA+
ICAgd2l0aCB0aGUgbGlzdCB0aGF0IGlzIGdlbmVyYXRlZCBieSB0aGUgIm1hc3RlciIsIHRoZSBj
YWxsYmFjaw0KPiA+ID4gdG8NCj4gPiA+ICAgbXRrX21kcF9tYXN0ZXJfYmluZCgpIGlzIG1hZGUs
IHdoaWNoIHRoZW4gY2FsbHMgdGhlIGNvbXBvbmVudA0KPiA+ID4gYmluZA0KPiA+ID4gICBmdW5j
dGlvbnMuDQo+ID4gPiANCj4gPiA+IC0gSW5zaWRlIG10a19tZHBfbWFzdGVyX2JpbmQoKSwgb25j
ZSBhbGwgdGhlIGNvbXBvbmVudCBiaW5kDQo+ID4gPiBmdW5jdGlvbnMNCj4gPiA+ICAgaGF2ZSBi
ZWVuIGNhbGxlZCwgd2UgY2FuIHRoZW4gcmVnaXN0ZXIgb3VyIGRldmljZSB0byB0aGUgdjRsMg0K
PiA+ID4gICBzdWJzeXN0ZW0uDQo+ID4gPiANCj4gPiA+IC0gVGhlIGNhbGwgdG8gcG1fcnVudGlt
ZV9lbmFibGUoKSBpbiB0aGUgbWFzdGVyIGRldmljZSBpcyBjYWxsZWQNCj4gPiA+IGFmdGVyDQo+
ID4gPiAgIGFsbCB0aGUgY29tcG9uZW50cyBoYXZlIGJlZW4gcmVnaXN0ZXJlZCBieSB0aGVpciBi
aW5kKCkNCj4gPiA+IGZ1bmN0aW9ucw0KPiA+ID4gICBjYWxsZWQgYnkgbXRrX210cF9tYXN0ZXJf
YmluZCgpLiBBcyBhIHJlc3VsdCwgdGhlIGxpc3Qgb2YNCj4gPiA+IGNvbXBvbmVudHMNCj4gPiA+
ICAgd2lsbCBub3QgY2hhbmdlIHdoaWxlIHBvd2VyIG1hbmFnZW1lbnQgY2FsbGJhY2tzDQo+ID4g
PiBtdGtfbWRwX3N1c3BlbmQoKS8NCj4gPiA+ICAgcmVzdW1lKCkgYXJlIGFjY2Vzc2luZyB0aGUg
bGlzdCBvZiBjb21wb25lbnRzLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFaXphbiBN
aXlhbW90byA8ZWl6YW5AY2hyb21pdW0ub3JnPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IEVucmljIEJh
bGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20NCj4gPiA+ID4NCj4g
PiA+IFJldmlld2VkLWJ5OiBIb3Vsb25nIFdlaSA8aG91bG9uZy53ZWlAbWVkaWF0ZWsuY29tPg0K
PiA+ID4gLS0tDQo+ID4gPiANCj4gDQo+IA0K

