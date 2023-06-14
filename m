Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1D2E730834
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 21:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236918AbjFNT0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 15:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236560AbjFNTY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 15:24:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2384226A1
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 12:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686770638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UNVcGb909+iEab7qjZtKP5nZEXlvVS392htZWicQv4o=;
        b=Rt/dap45NEZPmYo4yTPTwgC5hc3j8Ag2Ig2ElZnrK1DrXuB9fAZ+oDLpeEVuaE++CgnedM
        ou6KOPQ7f3AT0S+XxToc5UKnjqibtJHHSqAshhXB6EIMifmXy5BMJAufAE+AGzwiD2GIMn
        9NZJqYCQ8yBWTGZrt0Eoy9DCkJGEXuo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-W0a7FbptPLeuWjaXX0UKbg-1; Wed, 14 Jun 2023 15:23:54 -0400
X-MC-Unique: W0a7FbptPLeuWjaXX0UKbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4770F80006E;
        Wed, 14 Jun 2023 19:23:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4B8FD1410F01;
        Wed, 14 Jun 2023 19:23:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 3/5] media: imx290: Convert to new CCI register access helpers
Date:   Wed, 14 Jun 2023 21:23:41 +0200
Message-Id: <20230614192343.57280-4-hdegoede@redhat.com>
In-Reply-To: <20230614192343.57280-1-hdegoede@redhat.com>
References: <20230614192343.57280-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new comon CCI register access helpers to replace the private
register access helpers in the imx290 driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note:
1. This is untested
2. For reviewers: all the IMX290_REG_?BIT defines in both the register
address defines as well as in various reg-sequences were automatically
changed using search replace.
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx290.c | 357 +++++++++++++++----------------------
 2 files changed, 147 insertions(+), 211 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 298884a09196..f6f0d7803a77 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -178,6 +178,7 @@ config VIDEO_IMX290
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
 	select V4L2_FWNODE
+	select V4L2_CCI
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX290 camera sensor.
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index b3f832e9d7e1..d4931e2c35d6 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -21,91 +21,86 @@
 #include <asm/unaligned.h>
 
 #include <media/media-entity.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define IMX290_REG_SIZE_SHIFT				16
-#define IMX290_REG_ADDR_MASK				0xffff
-#define IMX290_REG_8BIT(n)				((1U << IMX290_REG_SIZE_SHIFT) | (n))
-#define IMX290_REG_16BIT(n)				((2U << IMX290_REG_SIZE_SHIFT) | (n))
-#define IMX290_REG_24BIT(n)				((3U << IMX290_REG_SIZE_SHIFT) | (n))
-
-#define IMX290_STANDBY					IMX290_REG_8BIT(0x3000)
-#define IMX290_REGHOLD					IMX290_REG_8BIT(0x3001)
-#define IMX290_XMSTA					IMX290_REG_8BIT(0x3002)
-#define IMX290_ADBIT					IMX290_REG_8BIT(0x3005)
+#define IMX290_STANDBY					CCI_REG8(0x3000)
+#define IMX290_REGHOLD					CCI_REG8(0x3001)
+#define IMX290_XMSTA					CCI_REG8(0x3002)
+#define IMX290_ADBIT					CCI_REG8(0x3005)
 #define IMX290_ADBIT_10BIT				(0 << 0)
 #define IMX290_ADBIT_12BIT				(1 << 0)
-#define IMX290_CTRL_07					IMX290_REG_8BIT(0x3007)
+#define IMX290_CTRL_07					CCI_REG8(0x3007)
 #define IMX290_VREVERSE					BIT(0)
 #define IMX290_HREVERSE					BIT(1)
 #define IMX290_WINMODE_1080P				(0 << 4)
 #define IMX290_WINMODE_720P				(1 << 4)
 #define IMX290_WINMODE_CROP				(4 << 4)
-#define IMX290_FR_FDG_SEL				IMX290_REG_8BIT(0x3009)
-#define IMX290_BLKLEVEL					IMX290_REG_16BIT(0x300a)
-#define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
-#define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
+#define IMX290_FR_FDG_SEL				CCI_REG8(0x3009)
+#define IMX290_BLKLEVEL					CCI_REG16(0x300a)
+#define IMX290_GAIN					CCI_REG8(0x3014)
+#define IMX290_VMAX					CCI_REG24(0x3018)
 #define IMX290_VMAX_MAX					0x3ffff
