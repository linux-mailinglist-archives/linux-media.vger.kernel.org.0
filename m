Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2093415CFA7
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 03:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgBNCC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 21:02:59 -0500
Received: from mailgw01.mediatek.com ([216.200.240.184]:37030 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgBNCC7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 21:02:59 -0500
X-UUID: bd4dd24d56574b39878d2be9792b1aaf-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=5kuuBKwpTdX0p4HJiRAoqn7HWcPfUW5EtfpYL3ZhCNs=;
        b=t2l4dAhY+2Fng+4k5/ovqJsy1gYRA9OXtImVPDXaON1Zp4etcAr0r9Hc3MJF869tohF8vm+gODwMd25Ugs0Yx8wW0RWQ4/ob0R9niL7MhYVk34jMBD4vOKE4X7BpJrrI3e3idHell2kQKZQ0OK62kSJTGWZwtzvqdlcheRkHu00=;
X-UUID: bd4dd24d56574b39878d2be9792b1aaf-20200213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1788984706; Thu, 13 Feb 2020 18:02:50 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 17:53:01 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 09:52:11 +0800
Message-ID: <1581645161.22833.6.camel@mtksdaap41>
Subject: Re: [PATCH v7 11/13] clk: mediatek: mt8183: switch mmsys to
 platform device probing
From:   CK Hu <ck.hu@mediatek.com>
To:     <matthias.bgg@kernel.org>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        <enric.balletbo@collabora.com>, <devicetree@vger.kernel.org>,
        <drinkcat@chromium.org>, <frank-w@public-files.de>,
        <sean.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <wens@csie.org>,
        <linux-mediatek@lists.infradead.org>, <rdunlap@infradead.org>,
        <hsinyi@chromium.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>,
        Matthias Brugger <mbrugger@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>
Date:   Fri, 14 Feb 2020 09:52:41 +0800
In-Reply-To: <20200213201953.15268-12-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
         <20200213201953.15268-12-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIE1hdHRoaWFzOg0KDQpPbiBUaHUsIDIwMjAtMDItMTMgYXQgMjE6MTkgKzAxMDAsIG1hdHRo
aWFzLmJnZ0BrZXJuZWwub3JnIHdyb3RlOg0KPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1
Z2dlckBzdXNlLmNvbT4NCj4gDQo+IFN3aXRjaCBwcm9iaW5nIGZvciB0aGUgTU1TWVMgdG8gc3Vw
cG9ydCBpbnZvY2F0aW9uIHRvIGENCj4gcGxhaW4gcGFsdGZvcm0gZGV2aWNlLiBUaGUgZHJpdmVy
IHdpbGwgYmUgcHJvYmVkIGJ5IHRoZSBEUk0gc3Vic3lzdGVtLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+DQo+IA0KPiAtLS0NCj4gDQo+
IENoYW5nZXMgaW4gdjc6DQo+IC0gZnJlZSBjbGtfZGF0YS0+Y2xrcyBhcyB3ZWxsDQo+IC0gZ2V0
IHJpZCBvZiBwcml2YXRlIGRhdGEgc3RydWN0dXJlDQo+IA0KPiBDaGFuZ2VzIGluIHY2OiBOb25l
DQo+IENoYW5nZXMgaW4gdjU6IE5vbmUNCj4gQ2hhbmdlcyBpbiB2NDogTm9uZQ0KPiBDaGFuZ2Vz
IGluIHYzOiBOb25lDQo+IENoYW5nZXMgaW4gdjI6IE5vbmUNCj4gDQo+ICBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ4MTgzLW1tLmMgfCAzMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4My1tbS5jIGIv
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4My1tbS5jDQo+IGluZGV4IDcyMGM2OTZiNTA2
ZC4uNzU3NmNkMjMxYmUzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGst
bXQ4MTgzLW1tLmMNCj4gKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4My1tbS5j
DQo+IEBAIC0zLDggKzMsMTAgQEANCj4gIC8vIENvcHlyaWdodCAoYykgMjAxOCBNZWRpYVRlayBJ
bmMuDQo+ICAvLyBBdXRob3I6IFdlaXlpIEx1IDx3ZWl5aS5sdUBtZWRpYXRlay5jb20+DQo+ICAN
Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9jbGstcHJv
dmlkZXIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+DQo+ICANCj4gICNpbmNsdWRlICJjbGstbXRrLmgiDQo+ICAjaW5j
bHVkZSAiY2xrLWdhdGUuaCINCj4gQEAgLTg1LDI3ICs4NywzNSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19nYXRlIG1tX2Nsa3NbXSA9IHsNCj4gIHN0YXRpYyBpbnQgY2xrX210ODE4M19tbV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBjbGtf
b25lY2VsbF9kYXRhICpjbGtfZGF0YTsNCj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBw
ZGV2LT5kZXYub2Zfbm9kZTsNCj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5k
ZXYucGFyZW50LT5vZl9ub2RlOw0KPiArDQo+ICsJY2xrX2RhdGEgPSBkZXZtX2t6YWxsb2MoJnBk
ZXYtPmRldiwgc2l6ZW9mKCpjbGtfZGF0YSksIEdGUF9LRVJORUwpOw0KDQpJIHRoaW5rIHRoaXMg
aXMgcmVkdW5kYW50Lg0KDQo+ICsJaWYgKCFjbGtfZGF0YSkNCj4gKwkJcmV0dXJuIC1FTk9NRU07
DQo+ICANCj4gIAljbGtfZGF0YSA9IG10a19hbGxvY19jbGtfZGF0YShDTEtfTU1fTlJfQ0xLKTsN
Cj4gKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBjbGtfZGF0YSk7DQo+ICANCj4gLQltdGtf
Y2xrX3JlZ2lzdGVyX2dhdGVzKG5vZGUsIG1tX2Nsa3MsIEFSUkFZX1NJWkUobW1fY2xrcyksDQo+
IC0JCQljbGtfZGF0YSk7DQo+ICsJbXRrX2Nsa19yZWdpc3Rlcl9nYXRlcyhub2RlLCBtbV9jbGtz
LCBBUlJBWV9TSVpFKG1tX2Nsa3MpLCBjbGtfZGF0YSk7DQo+ICANCj4gIAlyZXR1cm4gb2ZfY2xr
X2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0YSk7DQo+
ICB9DQo+ICANCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21hdGNoX2Ns
a19tdDgxODNfbW1bXSA9IHsNCj4gLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1t
bXN5cyIsIH0sDQo+IC0Je30NCj4gLX07DQo+ICtzdGF0aWMgaW50IGNsa19tdDgxODNfbW1fcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGNsa19v
bmVjZWxsX2RhdGEgKmNsa19kYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICsN
Cj4gKwlrZnJlZShjbGtfZGF0YS0+Y2xrcyk7DQo+ICsJa2ZyZWUoY2xrX2RhdGEpOw0KDQpUaGVz
ZSB0d28gc3RhdGVtZW50IGxvb2tzIGxpa2UgYSByZXZlcnNlIG9mIG10a19hbGxvY19jbGtfZGF0
YSgpIGFuZA0KZXhpc3QgaW4gbWFueSBmaWxlcy4gSXQgaXMgd29ydGggdG8gaGF2ZSBhIGZ1bmN0
aW9uIChtYXliZQ0KbXRrX2ZyZWVfY2xrX2RhdGEoKSkgdG8gZG8gdGhpcy4NCg0KSW4gYWRkaXRp
b24sIHNob3VsZCB3ZSB1bmRvIHdoYXQgaXMgZG9uZSBpbiBjbGtfbXQ4MTgzX21tX3Byb2JlKCkg
c3VjaA0KYXMgbXRrX2Nsa19yZWdpc3Rlcl9nYXRlcygpIGFuZCBvZl9jbGtfYWRkX3Byb3ZpZGVy
KCk/DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gIA0KPiAg
c3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgY2xrX210ODE4M19tbV9kcnYgPSB7DQo+ICAJ
LnByb2JlID0gY2xrX210ODE4M19tbV9wcm9iZSwNCj4gKwkucmVtb3ZlID0gY2xrX210ODE4M19t
bV9yZW1vdmUsDQo+ICAJLmRyaXZlciA9IHsNCj4gIAkJLm5hbWUgPSAiY2xrLW10ODE4My1tbSIs
DQo+IC0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX2Nsa19tdDgxODNfbW0sDQo+ICAJfSwN
Cj4gIH07DQo+IC0NCj4gLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKGNsa19tdDgxODNfbW1fZHJ2
KTsNCj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoY2xrX210ODE4M19tbV9kcnYpOw0KDQo=

