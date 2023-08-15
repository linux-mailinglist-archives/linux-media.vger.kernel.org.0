Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42A177D1B2
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 20:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239059AbjHOSYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 14:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239063AbjHOSYc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 14:24:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B32D1BC3
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 11:24:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 824999CE;
        Tue, 15 Aug 2023 20:23:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692123796;
        bh=hSnnMqUJnAsFVHcd912/RwiHslNtkmrh5Aenqp57yAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kHYrHpQySZH2d8uAd0jNPo1DSHJ7x3j5xEuSyi+Kn6r5R/hDWghrEwgoqwVtAb4Aw
         2Y85PIKCR2KC5zPDQQPnl4js9LJK6vObuVlCsQ2xRDlDspvYAee0ev7/zfJU2fl1o0
         JGWXhiWKxOpBlOfhK1RDb7vFR09U7/ZRYTpHBgC0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 03/12] media: i2c: imx219: Replace register addresses with macros
Date:   Tue, 15 Aug 2023 21:24:22 +0300
Message-ID: <20230815182431.18409-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
References: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define macros for all the known registers used in the register arrays,
and use them to replace the numerical addresses. This improves
readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 169 ++++++++++++++++++-------------------
 1 file changed, 81 insertions(+), 88 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 26ee33c09e6a..70a4cb4e152c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -41,6 +41,13 @@
 #define IMX219_CSI_2_LANE_MODE		0x01
 #define IMX219_CSI_4_LANE_MODE		0x03
 
+#define IMX219_REG_DPHY_CTRL		CCI_REG8(0x0128)
+#define IMX219_DPHY_CTRL_TIMING_AUTO	0
+#define IMX219_DPHY_CTRL_TIMING_MANUAL	1
+
+#define IMX219_REG_EXCK_FREQ		CCI_REG16(0x012a)
+#define IMX219_EXCK_FREQ(n)		((n) * 256)		/* n expressed in MHz */
+
 /* Analog gain control */
 #define IMX219_REG_ANALOG_GAIN		CCI_REG8(0x0157)
 #define IMX219_ANA_GAIN_MIN		0
@@ -75,6 +82,15 @@
 /* HBLANK control - read only */
 #define IMX219_PPL_DEFAULT		3448
 
+#define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
+#define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
+#define IMX219_REG_X_ADD_END_A		CCI_REG16(0x0166)
+#define IMX219_REG_Y_ADD_STA_A		CCI_REG16(0x0168)
+#define IMX219_REG_Y_ADD_END_A		CCI_REG16(0x016a)
+#define IMX219_REG_X_OUTPUT_SIZE	CCI_REG16(0x016c)
+#define IMX219_REG_Y_OUTPUT_SIZE	CCI_REG16(0x016e)
+#define IMX219_REG_X_ODD_INC_A		CCI_REG8(0x0170)
+#define IMX219_REG_Y_ODD_INC_A		CCI_REG8(0x0171)
 #define IMX219_REG_ORIENTATION		CCI_REG8(0x0172)
 
 /* Binning  Mode */
@@ -83,6 +99,18 @@
 #define IMX219_BINNING_2X2		0x0101
 #define IMX219_BINNING_2X2_ANALOG	0x0303
 
+#define IMX219_REG_CSI_DATA_FORMAT_A	CCI_REG16(0x018c)
+
+/* PLL Settings */
+#define IMX219_REG_VTPXCK_DIV		CCI_REG8(0x0301)
+#define IMX219_REG_VTSYCK_DIV		CCI_REG8(0x0303)
+#define IMX219_REG_PREPLLCK_VT_DIV	CCI_REG8(0x0304)
+#define IMX219_REG_PREPLLCK_OP_DIV	CCI_REG8(0x0305)
+#define IMX219_REG_PLL_VT_MPY		CCI_REG16(0x0306)
+#define IMX219_REG_OPPXCK_DIV		CCI_REG8(0x0309)
+#define IMX219_REG_OPSYCK_DIV		CCI_REG8(0x030b)
+#define IMX219_REG_PLL_OP_MPY		CCI_REG16(0x030c)
+
 /* Test Pattern Control */
 #define IMX219_REG_TEST_PATTERN		CCI_REG16(0x0600)
 #define IMX219_TEST_PATTERN_DISABLE	0
