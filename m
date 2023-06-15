Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F396773163B
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 13:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245690AbjFOLOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 07:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241353AbjFOLOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 07:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1DD270D
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 04:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686827611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nr1Xcvmorx0q8iIABwbHApWxaiT4CdYcx0losk+CZLU=;
        b=dhgX0jCBjcevOntAe61RkmbbOZDaPG4J1k1jz5VfI0i6KEr9d39FXgk2tArhdXSG2G1UyP
        HVT/n0WYMKa0NHaeqZdXC5opdPdtdMyKzsFCY3xMDJaOaA+5ZF673p6AZdMNWkc9jaIUIm
        FVNlUBYA6d0uuYh250u+XuyOLGU/3EE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-Wuu_qOXJPGaIacdMndJGtg-1; Thu, 15 Jun 2023 07:13:27 -0400
X-MC-Unique: Wuu_qOXJPGaIacdMndJGtg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51AD6800193;
        Thu, 15 Jun 2023 11:13:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.154])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 24D8E492C38;
        Thu, 15 Jun 2023 11:13:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 2/5] media: ov5693: Convert to new CCI register access helpers
Date:   Thu, 15 Jun 2023 13:13:19 +0200
Message-Id: <20230615111322.68204-3-hdegoede@redhat.com>
In-Reply-To: <20230615111322.68204-1-hdegoede@redhat.com>
References: <20230615111322.68204-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new comon CCI register access helpers to replace the private
register access helpers in the ov5693 driver.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note for reviewers all the OV5693_REG_?BIT defines in both the register
address defines as well as in ov5693_global_regs[] were automatically
changed using search replace.
---
Changes in v3:
- Dropped no longer necesary i2c_client member from struct ov5693_device
- Drop unnecessary ret = assignment for cci_update_bits() calls using
  the err pointer argument
- Fixed a couple of lines > 80 chars

Changes in v2:
- New patch in v2 of this series
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5693.c | 585 +++++++++++++++----------------------
 2 files changed, 229 insertions(+), 357 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 11e503129085..298884a09196 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -591,6 +591,7 @@ config VIDEO_OV5693
 	tristate "OmniVision OV5693 sensor support"
 	depends on I2C && VIDEO_DEV
 	select V4L2_FWNODE
+	select V4L2_CCI
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5693 camera.
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 7f9212cce239..488ee6d9d301 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -12,7 +12,6 @@
  * Jake Day
  */
 
-#include <asm/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -23,36 +22,32 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
-#define OV5693_REG_8BIT(n)			((1 << 16) | (n))
-#define OV5693_REG_16BIT(n)			((2 << 16) | (n))
-#define OV5693_REG_24BIT(n)			((3 << 16) | (n))
-#define OV5693_REG_SIZE_SHIFT			16
-#define OV5693_REG_ADDR_MASK			0xffff
-
 /* System Control */
-#define OV5693_SW_RESET_REG			OV5693_REG_8BIT(0x0103)
-#define OV5693_SW_STREAM_REG			OV5693_REG_8BIT(0x0100)
+#define OV5693_SW_RESET_REG			CCI_REG8(0x0103)
+#define OV5693_SW_STREAM_REG			CCI_REG8(0x0100)
 #define OV5693_START_STREAMING			0x01
 #define OV5693_STOP_STREAMING			0x00
 #define OV5693_SW_RESET				0x01
 
-#define OV5693_REG_CHIP_ID			OV5693_REG_16BIT(0x300a)
+#define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
 /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
 #define OV5693_CHIP_ID				0x5690
 
 /* Exposure */
-#define OV5693_EXPOSURE_CTRL_REG		OV5693_REG_24BIT(0x3500)
+#define OV5693_EXPOSURE_CTRL_REG		CCI_REG24(0x3500)
 #define OV5693_EXPOSURE_CTRL_MASK		GENMASK(19, 4)
 #define OV5693_INTEGRATION_TIME_MARGIN		8
 #define OV5693_EXPOSURE_MIN			1
 #define OV5693_EXPOSURE_STEP			1
 
 /* Analogue Gain */
-#define OV5693_GAIN_CTRL_REG			OV5693_REG_16BIT(0x350a)
+#define OV5693_GAIN_CTRL_REG			CCI_REG16(0x350a)
 #define OV5693_GAIN_CTRL_MASK			GENMASK(10, 4)
 #define OV5693_GAIN_MIN				1
 #define OV5693_GAIN_MAX				127
@@ -60,9 +55,9 @@
 #define OV5693_GAIN_STEP			1
 
 /* Digital Gain */
-#define OV5693_MWB_RED_GAIN_REG			OV5693_REG_16BIT(0x3400)
-#define OV5693_MWB_GREEN_GAIN_REG		OV5693_REG_16BIT(0x3402)
-#define OV5693_MWB_BLUE_GAIN_REG		OV5693_REG_16BIT(0x3404)
+#define OV5693_MWB_RED_GAIN_REG			CCI_REG16(0x3400)
+#define OV5693_MWB_GREEN_GAIN_REG		CCI_REG16(0x3402)
+#define OV5693_MWB_BLUE_GAIN_REG		CCI_REG16(0x3404)
 #define OV5693_MWB_GAIN_MASK			GENMASK(11, 0)
 #define OV5693_MWB_GAIN_MAX			0x0fff
 #define OV5693_DIGITAL_GAIN_MIN			1