-#define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
+#define IMX290_HMAX					CCI_REG16(0x301c)
 #define IMX290_HMAX_MAX					0xffff
-#define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
-#define IMX290_WINWV_OB					IMX290_REG_8BIT(0x303a)
-#define IMX290_WINPV					IMX290_REG_16BIT(0x303c)
-#define IMX290_WINWV					IMX290_REG_16BIT(0x303e)
-#define IMX290_WINPH					IMX290_REG_16BIT(0x3040)
-#define IMX290_WINWH					IMX290_REG_16BIT(0x3042)
-#define IMX290_OUT_CTRL					IMX290_REG_8BIT(0x3046)
+#define IMX290_SHS1					CCI_REG24(0x3020)
+#define IMX290_WINWV_OB					CCI_REG8(0x303a)
+#define IMX290_WINPV					CCI_REG16(0x303c)
+#define IMX290_WINWV					CCI_REG16(0x303e)
+#define IMX290_WINPH					CCI_REG16(0x3040)
+#define IMX290_WINWH					CCI_REG16(0x3042)
+#define IMX290_OUT_CTRL					CCI_REG8(0x3046)
 #define IMX290_ODBIT_10BIT				(0 << 0)
 #define IMX290_ODBIT_12BIT				(1 << 0)
 #define IMX290_OPORTSEL_PARALLEL			(0x0 << 4)
 #define IMX290_OPORTSEL_LVDS_2CH			(0xd << 4)
 #define IMX290_OPORTSEL_LVDS_4CH			(0xe << 4)
 #define IMX290_OPORTSEL_LVDS_8CH			(0xf << 4)
-#define IMX290_XSOUTSEL					IMX290_REG_8BIT(0x304b)
+#define IMX290_XSOUTSEL					CCI_REG8(0x304b)
 #define IMX290_XSOUTSEL_XVSOUTSEL_HIGH			(0 << 0)
 #define IMX290_XSOUTSEL_XVSOUTSEL_VSYNC			(2 << 0)
 #define IMX290_XSOUTSEL_XHSOUTSEL_HIGH			(0 << 2)
 #define IMX290_XSOUTSEL_XHSOUTSEL_HSYNC			(2 << 2)
-#define IMX290_INCKSEL1					IMX290_REG_8BIT(0x305c)
-#define IMX290_INCKSEL2					IMX290_REG_8BIT(0x305d)
-#define IMX290_INCKSEL3					IMX290_REG_8BIT(0x305e)
-#define IMX290_INCKSEL4					IMX290_REG_8BIT(0x305f)
-#define IMX290_PGCTRL					IMX290_REG_8BIT(0x308c)
-#define IMX290_ADBIT1					IMX290_REG_8BIT(0x3129)
+#define IMX290_INCKSEL1					CCI_REG8(0x305c)
+#define IMX290_INCKSEL2					CCI_REG8(0x305d)
+#define IMX290_INCKSEL3					CCI_REG8(0x305e)
+#define IMX290_INCKSEL4					CCI_REG8(0x305f)
+#define IMX290_PGCTRL					CCI_REG8(0x308c)
+#define IMX290_ADBIT1					CCI_REG8(0x3129)
 #define IMX290_ADBIT1_10BIT				0x1d
 #define IMX290_ADBIT1_12BIT				0x00
-#define IMX290_INCKSEL5					IMX290_REG_8BIT(0x315e)
-#define IMX290_INCKSEL6					IMX290_REG_8BIT(0x3164)
-#define IMX290_ADBIT2					IMX290_REG_8BIT(0x317c)
+#define IMX290_INCKSEL5					CCI_REG8(0x315e)
+#define IMX290_INCKSEL6					CCI_REG8(0x3164)
+#define IMX290_ADBIT2					CCI_REG8(0x317c)
 #define IMX290_ADBIT2_10BIT				0x12
 #define IMX290_ADBIT2_12BIT				0x00
