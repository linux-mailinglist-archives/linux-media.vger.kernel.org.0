Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0A3FC461
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfKNKmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:42:16 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:15523 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727032AbfKNKmE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:42:04 -0500
X-UUID: ff543cc95e3f4ee19b82233fe5203933-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2oPmrtmT8z3a06jOc+ndJyeQ70dpMqfM0UstsjdEuiQ=;
        b=J4ggWPv8rGux7aQddVoTiMW3Lc96eseC/zJc8eOM+sOJOxX6N4Z5XdRiA1TRDDgYzee4+OAHOWTtY1gzXxZCdPQ6elaNC3H8VEOU9luJZlmZZCzdU4Vt8m9b/4+26CHWCKms7idr3cMcF/N/BUE/h8rkpfDeJigTd3j5rbunBno=;
X-UUID: ff543cc95e3f4ee19b82233fe5203933-20191114
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1011509444; Thu, 14 Nov 2019 18:42:00 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 14 Nov
 2019 18:41:56 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:55 +0800
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
Subject: [PATCH v3 13/13] usb: gadget: udc: s3c2410_udc: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:25 +0800
Message-ID: <1573728085-29016-13-git-send-email-chunfeng.yun@mediatek.com>
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
IGRpcmVjdG9yeSwNCnNvIG1vdmUgaXQncyBkaXJlY3RvcnkgZnJvbSB0aGUgcm9vdCBvZiB0aGUg
ZGVidWdmcyBmaWxlc3lzdGVtIGludG8NCnRoZSByb290IG9mIHVzYg0KDQpTaWduZWQtb2ZmLWJ5
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCnYzOiBubyBj
aGFuZ2VzDQoNCnYyOg0KICAxLiBhYmFuZG9uIG5ldyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2Rp
cigpLCBhbmQgdXNlIHVzYl9kZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRj
L3MzYzI0MTBfdWRjLmMgfCAzICsrLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvczNj
MjQxMF91ZGMuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvczNjMjQxMF91ZGMuYw0KaW5kZXgg
ZjgyMjA4ZmJjMjQ5Li4wNTA3YTJjYTBmNTUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9nYWRn
ZXQvdWRjL3MzYzI0MTBfdWRjLmMNCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvczNjMjQx
MF91ZGMuYw0KQEAgLTE5NzgsNyArMTk3OCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHVkY19pbml0
KHZvaWQpDQogDQogCWRwcmludGsoREVCVUdfTk9STUFMLCAiJXNcbiIsIGdhZGdldF9uYW1lKTsN
CiANCi0JczNjMjQxMF91ZGNfZGVidWdmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGdhZGdl
dF9uYW1lLCBOVUxMKTsNCisJczNjMjQxMF91ZGNfZGVidWdmc19yb290ID0gZGVidWdmc19jcmVh
dGVfZGlyKGdhZGdldF9uYW1lLA0KKwkJCQkJCSAgICAgIHVzYl9kZWJ1Z19yb290KTsNCiANCiAJ
cmV0dmFsID0gcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCZ1ZGNfZHJpdmVyXzI0eDApOw0KIAlp
ZiAocmV0dmFsKQ0KLS0gDQoyLjIzLjANCg==

