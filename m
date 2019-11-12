Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D949AF890E
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfKLGwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:41 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:46767 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727399AbfKLGwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:40 -0500
X-UUID: 439fdc93992e43a185682234bedcf843-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fpTL98U4b/v1HNY+Y+iXuq8J1+9vr5r56XPVXNnrAb0=;
        b=VnYSPsxVd/gamjH3TDTou/U/Ai6gPKq04vlDzIiMufiClJgQJmyY9ToeaurRI6b1ic3YkgBzZLdusEiuL9cDxCC+tJ+zK18Y3/qxeBZBQNJL6eMCpbwywuKtpBvjJs/PoEDessOh/sFZj6asrJ/z6Dq3Y0TgcWiqIhXOsrsSKGM=;
X-UUID: 439fdc93992e43a185682234bedcf843-20191112
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1975560603; Tue, 12 Nov 2019 14:52:35 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:25 +0800
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
Subject: [PATCH v2 13/13] usb: gadget: udc: s3c2410_udc: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:59 +0800
Message-ID: <1573541519-28488-13-git-send-email-chunfeng.yun@mediatek.com>
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
ZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3MzYzI0MTBfdWRjLmMgfCAz
ICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvczNjMjQxMF91ZGMuYyBiL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvczNjMjQxMF91ZGMuYw0KaW5kZXggZjgyMjA4ZmJjMjQ5Li4wNTA3
YTJjYTBmNTUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3MzYzI0MTBfdWRj
LmMNCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvczNjMjQxMF91ZGMuYw0KQEAgLTE5Nzgs
NyArMTk3OCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHVkY19pbml0KHZvaWQpDQogDQogCWRwcmlu
dGsoREVCVUdfTk9STUFMLCAiJXNcbiIsIGdhZGdldF9uYW1lKTsNCiANCi0JczNjMjQxMF91ZGNf
ZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGdhZGdldF9uYW1lLCBOVUxMKTsNCisJ
czNjMjQxMF91ZGNfZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGdhZGdldF9uYW1l
LA0KKwkJCQkJCSAgICAgIHVzYl9kZWJ1Z19yb290KTsNCiANCiAJcmV0dmFsID0gcGxhdGZvcm1f
ZHJpdmVyX3JlZ2lzdGVyKCZ1ZGNfZHJpdmVyXzI0eDApOw0KIAlpZiAocmV0dmFsKQ0KLS0gDQoy
LjIzLjANCg==

