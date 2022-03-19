Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABBBE4DE955
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243649AbiCSQc7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243654AbiCSQc6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:32:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E6423F9CF
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:37 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E2B52A4E;
        Sat, 19 Mar 2022 17:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707491;
        bh=TqBg5fhyBEX12byXIFRqYrypcKV/sIW1uaIXi4fhJGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LLmS9r0lkk1fBv5UTigNDTWgZzsMUldtr1y7Q9f/pmVPoyWvzC4z6Ryxo6nw3JBxh
         m8UjQqqEiM3dKUNZTIWsususzUl9dyh22CEtII86AmfIibvsPfE66cFRKsFk7Eplw9
         Bvo5HDxOpjlcFNalLR0D753VDxe1HVMPrGqEFEU4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 08/17] media: rkisp1: regs: Don't use BIT() macro for multi-bit register fields
Date:   Sat, 19 Mar 2022 18:30:51 +0200
Message-Id: <20220319163100.3083-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
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

The BIT() macro is meant to represent a single bit. It is incorrectly
used for register field values that store the value 1 in a multi-bit
field. Use the usual (1 << n) construct for those.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 52 +++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index d326214c7e07..9e786de23480 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -11,7 +11,7 @@
 /* ISP_CTRL */
 #define RKISP1_CIF_ISP_CTRL_ISP_ENABLE			BIT(0)
 #define RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT		(0 << 1)
-#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656		BIT(1)
+#define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656		(1 << 1)
 #define RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601		(2 << 1)
 #define RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601	(3 << 1)
 #define RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE		(4 << 1)
@@ -33,37 +33,37 @@
 #define RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW		BIT(1)
 #define RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW		BIT(2)
 #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_RGGB		(0 << 3)
-#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		BIT(3)
+#define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GRBG		(1 << 3)
 #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_GBRG		(2 << 3)
 #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT_BGGR		(3 << 3)
 #define RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(pat)		((pat) << 3)
 #define RKISP1_CIF_ISP_ACQ_PROP_YCBYCR			(0 << 7)
-#define RKISP1_CIF_ISP_ACQ_PROP_YCRYCB			BIT(7)
+#define RKISP1_CIF_ISP_ACQ_PROP_YCRYCB			(1 << 7)
 #define RKISP1_CIF_ISP_ACQ_PROP_CBYCRY			(2 << 7)
 #define RKISP1_CIF_ISP_ACQ_PROP_CRYCBY			(3 << 7)
 #define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL		(0 << 9)
-#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		BIT(9)
+#define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_EVEN		(1 << 9)
 #define RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ODD		(2 << 9)
 #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B		(0 << 12)
-#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO		BIT(12)
+#define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO		(1 << 12)
 #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_MSB		(2 << 12)
 #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO		(3 << 12)
 #define RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_MSB		(4 << 12)
 
 /* VI_DPCL */
 #define RKISP1_CIF_VI_DPCL_DMA_JPEG			(0 << 0)
-#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI		BIT(0)
+#define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_MI		(1 << 0)
 #define RKISP1_CIF_VI_DPCL_MP_MUX_MRSZ_JPEG		(2 << 0)
-#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MP			BIT(2)
+#define RKISP1_CIF_VI_DPCL_CHAN_MODE_MP			(1 << 2)
 #define RKISP1_CIF_VI_DPCL_CHAN_MODE_SP			(2 << 2)
 #define RKISP1_CIF_VI_DPCL_CHAN_MODE_MPSP		(3 << 2)
 #define RKISP1_CIF_VI_DPCL_DMA_SW_SPMUX			(0 << 4)
-#define RKISP1_CIF_VI_DPCL_DMA_SW_SI			BIT(4)
+#define RKISP1_CIF_VI_DPCL_DMA_SW_SI			(1 << 4)
 #define RKISP1_CIF_VI_DPCL_DMA_SW_IE			(2 << 4)
 #define RKISP1_CIF_VI_DPCL_DMA_SW_JPEG			(3 << 4)
 #define RKISP1_CIF_VI_DPCL_DMA_SW_ISP			(4 << 4)
 #define RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL		(0 << 8)
