Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9423128C382
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731783AbgJLU7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731618AbgJLU64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C62C0613D0;
        Mon, 12 Oct 2020 13:58:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 083EE1F44C2B
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] media: hantro: make consistent use of decimal register notation
Date:   Mon, 12 Oct 2020 23:59:41 +0300
Message-Id: <20201012205957.889185-3-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This header used a combination of direct hex offsets and decimal register
notation - via the G1_SWREG() macro - which is annoying when comparing with
the ref manuals which always use the equivalent of G1_SWREG(), so convert
the entire file to G1_SWREG() notation.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_regs.h | 52 +++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
index 80ff297f6f68..073b64cbe295 100644
--- a/drivers/staging/media/hantro/hantro_g1_regs.h
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -9,10 +9,10 @@
 #ifndef HANTRO_G1_REGS_H_
 #define HANTRO_G1_REGS_H_
 
-#define G1_SWREG(nr)                 ((nr) * 4)
+#define G1_SWREG(nr)					((nr) * 4)
 
 /* Decoder registers. */
-#define G1_REG_INTERRUPT				0x004
+#define G1_REG_INTERRUPT				G1_SWREG(1)
 /* Interrupt bits. Some are present in:
  *    - all core versions (">= g1")
  *    - g1, missing in g2, but added back starting with vc8000d ("not in g2")
@@ -41,7 +41,7 @@
 #define     G1_REG_INTERRUPT_DEC_BUS_INT_DIS		BIT(2) /* >= vc8000d */
 #define     G1_REG_INTERRUPT_DEC_STRM_CORRUPTED		BIT(1) /* >= vc8000d */
 #define     G1_REG_INTERRUPT_DEC_E			BIT(0) /* >= g1 */
-#define G1_REG_CONFIG					0x008
+#define G1_REG_CONFIG					G1_SWREG(2)
 #define     G1_REG_CONFIG_DEC_AXI_RD_ID(x)		(((x) & 0xff) << 24)
 #define     G1_REG_CONFIG_DEC_TIMEOUT_E			BIT(23)
 #define     G1_REG_CONFIG_DEC_STRSWAP32_E		BIT(22)
@@ -60,7 +60,7 @@
 #define     G1_REG_CONFIG_DEC_ADV_PRE_DIS		BIT(6)
 #define     G1_REG_CONFIG_DEC_SCMD_DIS			BIT(5)
 #define     G1_REG_CONFIG_DEC_MAX_BURST(x)		(((x) & 0x1f) << 0)
-#define G1_REG_DEC_CTRL0				0x00c
+#define G1_REG_DEC_CTRL0				G1_SWREG(3)
 #define     G1_REG_DEC_CTRL0_DEC_MODE(x)		(((x) & 0xf) << 28)
 #define     G1_REG_DEC_CTRL0_RLC_MODE_E			BIT(27)
 #define     G1_REG_DEC_CTRL0_SKIP_MODE			BIT(26)
@@ -85,7 +85,7 @@
 #define     G1_REG_DEC_CTRL0_PICORD_COUNT_E		BIT(9)
 #define     G1_REG_DEC_CTRL0_DEC_AHB_HLOCK_E		BIT(8)
 #define     G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(x)		(((x) & 0xff) << 0)
-#define G1_REG_DEC_CTRL1				0x010
+#define G1_REG_DEC_CTRL1				G1_SWREG(4)
 #define     G1_REG_DEC_CTRL1_PIC_MB_WIDTH(x)		(((x) & 0x1ff) << 23)
 #define     G1_REG_DEC_CTRL1_MB_WIDTH_OFF(x)		(((x) & 0xf) << 19)
 #define     G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(x)		(((x) & 0xff) << 11)
@@ -96,7 +96,7 @@
 #define     G1_REG_DEC_CTRL1_PIC_MB_W_EXT(x)		(((x) & 0x7) << 3)
 #define     G1_REG_DEC_CTRL1_PIC_MB_H_EXT(x)		(((x) & 0x7) << 0)
 #define     G1_REG_DEC_CTRL1_PIC_REFER_FLAG		BIT(0)
