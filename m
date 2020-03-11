Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11F081819E1
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729552AbgCKNfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:35:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40066 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729351AbgCKNfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:35:10 -0400
X-UUID: 108a54581c49486ca1be2f781fa40ef6-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=aPE7C1DToCF06kD0ZOb8rAXB9DZEZ5xKdvZNq0Iup4g=;
        b=dCca50A23pdM+oPmMojPZZSSssbCgzg2ECfXYEOilVKVUoiKBB774a+SYABGgK7jqrkC/GUpTHtEIjT6tnxmvWHgSV5zLAGRFoeO4NJ6FTPAvjjEWt5+VzYGLWyPdrzLuNBSfbN+DtcaFWWzLNJZ/C3WgDkiU4QIJIsflgfPrS4=;
X-UUID: 108a54581c49486ca1be2f781fa40ef6-20200311
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 31662184; Wed, 11 Mar 2020 21:35:03 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:33:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:34:39 +0800
Message-ID: <1583933694.1550.0.camel@mtksdaap41>
Subject: Re: [PATCH v11 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
From:   CK Hu <ck.hu@mediatek.com>
To:     Matthias Brugger <mbrugger@suse.com>
CC:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "Minghsiu Tsai" <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        <airlied@linux.ie>, <mturquette@baylibre.com>,
        <dri-devel@lists.freedesktop.org>,
        Richard Fontana <rfontana@redhat.com>,
        <laurent.pinchart@ideasonboard.com>,
        <ulrich.hecht+renesas@gmail.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        <linux-clk@vger.kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
        <wens@csie.org>, <linux-arm-kernel@lists.infradead.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <frank-w@public-files.de>,
        Seiya Wang <seiya.wang@mediatek.com>, <sean.wang@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>, <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Allison Randal <allison@lohutok.net>, <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, <matthias.bgg@kernel.org>
Date:   Wed, 11 Mar 2020 21:34:54 +0800
In-Reply-To: <db86a097-db98-1952-8afb-875ba7719719@suse.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
         <20200311115614.1425528-5-enric.balletbo@collabora.com>
         <1583932064.29614.6.camel@mtksdaap41>
         <db86a097-db98-1952-8afb-875ba7719719@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FEED9D50E1FD1D5B5973048C686B2F8561908BC0A65B8DDC33BB0FC3950D5EFA2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTAzLTExIGF0IDE0OjI1ICswMTAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTEvMDMvMjAyMCAxNDowNywgQ0sgSHUgd3JvdGU6DQo+ID4gSGksIEVucmlj
Og0KPiA+IA0KPiA+IE9uIFdlZCwgMjAyMC0wMy0xMSBhdCAxMjo1NiArMDEwMCwgRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSB3cm90ZToNCj4gPj4gUHJvdmlkZSBhIG10a19tbXN5c19kZHBfY29ubmVj
dCgpIGFuZCBtdGtfbW1zeXNfZGlzY29ubmVjdCgpIGZ1bmN0aW9ucyB0bw0KPiA+PiByZXBsYWNl
IG10a19kZHBfYWRkX2NvbXBfdG9fcGF0aCgpIGFuZCBtdGtfZGRwX3JlbW92ZV9jb21wX2Zyb21f
cGF0aCgpLg0KPiA+PiBUaG9zZSBmdW5jdGlvbnMgd2lsbCBhbGxvdyBEUk0gZHJpdmVyIGFuZCBv
dGhlcnMgdG8gY29udHJvbCB0aGUgZGF0YQ0KPiA+PiBwYXRoIHJvdXRpbmcuDQo+ID4+DQo+ID4g
DQo+ID4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQo+ID4gDQo+IA0K
PiBJZiBJIHJlbWVtYmVyIGNvcnJlY3RseSB5b3UgYXJlIE9LIG1lIHRha2luZyB0aGUgcGF0Y2gg
dGhyb3VnaCB0aGUgU29DIHRyZWUsIHJpZ2h0Pw0KPiANCj4gSW4gdGhpcyBjYXNlIEknZCBuZWVk
IGEgQWNrZWQtYnkgdGFnLiBOb3QgYSBiaWcgZGVhbCwganVzdCB0cnlpbmcgdG8gcmVtZWJlciB0
aGUNCj4gdGFnIHBvbGljeSBpbiB0aGUgbGludXgga2VybmVsIDopDQo+IA0KPiBSZWdhcmRzLA0K
PiBNYXR0aGlhcw0KPiANCg0KQWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoN
Cj4gPj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0
Ym9AY29sbGFib3JhLmNvbT4NCj4gPj4gUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1h
dHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+ID4+IC0tLQ0KPiA+Pg0KPiA+PiBDaGFuZ2VzIGluIHYx
MTogTm9uZQ0KPiA+PiBDaGFuZ2VzIGluIHYxMDoNCj4gPj4gLSBTZWxlY3QgQ09ORklHX01US19N
TVNZUyAoQ0spDQo+ID4+IC0gUGFzcyBkZXZpY2UgcG9pbnRlciBvZiBtbXN5cyBkZXZpY2UgaW5z
dGVhZCBvZiBjb25maWcgcmVncyAoQ0spDQo+ID4+DQo+ID4+IENoYW5nZXMgaW4gdjk6DQo+ID4+
IC0gSW50cm9kdWNlZCBhIG5ldyBwYXRjaCB0byBtb3ZlIHJvdXRpbmcgY29udHJvbCBpbnRvIG1t
c3lzIGRyaXZlci4NCj4gPj4gLSBSZW1vdmVkIHRoZSBwYXRjaCB0byB1c2UgcmVnbWFwIGFzIGlz
IG5vdCBuZWVkZWQgYW55bW9yZS4NCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2ODogTm9uZQ0KPiA+
PiBDaGFuZ2VzIGluIHY3OiBOb25lDQo+ID4+DQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvS2NvbmZpZyAgICAgICAgfCAgIDEgKw0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jIHwgIDE5ICstDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHAuYyAgfCAyNTYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmggIHwgICA3IC0NCj4gPj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8ICAxNCArLQ0KPiA+PiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggIHwgICAyICstDQo+ID4+ICBkcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstbW1zeXMuYyAgICAgICAgfCAyNzkgKysrKysrKysrKysrKysrKysrKysr
KysrDQo+ID4+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCAgfCAgMjAg
KysNCj4gPj4gIDggZmlsZXMgY2hhbmdlZCwgMzE2IGluc2VydGlvbnMoKyksIDI4MiBkZWxldGlv
bnMoLSkNCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuaA0KPiA+Pg0KPiA+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0KDQo=

