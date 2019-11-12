Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BC1F88F7
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfKLGwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:19 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:49926 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727153AbfKLGwS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:18 -0500
X-UUID: 9cccfdb789714e5aa8cf6e1ee71c7849-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gnxxOKKUGp0YnJWpzjgGAuOTcjep8ECSmMlGP4oymes=;
        b=n7bSWw+jEzrJMkWMZuSylCQmb47OJZLL9da/BtT9FZ764ejIgrchIND+cscrD7sXbNVxtilg/W/iDWCZIZgqE8Mqg0eKqeMwZ7WBz1UnFRNnsJGScZrJNQ6YwwQLmZYTuzVUco69Igo52ivKm18TCWY49TV8xLx35GjYKfj9z58=;
X-UUID: 9cccfdb789714e5aa8cf6e1ee71c7849-20191112
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 770414200; Tue, 12 Nov 2019 14:52:13 +0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:09 +0800
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
Subject: [PATCH v2 05/13] usb: musb: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:51 +0800
Message-ID: <1573541519-28488-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-TM-SNTS-SMTP: C7C71CC8B099F419F9DFA5205328988CBB19CC978E7EFD1B745477620D7290BF2000:8
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tm93IHRoZSBVU0IgZ2FkZ2V0IHN1YnN5c3RlbSBjYW4gdXNlIHRoZSBVU0IgZGVidWdmcyByb290
IGRpcmVjdG9yeSwNCnNvIG1vdmUgbXVzYidzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRo
ZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYt
Ynk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjI6DQog
IDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCksIGFuZCB1c2UgdXNi
X2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL211c2IvbXVzYl9kZWJ1Z2ZzLmMgfCAyICst
DQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9tdXNiL211c2JfZGVidWdmcy5jIGIvZHJpdmVycy91c2IvbXVz
Yi9tdXNiX2RlYnVnZnMuYw0KaW5kZXggZjQyODU4ZTJiNTRjLi43YjYyODFhYjYyZWQgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL3VzYi9tdXNiL211c2JfZGVidWdmcy5jDQorKysgYi9kcml2ZXJzL3Vz
Yi9tdXNiL211c2JfZGVidWdmcy5jDQpAQCAtMzI1LDcgKzMyNSw3IEBAIHZvaWQgbXVzYl9pbml0
X2RlYnVnZnMoc3RydWN0IG11c2IgKm11c2IpDQogew0KIAlzdHJ1Y3QgZGVudHJ5ICpyb290Ow0K
IA0KLQlyb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKG11c2ItPmNvbnRyb2xsZXIp
LCBOVUxMKTsNCisJcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShtdXNiLT5jb250
cm9sbGVyKSwgdXNiX2RlYnVnX3Jvb3QpOw0KIAltdXNiLT5kZWJ1Z2ZzX3Jvb3QgPSByb290Ow0K
IA0KIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyZWdkdW1wIiwgU19JUlVHTywgcm9vdCwgbXVzYiwg
Jm11c2JfcmVnZHVtcF9mb3BzKTsNCi0tIA0KMi4yMy4wDQo=

