Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5B6F88D9
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 07:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfKLGwL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 01:52:11 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:25168 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725801AbfKLGwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 01:52:10 -0500
X-UUID: 83f35eb39ee94dcf9d371c373e68aa27-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bcfzYmRx9os6HtHTVejsAOTqOvBkgsxwa1TyCFdMLf8=;
        b=FRKP57syZsCK31bgak1WRe63v0oZsgOUv+lTPeAnyPSTme/G86AO6cCCk3adf1dXY6ORultpoO+UoDMvd1q4+YDnhSt7ZoIu6BQIcH4KtJwFuXx0UmJdxaDUBM4BnJ9cJrqYMLB2WZVXnJ+TytdmOQJMdq7tjzAHCAqqHJsK4xg=;
X-UUID: 83f35eb39ee94dcf9d371c373e68aa27-20191112
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 34047829; Tue, 12 Nov 2019 14:52:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 14:52:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 12 Nov 2019 14:52:02 +0800
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
Subject: [PATCH v2 02/13] usb: chipidea: debug: create debugfs directory under usb root
Date:   Tue, 12 Nov 2019 14:51:48 +0800
Message-ID: <1573541519-28488-2-git-send-email-chunfeng.yun@mediatek.com>
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

TW92ZSBpdCdzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290IG9mIHRoZSBkZWJ1Z2ZzIGZpbGVzeXN0
ZW0gaW50bw0KdGhlIHJvb3Qgb2YgdXNiDQoNClNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8
Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjI6DQogIDEuIGFiYW5kb24gbmV3IEFQ
SSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCksIGFuZCB1c2UgdXNiX2RlYnVnX3Jvb3QNCi0tLQ0K
IGRyaXZlcnMvdXNiL2NoaXBpZGVhL2RlYnVnLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9j
aGlwaWRlYS9kZWJ1Zy5jIGIvZHJpdmVycy91c2IvY2hpcGlkZWEvZGVidWcuYw0KaW5kZXggZmNj
OTFhMzM4ODc1Li5lMDM3NmVlNjQ2YWQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRl
YS9kZWJ1Zy5jDQorKysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9kZWJ1Zy5jDQpAQCAtMzQyLDcg
KzM0Miw3IEBAIERFRklORV9TSE9XX0FUVFJJQlVURShjaV9yZWdpc3RlcnMpOw0KICAqLw0KIHZv
aWQgZGJnX2NyZWF0ZV9maWxlcyhzdHJ1Y3QgY2lfaGRyYyAqY2kpDQogew0KLQljaS0+ZGVidWdm
cyA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShjaS0+ZGV2KSwgTlVMTCk7DQorCWNpLT5k
ZWJ1Z2ZzID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKGNpLT5kZXYpLCB1c2JfZGVidWdf
cm9vdCk7DQogDQogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImRldmljZSIsIFNfSVJVR08sIGNpLT5k
ZWJ1Z2ZzLCBjaSwNCiAJCQkgICAgJmNpX2RldmljZV9mb3BzKTsNCi0tIA0KMi4yMy4wDQo=

