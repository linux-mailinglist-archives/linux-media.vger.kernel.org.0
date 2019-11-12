Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5282F88FA
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfKLGwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:20 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:8481 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727141AbfKLGwQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:16 -0500
X-UUID: 85e0b5d4ea8046d6a19b7d3172f299e5-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ys5MvA8nUGN3ilgTDUWdh06crqeJBv9EYUtRL16pUxc=;
        b=GchebFA6f/dfUSyISYrjpzf3CLdY/c+nJnrht0UmVotQBWxo4fV2tKDRHr9Fqkw2csYiCW5awhRPSCKMq1jQwWlhkh8V7H6F+3OTgEOjN2OIH4YdIa3KePUXuVavr7ET6+LfZguG6RmL7kv9jOI/itwcscQeVzSbeg1Xz1IS1QE=;
X-UUID: 85e0b5d4ea8046d6a19b7d3172f299e5-20191112
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1949361959; Tue, 12 Nov 2019 14:52:09 +0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:06 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:04 +0800
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
Subject: [PATCH v2 03/13] usb: host: imx21: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:49 +0800
Message-ID: <1573541519-28488-3-git-send-email-chunfeng.yun@mediatek.com>
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

TW92ZSBpdCdzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRoZSBkZWJ1Z2ZzIGZpbGVzeXN0
ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8
Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjI6DQogIDEuIGFiYW5kb24gbmV3IEFQ
SSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCksIGFuZCB1c2UgdXNiX2RlYnVnX3Jvb3QNCi0tLQ0K
IGRyaXZlcnMvdXNiL2hvc3QvaW14MjEtZGJnLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9o
b3N0L2lteDIxLWRiZy5jIGIvZHJpdmVycy91c2IvaG9zdC9pbXgyMS1kYmcuYw0KaW5kZXggN2Zj
ZjFkOWRkN2YzLi4wMmExMzQ0ZmJkNmEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9ob3N0L2lt
eDIxLWRiZy5jDQorKysgYi9kcml2ZXJzL3VzYi9ob3N0L2lteDIxLWRiZy5jDQpAQCAtNDE5LDcg
KzQxOSw3IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9kZWJ1Z19maWxlcyhzdHJ1Y3QgaW14MjEgKmlt
eDIxKQ0KIHsNCiAJc3RydWN0IGRlbnRyeSAqcm9vdDsNCiANCi0Jcm9vdCA9IGRlYnVnZnNfY3Jl
YXRlX2RpcihkZXZfbmFtZShpbXgyMS0+ZGV2KSwgTlVMTCk7DQorCXJvb3QgPSBkZWJ1Z2ZzX2Ny
ZWF0ZV9kaXIoZGV2X25hbWUoaW14MjEtPmRldiksIHVzYl9kZWJ1Z19yb290KTsNCiAJaW14MjEt
PmRlYnVnX3Jvb3QgPSByb290Ow0KIA0KIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJzdGF0dXMiLCBT
X0lSVUdPLCByb290LCBpbXgyMSwgJmRlYnVnX3N0YXR1c19mb3BzKTsNCi0tIA0KMi4yMy4wDQo=

