Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84DD443F2D
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 10:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhKCJWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 05:22:02 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:38900 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231240AbhKCJWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 05:22:01 -0400
X-UUID: 81b2f125b4a4481993f1f838972f7b03-20211103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FdCg3e0Gwi5y3/o458qrVWVoU7UhKyiLjyePMFkXn6E=;
        b=utOpz18/wQtiEKpwmNI7KOxcqS+RbDlTyqGnjgnswtKNLOYNRMUVR+6CZ5rGnIW44DzHfEAjSlX/XYEjZCO4MOe8uImCGe1bLR9zipuayjxLfJHt7sKKMzBGtSie39viC1utEIxTA8iMdayGZ5biXLPjjil+DR/+O4KeWhGjswU=;
X-UUID: 81b2f125b4a4481993f1f838972f7b03-20211103
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 766378157; Wed, 03 Nov 2021 17:19:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 3 Nov 2021 17:19:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 3 Nov 2021 17:19:20 +0800
Message-ID: <8dfc07306b853126e8109fc953fd6388b63c65d2.camel@mediatek.com>
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From:   Irui Wang <irui.wang@mediatek.com>
To:     houlong wei <houlong.wei@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        "Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=" 
        <tiffany.lin@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Date:   Wed, 3 Nov 2021 17:19:19 +0800
In-Reply-To: <c01c2c6e2351c915fb6e55b025bf2ab5c449f045.camel@mediatek.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
         <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
         <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
         <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
         <c01c2c6e2351c915fb6e55b025bf2ab5c449f045.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNClRoZSAibGVuIiBvZiBzaGFyZV9idWYgY29waWVkIHNob3VsZCBiZSBhbHdheXMgOCBh
