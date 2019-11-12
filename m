Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 350E5F88FD
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfKLGwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:24 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:40527 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727141AbfKLGwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:23 -0500
X-UUID: 4c45132c4c304271b63aebbc9e670408-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/mhqk9fLi9/KVcPCMgekIyIUjjBb+ybIqt81wIcZElg=;
        b=sKCDqMHxnWiGhxCpnUGy1B57Gj8eFHU5LJEEDsiRUw/17cqpX+7dcxnRDw+1S2Uun+pPNifwmZXz2o22DgQ5WPyBpsU7WfVJOwc/+lOiVVH9sZZgf8tx9T9ydDQlqBACVRNUNMlf20mKoYb2/+RpJxO7DoGZKduZdDwQun8MyFw=;
X-UUID: 4c45132c4c304271b63aebbc9e670408-20191112
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 184409301; Tue, 12 Nov 2019 14:52:19 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:15 +0800
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
Subject: [PATCH v2 08/13] usb: gadget: bcm63xx_udc: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:54 +0800
Message-ID: <1573541519-28488-8-git-send-email-chunfeng.yun@mediatek.com>
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
IGRpcmVjdG9yeSwNCnNvIG1vdmUgaXQncyBkaXJlY3RvcnkgZnJvbSB0aGUgcm9vdCBvZiB0aGUg
ZGVidWdmcyBmaWxlc3lzdGVtIGludG8NCnRoZSByb290IG9mIHVzYg0KDQpTaWduZWQtb2ZmLWJ5
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCnYyOg0KICAx
LiBhYmFuZG9uIG5ldyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2RpcigpLCBhbmQgdXNlIHVzYl9k
ZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JjbTYzeHhfdWRjLmMgfCAy
ICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JjbTYzeHhfdWRjLmMgYi9kcml2ZXJz
L3VzYi9nYWRnZXQvdWRjL2JjbTYzeHhfdWRjLmMNCmluZGV4IDk3YjE2NDYzZjNlZi4uMTY2ZGY0
MjE1MDQyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9iY202M3h4X3VkYy5j
DQorKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2JjbTYzeHhfdWRjLmMNCkBAIC0yMjQ4LDcg
KzIyNDgsNyBAQCBzdGF0aWMgdm9pZCBiY202M3h4X3VkY19pbml0X2RlYnVnZnMoc3RydWN0IGJj
bTYzeHhfdWRjICp1ZGMpDQogCWlmICghSVNfRU5BQkxFRChDT05GSUdfVVNCX0dBREdFVF9ERUJV
R19GUykpDQogCQlyZXR1cm47DQogDQotCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIodWRjLT5n
YWRnZXQubmFtZSwgTlVMTCk7DQorCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIodWRjLT5nYWRn
ZXQubmFtZSwgdXNiX2RlYnVnX3Jvb3QpOw0KIAl1ZGMtPmRlYnVnZnNfcm9vdCA9IHJvb3Q7DQog
DQogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInVzYmQiLCAwNDAwLCByb290LCB1ZGMsICZiY202M3h4
X3VzYmRfZGJnX2ZvcHMpOw0KLS0gDQoyLjIzLjANCg==

