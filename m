Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1725914C74B
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 09:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgA2IRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 03:17:11 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:40530 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726214AbgA2IRL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 03:17:11 -0500
X-UUID: 0a371151a4cc49a58946e7a75e3f8ec4-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=INKR0i+Hxnse1nE1cbIAERiSPrh/G+JRIrLKl829tUM=;
        b=SoApOkEQfNl4+LmTGWfcntVeiW7jBTtcokAr6b7ZgbKlpmdwzqhNZXf+4ikn8RJX1OCx2F0OEYZitAMw09NhKlsxqIfLDgKAweLgNHiPMuBMxMEgcVb064CWUHEIJLQw+l/hXFbauUQgqN37jqHGYPr5XDyF26/rS/ZHQ59DwMY=;
X-UUID: 0a371151a4cc49a58946e7a75e3f8ec4-20200129
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 927428477; Wed, 29 Jan 2020 16:17:08 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 16:15:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 Jan 2020 16:17:12 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <louis.kuo@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [RFC PATCH V5 2/3] dt-bindings: mt8183: Add sensor interface dt-bindings
Date:   Wed, 29 Jan 2020 16:16:49 +0800
Message-ID: <20200129081650.8027-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200129081650.8027-1-louis.kuo@mediatek.com>
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHRoZSBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBzZW5z
b3IgaW50ZXJmYWNlDQptb2R1bGUgaW4gTWVkaWF0ZWsgU29Dcy4NCg0KU2lnbmVkLW9mZi1ieTog
TG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLXNlbmluZi50eHQgICAgICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKw0K
IDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1zZW5pbmYudHh0
DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
bWVkaWF0ZWstc2VuaW5mLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9tZWRpYXRlay1zZW5pbmYudHh0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMDAwMDAwLi44NWE5OTA4MTRiZGYNCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1zZW5pbmYudHh0DQpAQCAtMCww
ICsxLDY2IEBADQorIGNhKiBNZWRpYXRlayBzZW5pbmYgTUlQSS1DU0kyIGhvc3QgZHJpdmVyDQor
DQorU2VuaW5mIE1JUEktQ1NJMiBob3N0IGRyaXZlciBpcyBhIEhXIGNhbWVyYSBpbnRlcmZhY2Ug
Y29udHJvbGxlci4gSXQgc3VwcG9ydA0KK2Egd2lkZWx5IGFkb3B0ZWQsIHNpbXBsZSwgaGlnaC1z
cGVlZCBwcm90b2NvbCBwcmltYXJpbHkgaW50ZW5kZWQgZm9yDQorcG9pbnQtdG8tcG9pbnQgaW1h
Z2UgYW5kIHZpZGVvIHRyYW5zbWlzc2lvbiBiZXR3ZWVuIGNhbWVyYXMgYW5kIGhvc3QgZGV2aWNl
cy4NCisNCitSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KKyAgLSBjb21wYXRpYmxlOiAibWVkaWF0ZWss
bXQ4MTgzLXNlbmluZiINCisgIC0gcmVnOiBNdXN0IGNvbnRhaW4gYW4gZW50cnkgZm9yIGVhY2gg
ZW50cnkgaW4gcmVnLW5hbWVzLg0KKyAgLSByZWctbmFtZXM6IE11c3QgaW5jbHVkZSB0aGUgZm9s
bG93aW5nIGVudHJpZXM6DQorICAgICJiYXNlIjogc2VuaW5mIHJlZ2lzdGVycyBiYXNlDQorICAg
ICJyeCI6IFJ4IGFuYWxvZyByZWdpc3RlcnMgYmFzZQ0KKyAgLSBpbnRlcnJ1cHRzOiBpbnRlcnJ1
cHQgbnVtYmVyIHRvIHRoZSBjcHUuDQorICAtIGNsb2NrcyA6IGNsb2NrIG5hbWUgZnJvbSBjbG9j
ayBtYW5hZ2VyLg0KKyAgLSBjbG9jay1uYW1lczogbXVzdCBiZSBDTEtfQ0FNX1NFTklORiBhbmQg
Q0xLX1RPUF9NVVhfU0VOSU5GLA0KKyAgICBJdCBpcyB0aGUgY2xvY2tzIG9mIHNlbmluZi4NCisg
IC0gcG9ydHMgOiBsaXN0IHBvcnQgbm9kZSBvZiBlbmRwb2ludC4NCisgIC0gcG9ydCA6IGRlc2Ny
aWJlIGVuZHBvaW50IGZvciBlYWNoIHJlbW90ZSBkZXZpY2UgcG9ydCBjb25uZWN0ZWQgdG8gdGhp
cw0KKyAgCQkgICBwb3J0Lg0KKyAgCXJlZyA6IHBvcnQgcmVnIDAgbXVzdCBiZSBtYWluIGNhbWVy
YSwgcG9ydCByZWcgMSBtdXN0IGJlIHN1YiBjYW1lcmEsDQorICAJCSAgc2luY2Ugc2VuaW5mIGRy
aXZlciBzdXBwb3J0IHVwdG8gNCBjYW1lcmFzLCBzbyBjYW1pc3AgaXMgcmVnIDQuDQorDQorRXhh
bXBsZToNCisJCXNlbmluZjogc2VuaW5mQDFhMDQwMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE4My1zZW5pbmYiOw0KKwkJCXJlZyA9IDwwIDB4MWEwNDAwMDAgMCAweDgwMDA+
LA0KKwkJCSAgICAgIDwwIDB4MTFjODAwMDAgMCAweDYwMDA+Ow0KKwkJCXJlZy1uYW1lcyA9ICJi
YXNlIiwgInJ4IjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjUxIElSUV9UWVBFX0xFVkVM
X0xPVz47DQorCQkJcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01BSU5f
Q0FNPjsNCisJCQljbG9ja3MgPSA8JmNhbXN5cyBDTEtfQ0FNX1NFTklORj4sDQorCQkJCSA8JnRv
cGNrZ2VuIENMS19UT1BfTVVYX1NFTklORj47DQorCQkJY2xvY2stbmFtZXMgPSAiQ0xLX0NBTV9T
RU5JTkYiLCAiQ0xLX1RPUF9NVVhfU0VOSU5GIjsNCisNCisJCQlwb3J0cyB7DQorCQkJCSNhZGRy
ZXNzLWNlbGxzID0gPDE+Ow0KKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCisNCisJCQkJcG9ydEAw
IHsNCisJCQkJCXJlZyA9IDwwPjsNCisNCisJCQkJCXNlbmluZl9wb3J0MF9lbmRwb2ludDogZW5k
cG9pbnQgew0KKwkJCQkJCWRhdGEtbGFuZXMgPSA8MCAxIDMgND47DQorCQkJCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZvdjg4NTZfZW5kcG9pbnQ+Ow0KKwkJCQkJfTsNCisJCQkJfTsNCisNCisJCQkJ
cG9ydEAxIHsNCisJCQkJCXJlZyA9IDwxPjsNCisNCisJCQkJCXNlbmluZl9wb3J0MV9lbmRwb2lu
dDogZW5kcG9pbnQgew0KKwkJCQkJCWRhdGEtbGFuZXMgPSA8MT47DQorCQkJCQkJcmVtb3RlLWVu
ZHBvaW50ID0gPCZvdjAyYTEwX2VuZHBvaW50PjsNCisJCQkJCX07DQorCQkJCX07DQorDQorCQkJ
CXBvcnRANCB7DQorCQkJCQlyZWcgPSA8ND47DQorDQorCQkJCQlzZW5pbmZfY2FtaXNwX2VuZHBv
aW50OiBlbmRwb2ludCB7DQorCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZjYW1pc3BfZW5kcG9p
bnQ+Ow0KKwkJCQkJfTsNCisJCQkJfTsNCisJCQl9Ow0KKwkJfTsNCisNCi0tIA0KMi4xOC4wDQo=

