Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902BA1819EC
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbgCKNfd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:35:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:48343 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729551AbgCKNfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:35:32 -0400
X-UUID: 1b2608dd0db04fff83e9cf39cfe30b47-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=McO5u8qL+2dJhFVvrj+B5fmGSNs+dJJtNOnC6DdTdJc=;
        b=Aq27vvjZcvPOEPPn1VNJtKGPz6WrJtnaFEyaa8jSyrsFfrILJyPzYOqgxePyAya8KC2mLT8/vgOfd6KPFoZSr+Y4pZ9gWMtNGzSiletX7KV/lmGONr6a2bmjO6WedI3oBdfT8+Ak1lf87cpENZBvc4592FWQK54VW8YlFht246c=;
X-UUID: 1b2608dd0db04fff83e9cf39cfe30b47-20200311
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1823203278; Wed, 11 Mar 2020 21:35:27 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:35:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:35:10 +0800
Message-ID: <1583933726.1550.1.camel@mtksdaap41>
Subject: Re: [PATCH v11 5/5] soc / drm: mediatek: Fix mediatek-drm device
 probing
From:   CK Hu <ck.hu@mediatek.com>
To:     Matthias Brugger <mbrugger@suse.com>
CC:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-mediatek@lists.infradead.org>,
        "Collabora Kernel ML" <kernel@collabora.com>,
        <dri-devel@lists.freedesktop.org>,
        "Seiya Wang" <seiya.wang@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <wens@csie.org>,
        Daniel Vetter <daniel@ffwll.ch>, <linux-clk@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        <devicetree@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        <frank-w@public-files.de>, <linux-arm-kernel@lists.infradead.org>,
        <hsinyi@chromium.org>, Richard Fontana <rfontana@redhat.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, <sean.wang@mediatek.com>,
        <rdunlap@infradead.org>, <matthias.bgg@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Date:   Wed, 11 Mar 2020 21:35:26 +0800
In-Reply-To: <4e30f8a7-7334-494b-7ef6-205f5d6d4d36@suse.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
         <20200311115614.1425528-6-enric.balletbo@collabora.com>
         <4e30f8a7-7334-494b-7ef6-205f5d6d4d36@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTAzLTExIGF0IDE0OjI2ICswMTAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMTEvMDMvMjAyMCAxMjo1NiwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSB3cm90
ZToNCj4gPiBJbiB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uIHRoZSBzYW1lIGNvbXBhdGlibGUg
c3RyaW5nDQo+ID4gIm1lZGlhdGVrLDxjaGlwPi1tbXN5cyIgaXMgdXNlZCB0byBiaW5kIHRoZSBj
bG9jayBkcml2ZXJzDQo+ID4gKGRyaXZlcnMvc29jL21lZGlhdGVrKSBhcyB3ZWxsIGFzIHRvIHRo
ZSBncHUgZHJpdmVyDQo+ID4gKGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
KS4gVGhpcyBlbmRzIHdpdGggdGhlIHByb2JsZW0NCj4gPiB0aGF0IHRoZSBvbmx5IHByb2JlZCBk
cml2ZXIgaXMgdGhlIGNsb2NrIGRyaXZlciBhbmQgdGhlcmUgaXMgbm8gZGlzcGxheQ0KPiA+IGF0
IGFsbC4NCj4gPiANCj4gPiBJbiBhbnkgY2FzZSBoYXZpbmcgdGhlIHNhbWUgY29tcGF0aWJsZSBz
dHJpbmcgZm9yIHR3byBkcml2ZXJzIGlzIG5vdA0KPiA+IGNvcnJlY3QgYW5kIHNob3VsZCBiZSBm
aXhlZC4gVG8gZml4IHRoaXMsIGFuZCBtYWludGFpbiBiYWNrd2FyZA0KPiA+IGNvbXBhdGliaWxp
dHksIHdlIGNhbiBjb25zaWRlciB0aGF0IHRoZSBtbXN5cyBkcml2ZXIgaXMgdGhlIHRvcC1sZXZl
bA0KPiA+IGVudHJ5IHBvaW50IGZvciB0aGUgbXVsdGltZWRpYSBzdWJzeXN0ZW0sIHNvIGlzIG5v
dCBhIHB1cmUgY2xvY2sNCj4gPiBjb250cm9sbGVyIGJ1dCBhIHN5c3RlbSBjb250cm9sbGVyLCBh
bmQgdGhlIGRybSBkcml2ZXIgaXMgaW5zdGFudGlhdGVkDQo+ID4gYnkgdGhhdCBNTVNZUyBkcml2
ZXIuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5y
aWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFNhbWUgaGVyZS4NCg0KQWNrZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+DQo=

