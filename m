Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B875838B6A1
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 21:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbhETTEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 15:04:08 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:48270 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236223AbhETTEE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 15:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1621537355; bh=ijy37RyjYk6m4ia5GEIsA7JeXUj0r1H5uDtNOjiSFGQ=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=ES1O+VWXYmRc/F9pNgtmY21f6gUG2VcluOAGmva1VT6kZDHu3KMGq74uDcXh3U0VB
         bW6oSsEKF8xaf0900cDBwPddWRoN9eXdzymyrDm+GOTJOKLPRui5HAwXbGkbzQS24A
         Kinkw8i96Xc75wEgxNpLbkeH9wNFvZtkcn58ZEuo=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 20 May 2021 21:02:34 +0200 (CEST)
X-EA-Auth: dcZZMJ7MDv7PZ9WAFym8kgq7TMZgrzoahXZIeTFogHSKaejnBkSRVp6UrTo+ggV9KmHQgSyc/jqnGnob9utjvimDiYjvRhkz
Date:   Fri, 21 May 2021 00:32:15 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND 1/5] staging: media: atomisp: code formatting changes
 atomisp_csi2.c
Message-ID: <00fa47d7270a58f7ac1c0d952ada2db52a429a35.1619850663.git.drv@mailo.com>
References: <cover.1619850663.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619850663.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several trivial code reformatting changes done according to the coding
style guidelines. These changes improves code organisation and readability
and also 4 address many chackpatch error, warning and check complaints.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 72 +++++++++----------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 060b8765ae96..f33a08b2564f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -22,14 +22,12 @@
 #include "atomisp_internal.h"
 #include "atomisp-regs.h"
 