bGlnbm1lbnQ7DQpkbyB5b3UgaGF2ZSBvdGhlciBsb2dzIHRvIHByb3ZlIHRoZSBsZW4gaXMgbm90
IDggYWxpZ25tZW50IHdoZW4gZXJyb3JzDQphcHBlYXI/IA0KPj4gWzU4LjM1MDg0MV0gbXRrLW1k
cCAxNDAwMTAwMC5yZG1hOiBwcm9jZXNzaW5nIGZhaWxlZDogLTIyDQoNCk9uIFdlZCwgMjAyMS0x
MS0wMyBhdCAxNjowMyArMDgwMCwgaG91bG9uZyB3ZWkgd3JvdGU6DQo+IEFkZCBtdGstdnB1IGRy
aXZlciBleHBlcnQgaXJ1aS53YW5nIGluIHRoZSBsb29wLg0KPiANCj4gT24gTW9uLCAyMDIxLTEw
LTE4IGF0IDE1OjA3ICswODAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3RlOg0KPiA+IA0KPiA+IE9u
IDE4LjEwLjIxIDAzOjE2LCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCj4gPiA+IEhpIEhhbnMh
DQo+ID4gPiANCj4gPiA+IE9uIE1vbiwgT2N0IDQsIDIwMjEgYXQgNjozNyBQTSBIYW5zIFZlcmt1
aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4g
T24gMjAvMDkvMjAyMSAxOTowNCwgRGFmbmEgSGlyc2NoZmVsZCB3cm90ZToNCj4gPiA+ID4gPiBG
cm9tOiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAY2hyb21pdW0ub3JnPg0KPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IFdoZW4gcnVubmluZyBtZW1jcHlfdG9pbzoNCj4gPiA+ID4gPiBtZW1jcHlf
dG9pbyhzZW5kX29iai0+c2hhcmVfYnVmLCBidWYsIGxlbik7DQo+ID4gPiA+ID4gaXQgd2FzIGZv
dW5kIHRoYXQgZXJyb3JzIGFwcGVhciBpZiBsZW4gaXMgbm90IGEgbXVsdGlwbGUgb2YNCj4gPiA+
ID4gPiA4Og0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFs1OC4zNTA4NDFdIG10ay1tZHAgMTQwMDEw
MDAucmRtYTogcHJvY2Vzc2luZyBmYWlsZWQ6IC0yMg0KPiA+ID4gPiANCj4gPiA+ID4gV2h5IGRv
IGVycm9ycyBhcHBlYXI/IElzIHRoYXQgZHVlIHRvIGEgSFcgYnVnPyBTb21lIG90aGVyDQo+ID4g
PiA+IHJlYXNvbj8NCj4gPiA+IA0KPiA+ID4gTVRLIGZvbGtzIHdvdWxkIGJlIHRoZSBiZXN0IHBs
YWNlZCB0byBhbnN3ZXIgdGhpcywgYnV0IHNpbmNlIHRoZQ0KPiA+ID4gZmFpbHVyZSBpcyByZXBv
cnRlZCBieSB0aGUgZmlybXdhcmUgSSdkIHN1c3BlY3QgZWl0aGVyIGEgZmlybXdhcmUNCj4gPiA+
IG9yDQo+ID4gPiBoYXJkd2FyZSBsaW1pdGF0aW9uLg0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IFRoaXMgcGF0Y2ggZW5zdXJlcyB0aGUgY29weSBvZiBhIG11bHRpcGxl
IG9mIDggc2l6ZSBieQ0KPiA+ID4gPiA+IGNhbGxpbmcNCj4gPiA+ID4gPiByb3VuZF91cChsZW4s
IDgpIHdoZW4gY29weWluZw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZpeGVzOiBlNjU5OWFkZmFk
MzAgKCJtZWRpYTogbXRrLXZwdTogYXZvaWQgdW5hbGlnbmVkIGFjY2Vzcw0KPiA+ID4gPiA+IHRv
DQo+ID4gPiA+ID4gRFRDTSBidWZmZXIuIikNCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAY2hyb21pdW0ub3JnPg0KPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPA0KPiA+ID4gPiA+IGVucmljLmJhbGxldGJv
QGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFmbmEgSGlyc2NoZmVs
ZCA8DQo+ID4gPiA+ID4gZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tDQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogSG91bG9uZyBXZWkgPGhvdWxv
bmcud2VpQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiBjaGFuZ2VzIHNp
bmNlIHYzOg0KPiA+ID4gPiA+IDEuIG11bHRpbGUgLT4gbXVsdGlwbGUNCj4gPiA+ID4gPiAyLiBh
ZGQgaW5saW5lIGRvYw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGNoYW5nZXMgc2luY2UgdjI6DQo+
ID4gPiA+ID4gMS4gZG8gdGhlIGV4dHJhIGNvcHkgb25seSBpZiBsZW4gaXMgbm90IG11bHRpcGxl
IG9mIDgNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBjaGFuZ2VzIHNpbmNlIHYxOg0KPiA+ID4gPiA+
IDEuIGNoYW5nZSBzaWduLW9mZi1ieSB0YWdzDQo+ID4gPiA+ID4gMi4gY2hhbmdlIHZhbHVlcyB0
byBtZW1zZXQNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLXZwdS9tdGtfdnB1LmMgfCAxNQ0KPiA+ID4gPiA+ICsrKysrKysrKysrKysrLQ0KPiA+ID4g
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdnB1L210a192cHUuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dnB1L210a192cHUuYw0KPiA+ID4gPiA+IGluZGV4IGVjMjkwZGRlNTljZi4uMWRmMDMxNzE2Yzhm
IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9t
dGtfdnB1LmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUv
bXRrX3ZwdS5jDQo+ID4gPiA+ID4gQEAgLTM0OSw3ICszNDksMjAgQEAgaW50IHZwdV9pcGlfc2Vu
ZChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ID4gPiA+ID4gKnBkZXYsDQo+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgfQ0KPiA+ID4gPiA+ICAgICAgICB9IHdoaWxlICh2cHVfY2ZnX3JlYWRsKHZw
dSwgSE9TVF9UT19WUFUpKTsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAtICAgICBtZW1jcHlfdG9p
byhzZW5kX29iai0+c2hhcmVfYnVmLCBidWYsIGxlbik7DQo+ID4gPiA+ID4gKyAgICAgLyoNCj4g
PiA+ID4gPiArICAgICAgKiB3aGVuIGNvcHlpbmcgZGF0YSB0byB0aGUgdnB1IGhhcmR3YXJlLCB0
aGUNCj4gPiA+ID4gPiBtZW1jcHlfdG9pbw0KPiA+ID4gPiA+IG9wZXJhdGlvbiBtdXN0IGNvcHkN
Cj4gPiA+ID4gPiArICAgICAgKiBhIG11bHRpcGxlIG9mIDguIE90aGVyd2lzZSB0aGUgcHJvY2Vz
c2luZyBmYWlscw0KPiA+ID4gPiANCj4gPiA+ID4gU2FtZSBoZXJlOiBpdCBuZWVkcyB0byBleHBs
YWluIHdoeSB0aGUgcHJvY2Vzc2luZyBmYWlscy4NCj4gPiANCj4gPiBJcyB3cml0aW5nICdkdWUg
dG8gaGFyZHdhcmUgb3IgZmlybXdhcmUgbGltaXRhdGlvbicgZW5vdWdoPw0KPiA+IElmIG5vdCwg
dGhlbiB3ZSBzaG91bGQgd2FpdCBmb3IgbWVkaWF0ZWsgcGVvcGxlJ3MgcmVzcG9uc2UgdG8NCj4g
PiBleHBsYWluDQo+ID4gaWYgdGhleSBrbm93IG1vcmUNCj4gPiANCj4gPiA+ID4gDQo+ID4gPiA+
ID4gKyAgICAgICovDQo+ID4gPiA+ID4gKyAgICAgaWYgKGxlbiAlIDggIT0gMCkgew0KPiA+ID4g
PiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgY2hhciBkYXRhW1NIQVJFX0JVRl9TSVpFXTsNCj4g
PiA+ID4gDQo+ID4gPiA+IFdvdWxkbid0IGl0IGJlIG1vcmUgcm9idXN0IGlmIHlvdSBzYXk6DQo+
ID4gPiA+IA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGNoYXIgZGF0YVtzaXpl
b2Yoc2VuZF9vYmotDQo+ID4gPiA+ID5zaGFyZV9idWYpXTsNCj4gPiA+IA0KPiA+ID4gRGVmaW5p
dGVseSB5ZXMuDQo+ID4gDQo+ID4gSSdsbCBzZW5kIHY1IGZpeGluZyB0aGlzDQo+ID4gDQo+ID4g
PiANCj4gPiA+ID4gDQo+ID4gPiA+IEkgYWxzbyB0aGluayB0aGF0IHRoZSBTSEFSRV9CVUZfU0la
RSBkZWZpbmUgbmVlZHMgYSBjb21tZW50DQo+ID4gPiA+IHN0YXRpbmcgdGhhdCBpdCBtdXN0IGJl
IGENCj4gPiA+ID4gbXVsdGlwbGUgb2YgOCwgb3RoZXJ3aXNlIHVuZXhwZWN0ZWQgdGhpbmdzIGNh
biBoYXBwZW4uDQo+ID4gPiA+IA0KPiA+ID4gPiBZb3UgYWxzbyBub3RpY2VkIHRoYXQgdGhlIGN1
cnJlbnQgU0hBUkVfQlVGX1NJWkUgZGVmaW5lIGlzIHRvbw0KPiA+ID4gPiBsb3csIGJ1dCBJIHNh
dw0KPiA+ID4gPiBubyBwYXRjaCBjb3JyZWN0aW5nIHRoaXMuIFNob3VsZG4ndCB0aGF0IGJlIGZp
eGVkIGFzIHdlbGw/DQo+ID4gPiANCj4gPiA+IEFGQUlDVCB0aGUgZmlybXdhcmUgZXhwZWN0cyB0
aGlzIGV4YWN0IHNpemUgb24gaXRzIGVuZCwgc28gSQ0KPiA+ID4gZG9uJ3QNCj4gPiA+IGJlbGll
dmUgaXQgY2FuIGJlIGNoYW5nZWQgdGhhdCBlYXNpbHkuIEJ1dCBtYXliZSBzb21lb25lIGZyb20g
TVRLDQo+ID4gPiBjYW4NCj4gPiA+IHByb3ZlIG1lIHdyb25nLg0KPiA+ID4gDQo+ID4gDQo+ID4g
SSBsb29rZWQgZnVydGhlciBhbmQgbm90ZWQgdGhhdCB0aGUgc3RydWN0cyB0aGF0IGFyZSBsYXJn
ZXIgdGhhbg0KPiA+ICdTSEFSRV9CVUZfU0laRScNCj4gPiAodmVuY19hcF9pcGlfbXNnX2VuY19l
eHQgdmVuY19hcF9pcGlfbXNnX3NldF9wYXJhbV9leHQpDQo+ID4gYXJlIHVzZWQgYnkgZHJpdmVy
cyB0aGF0IGRvbid0IHVzZSB0aGlzIHZwdSBhcGksIHNvIGFjdHVhbGx5DQo+ID4gU0hBUkVfQlVG
X1NJWkUgaXMNCj4gPiBub3QgdG9vIGxvdyBhbmQgYXMgQ29ydXJib3Qgd29ydGUgcHJvYmFibHkg
bm90IGNoYW5nZWFibGUuDQo+ID4gDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IERhZm5hDQo+ID4g
DQo+ID4gPiBDaGVlcnMsDQo+ID4gPiBBbGV4Lg0KPiA+ID4gDQo+IA0KPiANCg==

