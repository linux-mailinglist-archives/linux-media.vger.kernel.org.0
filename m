Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A7DFC465
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfKNKmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:42:21 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:25791 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726997AbfKNKmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:42:01 -0500
X-UUID: 88bb01ef52364fa79395ae069d99c81e-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VZtdMLNhooktxJq5jkWDpDhrUN1fbUOcEximlph9dNE=;
        b=J4rEX57XGAH4xJbgYNnG5ddO9SPRldsXcpQj9UPeH8XCqhnVz1D36gz363X5fZJwv9ZAl/A7HxQ/hJJ+J8YoqGlG9M+vN1a5jiqqh6F84HWarI+mVLl2+n5yCf0yDFYPOkEj/Cn+2xpvu4JUgPnqO0RvzmHvxzZ8reuak4/v1UA=;
X-UUID: 88bb01ef52364fa79395ae069d99c81e-20191114
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1870169760; Thu, 14 Nov 2019 18:41:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:54 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:50 +0800
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
Subject: [PATCH v3 11/13] usb: gadget: pxa27x: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:23 +0800
Message-ID: <1573728085-29016-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tm93IHRoZSBVU0IgZ2FkZ2V0IHN1YnN5c3RlbSBjYW4gdXNlIHRoZSBVU0IgZGVidWdmcyByb290
IGRpcmVjdG9yeSwNCnNvIG1vdmUgaXQncyBkaXJlY3RvcnkgZnJvbSB0aGUgcm9vdCBvZiB0aGUg
ZGVidWdmcyBmaWxlc3lzdGVtIGludG8NCnRoZSByb290IG9mIHVzYg0KDQpTaWduZWQtb2ZmLWJ5
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCnYzOiBubyBj
aGFuZ2VzDQoNCnYyOg0KICAxLiBhYmFuZG9uIG5ldyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2Rp
cigpLCBhbmQgdXNlIHVzYl9kZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRj
L3B4YTI3eF91ZGMuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcHhhMjd4
X3VkYy5jIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9weGEyN3hfdWRjLmMNCmluZGV4IDAxNDIz
MzI1MjI5OS4uMjdlYTQ2Mjg3NzcyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3Vk
Yy9weGEyN3hfdWRjLmMNCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcHhhMjd4X3VkYy5j
DQpAQCAtMjA3LDcgKzIwNyw3IEBAIHN0YXRpYyB2b2lkIHB4YV9pbml0X2RlYnVnZnMoc3RydWN0
IHB4YV91ZGMgKnVkYykNCiB7DQogCXN0cnVjdCBkZW50cnkgKnJvb3Q7DQogDQotCXJvb3QgPSBk
ZWJ1Z2ZzX2NyZWF0ZV9kaXIodWRjLT5nYWRnZXQubmFtZSwgTlVMTCk7DQorCXJvb3QgPSBkZWJ1
Z2ZzX2NyZWF0ZV9kaXIodWRjLT5nYWRnZXQubmFtZSwgdXNiX2RlYnVnX3Jvb3QpOw0KIAl1ZGMt
PmRlYnVnZnNfcm9vdCA9IHJvb3Q7DQogDQogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInVkY3N0YXRl
IiwgMDQwMCwgcm9vdCwgdWRjLCAmc3RhdGVfZGJnX2ZvcHMpOw0KLS0gDQoyLjIzLjANCg==