-static struct v4l2_mbus_framefmt *__csi2_get_format(struct
-	atomisp_mipi_csi2_device
-	* csi2,
-	struct
-	v4l2_subdev_pad_config *cfg,
-	enum
-	v4l2_subdev_format_whence
-	which, unsigned int pad) {
+static struct
+v4l2_mbus_framefmt *__csi2_get_format(struct atomisp_mipi_csi2_device *csi2,
+				      struct v4l2_subdev_pad_config *cfg,
+				      enum v4l2_subdev_format_whence which,
+				      unsigned int pad)
+{
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&csi2->subdev, cfg, pad);
 	else
@@ -42,7 +40,7 @@ static struct v4l2_mbus_framefmt *__csi2_get_format(struct
  * @fh     : V4L2 subdev file handle
  * @code   : pointer to v4l2_subdev_pad_mbus_code_enum structure
  * return -EINVAL or zero on success
-*/
+ */
 static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_mbus_code_enum *code)
@@ -68,7 +66,7 @@ static int csi2_enum_mbus_code(struct v4l2_subdev *sd,
  * @pad: pad num
  * @fmt: pointer to v4l2 format structure
  * return -EINVAL or zero on success
-*/
+ */
 static int csi2_get_format(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_pad_config *cfg,
 			   struct v4l2_subdev_format *fmt)
@@ -101,12 +99,12 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 		else
 			actual_ffmt->code = atomisp_in_fmt_conv[0].code;
 
-		actual_ffmt->width = clamp_t(
-					 u32, ffmt->width, ATOM_ISP_MIN_WIDTH,
-					 ATOM_ISP_MAX_WIDTH);
-		actual_ffmt->height = clamp_t(
-					  u32, ffmt->height, ATOM_ISP_MIN_HEIGHT,
-					  ATOM_ISP_MAX_HEIGHT);
+		actual_ffmt->width = clamp_t(u32, ffmt->width,
+					     ATOM_ISP_MIN_WIDTH,
+					     ATOM_ISP_MAX_WIDTH);
+		actual_ffmt->height = clamp_t(u32, ffmt->height,
+					      ATOM_ISP_MIN_HEIGHT,
+					      ATOM_ISP_MAX_HEIGHT);
 
 		tmp_ffmt = *ffmt = *actual_ffmt;
 
@@ -127,7 +125,7 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
  * @pad: pad num
  * @fmt: pointer to v4l2 format structure
  * return -EINVAL or zero on success
-*/
+ */
 static int csi2_set_format(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_pad_config *cfg,
 			   struct v4l2_subdev_format *fmt)
@@ -142,7 +140,7 @@ static int csi2_set_format(struct v4l2_subdev *sd,
  * @enable: Enable/disable stream (1/0)
  *
  * Return 0 on success or a negative error code otherwise.
-*/
+ */
 static int csi2_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	return 0;
@@ -179,7 +177,7 @@ static const struct v4l2_subdev_ops csi2_ops = {
  * @remote : Pointer to remote pad array
  * @flags  : Link flags
  * return -EINVAL or zero on success
-*/
+ */
 static int csi2_link_setup(struct media_entity *entity,
 			   const struct media_pad *local,
 			   const struct media_pad *remote, u32 flags)
@@ -217,10 +215,10 @@ static const struct media_entity_operations csi2_media_ops = {
 };
 
 /*
-* ispcsi2_init_entities - Initialize subdev and media entity.
-* @csi2: Pointer to ispcsi2 structure.
-* return -ENOMEM or zero on success
-*/
+ * ispcsi2_init_entities - Initialize subdev and media entity.
+ * @csi2: Pointer to ispcsi2 structure.
+ * return -ENOMEM or zero on success
+ */
 static int mipi_csi2_init_entities(struct atomisp_mipi_csi2_device *csi2,
 				   int port)
 {
@@ -244,9 +242,8 @@ static int mipi_csi2_init_entities(struct atomisp_mipi_csi2_device *csi2,
 	if (ret < 0)
 		return ret;
 
-	csi2->formats[CSI2_PAD_SINK].code =
-	    csi2->formats[CSI2_PAD_SOURCE].code =
-		atomisp_in_fmt_conv[0].code;
+	csi2->formats[CSI2_PAD_SINK].code = atomisp_in_fmt_conv[0].code;
+	csi2->formats[CSI2_PAD_SOURCE].code = atomisp_in_fmt_conv[0].code;
 
 	return 0;
 }
@@ -374,21 +371,22 @@ static void atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	    (isp->inputs[asd->input_curr].camera->ctrl_handler, &ctrl) == 0)
 		mipi_freq = ctrl.value;
 
-	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen,
-		     mipi_freq, TERMEN_DEFAULT);
-	clk_settle = atomisp_csi2_configure_calc(coeff_clk_settle,
-		     mipi_freq, SETTLE_DEFAULT);
-	dat_termen = atomisp_csi2_configure_calc(coeff_dat_termen,
-		     mipi_freq, TERMEN_DEFAULT);
-	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle,
-		     mipi_freq, SETTLE_DEFAULT);
+	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
+						 TERMEN_DEFAULT);
+	clk_settle = atomisp_csi2_configure_calc(coeff_clk_settle, mipi_freq,
+						 SETTLE_DEFAULT);
+	dat_termen = atomisp_csi2_configure_calc(coeff_dat_termen, mipi_freq,
+						 TERMEN_DEFAULT);
+	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
+						 SETTLE_DEFAULT);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];
 
 		atomisp_css2_hw_store_32(base + CSI2_REG_RX_CSI_DLY_CNT_TERMEN,
-				     n == 0 ? clk_termen : dat_termen);
+					 n == 0 ? clk_termen : dat_termen);
 		atomisp_css2_hw_store_32(base + CSI2_REG_RX_CSI_DLY_CNT_SETTLE,
-				     n == 0 ? clk_settle : dat_settle);
+					 n == 0 ? clk_settle : dat_settle);
 	}
 }
 
@@ -400,7 +398,7 @@ void atomisp_csi2_configure(struct atomisp_sub_device *asd)
 
 /*
  * atomisp_mipi_csi2_cleanup - Routine for module driver cleanup
-*/
+ */
 void atomisp_mipi_csi2_cleanup(struct atomisp_device *isp)
 {
 }
-- 
2.30.2