-#define RKISP1_CIF_VI_DPCL_IF_SEL_SMIA			BIT(8)
+#define RKISP1_CIF_VI_DPCL_IF_SEL_SMIA			(1 << 8)
 #define RKISP1_CIF_VI_DPCL_IF_SEL_MIPI			(2 << 8)
 #define RKISP1_CIF_VI_DPCL_DMA_IE_MUX_DMA		BIT(10)
 #define RKISP1_CIF_VI_DPCL_DMA_SP_MUX_DMA		BIT(11)
@@ -112,26 +112,26 @@
 #define RKISP1_CIF_MI_SP_AUTOUPDATE_ENABLE		BIT(14)
 #define RKISP1_CIF_MI_LAST_PIXEL_SIG_ENABLE		BIT(15)
 #define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_16		(0 << 16)
-#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_32		BIT(16)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_32		(1 << 16)
 #define RKISP1_CIF_MI_CTRL_BURST_LEN_LUM_64		(2 << 16)
 #define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_16		(0 << 18)
-#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_32		BIT(18)
+#define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_32		(1 << 18)
 #define RKISP1_CIF_MI_CTRL_BURST_LEN_CHROM_64		(2 << 18)
 #define RKISP1_CIF_MI_CTRL_INIT_BASE_EN			BIT(20)
 #define RKISP1_CIF_MI_CTRL_INIT_OFFSET_EN		BIT(21)
 #define RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8		(0 << 22)
-#define RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA		BIT(22)
+#define RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA		(1 << 22)
 #define RKISP1_MI_CTRL_MP_WRITE_YUVINT			(2 << 22)
 #define RKISP1_MI_CTRL_MP_WRITE_RAW12			(2 << 22)
 #define RKISP1_MI_CTRL_SP_WRITE_PLA			(0 << 24)
-#define RKISP1_MI_CTRL_SP_WRITE_SPLA			BIT(24)
+#define RKISP1_MI_CTRL_SP_WRITE_SPLA			(1 << 24)
 #define RKISP1_MI_CTRL_SP_WRITE_INT			(2 << 24)
 #define RKISP1_MI_CTRL_SP_INPUT_YUV400			(0 << 26)
-#define RKISP1_MI_CTRL_SP_INPUT_YUV420			BIT(26)
+#define RKISP1_MI_CTRL_SP_INPUT_YUV420			(1 << 26)
 #define RKISP1_MI_CTRL_SP_INPUT_YUV422			(2 << 26)
 #define RKISP1_MI_CTRL_SP_INPUT_YUV444			(3 << 26)
 #define RKISP1_MI_CTRL_SP_OUTPUT_YUV400			(0 << 28)
-#define RKISP1_MI_CTRL_SP_OUTPUT_YUV420			BIT(28)
+#define RKISP1_MI_CTRL_SP_OUTPUT_YUV420			(1 << 28)
 #define RKISP1_MI_CTRL_SP_OUTPUT_YUV422			(2 << 28)
 #define RKISP1_MI_CTRL_SP_OUTPUT_YUV444			(3 << 28)
 #define RKISP1_MI_CTRL_SP_OUTPUT_RGB565			(4 << 28)
@@ -186,22 +186,22 @@
 
 /* MI_DMA_CTRL */
 #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_16		(0 << 0)
-#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_32		BIT(0)
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_32		(1 << 0)
 #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_LUM_64		(2 << 0)
 #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_16	(0 << 2)
-#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	BIT(2)
+#define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_32	(1 << 2)
 #define RKISP1_CIF_MI_DMA_CTRL_BURST_LEN_CHROM_64	(2 << 2)
 #define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PLANAR		(0 << 4)
-#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_SPLANAR		BIT(4)
+#define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_SPLANAR		(1 << 4)
 #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV400		(0 << 6)
-#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV420		BIT(6)
+#define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV420		(1 << 6)
 #define RKISP1_CIF_MI_DMA_CTRL_READ_FMT_PACKED		(2 << 4)
 #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV422		(2 << 6)
 #define RKISP1_CIF_MI_DMA_CTRL_FMT_YUV444		(3 << 6)
 #define RKISP1_CIF_MI_DMA_CTRL_BYTE_SWAP		BIT(8)
 #define RKISP1_CIF_MI_DMA_CTRL_CONTINUOUS_ENA		BIT(9)
 #define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_NO		(0 << 12)
