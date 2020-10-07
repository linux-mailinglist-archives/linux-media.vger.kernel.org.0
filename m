Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4483285B2F
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 10:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgJGIrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 04:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbgJGIqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 04:46:03 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1DBC061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 01:46:02 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id E1749634C98
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 11:45:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 015/106] smiapp: Internal rename to CCS
Date:   Wed,  7 Oct 2020 11:44:35 +0300
Message-Id: <20201007084557.25843-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007084557.25843-1-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename internal names to reflect the driver's new reference. The module
name remains the same.

Also fix trivial coding style issues on the way related to e.g. alignment
changes due to the rename.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/Makefile             |   4 +-
 .../i2c/smiapp/{smiapp-core.c => ccs-core.c}  | 888 +++++++++---------
 .../smiapp/{smiapp-quirk.c => ccs-quirk.c}    |  43 +-
 .../smiapp/{smiapp-quirk.h => ccs-quirk.h}    |  46 +-
 .../{smiapp-regs.c => ccs-reg-access.c}       |  41 +-
 .../{smiapp-regs.h => ccs-reg-access.h}       |  16 +-
 drivers/media/i2c/smiapp/{smiapp.h => ccs.h}  | 124 +--
 7 files changed, 576 insertions(+), 586 deletions(-)
 rename drivers/media/i2c/smiapp/{smiapp-core.c => ccs-core.c} (75%)
 rename drivers/media/i2c/smiapp/{smiapp-quirk.c => ccs-quirk.c} (83%)
 rename drivers/media/i2c/smiapp/{smiapp-quirk.h => ccs-quirk.h} (59%)
 rename drivers/media/i2c/smiapp/{smiapp-regs.c => ccs-reg-access.c} (79%)
 rename drivers/media/i2c/smiapp/{smiapp-regs.h => ccs-reg-access.h} (55%)
 rename drivers/media/i2c/smiapp/{smiapp.h => ccs.h} (65%)

diff --git a/drivers/media/i2c/smiapp/Makefile b/drivers/media/i2c/smiapp/Makefile
index 2189de360db6..f86f871f0a58 100644
--- a/drivers/media/i2c/smiapp/Makefile
+++ b/drivers/media/i2c/smiapp/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-smiapp-objs			+= smiapp-core.o smiapp-regs.o \
-				   smiapp-quirk.o ccs-limits.o
+smiapp-objs			+= ccs-core.o ccs-reg-access.o \
+				   ccs-quirk.o ccs-limits.o
 obj-$(CONFIG_VIDEO_SMIAPP)	+= smiapp.o
 
 ccflags-y += -I $(srctree)/drivers/media/i2c
diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/ccs-core.c
similarity index 75%
rename from drivers/media/i2c/smiapp/smiapp-core.c
rename to drivers/media/i2c/smiapp/ccs-core.c
index 5b322194cb4b..dd093a7d2ef4 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/ccs-core.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/media/i2c/smiapp/smiapp-core.c
+ * drivers/media/i2c/smiapp/ccs-core.c
  *
  * Generic driver for SMIA/SMIA++ compliant camera modules
  *
@@ -27,10 +27,10 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-device.h>
 
+#include "ccs.h"
 #include "ccs-limits.h"
-#include "smiapp.h"
 
-#define SMIAPP_ALIGN_DIM(dim, flags)	\
+#define CCS_ALIGN_DIM(dim, flags)	\
 	((flags) & V4L2_SEL_FLAG_GE	\
 	 ? ALIGN((dim), 2)		\
 	 : (dim) & ~1)
@@ -41,20 +41,20 @@ struct ccs_limit_offset {
 } ccs_limit_offsets[CCS_L_LAST + 1];
 
 /*
- * smiapp_module_idents - supported camera modules
+ * ccs_module_idents - supported camera modules
  */
-static const struct smiapp_module_ident smiapp_module_idents[] = {
-	SMIAPP_IDENT_L(0x01, 0x022b, -1, "vs6555"),
-	SMIAPP_IDENT_L(0x01, 0x022e, -1, "vw6558"),
-	SMIAPP_IDENT_L(0x07, 0x7698, -1, "ovm7698"),
-	SMIAPP_IDENT_L(0x0b, 0x4242, -1, "smiapp-003"),
-	SMIAPP_IDENT_L(0x0c, 0x208a, -1, "tcm8330md"),
-	SMIAPP_IDENT_LQ(0x0c, 0x2134, -1, "tcm8500md", &smiapp_tcm8500md_quirk),
-	SMIAPP_IDENT_L(0x0c, 0x213e, -1, "et8en2"),
-	SMIAPP_IDENT_L(0x0c, 0x2184, -1, "tcm8580md"),
-	SMIAPP_IDENT_LQ(0x0c, 0x560f, -1, "jt8ew9", &smiapp_jt8ew9_quirk),
-	SMIAPP_IDENT_LQ(0x10, 0x4141, -1, "jt8ev1", &smiapp_jt8ev1_quirk),
-	SMIAPP_IDENT_LQ(0x10, 0x4241, -1, "imx125es", &smiapp_imx125es_quirk),
+static const struct ccs_module_ident ccs_module_idents[] = {
+	CCS_IDENT_L(0x01, 0x022b, -1, "vs6555"),
+	CCS_IDENT_L(0x01, 0x022e, -1, "vw6558"),
+	CCS_IDENT_L(0x07, 0x7698, -1, "ovm7698"),
+	CCS_IDENT_L(0x0b, 0x4242, -1, "smiapp-003"),
+	CCS_IDENT_L(0x0c, 0x208a, -1, "tcm8330md"),
+	CCS_IDENT_LQ(0x0c, 0x2134, -1, "tcm8500md", &smiapp_tcm8500md_quirk),
+	CCS_IDENT_L(0x0c, 0x213e, -1, "et8en2"),
+	CCS_IDENT_L(0x0c, 0x2184, -1, "tcm8580md"),
+	CCS_IDENT_LQ(0x0c, 0x560f, -1, "jt8ew9", &smiapp_jt8ew9_quirk),
+	CCS_IDENT_LQ(0x10, 0x4141, -1, "jt8ev1", &smiapp_jt8ev1_quirk),
+	CCS_IDENT_LQ(0x10, 0x4241, -1, "imx125es", &smiapp_imx125es_quirk),
 };
 
 /*
@@ -78,7 +78,7 @@ static void ccs_assign_limit(void *ptr, unsigned int width, u32 val)
 	}
 }
 
-static int ccs_limit_ptr(struct smiapp_sensor *sensor, unsigned int limit,
+static int ccs_limit_ptr(struct ccs_sensor *sensor, unsigned int limit,
 			 unsigned int offset, void **__ptr)
 {
 	const struct ccs_limit *linfo;
@@ -98,7 +98,7 @@ static int ccs_limit_ptr(struct smiapp_sensor *sensor, unsigned int limit,
 	return 0;
 }
 
-void ccs_replace_limit(struct smiapp_sensor *sensor,
+void ccs_replace_limit(struct ccs_sensor *sensor,
 		       unsigned int limit, unsigned int offset, u32 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -118,7 +118,7 @@ void ccs_replace_limit(struct smiapp_sensor *sensor,
 	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
 }
 
-static u32 ccs_get_limit(struct smiapp_sensor *sensor,
+static u32 ccs_get_limit(struct ccs_sensor *sensor,
 			 unsigned int limit, unsigned int offset)
 {
 	void *ptr;
@@ -148,7 +148,7 @@ static u32 ccs_get_limit(struct smiapp_sensor *sensor,
 #define CCS_LIM_AT(sensor, limit, offset)	\
 	ccs_get_limit(sensor, CCS_L_##limit, CCS_L_##limit##_OFFSET(offset))
 
-static int ccs_read_all_limits(struct smiapp_sensor *sensor)
+static int ccs_read_all_limits(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	void *ptr, *alloc, *end;
@@ -224,7 +224,7 @@ static int ccs_read_all_limits(struct smiapp_sensor *sensor)
 	return ret;
 }
 
-static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
+static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	u8 fmt_model_type, fmt_model_subtype, ncol_desc, nrow_desc;
@@ -351,7 +351,7 @@ static int smiapp_read_frame_fmt(struct smiapp_sensor *sensor)
 	return 0;
 }
 
-static int smiapp_pll_configure(struct smiapp_sensor *sensor)
+static int ccs_pll_configure(struct ccs_sensor *sensor)
 {
 	struct smiapp_pll *pll = &sensor->pll;
 	int rval;
@@ -386,8 +386,7 @@ static int smiapp_pll_configure(struct smiapp_sensor *sensor)
 	return ccs_write(sensor, OP_SYS_CLK_DIV, pll->op.sys_clk_div);
 }
 
-static int smiapp_pll_try(struct smiapp_sensor *sensor,
-			  struct smiapp_pll *pll)
+static int ccs_pll_try(struct ccs_sensor *sensor, struct smiapp_pll *pll)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct smiapp_pll_limits lim = {
@@ -425,7 +424,7 @@ static int smiapp_pll_try(struct smiapp_sensor *sensor,
 	return smiapp_pll_calculate(&client->dev, &lim, pll);
 }
 
-static int smiapp_pll_update(struct smiapp_sensor *sensor)
+static int ccs_pll_update(struct ccs_sensor *sensor)
 {
 	struct smiapp_pll *pll = &sensor->pll;
 	int rval;
@@ -437,7 +436,7 @@ static int smiapp_pll_update(struct smiapp_sensor *sensor)
 	pll->scale_m = sensor->scale_m;
 	pll->bits_per_pixel = sensor->csi_format->compressed;
 
-	rval = smiapp_pll_try(sensor, pll);
+	rval = ccs_pll_try(sensor, pll);
 	if (rval < 0)
 		return rval;
 
@@ -455,12 +454,12 @@ static int smiapp_pll_update(struct smiapp_sensor *sensor)
  *
  */
 
-static void __smiapp_update_exposure_limits(struct smiapp_sensor *sensor)
+static void __ccs_update_exposure_limits(struct ccs_sensor *sensor)
 {
 	struct v4l2_ctrl *ctrl = sensor->exposure;
 	int max;
 
-	max = sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height
+	max = sensor->pixel_array->crop[CCS_PA_PAD_SRC].height
 		+ sensor->vblank->val
 		- CCS_LIM(sensor, COARSE_INTEGRATION_TIME_MAX_MARGIN);
 
@@ -475,40 +474,40 @@ static void __smiapp_update_exposure_limits(struct smiapp_sensor *sensor)
  * 3. Pixel order, same as in pixel_order_str. Formats for all four pixel
  *    orders must be defined.
  */
-static const struct smiapp_csi_data_format smiapp_csi_data_formats[] = {
-	{ MEDIA_BUS_FMT_SGRBG16_1X16, 16, 16, SMIAPP_PIXEL_ORDER_GRBG, },
-	{ MEDIA_BUS_FMT_SRGGB16_1X16, 16, 16, SMIAPP_PIXEL_ORDER_RGGB, },
-	{ MEDIA_BUS_FMT_SBGGR16_1X16, 16, 16, SMIAPP_PIXEL_ORDER_BGGR, },
-	{ MEDIA_BUS_FMT_SGBRG16_1X16, 16, 16, SMIAPP_PIXEL_ORDER_GBRG, },
-	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, 14, SMIAPP_PIXEL_ORDER_GRBG, },
-	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, 14, SMIAPP_PIXEL_ORDER_RGGB, },
-	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, 14, SMIAPP_PIXEL_ORDER_BGGR, },
-	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, 14, SMIAPP_PIXEL_ORDER_GBRG, },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, 12, SMIAPP_PIXEL_ORDER_GRBG, },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, 12, SMIAPP_PIXEL_ORDER_RGGB, },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, 12, SMIAPP_PIXEL_ORDER_BGGR, },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, 12, SMIAPP_PIXEL_ORDER_GBRG, },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, 10, SMIAPP_PIXEL_ORDER_GRBG, },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, 10, SMIAPP_PIXEL_ORDER_RGGB, },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, 10, SMIAPP_PIXEL_ORDER_BGGR, },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, 10, SMIAPP_PIXEL_ORDER_GBRG, },
-	{ MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, 10, 8, SMIAPP_PIXEL_ORDER_GRBG, },
-	{ MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, 10, 8, SMIAPP_PIXEL_ORDER_RGGB, },
-	{ MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, 10, 8, SMIAPP_PIXEL_ORDER_BGGR, },
-	{ MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, 10, 8, SMIAPP_PIXEL_ORDER_GBRG, },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, 8, SMIAPP_PIXEL_ORDER_GRBG, },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, SMIAPP_PIXEL_ORDER_RGGB, },
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, SMIAPP_PIXEL_ORDER_BGGR, },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, SMIAPP_PIXEL_ORDER_GBRG, },
+static const struct ccs_csi_data_format ccs_csi_data_formats[] = {
+	{ MEDIA_BUS_FMT_SGRBG16_1X16, 16, 16, CCS_PIXEL_ORDER_GRBG, },
+	{ MEDIA_BUS_FMT_SRGGB16_1X16, 16, 16, CCS_PIXEL_ORDER_RGGB, },
+	{ MEDIA_BUS_FMT_SBGGR16_1X16, 16, 16, CCS_PIXEL_ORDER_BGGR, },
+	{ MEDIA_BUS_FMT_SGBRG16_1X16, 16, 16, CCS_PIXEL_ORDER_GBRG, },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, 14, CCS_PIXEL_ORDER_GRBG, },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, 14, CCS_PIXEL_ORDER_RGGB, },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, 14, CCS_PIXEL_ORDER_BGGR, },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, 14, CCS_PIXEL_ORDER_GBRG, },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, 12, CCS_PIXEL_ORDER_GRBG, },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, 12, CCS_PIXEL_ORDER_RGGB, },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, 12, CCS_PIXEL_ORDER_BGGR, },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, 12, CCS_PIXEL_ORDER_GBRG, },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, 10, CCS_PIXEL_ORDER_GRBG, },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, 10, CCS_PIXEL_ORDER_RGGB, },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, 10, CCS_PIXEL_ORDER_BGGR, },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, 10, CCS_PIXEL_ORDER_GBRG, },
+	{ MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8, 10, 8, CCS_PIXEL_ORDER_GRBG, },
+	{ MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8, 10, 8, CCS_PIXEL_ORDER_RGGB, },
+	{ MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8, 10, 8, CCS_PIXEL_ORDER_BGGR, },
+	{ MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8, 10, 8, CCS_PIXEL_ORDER_GBRG, },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, 8, CCS_PIXEL_ORDER_GRBG, },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, CCS_PIXEL_ORDER_RGGB, },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, CCS_PIXEL_ORDER_BGGR, },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, CCS_PIXEL_ORDER_GBRG, },
 };
 
 static const char *pixel_order_str[] = { "GRBG", "RGGB", "BGGR", "GBRG" };
 
 #define to_csi_format_idx(fmt) (((unsigned long)(fmt)			\
