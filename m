Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC57FC476
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfKNKlp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:41:45 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:25807 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726443AbfKNKlp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:41:45 -0500
X-UUID: 63ec90ffc55547b595f93a58c88203e3-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZyUkroDwJ/tkeHSmQ6jPqEMqnrzjH984a//dZ+7nwAs=;
        b=GdYy0lW9s84wU2EVJI25lkJtxBmIHfQzoVaQ4+vMaY9OAWaqrOKZpwq/WJDetYxABz97lLS3Y0jEh1iTl2OSCs37shcMOWiowPSGwui2hdh1wzzMDch84EetTRcbdKknnPyukiA3l3ELdmMx286Fj9wnxYpMz1SU1UIofocI13Q=;
X-UUID: 63ec90ffc55547b595f93a58c88203e3-20191114
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1294656983; Thu, 14 Nov 2019 18:41:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:37 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:35 +0800
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
Subject: [PATCH v3 04/13] usb: dwc3: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:16 +0800
Message-ID: <1573728085-29016-4-git-send-email-chunfeng.yun@mediatek.com>
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
IGRpcmVjdG9yeSwNCnNvIG1vdmUgZHdjMydzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRo
ZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYt
Ynk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjM6IG5v
IGNoYW5nZXMNCg0KdjI6DQogIDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVf
ZGlyKCksIGFuZCB1c2UgdXNiX2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL2R3YzMvZGVi
dWdmcy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2RlYnVnZnMuYw0KaW5kZXggMWM3OTI3MTAzNDhmLi40ZmU4YjFlMTQ4NWMgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0KKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9kZWJ1Z2ZzLmMNCkBAIC05MTYsNyArOTE2LDcgQEAgdm9pZCBkd2MzX2RlYnVnZnNfaW5p
dChzdHJ1Y3QgZHdjMyAqZHdjKQ0KIAlkd2MtPnJlZ3NldC0+bnJlZ3MgPSBBUlJBWV9TSVpFKGR3
YzNfcmVncyk7DQogCWR3Yy0+cmVnc2V0LT5iYXNlID0gZHdjLT5yZWdzIC0gRFdDM19HTE9CQUxT
X1JFR1NfU1RBUlQ7DQogDQotCXJvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoZHdj
LT5kZXYpLCBOVUxMKTsNCisJcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShkd2Mt
PmRldiksIHVzYl9kZWJ1Z19yb290KTsNCiAJZHdjLT5yb290ID0gcm9vdDsNCiANCiAJZGVidWdm
c19jcmVhdGVfcmVnc2V0MzIoInJlZ2R1bXAiLCBTX0lSVUdPLCByb290LCBkd2MtPnJlZ3NldCk7
DQotLSANCjIuMjMuMA0K

