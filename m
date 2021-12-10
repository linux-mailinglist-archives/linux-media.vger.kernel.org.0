Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB3470718
	for <lists+linux-media@lfdr.de>; Fri, 10 Dec 2021 18:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244580AbhLJRai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Dec 2021 12:30:38 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:43206 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S244460AbhLJRad (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Dec 2021 12:30:33 -0500
X-UUID: 8a66b5db05b54330990f2211af852f73-20211211
X-UUID: 8a66b5db05b54330990f2211af852f73-20211211
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1049938422; Sat, 11 Dec 2021 01:26:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:26:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Dec 2021 01:26:52 +0800
From:   Flora Fu <flora.fu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>,
        JB Tsai <jb.tsai@mediatek.com>
Subject: [PATCH 17/17] arm64: dts: mt8192: Set up regulators for APU subsys
Date:   Sat, 11 Dec 2021 01:26:05 +0800
Message-ID: <20211210172605.30618-18-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set up APU regulators for mdla and vvpu.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 5d9e108e41f5..431008466d77 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -35,3 +35,8 @@
 		domain-supply = <&mt6359_vproc1_buck_reg>;
 	};
 };
+
+&apusys_power {
+	vvpu-supply = <&mt6359_vproc1_buck_reg>;
+	vmdla-supply = <&mt6359_vproc2_buck_reg>;
+};
-- 
2.18.0

