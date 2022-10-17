Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8FB46008CC
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiJQIgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiJQIgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:36:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7955FA7
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:36:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B305CCF;
        Mon, 17 Oct 2022 10:36:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665995770;
        bh=Qd1Y788MJMvn/o0HTDFGjxtFbIHc3x1QQyX9vQ0QwrA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CP4qaD2HC2YYfUwHun6S9VKls2dT/hzSerydffzHU4wfBirFllk9OSRXV/PrBxPHD
         maf8/AP3OZb6no4dROyWuExKKBAIPZjSVnwBKHUmFf5SOiLC0Dx7WkdiPmTRXKT8sk
         5QiyTBcz+HHNq9IpALlhgJqNBjx1EiWq+6W7V9oc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2.1 11/20] media: i2c: imx290: Define more register macros
Date:   Mon, 17 Oct 2022 11:35:45 +0300
Message-Id: <20221017083545.17952-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-12-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-12-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define macros for all registers programmed by the driver for which
documentation is available to increase readability. This starts making
use of 16-bit registers in the register arrays, so the value field has
to be increased to 32 bits.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes since v2:

- Fix ADBIT3 register width
---
 drivers/media/i2c/imx290.c | 219 +++++++++++++++++++++----------------
 1 file changed, 124 insertions(+), 95 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index eb007c40ff55..c7b55953f5b1 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -31,14 +31,73 @@
 #define IMX290_STANDBY					IMX290_REG_8BIT(0x3000)
 #define IMX290_REGHOLD					IMX290_REG_8BIT(0x3001)
 #define IMX290_XMSTA					IMX290_REG_8BIT(0x3002)
+#define IMX290_ADBIT					IMX290_REG_8BIT(0x3005)
+#define IMX290_ADBIT_10BIT				(0 << 0)
+#define IMX290_ADBIT_12BIT				(1 << 0)
+#define IMX290_CTRL_07					IMX290_REG_8BIT(0x3007)
+#define IMX290_VREVERSE					BIT(0)
+#define IMX290_HREVERSE					BIT(1)
+#define IMX290_WINMODE_1080P				(0 << 4)
+#define IMX290_WINMODE_720P				(1 << 4)
+#define IMX290_WINMODE_CROP				(4 << 4)
 #define IMX290_FR_FDG_SEL				IMX290_REG_8BIT(0x3009)
 #define IMX290_BLKLEVEL					IMX290_REG_16BIT(0x300a)
 #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
+#define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
 #define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
+#define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
+#define IMX290_WINWV_OB					IMX290_REG_8BIT(0x303a)
+#define IMX290_WINPV					IMX290_REG_16BIT(0x303c)
+#define IMX290_WINWV					IMX290_REG_16BIT(0x303e)
+#define IMX290_WINPH					IMX290_REG_16BIT(0x3040)
+#define IMX290_WINWH					IMX290_REG_16BIT(0x3042)
+#define IMX290_OUT_CTRL					IMX290_REG_8BIT(0x3046)
+#define IMX290_ODBIT_10BIT				(0 << 0)
+#define IMX290_ODBIT_12BIT				(1 << 0)
+#define IMX290_OPORTSEL_PARALLEL			(0x0 << 4)
+#define IMX290_OPORTSEL_LVDS_2CH			(0xd << 4)
+#define IMX290_OPORTSEL_LVDS_4CH			(0xe << 4)
+#define IMX290_OPORTSEL_LVDS_8CH			(0xf << 4)
+#define IMX290_XSOUTSEL					IMX290_REG_8BIT(0x304b)
+#define IMX290_XSOUTSEL_XVSOUTSEL_HIGH			(0 << 0)
+#define IMX290_XSOUTSEL_XVSOUTSEL_VSYNC			(2 << 0)
+#define IMX290_XSOUTSEL_XHSOUTSEL_HIGH			(0 << 2)
+#define IMX290_XSOUTSEL_XHSOUTSEL_HSYNC			(2 << 2)
+#define IMX290_INCKSEL1					IMX290_REG_8BIT(0x305c)
+#define IMX290_INCKSEL2					IMX290_REG_8BIT(0x305d)
+#define IMX290_INCKSEL3					IMX290_REG_8BIT(0x305e)
+#define IMX290_INCKSEL4					IMX290_REG_8BIT(0x305f)
 #define IMX290_PGCTRL					IMX290_REG_8BIT(0x308c)
+#define IMX290_ADBIT1					IMX290_REG_8BIT(0x3129)
+#define IMX290_ADBIT1_10BIT				0x1d
+#define IMX290_ADBIT1_12BIT				0x00
+#define IMX290_INCKSEL5					IMX290_REG_8BIT(0x315e)
+#define IMX290_INCKSEL6					IMX290_REG_8BIT(0x3164)
+#define IMX290_ADBIT2					IMX290_REG_8BIT(0x317c)
+#define IMX290_ADBIT2_10BIT				0x12
+#define IMX290_ADBIT2_12BIT				0x00
 #define IMX290_CHIP_ID					IMX290_REG_16BIT(0x319a)
