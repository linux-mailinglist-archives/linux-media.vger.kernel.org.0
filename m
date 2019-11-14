Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13EFFFC478
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 11:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfKNKln (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 05:41:43 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:21682 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726106AbfKNKln (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 05:41:43 -0500
X-UUID: 643af06b793c481a9dd8c0e19b893d80-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3Hb+GulXPHl9WfS/G9RKBXjYYpkrW9wDbRVBOF5b1w4=;
        b=LIhc3J981dsfT7l9wUB5w4vx7VFwE1iWoqKA4bqScnUZmu1KrV3j+jhylP90S7OSNJ7rit9FWZQeZlm899ZNh3rvOx/FTgbsmMs+XAvHOuUclm+/59JpGzuWwbl5rn3x1XL8A9ZoutK20/fDspdBNZzYc6wZwJOzMNkjhW9o5PM=;
X-UUID: 643af06b793c481a9dd8c0e19b893d80-20191114
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1361920880; Thu, 14 Nov 2019 18:41:37 +0800
Received: from mtkmbs05dr.mediatek.inc (172.21.101.97) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05dr.mediatek.inc (172.21.101.97) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 14 Nov 2019 18:41:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 18:41:31 +0800
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
Subject: [PATCH v3 02/13] usb: chipidea: debug: create debugfs directory under usb root
Date:   Thu, 14 Nov 2019 18:41:14 +0800
Message-ID: <1573728085-29016-2-git-send-email-chunfeng.yun@mediatek.com>
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
X2RlYnVnX3Jvb3QNCi0tLQ0KIGRyaXZlcnMvdXNiL2NoaXBpZGVhL2RlYnVnLmMgfCAyICstDQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9kZWJ1Zy5jIGIvZHJpdmVycy91c2IvY2hpcGlkZWEv
ZGVidWcuYw0KaW5kZXggZmNjOTFhMzM4ODc1Li5lMDM3NmVlNjQ2YWQgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL3VzYi9jaGlwaWRlYS9kZWJ1Zy5jDQorKysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9k
ZWJ1Zy5jDQpAQCAtMzQyLDcgKzM0Miw3IEBAIERFRklORV9TSE9XX0FUVFJJQlVURShjaV9yZWdp
c3RlcnMpOw0KICAqLw0KIHZvaWQgZGJnX2NyZWF0ZV9maWxlcyhzdHJ1Y3QgY2lfaGRyYyAqY2kp
DQogew0KLQljaS0+ZGVidWdmcyA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShjaS0+ZGV2
KSwgTlVMTCk7DQorCWNpLT5kZWJ1Z2ZzID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9uYW1lKGNp
LT5kZXYpLCB1c2JfZGVidWdfcm9vdCk7DQogDQogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImRldmlj
ZSIsIFNfSVJVR08sIGNpLT5kZWJ1Z2ZzLCBjaSwNCiAJCQkgICAgJmNpX2RldmljZV9mb3BzKTsN
Ci0tIA0KMi4yMy4wDQo=

