Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47246B9634
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405921AbfITREF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:04:05 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51058 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405879AbfITRED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:04:03 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH42vb009049;
        Fri, 20 Sep 2019 12:04:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999042;
        bh=MCTFlIFe67UPV/JV96GfHqTs41gXz1Z0qQsrgw/MY94=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lOSTGWapykoVk2icgBOFE0r6hlSQxp2ne85N9EbtwKDPVQOfUZKxUcnJojC46F64W
         7hFadIRp0LOUWjLvGEft+wZnvw7jebQD54kG5iNIsC4/Nf9NZzpUVGeg6DXSJJbGCw
         1gVxC/4EJvIzt0ppIUc6rIebk66Oq62T0etV9+bE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH42rc103343
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:04:02 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:03:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:04:01 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r73054719;
        Fri, 20 Sep 2019 12:04:01 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 09/13] media: am437x-vpfe: fix function trace debug log
Date:   Fri, 20 Sep 2019 12:05:50 -0500
Message-ID: <20190920170554.29666-10-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

checkpatch.pl nows reports several:
WARNING: Prefer using '"%s...", __func__' to using '<function name>',
this function's name, in a string.

So fix these for the whole driver.
At the same time remove the function entry trace log as those can be
enabled using ftrace instead.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 72 ++++-----------------
 1 file changed, 13 insertions(+), 59 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index b213348fd1c4..9b781ab21893 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -443,8 +443,8 @@ static int vpfe_ccdc_set_params(struct vpfe_ccdc *ccdc, void __user *params)
 	x = copy_from_user(&raw_params, params, sizeof(raw_params));
 	if (x) {
 		vpfe_dbg(1, vpfe,
-			"vpfe_ccdc_set_params: error in copying ccdc params, %d\n",
-			x);
+			 "%s: error in copying ccdc params, %d\n",
+			 __func__, x);
 		return -EFAULT;
 	}
 
