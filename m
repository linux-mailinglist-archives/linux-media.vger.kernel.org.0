Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97FBBF8914
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfKLGxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:53:00 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:3283 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727290AbfKLGw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:26 -0500
X-UUID: 000a7e23fe4a4d99b28c2e6e8237a71e-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=E0AtiFvop940kTZGQnXgm9cNtBxFuTomSkvzpDAfkYA=;
        b=owcn+ZEkswrYb+ayq4aItuygg2rcpWsaIbT8M0yvn0hpLallzXwccKyDA21fqJTAiWvuKd18jbh2BBXNDgzDy9RVTbZmmqLPbzOrd+/7/CW1hSOFdHenCmMCoUD+CbsP/dlSeLFz/yUgXxQLIjtKxbCnf7YjJf9VtjyWXjrXmuI=;
X-UUID: 000a7e23fe4a4d99b28c2e6e8237a71e-20191112
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 44147281; Tue, 12 Nov 2019 14:52:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:19 +0800
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
Subject: [PATCH v2 10/13] usb: gadget: udc: renesas_usb3: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:56 +0800
Message-ID: <1573541519-28488-10-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 40C23269D7D7EEF94D6ABB6B93E7A28A4F76D6CA05C0F0C465D62353A143169E2000:8
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
ZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3JlbmVzYXNfdXNiMy5jIHwg
MiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYyBiL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmMNCmluZGV4IGUwOThmMTZjMDFjYi4uNGRk
ZTY5ZTdmNmIxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3Vz
YjMuYw0KKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYw0KQEAgLTI1
MzUsNyArMjUzNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHJlbmVz
YXNfdXNiM19iX2RldmljZV9mb3BzID0gew0KIHN0YXRpYyB2b2lkIHJlbmVzYXNfdXNiM19kZWJ1
Z2ZzX2luaXQoc3RydWN0IHJlbmVzYXNfdXNiMyAqdXNiMywNCiAJCQkJICAgICAgc3RydWN0IGRl
dmljZSAqZGV2KQ0KIHsNCi0JdXNiMy0+ZGVudHJ5ID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9u
YW1lKGRldiksIE5VTEwpOw0KKwl1c2IzLT5kZW50cnkgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2
X25hbWUoZGV2KSwgdXNiX2RlYnVnX3Jvb3QpOw0KIA0KIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJi
X2RldmljZSIsIDA2NDQsIHVzYjMtPmRlbnRyeSwgdXNiMywNCiAJCQkgICAgJnJlbmVzYXNfdXNi
M19iX2RldmljZV9mb3BzKTsNCi0tIA0KMi4yMy4wDQo=