-#define IMX290_CHIP_ID					IMX290_REG_16BIT(0x319a)
-#define IMX290_ADBIT3					IMX290_REG_8BIT(0x31ec)
+#define IMX290_CHIP_ID					CCI_REG16(0x319a)
+#define IMX290_ADBIT3					CCI_REG8(0x31ec)
 #define IMX290_ADBIT3_10BIT				0x37
 #define IMX290_ADBIT3_12BIT				0x0e
-#define IMX290_REPETITION				IMX290_REG_8BIT(0x3405)
-#define IMX290_PHY_LANE_NUM				IMX290_REG_8BIT(0x3407)
-#define IMX290_OPB_SIZE_V				IMX290_REG_8BIT(0x3414)
-#define IMX290_Y_OUT_SIZE				IMX290_REG_16BIT(0x3418)
-#define IMX290_CSI_DT_FMT				IMX290_REG_16BIT(0x3441)
+#define IMX290_REPETITION				CCI_REG8(0x3405)
+#define IMX290_PHY_LANE_NUM				CCI_REG8(0x3407)
+#define IMX290_OPB_SIZE_V				CCI_REG8(0x3414)
+#define IMX290_Y_OUT_SIZE				CCI_REG16(0x3418)
+#define IMX290_CSI_DT_FMT				CCI_REG16(0x3441)
 #define IMX290_CSI_DT_FMT_RAW10				0x0a0a
 #define IMX290_CSI_DT_FMT_RAW12				0x0c0c
-#define IMX290_CSI_LANE_MODE				IMX290_REG_8BIT(0x3443)
-#define IMX290_EXTCK_FREQ				IMX290_REG_16BIT(0x3444)
-#define IMX290_TCLKPOST					IMX290_REG_16BIT(0x3446)
-#define IMX290_THSZERO					IMX290_REG_16BIT(0x3448)
-#define IMX290_THSPREPARE				IMX290_REG_16BIT(0x344a)
-#define IMX290_TCLKTRAIL				IMX290_REG_16BIT(0x344c)
-#define IMX290_THSTRAIL					IMX290_REG_16BIT(0x344e)
-#define IMX290_TCLKZERO					IMX290_REG_16BIT(0x3450)
-#define IMX290_TCLKPREPARE				IMX290_REG_16BIT(0x3452)
-#define IMX290_TLPX					IMX290_REG_16BIT(0x3454)
-#define IMX290_X_OUT_SIZE				IMX290_REG_16BIT(0x3472)
-#define IMX290_INCKSEL7					IMX290_REG_8BIT(0x3480)
+#define IMX290_CSI_LANE_MODE				CCI_REG8(0x3443)
+#define IMX290_EXTCK_FREQ				CCI_REG16(0x3444)
+#define IMX290_TCLKPOST					CCI_REG16(0x3446)
+#define IMX290_THSZERO					CCI_REG16(0x3448)
+#define IMX290_THSPREPARE				CCI_REG16(0x344a)
+#define IMX290_TCLKTRAIL				CCI_REG16(0x344c)
+#define IMX290_THSTRAIL					CCI_REG16(0x344e)
+#define IMX290_TCLKZERO					CCI_REG16(0x3450)
+#define IMX290_TCLKPREPARE				CCI_REG16(0x3452)
+#define IMX290_TLPX					CCI_REG16(0x3454)
+#define IMX290_X_OUT_SIZE				CCI_REG16(0x3472)
+#define IMX290_INCKSEL7					CCI_REG8(0x3480)
 
 #define IMX290_PGCTRL_REGEN				BIT(0)
 #define IMX290_PGCTRL_THRU				BIT(1)
