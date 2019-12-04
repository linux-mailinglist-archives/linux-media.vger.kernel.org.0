Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB6BF112BF9
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 13:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727947AbfLDMru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 07:47:50 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:26126 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726832AbfLDMru (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 07:47:50 -0500
X-UUID: f18fa69322cc45e1ab17f4a1c9dc5efb-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KxvD0a/3+K+qwa8tLVxwYamVAtpP7g9ERVWtfSAT/8c=;
        b=AuE8Pgx+8PONe5L5kPo8msSVfHidSBZBY9a414GPVuWZXxpNoU3VIVdZGNOLUbfwRSdTNOuOtRCnZI5tpdyQ+zAxtJgICCqxrq3Hvq7dV8wlchXpJp7UEWKEIcfz3PU28i3QuM7NGKHt9CHib0ByKQyZLNpP7EqaAfrwf6dNd+s=;
X-UUID: f18fa69322cc45e1ab17f4a1c9dc5efb-20191204
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1867055940; Wed, 04 Dec 2019 20:47:45 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 20:47:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 20:46:49 +0800
From:   Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <pihsun@chromium.org>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.com>
Subject: [RFC PATCH V4 2/4] dt-bindings: mt8183: Added FD dt-bindings
Date:   Wed, 4 Dec 2019 20:47:30 +0800
Message-ID: <20191204124732.10932-3-Jerry-Ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogSmVycnktY2ggQ2hlbiA8amVycnktY2guY2hlbkBtZWRpYXRlay5jb20+DQoNClRoaXMg
cGF0Y2ggYWRkcyBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIHRoZSBGYWNlIERldGVjdGlv
biAoRkQpDQp1bml0IG9mIHRoZSBNZWRpYXRlaydzIG10ODE4MyBTb0MuDQoNClNpZ25lZC1vZmYt
Ynk6IEplcnJ5LWNoIENoZW4gPGplcnJ5LWNoLmNoZW5AbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4u
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE4My1mZC50eHQgICAgIHwgMzQgKysrKysrKysr
KysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRl
ayxtdDgxODMtZmQudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbXQ4MTgzLWZkLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxODMtZmQudHh0DQpuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi40NjQ2NDE3NWI5NWENCi0tLSAvZGV2L251
bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRl
ayxtdDgxODMtZmQudHh0DQpAQCAtMCwwICsxLDM0IEBADQorKiBNZWRpYXRlayBGYWNlIERldGVj
dGlvbiBVbml0IChGRCkNCisNCitGYWNlIERldGVjdGlvbiAoRkQpIHVuaXQgaXMgYSB0eXBpY2Fs
IG1lbW9yeS10by1tZW1vcnkgSFcgZGV2aWNlLg0KK0l0IHByb3ZpZGVzIGhhcmR3YXJlIGFjY2Vs
ZXJhdGVkIGZhY2UgZGV0ZWN0aW9uIGZ1bmN0aW9uLCBhbmQgaXQNCitpcyBhYmxlIHRvIGRldGVj
dCBkaWZmZXJlbnQgcG9zZXMgb2YgZmFjZXMuIEZEIHdpbGwgd3JpdHJlIHJlc3VsdA0KK29mIGRl
dGVjdGVkIGZhY2UgaW50byBtZW1vcnkgYXMgb3V0cHV0Lg0KKw0KK1JlcXVpcmVkIHByb3BlcnRp
ZXM6DQorLSBjb21wYXRpYmxlOiAibWVkaWF0ZWssbXQ4MTgzLWZkIg0KKy0gbWVkaWF0ZWssc2Nw
IDogdGhlIG5vZGUgb2Ygc3lzdGVtIGNvbnRyb2wgcHJvY2Vzc29yIChTQ1ApLCBzZWUNCisgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AudHh0IGZv
ciBkZXRhaWxzLg0KKy0gaW9tbXVzOiBzaG91bGQgcG9pbnQgdG8gdGhlIDMgZW50cmllczogIE00
VV9QT1JUX0NBTV9GRFZUX1JQLA0KKyAgTTRVX1BPUlRfQ0FNX0ZEVlRfV1IgYW5kIE00VV9QT1JU
X0NBTV9GRFZUX1JCLiAgKFBsZWFzZSBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS50eHQgZm9yIGRldGFpbHMuKQ0KKy0gcmVnOiBQ
aHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc3BhY2UuDQor
LSBpbnRlcnJ1cHRzOiBpbnRlcnJ1cHQgbnVtYmVyIHRvIHRoZSBjcHUuDQorLSBjbG9ja3MgOiBt
dXN0IGNvbnRhaW4gdGhlIEZEVlQgY2xvY2ssIHNlZQ0KKyAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dCBmb3IgZGV0YWlscy4NCistIGNs
b2NrLW5hbWVzOiBtdXN0IGJlICJmZCIuDQorLSBwb3dlci1kb21haW46IG11c3QgYmUgIk1UODE4
M19QT1dFUl9ET01BSU5fSVNQIi4NCisNCitFeGFtcGxlOg0KKwlmZDogZmRAMTUwMmIwMDAgew0K
KwkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZmQiOw0KKwkJbWVkaWF0ZWssc2NwID0g
PCZzY3A+Ow0KKwkJaW9tbXVzID0gPCZpb21tdSBNNFVfUE9SVF9DQU1fRkRWVF9SUD4sDQorCQkJ
IDwmaW9tbXUgTTRVX1BPUlRfQ0FNX0ZEVlRfV1I+LA0KKwkJCSA8JmlvbW11IE00VV9QT1JUX0NB
TV9GRFZUX1JCPjsNCisJCXJlZyA9IDwwIDB4MTUwMmIwMDAgMCAweDEwMDA+Ow0KKwkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDI2OSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KKwkJY2xvY2tzID0gPCZp
bWdzeXMgQ0xLX0lNR19GRFZUPjsNCisJCWNsb2NrLW5hbWVzID0gImZkIjsNCisJCXBvd2VyLWRv
bWFpbnMgPSA8JnNjcHN5cyBNVDgxODNfUE9XRVJfRE9NQUlOX0lTUD47DQorCX07DQotLSANCjIu
MTguMA0K

