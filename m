Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7353519FF
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbhDAR5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:57:34 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:1272 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236272AbhDARyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299646; x=1648835646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZtAKjGZKkNqMDffH/+/8loWem8Yys+5ZHDx/DISyOxs=;
  b=YlXKhGJneKAxXErQJ3D93CwwhC15rvf27OS+X//rWb3zLa5usIh7Ml3s
   AEDyw/vEv3KYzCxZZ5iKn2J5W1cFSUuTxrI6UU4oZqozEt5RNuQtgsYqz
   VOq+zbelfEAaZfKf3zS80oNQcGmNkUoO01DywCuhamDd0vGi0MNg2KcCT
   +grKNllSmvAVB5jeUUa+DyIddUNPiGlr/T7VcmKK+SCCn6nuODHkLclbe
   BXcZZwJ48ydzDrkFSYowdsh6deaSdperwbNqNTu1nItbvh8V9DBJ3E29w
   hHY5+2kbuBDNs0V401wPFsntjbXkax/aWzUXrB7Qpr72yZbe7Rojw8+eA
   Q==;
IronPort-SDR: 8XKNofAwtQ4IrlouWTtlbY6QhC9ZScEu636EoitqI87wsp9Zcfe+X5fyt5zpOlMU/fVk1Hto51
 /YUV1ptOlX1YPmUt7ewz8/kzU+Iy+E/kzqHgpxvbo4mpXD2ZZzFHL5fT1Xg1RB3upmHSTdS4Ps
 GwkZwFmpkVefU4H/GW1Py/MP3bs+wEpLMZ+7MQNqzB+iybnSespNclN1bwgTGHeKHgOvXalZgS
 trUWt3MWZiYuvY2oX43EE5+SiS97yqfYktY2DngaogqU5V2o0b0V/5hUxP4cwQLyEtvoCbgy/A
 0j4=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49671192"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:34:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:34:07 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:34:02 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 24/30] media: atmel: atmel-isc: move the formats list into product specific code
Date:   Thu, 1 Apr 2021 14:27:17 +0300
Message-ID: <20210401112723.189107-25-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The list of input and output formats has to be product specific.
Move this list into the product specific code.
Have pointers to these arrays inside the device struct.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 167 ++----------------
 drivers/media/platform/atmel/atmel-isc.h      |  12 +-
 .../media/platform/atmel/atmel-sama5d2-isc.c  | 136 ++++++++++++++
 3 files changed, 165 insertions(+), 150 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 8422df41f083..6746c9060e3f 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -45,137 +45,6 @@ module_param(sensor_preferred, uint, 0644);
 MODULE_PARM_DESC(sensor_preferred,
 		 "Sensor is preferred to output the specified format (1-on 0-off), default 1");
 
-/* This is a list of the formats that the ISC can *output* */
-const struct isc_format controller_formats[] = {
-	{
-		.fourcc		= V4L2_PIX_FMT_ARGB444,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_ARGB555,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_RGB565,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_ABGR32,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_XBGR32,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_YUV420,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_YUYV,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_YUV422P,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_GREY,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_Y10,
-	},
-};
-
-/* This is a list of formats that the ISC can receive as *input* */
-struct isc_format formats_list[] = {
-	{
-		.fourcc		= V4L2_PIX_FMT_SBGGR8,
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
-		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SGBRG8,
-		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
-		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SGRBG8,
-		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
-		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SRGGB8,
-		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
-		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SBGGR10,
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
-		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SGBRG10,
-		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
-		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SGRBG10,
-		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
-		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SRGGB10,
-		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
-		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SBGGR12,
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
-		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SGBRG12,
-		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
-		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SGRBG12,
-		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
-		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_SRGGB12,
-		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
-		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_GREY,
-		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
-		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_YUYV,
-		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
-		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_RGB565,
-		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_LE,
-		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
-	},
-	{
-		.fourcc		= V4L2_PIX_FMT_Y10,
-		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
-		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
-	},
-
-};
-
 #define ISC_IS_FORMAT_RAW(mbus_code) \
 	(((mbus_code) & 0xf000) == 0x3000)
 