+#define IMX290_ADBIT3					IMX290_REG_8BIT(0x31ec)
+#define IMX290_ADBIT3_10BIT				0x37
+#define IMX290_ADBIT3_12BIT				0x0e
+#define IMX290_REPETITION				IMX290_REG_8BIT(0x3405)
 #define IMX290_PHY_LANE_NUM				IMX290_REG_8BIT(0x3407)
+#define IMX290_OPB_SIZE_V				IMX290_REG_8BIT(0x3414)
+#define IMX290_Y_OUT_SIZE				IMX290_REG_16BIT(0x3418)
+#define IMX290_CSI_DT_FMT				IMX290_REG_16BIT(0x3441)
+#define IMX290_CSI_DT_FMT_RAW10				0x0a0a
+#define IMX290_CSI_DT_FMT_RAW12				0x0c0c
 #define IMX290_CSI_LANE_MODE				IMX290_REG_8BIT(0x3443)
+#define IMX290_EXTCK_FREQ				IMX290_REG_16BIT(0x3444)
+#define IMX290_TCLKPOST					IMX290_REG_16BIT(0x3446)
+#define IMX290_THSZERO					IMX290_REG_16BIT(0x3448)
+#define IMX290_THSPREPARE				IMX290_REG_16BIT(0x344a)
+#define IMX290_TCLKTRAIL				IMX290_REG_16BIT(0x344c)
+#define IMX290_THSTRAIL					IMX290_REG_16BIT(0x344e)
+#define IMX290_TCLKZERO					IMX290_REG_16BIT(0x3450)
+#define IMX290_TCLKPREPARE				IMX290_REG_16BIT(0x3452)
+#define IMX290_TLPX					IMX290_REG_16BIT(0x3454)
+#define IMX290_X_OUT_SIZE				IMX290_REG_16BIT(0x3472)
 
 #define IMX290_PGCTRL_REGEN				BIT(0)
 #define IMX290_PGCTRL_THRU				BIT(1)
