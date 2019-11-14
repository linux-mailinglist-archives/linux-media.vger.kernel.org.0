Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9C3FC470
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfKNKlt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:41:49 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:43571 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726655AbfKNKlt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:41:49 -0500
X-UUID: 80923812f42e431a843979d8a7752cd3-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Po3I97gPH5un+YvUqz4HBd2ziZlvEJRiQYNqrIBg6bI=;
        b=ZtEHxf02kpKF8EzNMNFAIfV8PsS3Vw3TzS3X1KLZH5fF7eRpVu0+JAAvtZMf2HooKc64yxRHK6cgWyeGukv2hWe3/s6y0YcmgUgmygrHhSP7FRDMVwcOdJQWeUnPDczYOC288Pxx5AD/motY9OTZokSEWZY+Us5dLVUpxanWiRc=;
X-UUID: 80923812f42e431a843979d8a7752cd3-20191114
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1080195937; Thu, 14 Nov 2019 18:41:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:40 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 14 Nov
 2019 18:41:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:38 +0800
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
Subject: [PATCH v3 05/13] usb: musb: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:17 +0800
Message-ID: <1573728085-29016-5-git-send-email-chunfeng.yun@mediatek.com>
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
IGRpcmVjdG9yeSwNCnNvIG1vdmUgbXVzYidzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRo
ZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYt
Ynk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjM6IG5v
IGNoYW5nZXMNCg0KdjI6DQogIDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVf
ZGlyKCksIGFuZCB1c2UgdXNiX2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL211c2IvbXVz
Yl9kZWJ1Z2ZzLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdXNiL211c2JfZGVidWdmcy5j
IGIvZHJpdmVycy91c2IvbXVzYi9tdXNiX2RlYnVnZnMuYw0KaW5kZXggZjQyODU4ZTJiNTRjLi43
YjYyODFhYjYyZWQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9tdXNiL211c2JfZGVidWdmcy5j
DQorKysgYi9kcml2ZXJzL3VzYi9tdXNiL211c2JfZGVidWdmcy5jDQpAQCAtMzI1LDcgKzMyNSw3
IEBAIHZvaWQgbXVzYl9pbml0X2RlYnVnZnMoc3RydWN0IG11c2IgKm11c2IpDQogew0KIAlzdHJ1
Y3QgZGVudHJ5ICpyb290Ow0KIA0KLQlyb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1l
KG11c2ItPmNvbnRyb2xsZXIpLCBOVUxMKTsNCisJcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2Rpcihk
ZXZfbmFtZShtdXNiLT5jb250cm9sbGVyKSwgdXNiX2RlYnVnX3Jvb3QpOw0KIAltdXNiLT5kZWJ1
Z2ZzX3Jvb3QgPSByb290Ow0KIA0KIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyZWdkdW1wIiwgU19J
UlVHTywgcm9vdCwgbXVzYiwgJm11c2JfcmVnZHVtcF9mb3BzKTsNCi0tIA0KMi4yMy4wDQo=