@@ -100,6 +128,9 @@
 #define IMX219_TESTP_COLOUR_MAX		0x03ff
 #define IMX219_TESTP_COLOUR_STEP	1
 
+#define IMX219_REG_TP_WINDOW_WIDTH	CCI_REG16(0x0624)
+#define IMX219_REG_TP_WINDOW_HEIGHT	CCI_REG16(0x0626)
+
 /* External clock frequency is 24.0M */
 #define IMX219_XCLK_FREQ		24000000
 
@@ -144,7 +175,7 @@ struct imx219_mode {
 };
 
 static const struct cci_reg_sequence imx219_common_regs[] = {
-	{ CCI_REG8(0x0100), 0x00 },	/* Mode Select */
+	{ IMX219_REG_MODE_SELECT, 0x00 },	/* Mode Select */
 
 	/* To Access Addresses 3000-5fff, send the following commands */
 	{ CCI_REG8(0x30eb), 0x0c },
@@ -155,15 +186,13 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ CCI_REG8(0x30eb), 0x09 },
 
 	/* PLL Clock Table */
-	{ CCI_REG8(0x0301), 0x05 },	/* VTPXCK_DIV */
-	{ CCI_REG8(0x0303), 0x01 },	/* VTSYSCK_DIV */
-	{ CCI_REG8(0x0304), 0x03 },	/* PREPLLCK_VT_DIV 0x03 = AUTO set */
-	{ CCI_REG8(0x0305), 0x03 },	/* PREPLLCK_OP_DIV 0x03 = AUTO set */
-	{ CCI_REG8(0x0306), 0x00 },	/* PLL_VT_MPY */
-	{ CCI_REG8(0x0307), 0x39 },
-	{ CCI_REG8(0x030b), 0x01 },	/* OP_SYS_CLK_DIV */
-	{ CCI_REG8(0x030c), 0x00 },	/* PLL_OP_MPY */
-	{ CCI_REG8(0x030d), 0x72 },
+	{ IMX219_REG_VTPXCK_DIV, 5 },
+	{ IMX219_REG_VTSYCK_DIV, 1 },
+	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
+	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
+	{ IMX219_REG_PLL_VT_MPY, 57 },
+	{ IMX219_REG_OPSYCK_DIV, 1 },
+	{ IMX219_REG_PLL_OP_MPY, 114 },
 
 	/* Undocumented registers */
 	{ CCI_REG8(0x455e), 0x00 },
@@ -180,16 +209,14 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ CCI_REG8(0x479b), 0x0e },
 
 	/* Frame Bank Register Group "A" */
-	{ CCI_REG8(0x0162), 0x0d },	/* Line_Length_A */
-	{ CCI_REG8(0x0163), 0x78 },
-	{ CCI_REG8(0x0170), 0x01 },	/* X_ODD_INC_A */
-	{ CCI_REG8(0x0171), 0x01 },	/* Y_ODD_INC_A */
+	{ IMX219_REG_LINE_LENGTH_A, 3448 },
+	{ IMX219_REG_X_ODD_INC_A, 1 },
+	{ IMX219_REG_Y_ODD_INC_A, 1 },
 
 	/* Output setup registers */
