Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4BF7D9471
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345688AbjJ0J7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345679AbjJ0J7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E329D
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:58:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 576BCBBB;
        Fri, 27 Oct 2023 11:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400722;
        bh=LyyuF0L5dxbGMzpLszO8KQtqbk5trvmDCL07RX19uRU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IbCKaJHdC/Jd6pNc+1F3IHMn0aq9j7BTpffBzxkgiy4Z+A/18X+WMihICCw3avh0E
         a/39wUtu5iM9p6BG4mfLKeVImVFWAf0E6VaUDBMecrOgm2IKnslGcddFkW71+zeVRR
         6mJgMuHTzU4c+j9JX0imtONF5jrMvSmr8VU77HIc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v1 6/9] media: ti: omap3isp: Fix references to pad config
Date:   Fri, 27 Oct 2023 12:58:50 +0300
Message-ID: <20231027095853.29057-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
References: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 subdev operations have moved from operating on a
v4l2_subdev_pad_config to a v4l2_subdev_state a long time ago. Fix
remaining incorrect references to pad config in comments.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti/omap3isp/ispccdc.c    | 12 ++++++------
 drivers/media/platform/ti/omap3isp/ispccp2.c    | 10 +++++-----
 drivers/media/platform/ti/omap3isp/ispcsi2.c    |  6 +++---
 drivers/media/platform/ti/omap3isp/isppreview.c | 12 ++++++------
 drivers/media/platform/ti/omap3isp/ispresizer.c | 16 ++++++++--------
 5 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index 7f46d0cdde6e..dd375c4e180d 100644