@@ -71,36 +66,36 @@
 #define OV5693_DIGITAL_GAIN_STEP		1
 
 /* Timing and Format */
-#define OV5693_CROP_START_X_REG			OV5693_REG_16BIT(0x3800)
-#define OV5693_CROP_START_Y_REG			OV5693_REG_16BIT(0x3802)
-#define OV5693_CROP_END_X_REG			OV5693_REG_16BIT(0x3804)
-#define OV5693_CROP_END_Y_REG			OV5693_REG_16BIT(0x3806)
-#define OV5693_OUTPUT_SIZE_X_REG		OV5693_REG_16BIT(0x3808)
-#define OV5693_OUTPUT_SIZE_Y_REG		OV5693_REG_16BIT(0x380a)
+#define OV5693_CROP_START_X_REG			CCI_REG16(0x3800)
+#define OV5693_CROP_START_Y_REG			CCI_REG16(0x3802)
+#define OV5693_CROP_END_X_REG			CCI_REG16(0x3804)
+#define OV5693_CROP_END_Y_REG			CCI_REG16(0x3806)
+#define OV5693_OUTPUT_SIZE_X_REG		CCI_REG16(0x3808)
+#define OV5693_OUTPUT_SIZE_Y_REG		CCI_REG16(0x380a)
 
-#define OV5693_TIMING_HTS_REG			OV5693_REG_16BIT(0x380c)
+#define OV5693_TIMING_HTS_REG			CCI_REG16(0x380c)
 #define OV5693_FIXED_PPL			2688U
-#define OV5693_TIMING_VTS_REG			OV5693_REG_16BIT(0x380e)
+#define OV5693_TIMING_VTS_REG			CCI_REG16(0x380e)
 #define OV5693_TIMING_MAX_VTS			0xffff
 #define OV5693_TIMING_MIN_VTS			0x04
 
-#define OV5693_OFFSET_START_X_REG		OV5693_REG_16BIT(0x3810)
-#define OV5693_OFFSET_START_Y_REG		OV5693_REG_16BIT(0x3812)
+#define OV5693_OFFSET_START_X_REG		CCI_REG16(0x3810)
+#define OV5693_OFFSET_START_Y_REG		CCI_REG16(0x3812)
 
-#define OV5693_SUB_INC_X_REG			OV5693_REG_8BIT(0x3814)
-#define OV5693_SUB_INC_Y_REG			OV5693_REG_8BIT(0x3815)
+#define OV5693_SUB_INC_X_REG			CCI_REG8(0x3814)
+#define OV5693_SUB_INC_Y_REG			CCI_REG8(0x3815)
 
-#define OV5693_FORMAT1_REG			OV5693_REG_8BIT(0x3820)
+#define OV5693_FORMAT1_REG			CCI_REG8(0x3820)
 #define OV5693_FORMAT1_FLIP_VERT_ISP_EN		BIT(6)
 #define OV5693_FORMAT1_FLIP_VERT_SENSOR_EN	BIT(1)
 #define OV5693_FORMAT1_VBIN_EN			BIT(0)
-#define OV5693_FORMAT2_REG			OV5693_REG_8BIT(0x3821)
+#define OV5693_FORMAT2_REG			CCI_REG8(0x3821)
 #define OV5693_FORMAT2_HDR_EN			BIT(7)
 #define OV5693_FORMAT2_FLIP_HORZ_ISP_EN		BIT(2)
 #define OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN	BIT(1)
 #define OV5693_FORMAT2_HBIN_EN			BIT(0)
 
-#define OV5693_ISP_CTRL2_REG			OV5693_REG_8BIT(0x5002)
+#define OV5693_ISP_CTRL2_REG			CCI_REG8(0x5002)
 #define OV5693_ISP_SCALE_ENABLE			BIT(7)
 
 /* Pixel Array */
@@ -116,7 +111,7 @@
 #define OV5693_MIN_CROP_HEIGHT			2
 
 /* Test Pattern */
-#define OV5693_TEST_PATTERN_REG			OV5693_REG_8BIT(0x5e00)
+#define OV5693_TEST_PATTERN_REG			CCI_REG8(0x5e00)
 #define OV5693_TEST_PATTERN_ENABLE		BIT(7)
 #define OV5693_TEST_PATTERN_ROLLING		BIT(6)
 #define OV5693_TEST_PATTERN_RANDOM		0x01