@@ -462,11 +462,9 @@ static int vpfe_ccdc_set_params(struct vpfe_ccdc *ccdc, void __user *params)
  */
 static void vpfe_ccdc_config_ycbcr(struct vpfe_ccdc *ccdc)
 {
-	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
 	struct ccdc_params_ycbcr *params = &ccdc->ccdc_cfg.ycbcr;
 	u32 syn_mode;
 
-	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_ycbcr:\n");
 	/*
 	 * first restore the CCDC registers to default values
 	 * This is important since we assume default values to be set in
@@ -598,8 +596,6 @@ static void vpfe_ccdc_config_raw(struct vpfe_ccdc *ccdc)
 	unsigned int syn_mode;
 	unsigned int val;
 
-	vpfe_dbg(3, vpfe, "vpfe_ccdc_config_raw:\n");
-
 	/* Reset CCDC */
 	vpfe_ccdc_restore_defaults(ccdc);
 
@@ -700,8 +696,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
 {
 	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
 
-	vpfe_dbg(1, vpfe, "vpfe_ccdc_set_pixel_format: if_type: %d, pixfmt:%s\n",
-		 ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
+	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
+		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
 
 	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
 		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
@@ -987,8 +983,6 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 	enum ccdc_frmfmt frm_fmt = CCDC_FRMFMT_INTERLACED;
 	int ret = 0;
 
-	vpfe_dbg(2, vpfe, "vpfe_config_ccdc_image_format\n");
-
 	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
 		print_fourcc(vpfe->fmt.fmt.pix.pixelformat));
 
@@ -1354,8 +1348,6 @@ static int vpfe_querycap(struct file *file, void  *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_querycap\n");
-
 	strscpy(cap->driver, VPFE_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, "TI AM437x VPFE", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
@@ -1400,7 +1392,7 @@ static int __vpfe_get_format(struct vpfe_device *vpfe,
 	format->type = vpfe->fmt.type;
 
 	vpfe_dbg(1, vpfe,
-		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
+		 "%s: size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
 		 __func__, format->fmt.pix.width, format->fmt.pix.height,
 		 print_fourcc(format->fmt.pix.pixelformat),
 		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
@@ -1416,8 +1408,6 @@ static int __vpfe_set_format(struct vpfe_device *vpfe,
 	struct v4l2_subdev_format fmt;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "__vpfe_set_format\n");
-
 	sdinfo = vpfe->current_subdev;
 	if (!sdinfo->sd)
 		return -EINVAL;
@@ -1450,8 +1440,6 @@ static int vpfe_g_fmt(struct file *file, void *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_g_fmt\n");
-
 	*fmt = vpfe->fmt;
 
 	return 0;
@@ -1464,9 +1452,6 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 	struct vpfe_subdev_info *sdinfo;
 	struct vpfe_fmt *fmt;
 
-	vpfe_dbg(2, vpfe, "vpfe_enum_format index:%d\n",
-		f->index);
-
 	sdinfo = vpfe->current_subdev;
 	if (!sdinfo->sd)
 		return -EINVAL;
@@ -1478,8 +1463,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 
 	f->pixelformat = fmt->fourcc;
 
-	vpfe_dbg(1, vpfe, "vpfe_enum_format: mbus index: %d code: %x pixelformat: %s\n",
-		 f->index, fmt->code, print_fourcc(fmt->fourcc));
+	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %s\n",
+		 __func__, f->index, fmt->code, print_fourcc(fmt->fourcc));
 
 	return 0;
 }
@@ -1490,8 +1475,6 @@ static int vpfe_try_fmt(struct file *file, void *priv,
 	struct vpfe_device *vpfe = video_drvdata(file);
 	unsigned int bpp;
 
-	vpfe_dbg(2, vpfe, "vpfe_try_fmt\n");
-
 	return __vpfe_get_format(vpfe, fmt, &bpp);
 }
 
@@ -1503,8 +1486,6 @@ static int vpfe_s_fmt(struct file *file, void *priv,
 	unsigned int bpp;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_s_fmt\n");
-
 	/* If streaming is started, return error */
 	if (vb2_is_busy(&vpfe->buffer_queue)) {
 		vpfe_err(vpfe, "%s device busy\n", __func__);
@@ -1550,8 +1531,6 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	struct vpfe_fmt *fmt;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_enum_size\n");
-
 	/* check for valid format */
 	fmt = find_format_by_pix(vpfe, fsize->pixel_format);
 	if (!fmt) {
@@ -1584,17 +1563,17 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	if (ret)
 		return -EINVAL;
 
-	vpfe_dbg(1, vpfe, "vpfe_enum_size: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
-		fse.index, fse.code, fse.min_width, fse.max_width,
-		fse.min_height, fse.max_height);
+	vpfe_dbg(1, vpfe, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
+		 __func__, fse.index, fse.code, fse.min_width, fse.max_width,
+		 fse.min_height, fse.max_height);
 
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
 	fsize->discrete.width = fse.max_width;
 	fsize->discrete.height = fse.max_height;
 
-	vpfe_dbg(1, vpfe, "vpfe_enum_size: index: %d pixformat: %s size: %dx%d\n",
-		fsize->index, print_fourcc(fsize->pixel_format),
-		fsize->discrete.width, fsize->discrete.height);
+	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %s size: %dx%d\n",
+		 __func__, fsize->index, print_fourcc(fsize->pixel_format),
+		 fsize->discrete.width, fsize->discrete.height);
 
 	return 0;
 }
@@ -1659,8 +1638,6 @@ static int vpfe_enum_input(struct file *file, void *priv,
 	struct vpfe_subdev_info *sdinfo;
 	int subdev, index;
 
-	vpfe_dbg(2, vpfe, "vpfe_enum_input\n");
-
 	if (vpfe_get_subdev_input_index(vpfe, &subdev, &index,
 					inp->index) < 0) {
 		vpfe_dbg(1, vpfe,
@@ -1677,8 +1654,6 @@ static int vpfe_g_input(struct file *file, void *priv, unsigned int *index)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_g_input\n");
-
 	return vpfe_get_app_input_index(vpfe, index);
 }
 
@@ -1691,8 +1666,6 @@ static int vpfe_set_input(struct vpfe_device *vpfe, unsigned int index)
 	u32 input, output;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_set_input: index: %d\n", index);
-
 	/* If streaming is started, return error */
 	if (vb2_is_busy(&vpfe->buffer_queue)) {
 		vpfe_err(vpfe, "%s device busy\n", __func__);
@@ -1748,9 +1721,6 @@ static int vpfe_s_input(struct file *file, void *priv, unsigned int index)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe,
-		"vpfe_s_input: index: %d\n", index);
-
 	return vpfe_set_input(vpfe, index);
 }
 
@@ -1759,8 +1729,6 @@ static int vpfe_querystd(struct file *file, void *priv, v4l2_std_id *std_id)
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
 
-	vpfe_dbg(2, vpfe, "vpfe_querystd\n");
-
 	sdinfo = vpfe->current_subdev;
 	if (!(sdinfo->inputs[0].capabilities & V4L2_IN_CAP_STD))
 		return -ENODATA;
@@ -1776,8 +1744,6 @@ static int vpfe_s_std(struct file *file, void *priv, v4l2_std_id std_id)
 	struct vpfe_subdev_info *sdinfo;
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_s_std\n");
-
 	sdinfo = vpfe->current_subdev;
 	if (!(sdinfo->inputs[0].capabilities & V4L2_IN_CAP_STD))
 		return -ENODATA;
@@ -1809,8 +1775,6 @@ static int vpfe_g_std(struct file *file, void *priv, v4l2_std_id *std_id)
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct vpfe_subdev_info *sdinfo;
 
-	vpfe_dbg(2, vpfe, "vpfe_g_std\n");
-
 	sdinfo = vpfe->current_subdev;
 	if (sdinfo->inputs[0].capabilities != V4L2_IN_CAP_STD)
 		return -ENODATA;
@@ -1828,8 +1792,6 @@ static void vpfe_calculate_offsets(struct vpfe_device *vpfe)
 {
 	struct v4l2_rect image_win;
 
-	vpfe_dbg(2, vpfe, "vpfe_calculate_offsets\n");
-
 	vpfe_ccdc_get_image_window(&vpfe->ccdc, &image_win);
 	vpfe->field_off = image_win.height * image_win.width;
 }
@@ -2030,8 +1992,6 @@ static int vpfe_g_pixelaspect(struct file *file, void *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 
-	vpfe_dbg(2, vpfe, "vpfe_g_pixelaspect\n");
-
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE ||
 	    vpfe->std_index >= ARRAY_SIZE(vpfe_standards))
 		return -EINVAL;
@@ -2134,8 +2094,6 @@ static long vpfe_ioctl_default(struct file *file, void *priv,
 	struct vpfe_device *vpfe = video_drvdata(file);
 	int ret;
 
-	vpfe_dbg(2, vpfe, "vpfe_ioctl_default\n");
-
 	if (!valid_prio) {
 		vpfe_err(vpfe, "%s device busy\n", __func__);
 		return -EBUSY;
@@ -2246,8 +2204,6 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 	bool found = false;
 	int i, j, k;
 
-	vpfe_dbg(1, vpfe, "vpfe_async_bound\n");
-
 	for (i = 0; i < ARRAY_SIZE(vpfe->cfg->asd); i++) {
 		if (vpfe->cfg->asd[i]->match.fwnode ==
 		    asd[i].match.fwnode) {
@@ -2579,8 +2535,6 @@ static int vpfe_remove(struct platform_device *pdev)
 {
 	struct vpfe_device *vpfe = platform_get_drvdata(pdev);
 
-	vpfe_dbg(2, vpfe, "vpfe_remove\n");
-
 	pm_runtime_disable(&pdev->dev);
 
 	v4l2_async_notifier_unregister(&vpfe->notifier);
-- 
2.17.1