-#define G1_REG_DEC_CTRL2				0x014
+#define G1_REG_DEC_CTRL2				G1_SWREG(5)
 #define     G1_REG_DEC_CTRL2_STRM_START_BIT(x)		(((x) & 0x3f) << 26)
 #define     G1_REG_DEC_CTRL2_SYNC_MARKER_E		BIT(25)
 #define     G1_REG_DEC_CTRL2_TYPE1_QUANT_E		BIT(24)
@@ -139,13 +139,13 @@
 #define     G1_REG_DEC_CTRL2_BOOLEAN_RANGE(x)		(((x) & 0xff) << 0)
 #define     G1_REG_DEC_CTRL2_ALPHA_OFFSET(x)		(((x) & 0x1f) << 5)
 #define     G1_REG_DEC_CTRL2_BETA_OFFSET(x)		(((x) & 0x1f) << 0)
-#define G1_REG_DEC_CTRL3				0x018
+#define G1_REG_DEC_CTRL3				G1_SWREG(6)
 #define     G1_REG_DEC_CTRL3_START_CODE_E		BIT(31)
 #define     G1_REG_DEC_CTRL3_INIT_QP(x)			(((x) & 0x3f) << 25)
 #define     G1_REG_DEC_CTRL3_CH_8PIX_ILEAV_E		BIT(24)
 #define     G1_REG_DEC_CTRL3_STREAM_LEN_EXT(x)		(((x) & 0xff) << 24)
 #define     G1_REG_DEC_CTRL3_STREAM_LEN(x)		(((x) & 0xffffff) << 0)
-#define G1_REG_DEC_CTRL4				0x01c
+#define G1_REG_DEC_CTRL4				G1_SWREG(7)
 #define     G1_REG_DEC_CTRL4_CABAC_E			BIT(31)
 #define     G1_REG_DEC_CTRL4_BLACKWHITE_E		BIT(30)
 #define     G1_REG_DEC_CTRL4_DIR_8X8_INFER_E		BIT(29)
@@ -182,7 +182,7 @@
 #define     G1_REG_DEC_CTRL4_INIT_DC_MATCH0(x)		(((x) & 0x7) << 9)
 #define     G1_REG_DEC_CTRL4_INIT_DC_MATCH1(x)		(((x) & 0x7) << 6)
 #define     G1_REG_DEC_CTRL4_VP7_VERSION		BIT(5)
-#define G1_REG_DEC_CTRL5				0x020
+#define G1_REG_DEC_CTRL5				G1_SWREG(8)
 #define     G1_REG_DEC_CTRL5_CONST_INTRA_E		BIT(31)
 #define     G1_REG_DEC_CTRL5_FILT_CTRL_PRES		BIT(30)
 #define     G1_REG_DEC_CTRL5_RDPIC_CNT_PRES		BIT(29)
@@ -206,7 +206,7 @@
 #define     G1_REG_DEC_CTRL5_RV_BWD_SCALE(x)		(((x) & 0x3fff) << 0)
 #define     G1_REG_DEC_CTRL5_INIT_DC_COMP0(x)		(((x) & 0xffff) << 16)
 #define     G1_REG_DEC_CTRL5_INIT_DC_COMP1(x)		(((x) & 0xffff) << 0)
-#define G1_REG_DEC_CTRL6				0x024
+#define G1_REG_DEC_CTRL6				G1_SWREG(9)
 #define     G1_REG_DEC_CTRL6_PPS_ID(x)			(((x) & 0xff) << 24)
 #define     G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(x)		(((x) & 0x1f) << 19)
 #define     G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(x)		(((x) & 0x1f) << 14)