@@ -137,19 +132,9 @@ static const char * const ov5693_supply_names[] = {
 
 #define OV5693_NUM_SUPPLIES	ARRAY_SIZE(ov5693_supply_names)
 
-struct ov5693_reg {
-	u32 reg;
-	u8 val;
-};
-
-struct ov5693_reg_list {
-	u32 num_regs;
-	const struct ov5693_reg *regs;
-};
-
 struct ov5693_device {
-	struct i2c_client *client;
 	struct device *dev;
+	struct regmap *regmap;
 
 	/* Protect against concurrent changes to controls */
 	struct mutex lock;
@@ -189,156 +174,151 @@ struct ov5693_device {
 	} ctrls;
 };
 
-static const struct ov5693_reg ov5693_global_regs[] = {
-	{OV5693_REG_8BIT(0x3016), 0xf0},
-	{OV5693_REG_8BIT(0x3017), 0xf0},
-	{OV5693_REG_8BIT(0x3018), 0xf0},
-	{OV5693_REG_8BIT(0x3022), 0x01},
-	{OV5693_REG_8BIT(0x3028), 0x44},
-	{OV5693_REG_8BIT(0x3098), 0x02},
-	{OV5693_REG_8BIT(0x3099), 0x19},
-	{OV5693_REG_8BIT(0x309a), 0x02},
-	{OV5693_REG_8BIT(0x309b), 0x01},
-	{OV5693_REG_8BIT(0x309c), 0x00},
-	{OV5693_REG_8BIT(0x30a0), 0xd2},
-	{OV5693_REG_8BIT(0x30a2), 0x01},
-	{OV5693_REG_8BIT(0x30b2), 0x00},
-	{OV5693_REG_8BIT(0x30b3), 0x83},
-	{OV5693_REG_8BIT(0x30b4), 0x03},
-	{OV5693_REG_8BIT(0x30b5), 0x04},
-	{OV5693_REG_8BIT(0x30b6), 0x01},
-	{OV5693_REG_8BIT(0x3080), 0x01},
-	{OV5693_REG_8BIT(0x3104), 0x21},
-	{OV5693_REG_8BIT(0x3106), 0x00},
-	{OV5693_REG_8BIT(0x3406), 0x01},
-	{OV5693_REG_8BIT(0x3503), 0x07},
-	{OV5693_REG_8BIT(0x350b), 0x40},
-	{OV5693_REG_8BIT(0x3601), 0x0a},
-	{OV5693_REG_8BIT(0x3602), 0x38},
-	{OV5693_REG_8BIT(0x3612), 0x80},
-	{OV5693_REG_8BIT(0x3620), 0x54},
-	{OV5693_REG_8BIT(0x3621), 0xc7},
-	{OV5693_REG_8BIT(0x3622), 0x0f},
-	{OV5693_REG_8BIT(0x3625), 0x10},
-	{OV5693_REG_8BIT(0x3630), 0x55},
-	{OV5693_REG_8BIT(0x3631), 0xf4},
-	{OV5693_REG_8BIT(0x3632), 0x00},
-	{OV5693_REG_8BIT(0x3633), 0x34},
-	{OV5693_REG_8BIT(0x3634), 0x02},
-	{OV5693_REG_8BIT(0x364d), 0x0d},
-	{OV5693_REG_8BIT(0x364f), 0xdd},
-	{OV5693_REG_8BIT(0x3660), 0x04},
-	{OV5693_REG_8BIT(0x3662), 0x10},
-	{OV5693_REG_8BIT(0x3663), 0xf1},
-	{OV5693_REG_8BIT(0x3665), 0x00},
-	{OV5693_REG_8BIT(0x3666), 0x20},
-	{OV5693_REG_8BIT(0x3667), 0x00},
-	{OV5693_REG_8BIT(0x366a), 0x80},
-	{OV5693_REG_8BIT(0x3680), 0xe0},
-	{OV5693_REG_8BIT(0x3681), 0x00},
-	{OV5693_REG_8BIT(0x3700), 0x42},
-	{OV5693_REG_8BIT(0x3701), 0x14},
-	{OV5693_REG_8BIT(0x3702), 0xa0},
-	{OV5693_REG_8BIT(0x3703), 0xd8},
-	{OV5693_REG_8BIT(0x3704), 0x78},
-	{OV5693_REG_8BIT(0x3705), 0x02},
-	{OV5693_REG_8BIT(0x370a), 0x00},
-	{OV5693_REG_8BIT(0x370b), 0x20},
-	{OV5693_REG_8BIT(0x370c), 0x0c},
-	{OV5693_REG_8BIT(0x370d), 0x11},
-	{OV5693_REG_8BIT(0x370e), 0x00},
-	{OV5693_REG_8BIT(0x370f), 0x40},
-	{OV5693_REG_8BIT(0x3710), 0x00},
-	{OV5693_REG_8BIT(0x371a), 0x1c},
-	{OV5693_REG_8BIT(0x371b), 0x05},
-	{OV5693_REG_8BIT(0x371c), 0x01},
-	{OV5693_REG_8BIT(0x371e), 0xa1},
-	{OV5693_REG_8BIT(0x371f), 0x0c},
-	{OV5693_REG_8BIT(0x3721), 0x00},
-	{OV5693_REG_8BIT(0x3724), 0x10},
-	{OV5693_REG_8BIT(0x3726), 0x00},
-	{OV5693_REG_8BIT(0x372a), 0x01},
-	{OV5693_REG_8BIT(0x3730), 0x10},
-	{OV5693_REG_8BIT(0x3738), 0x22},
-	{OV5693_REG_8BIT(0x3739), 0xe5},
-	{OV5693_REG_8BIT(0x373a), 0x50},
-	{OV5693_REG_8BIT(0x373b), 0x02},
-	{OV5693_REG_8BIT(0x373c), 0x41},
-	{OV5693_REG_8BIT(0x373f), 0x02},
-	{OV5693_REG_8BIT(0x3740), 0x42},
-	{OV5693_REG_8BIT(0x3741), 0x02},
-	{OV5693_REG_8BIT(0x3742), 0x18},
-	{OV5693_REG_8BIT(0x3743), 0x01},
-	{OV5693_REG_8BIT(0x3744), 0x02},
-	{OV5693_REG_8BIT(0x3747), 0x10},
-	{OV5693_REG_8BIT(0x374c), 0x04},
-	{OV5693_REG_8BIT(0x3751), 0xf0},
-	{OV5693_REG_8BIT(0x3752), 0x00},
-	{OV5693_REG_8BIT(0x3753), 0x00},
-	{OV5693_REG_8BIT(0x3754), 0xc0},
-	{OV5693_REG_8BIT(0x3755), 0x00},
-	{OV5693_REG_8BIT(0x3756), 0x1a},
-	{OV5693_REG_8BIT(0x3758), 0x00},
-	{OV5693_REG_8BIT(0x3759), 0x0f},
-	{OV5693_REG_8BIT(0x376b), 0x44},
-	{OV5693_REG_8BIT(0x375c), 0x04},
-	{OV5693_REG_8BIT(0x3774), 0x10},
-	{OV5693_REG_8BIT(0x3776), 0x00},
-	{OV5693_REG_8BIT(0x377f), 0x08},
-	{OV5693_REG_8BIT(0x3780), 0x22},
-	{OV5693_REG_8BIT(0x3781), 0x0c},
-	{OV5693_REG_8BIT(0x3784), 0x2c},
-	{OV5693_REG_8BIT(0x3785), 0x1e},
-	{OV5693_REG_8BIT(0x378f), 0xf5},
-	{OV5693_REG_8BIT(0x3791), 0xb0},
-	{OV5693_REG_8BIT(0x3795), 0x00},
-	{OV5693_REG_8BIT(0x3796), 0x64},
-	{OV5693_REG_8BIT(0x3797), 0x11},
-	{OV5693_REG_8BIT(0x3798), 0x30},
-	{OV5693_REG_8BIT(0x3799), 0x41},
-	{OV5693_REG_8BIT(0x379a), 0x07},
-	{OV5693_REG_8BIT(0x379b), 0xb0},
-	{OV5693_REG_8BIT(0x379c), 0x0c},
-	{OV5693_REG_8BIT(0x3a04), 0x06},
-	{OV5693_REG_8BIT(0x3a05), 0x14},
-	{OV5693_REG_8BIT(0x3e07), 0x20},
-	{OV5693_REG_8BIT(0x4000), 0x08},
-	{OV5693_REG_8BIT(0x4001), 0x04},
-	{OV5693_REG_8BIT(0x4004), 0x08},
-	{OV5693_REG_8BIT(0x4006), 0x20},
-	{OV5693_REG_8BIT(0x4008), 0x24},
-	{OV5693_REG_8BIT(0x4009), 0x10},
-	{OV5693_REG_8BIT(0x4058), 0x00},
-	{OV5693_REG_8BIT(0x4101), 0xb2},
-	{OV5693_REG_8BIT(0x4307), 0x31},
-	{OV5693_REG_8BIT(0x4511), 0x05},
-	{OV5693_REG_8BIT(0x4512), 0x01},
-	{OV5693_REG_8BIT(0x481f), 0x30},
-	{OV5693_REG_8BIT(0x4826), 0x2c},
-	{OV5693_REG_8BIT(0x4d02), 0xfd},
-	{OV5693_REG_8BIT(0x4d03), 0xf5},
-	{OV5693_REG_8BIT(0x4d04), 0x0c},
-	{OV5693_REG_8BIT(0x4d05), 0xcc},
-	{OV5693_REG_8BIT(0x4837), 0x0a},
-	{OV5693_REG_8BIT(0x5003), 0x20},
-	{OV5693_REG_8BIT(0x5013), 0x00},
-	{OV5693_REG_8BIT(0x5842), 0x01},
-	{OV5693_REG_8BIT(0x5843), 0x2b},
-	{OV5693_REG_8BIT(0x5844), 0x01},
-	{OV5693_REG_8BIT(0x5845), 0x92},
-	{OV5693_REG_8BIT(0x5846), 0x01},
-	{OV5693_REG_8BIT(0x5847), 0x8f},
-	{OV5693_REG_8BIT(0x5848), 0x01},
-	{OV5693_REG_8BIT(0x5849), 0x0c},
-	{OV5693_REG_8BIT(0x5e10), 0x0c},
-	{OV5693_REG_8BIT(0x3820), 0x00},
-	{OV5693_REG_8BIT(0x3821), 0x1e},
-	{OV5693_REG_8BIT(0x5041), 0x14}
-};
-
-static const struct ov5693_reg_list ov5693_global_setting = {
-	.num_regs = ARRAY_SIZE(ov5693_global_regs),
-	.regs = ov5693_global_regs,
+static const struct cci_reg_sequence ov5693_global_regs[] = {
+	{CCI_REG8(0x3016), 0xf0},
+	{CCI_REG8(0x3017), 0xf0},
+	{CCI_REG8(0x3018), 0xf0},
+	{CCI_REG8(0x3022), 0x01},
+	{CCI_REG8(0x3028), 0x44},
+	{CCI_REG8(0x3098), 0x02},
+	{CCI_REG8(0x3099), 0x19},
+	{CCI_REG8(0x309a), 0x02},
+	{CCI_REG8(0x309b), 0x01},
+	{CCI_REG8(0x309c), 0x00},
+	{CCI_REG8(0x30a0), 0xd2},
+	{CCI_REG8(0x30a2), 0x01},
+	{CCI_REG8(0x30b2), 0x00},
+	{CCI_REG8(0x30b3), 0x83},
+	{CCI_REG8(0x30b4), 0x03},
+	{CCI_REG8(0x30b5), 0x04},
+	{CCI_REG8(0x30b6), 0x01},
+	{CCI_REG8(0x3080), 0x01},
+	{CCI_REG8(0x3104), 0x21},
+	{CCI_REG8(0x3106), 0x00},
+	{CCI_REG8(0x3406), 0x01},
+	{CCI_REG8(0x3503), 0x07},
+	{CCI_REG8(0x350b), 0x40},
+	{CCI_REG8(0x3601), 0x0a},
+	{CCI_REG8(0x3602), 0x38},
+	{CCI_REG8(0x3612), 0x80},
+	{CCI_REG8(0x3620), 0x54},
+	{CCI_REG8(0x3621), 0xc7},
+	{CCI_REG8(0x3622), 0x0f},
+	{CCI_REG8(0x3625), 0x10},
+	{CCI_REG8(0x3630), 0x55},
+	{CCI_REG8(0x3631), 0xf4},
+	{CCI_REG8(0x3632), 0x00},
+	{CCI_REG8(0x3633), 0x34},
+	{CCI_REG8(0x3634), 0x02},
+	{CCI_REG8(0x364d), 0x0d},
+	{CCI_REG8(0x364f), 0xdd},
+	{CCI_REG8(0x3660), 0x04},
+	{CCI_REG8(0x3662), 0x10},
+	{CCI_REG8(0x3663), 0xf1},
+	{CCI_REG8(0x3665), 0x00},
+	{CCI_REG8(0x3666), 0x20},
+	{CCI_REG8(0x3667), 0x00},
+	{CCI_REG8(0x366a), 0x80},
+	{CCI_REG8(0x3680), 0xe0},
+	{CCI_REG8(0x3681), 0x00},
+	{CCI_REG8(0x3700), 0x42},
+	{CCI_REG8(0x3701), 0x14},
+	{CCI_REG8(0x3702), 0xa0},
+	{CCI_REG8(0x3703), 0xd8},
+	{CCI_REG8(0x3704), 0x78},
+	{CCI_REG8(0x3705), 0x02},
+	{CCI_REG8(0x370a), 0x00},
+	{CCI_REG8(0x370b), 0x20},
+	{CCI_REG8(0x370c), 0x0c},
+	{CCI_REG8(0x370d), 0x11},
+	{CCI_REG8(0x370e), 0x00},
+	{CCI_REG8(0x370f), 0x40},
+	{CCI_REG8(0x3710), 0x00},
+	{CCI_REG8(0x371a), 0x1c},
+	{CCI_REG8(0x371b), 0x05},
+	{CCI_REG8(0x371c), 0x01},
+	{CCI_REG8(0x371e), 0xa1},
+	{CCI_REG8(0x371f), 0x0c},
+	{CCI_REG8(0x3721), 0x00},
+	{CCI_REG8(0x3724), 0x10},
+	{CCI_REG8(0x3726), 0x00},
+	{CCI_REG8(0x372a), 0x01},
+	{CCI_REG8(0x3730), 0x10},
+	{CCI_REG8(0x3738), 0x22},
+	{CCI_REG8(0x3739), 0xe5},
+	{CCI_REG8(0x373a), 0x50},
+	{CCI_REG8(0x373b), 0x02},
+	{CCI_REG8(0x373c), 0x41},
+	{CCI_REG8(0x373f), 0x02},
+	{CCI_REG8(0x3740), 0x42},
+	{CCI_REG8(0x3741), 0x02},
+	{CCI_REG8(0x3742), 0x18},
+	{CCI_REG8(0x3743), 0x01},
+	{CCI_REG8(0x3744), 0x02},
+	{CCI_REG8(0x3747), 0x10},
+	{CCI_REG8(0x374c), 0x04},
+	{CCI_REG8(0x3751), 0xf0},
+	{CCI_REG8(0x3752), 0x00},
+	{CCI_REG8(0x3753), 0x00},
+	{CCI_REG8(0x3754), 0xc0},
+	{CCI_REG8(0x3755), 0x00},
+	{CCI_REG8(0x3756), 0x1a},
+	{CCI_REG8(0x3758), 0x00},
+	{CCI_REG8(0x3759), 0x0f},
+	{CCI_REG8(0x376b), 0x44},
+	{CCI_REG8(0x375c), 0x04},
+	{CCI_REG8(0x3774), 0x10},
+	{CCI_REG8(0x3776), 0x00},
+	{CCI_REG8(0x377f), 0x08},
+	{CCI_REG8(0x3780), 0x22},
+	{CCI_REG8(0x3781), 0x0c},
+	{CCI_REG8(0x3784), 0x2c},
+	{CCI_REG8(0x3785), 0x1e},
+	{CCI_REG8(0x378f), 0xf5},
+	{CCI_REG8(0x3791), 0xb0},
+	{CCI_REG8(0x3795), 0x00},
+	{CCI_REG8(0x3796), 0x64},
+	{CCI_REG8(0x3797), 0x11},
+	{CCI_REG8(0x3798), 0x30},
+	{CCI_REG8(0x3799), 0x41},
+	{CCI_REG8(0x379a), 0x07},
+	{CCI_REG8(0x379b), 0xb0},
+	{CCI_REG8(0x379c), 0x0c},
+	{CCI_REG8(0x3a04), 0x06},
+	{CCI_REG8(0x3a05), 0x14},
+	{CCI_REG8(0x3e07), 0x20},
+	{CCI_REG8(0x4000), 0x08},
+	{CCI_REG8(0x4001), 0x04},
+	{CCI_REG8(0x4004), 0x08},
+	{CCI_REG8(0x4006), 0x20},
+	{CCI_REG8(0x4008), 0x24},
+	{CCI_REG8(0x4009), 0x10},
+	{CCI_REG8(0x4058), 0x00},
+	{CCI_REG8(0x4101), 0xb2},
+	{CCI_REG8(0x4307), 0x31},
+	{CCI_REG8(0x4511), 0x05},
+	{CCI_REG8(0x4512), 0x01},
+	{CCI_REG8(0x481f), 0x30},
+	{CCI_REG8(0x4826), 0x2c},
+	{CCI_REG8(0x4d02), 0xfd},
+	{CCI_REG8(0x4d03), 0xf5},
+	{CCI_REG8(0x4d04), 0x0c},
+	{CCI_REG8(0x4d05), 0xcc},
+	{CCI_REG8(0x4837), 0x0a},
+	{CCI_REG8(0x5003), 0x20},
+	{CCI_REG8(0x5013), 0x00},
+	{CCI_REG8(0x5842), 0x01},
+	{CCI_REG8(0x5843), 0x2b},
+	{CCI_REG8(0x5844), 0x01},
+	{CCI_REG8(0x5845), 0x92},
+	{CCI_REG8(0x5846), 0x01},
+	{CCI_REG8(0x5847), 0x8f},
+	{CCI_REG8(0x5848), 0x01},
+	{CCI_REG8(0x5849), 0x0c},
+	{CCI_REG8(0x5e10), 0x0c},
+	{CCI_REG8(0x3820), 0x00},
+	{CCI_REG8(0x3821), 0x1e},
+	{CCI_REG8(0x5041), 0x14}
 };
 
 static const struct v4l2_rect ov5693_default_crop = {
@@ -373,115 +353,6 @@ static const u8 ov5693_test_pattern_bits[] = {
 	OV5693_TEST_PATTERN_ROLLING,
 };
 
-/* I2C I/O Operations */
-
-static int ov5693_read_reg(struct ov5693_device *ov5693, u32 addr, u32 *value)
-{
-	struct i2c_client *client = ov5693->client;
-	__be16 reg;
-	u8 val[4];
-	struct i2c_msg msg[] = {
-		{
-			.addr	= client->addr,
-			.flags	= 0,
-			.len	= 2,
-			.buf	= (u8 *)&reg,
-		},
-		{
-			.addr	= client->addr,
-			.flags	= I2C_M_RD,
-			.buf	= (u8 *)&val,
-		},
-	};
-	unsigned int len = ((addr >> OV5693_REG_SIZE_SHIFT) & 3);
-	unsigned int i;
-	int ret;
-
-	reg = cpu_to_be16(addr & OV5693_REG_ADDR_MASK);
-
-	msg[1].len = len;
-
-	ret = i2c_transfer(client->adapter, msg, 2);
-	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
-				     "Failed to read register 0x%04x\n",
-				     addr & OV5693_REG_ADDR_MASK);
-
-	*value = 0;
-	for (i = 0; i < len; ++i) {
-		*value <<= 8;
-		*value |= val[i];
-	}
-
-	return 0;
-}
-
-static void ov5693_write_reg(struct ov5693_device *ov5693, u32 addr, u32 value,
-			     int *error)
-{
-	struct i2c_client *client = ov5693->client;
-	struct {
-		__be16 reg;
-		u8 val[4];
-	} __packed buf;
-	struct i2c_msg msg = {
-		.addr	= client->addr,
-		.buf	= (u8 *)&buf,
-	};
-	unsigned int len = ((addr >> OV5693_REG_SIZE_SHIFT) & 3);
-	unsigned int i;
-	int ret;
-
-	if (*error < 0)
-		return;
-
-	buf.reg = cpu_to_be16(addr & OV5693_REG_ADDR_MASK);
-	for (i = 0; i < len; ++i) {
-		buf.val[len - i - 1] = value & 0xff;
-		value >>= 8;
-	}
-
-	msg.len	= len + 2;
-
-	ret = i2c_transfer(client->adapter, &msg, 1);
-	if (ret < 0) {
-		dev_err(&client->dev, "Failed to write register 0x%04x: %d\n",
-			addr & OV5693_REG_ADDR_MASK, ret);
-		*error = ret;
-	}
-}
-
-static int ov5693_write_reg_array(struct ov5693_device *ov5693,
-				  const struct ov5693_reg_list *reglist)
-{
-	unsigned int i;
-	int ret = 0;
-
-	for (i = 0; i < reglist->num_regs; i++)
-		ov5693_write_reg(ov5693, reglist->regs[i].reg,
-				 reglist->regs[i].val, &ret);
-
-	return ret;
-}
-
-static int ov5693_update_bits(struct ov5693_device *ov5693, u32 address,
-			      u32 mask, u32 bits)
-{
-	u32 value = 0;
-	int ret;
-
-	ret = ov5693_read_reg(ov5693, address, &value);
-	if (ret)
-		return ret;
-
-	value &= ~mask;
-	value |= bits;
-
-	ov5693_write_reg(ov5693, address, value, &ret);
-
-	return ret;
-}
-
 /* V4L2 Controls Functions */
 
 static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
@@ -491,8 +362,8 @@ static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 		  OV5693_FORMAT1_FLIP_VERT_SENSOR_EN;
 	int ret;
 
-	ret = ov5693_update_bits(ov5693, OV5693_FORMAT1_REG, bits,
-				 enable ? bits : 0);
+	ret = cci_update_bits(ov5693->regmap, OV5693_FORMAT1_REG, bits,
+			      enable ? bits : 0, NULL);
 	if (ret)
 		return ret;
 
@@ -506,8 +377,8 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
 		  OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN;
 	int ret;
 
-	ret = ov5693_update_bits(ov5693, OV5693_FORMAT2_REG, bits,
-				 enable ? bits : 0);
+	ret = cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG, bits,
+			      enable ? bits : 0, NULL);
 	if (ret)
 		return ret;
 
@@ -516,10 +387,11 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
 
 static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
 {
-	u32 exposure;
+	u64 exposure;
 	int ret;
 
-	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_CTRL_REG, &exposure);
+	ret = cci_read(ov5693->regmap, OV5693_EXPOSURE_CTRL_REG, &exposure,
+		       NULL);
 	if (ret)
 		return ret;
 
@@ -536,17 +408,17 @@ static int ov5693_exposure_configure(struct ov5693_device *ov5693,
 
 	exposure = (exposure << 4) & OV5693_EXPOSURE_CTRL_MASK;
 
-	ov5693_write_reg(ov5693, OV5693_EXPOSURE_CTRL_REG, exposure, &ret);
+	cci_write(ov5693->regmap, OV5693_EXPOSURE_CTRL_REG, exposure, &ret);
 
 	return ret;
 }
 
 static int ov5693_get_gain(struct ov5693_device *ov5693, u32 *gain)
 {
-	u32 value;
+	u64 value;
 	int ret;
 
-	ret = ov5693_read_reg(ov5693, OV5693_GAIN_CTRL_REG, &value);
+	ret = cci_read(ov5693->regmap, OV5693_GAIN_CTRL_REG, &value, NULL);
 	if (ret)
 		return ret;
 
@@ -563,9 +435,9 @@ static int ov5693_digital_gain_configure(struct ov5693_device *ov5693,
 
 	gain &= OV5693_MWB_GAIN_MASK;
 
-	ov5693_write_reg(ov5693, OV5693_MWB_RED_GAIN_REG, gain, &ret);
-	ov5693_write_reg(ov5693, OV5693_MWB_GREEN_GAIN_REG, gain, &ret);
-	ov5693_write_reg(ov5693, OV5693_MWB_BLUE_GAIN_REG, gain, &ret);
+	cci_write(ov5693->regmap, OV5693_MWB_RED_GAIN_REG, gain, &ret);
+	cci_write(ov5693->regmap, OV5693_MWB_GREEN_GAIN_REG, gain, &ret);
+	cci_write(ov5693->regmap, OV5693_MWB_BLUE_GAIN_REG, gain, &ret);
 
 	return ret;
 }
@@ -576,7 +448,7 @@ static int ov5693_analog_gain_configure(struct ov5693_device *ov5693, u32 gain)
 
 	gain = (gain << 4) & OV5693_GAIN_CTRL_MASK;
 
-	ov5693_write_reg(ov5693, OV5693_GAIN_CTRL_REG, gain, &ret);
+	cci_write(ov5693->regmap, OV5693_GAIN_CTRL_REG, gain, &ret);
 
 	return ret;
 }
@@ -586,7 +458,7 @@ static int ov5693_vts_configure(struct ov5693_device *ov5693, u32 vblank)
 	u16 vts = ov5693->mode.format.height + vblank;
 	int ret = 0;
 
-	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_REG, vts, &ret);
+	cci_write(ov5693->regmap, OV5693_TIMING_VTS_REG, vts, &ret);
 
 	return ret;
 }
