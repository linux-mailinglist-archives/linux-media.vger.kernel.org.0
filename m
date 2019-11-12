Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA607F8910
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfKLGwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:54 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:8874 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727349AbfKLGwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:30 -0500
X-UUID: 5b7ca680af9b4da0b5bfa82354638793-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o/JZRr8MVhKyTzWh0so19Y5K/CNb7SjeMKAccqN7w1k=;
        b=KmVo4rRktyrwek4Piq/uLbqdzaJXOlvUM7YF1ZJcKLRmKk3gkOX+PZcqp/VsjCPo19UuVm2TEwkGipKIlFNEkg5ZNbZ+UzlYoN6hhfwnpZv5MfKtZIGkdFwIOByH++S1DHvEBgEvrcISq7lYWtNbfAAtdKI6mo0o9oGWhEx5TEU=;
X-UUID: 5b7ca680af9b4da0b5bfa82354638793-20191112
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2008316729; Tue, 12 Nov 2019 14:52:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:21 +0800
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
Subject: [PATCH v2 11/13] usb: gadget: pxa27x: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:57 +0800
Message-ID: <1573541519-28488-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 6B6A4C5D5882F1C606E7AEB74CFCB66D23CA678064A53C315698C739AE0259782000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tm93IHRoZSBVU0IgZ2FkZ2V0IHN1YnN5c3RlbSBjYW4gdXNlIHRoZSBVU0IgZGVidWdmcyByb290
IGRpcmVjdG9yeSwNCnNvIG1vdmUgaXQncyBkaXJlY3RvcnkgZnJvbSB0aGUgcm9vdCBvZiB0aGUg
ZGVidWdmcyBmaWxlc3lzdGVtIGludG8NCnRoZSByb290IG9mIHVzYg0KDQpTaWduZWQtb2ZmLWJ5
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCnYyOg0KICAx
LiBhYmFuZG9uIG5ldyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2RpcigpLCBhbmQgdXNlIHVzYl9k
ZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3B4YTI3eF91ZGMuYyB8IDIg
Ky0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcHhhMjd4X3VkYy5jIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L3VkYy9weGEyN3hfdWRjLmMNCmluZGV4IDAxNDIzMzI1MjI5OS4uMjdlYTQ2Mjg3
NzcyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9weGEyN3hfdWRjLmMNCisr
KyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcHhhMjd4X3VkYy5jDQpAQCAtMjA3LDcgKzIwNyw3
IEBAIHN0YXRpYyB2b2lkIHB4YV9pbml0X2RlYnVnZnMoc3RydWN0IHB4YV91ZGMgKnVkYykNCiB7
DQogCXN0cnVjdCBkZW50cnkgKnJvb3Q7DQogDQotCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIo
dWRjLT5nYWRnZXQubmFtZSwgTlVMTCk7DQorCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIodWRj
LT5nYWRnZXQubmFtZSwgdXNiX2RlYnVnX3Jvb3QpOw0KIAl1ZGMtPmRlYnVnZnNfcm9vdCA9IHJv
b3Q7DQogDQogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInVkY3N0YXRlIiwgMDQwMCwgcm9vdCwgdWRj
LCAmc3RhdGVfZGJnX2ZvcHMpOw0KLS0gDQoyLjIzLjANCg==

