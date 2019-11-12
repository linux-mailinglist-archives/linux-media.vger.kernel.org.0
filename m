Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02767F8901
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfKLGw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:26 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:35911 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727257AbfKLGwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:25 -0500
X-UUID: 62b551fadbe949c99886f1438d0e2a43-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vDFSM74U/LzojcaYIm3VI+fWNTtXUiPpAVNSlvTMG4A=;
        b=jEctanwF6W3eC0I1NNjUOyHS8xgLVZJ3KN0J/i6jmV6Q7aD4OOBpr4lnOB9rvO2hPRDuufdXgVMGzV72X7G82vDZhsfy7rOpvZPF22kkVBNjc9oDPYiEWUF/OXmsdkX6V/HUOvhwvLa9vKciEurVubOwJarnemxMpfQC7oRNaUM=;
X-UUID: 62b551fadbe949c99886f1438d0e2a43-20191112
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1143215791; Tue, 12 Nov 2019 14:52:20 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:11 +0800
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
Subject: [PATCH v2 06/13] usb: musb: dsps: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:52 +0800
Message-ID: <1573541519-28488-6-git-send-email-chunfeng.yun@mediatek.com>
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
IGRpcmVjdG9yeSwNCnNvIG1vdmUgZHNwcydzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRo
ZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYt
Ynk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjI6DQog
IDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCksIGFuZCB1c2UgdXNi
X2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL211c2IvbXVzYl9kc3BzLmMgfCAyICstDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9tdXNiL211c2JfZHNwcy5jIGIvZHJpdmVycy91c2IvbXVzYi9tdXNi
X2RzcHMuYw0KaW5kZXggMzI3ZDRmN2JhYWY3Li44ODkyMzE3NWY3MWUgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL3VzYi9tdXNiL211c2JfZHNwcy5jDQorKysgYi9kcml2ZXJzL3VzYi9tdXNiL211c2Jf
ZHNwcy5jDQpAQCAtNDExLDcgKzQxMSw3IEBAIHN0YXRpYyBpbnQgZHNwc19tdXNiX2RiZ19pbml0
KHN0cnVjdCBtdXNiICptdXNiLCBzdHJ1Y3QgZHNwc19nbHVlICpnbHVlKQ0KIAljaGFyIGJ1Zlsx
MjhdOw0KIA0KIAlzcHJpbnRmKGJ1ZiwgIiVzLmRzcHMiLCBkZXZfbmFtZShtdXNiLT5jb250cm9s
bGVyKSk7DQotCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoYnVmLCBOVUxMKTsNCisJcm9vdCA9
IGRlYnVnZnNfY3JlYXRlX2RpcihidWYsIHVzYl9kZWJ1Z19yb290KTsNCiAJZ2x1ZS0+ZGJnZnNf
cm9vdCA9IHJvb3Q7DQogDQogCWdsdWUtPnJlZ3NldC5yZWdzID0gZHNwc19tdXNiX3JlZ3M7DQot
LSANCjIuMjMuMA0K

