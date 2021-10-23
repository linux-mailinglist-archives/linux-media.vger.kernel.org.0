Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1566C438366
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 13:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbhJWLRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 07:17:41 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:39562 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230255AbhJWLRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 07:17:25 -0400
X-UUID: 1aed83bd544f44cebda0d0605f318574-20211023
X-UUID: 1aed83bd544f44cebda0d0605f318574-20211023
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <flora.fu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 708797543; Sat, 23 Oct 2021 19:15:03 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 19:15:02 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 23 Oct
 2021 19:15:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 Oct 2021 19:15:02 +0800
From:   Flora Fu <flora.fu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Subject: [RFC 13/13] arm64: dts: mt8192: Add regulator for APU
Date:   Sat, 23 Oct 2021 19:14:09 +0800
Message-ID: <20211023111409.30463-14-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add regulator for mt8192 evb board.

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

