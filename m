Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566DD3543E8
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238326AbhDEP6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:58:10 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:36642 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbhDEP6K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638284; x=1649174284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rK5CJGU8N3XX7TtTTav85fwozd9+e/dQ7fGhe5GPqkE=;
  b=XU1XWjf+ESo8ms6aPdfzjl7ZSEJ5Rd0OTe/kqnAQFEsWCtSv8LgeAITk
   rrQlgr7agZwK3zjFtRsbgRTAqQYO1VO4Nv7mohzX/DewTLVNkR4tBoTkX
   +naJpPcIdbDmRSr8u1674FpI3x4wPfMIkZrRdbALoW0YQnfTRI4z4n+Ow
   0ldH09S0dewclHfl/gFnIXtIHR7cBtPqCzEIBQ5SVum0Ojwe3aZopCNnf
   TdJSEQdHNr+fC/swlcvs3xPLiOkK46OySVya8HteJbeNJsX3pC7LWAouH
   a+oLbI+q6geQ3YsbW41ytVAusMCRep556eUcPqrv8UKvGAAk5a21KL5Ud
   A==;
IronPort-SDR: wuI570nOVNm4vR2w7Ko4rmtDuWyHpap60SNxhRwSIRiW+H4TEpGbFxt3xxKR4C3ohKSz6x7tml
 zhbVcrPAPfuuany/QdqwjNitBsvh1It+yjRMBYJg4q0yxAsxgETXDp3F6SS7cZ6SyHTYS/H0us
 YsNRJTLqD7b2L6kGN1zRgsPYPULHLNx4BgSqhQp1KC+M+4drDjlTIPj3Zk215RgOGMr3vc6ulG
 9DQANAwqUnOR/+BYvOAnjJnYZgITTktEfCHyrxuMtFfILL4XyoNY7oJK8Pe0K4WvjG5yfDLljH
 BIA=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="112482151"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:58:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:58:02 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:57:46 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 24/30] media: atmel: atmel-isc: move the formats list into product specific code
Date:   Mon, 5 Apr 2021 18:50:59 +0300
Message-ID: <20210405155105.162529-25-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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
index 855027821fba..a5823a3a6111 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -64,6 +64,137 @@ void isc_sama5d2_config_rlp(struct isc_device *isc);
 void isc_sama5d2_config_ctrls(struct isc_device *isc,
 			      const struct v4l2_ctrl_ops *ops);
 
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
@@ -299,6 +430,11 @@ static int atmel_isc_probe(struct platform_device *pdev)
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

