Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67F12FC455
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfKNKl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:41:59 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:42059 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726983AbfKNKl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:41:58 -0500
X-UUID: 744dca403fdd4e1e855ad41f91a2f7d3-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/v3ZAT8MMQQn1PPsfQoog57z7OcnmZ7w9uOMGarZugY=;
        b=eap7G/NVuy9vJuwCgJ8lFLXvSvWTTAMnIs+sxZ8hfdw/o693knpzrYo4rLSob4715mhnjagrjXDy7e/hwObz91K0gK7sLcnaNiqRPC39tHHzT6Vsz1iVsPt8wu9OySnZ4EgSi5yoXCFOsbb/ndjZokyfXL15S+wl9jH7s6Lti2A=;
X-UUID: 744dca403fdd4e1e855ad41f91a2f7d3-20191114
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1787366391; Thu, 14 Nov 2019 18:41:54 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:53 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:48 +0800
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
Subject: [PATCH v3 10/13] usb: gadget: udc: renesas_usb3: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:22 +0800
Message-ID: <1573728085-29016-10-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 662CFFC5D757F574D8AD256B9DEA6AC1A087CE590745DB105BB6C8C4E4FE39652000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tm93IHRoZSBVU0IgZ2FkZ2V0IHN1YnN5c3RlbSBjYW4gdXNlIHRoZSBVU0IgZGVidWdmcyByb290
IGRpcmVjdG9yeSwNCnNvIG1vdmUgaXQncyBkaXJlY3RvcnkgZnJvbSB0aGUgcm9vdCBvZiB0aGUg
ZGVidWdmcyBmaWxlc3lzdGVtIGludG8NCnRoZSByb290IG9mIHVzYg0KDQpTaWduZWQtb2ZmLWJ5
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCnYzOiBubyBj
aGFuZ2VzDQoNCnYyOg0KICAxLiBhYmFuZG9uIG5ldyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2Rp
cigpLCBhbmQgdXNlIHVzYl9kZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRj
L3JlbmVzYXNfdXNiMy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5l
c2FzX3VzYjMuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmMNCmluZGV4
IGUwOThmMTZjMDFjYi4uNGRkZTY5ZTdmNmIxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZ2Fk
Z2V0L3VkYy9yZW5lc2FzX3VzYjMuYw0KKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5l
c2FzX3VzYjMuYw0KQEAgLTI1MzUsNyArMjUzNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmls
ZV9vcGVyYXRpb25zIHJlbmVzYXNfdXNiM19iX2RldmljZV9mb3BzID0gew0KIHN0YXRpYyB2b2lk
IHJlbmVzYXNfdXNiM19kZWJ1Z2ZzX2luaXQoc3RydWN0IHJlbmVzYXNfdXNiMyAqdXNiMywNCiAJ
CQkJICAgICAgc3RydWN0IGRldmljZSAqZGV2KQ0KIHsNCi0JdXNiMy0+ZGVudHJ5ID0gZGVidWdm
c19jcmVhdGVfZGlyKGRldl9uYW1lKGRldiksIE5VTEwpOw0KKwl1c2IzLT5kZW50cnkgPSBkZWJ1
Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoZGV2KSwgdXNiX2RlYnVnX3Jvb3QpOw0KIA0KIAlkZWJ1
Z2ZzX2NyZWF0ZV9maWxlKCJiX2RldmljZSIsIDA2NDQsIHVzYjMtPmRlbnRyeSwgdXNiMywNCiAJ
CQkgICAgJnJlbmVzYXNfdXNiM19iX2RldmljZV9mb3BzKTsNCi0tIA0KMi4yMy4wDQo=