@@ -54,7 +113,7 @@ static const char * const imx290_supply_name[] = {
 
 struct imx290_regval {
 	u32 reg;
-	u8 val;
+	u32 val;
 };
 
 struct imx290_mode {
@@ -116,22 +175,16 @@ static const char * const imx290_test_pattern_menu[] = {
 };
 
 static const struct imx290_regval imx290_global_init_settings[] = {
-	{ IMX290_REG_8BIT(0x3007), 0x00 },
-	{ IMX290_REG_8BIT(0x3018), 0x65 },
-	{ IMX290_REG_8BIT(0x3019), 0x04 },
-	{ IMX290_REG_8BIT(0x301a), 0x00 },
-	{ IMX290_REG_8BIT(0x3444), 0x20 },
-	{ IMX290_REG_8BIT(0x3445), 0x25 },
-	{ IMX290_REG_8BIT(0x303a), 0x0c },
-	{ IMX290_REG_8BIT(0x3040), 0x00 },
-	{ IMX290_REG_8BIT(0x3041), 0x00 },
-	{ IMX290_REG_8BIT(0x303c), 0x00 },
-	{ IMX290_REG_8BIT(0x303d), 0x00 },
-	{ IMX290_REG_8BIT(0x3042), 0x9c },
-	{ IMX290_REG_8BIT(0x3043), 0x07 },
-	{ IMX290_REG_8BIT(0x303e), 0x49 },
-	{ IMX290_REG_8BIT(0x303f), 0x04 },
-	{ IMX290_REG_8BIT(0x304b), 0x0a },
+	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
+	{ IMX290_VMAX, 1125 },
+	{ IMX290_EXTCK_FREQ, 0x2520 },
+	{ IMX290_WINWV_OB, 12 },
+	{ IMX290_WINPH, 0 },
+	{ IMX290_WINPV, 0 },
+	{ IMX290_WINWH, 1948 },
+	{ IMX290_WINWV, 1097 },
+	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
+			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
 	{ IMX290_REG_8BIT(0x300f), 0x00 },
 	{ IMX290_REG_8BIT(0x3010), 0x21 },
 	{ IMX290_REG_8BIT(0x3012), 0x64 },
@@ -177,102 +230,78 @@ static const struct imx290_regval imx290_global_init_settings[] = {
 
 static const struct imx290_regval imx290_1080p_settings[] = {
 	/* mode settings */
-	{ IMX290_REG_8BIT(0x3007), 0x00 },
-	{ IMX290_REG_8BIT(0x303a), 0x0c },
-	{ IMX290_REG_8BIT(0x3414), 0x0a },
-	{ IMX290_REG_8BIT(0x3472), 0x80 },
-	{ IMX290_REG_8BIT(0x3473), 0x07 },
-	{ IMX290_REG_8BIT(0x3418), 0x38 },
-	{ IMX290_REG_8BIT(0x3419), 0x04 },
+	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
+	{ IMX290_WINWV_OB, 12 },
+	{ IMX290_OPB_SIZE_V, 10 },
+	{ IMX290_X_OUT_SIZE, 1920 },
+	{ IMX290_Y_OUT_SIZE, 1080 },
 	{ IMX290_REG_8BIT(0x3012), 0x64 },
 	{ IMX290_REG_8BIT(0x3013), 0x00 },
-	{ IMX290_REG_8BIT(0x305c), 0x18 },
-	{ IMX290_REG_8BIT(0x305d), 0x03 },
-	{ IMX290_REG_8BIT(0x305e), 0x20 },
-	{ IMX290_REG_8BIT(0x305f), 0x01 },
-	{ IMX290_REG_8BIT(0x315e), 0x1a },
-	{ IMX290_REG_8BIT(0x3164), 0x1a },
+	{ IMX290_INCKSEL1, 0x18 },
+	{ IMX290_INCKSEL2, 0x03 },
+	{ IMX290_INCKSEL3, 0x20 },
+	{ IMX290_INCKSEL4, 0x01 },
+	{ IMX290_INCKSEL5, 0x1a },
+	{ IMX290_INCKSEL6, 0x1a },
 	{ IMX290_REG_8BIT(0x3480), 0x49 },
 	/* data rate settings */
-	{ IMX290_REG_8BIT(0x3405), 0x10 },
-	{ IMX290_REG_8BIT(0x3446), 0x57 },
-	{ IMX290_REG_8BIT(0x3447), 0x00 },
-	{ IMX290_REG_8BIT(0x3448), 0x37 },
-	{ IMX290_REG_8BIT(0x3449), 0x00 },
-	{ IMX290_REG_8BIT(0x344a), 0x1f },
-	{ IMX290_REG_8BIT(0x344b), 0x00 },
-	{ IMX290_REG_8BIT(0x344c), 0x1f },
-	{ IMX290_REG_8BIT(0x344d), 0x00 },
-	{ IMX290_REG_8BIT(0x344e), 0x1f },
-	{ IMX290_REG_8BIT(0x344f), 0x00 },
-	{ IMX290_REG_8BIT(0x3450), 0x77 },
-	{ IMX290_REG_8BIT(0x3451), 0x00 },
-	{ IMX290_REG_8BIT(0x3452), 0x1f },
-	{ IMX290_REG_8BIT(0x3453), 0x00 },
-	{ IMX290_REG_8BIT(0x3454), 0x17 },
-	{ IMX290_REG_8BIT(0x3455), 0x00 },
+	{ IMX290_REPETITION, 0x10 },
+	{ IMX290_TCLKPOST, 87 },
+	{ IMX290_THSZERO, 55 },
+	{ IMX290_THSPREPARE, 31 },
+	{ IMX290_TCLKTRAIL, 31 },
+	{ IMX290_THSTRAIL, 31 },
+	{ IMX290_TCLKZERO, 119 },
+	{ IMX290_TCLKPREPARE, 31 },
+	{ IMX290_TLPX, 23 },
 };
 
 static const struct imx290_regval imx290_720p_settings[] = {
 	/* mode settings */
-	{ IMX290_REG_8BIT(0x3007), 0x10 },
-	{ IMX290_REG_8BIT(0x303a), 0x06 },
-	{ IMX290_REG_8BIT(0x3414), 0x04 },
-	{ IMX290_REG_8BIT(0x3472), 0x00 },
-	{ IMX290_REG_8BIT(0x3473), 0x05 },
-	{ IMX290_REG_8BIT(0x3418), 0xd0 },
-	{ IMX290_REG_8BIT(0x3419), 0x02 },
+	{ IMX290_CTRL_07, IMX290_WINMODE_720P },
+	{ IMX290_WINWV_OB, 6 },
+	{ IMX290_OPB_SIZE_V, 4 },
+	{ IMX290_X_OUT_SIZE, 1280 },
+	{ IMX290_Y_OUT_SIZE, 720 },
 	{ IMX290_REG_8BIT(0x3012), 0x64 },
 	{ IMX290_REG_8BIT(0x3013), 0x00 },
-	{ IMX290_REG_8BIT(0x305c), 0x20 },
-	{ IMX290_REG_8BIT(0x305d), 0x00 },
-	{ IMX290_REG_8BIT(0x305e), 0x20 },
-	{ IMX290_REG_8BIT(0x305f), 0x01 },
-	{ IMX290_REG_8BIT(0x315e), 0x1a },
-	{ IMX290_REG_8BIT(0x3164), 0x1a },
+	{ IMX290_INCKSEL1, 0x20 },
+	{ IMX290_INCKSEL2, 0x00 },
+	{ IMX290_INCKSEL3, 0x20 },
+	{ IMX290_INCKSEL4, 0x01 },
+	{ IMX290_INCKSEL5, 0x1a },
+	{ IMX290_INCKSEL6, 0x1a },
 	{ IMX290_REG_8BIT(0x3480), 0x49 },
 	/* data rate settings */
-	{ IMX290_REG_8BIT(0x3405), 0x10 },
-	{ IMX290_REG_8BIT(0x3446), 0x4f },
-	{ IMX290_REG_8BIT(0x3447), 0x00 },
-	{ IMX290_REG_8BIT(0x3448), 0x2f },
-	{ IMX290_REG_8BIT(0x3449), 0x00 },
-	{ IMX290_REG_8BIT(0x344a), 0x17 },
-	{ IMX290_REG_8BIT(0x344b), 0x00 },
-	{ IMX290_REG_8BIT(0x344c), 0x17 },
-	{ IMX290_REG_8BIT(0x344d), 0x00 },
-	{ IMX290_REG_8BIT(0x344e), 0x17 },
-	{ IMX290_REG_8BIT(0x344f), 0x00 },
-	{ IMX290_REG_8BIT(0x3450), 0x57 },
-	{ IMX290_REG_8BIT(0x3451), 0x00 },
-	{ IMX290_REG_8BIT(0x3452), 0x17 },
-	{ IMX290_REG_8BIT(0x3453), 0x00 },
-	{ IMX290_REG_8BIT(0x3454), 0x17 },
-	{ IMX290_REG_8BIT(0x3455), 0x00 },
+	{ IMX290_REPETITION, 0x10 },
+	{ IMX290_TCLKPOST, 79 },
+	{ IMX290_THSZERO, 47 },
+	{ IMX290_THSPREPARE, 23 },
+	{ IMX290_TCLKTRAIL, 23 },
+	{ IMX290_THSTRAIL, 23 },
+	{ IMX290_TCLKZERO, 87 },
+	{ IMX290_TCLKPREPARE, 23 },
+	{ IMX290_TLPX, 23 },
 };
 
 static const struct imx290_regval imx290_10bit_settings[] = {
-	{ IMX290_REG_8BIT(0x3005), 0x00},
-	{ IMX290_REG_8BIT(0x3046), 0x00},
-	{ IMX290_REG_8BIT(0x3129), 0x1d},
-	{ IMX290_REG_8BIT(0x317c), 0x12},
-	{ IMX290_REG_8BIT(0x31ec), 0x37},
-	{ IMX290_REG_8BIT(0x3441), 0x0a},
-	{ IMX290_REG_8BIT(0x3442), 0x0a},
-	{ IMX290_REG_8BIT(0x300a), 0x3c},
-	{ IMX290_REG_8BIT(0x300b), 0x00},
+	{ IMX290_ADBIT, IMX290_ADBIT_10BIT },
+	{ IMX290_OUT_CTRL, IMX290_ODBIT_10BIT },
+	{ IMX290_ADBIT1, IMX290_ADBIT1_10BIT },
+	{ IMX290_ADBIT2, IMX290_ADBIT2_10BIT },
+	{ IMX290_ADBIT3, IMX290_ADBIT3_10BIT },
+	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
+	{ IMX290_BLKLEVEL, 60 },
 };
 
 static const struct imx290_regval imx290_12bit_settings[] = {
-	{ IMX290_REG_8BIT(0x3005), 0x01 },
-	{ IMX290_REG_8BIT(0x3046), 0x01 },
-	{ IMX290_REG_8BIT(0x3129), 0x00 },
-	{ IMX290_REG_8BIT(0x317c), 0x00 },
-	{ IMX290_REG_8BIT(0x31ec), 0x0e },
-	{ IMX290_REG_8BIT(0x3441), 0x0c },
-	{ IMX290_REG_8BIT(0x3442), 0x0c },
-	{ IMX290_REG_8BIT(0x300a), 0xf0 },
-	{ IMX290_REG_8BIT(0x300b), 0x00 },
+	{ IMX290_ADBIT, IMX290_ADBIT_12BIT },
+	{ IMX290_OUT_CTRL, IMX290_ODBIT_12BIT },
+	{ IMX290_ADBIT1, IMX290_ADBIT1_12BIT },
+	{ IMX290_ADBIT2, IMX290_ADBIT2_12BIT },
+	{ IMX290_ADBIT3, IMX290_ADBIT3_12BIT },
+	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
+	{ IMX290_BLKLEVEL, 240 },
 };
 
 /* supported link frequencies */
-- 
Regards,

Laurent Pinchart