@@ -906,25 +775,26 @@ static int isc_querycap(struct file *file, void *priv,
 static int isc_enum_fmt_vid_cap(struct file *file, void *priv,
 				 struct v4l2_fmtdesc *f)
 {
+	struct isc_device *isc = video_drvdata(file);
 	u32 index = f->index;
 	u32 i, supported_index;
 
-	if (index < ARRAY_SIZE(controller_formats)) {
-		f->pixelformat = controller_formats[index].fourcc;
+	if (index < isc->controller_formats_size) {
+		f->pixelformat = isc->controller_formats[index].fourcc;
 		return 0;
 	}
 
-	index -= ARRAY_SIZE(controller_formats);
+	index -= isc->controller_formats_size;
 
 	i = 0;
 	supported_index = 0;
 
-	for (i = 0; i < ARRAY_SIZE(formats_list); i++) {
-		if (!ISC_IS_FORMAT_RAW(formats_list[i].mbus_code) ||
-		    !formats_list[i].sd_support)
+	for (i = 0; i < isc->formats_list_size; i++) {
+		if (!ISC_IS_FORMAT_RAW(isc->formats_list[i].mbus_code) ||
+		    !isc->formats_list[i].sd_support)
 			continue;
 		if (supported_index == index) {
-			f->pixelformat = formats_list[i].fourcc;
+			f->pixelformat = isc->formats_list[i].fourcc;
 			return 0;
 		}
 		supported_index++;
@@ -1465,8 +1335,8 @@ static int isc_enum_framesizes(struct file *file, void *fh,
 		if (isc->user_formats[i]->fourcc == fsize->pixel_format)
 			ret = 0;
 
-	for (i = 0; i < ARRAY_SIZE(controller_formats); i++)
-		if (controller_formats[i].fourcc == fsize->pixel_format)
+	for (i = 0; i < isc->controller_formats_size; i++)
+		if (isc->controller_formats[i].fourcc == fsize->pixel_format)
 			ret = 0;
 
 	if (ret)
@@ -1502,8 +1372,8 @@ static int isc_enum_frameintervals(struct file *file, void *fh,
 		if (isc->user_formats[i]->fourcc == fival->pixel_format)
 			ret = 0;
 
-	for (i = 0; i < ARRAY_SIZE(controller_formats); i++)
-		if (controller_formats[i].fourcc == fival->pixel_format)
+	for (i = 0; i < isc->controller_formats_size; i++)
+		if (isc->controller_formats[i].fourcc == fival->pixel_format)
 			ret = 0;
 
 	if (ret)
@@ -2111,12 +1981,13 @@ static void isc_async_unbind(struct v4l2_async_notifier *notifier,
 	v4l2_ctrl_handler_free(&isc->ctrls.handler);
 }
 
-static struct isc_format *find_format_by_code(unsigned int code, int *index)
+static struct isc_format *find_format_by_code(struct isc_device *isc,
+					      unsigned int code, int *index)
 {
-	struct isc_format *fmt = &formats_list[0];
+	struct isc_format *fmt = &isc->formats_list[0];
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(formats_list); i++) {
+	for (i = 0; i < isc->formats_list_size; i++) {
 		if (fmt->mbus_code == code) {
 			*index = i;
 			return fmt;
@@ -2133,7 +2004,7 @@ static int isc_formats_init(struct isc_device *isc)
 	struct isc_format *fmt;
 	struct v4l2_subdev *subdev = isc->current_subdev->sd;
 	unsigned int num_fmts, i, j;
-	u32 list_size = ARRAY_SIZE(formats_list);
+	u32 list_size = isc->formats_list_size;
 	struct v4l2_subdev_mbus_code_enum mbus_code = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
@@ -2143,7 +2014,7 @@ static int isc_formats_init(struct isc_device *isc)
 	       NULL, &mbus_code)) {
 		mbus_code.index++;
 
-		fmt = find_format_by_code(mbus_code.code, &i);
+		fmt = find_format_by_code(isc, mbus_code.code, &i);
 		if (!fmt) {
 			v4l2_warn(&isc->v4l2_dev, "Mbus code %x not supported\n",
 				  mbus_code.code);
@@ -2164,7 +2035,7 @@ static int isc_formats_init(struct isc_device *isc)
 	if (!isc->user_formats)
 		return -ENOMEM;
 
-	fmt = &formats_list[0];
+	fmt = &isc->formats_list[0];
 	for (i = 0, j = 0; i < list_size; i++) {
 		if (fmt->sd_support)
 			isc->user_formats[j++] = fmt;
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index abeef7b2ab27..14e318a7373c 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -237,6 +237,12 @@ struct isc_reg_offsets {
  *			specific v4l2 controls.
  *
  * @offsets:		struct holding the product specific register offsets
+ * @controller_formats:	pointer to the array of possible formats that the
+ *			controller can output
+ * @formats_list:	pointer to the array of possible formats that can
+ *			be used as an input to the controller
+ * @controller_formats_size:	size of controller_formats array
+ * @formats_list_size:	size of formats_list array
  */
 struct isc_device {
 	struct regmap		*regmap;
@@ -318,10 +324,12 @@ struct isc_device {
 	};
 
 	struct isc_reg_offsets		offsets;
+	const struct isc_format		*controller_formats;
+	struct isc_format		*formats_list;
+	u32				controller_formats_size;
+	u32				formats_list_size;
 };
 
-extern struct isc_format formats_list[];
-extern const struct isc_format controller_formats[];
 extern const struct regmap_config isc_regmap_config;
 extern const struct v4l2_async_notifier_operations isc_async_ops;
 
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 342259ad3690..38b9667537a3 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -54,6 +54,137 @@
 
 #define ISC_CLK_MAX_DIV		255
 
+/* This is a list of the formats that the ISC can *output* */
+const struct isc_format sama5d2_controller_formats[] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_ARGB444,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_ARGB555,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_RGB565,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_ABGR32,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_XBGR32,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YUV420,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YUV422P,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_GREY,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_Y10,
+	},
+};
+
+/* This is a list of formats that the ISC can receive as *input* */
+struct isc_format sama5d2_formats_list[] = {
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
+		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
+		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
+		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
+		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR10,
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG10,
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG10,
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB10,
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SBGGR12,
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.cfa_baycfg	= ISC_BAY_CFG_BGBG,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGBRG12,
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.cfa_baycfg	= ISC_BAY_CFG_GBGB,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SGRBG12,
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.cfa_baycfg	= ISC_BAY_CFG_GRGR,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_SRGGB12,
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TWELVE,
+		.cfa_baycfg	= ISC_BAY_CFG_RGRG,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_GREY,
+		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_RGB565,
+		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.pfe_cfg0_bps	= ISC_PFE_CFG0_BPS_EIGHT,
+	},
+	{
+		.fourcc		= V4L2_PIX_FMT_Y10,
+		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
+		.pfe_cfg0_bps	= ISC_PFG_CFG0_BPS_TEN,
+	},
+
+};
+
 void isc_sama5d2_config_csc(struct isc_device *isc)
 {
 	struct regmap *regmap = isc->regmap;
@@ -289,6 +420,11 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->offsets.version = ISC_SAMA5D2_VERSION_OFFSET;
 	isc->offsets.his_entry = ISC_SAMA5D2_HIS_ENTRY_OFFSET;
 
+	isc->controller_formats = sama5d2_controller_formats;
+	isc->controller_formats_size = ARRAY_SIZE(sama5d2_controller_formats);
+	isc->formats_list = sama5d2_formats_list;
+	isc->formats_list_size = ARRAY_SIZE(sama5d2_formats_list);
+
 	/* sama5d2-isc - 8 bits per beat */
 	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
 
-- 
2.25.1

