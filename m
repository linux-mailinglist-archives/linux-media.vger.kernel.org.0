Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D3DFC44F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfKNKlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:41:47 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:46129 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726106AbfKNKlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:41:46 -0500
X-UUID: fb360836f2f24eb6943881172cb20643-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F7VjSkVwVBDd5QPQZ1iT7NqzfxFAJJ9eh+ZGLLGNh94=;
        b=MO9ATtwuUtq9kgNWwAWG/52qU1GcV7u2jHSbfvPIj6ZgERPc1rSd4yW5id6Uqquv5ljccqlxEjdiuynLi9qZAOiHb76Isx1Xd3FPY98R8x85hRG0gE7CiaxiLS854eahRjwsrqkWdiPttWH25agYrkq03ix1PShYOt591vi6Ers=;
X-UUID: fb360836f2f24eb6943881172cb20643-20191114
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1380385667; Thu, 14 Nov 2019 18:41:39 +0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:33 +0800
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
Subject: [PATCH v3 03/13] usb: host: imx21: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:15 +0800
Message-ID: <1573728085-29016-3-git-send-email-chunfeng.yun@mediatek.com>
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

TW92ZSBpdCdzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRoZSBkZWJ1Z2ZzIGZpbGVzeXN0
ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8
Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjM6IG5vIGNoYW5nZXMNCg0KdjI6DQog
IDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCksIGFuZCB1c2UgdXNi
X2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL2hvc3QvaW14MjEtZGJnLmMgfCAyICstDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9ob3N0L2lteDIxLWRiZy5jIGIvZHJpdmVycy91c2IvaG9zdC9pbXgy
MS1kYmcuYw0KaW5kZXggN2ZjZjFkOWRkN2YzLi4wMmExMzQ0ZmJkNmEgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL3VzYi9ob3N0L2lteDIxLWRiZy5jDQorKysgYi9kcml2ZXJzL3VzYi9ob3N0L2lteDIx
LWRiZy5jDQpAQCAtNDE5LDcgKzQxOSw3IEBAIHN0YXRpYyB2b2lkIGNyZWF0ZV9kZWJ1Z19maWxl
cyhzdHJ1Y3QgaW14MjEgKmlteDIxKQ0KIHsNCiAJc3RydWN0IGRlbnRyeSAqcm9vdDsNCiANCi0J
cm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShpbXgyMS0+ZGV2KSwgTlVMTCk7DQor
CXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoaW14MjEtPmRldiksIHVzYl9kZWJ1
Z19yb290KTsNCiAJaW14MjEtPmRlYnVnX3Jvb3QgPSByb290Ow0KIA0KIAlkZWJ1Z2ZzX2NyZWF0
ZV9maWxlKCJzdGF0dXMiLCBTX0lSVUdPLCByb290LCBpbXgyMSwgJmRlYnVnX3N0YXR1c19mb3Bz
KTsNCi0tIA0KMi4yMy4wDQo=

