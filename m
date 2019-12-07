Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 663FE115EF5
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2019 23:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfLGWYe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Dec 2019 17:24:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:35796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbfLGWYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Dec 2019 17:24:33 -0500
Received: from ziggy.de (unknown [95.169.229.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A9622467B;
        Sat,  7 Dec 2019 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575757472;
        bh=yS94gpuqS6tiHsqCJmY/O8oa8kDut8tm51xSNkTZ76A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E88N+dHr4B9LMmu2YL5b4Ufwkb7SxzGaIEKT07wumDn+KHCXw47y38Y0PM5Dst7Ux
         TncGVS8eTiDlA6u47fYhj+JunvHahIwg9D6V/xDbhs+AZs1xDOjJGJMcmTswxeF/fq
         krvJEijvc6e6lNxuHKxt3P/eTdyhfWOIgr9Zm83c=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
Subject: [PATCH v6 01/12] dt-bindings: display: mediatek: Add mmsys binding description
Date:   Sat,  7 Dec 2019 23:23:38 +0100
Message-Id: <20191207222349.23161-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

The MediaTek DRM has a block called mmsys, which sets
the routing and enalbes the different blocks.
This patch adds one line for the mmsys bindings description.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 .../display/mediatek/mediatek,disp.txt        | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 8469de510001..c71c8a4b73ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -27,20 +27,22 @@ Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
-	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
-	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
-	"mediatek,<chip>-disp-wdma"  - write DMA
-	"mediatek,<chip>-disp-color" - color processor
-	"mediatek,<chip>-disp-aal"   - adaptive ambient light controller
-	"mediatek,<chip>-disp-gamma" - gamma correction
-	"mediatek,<chip>-disp-merge" - merge streams from two RDMA sources
-	"mediatek,<chip>-disp-split" - split stream to two encoders
-	"mediatek,<chip>-disp-ufoe"  - data compression engine
-	"mediatek,<chip>-dsi"        - DSI controller, see mediatek,dsi.txt
-	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
-	"mediatek,<chip>-disp-mutex" - display mutex
-	"mediatek,<chip>-disp-od"    - overdrive
+	"mediatek,<chip>-disp-ovl"		- overlay (4 layers, blending, csc)
+	"mediatek,<chip>-disp-rdma"		- read DMA / line buffer
+	"mediatek,<chip>-disp-wdma"		- write DMA
+	"mediatek,<chip>-disp-color"		- color processor
+	"mediatek,<chip>-disp-aal"		- adaptive ambient light controller
+	"mediatek,<chip>-disp-gamma"		- gamma correction
+	"mediatek,<chip>-disp-merge"		- merge streams from two RDMA sources
+	"mediatek,<chip>-disp-split"		- split stream to two encoders
+	"mediatek,<chip>-disp-ufoe"		- data compression engine
+	"mediatek,<chip>-dsi"			- DSI controller, see mediatek,dsi.txt
+	"mediatek,<chip>-dpi"			- DPI controller, see mediatek,dpi.txt
+	"mediatek,<chip>-disp-mutex"		- display mutex
+	"mediatek,<chip>-disp-od"		- overdrive
+	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
   the supported chips are mt2701, mt2712 and mt8173.
+
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
-- 
2.24.0

