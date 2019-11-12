Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6841EF88F3
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKLGwJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:09 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:3766 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725283AbfKLGwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:09 -0500
X-UUID: 225456d538b04c4998060d30a6ac8cf6-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d8BFCFk1jWo76KszBymxQCa+dx51d98IKSWXcuFIpgA=;
        b=HKcMpgHZ0Ij+spH0BoNSPXCa0NI/iEymiLXFw+LVn8Vcz/nHXie7RV7j15gGvl7mEOJnT78eq7l8yitBVAccSw0V1BzKWeZV1CxgBF4buzRUvqy2IIDg2KttPLo/FKclmaeRPvJFKlfhRzfbMIVMxrHKQNILtL65yy7rCg/9Q80=;
X-UUID: 225456d538b04c4998060d30a6ac8cf6-20191112
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1160445928; Tue, 12 Nov 2019 14:52:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:00 +0800
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
Subject: [PATCH v2 01/13] media: uvcvideo: drop error check of debugfs_create_dir()
Date:   Tue, 12 Nov 2019 14:51:47 +0800
Message-ID: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tm8gbmVlZCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mIGRlYnVnZnNfY3JlYXRlX2RpcigpDQoN
ClNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KdjI6DQogIDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCks
IGFuZCBkcm9wIGVycm9yIGNoZWNrDQotLS0NCiBkcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2Rl
YnVnZnMuYyB8IDEwICstLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZj
X2RlYnVnZnMuYyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZGVidWdmcy5jDQppbmRleCBk
MmIxMDk5NTlkODIuLjJiOGFmNGI1NDExNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvdXNi
L3V2Yy91dmNfZGVidWdmcy5jDQorKysgYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RlYnVn
ZnMuYw0KQEAgLTEwOCwxNSArMTA4LDcgQEAgdm9pZCB1dmNfZGVidWdmc19jbGVhbnVwX3N0cmVh
bShzdHJ1Y3QgdXZjX3N0cmVhbWluZyAqc3RyZWFtKQ0KIA0KIHZvaWQgdXZjX2RlYnVnZnNfaW5p
dCh2b2lkKQ0KIHsNCi0Jc3RydWN0IGRlbnRyeSAqZGlyOw0KLQ0KLQlkaXIgPSBkZWJ1Z2ZzX2Ny
ZWF0ZV9kaXIoInV2Y3ZpZGVvIiwgdXNiX2RlYnVnX3Jvb3QpOw0KLQlpZiAoSVNfRVJSX09SX05V
TEwoZGlyKSkgew0KLQkJdXZjX3ByaW50ayhLRVJOX0lORk8sICJVbmFibGUgdG8gY3JlYXRlIGRl
YnVnZnMgZGlyZWN0b3J5XG4iKTsNCi0JCXJldHVybjsNCi0JfQ0KLQ0KLQl1dmNfZGVidWdmc19y
b290X2RpciA9IGRpcjsNCisJdXZjX2RlYnVnZnNfcm9vdF9kaXIgPSBkZWJ1Z2ZzX2NyZWF0ZV9k
aXIoInV2Y3ZpZGVvIiwgdXNiX2RlYnVnX3Jvb3QpOw0KIH0NCiANCiB2b2lkIHV2Y19kZWJ1Z2Zz
X2NsZWFudXAodm9pZCkNCi0tIA0KMi4yMy4wDQo=