@@ -595,8 +467,8 @@ static int ov5693_test_pattern_configure(struct ov5693_device *ov5693, u32 idx)
 {
 	int ret = 0;
 
-	ov5693_write_reg(ov5693, OV5693_TEST_PATTERN_REG,
-			 ov5693_test_pattern_bits[idx], &ret);
+	cci_write(ov5693->regmap, OV5693_TEST_PATTERN_REG,
+		  ov5693_test_pattern_bits[idx], &ret);
 
 	return ret;
 }
@@ -685,59 +557,54 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
 	int ret = 0;
 
 	/* Crop Start X */
-	ov5693_write_reg(ov5693, OV5693_CROP_START_X_REG, mode->crop.left,
-			 &ret);
+	cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, mode->crop.left,
+		  &ret);
 
 	/* Offset X */
-	ov5693_write_reg(ov5693, OV5693_OFFSET_START_X_REG, 0, &ret);
+	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, 0, &ret);
 
 	/* Output Size X */
-	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
-			 &ret);
+	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
+		  &ret);
 
 	/* Crop End X */
-	ov5693_write_reg(ov5693, OV5693_CROP_END_X_REG,
-			 mode->crop.left + mode->crop.width, &ret);
+	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG,
+		  mode->crop.left + mode->crop.width, &ret);
 
 	/* Horizontal Total Size */