-#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		BIT(12)
+#define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_8BIT		(1 << 12)
 #define RKISP1_CIF_MI_DMA_CTRL_RGB_BAYER_16BIT		(2 << 12)
 /* MI_DMA_START */
 #define RKISP1_CIF_MI_DMA_START_ENABLE			BIT(0)
@@ -282,10 +282,10 @@
 #define RKISP1_CIF_C_PROC_TONE_RESERVED			0xF000
 /* DUAL_CROP_CTRL */
 #define RKISP1_CIF_DUAL_CROP_MP_MODE_BYPASS		(0 << 0)
-#define RKISP1_CIF_DUAL_CROP_MP_MODE_YUV		BIT(0)
+#define RKISP1_CIF_DUAL_CROP_MP_MODE_YUV		(1 << 0)
 #define RKISP1_CIF_DUAL_CROP_MP_MODE_RAW		(2 << 0)
 #define RKISP1_CIF_DUAL_CROP_SP_MODE_BYPASS		(0 << 2)
-#define RKISP1_CIF_DUAL_CROP_SP_MODE_YUV		BIT(2)
+#define RKISP1_CIF_DUAL_CROP_SP_MODE_YUV		(1 << 2)
 #define RKISP1_CIF_DUAL_CROP_SP_MODE_RAW		(2 << 2)
 #define RKISP1_CIF_DUAL_CROP_CFG_UPD_PERMANENT		BIT(4)
 #define RKISP1_CIF_DUAL_CROP_CFG_UPD			BIT(5)
@@ -294,7 +294,7 @@
 /* IMG_EFF_CTRL */
 #define RKISP1_CIF_IMG_EFF_CTRL_ENABLE			BIT(0)
 #define RKISP1_CIF_IMG_EFF_CTRL_MODE_BLACKWHITE		(0 << 1)
-#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE		BIT(1)
+#define RKISP1_CIF_IMG_EFF_CTRL_MODE_NEGATIVE		(1 << 1)
 #define RKISP1_CIF_IMG_EFF_CTRL_MODE_SEPIA		(2 << 1)
 #define RKISP1_CIF_IMG_EFF_CTRL_MODE_COLOR_SEL		(3 << 1)
 #define RKISP1_CIF_IMG_EFF_CTRL_MODE_EMBOSS		(4 << 1)
@@ -314,7 +314,7 @@
 
 /* IMG_EFF_COLOR_SEL */
 #define RKISP1_CIF_IMG_EFF_COLOR_RGB			0
-#define RKISP1_CIF_IMG_EFF_COLOR_B			BIT(0)
+#define RKISP1_CIF_IMG_EFF_COLOR_B			(1 << 0)
 #define RKISP1_CIF_IMG_EFF_COLOR_G			(2 << 0)
 #define RKISP1_CIF_IMG_EFF_COLOR_GB			(3 << 0)
 #define RKISP1_CIF_IMG_EFF_COLOR_R			(4 << 0)
@@ -376,7 +376,7 @@
 
 /* ISP HISTOGRAM CALCULATION : ISP_HIST_PROP */
 #define RKISP1_CIF_ISP_HIST_PROP_MODE_DIS_V10		(0 << 0)
-#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		BIT(0)
+#define RKISP1_CIF_ISP_HIST_PROP_MODE_RGB_V10		(1 << 0)
 #define RKISP1_CIF_ISP_HIST_PROP_MODE_RED_V10		(2 << 0)
 #define RKISP1_CIF_ISP_HIST_PROP_MODE_GREEN_V10		(3 << 0)
 #define RKISP1_CIF_ISP_HIST_PROP_MODE_BLUE_V10		(4 << 0)
@@ -639,7 +639,7 @@
 #define RKISP1_CIF_ISP_BLS_ENA				BIT(0)
 #define RKISP1_CIF_ISP_BLS_MODE_MEASURED		BIT(1)
 #define RKISP1_CIF_ISP_BLS_MODE_FIXED			0
-#define RKISP1_CIF_ISP_BLS_WINDOW_1			BIT(2)
+#define RKISP1_CIF_ISP_BLS_WINDOW_1			(1 << 2)
 #define RKISP1_CIF_ISP_BLS_WINDOW_2			(2 << 2)
 
 /* GAMMA-IN */
-- 
Regards,

Laurent Pinchart

