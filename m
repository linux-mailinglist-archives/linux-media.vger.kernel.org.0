Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4DFF88F5
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKLGwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:16 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:40347 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725801AbfKLGwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:15 -0500
X-UUID: 090964d8007d4d8db5e1607c97b166d9-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ItzLWUzMhoqBc122fPQikCWY1mBg8y9+EgTZncRAjlw=;
        b=MH7xMV/Wm3pdUJtq2iJgLcZBKnDK4yhLOzVxwuRBViL+A7CLVbhZOKLtBuYez40TCaWgMw3jOXpGZwRhyoOdf7zefVg10KX+1i8HHZEdSCwA8AvAyOaCkJSRLivTThBK2tVtM00OzNlaVm7D2JwSatGeeEzVP2fd74Hrtn0f6oE=;
X-UUID: 090964d8007d4d8db5e1607c97b166d9-20191112
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 828727949; Tue, 12 Nov 2019 14:52:10 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:07 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Bin Liu <b-liu@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Colin Ian King <colin.king@canonical.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 04/13] usb: dwc3: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:50 +0800
Message-ID: <1573541519-28488-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tm93IHRoZSBVU0IgZ2FkZ2V0IHN1YnN5c3RlbSBjYW4gdXNlIHRoZSBVU0IgZGVidWdmcyByb290
IGRpcmVjdG9yeSwNCnNvIG1vdmUgZHdjMydzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRo
ZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYt
Ynk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjI6DQog
IDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCksIGFuZCB1c2UgdXNi
X2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jIHwgMiArLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMu
Yw0KaW5kZXggMWM3OTI3MTAzNDhmLi40ZmU4YjFlMTQ4NWMgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2RlYnVnZnMuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMNCkBA
IC05MTYsNyArOTE2LDcgQEAgdm9pZCBkd2MzX2RlYnVnZnNfaW5pdChzdHJ1Y3QgZHdjMyAqZHdj
KQ0KIAlkd2MtPnJlZ3NldC0+bnJlZ3MgPSBBUlJBWV9TSVpFKGR3YzNfcmVncyk7DQogCWR3Yy0+
cmVnc2V0LT5iYXNlID0gZHdjLT5yZWdzIC0gRFdDM19HTE9CQUxTX1JFR1NfU1RBUlQ7DQogDQot
CXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoZHdjLT5kZXYpLCBOVUxMKTsNCisJ
cm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShkd2MtPmRldiksIHVzYl9kZWJ1Z19y
b290KTsNCiAJZHdjLT5yb290ID0gcm9vdDsNCiANCiAJZGVidWdmc19jcmVhdGVfcmVnc2V0MzIo
InJlZ2R1bXAiLCBTX0lSVUdPLCByb290LCBkd2MtPnJlZ3NldCk7DQotLSANCjIuMjMuMA0K

