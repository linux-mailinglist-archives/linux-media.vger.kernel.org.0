Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79EAF429417
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 18:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhJKQFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 12:05:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50560 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhJKQEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 12:04:53 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:b116:1535:401e:a6ca])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ACBE71F42A6B;
        Mon, 11 Oct 2021 17:02:45 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, enric.balletbo@collabora.com,
        houlong.wei@mediatek.com, hsinyi@chromium.org, hverkuil@xs4all.nl,
        irui.wang@mediatek.com, maoguang.meng@mediatek.com,
        matthias.bgg@gmail.com, mchehab@kernel.org,
        minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH] arm64: dts: mediatek: mt8173: remove double 'assigned-clocks' binding
Date:   Mon, 11 Oct 2021 18:02:36 +0200
Message-Id: <20211011160236.6815-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The clock '<&topckgen CLK_TOP_VENC_LT_SEL>' is declared twice
in an 'assigned-clocks' list - in vcodec_dec and in
vcodec_enc_vp8. Fix it to be declared only in vcodec_enc_vp8

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index d9e005ae5bb0..51781444cedd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1422,15 +1422,13 @@
 				      "vencpll",
 				      "venc_lt_sel",
 				      "vdec_bus_clk_src";
-			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
-					  <&topckgen CLK_TOP_CCI400_SEL>,
+			assigned-clocks = <&topckgen CLK_TOP_CCI400_SEL>,
 					  <&topckgen CLK_TOP_VDEC_SEL>,
 					  <&apmixedsys CLK_APMIXED_VCODECPLL>,
 					  <&apmixedsys CLK_APMIXED_VENCPLL>;
-			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
-						 <&topckgen CLK_TOP_UNIVPLL_D2>,
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D2>,
 						 <&topckgen CLK_TOP_VCODECPLL>;
-			assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
+			assigned-clock-rates = <0>, <0>, <1482000000>, <800000000>;
 		};
 
 		larb1: larb@16010000 {
-- 
2.17.1

