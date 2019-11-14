Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 993B7FC467
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKNKl4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:41:56 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:62822 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726953AbfKNKlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:41:55 -0500
X-UUID: afa82fdb906646cd9c5102070d6fd392-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3avob40MkcAGOskk3JFHlOYbQJoLQ/YiEjDDcd4xlgs=;
        b=TX+k93RjAy3SdL4tY5YjW8Cj7fOWd/TZV0exm8MC6NejRHJhfuyfx9A5XTXMFRTsW2NQIsm/CK2CZ9rRTbvF0Mtg+ELGUuB3aakhkN7YPEo3XJaLU3Xm37Hw20PE9GENEvolz33zZBDaFEcCue3hD1KrOprqUKBpjKwiuvTRZWU=;
X-UUID: afa82fdb906646cd9c5102070d6fd392-20191114
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 640366206; Thu, 14 Nov 2019 18:41:50 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:46 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:44 +0800
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
Subject: [PATCH v3 08/13] usb: gadget: bcm63xx_udc: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:20 +0800
Message-ID: <1573728085-29016-8-git-send-email-chunfeng.yun@mediatek.com>
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
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCnYzOg0KICAx
LiBmaXggdXAgYnVpbGQgZXJyb3Igb2YgdW5kZWZpbmVkIHVzYl9kZWJ1Z19yb290DQoNCnYyOg0K
ICAxLiBhYmFuZG9uIG5ldyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2RpcigpLCBhbmQgdXNlIHVz
Yl9kZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JjbTYzeHhfdWRjLmMg
fCAzICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmNtNjN4eF91ZGMuYyBiL2Ry
aXZlcnMvdXNiL2dhZGdldC91ZGMvYmNtNjN4eF91ZGMuYw0KaW5kZXggOTdiMTY0NjNmM2VmLi4x
NjdkNDE2MThlY2YgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JjbTYzeHhf
dWRjLmMNCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvYmNtNjN4eF91ZGMuYw0KQEAgLTI2
LDYgKzI2LDcgQEANCiAjaW5jbHVkZSA8bGludXgvc2VxX2ZpbGUuaD4NCiAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPg0KICNpbmNsdWRlIDxsaW51eC90aW1lci5oPg0KKyNpbmNsdWRlIDxsaW51eC91
c2IuaD4NCiAjaW5jbHVkZSA8bGludXgvdXNiL2NoOS5oPg0KICNpbmNsdWRlIDxsaW51eC91c2Iv
Z2FkZ2V0Lmg+DQogI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPg0KQEAgLTIyNDgsNyArMjI0
OSw3IEBAIHN0YXRpYyB2b2lkIGJjbTYzeHhfdWRjX2luaXRfZGVidWdmcyhzdHJ1Y3QgYmNtNjN4
eF91ZGMgKnVkYykNCiAJaWYgKCFJU19FTkFCTEVEKENPTkZJR19VU0JfR0FER0VUX0RFQlVHX0ZT
KSkNCiAJCXJldHVybjsNCiANCi0Jcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2Rpcih1ZGMtPmdhZGdl
dC5uYW1lLCBOVUxMKTsNCisJcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2Rpcih1ZGMtPmdhZGdldC5u
YW1lLCB1c2JfZGVidWdfcm9vdCk7DQogCXVkYy0+ZGVidWdmc19yb290ID0gcm9vdDsNCiANCiAJ
ZGVidWdmc19jcmVhdGVfZmlsZSgidXNiZCIsIDA0MDAsIHJvb3QsIHVkYywgJmJjbTYzeHhfdXNi
ZF9kYmdfZm9wcyk7DQotLSANCjIuMjMuMA0K

