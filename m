Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BC554BA5D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345029AbiFNTPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357934AbiFNTPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:15:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755FE764E
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:15:30 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB80B9E5;
        Tue, 14 Jun 2022 21:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234129;
        bh=InAoFYTpv2IR4VgCX+XR+7V60n9zC0NurDrDkBszFNs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=To9UAGv4xtLOhYvgXaRz7LOmW0tGgm6kTycU3gdOZcGC2TAdkdGU5Q8608V1CX+xI
         nA4SderMP4y2DBrYW5HdmKImKeki2PSxsFfk0EJ+KK8+XBkVd0wvR66FIo0qZtOU8j
         1cqmXh+2omD5UNRSRp58ZSVCpfFuE/uJkVpG/9NQ=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, dafna@fastmail.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 54/55] media: rkisp1: Add register definitions for the test pattern generator
Date:   Wed, 15 Jun 2022 04:11:26 +0900
Message-Id: <20220614191127.3420492-55-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
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
2.30.2