@@ -181,7 +176,7 @@ enum imx290_model {
 
 struct imx290_model_info {
 	enum imx290_colour_variant colour_variant;
-	const struct imx290_regval *init_regs;
+	const struct cci_reg_sequence *init_regs;
 	size_t init_regs_num;
 	const char *name;
 };
@@ -192,11 +187,6 @@ enum imx290_clk_freq {
 	IMX290_NUM_CLK
 };
 
-struct imx290_regval {
-	u32 reg;
-	u32 val;
-};
-
 /*
  * Clock configuration for registers INCKSEL1 to INCKSEL6.
  */
@@ -217,7 +207,7 @@ struct imx290_mode {
 	u8 link_freq_index;
 	u8 ctrl_07;
 
-	const struct imx290_regval *data;
+	const struct cci_reg_sequence *data;
 	u32 data_size;
 
 	const struct imx290_clk_cfg *clk_cfg;
@@ -271,7 +261,7 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
  * Modes and formats
  */
 
-static const struct imx290_regval imx290_global_init_settings[] = {
+static const struct cci_reg_sequence imx290_global_init_settings[] = {
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
 	{ IMX290_WINPV, 0 },
@@ -279,56 +269,56 @@ static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_WINWV, 1097 },
 	{ IMX290_XSOUTSEL, IMX290_XSOUTSEL_XVSOUTSEL_VSYNC |
 			   IMX290_XSOUTSEL_XHSOUTSEL_HSYNC },
-	{ IMX290_REG_8BIT(0x3011), 0x02 },
-	{ IMX290_REG_8BIT(0x3012), 0x64 },
-	{ IMX290_REG_8BIT(0x3013), 0x00 },
+	{ CCI_REG8(0x3011), 0x02 },
+	{ CCI_REG8(0x3012), 0x64 },
+	{ CCI_REG8(0x3013), 0x00 },
 };
 
-static const struct imx290_regval imx290_global_init_settings_290[] = {
-	{ IMX290_REG_8BIT(0x300f), 0x00 },
-	{ IMX290_REG_8BIT(0x3010), 0x21 },
-	{ IMX290_REG_8BIT(0x3016), 0x09 },
-	{ IMX290_REG_8BIT(0x3070), 0x02 },
-	{ IMX290_REG_8BIT(0x3071), 0x11 },
-	{ IMX290_REG_8BIT(0x309b), 0x10 },
-	{ IMX290_REG_8BIT(0x309c), 0x22 },
-	{ IMX290_REG_8BIT(0x30a2), 0x02 },
-	{ IMX290_REG_8BIT(0x30a6), 0x20 },
-	{ IMX290_REG_8BIT(0x30a8), 0x20 },
-	{ IMX290_REG_8BIT(0x30aa), 0x20 },
-	{ IMX290_REG_8BIT(0x30ac), 0x20 },
-	{ IMX290_REG_8BIT(0x30b0), 0x43 },
-	{ IMX290_REG_8BIT(0x3119), 0x9e },
-	{ IMX290_REG_8BIT(0x311c), 0x1e },
-	{ IMX290_REG_8BIT(0x311e), 0x08 },
-	{ IMX290_REG_8BIT(0x3128), 0x05 },
-	{ IMX290_REG_8BIT(0x313d), 0x83 },
-	{ IMX290_REG_8BIT(0x3150), 0x03 },
-	{ IMX290_REG_8BIT(0x317e), 0x00 },
-	{ IMX290_REG_8BIT(0x32b8), 0x50 },
-	{ IMX290_REG_8BIT(0x32b9), 0x10 },
-	{ IMX290_REG_8BIT(0x32ba), 0x00 },
-	{ IMX290_REG_8BIT(0x32bb), 0x04 },
-	{ IMX290_REG_8BIT(0x32c8), 0x50 },
-	{ IMX290_REG_8BIT(0x32c9), 0x10 },
-	{ IMX290_REG_8BIT(0x32ca), 0x00 },
-	{ IMX290_REG_8BIT(0x32cb), 0x04 },
-	{ IMX290_REG_8BIT(0x332c), 0xd3 },
-	{ IMX290_REG_8BIT(0x332d), 0x10 },
-	{ IMX290_REG_8BIT(0x332e), 0x0d },
-	{ IMX290_REG_8BIT(0x3358), 0x06 },
-	{ IMX290_REG_8BIT(0x3359), 0xe1 },
-	{ IMX290_REG_8BIT(0x335a), 0x11 },
-	{ IMX290_REG_8BIT(0x3360), 0x1e },
-	{ IMX290_REG_8BIT(0x3361), 0x61 },
-	{ IMX290_REG_8BIT(0x3362), 0x10 },
-	{ IMX290_REG_8BIT(0x33b0), 0x50 },
-	{ IMX290_REG_8BIT(0x33b2), 0x1a },
-	{ IMX290_REG_8BIT(0x33b3), 0x04 },
+static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
+	{ CCI_REG8(0x300f), 0x00 },
+	{ CCI_REG8(0x3010), 0x21 },
+	{ CCI_REG8(0x3016), 0x09 },
+	{ CCI_REG8(0x3070), 0x02 },
+	{ CCI_REG8(0x3071), 0x11 },
+	{ CCI_REG8(0x309b), 0x10 },
+	{ CCI_REG8(0x309c), 0x22 },
+	{ CCI_REG8(0x30a2), 0x02 },
+	{ CCI_REG8(0x30a6), 0x20 },
+	{ CCI_REG8(0x30a8), 0x20 },
+	{ CCI_REG8(0x30aa), 0x20 },
+	{ CCI_REG8(0x30ac), 0x20 },
+	{ CCI_REG8(0x30b0), 0x43 },
+	{ CCI_REG8(0x3119), 0x9e },
+	{ CCI_REG8(0x311c), 0x1e },
+	{ CCI_REG8(0x311e), 0x08 },
+	{ CCI_REG8(0x3128), 0x05 },
+	{ CCI_REG8(0x313d), 0x83 },
+	{ CCI_REG8(0x3150), 0x03 },
+	{ CCI_REG8(0x317e), 0x00 },
+	{ CCI_REG8(0x32b8), 0x50 },
+	{ CCI_REG8(0x32b9), 0x10 },
+	{ CCI_REG8(0x32ba), 0x00 },
+	{ CCI_REG8(0x32bb), 0x04 },
+	{ CCI_REG8(0x32c8), 0x50 },
+	{ CCI_REG8(0x32c9), 0x10 },
+	{ CCI_REG8(0x32ca), 0x00 },
+	{ CCI_REG8(0x32cb), 0x04 },
+	{ CCI_REG8(0x332c), 0xd3 },
+	{ CCI_REG8(0x332d), 0x10 },
+	{ CCI_REG8(0x332e), 0x0d },
+	{ CCI_REG8(0x3358), 0x06 },
+	{ CCI_REG8(0x3359), 0xe1 },
+	{ CCI_REG8(0x335a), 0x11 },
+	{ CCI_REG8(0x3360), 0x1e },
+	{ CCI_REG8(0x3361), 0x61 },
+	{ CCI_REG8(0x3362), 0x10 },
+	{ CCI_REG8(0x33b0), 0x50 },
+	{ CCI_REG8(0x33b2), 0x1a },
+	{ CCI_REG8(0x33b3), 0x04 },
 };
 
 #define IMX290_NUM_CLK_REGS	2
-static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
+static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
 	[IMX290_CLK_37_125] = {
 		{ IMX290_EXTCK_FREQ, (37125 * 256) / 1000 },
 		{ IMX290_INCKSEL7, 0x49 },
@@ -339,13 +329,13 @@ static const struct imx290_regval xclk_regs[][IMX290_NUM_CLK_REGS] = {
 	},
 };
 
-static const struct imx290_regval imx290_global_init_settings_327[] = {
-	{ IMX290_REG_8BIT(0x309e), 0x4A },
-	{ IMX290_REG_8BIT(0x309f), 0x4A },
-	{ IMX290_REG_8BIT(0x313b), 0x61 },
+static const struct cci_reg_sequence imx290_global_init_settings_327[] = {
+	{ CCI_REG8(0x309e), 0x4A },
+	{ CCI_REG8(0x309f), 0x4A },
+	{ CCI_REG8(0x313b), 0x61 },
 };
 
-static const struct imx290_regval imx290_1080p_settings[] = {
+static const struct cci_reg_sequence imx290_1080p_settings[] = {
 	/* mode settings */
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_OPB_SIZE_V, 10 },
@@ -353,7 +343,7 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ IMX290_Y_OUT_SIZE, 1080 },
 };
 
-static const struct imx290_regval imx290_720p_settings[] = {
+static const struct cci_reg_sequence imx290_720p_settings[] = {
 	/* mode settings */
 	{ IMX290_WINWV_OB, 6 },
 	{ IMX290_OPB_SIZE_V, 4 },
@@ -361,7 +351,7 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ IMX290_Y_OUT_SIZE, 720 },
 };
 
-static const struct imx290_regval imx290_10bit_settings[] = {
+static const struct cci_reg_sequence imx290_10bit_settings[] = {
 	{ IMX290_ADBIT, IMX290_ADBIT_10BIT },
 	{ IMX290_OUT_CTRL, IMX290_ODBIT_10BIT },
 	{ IMX290_ADBIT1, IMX290_ADBIT1_10BIT },
@@ -370,7 +360,7 @@ static const struct imx290_regval imx290_10bit_settings[] = {
 	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
 };
 
-static const struct imx290_regval imx290_12bit_settings[] = {
+static const struct cci_reg_sequence imx290_12bit_settings[] = {
 	{ IMX290_ADBIT, IMX290_ADBIT_12BIT },
 	{ IMX290_OUT_CTRL, IMX290_ODBIT_12BIT },
 	{ IMX290_ADBIT1, IMX290_ADBIT1_12BIT },
@@ -576,7 +566,7 @@ static inline int imx290_modes_num(const struct imx290 *imx290)
 struct imx290_format_info {
 	u32 code[IMX290_VARIANT_MAX];
 	u8 bpp;
-	const struct imx290_regval *regs;
+	const struct cci_reg_sequence *regs;
 	unsigned int num_regs;
 };
 
@@ -615,63 +605,15 @@ imx290_format_info(const struct imx290 *imx290, u32 code)
 	return NULL;
 }
 
-/* -----------------------------------------------------------------------------
- * Register access
- */
-
-static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *value)
-{
-	u8 data[3] = { 0, 0, 0 };
-	int ret;
-
-	ret = regmap_raw_read(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
-			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
-	if (ret < 0) {
-		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
-			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
-			 addr & IMX290_REG_ADDR_MASK, ret);
-		return ret;
-	}
-
-	*value = get_unaligned_le24(data);
-	return 0;
-}
-
-static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
-{
-	u8 data[3];
-	int ret;
-
-	if (err && *err)
-		return *err;
-
-	put_unaligned_le24(value, data);
-
-	ret = regmap_raw_write(imx290->regmap, addr & IMX290_REG_ADDR_MASK,
-			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
-	if (ret < 0) {
-		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
-			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
-			 addr & IMX290_REG_ADDR_MASK, ret);
-		if (err)
-			*err = ret;
-	}
-
-	return ret;
-}
-
 static int imx290_set_register_array(struct imx290 *imx290,
-				     const struct imx290_regval *settings,
+				     const struct cci_reg_sequence *settings,
 				     unsigned int num_settings)
 {
-	unsigned int i;
 	int ret;
 
-	for (i = 0; i < num_settings; ++i, ++settings) {
-		ret = imx290_write(imx290, settings->reg, settings->val, NULL);
-		if (ret < 0)
-			return ret;
-	}
+	ret = cci_multi_reg_write(imx290->regmap, settings, num_settings, NULL);
+	if (ret < 0)
+		return ret;
 
 	/* Provide 10ms settle time */
 	usleep_range(10000, 11000);
@@ -689,12 +631,12 @@ static int imx290_set_clock(struct imx290 *imx290)
 	ret = imx290_set_register_array(imx290, xclk_regs[clk_idx],
 					IMX290_NUM_CLK_REGS);
 
-	imx290_write(imx290, IMX290_INCKSEL1, clk_cfg->incksel1, &ret);
-	imx290_write(imx290, IMX290_INCKSEL2, clk_cfg->incksel2, &ret);
-	imx290_write(imx290, IMX290_INCKSEL3, clk_cfg->incksel3, &ret);
-	imx290_write(imx290, IMX290_INCKSEL4, clk_cfg->incksel4, &ret);
-	imx290_write(imx290, IMX290_INCKSEL5, clk_cfg->incksel5, &ret);
-	imx290_write(imx290, IMX290_INCKSEL6, clk_cfg->incksel6, &ret);
+	cci_write(imx290->regmap, IMX290_INCKSEL1, clk_cfg->incksel1, &ret);
+	cci_write(imx290->regmap, IMX290_INCKSEL2, clk_cfg->incksel2, &ret);
+	cci_write(imx290->regmap, IMX290_INCKSEL3, clk_cfg->incksel3, &ret);
+	cci_write(imx290->regmap, IMX290_INCKSEL4, clk_cfg->incksel4, &ret);
+	cci_write(imx290->regmap, IMX290_INCKSEL5, clk_cfg->incksel5, &ret);
+	cci_write(imx290->regmap, IMX290_INCKSEL6, clk_cfg->incksel6, &ret);
 
 	return ret;
 }
@@ -703,9 +645,9 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
 {
 	int ret = 0;
 
-	imx290_write(imx290, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
-	imx290_write(imx290, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, &ret);
-	imx290_write(imx290, IMX290_FR_FDG_SEL, 0x01, &ret);
+	cci_write(imx290->regmap, IMX290_PHY_LANE_NUM, imx290->nlanes - 1, &ret);
+	cci_write(imx290->regmap, IMX290_CSI_LANE_MODE, imx290->nlanes - 1, &ret);
+	cci_write(imx290->regmap, IMX290_FR_FDG_SEL, 0x01, &ret);
 
 	return ret;
 }
@@ -716,8 +658,8 @@ static int imx290_set_black_level(struct imx290 *imx290,
 {
 	unsigned int bpp = imx290_format_info(imx290, format->code)->bpp;
 
-	return imx290_write(imx290, IMX290_BLKLEVEL,
-			    black_level >> (16 - bpp), err);
+	return cci_write(imx290->regmap, IMX290_BLKLEVEL,
+			 black_level >> (16 - bpp), err);
 }
 
 static int imx290_set_csi_config(struct imx290 *imx290)
@@ -743,15 +685,15 @@ static int imx290_set_csi_config(struct imx290 *imx290)
 		return -EINVAL;
 	}
 
-	imx290_write(imx290, IMX290_REPETITION, csi_cfg->repetition, &ret);
-	imx290_write(imx290, IMX290_TCLKPOST, csi_cfg->tclkpost, &ret);
-	imx290_write(imx290, IMX290_THSZERO, csi_cfg->thszero, &ret);
-	imx290_write(imx290, IMX290_THSPREPARE, csi_cfg->thsprepare, &ret);
-	imx290_write(imx290, IMX290_TCLKTRAIL, csi_cfg->tclktrail, &ret);
-	imx290_write(imx290, IMX290_THSTRAIL, csi_cfg->thstrail, &ret);
-	imx290_write(imx290, IMX290_TCLKZERO, csi_cfg->tclkzero, &ret);
-	imx290_write(imx290, IMX290_TCLKPREPARE, csi_cfg->tclkprepare, &ret);
-	imx290_write(imx290, IMX290_TLPX, csi_cfg->tlpx, &ret);
+	cci_write(imx290->regmap, IMX290_REPETITION, csi_cfg->repetition, &ret);
+	cci_write(imx290->regmap, IMX290_TCLKPOST, csi_cfg->tclkpost, &ret);
+	cci_write(imx290->regmap, IMX290_THSZERO, csi_cfg->thszero, &ret);
+	cci_write(imx290->regmap, IMX290_THSPREPARE, csi_cfg->thsprepare, &ret);
+	cci_write(imx290->regmap, IMX290_TCLKTRAIL, csi_cfg->tclktrail, &ret);
+	cci_write(imx290->regmap, IMX290_THSTRAIL, csi_cfg->thstrail, &ret);
+	cci_write(imx290->regmap, IMX290_TCLKZERO, csi_cfg->tclkzero, &ret);
+	cci_write(imx290->regmap, IMX290_TCLKPREPARE, csi_cfg->tclkprepare, &ret);
+	cci_write(imx290->regmap, IMX290_TLPX, csi_cfg->tlpx, &ret);
 
 	return ret;
 }
@@ -817,13 +759,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
-		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
+		ret = cci_write(imx290->regmap, IMX290_GAIN, ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_VBLANK:
-		ret = imx290_write(imx290, IMX290_VMAX,
-				   ctrl->val + imx290->current_mode->height,
-				   NULL);
+		ret = cci_write(imx290->regmap, IMX290_VMAX,
+				ctrl->val + imx290->current_mode->height, NULL);
 		/*
 		 * Due to the way that exposure is programmed in this sensor in
 		 * relation to VMAX, we have to reprogramme it whenever VMAX is
@@ -835,20 +776,20 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		fallthrough;
 	case V4L2_CID_EXPOSURE:
 		vmax = imx290->vblank->val + imx290->current_mode->height;
-		ret = imx290_write(imx290, IMX290_SHS1,
-				   vmax - ctrl->val - 1, NULL);
+		ret = cci_write(imx290->regmap, IMX290_SHS1,
+				vmax - ctrl->val - 1, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
 			imx290_set_black_level(imx290, format, 0, &ret);
 			usleep_range(10000, 11000);
-			imx290_write(imx290, IMX290_PGCTRL,
-				     (u8)(IMX290_PGCTRL_REGEN |
-				     IMX290_PGCTRL_THRU |
-				     IMX290_PGCTRL_MODE(ctrl->val)), &ret);
+			cci_write(imx290->regmap, IMX290_PGCTRL,
+				  (u8)(IMX290_PGCTRL_REGEN |
+				       IMX290_PGCTRL_THRU |
+				       IMX290_PGCTRL_MODE(ctrl->val)), &ret);
 		} else {
-			imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
+			cci_write(imx290->regmap, IMX290_PGCTRL, 0x00, &ret);
 			usleep_range(10000, 11000);
 			imx290_set_black_level(imx290, format,
 					       IMX290_BLACK_LEVEL_DEFAULT, &ret);
@@ -856,9 +797,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_HBLANK:
-		ret = imx290_write(imx290, IMX290_HMAX,
-				   ctrl->val + imx290->current_mode->width,
-				   NULL);
+		ret = cci_write(imx290->regmap, IMX290_HMAX,
+				ctrl->val + imx290->current_mode->width, NULL);
 		break;
 
 	case V4L2_CID_HFLIP:
@@ -871,7 +811,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 			reg |= IMX290_HREVERSE;
 		if (imx290->vflip->val)
 			reg |= IMX290_VREVERSE;
-		ret = imx290_write(imx290, IMX290_CTRL_07, reg, NULL);
+		ret = cci_write(imx290->regmap, IMX290_CTRL_07, reg, NULL);
 		break;
 	}
 
@@ -1074,12 +1014,12 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
-	imx290_write(imx290, IMX290_STANDBY, 0x00, &ret);
+	cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
 
 	msleep(30);
 
 	/* Start streaming */
-	return imx290_write(imx290, IMX290_XMSTA, 0x00, &ret);
+	return cci_write(imx290->regmap, IMX290_XMSTA, 0x00, &ret);
 }
 
 /* Stop streaming */
@@ -1087,11 +1027,11 @@ static int imx290_stop_streaming(struct imx290 *imx290)
 {
 	int ret = 0;
 
-	imx290_write(imx290, IMX290_STANDBY, 0x01, &ret);
+	cci_write(imx290->regmap, IMX290_STANDBY, 0x01, &ret);
 
 	msleep(30);
 
-	return imx290_write(imx290, IMX290_XMSTA, 0x01, &ret);
+	return cci_write(imx290->regmap, IMX290_XMSTA, 0x01, &ret);
 }
 
 static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
@@ -1417,11 +1357,6 @@ static const struct dev_pm_ops imx290_pm_ops = {
  * Probe & remove
  */
 
-static const struct regmap_config imx290_regmap_config = {
-	.reg_bits = 16,
-	.val_bits = 8,
-};
-
 static const char * const imx290_supply_name[IMX290_NUM_SUPPLIES] = {
 	"vdda",
 	"vddd",
@@ -1588,7 +1523,7 @@ static int imx290_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	imx290->dev = dev;
-	imx290->regmap = devm_regmap_init_i2c(client, &imx290_regmap_config);
+	imx290->regmap = cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(imx290->regmap)) {
 		dev_err(dev, "Unable to initialize I2C\n");
 		return -ENODEV;
-- 
2.40.1

