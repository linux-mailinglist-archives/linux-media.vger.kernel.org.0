Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E52562699
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbiF3XLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbiF3XLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:11:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8DB36334
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:11:37 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2304A2A59;
        Fri,  1 Jul 2022 01:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630491;
        bh=7944xSN0uq3rpNEJb3CtzLzMdC4oI4/1ClzARNyUoAg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NwWGTEaOuJQ+hVrd+kFIAU1pufMh03hyiRG44R8/pSUuuTWrCF0HrXigbIjwPZh4L
         LdmfRAa0eDlKy1lG7eO3JBtf9tdWtU63AnHTvpKSO5WULbvQV7skJJBg5djQW3WNjg
         BVQeOA4s/CC3BFJTwDWAgRWQQ374aClVW6PY0478=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 52/55] media: rkisp1: Add i.MX8MP-specific registers for MI and resizer
Date:   Fri,  1 Jul 2022 02:07:10 +0300
Message-Id: <20220630230713.10580-53-laurent.pinchart@ideasonboard.com>
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

Add register definitions for resizer format conversion control and for
the memory interface output that are specific to the ISP version in the
i.MX8MP.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-regs.h    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
index 5c2195019723..dd63ae13e603 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -171,6 +171,23 @@
 /* RSZ_CROP_[XY]_DIR */
 #define RKISP1_CIF_RSZ_CROP_XY_DIR(start, end)		((end) << 16 | (start) << 0)
 
+/* RSZ_FORMAT_CONV_CTRL */
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_INPUT_FORMAT_YCBCR_400	(0 << 0)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_INPUT_FORMAT_YCBCR_420	(1 << 0)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_INPUT_FORMAT_YCBCR_422	(2 << 0)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_INPUT_FORMAT_YCBCR_444	(3 << 0)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_OUTPUT_FORMAT_YCBCR_400	(0 << 2)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_OUTPUT_FORMAT_YCBCR_420	(1 << 2)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_OUTPUT_FORMAT_YCBCR_422	(2 << 2)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_OUTPUT_FORMAT_YCBCR_444	(3 << 2)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_CFG_Y_FULL			BIT(5)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_CFG_CBCR_FULL			BIT(6)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_CFG_422NOCOSITED		BIT(7)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_DATA_WIDTH_10_BIT_ENABLE	BIT(8)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_DATA_WIDTH_10_BIT_METHOD	BIT(9)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_PACK_FORMAT_PLANAR		(0 << 10)
+#define RKISP1_CIF_RSZ_FORMAT_CONV_CTRL_RSZ_PACK_FORMAT_SEMI_PLANAR	(1 << 10)
+
 /* MI_IMSC - MI_MIS - MI_RIS - MI_ICR - MI_ISR */
 #define RKISP1_CIF_MI_FRAME(stream)			BIT((stream)->id)
 #define RKISP1_CIF_MI_MBLK_LINE				BIT(2)
@@ -212,6 +229,22 @@
 #define RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP	BIT(0)
 #define RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP	BIT(1)
 #define RKISP1_CIF_MI_XTD_FMT_CTRL_DMA_CB_CR_SWAP	BIT(2)
+/* MI_OUTPUT_ALIGN_FORMAT */
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_LSB_ALIGNMENT			BIT(0)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_BYTES		BIT(1)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_WORDS		BIT(2)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_MP_BYTE_SWAP_DWORDS		BIT(3)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_SP_BYTE_SWAP_BYTES		BIT(4)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_SP_BYTE_SWAP_WORDS		BIT(5)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_SP_BYTE_SWAP_DWORDS		BIT(6)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_DMA_BYTE_SWAP_BYTES		BIT(7)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_DMA_BYTE_SWAP_WORDS		BIT(8)
+#define RKISP1_CIF_OUTPUT_ALIGN_FORMAT_DMA_BYTE_SWAP_DWORDS		BIT(9)
+/* MI_MP_OUTPUT_FIFO_SIZE */
+#define RKISP1_CIF_MI_MP_OUTPUT_FIFO_SIZE_OUTPUT_FIFO_DEPTH_FULL	(0 << 0)
+#define RKISP1_CIF_MI_MP_OUTPUT_FIFO_SIZE_OUTPUT_FIFO_DEPTH_HALF	(1 << 0)
+#define RKISP1_CIF_MI_MP_OUTPUT_FIFO_SIZE_OUTPUT_FIFO_DEPTH_QUARTER	(2 << 0)
+#define RKISP1_CIF_MI_MP_OUTPUT_FIFO_SIZE_OUTPUT_FIFO_DEPTH_EIGHT	(3 << 0)
 
 /* VI_CCL */
 #define RKISP1_CIF_CCL_CIF_CLK_DIS			BIT(2)
-- 
Regards,

Laurent Pinchart