-	ov5693_write_reg(ov5693, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,
-			 &ret);
+	cci_write(ov5693->regmap, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,
+		  &ret);
 
 	/* Crop Start Y */
-	ov5693_write_reg(ov5693, OV5693_CROP_START_Y_REG, mode->crop.top,
-			 &ret);
+	cci_write(ov5693->regmap, OV5693_CROP_START_Y_REG, mode->crop.top,
+		  &ret);
 
 	/* Offset Y */
-	ov5693_write_reg(ov5693, OV5693_OFFSET_START_Y_REG, 0, &ret);
+	cci_write(ov5693->regmap, OV5693_OFFSET_START_Y_REG, 0, &ret);
 
 	/* Output Size Y */
-	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_Y_REG, mode->format.height,
-			 &ret);
+	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_Y_REG, mode->format.height,
+		  &ret);
 
 	/* Crop End Y */
-	ov5693_write_reg(ov5693, OV5693_CROP_END_Y_REG,
-			 mode->crop.top + mode->crop.height, &ret);
+	cci_write(ov5693->regmap, OV5693_CROP_END_Y_REG,
+		  mode->crop.top + mode->crop.height, &ret);
 
 	/* Subsample X increase */
-	ov5693_write_reg(ov5693, OV5693_SUB_INC_X_REG,
-			 ((mode->inc_x_odd << 4) & 0xf0) | 0x01, &ret);
+	cci_write(ov5693->regmap, OV5693_SUB_INC_X_REG,
+		  ((mode->inc_x_odd << 4) & 0xf0) | 0x01, &ret);
 	/* Subsample Y increase */