-	{ CCI_REG8(0x0114), 0x01 },	/* CSI 2-Lane Mode */
-	{ CCI_REG8(0x0128), 0x00 },	/* DPHY Auto Mode */
-	{ CCI_REG8(0x012a), 0x18 },	/* EXCK_Freq */
-	{ CCI_REG8(0x012b), 0x00 },
+	{ IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
+	{ IMX219_REG_DPHY_CTRL, IMX219_DPHY_CTRL_TIMING_AUTO },
+	{ IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(24) },
 };
 
 /*
@@ -198,91 +225,57 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
  * 3280x2464 = mode 2, 1920x1080 = mode 1, 1640x1232 = mode 4, 640x480 = mode 7.
  */
 static const struct cci_reg_sequence mode_3280x2464_regs[] = {
-	{ CCI_REG8(0x0164), 0x00 },
-	{ CCI_REG8(0x0165), 0x00 },
-	{ CCI_REG8(0x0166), 0x0c },
-	{ CCI_REG8(0x0167), 0xcf },
-	{ CCI_REG8(0x0168), 0x00 },
-	{ CCI_REG8(0x0169), 0x00 },
-	{ CCI_REG8(0x016a), 0x09 },
-	{ CCI_REG8(0x016b), 0x9f },
-	{ CCI_REG8(0x016c), 0x0c },
-	{ CCI_REG8(0x016d), 0xd0 },
-	{ CCI_REG8(0x016e), 0x09 },
-	{ CCI_REG8(0x016f), 0xa0 },
-	{ CCI_REG8(0x0624), 0x0c },
-	{ CCI_REG8(0x0625), 0xd0 },
-	{ CCI_REG8(0x0626), 0x09 },
-	{ CCI_REG8(0x0627), 0xa0 },
+	{ IMX219_REG_X_ADD_STA_A, 0 },
+	{ IMX219_REG_X_ADD_END_A, 3279 },
+	{ IMX219_REG_Y_ADD_STA_A, 0 },
+	{ IMX219_REG_Y_ADD_END_A, 2463 },
+	{ IMX219_REG_X_OUTPUT_SIZE, 3280 },
+	{ IMX219_REG_Y_OUTPUT_SIZE, 2464 },
+	{ IMX219_REG_TP_WINDOW_WIDTH, 3280 },
+	{ IMX219_REG_TP_WINDOW_HEIGHT, 2464 },
 };
 
 static const struct cci_reg_sequence mode_1920_1080_regs[] = {
-	{ CCI_REG8(0x0164), 0x02 },
-	{ CCI_REG8(0x0165), 0xa8 },
-	{ CCI_REG8(0x0166), 0x0a },
-	{ CCI_REG8(0x0167), 0x27 },
-	{ CCI_REG8(0x0168), 0x02 },
-	{ CCI_REG8(0x0169), 0xb4 },
-	{ CCI_REG8(0x016a), 0x06 },
-	{ CCI_REG8(0x016b), 0xeb },
-	{ CCI_REG8(0x016c), 0x07 },
-	{ CCI_REG8(0x016d), 0x80 },
-	{ CCI_REG8(0x016e), 0x04 },
-	{ CCI_REG8(0x016f), 0x38 },
-	{ CCI_REG8(0x0624), 0x07 },
-	{ CCI_REG8(0x0625), 0x80 },
-	{ CCI_REG8(0x0626), 0x04 },
-	{ CCI_REG8(0x0627), 0x38 },
+	{ IMX219_REG_X_ADD_STA_A, 680 },
+	{ IMX219_REG_X_ADD_END_A, 2599 },
+	{ IMX219_REG_Y_ADD_STA_A, 692 },
+	{ IMX219_REG_Y_ADD_END_A, 1771 },
+	{ IMX219_REG_X_OUTPUT_SIZE, 1920 },
+	{ IMX219_REG_Y_OUTPUT_SIZE, 1080 },
+	{ IMX219_REG_TP_WINDOW_WIDTH, 1920 },
+	{ IMX219_REG_TP_WINDOW_HEIGHT, 1080 },
 };
 
 static const struct cci_reg_sequence mode_1640_1232_regs[] = {
-	{ CCI_REG8(0x0164), 0x00 },
-	{ CCI_REG8(0x0165), 0x00 },
-	{ CCI_REG8(0x0166), 0x0c },
-	{ CCI_REG8(0x0167), 0xcf },
-	{ CCI_REG8(0x0168), 0x00 },
-	{ CCI_REG8(0x0169), 0x00 },
-	{ CCI_REG8(0x016a), 0x09 },
-	{ CCI_REG8(0x016b), 0x9f },
-	{ CCI_REG8(0x016c), 0x06 },
-	{ CCI_REG8(0x016d), 0x68 },
-	{ CCI_REG8(0x016e), 0x04 },
-	{ CCI_REG8(0x016f), 0xd0 },
-	{ CCI_REG8(0x0624), 0x06 },
-	{ CCI_REG8(0x0625), 0x68 },
-	{ CCI_REG8(0x0626), 0x04 },
-	{ CCI_REG8(0x0627), 0xd0 },
+	{ IMX219_REG_X_ADD_STA_A, 0 },
+	{ IMX219_REG_X_ADD_END_A, 3279 },
+	{ IMX219_REG_Y_ADD_STA_A, 0 },
+	{ IMX219_REG_Y_ADD_END_A, 2463 },
+	{ IMX219_REG_X_OUTPUT_SIZE, 1640 },
+	{ IMX219_REG_Y_OUTPUT_SIZE, 1232 },
+	{ IMX219_REG_TP_WINDOW_WIDTH, 1640 },
+	{ IMX219_REG_TP_WINDOW_HEIGHT, 1232 },
 };
 
 static const struct cci_reg_sequence mode_640_480_regs[] = {
-	{ CCI_REG8(0x0164), 0x03 },
-	{ CCI_REG8(0x0165), 0xe8 },
-	{ CCI_REG8(0x0166), 0x08 },
-	{ CCI_REG8(0x0167), 0xe7 },
-	{ CCI_REG8(0x0168), 0x02 },
-	{ CCI_REG8(0x0169), 0xf0 },
-	{ CCI_REG8(0x016a), 0x06 },
-	{ CCI_REG8(0x016b), 0xaf },
-	{ CCI_REG8(0x016c), 0x02 },
-	{ CCI_REG8(0x016d), 0x80 },
-	{ CCI_REG8(0x016e), 0x01 },
-	{ CCI_REG8(0x016f), 0xe0 },
-	{ CCI_REG8(0x0624), 0x06 },
-	{ CCI_REG8(0x0625), 0x68 },
-	{ CCI_REG8(0x0626), 0x04 },
-	{ CCI_REG8(0x0627), 0xd0 },
+	{ IMX219_REG_X_ADD_STA_A, 1000 },
+	{ IMX219_REG_X_ADD_END_A, 2279 },
+	{ IMX219_REG_Y_ADD_STA_A, 752 },
+	{ IMX219_REG_Y_ADD_END_A, 1711 },
+	{ IMX219_REG_X_OUTPUT_SIZE, 640 },
+	{ IMX219_REG_Y_OUTPUT_SIZE, 480 },
+	{ IMX219_REG_TP_WINDOW_WIDTH, 1640 },
+	{ IMX219_REG_TP_WINDOW_HEIGHT, 1232 },
 };
 
 static const struct cci_reg_sequence raw8_framefmt_regs[] = {
-	{ CCI_REG8(0x018c), 0x08 },
-	{ CCI_REG8(0x018d), 0x08 },
-	{ CCI_REG8(0x0309), 0x08 },
+	{ IMX219_REG_CSI_DATA_FORMAT_A, 0x0808 },
+	{ IMX219_REG_OPPXCK_DIV, 8 },
 };
 
 static const struct cci_reg_sequence raw10_framefmt_regs[] = {
-	{ CCI_REG8(0x018c), 0x0a },
-	{ CCI_REG8(0x018d), 0x0a },
-	{ CCI_REG8(0x0309), 0x0a },
+	{ IMX219_REG_CSI_DATA_FORMAT_A, 0x0a0a },
+	{ IMX219_REG_OPPXCK_DIV, 10 },
 };
 
 static const s64 imx219_link_freq_menu[] = {
-- 
Regards,

Laurent Pinchart

