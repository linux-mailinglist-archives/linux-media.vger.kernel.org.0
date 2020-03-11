Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D5818192C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgCKNH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:07:58 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:64978 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729331AbgCKNH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:07:57 -0400
X-UUID: 428ecd7073f44e89a7ac1fcf3f96f3d5-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ClGTqPIGoVqVr3jF7yujqXX6Xpj7o2+++464APlQxj8=;
        b=LV46WzqoLmIqPw8Wv7lHymUdjdvBT1Cdo1c9eAdaXElWx/V/xGaSci8c7/+kVw80LuR0ok4gaXOXA2U18MZyKJ968MVMcJFrIGbjg9jJXctJ5YS7Fs0uWX8k+FmYXas41unGSKcfzTk+LzNeEisLSZaRX6qdRpUhpQOYjZnegyM=;
X-UUID: 428ecd7073f44e89a7ac1fcf3f96f3d5-20200311
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 888826361; Wed, 11 Mar 2020 21:07:52 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:07:50 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:06:53 +0800
Message-ID: <1583932064.29614.6.camel@mtksdaap41>
Subject: Re: [PATCH v11 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
From:   CK Hu <ck.hu@mediatek.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>,
        "Allison Randal" <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-mediatek@lists.infradead.org>,
        "Collabora Kernel ML" <kernel@collabora.com>,
        <dri-devel@lists.freedesktop.org>,
        "Seiya Wang" <seiya.wang@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <wens@csie.org>,
        Daniel Vetter <daniel@ffwll.ch>, <linux-clk@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        <devicetree@vger.kernel.org>,
        "Matthias Brugger" <mbrugger@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        <frank-w@public-files.de>, <linux-arm-kernel@lists.infradead.org>,
        <hsinyi@chromium.org>, Richard Fontana <rfontana@redhat.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, <sean.wang@mediatek.com>,
        <rdunlap@infradead.org>, <matthias.bgg@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Date:   Wed, 11 Mar 2020 21:07:44 +0800
In-Reply-To: <20200311115614.1425528-5-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
         <20200311115614.1425528-5-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D78B7E686CD1B535834D80DC0678BB113F1681C82C2C2E34388BCBCE202CC48B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBXZWQsIDIwMjAtMDMtMTEgYXQgMTI6NTYgKzAxMDAsIEVucmljIEJh
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IFByb3ZpZGUgYSBtdGtfbW1zeXNfZGRwX2Nvbm5lY3Qo
KSBhbmQgbXRrX21tc3lzX2Rpc2Nvbm5lY3QoKSBmdW5jdGlvbnMgdG8NCj4gcmVwbGFjZSBtdGtf
ZGRwX2FkZF9jb21wX3RvX3BhdGgoKSBhbmQgbXRrX2RkcF9yZW1vdmVfY29tcF9mcm9tX3BhdGgo
KS4NCj4gVGhvc2UgZnVuY3Rpb25zIHdpbGwgYWxsb3cgRFJNIGRyaXZlciBhbmQgb3RoZXJzIHRv
IGNvbnRyb2wgdGhlIGRhdGENCj4gcGF0aCByb3V0aW5nLg0KPiANCg0KUmV2aWV3ZWQtYnk6IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0
Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4NCj4gUmV2aWV3ZWQtYnk6
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+DQo+IC0tLQ0KPiANCj4g
Q2hhbmdlcyBpbiB2MTE6IE5vbmUNCj4gQ2hhbmdlcyBpbiB2MTA6DQo+IC0gU2VsZWN0IENPTkZJ
R19NVEtfTU1TWVMgKENLKQ0KPiAtIFBhc3MgZGV2aWNlIHBvaW50ZXIgb2YgbW1zeXMgZGV2aWNl
IGluc3RlYWQgb2YgY29uZmlnIHJlZ3MgKENLKQ0KPiANCj4gQ2hhbmdlcyBpbiB2OToNCj4gLSBJ
bnRyb2R1Y2VkIGEgbmV3IHBhdGNoIHRvIG1vdmUgcm91dGluZyBjb250cm9sIGludG8gbW1zeXMg
ZHJpdmVyLg0KPiAtIFJlbW92ZWQgdGhlIHBhdGNoIHRvIHVzZSByZWdtYXAgYXMgaXMgbm90IG5l
ZWRlZCBhbnltb3JlLg0KPiANCj4gQ2hhbmdlcyBpbiB2ODogTm9uZQ0KPiBDaGFuZ2VzIGluIHY3
OiBOb25lDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgICAgICAgIHwg
ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8ICAxOSAr
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgIHwgMjU2IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cC5oICB8ICAgNyAtDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAg
fCAgMTQgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICB8ICAg
MiArLQ0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgICAgICAgIHwgMjc5ICsr
KysrKysrKysrKysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmggIHwgIDIwICsrDQo+ICA4IGZpbGVzIGNoYW5nZWQsIDMxNiBpbnNlcnRpb25zKCsp
LCAyODIgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgNCj4gDQoNCg==