-	ov5693_write_reg(ov5693, OV5693_SUB_INC_Y_REG,
-			 ((mode->inc_y_odd << 4) & 0xf0) | 0x01, &ret);
-
-	if (ret)
-		return ret;
+	cci_write(ov5693->regmap, OV5693_SUB_INC_Y_REG,
+		  ((mode->inc_y_odd << 4) & 0xf0) | 0x01, &ret);
 
 	/* Binning */
-	ret = ov5693_update_bits(ov5693, OV5693_FORMAT1_REG,
-				 OV5693_FORMAT1_VBIN_EN,
-				 mode->binning_y ? OV5693_FORMAT1_VBIN_EN : 0);
-	if (ret)
-		return ret;
+	cci_update_bits(ov5693->regmap, OV5693_FORMAT1_REG,
+			OV5693_FORMAT1_VBIN_EN,
+			mode->binning_y ? OV5693_FORMAT1_VBIN_EN : 0, &ret);
 
-	ret = ov5693_update_bits(ov5693, OV5693_FORMAT2_REG,
-				 OV5693_FORMAT2_HBIN_EN,
-				 mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0);
+	cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG,
+			OV5693_FORMAT2_HBIN_EN,
+			mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0, &ret);
 
 	return ret;
 }
@@ -746,9 +613,9 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
 {
 	int ret = 0;
 
-	ov5693_write_reg(ov5693, OV5693_SW_STREAM_REG,
-			 enable ? OV5693_START_STREAMING :
-				  OV5693_STOP_STREAMING, &ret);
+	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
+		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
+		  &ret);
 
 	return ret;
 }
