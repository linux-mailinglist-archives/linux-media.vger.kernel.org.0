Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47E5CF8906
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfKLGwd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:33 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:8874 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727257AbfKLGwc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:32 -0500
X-UUID: 8bb912ab5b2a4142804270d7b23227c0-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sqinwE6urNgoomSdVqJFpcp+5OZZKqz/VmNqkBZzAjU=;
        b=UEQjcUsQnOdD0+MP7YM3z2MuvZIeuykYL96DmcFVuGjtiuFy/kcyT9jqPG7NJY+w7EtO5dyzOhOG6DketrTLQSdJU+/DiYfnmI+TdZemXEvNxN3NoEka5hKKdqrhMIbznjXcIqxvoKtVJx/9aTsxtBhXvCemWVrTvGivsseZ7vA=;
X-UUID: 8bb912ab5b2a4142804270d7b23227c0-20191112
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 628214827; Tue, 12 Nov 2019 14:52:27 +0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:25 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:23 +0800
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
Subject: [PATCH v2 12/13] usb: gadget: udc: gr_udc: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:58 +0800
Message-ID: <1573541519-28488-12-git-send-email-chunfeng.yun@mediatek.com>
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
ZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jIHwgMiArLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9ncl91ZGMuYyBiL2RyaXZlcnMvdXNiL2dhZGdl
dC91ZGMvZ3JfdWRjLmMNCmluZGV4IDdhMGU5YTU4YzJkOC4uNWZhYTA5YTZjNzcwIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9ncl91ZGMuYw0KKysrIGIvZHJpdmVycy91c2Iv
Z2FkZ2V0L3VkYy9ncl91ZGMuYw0KQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgdm9pZCBncl9k
ZnNfY3JlYXRlKHN0cnVjdCBncl91ZGMgKmRldikNCiB7DQogCWNvbnN0IGNoYXIgKm5hbWUgPSAi
Z3JfdWRjX3N0YXRlIjsNCiANCi0JZGV2LT5kZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2Rpcihk
ZXZfbmFtZShkZXYtPmRldiksIE5VTEwpOw0KKwlkZXYtPmRmc19yb290ID0gZGVidWdmc19jcmVh
dGVfZGlyKGRldl9uYW1lKGRldi0+ZGV2KSwgdXNiX2RlYnVnX3Jvb3QpOw0KIAlkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKG5hbWUsIDA0NDQsIGRldi0+ZGZzX3Jvb3QsIGRldiwgJmdyX2Rmc19mb3BzKTsN
CiB9DQogDQotLSANCjIuMjMuMA0K