-				 - (unsigned long)smiapp_csi_data_formats) \
-				/ sizeof(*smiapp_csi_data_formats))
+				 - (unsigned long)ccs_csi_data_formats) \
+				/ sizeof(*ccs_csi_data_formats))
 
-static u32 smiapp_pixel_order(struct smiapp_sensor *sensor)
+static u32 ccs_pixel_order(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int flip = 0;
@@ -527,31 +526,31 @@ static u32 smiapp_pixel_order(struct smiapp_sensor *sensor)
 	return sensor->default_pixel_order ^ flip;
 }
 
-static void smiapp_update_mbus_formats(struct smiapp_sensor *sensor)
+static void ccs_update_mbus_formats(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int csi_format_idx =
 		to_csi_format_idx(sensor->csi_format) & ~3;
 	unsigned int internal_csi_format_idx =
 		to_csi_format_idx(sensor->internal_csi_format) & ~3;
-	unsigned int pixel_order = smiapp_pixel_order(sensor);
+	unsigned int pixel_order = ccs_pixel_order(sensor);
 
 	sensor->mbus_frame_fmts =
 		sensor->default_mbus_frame_fmts << pixel_order;
 	sensor->csi_format =
-		&smiapp_csi_data_formats[csi_format_idx + pixel_order];
+		&ccs_csi_data_formats[csi_format_idx + pixel_order];
 	sensor->internal_csi_format =
-		&smiapp_csi_data_formats[internal_csi_format_idx
+		&ccs_csi_data_formats[internal_csi_format_idx
 					 + pixel_order];
 
 	BUG_ON(max(internal_csi_format_idx, csi_format_idx) + pixel_order
-	       >= ARRAY_SIZE(smiapp_csi_data_formats));
+	       >= ARRAY_SIZE(ccs_csi_data_formats));
 
 	dev_dbg(&client->dev, "new pixel order %s\n",
 		pixel_order_str[pixel_order]);
 }
 
-static const char * const smiapp_test_patterns[] = {
+static const char * const ccs_test_patterns[] = {
 	"Disabled",
 	"Solid Colour",
 	"Eight Vertical Colour Bars",
@@ -559,10 +558,10 @@ static const char * const smiapp_test_patterns[] = {
 	"Pseudorandom Sequence (PN9)",
 };
 
-static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
+static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct smiapp_sensor *sensor =
-		container_of(ctrl->handler, struct smiapp_subdev, ctrl_handler)
+	struct ccs_sensor *sensor =
+		container_of(ctrl->handler, struct ccs_subdev, ctrl_handler)
 			->sensor;
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int pm_status;
@@ -585,17 +584,17 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		orient ^= sensor->hvflip_inv_mask;
 
-		smiapp_update_mbus_formats(sensor);
+		ccs_update_mbus_formats(sensor);
 
 		break;
 	case V4L2_CID_VBLANK:
 		exposure = sensor->exposure->val;
 
-		__smiapp_update_exposure_limits(sensor);
+		__ccs_update_exposure_limits(sensor);
 
 		if (exposure > sensor->exposure->maximum) {
 			sensor->exposure->val =	sensor->exposure->maximum;
-			rval = smiapp_set_ctrl(sensor->exposure);
+			rval = ccs_set_ctrl(sensor->exposure);
 			if (rval < 0)
 				return rval;
 		}
@@ -605,7 +604,7 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (sensor->streaming)
 			return -EBUSY;
 
-		rval = smiapp_pll_update(sensor);
+		rval = ccs_pll_update(sensor);
 		if (rval)
 			return rval;
 
@@ -641,14 +640,14 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		rval = ccs_write(sensor, FRAME_LENGTH_LINES,
 				 sensor->pixel_array->crop[
-					 SMIAPP_PA_PAD_SRC].height
+					 CCS_PA_PAD_SRC].height
 				 + ctrl->val);
 
 		break;
 	case V4L2_CID_HBLANK:
 		rval = ccs_write(sensor, LINE_LENGTH_PCK,
 				 sensor->pixel_array->crop[
-					 SMIAPP_PA_PAD_SRC].width
+					 CCS_PA_PAD_SRC].width
 				 + ctrl->val);
 
 		break;
@@ -689,11 +688,11 @@ static int smiapp_set_ctrl(struct v4l2_ctrl *ctrl)
 	return rval;
 }
 