@@ -217,7 +217,7 @@
 #define     G1_REG_DEC_CTRL6_STREAM1_LEN(x)		(((x) & 0xffffff) << 0)
 #define     G1_REG_DEC_CTRL6_PIC_SLICE_AM(x)		(((x) & 0x1fff) << 0)
 #define     G1_REG_DEC_CTRL6_COEFFS_PART_AM(x)		(((x) & 0xf) << 24)
-#define G1_REG_FWD_PIC(i)				(0x028 + ((i) * 0x4))
+#define G1_REG_FWD_PIC(i)				(G1_SWREG(10) + ((i) * 0x4))
 #define     G1_REG_FWD_PIC_PINIT_RLIST_F5(x)		(((x) & 0x1f) << 25)
 #define     G1_REG_FWD_PIC_PINIT_RLIST_F4(x)		(((x) & 0x1f) << 20)
 #define     G1_REG_FWD_PIC_PINIT_RLIST_F3(x)		(((x) & 0x1f) << 15)
@@ -230,7 +230,7 @@
 #define     G1_REG_FWD_PIC1_SEGMENT_BASE(x)		((x) << 0)
 #define     G1_REG_FWD_PIC1_SEGMENT_UPD_E		BIT(1)
 #define     G1_REG_FWD_PIC1_SEGMENT_E			BIT(0)
-#define G1_REG_DEC_CTRL7				0x02c
+#define G1_REG_DEC_CTRL7				G1_SWREG(11)
 #define     G1_REG_DEC_CTRL7_PINIT_RLIST_F15(x)		(((x) & 0x1f) << 25)
 #define     G1_REG_DEC_CTRL7_PINIT_RLIST_F14(x)		(((x) & 0x1f) << 20)
 #define     G1_REG_DEC_CTRL7_PINIT_RLIST_F13(x)		(((x) & 0x1f) << 15)
@@ -245,12 +245,12 @@
 #define     G1_REG_DEC_CTRL7_DCT5_START_BIT(x)		(((x) & 0x3f) << 12)
 #define     G1_REG_DEC_CTRL7_DCT6_START_BIT(x)		(((x) & 0x3f) << 6)
 #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
-#define G1_REG_ADDR_STR					0x030
-#define G1_REG_ADDR_DST					0x034
-#define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
+#define G1_REG_ADDR_STR					G1_SWREG(12)
+#define G1_REG_ADDR_DST					G1_SWREG(13)
+#define G1_REG_ADDR_REF(i)				(G1_SWREG(14) + ((i) * 0x4))
 #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
 #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
-#define G1_REG_REF_PIC(i)				(0x078 + ((i) * 0x4))
+#define G1_REG_REF_PIC(i)				(G1_SWREG(30) + ((i) * 0x4))
 #define     G1_REG_REF_PIC_FILT_TYPE_E			BIT(31)
 #define     G1_REG_REF_PIC_FILT_SHARPNESS(x)		(((x) & 0x7) << 28)
 #define     G1_REG_REF_PIC_MB_ADJ_0(x)			(((x) & 0x7f) << 21)
@@ -267,11 +267,11 @@
 #define     G1_REG_REF_PIC_QUANT_DELTA_1(x)		(((x) & 0x1f) << 22)
 #define     G1_REG_REF_PIC_QUANT_0(x)			(((x) & 0x7ff) << 11)
 #define     G1_REG_REF_PIC_QUANT_1(x)			(((x) & 0x7ff) << 0)
-#define G1_REG_LT_REF					0x098
-#define G1_REG_VALID_REF				0x09c
-#define G1_REG_ADDR_QTABLE				0x0a0
-#define G1_REG_ADDR_DIR_MV				0x0a4
-#define G1_REG_BD_REF_PIC(i)				(0x0a8 + ((i) * 0x4))
+#define G1_REG_LT_REF					G1_SWREG(38)
+#define G1_REG_VALID_REF				G1_SWREG(39)
+#define G1_REG_ADDR_QTABLE				G1_SWREG(40)
+#define G1_REG_ADDR_DIR_MV				G1_SWREG(41)
+#define G1_REG_BD_REF_PIC(i)				(G1_SWREG(42) + ((i) * 0x4))
 #define     G1_REG_BD_REF_PIC_BINIT_RLIST_B2(x)		(((x) & 0x1f) << 25)
 #define     G1_REG_BD_REF_PIC_BINIT_RLIST_F2(x)		(((x) & 0x1f) << 20)
 #define     G1_REG_BD_REF_PIC_BINIT_RLIST_B1(x)		(((x) & 0x1f) << 15)
