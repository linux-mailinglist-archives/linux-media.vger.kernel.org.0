Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D16ECFC45D
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfKNKmF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:42:05 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:46935 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727036AbfKNKmE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:42:04 -0500
X-UUID: 7f686574ca9c44eba133bcab1ab09023-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Bf0H4NjN87Eyxjtkpl/ipYmRPL+ArIku0qP3VxKPEJk=;
        b=Q0pHoOest2FldG5WppE9xyXLued4wKvJ8edwCasNM9OGJrmGpsCvH7txcC+sbL4z12Bk/9X3BlX6NX2rkmSd4w7q27V8NH74E5jgKhZKOwT7gqowUW6GWtCk8zuJaF3h9i2MOvsS9nUgS9i5NdNQchhkW2ESCa0sel8MgpfDfmI=;
X-UUID: 7f686574ca9c44eba133bcab1ab09023-20191114
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1022739100; Thu, 14 Nov 2019 18:41:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:52 +0800
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
Subject: [PATCH v3 12/13] usb: gadget: udc: gr_udc: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:24 +0800
Message-ID: <1573728085-29016-12-git-send-email-chunfeng.yun@mediatek.com>
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
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQotLS0NCnYzOg0KICAx
LiBmaXggdXAgYnVpbGQgZXJyb3Igb2YgdW5kZWZpbmVkIHVzYl9kZWJ1Z19yb290DQoNCnYyOg0K
ICAxLiBhYmFuZG9uIG5ldyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2RpcigpLCBhbmQgdXNlIHVz
Yl9kZWJ1Z19yb290DQotLS0NCiBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jIHwgMyAr
Ky0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jIGIvZHJpdmVycy91c2Iv
Z2FkZ2V0L3VkYy9ncl91ZGMuYw0KaW5kZXggN2EwZTlhNThjMmQ4Li41ZDVhMGJjNzk3NTcgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jDQorKysgYi9kcml2ZXJz
L3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jDQpAQCAtMjksNiArMjksNyBAQA0KICNpbmNsdWRlIDxs
aW51eC9saXN0Lmg+DQogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KICNpbmNsdWRlIDxs
aW51eC9kZXZpY2UuaD4NCisjaW5jbHVkZSA8bGludXgvdXNiLmg+DQogI2luY2x1ZGUgPGxpbnV4
L3VzYi9jaDkuaD4NCiAjaW5jbHVkZSA8bGludXgvdXNiL2dhZGdldC5oPg0KICNpbmNsdWRlIDxs
aW51eC9kbWEtbWFwcGluZy5oPg0KQEAgLTIwOCw3ICsyMDksNyBAQCBzdGF0aWMgdm9pZCBncl9k
ZnNfY3JlYXRlKHN0cnVjdCBncl91ZGMgKmRldikNCiB7DQogCWNvbnN0IGNoYXIgKm5hbWUgPSAi
Z3JfdWRjX3N0YXRlIjsNCiANCi0JZGV2LT5kZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2Rpcihk
ZXZfbmFtZShkZXYtPmRldiksIE5VTEwpOw0KKwlkZXYtPmRmc19yb290ID0gZGVidWdmc19jcmVh
dGVfZGlyKGRldl9uYW1lKGRldi0+ZGV2KSwgdXNiX2RlYnVnX3Jvb3QpOw0KIAlkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKG5hbWUsIDA0NDQsIGRldi0+ZGZzX3Jvb3QsIGRldiwgJmdyX2Rmc19mb3BzKTsN
CiB9DQogDQotLSANCjIuMjMuMA0K

