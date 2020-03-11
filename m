Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5FA18191F
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729505AbgCKNGB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:06:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51271 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729345AbgCKNGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:06:01 -0400
X-UUID: a88d23ee84d24c6f87ab8de3e23780a0-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Mp2aZPUa6vRdl4F4YlSPXJ1sI5MSD/01Q/eOy0GtTQI=;
        b=iyj05Fw0ZIkoFngYSieienICJb8iu/QUVoBTVNlGmL+GyI5SB+CJ59Cq8HqSyTeO4MJQ7s3q3FxEE1+RhG1IhFZvT4bP32K4AzR1jDPhL4jZjPjQ8oBpIWtb64oiqmQQ2uiAKz6A4NMBGx6gWHuUGcQN/xX66qoKzUDU9JKN+9k=;
X-UUID: a88d23ee84d24c6f87ab8de3e23780a0-20200311
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 257172720; Wed, 11 Mar 2020 21:05:54 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:05:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:05:01 +0800
Message-ID: <1583931952.29614.5.camel@mtksdaap41>
Subject: Re: [PATCH v11 3/5] clk / soc: mediatek: Move mt8173 MMSYS to
 platform driver
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
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Owen Chen <owen.chen@mediatek.com>
Date:   Wed, 11 Mar 2020 21:05:52 +0800
In-Reply-To: <20200311115614.1425528-4-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
         <20200311115614.1425528-4-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D784D3DAEEA661B9A0D6E2A96065163283990E8ECB339D1E7BA070311362A5752000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBXZWQsIDIwMjAtMDMtMTEgYXQgMTI6NTYgKzAxMDAsIEVucmljIEJh
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2Vy
QHN1c2UuY29tPg0KPiANCj4gVGhlcmUgaXMgbm8gc3Ryb25nIHJlYXNvbiBmb3IgdGhpcyB0byB1
c2UgQ0xLX09GX0RFQ0xBUkUgaW5zdGVhZCBvZg0KPiBiZWluZyBhIHBsYXRmb3JtIGRyaXZlci4g
UGx1cywgTU1TWVMgcHJvdmlkZXMgY2xvY2tzIGJ1dCBhbHNvIGEgc2hhcmVkDQo+IHJlZ2lzdGVy
IHNwYWNlIGZvciB0aGUgbWVkaWF0ZWstZHJtIGFuZCB0aGUgbWVkaWF0ZWstbWRwDQo+IGRyaXZl
ci4gU28gbW92ZSB0aGUgTU1TWVMgY2xvY2tzIHRvIGEgbmV3IHBsYXRmb3JtIGRyaXZlciBhbmQg
YWxzbw0KPiBjcmVhdGUgYSBuZXcgTU1TWVMgcGxhdGZvcm0gZHJpdmVyIGluIGRyaXZlcnMvc29j
L21lZGlhdGVrIHRoYXQNCj4gaW5zdGFudGlhdGVzIHRoZSBjbG9jayBkcml2ZXIuDQo+IA0KDQpS
ZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
RW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4NCj4g
LS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYxMToNCj4gLSBMZWF2ZSB0aGUgY2xvY2tzIHBhcnQgaW4g
ZHJpdmVycy9jbGsgKGNsay1tdDgxNzMtbW0pDQo+IC0gSW5zdGFudGlhdGUgdGhlIGNsb2NrIGRy
aXZlciBmcm9tIHRoZSBtdGstbW1zeXMgZHJpdmVyLg0KPiAtIEFkZCBkZWZhdWx0IGNvbmZpZyBv
cHRpb24gdG8gbm90IGJyZWFrIGFueXRoaW5nLg0KPiAtIFJlbW92ZWQgdGhlIFJldmlld2VkLWJ5
IENLIHRhZyBhcyBjaGFuZ2VkIHRoZSBvcmdhbml6YXRpb24uDQo+IA0KPiBDaGFuZ2VzIGluIHYx
MDoNCj4gLSBSZW5hbWVkIHRvIGJlIGdlbmVyaWMgbXRrLW1tc3lzDQo+IC0gQWRkIGRyaXZlciBk
YXRhIHN1cHBvcnQgdG8gYmUgYWJsZSB0byBzdXBwb3J0IGRpZmVyZW50IFNvQ3MNCj4gDQo+IENo
YW5nZXMgaW4gdjk6DQo+IC0gTW92ZSBtbXN5cyB0byBkcml2ZXJzL3NvYy9tZWRpYXRlayAoQ0sp
DQo+IA0KPiBDaGFuZ2VzIGluIHY4Og0KPiAtIEJlIGEgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIg
bGlrZSBvdGhlciBtZWRpYXRlayBtbXN5cyBkcml2ZXJzLg0KPiANCj4gQ2hhbmdlcyBpbiB2NzoN
Cj4gLSBGcmVlIGNsa19kYXRhLT5jbGtzIGFzIHdlbGwNCj4gLSBHZXQgcmlkIG9mIHByaXZhdGUg
ZGF0YSBzdHJ1Y3R1cmUNCj4gDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9LY29uZmlnICAgICAg
ICAgfCAgIDcgKysNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL01ha2VmaWxlICAgICAgICB8ICAg
MSArDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLW1tLmMgfCAxNDYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTcz
LmMgICAgfCAxMDQgLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
S2NvbmZpZyAgICAgICAgIHwgICA4ICsrDQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmls
ZSAgICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgICAg
IHwgIDUwICsrKysrKysrKw0KPiAgNyBmaWxlcyBjaGFuZ2VkLCAyMTMgaW5zZXJ0aW9ucygrKSwg
MTA0IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlh
dGVrL2Nsay1tdDgxNzMtbW0uYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21l
ZGlhdGVrL210ay1tbXN5cy5jDQo+IA0KDQo+ICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19NVDgx
ODNfQ0FNU1lTKSArPSBjbGstbXQ4MTgzLWNhbS5vDQoNCg0K