-static const struct v4l2_ctrl_ops smiapp_ctrl_ops = {
-	.s_ctrl = smiapp_set_ctrl,
+static const struct v4l2_ctrl_ops ccs_ctrl_ops = {
+	.s_ctrl = ccs_set_ctrl,
 };
 
-static int smiapp_init_controls(struct smiapp_sensor *sensor)
+static int ccs_init_controls(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
@@ -705,7 +704,7 @@ static int smiapp_init_controls(struct smiapp_sensor *sensor)
 	sensor->pixel_array->ctrl_handler.lock = &sensor->mutex;
 
 	sensor->analog_gain = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_ANALOGUE_GAIN,
 		CCS_LIM(sensor, ANALOG_GAIN_CODE_MIN),
 		CCS_LIM(sensor, ANALOG_GAIN_CODE_MAX),
@@ -714,38 +713,38 @@ static int smiapp_init_controls(struct smiapp_sensor *sensor)
 
 	/* Exposure limits will be updated soon, use just something here. */
 	sensor->exposure = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_EXPOSURE, 0, 0, 1, 0);
 
 	sensor->hflip = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_HFLIP, 0, 1, 1, 0);
 	sensor->vflip = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_VFLIP, 0, 1, 1, 0);
 
 	sensor->vblank = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_VBLANK, 0, 1, 1, 0);
 
 	if (sensor->vblank)
 		sensor->vblank->flags |= V4L2_CTRL_FLAG_UPDATE;
 
 	sensor->hblank = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_HBLANK, 0, 1, 1, 0);
 
 	if (sensor->hblank)
 		sensor->hblank->flags |= V4L2_CTRL_FLAG_UPDATE;
 
 	sensor->pixel_rate_parray = v4l2_ctrl_new_std(
-		&sensor->pixel_array->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->pixel_array->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1, 1);
 
 	v4l2_ctrl_new_std_menu_items(&sensor->pixel_array->ctrl_handler,
-				     &smiapp_ctrl_ops, V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(smiapp_test_patterns) - 1,
-				     0, 0, smiapp_test_patterns);
+				     &ccs_ctrl_ops, V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ccs_test_patterns) - 1,
+				     0, 0, ccs_test_patterns);
 
 	if (sensor->pixel_array->ctrl_handler.error) {
 		dev_err(&client->dev,
@@ -766,7 +765,7 @@ static int smiapp_init_controls(struct smiapp_sensor *sensor)
 	sensor->src->ctrl_handler.lock = &sensor->mutex;
 
 	sensor->pixel_rate_csi = v4l2_ctrl_new_std(
-		&sensor->src->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->src->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1, 1);
 
 	if (sensor->src->ctrl_handler.error) {
@@ -785,7 +784,7 @@ static int smiapp_init_controls(struct smiapp_sensor *sensor)
  * For controls that require information on available media bus codes
  * and linke frequencies.
  */
-static int smiapp_init_late_controls(struct smiapp_sensor *sensor)
+static int ccs_init_late_controls(struct ccs_sensor *sensor)
 {
 	unsigned long *valid_link_freqs = &sensor->valid_link_freqs[
 		sensor->csi_format->compressed - sensor->compressed_min_bpp];
@@ -796,19 +795,19 @@ static int smiapp_init_late_controls(struct smiapp_sensor *sensor)
 
 		sensor->test_data[i] = v4l2_ctrl_new_std(
 				&sensor->pixel_array->ctrl_handler,
-				&smiapp_ctrl_ops, V4L2_CID_TEST_PATTERN_RED + i,
+				&ccs_ctrl_ops, V4L2_CID_TEST_PATTERN_RED + i,
 				0, max_value, 1, max_value);
 	}
 
 	sensor->link_freq = v4l2_ctrl_new_int_menu(
-		&sensor->src->ctrl_handler, &smiapp_ctrl_ops,
+		&sensor->src->ctrl_handler, &ccs_ctrl_ops,
 		V4L2_CID_LINK_FREQ, __fls(*valid_link_freqs),
 		__ffs(*valid_link_freqs), sensor->hwcfg->op_sys_clock);
 
 	return sensor->src->ctrl_handler.error;
 }
 
-static void smiapp_free_controls(struct smiapp_sensor *sensor)
+static void ccs_free_controls(struct ccs_sensor *sensor)
 {
 	unsigned int i;
 
@@ -816,7 +815,7 @@ static void smiapp_free_controls(struct smiapp_sensor *sensor)
 		v4l2_ctrl_handler_free(&sensor->ssds[i].ctrl_handler);
 }
 
-static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
+static int ccs_get_mbus_formats(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct smiapp_pll *pll = &sensor->pll;
@@ -863,11 +862,11 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 		dev_dbg(&client->dev, "%u: bpp %u, compressed %u\n",
 			i, fmt >> 8, (u8)fmt);
 
-		for (j = 0; j < ARRAY_SIZE(smiapp_csi_data_formats); j++) {
-			const struct smiapp_csi_data_format *f =
-				&smiapp_csi_data_formats[j];
+		for (j = 0; j < ARRAY_SIZE(ccs_csi_data_formats); j++) {
+			const struct ccs_csi_data_format *f =
+				&ccs_csi_data_formats[j];
 
-			if (f->pixel_order != SMIAPP_PIXEL_ORDER_GRBG)
+			if (f->pixel_order != CCS_PIXEL_ORDER_GRBG)
 				continue;
 
 			if (f->width != fmt >>
@@ -887,12 +886,12 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 	pll->binning_vertical = 1;
 	pll->scale_m = sensor->scale_m;
 
-	for (i = 0; i < ARRAY_SIZE(smiapp_csi_data_formats); i++) {
+	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
 		sensor->compressed_min_bpp =
-			min(smiapp_csi_data_formats[i].compressed,
+			min(ccs_csi_data_formats[i].compressed,
 			    sensor->compressed_min_bpp);
 		compressed_max_bpp =
-			max(smiapp_csi_data_formats[i].compressed,
+			max(ccs_csi_data_formats[i].compressed,
 			    compressed_max_bpp);
 	}
 
@@ -903,9 +902,9 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 	if (!sensor->valid_link_freqs)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(smiapp_csi_data_formats); i++) {
-		const struct smiapp_csi_data_format *f =
-			&smiapp_csi_data_formats[i];
+	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
+		const struct ccs_csi_data_format *f =
+			&ccs_csi_data_formats[i];
 		unsigned long *valid_link_freqs =
 			&sensor->valid_link_freqs[
 				f->compressed - sensor->compressed_min_bpp];
@@ -919,7 +918,7 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 		for (j = 0; sensor->hwcfg->op_sys_clock[j]; j++) {
 			pll->link_freq = sensor->hwcfg->op_sys_clock[j];
 
-			rval = smiapp_pll_try(sensor, pll);
+			rval = ccs_pll_try(sensor, pll);
 			dev_dbg(&client->dev, "link freq %u Hz, bpp %u %s\n",
 				pll->link_freq, pll->bits_per_pixel,
 				rval ? "not ok" : "ok");
@@ -951,12 +950,12 @@ static int smiapp_get_mbus_formats(struct smiapp_sensor *sensor)
 		return -EINVAL;
 	}
 
-	smiapp_update_mbus_formats(sensor);
+	ccs_update_mbus_formats(sensor);
 
 	return 0;
 }
 
-static void smiapp_update_blanking(struct smiapp_sensor *sensor)
+static void ccs_update_blanking(struct ccs_sensor *sensor)
 {
 	struct v4l2_ctrl *vblank = sensor->vblank;
 	struct v4l2_ctrl *hblank = sensor->hblank;
@@ -980,42 +979,42 @@ static void smiapp_update_blanking(struct smiapp_sensor *sensor)
 	min = max_t(int,
 		    CCS_LIM(sensor, MIN_FRAME_BLANKING_LINES),
 		    min_fll -
-		    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height);
-	max = max_fll -	sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height;
+		    sensor->pixel_array->crop[CCS_PA_PAD_SRC].height);
+	max = max_fll -	sensor->pixel_array->crop[CCS_PA_PAD_SRC].height;
 
 	__v4l2_ctrl_modify_range(vblank, min, max, vblank->step, min);
 
 	min = max_t(int,
 		    min_llp -
-		    sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width,
+		    sensor->pixel_array->crop[CCS_PA_PAD_SRC].width,
 		    min_lbp);
-	max = max_llp - sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width;
+	max = max_llp - sensor->pixel_array->crop[CCS_PA_PAD_SRC].width;
 
 	__v4l2_ctrl_modify_range(hblank, min, max, hblank->step, min);
 
-	__smiapp_update_exposure_limits(sensor);
+	__ccs_update_exposure_limits(sensor);
 }
 
-static int smiapp_pll_blanking_update(struct smiapp_sensor *sensor)
+static int ccs_pll_blanking_update(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	rval = smiapp_pll_update(sensor);
+	rval = ccs_pll_update(sensor);
 	if (rval < 0)
 		return rval;
 
 	/* Output from pixel array, including blanking */
-	smiapp_update_blanking(sensor);
+	ccs_update_blanking(sensor);
 
 	dev_dbg(&client->dev, "vblank\t\t%d\n", sensor->vblank->val);
 	dev_dbg(&client->dev, "hblank\t\t%d\n", sensor->hblank->val);
 
 	dev_dbg(&client->dev, "real timeperframe\t100/%d\n",
 		sensor->pll.pixel_rate_pixel_array /
-		((sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width
+		((sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
 		  + sensor->hblank->val) *
-		 (sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height
+		 (sensor->pixel_array->crop[CCS_PA_PAD_SRC].height
 		  + sensor->vblank->val) / 100));
 
 	return 0;
@@ -1027,8 +1026,8 @@ static int smiapp_pll_blanking_update(struct smiapp_sensor *sensor)
  *
  */
 
-static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
-				u8 *status)
+static int ccs_read_nvm_page(struct ccs_sensor *sensor, u32 p, u8 *nvm,
+			     u8 *status)
 {
 	unsigned int i;
 	int rval;
@@ -1082,8 +1081,8 @@ static int smiapp_read_nvm_page(struct smiapp_sensor *sensor, u32 p, u8 *nvm,
 	return 0;
 }
 
-static int smiapp_read_nvm(struct smiapp_sensor *sensor, unsigned char *nvm,
-			   size_t nvm_size)
+static int ccs_read_nvm(struct ccs_sensor *sensor, unsigned char *nvm,
+			size_t nvm_size)
 {
 	u8 status = 0;
 	u32 p;
@@ -1091,7 +1090,7 @@ static int smiapp_read_nvm(struct smiapp_sensor *sensor, unsigned char *nvm,
 
 	for (p = 0; p < nvm_size / (CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P + 1)
 		     && !rval; p++) {
-		rval = smiapp_read_nvm_page(sensor, p, nvm, &status);
+		rval = ccs_read_nvm_page(sensor, p, nvm, &status);
 		nvm += CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P + 1;
 	}
 
@@ -1111,7 +1110,7 @@ static int smiapp_read_nvm(struct smiapp_sensor *sensor, unsigned char *nvm,
  * SMIA++ CCI address control
  *
  */
-static int smiapp_change_cci_addr(struct smiapp_sensor *sensor)
+static int ccs_change_cci_addr(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
@@ -1142,9 +1141,9 @@ static int smiapp_change_cci_addr(struct smiapp_sensor *sensor)
  * SMIA++ Mode Control
  *
  */
-static int smiapp_setup_flash_strobe(struct smiapp_sensor *sensor)
+static int ccs_setup_flash_strobe(struct ccs_sensor *sensor)
 {
-	struct smiapp_flash_strobe_parms *strobe_setup;
+	struct ccs_flash_strobe_parms *strobe_setup;
 	unsigned int ext_freq = sensor->hwcfg->ext_clk;
 	u32 tmp;
 	u32 strobe_adjustment;
@@ -1268,16 +1267,16 @@ static int smiapp_setup_flash_strobe(struct smiapp_sensor *sensor)
  * Power management
  */
 
-static int smiapp_power_on(struct device *dev)
+static int ccs_power_on(struct device *dev)
 {
 	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	/*
 	 * The sub-device related to the I2C device is always the
 	 * source one, i.e. ssds[0].
 	 */
-	struct smiapp_sensor *sensor =
-		container_of(ssd, struct smiapp_sensor, ssds[0]);
+	struct ccs_sensor *sensor =
+		container_of(ssd, struct ccs_sensor, ssds[0]);
 	unsigned int sleep;
 	int rval;
 
@@ -1312,7 +1311,7 @@ static int smiapp_power_on(struct device *dev)
 	 */
 
 	if (sensor->hwcfg->i2c_addr_alt) {
-		rval = smiapp_change_cci_addr(sensor);
+		rval = ccs_change_cci_addr(sensor);
 		if (rval) {
 			dev_err(dev, "cci address change error\n");
 			goto out_cci_addr_fail;
@@ -1326,7 +1325,7 @@ static int smiapp_power_on(struct device *dev)
 	}
 
 	if (sensor->hwcfg->i2c_addr_alt) {
-		rval = smiapp_change_cci_addr(sensor);
+		rval = ccs_change_cci_addr(sensor);
 		if (rval) {
 			dev_err(dev, "cci address change error\n");
 			goto out_cci_addr_fail;
@@ -1372,7 +1371,7 @@ static int smiapp_power_on(struct device *dev)
 	if (rval < 0)
 		goto out_cci_addr_fail;
 
-	rval = smiapp_call_quirk(sensor, post_poweron);
+	rval = ccs_call_quirk(sensor, post_poweron);
 	if (rval) {
 		dev_err(dev, "post_poweron quirks failed\n");
 		goto out_cci_addr_fail;
@@ -1390,12 +1389,12 @@ static int smiapp_power_on(struct device *dev)
 	return rval;
 }
 
-static int smiapp_power_off(struct device *dev)
+static int ccs_power_off(struct device *dev)
 {
 	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
-	struct smiapp_sensor *sensor =
-		container_of(ssd, struct smiapp_sensor, ssds[0]);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
+	struct ccs_sensor *sensor =
+		container_of(ssd, struct ccs_sensor, ssds[0]);
 
 	/*
 	 * Currently power/clock to lens are enable/disabled separately
@@ -1420,7 +1419,7 @@ static int smiapp_power_off(struct device *dev)
  * Video stream management
  */
 
-static int smiapp_start_streaming(struct smiapp_sensor *sensor)
+static int ccs_start_streaming(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int binning_mode;
@@ -1454,33 +1453,33 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 		goto out;
 
 	/* Set up PLL */
-	rval = smiapp_pll_configure(sensor);
+	rval = ccs_pll_configure(sensor);
 	if (rval)
 		goto out;
 
 	/* Analog crop start coordinates */
 	rval = ccs_write(sensor, X_ADDR_START,
-			 sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].left);
+			 sensor->pixel_array->crop[CCS_PA_PAD_SRC].left);
 	if (rval < 0)
 		goto out;
 
 	rval = ccs_write(sensor, Y_ADDR_START,
-			 sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].top);
+			 sensor->pixel_array->crop[CCS_PA_PAD_SRC].top);
 	if (rval < 0)
 		goto out;
 
 	/* Analog crop end coordinates */
 	rval = ccs_write(
 		sensor, X_ADDR_END,
-		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].left
-		+ sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].width - 1);
+		sensor->pixel_array->crop[CCS_PA_PAD_SRC].left
+		+ sensor->pixel_array->crop[CCS_PA_PAD_SRC].width - 1);
 	if (rval < 0)
 		goto out;
 
 	rval = ccs_write(
 		sensor, Y_ADDR_END,
-		sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].top
-		+ sensor->pixel_array->crop[SMIAPP_PA_PAD_SRC].height - 1);
+		sensor->pixel_array->crop[CCS_PA_PAD_SRC].top
+		+ sensor->pixel_array->crop[CCS_PA_PAD_SRC].height - 1);
 	if (rval < 0)
 		goto out;
 
@@ -1494,25 +1493,25 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP) {
 		rval = ccs_write(
 			sensor, DIGITAL_CROP_X_OFFSET,
-			sensor->scaler->crop[SMIAPP_PAD_SINK].left);
+			sensor->scaler->crop[CCS_PAD_SINK].left);
 		if (rval < 0)
 			goto out;
 
 		rval = ccs_write(
 			sensor, DIGITAL_CROP_Y_OFFSET,
-			sensor->scaler->crop[SMIAPP_PAD_SINK].top);
+			sensor->scaler->crop[CCS_PAD_SINK].top);
 		if (rval < 0)
 			goto out;
 
 		rval = ccs_write(
 			sensor, DIGITAL_CROP_IMAGE_WIDTH,
-			sensor->scaler->crop[SMIAPP_PAD_SINK].width);
+			sensor->scaler->crop[CCS_PAD_SINK].width);
 		if (rval < 0)
 			goto out;
 
 		rval = ccs_write(
 			sensor, DIGITAL_CROP_IMAGE_HEIGHT,
-			sensor->scaler->crop[SMIAPP_PAD_SINK].height);
+			sensor->scaler->crop[CCS_PAD_SINK].height);
 		if (rval < 0)
 			goto out;
 	}
@@ -1531,11 +1530,11 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 
 	/* Output size from sensor */
 	rval = ccs_write(sensor, X_OUTPUT_SIZE,
-			 sensor->src->crop[SMIAPP_PAD_SRC].width);
+			 sensor->src->crop[CCS_PAD_SRC].width);
 	if (rval < 0)
 		goto out;
 	rval = ccs_write(sensor, Y_OUTPUT_SIZE,
-			 sensor->src->crop[SMIAPP_PAD_SRC].height);
+			 sensor->src->crop[CCS_PAD_SRC].height);
 	if (rval < 0)
 		goto out;
 
@@ -1544,12 +1543,12 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	     SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE) &&
 	    sensor->hwcfg->strobe_setup != NULL &&
 	    sensor->hwcfg->strobe_setup->trigger != 0) {
-		rval = smiapp_setup_flash_strobe(sensor);
+		rval = ccs_setup_flash_strobe(sensor);
 		if (rval)
 			goto out;
 	}
 
-	rval = smiapp_call_quirk(sensor, pre_streamon);
+	rval = ccs_call_quirk(sensor, pre_streamon);
 	if (rval) {
 		dev_err(&client->dev, "pre_streamon quirks failed\n");
 		goto out;
@@ -1563,7 +1562,7 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 	return rval;
 }
 
-static int smiapp_stop_streaming(struct smiapp_sensor *sensor)
+static int ccs_stop_streaming(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
@@ -1573,7 +1572,7 @@ static int smiapp_stop_streaming(struct smiapp_sensor *sensor)
 	if (rval)
 		goto out;
 
-	rval = smiapp_call_quirk(sensor, post_streamoff);
+	rval = ccs_call_quirk(sensor, post_streamoff);
 	if (rval)
 		dev_err(&client->dev, "post_streamoff quirks failed\n");
 
@@ -1586,7 +1585,7 @@ static int smiapp_stop_streaming(struct smiapp_sensor *sensor)
  * V4L2 subdev video operations
  */
 
-static int smiapp_pm_get_init(struct smiapp_sensor *sensor)
+static int ccs_pm_get_init(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
@@ -1610,9 +1609,9 @@ static int smiapp_pm_get_init(struct smiapp_sensor *sensor)
 	return 0;
 }
 
-static int smiapp_set_stream(struct v4l2_subdev *subdev, int enable)
+static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
@@ -1620,7 +1619,7 @@ static int smiapp_set_stream(struct v4l2_subdev *subdev, int enable)
 		return 0;
 
 	if (!enable) {
-		smiapp_stop_streaming(sensor);
+		ccs_stop_streaming(sensor);
 		sensor->streaming = false;
 		pm_runtime_mark_last_busy(&client->dev);
 		pm_runtime_put_autosuspend(&client->dev);
@@ -1628,13 +1627,13 @@ static int smiapp_set_stream(struct v4l2_subdev *subdev, int enable)
 		return 0;
 	}
 
-	rval = smiapp_pm_get_init(sensor);
+	rval = ccs_pm_get_init(sensor);
 	if (rval)
 		return rval;
 
 	sensor->streaming = true;
 
-	rval = smiapp_start_streaming(sensor);
+	rval = ccs_start_streaming(sensor);
 	if (rval < 0) {
 		sensor->streaming = false;
 		pm_runtime_mark_last_busy(&client->dev);
@@ -1644,12 +1643,12 @@ static int smiapp_set_stream(struct v4l2_subdev *subdev, int enable)
 	return rval;
 }
 
-static int smiapp_enum_mbus_code(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_pad_config *cfg,
-				 struct v4l2_subdev_mbus_code_enum *code)
+static int ccs_enum_mbus_code(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	int idx = -1;
 	int rval = -EINVAL;
@@ -1659,7 +1658,7 @@ static int smiapp_enum_mbus_code(struct v4l2_subdev *subdev,
 	dev_err(&client->dev, "subdev %s, pad %d, index %d\n",
 		subdev->name, code->pad, code->index);
 
-	if (subdev != &sensor->src->sd || code->pad != SMIAPP_PAD_SRC) {
+	if (subdev != &sensor->src->sd || code->pad != CCS_PAD_SRC) {
 		if (code->index)
 			goto out;
 
@@ -1668,12 +1667,12 @@ static int smiapp_enum_mbus_code(struct v4l2_subdev *subdev,
 		goto out;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(smiapp_csi_data_formats); i++) {
+	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
 		if (sensor->mbus_frame_fmts & (1 << i))
 			idx++;
 
 		if (idx == code->index) {
-			code->code = smiapp_csi_data_formats[i].code;
+			code->code = ccs_csi_data_formats[i].code;
 			dev_err(&client->dev, "found index %d, i %d, code %x\n",
 				code->index, i, code->code);
 			rval = 0;
@@ -1687,22 +1686,21 @@ static int smiapp_enum_mbus_code(struct v4l2_subdev *subdev,
 	return rval;
 }
 
-static u32 __smiapp_get_mbus_code(struct v4l2_subdev *subdev,
-				  unsigned int pad)
+static u32 __ccs_get_mbus_code(struct v4l2_subdev *subdev, unsigned int pad)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 
-	if (subdev == &sensor->src->sd && pad == SMIAPP_PAD_SRC)
+	if (subdev == &sensor->src->sd && pad == CCS_PAD_SRC)
 		return sensor->csi_format->code;
 	else
 		return sensor->internal_csi_format->code;
 }
 
-static int __smiapp_get_format(struct v4l2_subdev *subdev,
-			       struct v4l2_subdev_pad_config *cfg,
-			       struct v4l2_subdev_format *fmt)
+static int __ccs_get_format(struct v4l2_subdev *subdev,
+			    struct v4l2_subdev_pad_config *cfg,
+			    struct v4l2_subdev_format *fmt)
 {
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		fmt->format = *v4l2_subdev_get_try_format(subdev, cfg,
@@ -1715,7 +1713,7 @@ static int __smiapp_get_format(struct v4l2_subdev *subdev,
 		else
 			r = &ssd->sink_fmt;
 
-		fmt->format.code = __smiapp_get_mbus_code(subdev, fmt->pad);
+		fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
 		fmt->format.width = r->width;
 		fmt->format.height = r->height;
 		fmt->format.field = V4L2_FIELD_NONE;
@@ -1724,26 +1722,26 @@ static int __smiapp_get_format(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int smiapp_get_format(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
-			     struct v4l2_subdev_format *fmt)
+static int ccs_get_format(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int rval;
 
 	mutex_lock(&sensor->mutex);
-	rval = __smiapp_get_format(subdev, cfg, fmt);
+	rval = __ccs_get_format(subdev, cfg, fmt);
 	mutex_unlock(&sensor->mutex);
 
 	return rval;
 }
 
-static void smiapp_get_crop_compose(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_pad_config *cfg,
-				    struct v4l2_rect **crops,
-				    struct v4l2_rect **comps, int which)
+static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_rect **crops,
+				 struct v4l2_rect **comps, int which)
 {
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	unsigned int i;
 
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
@@ -1761,27 +1759,27 @@ static void smiapp_get_crop_compose(struct v4l2_subdev *subdev,
 		}
 		if (comps) {
 			*comps = v4l2_subdev_get_try_compose(subdev, cfg,
-							     SMIAPP_PAD_SINK);
+							     CCS_PAD_SINK);
 			BUG_ON(!*comps);
 		}
 	}
 }
 
 /* Changes require propagation only on sink pad. */
-static void smiapp_propagate(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg, int which,
-			     int target)
+static void ccs_propagate(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_pad_config *cfg, int which,
+			  int target)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
-	struct v4l2_rect *comp, *crops[SMIAPP_PADS];
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
+	struct v4l2_rect *comp, *crops[CCS_PADS];
 
-	smiapp_get_crop_compose(subdev, cfg, crops, &comp, which);
+	ccs_get_crop_compose(subdev, cfg, crops, &comp, which);
 
 	switch (target) {
 	case V4L2_SEL_TGT_CROP:
-		comp->width = crops[SMIAPP_PAD_SINK]->width;
-		comp->height = crops[SMIAPP_PAD_SINK]->height;
+		comp->width = crops[CCS_PAD_SINK]->width;
+		comp->height = crops[CCS_PAD_SINK]->height;
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 			if (ssd == sensor->scaler) {
 				sensor->scale_m =
@@ -1795,40 +1793,40 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
 		}
 		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
-		*crops[SMIAPP_PAD_SRC] = *comp;
+		*crops[CCS_PAD_SRC] = *comp;
 		break;
 	default:
 		BUG();
 	}
 }
 
-static const struct smiapp_csi_data_format
-*smiapp_validate_csi_data_format(struct smiapp_sensor *sensor, u32 code)
+static const struct ccs_csi_data_format
+*ccs_validate_csi_data_format(struct ccs_sensor *sensor, u32 code)
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(smiapp_csi_data_formats); i++) {
-		if (sensor->mbus_frame_fmts & (1 << i)
-		    && smiapp_csi_data_formats[i].code == code)
-			return &smiapp_csi_data_formats[i];
+	for (i = 0; i < ARRAY_SIZE(ccs_csi_data_formats); i++) {
+		if (sensor->mbus_frame_fmts & (1 << i) &&
+		    ccs_csi_data_formats[i].code == code)
+			return &ccs_csi_data_formats[i];
 	}
 
 	return sensor->csi_format;
 }
 
-static int smiapp_set_format_source(struct v4l2_subdev *subdev,
-				    struct v4l2_subdev_pad_config *cfg,
-				    struct v4l2_subdev_format *fmt)
+static int ccs_set_format_source(struct v4l2_subdev *subdev,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_format *fmt)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	const struct smiapp_csi_data_format *csi_format,
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	const struct ccs_csi_data_format *csi_format,
 		*old_csi_format = sensor->csi_format;
 	unsigned long *valid_link_freqs;
 	u32 code = fmt->format.code;
 	unsigned int i;
 	int rval;
 
-	rval = __smiapp_get_format(subdev, cfg, fmt);
+	rval = __ccs_get_format(subdev, cfg, fmt);
 	if (rval)
 		return rval;
 
@@ -1839,7 +1837,7 @@ static int smiapp_set_format_source(struct v4l2_subdev *subdev,
 	if (subdev != &sensor->src->sd)
 		return 0;
 
-	csi_format = smiapp_validate_csi_data_format(sensor, code);
+	csi_format = ccs_validate_csi_data_format(sensor, code);
 
 	fmt->format.code = csi_format->code;
 
@@ -1866,23 +1864,23 @@ static int smiapp_set_format_source(struct v4l2_subdev *subdev,
 		__fls(*valid_link_freqs), ~*valid_link_freqs,
 		__ffs(*valid_link_freqs));
 
-	return smiapp_pll_update(sensor);
+	return ccs_pll_update(sensor);
 }
 
-static int smiapp_set_format(struct v4l2_subdev *subdev,
-			     struct v4l2_subdev_pad_config *cfg,
-			     struct v4l2_subdev_format *fmt)
+static int ccs_set_format(struct v4l2_subdev *subdev,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
-	struct v4l2_rect *crops[SMIAPP_PADS];
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
+	struct v4l2_rect *crops[CCS_PADS];
 
 	mutex_lock(&sensor->mutex);
 
 	if (fmt->pad == ssd->source_pad) {
 		int rval;
 
-		rval = smiapp_set_format_source(subdev, cfg, fmt);
+		rval = ccs_set_format_source(subdev, cfg, fmt);
 
 		mutex_unlock(&sensor->mutex);
 
@@ -1890,7 +1888,7 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 	}
 
 	/* Sink pad. Width and height are changeable here. */
-	fmt->format.code = __smiapp_get_mbus_code(subdev, fmt->pad);
+	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
 	fmt->format.width &= ~1;
 	fmt->format.height &= ~1;
 	fmt->format.field = V4L2_FIELD_NONE;
@@ -1904,7 +1902,7 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
-	smiapp_get_crop_compose(subdev, cfg, crops, NULL, fmt->which);
+	ccs_get_crop_compose(subdev, cfg, crops, NULL, fmt->which);
 
 	crops[ssd->sink_pad]->left = 0;
 	crops[ssd->sink_pad]->top = 0;
@@ -1912,8 +1910,7 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 	crops[ssd->sink_pad]->height = fmt->format.height;
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		ssd->sink_fmt = *crops[ssd->sink_pad];
-	smiapp_propagate(subdev, cfg, fmt->which,
-			 V4L2_SEL_TGT_CROP);
+	ccs_propagate(subdev, cfg, fmt->which, V4L2_SEL_TGT_CROP);
 
 	mutex_unlock(&sensor->mutex);
 
@@ -1929,7 +1926,7 @@ static int smiapp_set_format(struct v4l2_subdev *subdev,
 static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
 			    int h, int ask_h, u32 flags)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
 	int val = 0;
 
@@ -1964,27 +1961,27 @@ static int scaling_goodness(struct v4l2_subdev *subdev, int w, int ask_w,
 	return val;
 }
 
-static void smiapp_set_compose_binner(struct v4l2_subdev *subdev,
-				      struct v4l2_subdev_pad_config *cfg,
-				      struct v4l2_subdev_selection *sel,
-				      struct v4l2_rect **crops,
-				      struct v4l2_rect *comp)
+static void ccs_set_compose_binner(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_selection *sel,
+				   struct v4l2_rect **crops,
+				   struct v4l2_rect *comp)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 	unsigned int binh = 1, binv = 1;
 	int best = scaling_goodness(
 		subdev,
-		crops[SMIAPP_PAD_SINK]->width, sel->r.width,
-		crops[SMIAPP_PAD_SINK]->height, sel->r.height, sel->flags);
+		crops[CCS_PAD_SINK]->width, sel->r.width,
+		crops[CCS_PAD_SINK]->height, sel->r.height, sel->flags);
 
 	for (i = 0; i < sensor->nbinning_subtypes; i++) {
 		int this = scaling_goodness(
 			subdev,
-			crops[SMIAPP_PAD_SINK]->width
+			crops[CCS_PAD_SINK]->width
 			/ sensor->binning_subtypes[i].horizontal,
 			sel->r.width,
-			crops[SMIAPP_PAD_SINK]->height
+			crops[CCS_PAD_SINK]->height
 			/ sensor->binning_subtypes[i].vertical,
 			sel->r.height, sel->flags);
 
@@ -1999,8 +1996,8 @@ static void smiapp_set_compose_binner(struct v4l2_subdev *subdev,
 		sensor->binning_horizontal = binh;
 	}
 
-	sel->r.width = (crops[SMIAPP_PAD_SINK]->width / binh) & ~1;
-	sel->r.height = (crops[SMIAPP_PAD_SINK]->height / binv) & ~1;
+	sel->r.width = (crops[CCS_PAD_SINK]->width / binh) & ~1;
+	sel->r.height = (crops[CCS_PAD_SINK]->height / binv) & ~1;
 }
 
 /*
@@ -2012,14 +2009,14 @@ static void smiapp_set_compose_binner(struct v4l2_subdev *subdev,
  * Also try whether horizontal scaler or full scaler gives a better
  * result.
  */
-static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
-				      struct v4l2_subdev_pad_config *cfg,
-				      struct v4l2_subdev_selection *sel,
-				      struct v4l2_rect **crops,
-				      struct v4l2_rect *comp)
+static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_selection *sel,
+				   struct v4l2_rect **crops,
+				   struct v4l2_rect *comp)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	u32 min, max, a, b, max_m;
 	u32 scale_m = CCS_LIM(sensor, SCALER_N_MIN);
 	int mode = CCS_SCALING_MODE_HORIZONTAL;
@@ -2029,15 +2026,15 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	int best = INT_MIN;
 
 	sel->r.width = min_t(unsigned int, sel->r.width,
-			     crops[SMIAPP_PAD_SINK]->width);
+			     crops[CCS_PAD_SINK]->width);
 	sel->r.height = min_t(unsigned int, sel->r.height,
-			      crops[SMIAPP_PAD_SINK]->height);
+			      crops[CCS_PAD_SINK]->height);
 
-	a = crops[SMIAPP_PAD_SINK]->width
+	a = crops[CCS_PAD_SINK]->width
 		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.width;
-	b = crops[SMIAPP_PAD_SINK]->height
+	b = crops[CCS_PAD_SINK]->height
 		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
-	max_m = crops[SMIAPP_PAD_SINK]->width
+	max_m = crops[CCS_PAD_SINK]->width
 		* CCS_LIM(sensor, SCALER_N_MIN)
 		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
 
@@ -2071,10 +2068,10 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	for (i = 0; i < ntry; i++) {
 		int this = scaling_goodness(
 			subdev,
-			crops[SMIAPP_PAD_SINK]->width
+			crops[CCS_PAD_SINK]->width
 			/ try[i] * CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
-			crops[SMIAPP_PAD_SINK]->height,
+			crops[CCS_PAD_SINK]->height,
 			sel->r.height,
 			sel->flags);
 
@@ -2091,11 +2088,11 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 			continue;
 
 		this = scaling_goodness(
-			subdev, crops[SMIAPP_PAD_SINK]->width
+			subdev, crops[CCS_PAD_SINK]->width
 			/ try[i]
 			* CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.width,
-			crops[SMIAPP_PAD_SINK]->height
+			crops[CCS_PAD_SINK]->height
 			/ try[i]
 			* CCS_LIM(sensor, SCALER_N_MIN),
 			sel->r.height,
@@ -2109,17 +2106,17 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	}
 
 	sel->r.width =
-		(crops[SMIAPP_PAD_SINK]->width
+		(crops[CCS_PAD_SINK]->width
 		 / scale_m
 		 * CCS_LIM(sensor, SCALER_N_MIN)) & ~1;
 	if (mode == SMIAPP_SCALING_MODE_BOTH)
 		sel->r.height =
-			(crops[SMIAPP_PAD_SINK]->height
+			(crops[CCS_PAD_SINK]->height
 			 / scale_m
 			 * CCS_LIM(sensor, SCALER_N_MIN))
 			& ~1;
 	else
-		sel->r.height = crops[SMIAPP_PAD_SINK]->height;
+		sel->r.height = crops[CCS_PAD_SINK]->height;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		sensor->scale_m = scale_m;
@@ -2127,57 +2124,54 @@ static void smiapp_set_compose_scaler(struct v4l2_subdev *subdev,
 	}
 }
 /* We're only called on source pads. This function sets scaling. */
-static int smiapp_set_compose(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_pad_config *cfg,
-			      struct v4l2_subdev_selection *sel)
+static int ccs_set_compose(struct v4l2_subdev *subdev,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_selection *sel)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
-	struct v4l2_rect *comp, *crops[SMIAPP_PADS];
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
+	struct v4l2_rect *comp, *crops[CCS_PADS];
 
-	smiapp_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
+	ccs_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
 
 	sel->r.top = 0;
 	sel->r.left = 0;
 
 	if (ssd == sensor->binner)
-		smiapp_set_compose_binner(subdev, cfg, sel, crops, comp);
+		ccs_set_compose_binner(subdev, cfg, sel, crops, comp);
 	else
-		smiapp_set_compose_scaler(subdev, cfg, sel, crops, comp);
+		ccs_set_compose_scaler(subdev, cfg, sel, crops, comp);
 
 	*comp = sel->r;
-	smiapp_propagate(subdev, cfg, sel->which, V4L2_SEL_TGT_COMPOSE);
+	ccs_propagate(subdev, cfg, sel->which, V4L2_SEL_TGT_COMPOSE);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		return smiapp_pll_blanking_update(sensor);
+		return ccs_pll_blanking_update(sensor);
 
 	return 0;
 }
 
-static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_selection *sel)
+static int __ccs_sel_supported(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_selection *sel)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 
 	/* We only implement crop in three places. */
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		if (ssd == sensor->pixel_array
-		    && sel->pad == SMIAPP_PA_PAD_SRC)
+		if (ssd == sensor->pixel_array && sel->pad == CCS_PA_PAD_SRC)
 			return 0;
-		if (ssd == sensor->src
-		    && sel->pad == SMIAPP_PAD_SRC)
+		if (ssd == sensor->src && sel->pad == CCS_PAD_SRC)
 			return 0;
-		if (ssd == sensor->scaler && sel->pad == SMIAPP_PAD_SINK &&
+		if (ssd == sensor->scaler && sel->pad == CCS_PAD_SINK &&
 		    CCS_LIM(sensor, DIGITAL_CROP_CAPABILITY)
 		    == CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP)
 			return 0;
 		return -EINVAL;
 	case V4L2_SEL_TGT_NATIVE_SIZE:
-		if (ssd == sensor->pixel_array
-		    && sel->pad == SMIAPP_PA_PAD_SRC)
+		if (ssd == sensor->pixel_array && sel->pad == CCS_PA_PAD_SRC)
 			return 0;
 		return -EINVAL;
 	case V4L2_SEL_TGT_COMPOSE:
@@ -2195,16 +2189,16 @@ static int __smiapp_sel_supported(struct v4l2_subdev *subdev,
 	}
 }
 
-static int smiapp_set_crop(struct v4l2_subdev *subdev,
-			   struct v4l2_subdev_pad_config *cfg,
-			   struct v4l2_subdev_selection *sel)
+static int ccs_set_crop(struct v4l2_subdev *subdev,
+			struct v4l2_subdev_pad_config *cfg,
+			struct v4l2_subdev_selection *sel)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
-	struct v4l2_rect *src_size, *crops[SMIAPP_PADS];
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
+	struct v4l2_rect *src_size, *crops[CCS_PADS];
 	struct v4l2_rect _r;
 
-	smiapp_get_crop_compose(subdev, cfg, crops, NULL, sel->which);
+	ccs_get_crop_compose(subdev, cfg, crops, NULL, sel->which);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		if (sel->pad == ssd->sink_pad)
@@ -2226,7 +2220,7 @@ static int smiapp_set_crop(struct v4l2_subdev *subdev,
 		}
 	}
 
-	if (ssd == sensor->src && sel->pad == SMIAPP_PAD_SRC) {
+	if (ssd == sensor->src && sel->pad == CCS_PAD_SRC) {
 		sel->r.left = 0;
 		sel->r.top = 0;
 	}
@@ -2239,15 +2233,13 @@ static int smiapp_set_crop(struct v4l2_subdev *subdev,
 
 	*crops[sel->pad] = sel->r;
 
-	if (ssd != sensor->pixel_array && sel->pad == SMIAPP_PAD_SINK)
-		smiapp_propagate(subdev, cfg, sel->which,
-				 V4L2_SEL_TGT_CROP);
+	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
+		ccs_propagate(subdev, cfg, sel->which, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
 
-static void smiapp_get_native_size(struct smiapp_subdev *ssd,
-				    struct v4l2_rect *r)
+static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
 {
 	r->top = 0;
 	r->left = 0;
@@ -2255,21 +2247,21 @@ static void smiapp_get_native_size(struct smiapp_subdev *ssd,
 	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
 }
 
-static int __smiapp_get_selection(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_pad_config *cfg,
-				  struct v4l2_subdev_selection *sel)
+static int __ccs_get_selection(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_selection *sel)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	struct smiapp_subdev *ssd = to_smiapp_subdev(subdev);
-	struct v4l2_rect *comp, *crops[SMIAPP_PADS];
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
+	struct v4l2_rect *comp, *crops[CCS_PADS];
 	struct v4l2_rect sink_fmt;
 	int ret;
 
-	ret = __smiapp_sel_supported(subdev, sel);
+	ret = __ccs_sel_supported(subdev, sel);
 	if (ret)
 		return ret;
 
-	smiapp_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
+	ccs_get_crop_compose(subdev, cfg, crops, &comp, sel->which);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		sink_fmt = ssd->sink_fmt;
@@ -2287,7 +2279,7 @@ static int __smiapp_get_selection(struct v4l2_subdev *subdev,
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_NATIVE_SIZE:
 		if (ssd == sensor->pixel_array)
-			smiapp_get_native_size(ssd, &sel->r);
+			ccs_get_native_size(ssd, &sel->r);
 		else if (sel->pad == ssd->sink_pad)
 			sel->r = sink_fmt;
 		else
@@ -2305,27 +2297,28 @@ static int __smiapp_get_selection(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int smiapp_get_selection(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
-				struct v4l2_subdev_selection *sel)
+static int ccs_get_selection(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_selection *sel)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int rval;
 
 	mutex_lock(&sensor->mutex);
-	rval = __smiapp_get_selection(subdev, cfg, sel);
+	rval = __ccs_get_selection(subdev, cfg, sel);
 	mutex_unlock(&sensor->mutex);
 
 	return rval;
 }
-static int smiapp_set_selection(struct v4l2_subdev *subdev,
-				struct v4l2_subdev_pad_config *cfg,
-				struct v4l2_subdev_selection *sel)
+
+static int ccs_set_selection(struct v4l2_subdev *subdev,
+			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_selection *sel)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int ret;
 
-	ret = __smiapp_sel_supported(subdev, sel);
+	ret = __ccs_sel_supported(subdev, sel);
 	if (ret)
 		return ret;
 
@@ -2333,8 +2326,8 @@ static int smiapp_set_selection(struct v4l2_subdev *subdev,
 
 	sel->r.left = max(0, sel->r.left & ~1);
 	sel->r.top = max(0, sel->r.top & ~1);
-	sel->r.width = SMIAPP_ALIGN_DIM(sel->r.width, sel->flags);
-	sel->r.height =	SMIAPP_ALIGN_DIM(sel->r.height, sel->flags);
+	sel->r.width = CCS_ALIGN_DIM(sel->r.width, sel->flags);
+	sel->r.height =	CCS_ALIGN_DIM(sel->r.height, sel->flags);
 
 	sel->r.width = max_t(unsigned int,
 			     CCS_LIM(sensor, MIN_X_OUTPUT_SIZE),
@@ -2345,10 +2338,10 @@ static int smiapp_set_selection(struct v4l2_subdev *subdev,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		ret = smiapp_set_crop(subdev, cfg, sel);
+		ret = ccs_set_crop(subdev, cfg, sel);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		ret = smiapp_set_compose(subdev, cfg, sel);
+		ret = ccs_set_compose(subdev, cfg, sel);
 		break;
 	default:
 		ret = -EINVAL;
@@ -2358,17 +2351,17 @@ static int smiapp_set_selection(struct v4l2_subdev *subdev,
 	return ret;
 }
 
-static int smiapp_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
+static int ccs_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 
 	*frames = sensor->frame_skip;
 	return 0;
 }
 
-static int smiapp_get_skip_top_lines(struct v4l2_subdev *subdev, u32 *lines)
+static int ccs_get_skip_top_lines(struct v4l2_subdev *subdev, u32 *lines)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 
 	*lines = sensor->image_start;
 
@@ -2380,22 +2373,22 @@ static int smiapp_get_skip_top_lines(struct v4l2_subdev *subdev, u32 *lines)
  */
 
 static ssize_t
-smiapp_sysfs_nvm_read(struct device *dev, struct device_attribute *attr,
-		      char *buf)
+ccs_sysfs_nvm_read(struct device *dev, struct device_attribute *attr,
+		   char *buf)
 {
 	struct v4l2_subdev *subdev = i2c_get_clientdata(to_i2c_client(dev));
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int rval;
 
 	if (!sensor->dev_init_done)
 		return -EBUSY;
 
-	rval = smiapp_pm_get_init(sensor);
+	rval = ccs_pm_get_init(sensor);
 	if (rval < 0)
 		return -ENODEV;
 
-	rval = smiapp_read_nvm(sensor, buf, PAGE_SIZE);
+	rval = ccs_read_nvm(sensor, buf, PAGE_SIZE);
 	if (rval < 0) {
 		pm_runtime_put(&client->dev);
 		dev_err(&client->dev, "nvm read failed\n");
@@ -2411,15 +2404,15 @@ smiapp_sysfs_nvm_read(struct device *dev, struct device_attribute *attr,
 	 */
 	return rval;
 }
-static DEVICE_ATTR(nvm, S_IRUGO, smiapp_sysfs_nvm_read, NULL);
+static DEVICE_ATTR(nvm, S_IRUGO, ccs_sysfs_nvm_read, NULL);
 
 static ssize_t
-smiapp_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
-			char *buf)
+ccs_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
+		     char *buf)
 {
 	struct v4l2_subdev *subdev = i2c_get_clientdata(to_i2c_client(dev));
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
-	struct smiapp_module_info *minfo = &sensor->minfo;
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
+	struct ccs_module_info *minfo = &sensor->minfo;
 
 	if (minfo->mipi_manufacturer_id)
 		return snprintf(buf, PAGE_SIZE, "%4.4x%4.4x%2.2x\n",
@@ -2431,16 +2424,16 @@ smiapp_sysfs_ident_read(struct device *dev, struct device_attribute *attr,
 				minfo->revision_number_major) + 1;
 }
 
-static DEVICE_ATTR(ident, S_IRUGO, smiapp_sysfs_ident_read, NULL);
+static DEVICE_ATTR(ident, S_IRUGO, ccs_sysfs_ident_read, NULL);
 
 /* -----------------------------------------------------------------------------
  * V4L2 subdev core operations
  */
 
-static int smiapp_identify_module(struct smiapp_sensor *sensor)
+static int ccs_identify_module(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	struct smiapp_module_info *minfo = &sensor->minfo;
+	struct ccs_module_info *minfo = &sensor->minfo;
 	unsigned int i;
 	int rval = 0;
 
@@ -2558,34 +2551,34 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 		minfo->revision_number_major = minfo->sensor_revision_number;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(smiapp_module_idents); i++) {
-		if (smiapp_module_idents[i].mipi_manufacturer_id &&
-		    smiapp_module_idents[i].mipi_manufacturer_id
+	for (i = 0; i < ARRAY_SIZE(ccs_module_idents); i++) {
+		if (ccs_module_idents[i].mipi_manufacturer_id &&
+		    ccs_module_idents[i].mipi_manufacturer_id
 		    != minfo->mipi_manufacturer_id)
 			continue;
-		if (smiapp_module_idents[i].smia_manufacturer_id &&
-		    smiapp_module_idents[i].smia_manufacturer_id
+		if (ccs_module_idents[i].smia_manufacturer_id &&
+		    ccs_module_idents[i].smia_manufacturer_id
 		    != minfo->smia_manufacturer_id)
 			continue;
-		if (smiapp_module_idents[i].model_id != minfo->model_id)
+		if (ccs_module_idents[i].model_id != minfo->model_id)
 			continue;
-		if (smiapp_module_idents[i].flags
-		    & SMIAPP_MODULE_IDENT_FLAG_REV_LE) {
-			if (smiapp_module_idents[i].revision_number_major
+		if (ccs_module_idents[i].flags
+		    & CCS_MODULE_IDENT_FLAG_REV_LE) {
+			if (ccs_module_idents[i].revision_number_major
 			    < minfo->revision_number_major)
 				continue;
 		} else {
-			if (smiapp_module_idents[i].revision_number_major
+			if (ccs_module_idents[i].revision_number_major
 			    != minfo->revision_number_major)
 				continue;
 		}
 
-		minfo->name = smiapp_module_idents[i].name;
-		minfo->quirk = smiapp_module_idents[i].quirk;
+		minfo->name = ccs_module_idents[i].name;
+		minfo->quirk = ccs_module_idents[i].quirk;
 		break;
 	}
 
-	if (i >= ARRAY_SIZE(smiapp_module_idents))
+	if (i >= ARRAY_SIZE(ccs_module_idents))
 		dev_warn(&client->dev,
 			 "no quirks for this module; let's hope it's fully compliant\n");
 
@@ -2595,14 +2588,14 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 	return 0;
 }
 
-static const struct v4l2_subdev_ops smiapp_ops;
-static const struct v4l2_subdev_internal_ops smiapp_internal_ops;
-static const struct media_entity_operations smiapp_entity_ops;
+static const struct v4l2_subdev_ops ccs_ops;
+static const struct v4l2_subdev_internal_ops ccs_internal_ops;
+static const struct media_entity_operations ccs_entity_ops;
 
-static int smiapp_register_subdev(struct smiapp_sensor *sensor,
-				  struct smiapp_subdev *ssd,
-				  struct smiapp_subdev *sink_ssd,
-				  u16 source_pad, u16 sink_pad, u32 link_flags)
+static int ccs_register_subdev(struct ccs_sensor *sensor,
+			       struct ccs_subdev *ssd,
+			       struct ccs_subdev *sink_ssd,
+			       u16 source_pad, u16 sink_pad, u32 link_flags)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
@@ -2639,57 +2632,58 @@ static int smiapp_register_subdev(struct smiapp_sensor *sensor,
 	return 0;
 }
 
-static void smiapp_unregistered(struct v4l2_subdev *subdev)
+static void ccs_unregistered(struct v4l2_subdev *subdev)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 
 	for (i = 1; i < sensor->ssds_used; i++)
 		v4l2_device_unregister_subdev(&sensor->ssds[i].sd);
 }
 
-static int smiapp_registered(struct v4l2_subdev *subdev)
+static int ccs_registered(struct v4l2_subdev *subdev)
 {
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int rval;
 
 	if (sensor->scaler) {
-		rval = smiapp_register_subdev(
-			sensor, sensor->binner, sensor->scaler,
-			SMIAPP_PAD_SRC, SMIAPP_PAD_SINK,
-			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+		rval = ccs_register_subdev(sensor, sensor->binner,
+					   sensor->scaler,
+					   CCS_PAD_SRC, CCS_PAD_SINK,
+					   MEDIA_LNK_FL_ENABLED |
+					   MEDIA_LNK_FL_IMMUTABLE);
 		if (rval < 0)
 			return rval;
 	}
 
-	rval = smiapp_register_subdev(
-		sensor, sensor->pixel_array, sensor->binner,
-		SMIAPP_PA_PAD_SRC, SMIAPP_PAD_SINK,
-		MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+	rval = ccs_register_subdev(sensor, sensor->pixel_array, sensor->binner,
+				   CCS_PA_PAD_SRC, CCS_PAD_SINK,
+				   MEDIA_LNK_FL_ENABLED |
+				   MEDIA_LNK_FL_IMMUTABLE);
 	if (rval)
 		goto out_err;
 
 	return 0;
 
 out_err:
-	smiapp_unregistered(subdev);
+	ccs_unregistered(subdev);
 
 	return rval;
 }
 
-static void smiapp_cleanup(struct smiapp_sensor *sensor)
+static void ccs_cleanup(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 
 	device_remove_file(&client->dev, &dev_attr_nvm);
 	device_remove_file(&client->dev, &dev_attr_ident);
 
-	smiapp_free_controls(sensor);
+	ccs_free_controls(sensor);
 }
 
-static void smiapp_create_subdev(struct smiapp_sensor *sensor,
-				 struct smiapp_subdev *ssd, const char *name,
-				 unsigned short num_pads)
+static void ccs_create_subdev(struct ccs_sensor *sensor,
+			      struct ccs_subdev *ssd, const char *name,
+			      unsigned short num_pads)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 
@@ -2697,7 +2691,7 @@ static void smiapp_create_subdev(struct smiapp_sensor *sensor,
 		return;
 
 	if (ssd != sensor->src)
-		v4l2_subdev_init(&ssd->sd, &smiapp_ops);
+		v4l2_subdev_init(&ssd->sd, &ccs_ops);
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ssd->sensor = sensor;
@@ -2707,7 +2701,7 @@ static void smiapp_create_subdev(struct smiapp_sensor *sensor,
 
 	v4l2_i2c_subdev_set_name(&ssd->sd, client, sensor->minfo.name, name);
 
-	smiapp_get_native_size(ssd, &ssd->sink_fmt);
+	ccs_get_native_size(ssd, &ssd->sink_fmt);
 
 	ssd->compose.width = ssd->sink_fmt.width;
 	ssd->compose.height = ssd->sink_fmt.height;
@@ -2718,21 +2712,21 @@ static void smiapp_create_subdev(struct smiapp_sensor *sensor,
 		ssd->pads[ssd->sink_pad].flags = MEDIA_PAD_FL_SINK;
 	}
 
-	ssd->sd.entity.ops = &smiapp_entity_ops;
+	ssd->sd.entity.ops = &ccs_entity_ops;
 
 	if (ssd == sensor->src)
 		return;
 
-	ssd->sd.internal_ops = &smiapp_internal_ops;
+	ssd->sd.internal_ops = &ccs_internal_ops;
 	ssd->sd.owner = THIS_MODULE;
 	ssd->sd.dev = &client->dev;
 	v4l2_set_subdevdata(&ssd->sd, client);
 }
 
-static int smiapp_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct smiapp_subdev *ssd = to_smiapp_subdev(sd);
-	struct smiapp_sensor *sensor = ssd->sensor;
+	struct ccs_subdev *ssd = to_ccs_subdev(sd);
+	struct ccs_sensor *sensor = ssd->sensor;
 	unsigned int i;
 
 	mutex_lock(&sensor->mutex);
@@ -2744,7 +2738,7 @@ static int smiapp_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 			v4l2_subdev_get_try_crop(sd, fh->pad, i);
 		struct v4l2_rect *try_comp;
 
-		smiapp_get_native_size(ssd, try_crop);
+		ccs_get_native_size(ssd, try_crop);
 
 		try_fmt->width = try_crop->width;
 		try_fmt->height = try_crop->height;
@@ -2763,52 +2757,52 @@ static int smiapp_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	return 0;
 }
 
-static const struct v4l2_subdev_video_ops smiapp_video_ops = {
-	.s_stream = smiapp_set_stream,
+static const struct v4l2_subdev_video_ops ccs_video_ops = {
+	.s_stream = ccs_set_stream,
 };
 
-static const struct v4l2_subdev_pad_ops smiapp_pad_ops = {
-	.enum_mbus_code = smiapp_enum_mbus_code,
-	.get_fmt = smiapp_get_format,
-	.set_fmt = smiapp_set_format,
-	.get_selection = smiapp_get_selection,
-	.set_selection = smiapp_set_selection,
+static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
+	.enum_mbus_code = ccs_enum_mbus_code,
+	.get_fmt = ccs_get_format,
+	.set_fmt = ccs_set_format,
+	.get_selection = ccs_get_selection,
+	.set_selection = ccs_set_selection,
 };
 
-static const struct v4l2_subdev_sensor_ops smiapp_sensor_ops = {
-	.g_skip_frames = smiapp_get_skip_frames,
-	.g_skip_top_lines = smiapp_get_skip_top_lines,
+static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
+	.g_skip_frames = ccs_get_skip_frames,
+	.g_skip_top_lines = ccs_get_skip_top_lines,
 };
 
-static const struct v4l2_subdev_ops smiapp_ops = {
-	.video = &smiapp_video_ops,
-	.pad = &smiapp_pad_ops,
-	.sensor = &smiapp_sensor_ops,
+static const struct v4l2_subdev_ops ccs_ops = {
+	.video = &ccs_video_ops,
+	.pad = &ccs_pad_ops,
+	.sensor = &ccs_sensor_ops,
 };
 
-static const struct media_entity_operations smiapp_entity_ops = {
+static const struct media_entity_operations ccs_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static const struct v4l2_subdev_internal_ops smiapp_internal_src_ops = {
-	.registered = smiapp_registered,
-	.unregistered = smiapp_unregistered,
-	.open = smiapp_open,
+static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
+	.registered = ccs_registered,
+	.unregistered = ccs_unregistered,
+	.open = ccs_open,
 };
 
-static const struct v4l2_subdev_internal_ops smiapp_internal_ops = {
-	.open = smiapp_open,
+static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
+	.open = ccs_open,
 };
 
 /* -----------------------------------------------------------------------------
  * I2C Driver
  */
 
-static int __maybe_unused smiapp_suspend(struct device *dev)
+static int __maybe_unused ccs_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	bool streaming = sensor->streaming;
 	int rval;
 
@@ -2821,7 +2815,7 @@ static int __maybe_unused smiapp_suspend(struct device *dev)
 	}
 
 	if (sensor->streaming)
-		smiapp_stop_streaming(sensor);
+		ccs_stop_streaming(sensor);
 
 	/* save state for resume */
 	sensor->streaming = streaming;
@@ -2829,24 +2823,24 @@ static int __maybe_unused smiapp_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused smiapp_resume(struct device *dev)
+static int __maybe_unused ccs_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	int rval = 0;
 
 	pm_runtime_put(dev);
 
 	if (sensor->streaming)
-		rval = smiapp_start_streaming(sensor);
+		rval = ccs_start_streaming(sensor);
 
 	return rval;
 }
 
-static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
+static struct ccs_hwconfig *ccs_get_hwconfig(struct device *dev)
 {
-	struct smiapp_hwconfig *hwcfg;
+	struct ccs_hwconfig *hwcfg;
 	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
@@ -2898,7 +2892,7 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
 		switch (rotation) {
 		case 180:
 			hwcfg->module_board_orient =
-				SMIAPP_MODULE_BOARD_ORIENT_180;
+				CCS_MODULE_BOARD_ORIENT_180;
 			fallthrough;
 		case 0:
 			break;
@@ -2942,10 +2936,10 @@ static struct smiapp_hwconfig *smiapp_get_hwconfig(struct device *dev)
 	return NULL;
 }
 
-static int smiapp_probe(struct i2c_client *client)
+static int ccs_probe(struct i2c_client *client)
 {
-	struct smiapp_sensor *sensor;
-	struct smiapp_hwconfig *hwcfg = smiapp_get_hwconfig(&client->dev);
+	struct ccs_sensor *sensor;
+	struct ccs_hwconfig *hwcfg = ccs_get_hwconfig(&client->dev);
 	unsigned int i;
 	int rval;
 
@@ -2959,8 +2953,8 @@ static int smiapp_probe(struct i2c_client *client)
 	sensor->hwcfg = hwcfg;
 	sensor->src = &sensor->ssds[sensor->ssds_used];
 
-	v4l2_i2c_subdev_init(&sensor->src->sd, client, &smiapp_ops);
-	sensor->src->sd.internal_ops = &smiapp_internal_src_ops;
+	v4l2_i2c_subdev_init(&sensor->src->sd, client, &ccs_ops);
+	sensor->src->sd.internal_ops = &ccs_internal_src_ops;
 
 	sensor->vana = devm_regulator_get(&client->dev, "vana");
 	if (IS_ERR(sensor->vana)) {
@@ -3016,13 +3010,13 @@ static int smiapp_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->xshutdown))
 		return PTR_ERR(sensor->xshutdown);
 
-	rval = smiapp_power_on(&client->dev);
+	rval = ccs_power_on(&client->dev);
 	if (rval < 0)
 		return rval;
 
 	mutex_init(&sensor->mutex);
 
-	rval = smiapp_identify_module(sensor);
+	rval = ccs_identify_module(sensor);
 	if (rval) {
 		rval = -ENODEV;
 		goto out_power_off;
@@ -3032,7 +3026,7 @@ static int smiapp_probe(struct i2c_client *client)
 	if (rval)
 		goto out_power_off;
 
-	rval = smiapp_read_frame_fmt(sensor);
+	rval = ccs_read_frame_fmt(sensor);
 	if (rval) {
 		rval = -ENODEV;
 		goto out_free_ccs_limits;
@@ -3044,7 +3038,7 @@ static int smiapp_probe(struct i2c_client *client)
 	 * The application of H-FLIP and V-FLIP on the sensor is modified by
 	 * the sensor orientation on the board.
 	 *
-	 * For SMIAPP_BOARD_SENSOR_ORIENT_180 the default behaviour is to set
+	 * For CCS_BOARD_SENSOR_ORIENT_180 the default behaviour is to set
 	 * both H-FLIP and V-FLIP for normal operation which also implies
 	 * that a set/unset operation for user space HFLIP and VFLIP v4l2
 	 * controls will need to be internally inverted.
@@ -3052,12 +3046,12 @@ static int smiapp_probe(struct i2c_client *client)
 	 * Rotation also changes the bayer pattern.
 	 */
 	if (sensor->hwcfg->module_board_orient ==
-	    SMIAPP_MODULE_BOARD_ORIENT_180)
+	    CCS_MODULE_BOARD_ORIENT_180)
 		sensor->hvflip_inv_mask =
 			CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR |
 			CCS_IMAGE_ORIENTATION_VERTICAL_FLIP;
 
-	rval = smiapp_call_quirk(sensor, limits);
+	rval = ccs_call_quirk(sensor, limits);
 	if (rval) {
 		dev_err(&client->dev, "limits quirks failed\n");
 		goto out_free_ccs_limits;
@@ -3136,36 +3130,36 @@ static int smiapp_probe(struct i2c_client *client)
 	if (sensor->minfo.smiapp_profile == SMIAPP_PROFILE_0)
 		sensor->pll.flags |= SMIAPP_PLL_FLAG_NO_OP_CLOCKS;
 
-	smiapp_create_subdev(sensor, sensor->scaler, " scaler", 2);
-	smiapp_create_subdev(sensor, sensor->binner, " binner", 2);
-	smiapp_create_subdev(sensor, sensor->pixel_array, " pixel_array", 1);
+	ccs_create_subdev(sensor, sensor->scaler, " scaler", 2);
+	ccs_create_subdev(sensor, sensor->binner, " binner", 2);
+	ccs_create_subdev(sensor, sensor->pixel_array, " pixel_array", 1);
 
 	dev_dbg(&client->dev, "profile %d\n", sensor->minfo.smiapp_profile);
 
 	sensor->pixel_array->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	rval = smiapp_init_controls(sensor);
+	rval = ccs_init_controls(sensor);
 	if (rval < 0)
 		goto out_cleanup;
 
-	rval = smiapp_call_quirk(sensor, init);
+	rval = ccs_call_quirk(sensor, init);
 	if (rval)
 		goto out_cleanup;
 
-	rval = smiapp_get_mbus_formats(sensor);
+	rval = ccs_get_mbus_formats(sensor);
 	if (rval) {
 		rval = -ENODEV;
 		goto out_cleanup;
 	}
 
-	rval = smiapp_init_late_controls(sensor);
+	rval = ccs_init_late_controls(sensor);
 	if (rval) {
 		rval = -ENODEV;
 		goto out_cleanup;
 	}
 
 	mutex_lock(&sensor->mutex);
-	rval = smiapp_pll_blanking_update(sensor);
+	rval = ccs_pll_blanking_update(sensor);
 	mutex_unlock(&sensor->mutex);
 	if (rval) {
 		dev_err(&client->dev, "update mode failed\n");
@@ -3202,71 +3196,71 @@ static int smiapp_probe(struct i2c_client *client)
 	media_entity_cleanup(&sensor->src->sd.entity);
 
 out_cleanup:
-	smiapp_cleanup(sensor);
+	ccs_cleanup(sensor);
 
 out_free_ccs_limits:
 	kfree(sensor->ccs_limits);
 
 out_power_off:
-	smiapp_power_off(&client->dev);
+	ccs_power_off(&client->dev);
 	mutex_destroy(&sensor->mutex);
 
 	return rval;
 }
 
-static int smiapp_remove(struct i2c_client *client)
+static int ccs_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct smiapp_sensor *sensor = to_smiapp_sensor(subdev);
+	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
 	unsigned int i;
 
 	v4l2_async_unregister_subdev(subdev);
 
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev))
-		smiapp_power_off(&client->dev);
+		ccs_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
 	for (i = 0; i < sensor->ssds_used; i++) {
 		v4l2_device_unregister_subdev(&sensor->ssds[i].sd);
 		media_entity_cleanup(&sensor->ssds[i].sd.entity);
 	}
-	smiapp_cleanup(sensor);
+	ccs_cleanup(sensor);
 	mutex_destroy(&sensor->mutex);
 	kfree(sensor->ccs_limits);
 
 	return 0;
 }
 
-static const struct of_device_id smiapp_of_table[] = {
+static const struct of_device_id ccs_of_table[] = {
 	{ .compatible = "nokia,smia" },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, smiapp_of_table);
+MODULE_DEVICE_TABLE(of, ccs_of_table);
 
-static const struct i2c_device_id smiapp_id_table[] = {
+static const struct i2c_device_id ccs_id_table[] = {
 	{ SMIAPP_NAME, 0 },
 	{ },
 };
-MODULE_DEVICE_TABLE(i2c, smiapp_id_table);
+MODULE_DEVICE_TABLE(i2c, ccs_id_table);
 
-static const struct dev_pm_ops smiapp_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(smiapp_suspend, smiapp_resume)
-	SET_RUNTIME_PM_OPS(smiapp_power_off, smiapp_power_on, NULL)
+static const struct dev_pm_ops ccs_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(ccs_suspend, ccs_resume)
+	SET_RUNTIME_PM_OPS(ccs_power_off, ccs_power_on, NULL)
 };
 
-static struct i2c_driver smiapp_i2c_driver = {
+static struct i2c_driver ccs_i2c_driver = {
 	.driver	= {
-		.of_match_table = smiapp_of_table,
-		.name = SMIAPP_NAME,
-		.pm = &smiapp_pm_ops,
+		.of_match_table = ccs_of_table,
+		.name = CCS_NAME,
+		.pm = &ccs_pm_ops,
 	},
-	.probe_new = smiapp_probe,
-	.remove	= smiapp_remove,
-	.id_table = smiapp_id_table,
+	.probe_new = ccs_probe,
+	.remove	= ccs_remove,
+	.id_table = ccs_id_table,
 };
 
-static int smiapp_module_init(void)
+static int ccs_module_init(void)
 {
 	unsigned int i, l;
 
@@ -3289,17 +3283,17 @@ static int smiapp_module_init(void)
 	if (WARN_ON(l != CCS_L_LAST))
 		return -EINVAL;
 
-	return i2c_register_driver(THIS_MODULE, &smiapp_i2c_driver);
+	return i2c_register_driver(THIS_MODULE, &ccs_i2c_driver);
 }
 
-static void smiapp_module_cleanup(void)
+static void ccs_module_cleanup(void)
 {
-	i2c_del_driver(&smiapp_i2c_driver);
+	i2c_del_driver(&ccs_i2c_driver);
 }
 
-module_init(smiapp_module_init);
-module_exit(smiapp_module_cleanup);
+module_init(ccs_module_init);
+module_exit(ccs_module_cleanup);
 
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
-MODULE_DESCRIPTION("Generic SMIA/SMIA++ camera module driver");
+MODULE_DESCRIPTION("Generic MIPI CCS/SMIA/SMIA++ camera sensor driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/i2c/smiapp/smiapp-quirk.c b/drivers/media/i2c/smiapp/ccs-quirk.c
similarity index 83%
rename from drivers/media/i2c/smiapp/smiapp-quirk.c
rename to drivers/media/i2c/smiapp/ccs-quirk.c
index 5db97a16eccf..6c48d0901952 100644
--- a/drivers/media/i2c/smiapp/smiapp-quirk.c
+++ b/drivers/media/i2c/smiapp/ccs-quirk.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/media/i2c/smiapp/smiapp-quirk.c
+ * drivers/media/i2c/smiapp/ccs-quirk.c
  *
  * Generic driver for SMIA/SMIA++ compliant camera modules
  *
@@ -10,12 +10,11 @@
 
 #include <linux/delay.h>
 
+#include "ccs.h"
 #include "ccs-limits.h"
 
-#include "smiapp.h"
-
-static int ccs_write_addr_8s(struct smiapp_sensor *sensor,
-			     const struct smiapp_reg_8 *regs, int len)
+static int ccs_write_addr_8s(struct ccs_sensor *sensor,
+			     const struct ccs_reg_8 *regs, int len)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
@@ -33,7 +32,7 @@ static int ccs_write_addr_8s(struct smiapp_sensor *sensor,
 	return 0;
 }
 
-static int jt8ew9_limits(struct smiapp_sensor *sensor)
+static int jt8ew9_limits(struct ccs_sensor *sensor)
 {
 	if (sensor->minfo.revision_number_major < 0x03)
 		sensor->frame_skip = 1;
@@ -46,9 +45,9 @@ static int jt8ew9_limits(struct smiapp_sensor *sensor)
 	return 0;
 }
 
-static int jt8ew9_post_poweron(struct smiapp_sensor *sensor)
+static int jt8ew9_post_poweron(struct ccs_sensor *sensor)
 {
-	static const struct smiapp_reg_8 regs[] = {
+	static const struct ccs_reg_8 regs[] = {
 		{ 0x30a3, 0xd8 }, /* Output port control : LVDS ports only */
 		{ 0x30ae, 0x00 }, /* 0x0307 pll_multiplier maximum value on PLL input 9.6MHz ( 19.2MHz is divided on pre_pll_div) */
 		{ 0x30af, 0xd0 }, /* 0x0307 pll_multiplier maximum value on PLL input 9.6MHz ( 19.2MHz is divided on pre_pll_div) */
@@ -84,15 +83,15 @@ static int jt8ew9_post_poweron(struct smiapp_sensor *sensor)
 	return ccs_write_addr_8s(sensor, regs, ARRAY_SIZE(regs));
 }
 
-const struct smiapp_quirk smiapp_jt8ew9_quirk = {
+const struct ccs_quirk smiapp_jt8ew9_quirk = {
 	.limits = jt8ew9_limits,
 	.post_poweron = jt8ew9_post_poweron,
 };
 
-static int imx125es_post_poweron(struct smiapp_sensor *sensor)
+static int imx125es_post_poweron(struct ccs_sensor *sensor)
 {
 	/* Taken from v02. No idea what the other two are. */
-	static const struct smiapp_reg_8 regs[] = {
+	static const struct ccs_reg_8 regs[] = {
 		/*
 		 * 0x3302: clk during frame blanking:
 		 * 0x00 - HS mode, 0x01 - LP11
@@ -105,11 +104,11 @@ static int imx125es_post_poweron(struct smiapp_sensor *sensor)
 	return ccs_write_addr_8s(sensor, regs, ARRAY_SIZE(regs));
 }
 
-const struct smiapp_quirk smiapp_imx125es_quirk = {
+const struct ccs_quirk smiapp_imx125es_quirk = {
 	.post_poweron = imx125es_post_poweron,
 };
 
-static int jt8ev1_limits(struct smiapp_sensor *sensor)
+static int jt8ev1_limits(struct ccs_sensor *sensor)
 {
 	ccs_replace_limit(sensor, CCS_L_X_ADDR_MAX, 0, 4271);
 	ccs_replace_limit(sensor, CCS_L_MIN_LINE_BLANKING_PCK_BIN, 0, 184);
@@ -117,11 +116,11 @@ static int jt8ev1_limits(struct smiapp_sensor *sensor)
 	return 0;
 }
 
-static int jt8ev1_post_poweron(struct smiapp_sensor *sensor)
+static int jt8ev1_post_poweron(struct ccs_sensor *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
-	static const struct smiapp_reg_8 regs[] = {
+	static const struct ccs_reg_8 regs[] = {
 		{ 0x3031, 0xcd }, /* For digital binning (EQ_MONI) */
 		{ 0x30a3, 0xd0 }, /* FLASH STROBE enable */
 		{ 0x3237, 0x00 }, /* For control of pulse timing for ADC */
@@ -142,7 +141,7 @@ static int jt8ev1_post_poweron(struct smiapp_sensor *sensor)
 		{ 0x33cf, 0xec }, /* For Black sun */
 		{ 0x3328, 0x80 }, /* Ugh. No idea what's this. */
 	};
-	static const struct smiapp_reg_8 regs_96[] = {
+	static const struct ccs_reg_8 regs_96[] = {
 		{ 0x30ae, 0x00 }, /* For control of ADC clock */
 		{ 0x30af, 0xd0 },
 		{ 0x30b0, 0x01 },
@@ -163,12 +162,12 @@ static int jt8ev1_post_poweron(struct smiapp_sensor *sensor)
 	}
 }
 
-static int jt8ev1_pre_streamon(struct smiapp_sensor *sensor)
+static int jt8ev1_pre_streamon(struct ccs_sensor *sensor)
 {
 	return ccs_write_addr(sensor, 0x3328, 0x00);
 }
 
-static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
+static int jt8ev1_post_streamoff(struct ccs_sensor *sensor)
 {
 	int rval;
 
@@ -188,14 +187,14 @@ static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
 	return ccs_write_addr(sensor, 0x3328, 0x80);
 }
 
-static int jt8ev1_init(struct smiapp_sensor *sensor)
+static int jt8ev1_init(struct ccs_sensor *sensor)
 {
 	sensor->pll.flags |= SMIAPP_PLL_FLAG_OP_PIX_CLOCK_PER_LANE;
 
 	return 0;
 }
 
-const struct smiapp_quirk smiapp_jt8ev1_quirk = {
+const struct ccs_quirk smiapp_jt8ev1_quirk = {
 	.limits = jt8ev1_limits,
 	.post_poweron = jt8ev1_post_poweron,
 	.pre_streamon = jt8ev1_pre_streamon,
@@ -203,13 +202,13 @@ const struct smiapp_quirk smiapp_jt8ev1_quirk = {
 	.init = jt8ev1_init,
 };
 
-static int tcm8500md_limits(struct smiapp_sensor *sensor)
+static int tcm8500md_limits(struct ccs_sensor *sensor)
 {
 	ccs_replace_limit(sensor, CCS_L_MIN_PLL_IP_CLK_FREQ_MHZ, 0, 2700000);
 
 	return 0;
 }
 
-const struct smiapp_quirk smiapp_tcm8500md_quirk = {
+const struct ccs_quirk smiapp_tcm8500md_quirk = {
 	.limits = tcm8500md_limits,
 };
diff --git a/drivers/media/i2c/smiapp/smiapp-quirk.h b/drivers/media/i2c/smiapp/ccs-quirk.h
similarity index 59%
rename from drivers/media/i2c/smiapp/smiapp-quirk.h
rename to drivers/media/i2c/smiapp/ccs-quirk.h
index 8a479f17cd19..d208379158f2 100644
--- a/drivers/media/i2c/smiapp/smiapp-quirk.h
+++ b/drivers/media/i2c/smiapp/ccs-quirk.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * drivers/media/i2c/smiapp/smiapp-quirk.h
+ * drivers/media/i2c/smiapp/ccs-quirk.h
  *
  * Generic driver for SMIA/SMIA++ compliant camera modules
  *
@@ -8,13 +8,13 @@
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
 
-#ifndef __SMIAPP_QUIRK__
-#define __SMIAPP_QUIRK__
+#ifndef __CCS_QUIRK__
+#define __CCS_QUIRK__
 
-struct smiapp_sensor;
+struct ccs_sensor;
 
 /**
- * struct smiapp_quirk - quirks for sensors that deviate from SMIA++ standard
+ * struct ccs_quirk - quirks for sensors that deviate from SMIA++ standard
  *
  * @limits: Replace sensor->limits with values which can't be read from
  *	    sensor registers. Called the first time the sensor is powered up.
@@ -36,43 +36,43 @@ struct smiapp_sensor;
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
  */
-struct smiapp_quirk {
-	int (*limits)(struct smiapp_sensor *sensor);
-	int (*post_poweron)(struct smiapp_sensor *sensor);
-	int (*pre_streamon)(struct smiapp_sensor *sensor);
-	int (*post_streamoff)(struct smiapp_sensor *sensor);
-	unsigned long (*pll_flags)(struct smiapp_sensor *sensor);
-	int (*init)(struct smiapp_sensor *sensor);
-	int (*reg_access)(struct smiapp_sensor *sensor, bool write, u32 *reg,
+struct ccs_quirk {
+	int (*limits)(struct ccs_sensor *sensor);
+	int (*post_poweron)(struct ccs_sensor *sensor);
+	int (*pre_streamon)(struct ccs_sensor *sensor);
+	int (*post_streamoff)(struct ccs_sensor *sensor);
+	unsigned long (*pll_flags)(struct ccs_sensor *sensor);
+	int (*init)(struct ccs_sensor *sensor);
+	int (*reg_access)(struct ccs_sensor *sensor, bool write, u32 *reg,
 			  u32 *val);
 	unsigned long flags;
 };
 
-#define SMIAPP_QUIRK_FLAG_8BIT_READ_ONLY			(1 << 0)
+#define CCS_QUIRK_FLAG_8BIT_READ_ONLY			(1 << 0)
 
-struct smiapp_reg_8 {
+struct ccs_reg_8 {
 	u16 reg;
 	u8 val;
 };
 
-#define SMIAPP_MK_QUIRK_REG_8(_reg, _val) \
+#define CCS_MK_QUIRK_REG_8(_reg, _val) \
 	{				\
 		.reg = (u16)_reg,	\
 		.val = _val,		\
 	}
 
-#define smiapp_call_quirk(sensor, _quirk, ...)				\
+#define ccs_call_quirk(sensor, _quirk, ...)				\
 	((sensor)->minfo.quirk &&					\
 	 (sensor)->minfo.quirk->_quirk ?				\
 	 (sensor)->minfo.quirk->_quirk(sensor, ##__VA_ARGS__) : 0)
 
-#define smiapp_needs_quirk(sensor, _quirk)		\
+#define ccs_needs_quirk(sensor, _quirk)		\
 	((sensor)->minfo.quirk ?			\
 	 (sensor)->minfo.quirk->flags & _quirk : 0)
 
-extern const struct smiapp_quirk smiapp_jt8ev1_quirk;
-extern const struct smiapp_quirk smiapp_imx125es_quirk;
-extern const struct smiapp_quirk smiapp_jt8ew9_quirk;
-extern const struct smiapp_quirk smiapp_tcm8500md_quirk;
+extern const struct ccs_quirk smiapp_jt8ev1_quirk;
+extern const struct ccs_quirk smiapp_imx125es_quirk;
+extern const struct ccs_quirk smiapp_jt8ew9_quirk;
+extern const struct ccs_quirk smiapp_tcm8500md_quirk;
 
-#endif /* __SMIAPP_QUIRK__ */
+#endif /* __CCS_QUIRK__ */
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.c b/drivers/media/i2c/smiapp/ccs-reg-access.c
similarity index 79%
rename from drivers/media/i2c/smiapp/smiapp-regs.c
rename to drivers/media/i2c/smiapp/ccs-reg-access.c
index 173d9f8fe56c..4e6d212473fc 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.c
+++ b/drivers/media/i2c/smiapp/ccs-reg-access.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/media/i2c/smiapp/smiapp-regs.c
+ * drivers/media/i2c/smiapp/ccs-regs.c
  *
  * Generic driver for SMIA/SMIA++ compliant camera modules
  *
@@ -13,8 +13,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 
-#include "smiapp.h"
-#include "smiapp-regs.h"
+#include "ccs.h"
 
 static uint32_t float_to_u32_mul_1000000(struct i2c_client *client,
 					 uint32_t phloat)
@@ -66,7 +65,7 @@ static uint32_t float_to_u32_mul_1000000(struct i2c_client *client,
  * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
  * Returns zero if successful, or non-zero otherwise.
  */
-static int ____ccs_read_addr(struct smiapp_sensor *sensor, u16 reg, u16 len,
+static int ____ccs_read_addr(struct ccs_sensor *sensor, u16 reg, u16 len,
 			     u32 *val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -113,7 +112,7 @@ static int ____ccs_read_addr(struct smiapp_sensor *sensor, u16 reg, u16 len,
 }
 
 /* Read a register using 8-bit access only. */
-static int ____ccs_read_addr_8only(struct smiapp_sensor *sensor, u16 reg,
+static int ____ccs_read_addr_8only(struct ccs_sensor *sensor, u16 reg,
 				   u16 len, u32 *val)
 {
 	unsigned int i;
@@ -147,7 +146,7 @@ unsigned int ccs_reg_width(u32 reg)
  * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
  * Returns zero if successful, or non-zero otherwise.
  */
-static int __ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val,
+static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 			   bool only8)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
@@ -155,11 +154,10 @@ static int __ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val,
 	int rval;
 
 	if (!only8)
-		rval = ____ccs_read_addr(sensor, SMIAPP_REG_ADDR(reg), len,
-					    val);
+		rval = ____ccs_read_addr(sensor, CCS_REG_ADDR(reg), len, val);
 	else
-		rval = ____ccs_read_addr_8only(sensor, SMIAPP_REG_ADDR(reg),
-						  len, val);
+		rval = ____ccs_read_addr_8only(sensor, CCS_REG_ADDR(reg), len,
+					       val);
 	if (rval < 0)
 		return rval;
 
@@ -169,21 +167,20 @@ static int __ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val,
 	return 0;
 }
 
-int ccs_read_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val)
+int ccs_read_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
 	return __ccs_read_addr(
 		sensor, reg, val,
-		smiapp_needs_quirk(sensor,
-				   SMIAPP_QUIRK_FLAG_8BIT_READ_ONLY));
+		ccs_needs_quirk(sensor, CCS_QUIRK_FLAG_8BIT_READ_ONLY));
 }
 
-static int ccs_read_addr_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val,
+static int ccs_read_addr_quirk(struct ccs_sensor *sensor, u32 reg, u32 *val,
 			       bool force8)
 {
 	int rval;
 
 	*val = 0;
-	rval = smiapp_call_quirk(sensor, reg_access, false, &reg, val);
+	rval = ccs_call_quirk(sensor, reg_access, false, &reg, val);
 	if (rval == -ENOIOCTLCMD)
 		return 0;
 	if (rval < 0)
@@ -195,17 +192,17 @@ static int ccs_read_addr_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val,
 	return ccs_read_addr_no_quirk(sensor, reg, val);
 }
 
-int ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val)
+int ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
 	return ccs_read_addr_quirk(sensor, reg, val, false);
 }
 
-int ccs_read_addr_8only(struct smiapp_sensor *sensor, u32 reg, u32 *val)
+int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val)
 {
 	return ccs_read_addr_quirk(sensor, reg, val, true);
 }
 
-int ccs_write_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
+int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct i2c_msg msg;
@@ -222,7 +219,7 @@ int ccs_write_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	msg.len = 2 + len;
 	msg.buf = data;
 
-	put_unaligned_be16(SMIAPP_REG_ADDR(reg), data);
+	put_unaligned_be16(CCS_REG_ADDR(reg), data);
 	put_unaligned_be32(val << (8 * (sizeof(val) - len)), data + 2);
 
 	for (retries = 0; retries < 5; retries++) {
@@ -245,7 +242,7 @@ int ccs_write_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 
 	dev_err(&client->dev,
 		"wrote 0x%x to offset 0x%x error %d\n", val,
-		SMIAPP_REG_ADDR(reg), r);
+		CCS_REG_ADDR(reg), r);
 
 	return r;
 }
@@ -254,11 +251,11 @@ int ccs_write_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
  * Write to a 8/16-bit register.
  * Returns zero if successful, or non-zero otherwise.
  */
-int ccs_write_addr(struct smiapp_sensor *sensor, u32 reg, u32 val)
+int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
 {
 	int rval;
 
-	rval = smiapp_call_quirk(sensor, reg_access, true, &reg, &val);
+	rval = ccs_call_quirk(sensor, reg_access, true, &reg, &val);
 	if (rval == -ENOIOCTLCMD)
 		return 0;
 	if (rval < 0)
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.h b/drivers/media/i2c/smiapp/ccs-reg-access.h
similarity index 55%
rename from drivers/media/i2c/smiapp/smiapp-regs.h
rename to drivers/media/i2c/smiapp/ccs-reg-access.h
index 5df794f65dfc..76ac036a9538 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.h
+++ b/drivers/media/i2c/smiapp/ccs-reg-access.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * include/media/smiapp/smiapp-regs.h
+ * include/media/smiapp/ccs-regs.h
  *
  * Generic driver for SMIA/SMIA++ compliant camera modules
  *
@@ -16,15 +16,15 @@
 
 #include "ccs-regs.h"
 
-#define SMIAPP_REG_ADDR(reg)		((u16)reg)
+#define CCS_REG_ADDR(reg)		((u16)reg)
 
-struct smiapp_sensor;
+struct ccs_sensor;
 
-int ccs_read_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val);
-int ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val);
-int ccs_read_addr_8only(struct smiapp_sensor *sensor, u32 reg, u32 *val);
-int ccs_write_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val);
-int ccs_write_addr(struct smiapp_sensor *sensor, u32 reg, u32 val);
+int ccs_read_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 *val);
+int ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val);
+int ccs_read_addr_8only(struct ccs_sensor *sensor, u32 reg, u32 *val);
+int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val);
+int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val);
 
 unsigned int ccs_reg_width(u32 reg);
 
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/ccs.h
similarity index 65%
rename from drivers/media/i2c/smiapp/smiapp.h
rename to drivers/media/i2c/smiapp/ccs.h
index c6e4e05a7522..20b1125d87dc 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/ccs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * drivers/media/i2c/smiapp/smiapp.h
+ * drivers/media/i2c/smiapp/ccs.h
  *
  * Generic driver for SMIA/SMIA++ compliant camera modules
  *
@@ -8,19 +8,18 @@
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
 
-#ifndef __SMIAPP_PRIV_H_
-#define __SMIAPP_PRIV_H_
+#ifndef __CCS_H__
+#define __CCS_H__
 
 #include <linux/mutex.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
+#include "ccs-quirk.h"
 #include "ccs-regs.h"
-
-#include "smiapp-pll.h"
+#include "ccs-reg-access.h"
+#include "../smiapp-pll.h"
 #include "smiapp-reg-defs.h"
-#include "smiapp-regs.h"
-#include "smiapp-quirk.h"
 
 /*
  * Standard SMIA++ constants
@@ -41,12 +40,13 @@
 	(1000 +	(SMIAPP_RESET_DELAY_CLOCKS * 1000	\
 		 + (clk) / 1000 - 1) / ((clk) / 1000))
 
-#define SMIAPP_COLOUR_COMPONENTS	4
+#define CCS_COLOUR_COMPONENTS		4
 
-#define SMIAPP_NAME		"smiapp"
+#define SMIAPP_NAME			"smiapp"
+#define CCS_NAME			"ccs"
 
-#define SMIAPP_DFL_I2C_ADDR	(0x20 >> 1) /* Default I2C Address */
-#define SMIAPP_ALT_I2C_ADDR	(0x6e >> 1) /* Alternate I2C Address */
+#define CCS_DFL_I2C_ADDR	(0x20 >> 1) /* Default I2C Address */
+#define CCS_ALT_I2C_ADDR	(0x6e >> 1) /* Alternate I2C Address */
 
 /*
  * Sometimes due to board layout considerations the camera module can be
@@ -54,12 +54,12 @@
  * corrected by giving a default H-FLIP and V-FLIP in the sensor readout.
  * FIXME: rotation also changes the bayer pattern.
  */
-enum smiapp_module_board_orient {
-	SMIAPP_MODULE_BOARD_ORIENT_0 = 0,
-	SMIAPP_MODULE_BOARD_ORIENT_180,
+enum ccs_module_board_orient {
+	CCS_MODULE_BOARD_ORIENT_0 = 0,
+	CCS_MODULE_BOARD_ORIENT_180,
 };
 
-struct smiapp_flash_strobe_parms {
+struct ccs_flash_strobe_parms {
 	u8 mode;
 	u32 strobe_width_high_us;
 	u16 strobe_delay;
@@ -67,7 +67,7 @@ struct smiapp_flash_strobe_parms {
 	u8 trigger;
 };
 
-struct smiapp_hwconfig {
+struct ccs_hwconfig {
 	/*
 	 * Change the cci address if i2c_addr_alt is set.
 	 * Both default and alternate cci addr need to be present
@@ -78,19 +78,19 @@ struct smiapp_hwconfig {
 	uint32_t ext_clk;		/* sensor external clk */
 
 	unsigned int lanes;		/* Number of CSI-2 lanes */
-	uint32_t csi_signalling_mode;	/* SMIAPP_CSI_SIGNALLING_MODE_* */
+	uint32_t csi_signalling_mode;	/* CCS_CSI_SIGNALLING_MODE_* */
 	uint64_t *op_sys_clock;
 
-	enum smiapp_module_board_orient module_board_orient;
+	enum ccs_module_board_orient module_board_orient;
 
-	struct smiapp_flash_strobe_parms *strobe_setup;
+	struct ccs_flash_strobe_parms *strobe_setup;
 };
 
-struct smiapp_quirk;
+struct ccs_quirk;
 
-#define SMIAPP_MODULE_IDENT_FLAG_REV_LE		(1 << 0)
+#define CCS_MODULE_IDENT_FLAG_REV_LE		(1 << 0)
 
-struct smiapp_module_ident {
+struct ccs_module_ident {
 	u16 mipi_manufacturer_id;
 	u16 model_id;
 	u8 smia_manufacturer_id;
@@ -99,10 +99,10 @@ struct smiapp_module_ident {
 	u8 flags;
 
 	char *name;
-	const struct smiapp_quirk *quirk;
+	const struct ccs_quirk *quirk;
 };
 
-struct smiapp_module_info {
+struct ccs_module_info {
 	u32 smia_manufacturer_id;
 	u32 mipi_manufacturer_id;
 	u32 model_id;
@@ -126,10 +126,10 @@ struct smiapp_module_info {
 	u32 smiapp_profile;
 
 	char *name;
-	const struct smiapp_quirk *quirk;
+	const struct ccs_quirk *quirk;
 };
 
-#define SMIAPP_IDENT_FQ(manufacturer, model, rev, fl, _name, _quirk)	\
+#define CCS_IDENT_FQ(manufacturer, model, rev, fl, _name, _quirk)	\
 	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
@@ -137,22 +137,22 @@ struct smiapp_module_info {
 	  .name = _name,						\
 	  .quirk = _quirk, }
 
-#define SMIAPP_IDENT_LQ(manufacturer, model, rev, _name, _quirk)	\
+#define CCS_IDENT_LQ(manufacturer, model, rev, _name, _quirk)	\
 	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
-	  .flags = SMIAPP_MODULE_IDENT_FLAG_REV_LE,			\
+	  .flags = CCS_MODULE_IDENT_FLAG_REV_LE,			\
 	  .name = _name,						\
 	  .quirk = _quirk, }
 
-#define SMIAPP_IDENT_L(manufacturer, model, rev, _name)			\
+#define CCS_IDENT_L(manufacturer, model, rev, _name)			\
 	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
-	  .flags = SMIAPP_MODULE_IDENT_FLAG_REV_LE,			\
+	  .flags = CCS_MODULE_IDENT_FLAG_REV_LE,			\
 	  .name = _name, }
 
-#define SMIAPP_IDENT_Q(manufacturer, model, rev, _name, _quirk)		\
+#define CCS_IDENT_Q(manufacturer, model, rev, _name, _quirk)		\
 	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
@@ -160,49 +160,49 @@ struct smiapp_module_info {
 	  .name = _name,						\
 	  .quirk = _quirk, }
 
-#define SMIAPP_IDENT(manufacturer, model, rev, _name)			\
+#define CCS_IDENT(manufacturer, model, rev, _name)			\
 	{ .smia_manufacturer_id = manufacturer,				\
 	  .model_id = model,						\
 	  .revision_number_major = rev,					\
 	  .flags = 0,							\
 	  .name = _name, }
 
-struct smiapp_csi_data_format {
+struct ccs_csi_data_format {
 	u32 code;
 	u8 width;
 	u8 compressed;
 	u8 pixel_order;
 };
 
-#define SMIAPP_SUBDEVS			3
+#define CCS_SUBDEVS			3
 
-#define SMIAPP_PA_PAD_SRC		0
-#define SMIAPP_PAD_SINK			0
-#define SMIAPP_PAD_SRC			1
-#define SMIAPP_PADS			2
+#define CCS_PA_PAD_SRC			0
+#define CCS_PAD_SINK			0
+#define CCS_PAD_SRC			1
+#define CCS_PADS			2
 
-struct smiapp_binning_subtype {
+struct ccs_binning_subtype {
 	u8 horizontal:4;
 	u8 vertical:4;
 } __packed;
 
-struct smiapp_subdev {
+struct ccs_subdev {
 	struct v4l2_subdev sd;
-	struct media_pad pads[SMIAPP_PADS];
+	struct media_pad pads[CCS_PADS];
 	struct v4l2_rect sink_fmt;
-	struct v4l2_rect crop[SMIAPP_PADS];
+	struct v4l2_rect crop[CCS_PADS];
 	struct v4l2_rect compose; /* compose on sink */
 	unsigned short sink_pad;
 	unsigned short source_pad;
 	int npads;
-	struct smiapp_sensor *sensor;
+	struct ccs_sensor *sensor;
 	struct v4l2_ctrl_handler ctrl_handler;
 };
 
 /*
- * struct smiapp_sensor - Main device structure
+ * struct ccs_sensor - Main device structure
  */
-struct smiapp_sensor {
+struct ccs_sensor {
 	/*
 	 * "mutex" is used to serialise access to all fields here
 	 * except v4l2_ctrls at the end of the struct. "mutex" is also
@@ -210,22 +210,22 @@ struct smiapp_sensor {
 	 * information.
 	 */
 	struct mutex mutex;
-	struct smiapp_subdev ssds[SMIAPP_SUBDEVS];
+	struct ccs_subdev ssds[CCS_SUBDEVS];
 	u32 ssds_used;
-	struct smiapp_subdev *src;
-	struct smiapp_subdev *binner;
-	struct smiapp_subdev *scaler;
-	struct smiapp_subdev *pixel_array;
-	struct smiapp_hwconfig *hwcfg;
+	struct ccs_subdev *src;
+	struct ccs_subdev *binner;
+	struct ccs_subdev *scaler;
+	struct ccs_subdev *pixel_array;
+	struct ccs_hwconfig *hwcfg;
 	struct regulator *vana;
 	struct clk *ext_clk;
 	struct gpio_desc *xshutdown;
 	void *ccs_limits;
 	u8 nbinning_subtypes;
-	struct smiapp_binning_subtype binning_subtypes[CCS_LIM_BINNING_SUB_TYPE_MAX_N + 1];
+	struct ccs_binning_subtype binning_subtypes[CCS_LIM_BINNING_SUB_TYPE_MAX_N + 1];
 	u32 mbus_frame_fmts;
-	const struct smiapp_csi_data_format *csi_format;
-	const struct smiapp_csi_data_format *internal_csi_format;
+	const struct ccs_csi_data_format *csi_format;
+	const struct ccs_csi_data_format *internal_csi_format;
 	u32 default_mbus_frame_fmts;
 	int default_pixel_order;
 
@@ -246,7 +246,7 @@ struct smiapp_sensor {
 	bool dev_init_done;
 	u8 compressed_min_bpp;
 
-	struct smiapp_module_info minfo;
+	struct ccs_module_info minfo;
 
 	struct smiapp_pll pll;
 
@@ -265,16 +265,16 @@ struct smiapp_sensor {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate_csi;
 	/* test pattern colour components */
-	struct v4l2_ctrl *test_data[SMIAPP_COLOUR_COMPONENTS];
+	struct v4l2_ctrl *test_data[CCS_COLOUR_COMPONENTS];
 };
 
-#define to_smiapp_subdev(_sd)				\
-	container_of(_sd, struct smiapp_subdev, sd)
+#define to_ccs_subdev(_sd)				\
+	container_of(_sd, struct ccs_subdev, sd)
 
-#define to_smiapp_sensor(_sd)	\
-	(to_smiapp_subdev(_sd)->sensor)
+#define to_ccs_sensor(_sd)	\
+	(to_ccs_subdev(_sd)->sensor)
 
-void ccs_replace_limit(struct smiapp_sensor *sensor,
+void ccs_replace_limit(struct ccs_sensor *sensor,
 		       unsigned int limit, unsigned int offset, u32 val);
 
-#endif /* __SMIAPP_PRIV_H_ */
+#endif /* __CCS_H__ */
-- 
2.27.0