--- a/drivers/media/platform/ti/omap3isp/ispccdc.c
+++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
@@ -1968,7 +1968,7 @@ __ccdc_get_crop(struct isp_ccdc_device *ccdc,
 /*
  * ccdc_try_format - Try video format on a pad
  * @ccdc: ISP CCDC device
- * @cfg : V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: Pad number
  * @fmt: Format
  */
@@ -2126,7 +2126,7 @@ static void ccdc_try_crop(struct isp_ccdc_device *ccdc,
 /*
  * ccdc_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg : V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -2229,7 +2229,7 @@ static int ccdc_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * ccdc_get_selection - Retrieve a selection rectangle on a pad
  * @sd: ISP CCDC V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: Selection rectangle
  *
  * The only supported rectangles are the crop rectangles on the output formatter
@@ -2273,7 +2273,7 @@ static int ccdc_get_selection(struct v4l2_subdev *sd,
 /*
  * ccdc_set_selection - Set a selection rectangle on a pad
  * @sd: ISP CCDC V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: Selection rectangle
  *
  * The only supported rectangle is the actual crop rectangle on the output
@@ -2321,7 +2321,7 @@ static int ccdc_set_selection(struct v4l2_subdev *sd,
 /*
  * ccdc_get_format - Retrieve the video format on a pad
  * @sd : ISP CCDC V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
@@ -2345,7 +2345,7 @@ static int ccdc_get_format(struct v4l2_subdev *sd,
 /*
  * ccdc_set_format - Set the video format on a pad
  * @sd : ISP CCDC V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: Format
  *
  * Return 0 on success or -EINVAL if the pad is invalid or doesn't correspond
diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index 0517d410b22c..1204ee221c9e 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -614,7 +614,7 @@ static const unsigned int ccp2_fmts[] = {
 /*
  * __ccp2_get_format - helper function for getting ccp2 format
  * @ccp2  : Pointer to ISP CCP2 device
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad   : pad number
  * @which : wanted subdev format
  * return format structure or NULL on error
@@ -633,7 +633,7 @@ __ccp2_get_format(struct isp_ccp2_device *ccp2,
 /*
  * ccp2_try_format - Handle try format by pad subdev method
  * @ccp2  : Pointer to ISP CCP2 device
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad   : pad num
  * @fmt   : pointer to v4l2 mbus format structure
  * @which : wanted subdev format
@@ -688,7 +688,7 @@ static void ccp2_try_format(struct isp_ccp2_device *ccp2,
 /*
  * ccp2_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -749,7 +749,7 @@ static int ccp2_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * ccp2_get_format - Handle get format by pads subdev method
  * @sd    : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt   : pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
@@ -771,7 +771,7 @@ static int ccp2_get_format(struct v4l2_subdev *sd,
 /*
  * ccp2_set_format - Handle set format by pads subdev method
  * @sd    : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt   : pointer to v4l2 subdev format structure
  * returns zero
  */
diff --git a/drivers/media/platform/ti/omap3isp/ispcsi2.c b/drivers/media/platform/ti/omap3isp/ispcsi2.c
index 21270fc4e623..ae574e1b6528 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsi2.c
@@ -893,7 +893,7 @@ csi2_try_format(struct isp_csi2_device *csi2,
 /*
  * csi2_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -967,7 +967,7 @@ static int csi2_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * csi2_get_format - Handle get format by pads subdev method
  * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
@@ -989,7 +989,7 @@ static int csi2_get_format(struct v4l2_subdev *sd,
 /*
  * csi2_set_format - Handle set format by pads subdev method
  * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index fe550021d930..e383a57654de 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -1722,7 +1722,7 @@ static const unsigned int preview_output_fmts[] = {
 /*
  * preview_try_format - Validate a format
  * @prev: ISP preview engine
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad: pad number
  * @fmt: format to be validated
  * @which: try/active format selector
@@ -1861,7 +1861,7 @@ static void preview_try_crop(struct isp_prev_device *prev,
 /*
  * preview_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -1922,7 +1922,7 @@ static int preview_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * preview_get_selection - Retrieve a selection rectangle on a pad
  * @sd: ISP preview V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: Selection rectangle
  *
  * The only supported rectangles are the crop rectangles on the sink pad.
@@ -1965,7 +1965,7 @@ static int preview_get_selection(struct v4l2_subdev *sd,
 /*
  * preview_set_selection - Set a selection rectangle on a pad
  * @sd: ISP preview V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: Selection rectangle
  *
  * The only supported rectangle is the actual crop rectangle on the sink pad.
@@ -2013,7 +2013,7 @@ static int preview_set_selection(struct v4l2_subdev *sd,
 /*
  * preview_get_format - Handle get format by pads subdev method
  * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
@@ -2035,7 +2035,7 @@ static int preview_get_format(struct v4l2_subdev *sd,
 /*
  * preview_set_format - Handle set format by pads subdev method
  * @sd : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
diff --git a/drivers/media/platform/ti/omap3isp/ispresizer.c b/drivers/media/platform/ti/omap3isp/ispresizer.c
index bbcb27508fab..87d821b02e5c 100644
--- a/drivers/media/platform/ti/omap3isp/ispresizer.c
+++ b/drivers/media/platform/ti/omap3isp/ispresizer.c
@@ -109,7 +109,7 @@ static const struct isprsz_coef filter_coefs = {
  * __resizer_get_format - helper function for getting resizer format
  * @res   : pointer to resizer private structure
  * @pad   : pad number
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @which : wanted subdev format
  * return zero
  */
@@ -127,7 +127,7 @@ __resizer_get_format(struct isp_res_device *res,
 /*
  * __resizer_get_crop - helper function for getting resizer crop rectangle
  * @res   : pointer to resizer private structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @which : wanted subdev crop rectangle
  */
 static struct v4l2_rect *
@@ -1214,7 +1214,7 @@ static void resizer_try_crop(const struct v4l2_mbus_framefmt *sink,
 /*
  * resizer_get_selection - Retrieve a selection rectangle on a pad
  * @sd: ISP resizer V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: Selection rectangle
  *
  * The only supported rectangles are the crop rectangles on the sink pad.
@@ -1264,7 +1264,7 @@ static int resizer_get_selection(struct v4l2_subdev *sd,
 /*
  * resizer_set_selection - Set a selection rectangle on a pad
  * @sd: ISP resizer V4L2 subdevice
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @sel: Selection rectangle
  *
  * The only supported rectangle is the actual crop rectangle on the sink pad.
@@ -1368,7 +1368,7 @@ static unsigned int resizer_max_in_width(struct isp_res_device *res)
 /*
  * resizer_try_format - Handle try format by pad subdev method
  * @res   : ISP resizer device
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @pad   : pad num
  * @fmt   : pointer to v4l2 format structure
  * @which : wanted subdev format
@@ -1412,7 +1412,7 @@ static void resizer_try_format(struct isp_res_device *res,
 /*
  * resizer_enum_mbus_code - Handle pixel format enumeration
  * @sd     : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @code   : pointer to v4l2_subdev_mbus_code_enum structure
  * return -EINVAL or zero on success
  */
@@ -1473,7 +1473,7 @@ static int resizer_enum_frame_size(struct v4l2_subdev *sd,
 /*
  * resizer_get_format - Handle get format by pads subdev method
  * @sd    : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt   : pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
@@ -1495,7 +1495,7 @@ static int resizer_get_format(struct v4l2_subdev *sd,
 /*
  * resizer_set_format - Handle set format by pads subdev method
  * @sd    : pointer to v4l2 subdev structure
- * @cfg: V4L2 subdev pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt   : pointer to v4l2 subdev format structure
  * return -EINVAL or zero on success
  */
-- 
Regards,

Laurent Pinchart