@@ -288,7 +288,7 @@
 #define     G1_REG_BD_REF_PIC_QUANT_DELTA_3(x)		(((x) & 0x1f) << 22)
 #define     G1_REG_BD_REF_PIC_QUANT_2(x)		(((x) & 0x7ff) << 11)
 #define     G1_REG_BD_REF_PIC_QUANT_3(x)		(((x) & 0x7ff) << 0)
-#define G1_REG_BD_P_REF_PIC				0x0bc
+#define G1_REG_BD_P_REF_PIC				G1_SWREG(47)
 #define     G1_REG_BD_P_REF_PIC_QUANT_DELTA_4(x)	(((x) & 0x1f) << 27)
 #define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F3(x)	(((x) & 0x1f) << 25)
 #define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F2(x)	(((x) & 0x1f) << 20)
@@ -296,21 +296,21 @@
 #define     G1_REG_BD_P_REF_PIC_PINIT_RLIST_F0(x)	(((x) & 0x1f) << 10)
 #define     G1_REG_BD_P_REF_PIC_BINIT_RLIST_B15(x)	(((x) & 0x1f) << 5)
 #define     G1_REG_BD_P_REF_PIC_BINIT_RLIST_F15(x)	(((x) & 0x1f) << 0)
-#define G1_REG_ERR_CONC					0x0c0
+#define G1_REG_ERR_CONC					G1_SWREG(48)
 #define     G1_REG_ERR_CONC_STARTMB_X(x)		(((x) & 0x1ff) << 23)
 #define     G1_REG_ERR_CONC_STARTMB_Y(x)		(((x) & 0xff) << 15)
-#define G1_REG_PRED_FLT					0x0c4
+#define G1_REG_PRED_FLT					G1_SWREG(49)
 #define     G1_REG_PRED_FLT_PRED_BC_TAP_0_0(x)		(((x) & 0x3ff) << 22)
 #define     G1_REG_PRED_FLT_PRED_BC_TAP_0_1(x)		(((x) & 0x3ff) << 12)
 #define     G1_REG_PRED_FLT_PRED_BC_TAP_0_2(x)		(((x) & 0x3ff) << 2)
-#define G1_REG_REF_BUF_CTRL				0x0cc
+#define G1_REG_REF_BUF_CTRL				G1_SWREG(51)
 #define     G1_REG_REF_BUF_CTRL_REFBU_E			BIT(31)
 #define     G1_REG_REF_BUF_CTRL_REFBU_THR(x)		(((x) & 0xfff) << 19)
 #define     G1_REG_REF_BUF_CTRL_REFBU_PICID(x)		(((x) & 0x1f) << 14)
 #define     G1_REG_REF_BUF_CTRL_REFBU_EVAL_E		BIT(13)
 #define     G1_REG_REF_BUF_CTRL_REFBU_FPARMOD_E		BIT(12)
 #define     G1_REG_REF_BUF_CTRL_REFBU_Y_OFFSET(x)	(((x) & 0x1ff) << 0)
-#define G1_REG_REF_BUF_CTRL2				0x0dc
+#define G1_REG_REF_BUF_CTRL2				G1_SWREG(55)
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_BUF_E		BIT(31)
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_THR(x)		(((x) & 0xfff) << 19)
 #define     G1_REG_REF_BUF_CTRL2_REFBU2_PICID(x)	(((x) & 0x1f) << 14)
-- 
2.28.0

