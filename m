Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FD75626E4
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbiF3XLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbiF3XLr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:11:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F8659265
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:11:43 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6262D2A67;
        Fri,  1 Jul 2022 01:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630492;
        bh=yO8fQy8aUsBlWZeXvaxtSZ7JcDGOXwPLF/nRHM7j6Ik=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ayWs8Y3QO30hHttDRKaw9JKpE9lL4xScBUR7h1gaCiUuAFHsbIIQUwKg1GU9FkKq4
         +YOARLRuN+Bi4C4z70vU6BVoM52GlAL5d7lyuCAXZgihvagSnmRDx364vxgxGGGd76
         87Y9XCMYTfn/MaL94LVhNvjuVDvIbtTLFD/1gtvo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 54/55] media: rkisp1: Add register definitions for the test pattern generator
Date:   Fri,  1 Jul 2022 02:07:12 +0300
Message-Id: <20220630230713.10580-55-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Paul Elder <paul.elder@ideasonboard.com>

Add register definitions and value macros for the test pattern generator
block in the ISP.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index dd63ae13e603..34f4fe09c88d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -717,6 +717,27 @@
 #define RKISP1_CIF_ISP_DPF_SPATIAL_COEFF_MAX		0x1F
 #define RKISP1_CIF_ISP_DPF_NLL_COEFF_N_MAX		0x3FF
 
+/* TPG */
+#define RKISP1_CIF_ISP_TPG_CTRL_ENA			BIT(0)
+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_3X3_COLOR_BLOCK	(0 << 1)
+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_COLOR_BAR		(1 << 1)
+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_GRAY_BAR		(2 << 1)
+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_HIGHLIGHT_GRID	(3 << 1)
+#define RKISP1_CIF_ISP_TPG_CTRL_IMG_RAND		(4 << 1)
+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_RGGB		(0 << 4)
+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_GRBG		(1 << 4)
+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_GBRB		(2 << 4)
+#define RKISP1_CIF_ISP_TPG_CTRL_CFA_BGGR		(3 << 4)
+#define RKISP1_CIF_ISP_TPG_CTRL_DEPTH_8			(0 << 6)
+#define RKISP1_CIF_ISP_TPG_CTRL_DEPTH_10		(1 << 6)
+#define RKISP1_CIF_ISP_TPG_CTRL_DEPTH_12		(2 << 6)
+#define RKISP1_CIF_ISP_TPG_CTRL_DEF_SYNC		BIT(8)
+#define RKISP1_CIF_ISP_TPG_CTRL_MAX_SYNC		BIT(9)
+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_1080P		(0 << 10)
+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_720P		(1 << 10)
+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_4K			(2 << 10)
+#define RKISP1_CIF_ISP_TPG_CTRL_SOL_USER_DEFINED	(3 << 10)
+
 /* =================================================================== */
 /*                            CIF Registers                            */
 /* =================================================================== */
@@ -912,6 +933,17 @@
 #define RKISP1_CIF_ISP_SH_DELAY			(RKISP1_CIF_ISP_SH_BASE + 0x00000008)
 #define RKISP1_CIF_ISP_SH_TIME			(RKISP1_CIF_ISP_SH_BASE + 0x0000000C)
 
+#define RKISP1_CIF_ISP_TPG_BASE			0x00000700
+#define RKISP1_CIF_ISP_TPG_CTRL			(RKISP1_CIF_ISP_TPG_BASE + 0x00000000)
+#define RKISP1_CIF_ISP_TPG_TOTAL_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000004)
+#define RKISP1_CIF_ISP_TPG_ACT_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000008)
+#define RKISP1_CIF_ISP_TPG_FP_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x0000000C)
+#define RKISP1_CIF_ISP_TPG_BP_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000010)
+#define RKISP1_CIF_ISP_TPG_W_IN			(RKISP1_CIF_ISP_TPG_BASE + 0x00000014)
+#define RKISP1_CIF_ISP_TPG_GAP_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x00000018)
+#define RKISP1_CIF_ISP_TPG_GAP_STD_IN		(RKISP1_CIF_ISP_TPG_BASE + 0x0000001C)
+#define RKISP1_CIF_ISP_TPG_RANDOM_SEED_IN	(RKISP1_CIF_ISP_TPG_BASE + 0x00000020)
+
 #define RKISP1_CIF_C_PROC_BASE			0x00000800
 #define RKISP1_CIF_C_PROC_CTRL			(RKISP1_CIF_C_PROC_BASE + 0x00000000)
 #define RKISP1_CIF_C_PROC_CONTRAST		(RKISP1_CIF_C_PROC_BASE + 0x00000004)
-- 
Regards,

Laurent Pinchart