@@ -757,7 +624,7 @@ static int ov5693_sw_reset(struct ov5693_device *ov5693)
 {
 	int ret = 0;
 
-	ov5693_write_reg(ov5693, OV5693_SW_RESET_REG, OV5693_SW_RESET, &ret);
+	cci_write(ov5693->regmap, OV5693_SW_RESET_REG, OV5693_SW_RESET, &ret);
 
 	return ret;
 }
@@ -771,7 +638,8 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
 		return dev_err_probe(ov5693->dev, ret,
 				     "software reset error\n");
 
-	ret = ov5693_write_reg_array(ov5693, &ov5693_global_setting);
+	ret = cci_multi_reg_write(ov5693->regmap, ov5693_global_regs,
+				  ARRAY_SIZE(ov5693_global_regs), NULL);
 	if (ret)
 		return dev_err_probe(ov5693->dev, ret,
 				     "global settings error\n");
@@ -871,15 +739,15 @@ static int __maybe_unused ov5693_sensor_resume(struct device *dev)
 static int ov5693_detect(struct ov5693_device *ov5693)
 {
 	int ret;
-	u32 id;
+	u64 id;
 
-	ret = ov5693_read_reg(ov5693, OV5693_REG_CHIP_ID, &id);
+	ret = cci_read(ov5693->regmap, OV5693_REG_CHIP_ID, &id, NULL);
 	if (ret)
 		return ret;
 
 	if (id != OV5693_CHIP_ID)
 		return dev_err_probe(ov5693->dev, -ENODEV,
-				     "sensor ID mismatch. Found 0x%04x\n", id);
+				     "sensor ID mismatch. Got 0x%04llx\n", id);
 
 	return 0;
 }
@@ -1407,9 +1275,12 @@ static int ov5693_probe(struct i2c_client *client)
 	if (!ov5693)
 		return -ENOMEM;
 
-	ov5693->client = client;
 	ov5693->dev = &client->dev;
 
+	ov5693->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov5693->regmap))
+		return PTR_ERR(ov5693->regmap);
+
 	ret = ov5693_check_hwcfg(ov5693);
 	if (ret)
 		return ret;
-- 
2.40.1

