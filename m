Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0D0FC44A
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfKNKll (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:41:41 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:14860 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725977AbfKNKlk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:41:40 -0500
X-UUID: cd2f0d8402b1427d9701618f20d65886-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0tBiZpHnf425YMkNlYRFqHDCec3UUmeDOqF4HLvc6wQ=;
        b=Agvxk1MACNVFtcElkisR46STmWWUiFuUodj14dJ7BVL5wj9TWRPLXn2E6Ygpk5UakJ9s9KGB2iWmfZAkR15V2ZE1o6do7E9zsuh6LCGsyIBGZfARmhihVqw7ai/4q5ZUdJoIZGX0i8Y8WJvUGibGjdnkfXs5noV/LBEDLOKq+mU=;
X-UUID: cd2f0d8402b1427d9701618f20d65886-20191114
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1220913259; Thu, 14 Nov 2019 18:41:34 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:28 +0800
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
Subject: [PATCH v3 01/13] media: uvcvideo: drop error check of debugfs_create_dir()
Date:   Thu, 14 Nov 2019 18:41:13 +0800
Message-ID: <1573728085-29016-1-git-send-email-chunfeng.yun@mediatek.com>
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
Ci0tLQ0KdjM6IG5vIGNoYW5nZXMNCg0KdjI6DQogIDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVi
dWdmc19jcmVhdGVfZGlyKCksIGFuZCBkcm9wIGVycm9yIGNoZWNrDQotLS0NCiBkcml2ZXJzL21l
ZGlhL3VzYi91dmMvdXZjX2RlYnVnZnMuYyB8IDEwICstLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3VzYi91dmMvdXZjX2RlYnVnZnMuYyBiL2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNf
ZGVidWdmcy5jDQppbmRleCBkMmIxMDk5NTlkODIuLjJiOGFmNGI1NDExNyAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfZGVidWdmcy5jDQorKysgYi9kcml2ZXJzL21lZGlh
L3VzYi91dmMvdXZjX2RlYnVnZnMuYw0KQEAgLTEwOCwxNSArMTA4LDcgQEAgdm9pZCB1dmNfZGVi
dWdmc19jbGVhbnVwX3N0cmVhbShzdHJ1Y3QgdXZjX3N0cmVhbWluZyAqc3RyZWFtKQ0KIA0KIHZv
aWQgdXZjX2RlYnVnZnNfaW5pdCh2b2lkKQ0KIHsNCi0Jc3RydWN0IGRlbnRyeSAqZGlyOw0KLQ0K
LQlkaXIgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoInV2Y3ZpZGVvIiwgdXNiX2RlYnVnX3Jvb3QpOw0K
LQlpZiAoSVNfRVJSX09SX05VTEwoZGlyKSkgew0KLQkJdXZjX3ByaW50ayhLRVJOX0lORk8sICJV
bmFibGUgdG8gY3JlYXRlIGRlYnVnZnMgZGlyZWN0b3J5XG4iKTsNCi0JCXJldHVybjsNCi0JfQ0K
LQ0KLQl1dmNfZGVidWdmc19yb290X2RpciA9IGRpcjsNCisJdXZjX2RlYnVnZnNfcm9vdF9kaXIg
PSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoInV2Y3ZpZGVvIiwgdXNiX2RlYnVnX3Jvb3QpOw0KIH0NCiAN
CiB2b2lkIHV2Y19kZWJ1Z2ZzX2NsZWFudXAodm9pZCkNCi0tIA0KMi4yMy4wDQo=

