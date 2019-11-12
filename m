Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EA0F88FB
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbfKLGwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:21 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:40527 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727171AbfKLGwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:21 -0500
X-UUID: 66f4e4138b9f4dd78be9a902bc634396-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0AF6cseuQredUqsiggIl4tlgW63R0K0b7Na++x5d55U=;
        b=iFX20S1dd1EiFQsk9GJQEeVOWEakPjsq51LW+MhkggciJEYbGLLnCR6WNnol++nSiFvqpzxZSxgMR3HPuAKTrv+il2gbhqUauteNoBmGdmvyAImQrNeelBomn1meQzvb9jmEmg2L6ym8tv8ZJR1iU2vWsYA+eb8tTakW+X2oFeQ=;
X-UUID: 66f4e4138b9f4dd78be9a902bc634396-20191112
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 360315643; Tue, 12 Nov 2019 14:52:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:15 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 12 Nov
 2019 14:52:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:13 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        "Minas Harutyunyan" <hminas@synopsys.com>,
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
        NXP Linux Team <linux-imx@nxp.com>, "Bin Liu" <b-liu@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        Colin Ian King <colin.king@canonical.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "Fabrizio Castro" <fabrizio.castro@bp.renesas.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 07/13] usb: dwc2: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:53 +0800
Message-ID: <1573541519-28488-7-git-send-email-chunfeng.yun@mediatek.com>
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
IGRpcmVjdG9yeSwNCnNvIG1vdmUgZHdjMidzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRo
ZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYt
Ynk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjI6DQog
IDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCksIGFuZCB1c2UgdXNi
X2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL2R3YzIvZGVidWdmcy5jIHwgMiArLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMi9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL3VzYi9kd2MyL2RlYnVnZnMu
Yw0KaW5kZXggN2Y2MmY0Y2RjMjY1Li5iOGYyNzkwYWJmOTEgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3VzYi9kd2MyL2RlYnVnZnMuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMi9kZWJ1Z2ZzLmMNCkBA
IC03NzAsNyArNzcwLDcgQEAgaW50IGR3YzJfZGVidWdmc19pbml0KHN0cnVjdCBkd2MyX2hzb3Rn
ICpoc290ZykNCiAJaW50CQkJcmV0Ow0KIAlzdHJ1Y3QgZGVudHJ5CQkqcm9vdDsNCiANCi0Jcm9v
dCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShoc290Zy0+ZGV2KSwgTlVMTCk7DQorCXJv
b3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoaHNvdGctPmRldiksIHVzYl9kZWJ1Z19y
b290KTsNCiAJaHNvdGctPmRlYnVnX3Jvb3QgPSByb290Ow0KIA0KIAlkZWJ1Z2ZzX2NyZWF0ZV9m
aWxlKCJwYXJhbXMiLCAwNDQ0LCByb290LCBoc290ZywgJnBhcmFtc19mb3BzKTsNCi0tIA0KMi4y
My4wDQo=

