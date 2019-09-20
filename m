Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F90B9635
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406053AbfITREV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:04:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39336 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405819AbfITREF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:04:05 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH43Ce101487;
        Fri, 20 Sep 2019 12:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999043;
        bh=FvSF/4uwBts8qbtcwoFKZtDLaKvzOrP10+TwalN+LOc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MjIup2r98otxl6IScWUzxfVNQgnYCzljkDZhf2gUeNmXei3Obah5vj3/c9GdWlvnP
         5onld+UI08I+wX8aKRfGjhMtVIAPr3jpn3bODBJM+cZcEveemLjQXHsiDKtkSC4f1x
         Vz4/63vHUCTRgS2RtuNxuGVnmKhw2SGL4LsNTQTc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH43Uj103367
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:04:03 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:03:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:03:58 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r74054719;
        Fri, 20 Sep 2019 12:04:03 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 10/13] media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
Date:   Fri, 20 Sep 2019 12:05:51 -0500
Message-ID: <20190920170554.29666-11-bparrot@ti.com>
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

The try_fmt was not actually trying out the provided format
but merely returning the current format basically like get_fmt.
In addition set_fmt should first invoked try_fmt to validate the
given format before applying it to the hardware.

To fix all of these the whole get/try/set ioctl functions had to
be reworked.
When calculating the bytesperline/stride and sizeimage format
member we don't need to locally store the current value of
bytesperpixel as it can easily get derived dynamically.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 338 ++++++++++----------
 drivers/media/platform/am437x/am437x-vpfe.h |   4 +-
 2 files changed, 171 insertions(+), 171 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 9b781ab21893..e5ce9c8431ee 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -143,9 +143,11 @@ static struct vpfe_fmt formats[VPFE_NUM_FORMATS] = {
 	},
 };
 
-static int
-__vpfe_get_format(struct vpfe_device *vpfe,
-		  struct v4l2_format *format, unsigned int *bpp);
+static int __subdev_get_format(struct vpfe_device *vpfe,
+			       struct v4l2_mbus_framefmt *fmt);
+static int vpfe_calc_format_size(struct vpfe_device *vpfe,
+				 const struct vpfe_fmt *fmt,
+				 struct v4l2_format *f);
 
 static struct vpfe_fmt *find_format_by_code(struct vpfe_device *vpfe,
 					    unsigned int code)
@@ -177,48 +179,16 @@ static struct vpfe_fmt *find_format_by_pix(struct vpfe_device *vpfe,
 	return NULL;
 }
 
-static void
-mbus_to_pix(struct vpfe_device *vpfe,
-	    const struct v4l2_mbus_framefmt *mbus,
-	    struct v4l2_pix_format *pix, unsigned int *bpp)
+static unsigned int __get_bytesperpixel(struct vpfe_device *vpfe,
+					const struct vpfe_fmt *fmt)
 {
 	struct vpfe_subdev_info *sdinfo = vpfe->current_subdev;
 	unsigned int bus_width = sdinfo->vpfe_param.bus_width;
-	struct vpfe_fmt *fmt;
-
-	fmt = find_format_by_code(vpfe, mbus->code);
-	if (WARN_ON(fmt == NULL)) {
-		pr_err("Invalid mbus code set\n");
-		*bpp = 1;
-		return;
-	}
+	u32 bpp;
 
-	memset(pix, 0, sizeof(*pix));
-	v4l2_fill_pix_format(pix, mbus);
-	pix->pixelformat = fmt->fourcc;
-	*bpp = (bus_width == 10) ?  fmt->l.bpp : fmt->s.bpp;
+	bpp = (bus_width == 10) ? fmt->l.bpp : fmt->s.bpp;
 
-	/* pitch should be 32 bytes aligned */
-	pix->bytesperline = ALIGN(pix->width * *bpp, 32);
-	pix->sizeimage = pix->bytesperline * pix->height;
-}
-
-static void pix_to_mbus(struct vpfe_device *vpfe,
-			struct v4l2_pix_format *pix_fmt,
-			struct v4l2_mbus_framefmt *mbus_fmt)
-{
-	struct vpfe_fmt *fmt;
-
-	fmt = find_format_by_pix(vpfe, pix_fmt->pixelformat);
-	if (!fmt) {
-		/* default to first entry */
-		vpfe_dbg(3, vpfe, "Invalid pixel code: %x, default used instead\n",
-			pix_fmt->pixelformat);
-		fmt = vpfe->active_fmt[0];
-	}
-
-	memset(mbus_fmt, 0, sizeof(*mbus_fmt));
-	v4l2_fill_mbus_format(mbus_fmt, pix_fmt, fmt->code);
+	return bpp;
 }
 
 /*  Print Four-character-code (FOURCC) */
@@ -235,20 +205,6 @@ static char *print_fourcc(u32 fmt)
 	return code;
 }
 
-static int
-cmp_v4l2_format(const struct v4l2_format *lhs, const struct v4l2_format *rhs)
-{
-	return lhs->type == rhs->type &&
-		lhs->fmt.pix.width == rhs->fmt.pix.width &&
-		lhs->fmt.pix.height == rhs->fmt.pix.height &&
-		lhs->fmt.pix.pixelformat == rhs->fmt.pix.pixelformat &&
-		lhs->fmt.pix.field == rhs->fmt.pix.field &&
-		lhs->fmt.pix.colorspace == rhs->fmt.pix.colorspace &&
-		lhs->fmt.pix.ycbcr_enc == rhs->fmt.pix.ycbcr_enc &&
-		lhs->fmt.pix.quantization == rhs->fmt.pix.quantization &&
-		lhs->fmt.pix.xfer_func == rhs->fmt.pix.xfer_func;
-}
-
 static inline u32 vpfe_reg_read(struct vpfe_ccdc *ccdc, u32 offset)
 {
 	return ioread32(ccdc->ccdc_cfg.base_addr + offset);
@@ -981,6 +937,7 @@ static int vpfe_get_ccdc_image_format(struct vpfe_device *vpfe,
 static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 {
 	enum ccdc_frmfmt frm_fmt = CCDC_FRMFMT_INTERLACED;
+	u32 bpp;
 	int ret = 0;
 
 	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
@@ -993,7 +950,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 	}
 
 	/* configure the image window */
-	vpfe_ccdc_set_image_window(&vpfe->ccdc, &vpfe->crop, vpfe->bpp);
+	bpp = __get_bytesperpixel(vpfe, vpfe->current_vpfe_fmt);
+	vpfe_ccdc_set_image_window(&vpfe->ccdc, &vpfe->crop, bpp);
 
 	switch (vpfe->fmt.fmt.pix.field) {
 	case V4L2_FIELD_INTERLACED:
@@ -1037,7 +995,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 static int vpfe_config_image_format(struct vpfe_device *vpfe,
 				    v4l2_std_id std_id)
 {
-	struct v4l2_pix_format *pix = &vpfe->fmt.fmt.pix;
+	struct vpfe_fmt *fmt;
+	struct v4l2_mbus_framefmt mbus_fmt;
 	int i, ret;
 
 	for (i = 0; i < ARRAY_SIZE(vpfe_standards); i++) {
@@ -1059,26 +1018,29 @@ static int vpfe_config_image_format(struct vpfe_device *vpfe,
 		return -EINVAL;
 	}
 
-	vpfe->crop.top = vpfe->crop.left = 0;
-	vpfe->crop.width = vpfe->std_info.active_pixels;
-	vpfe->crop.height = vpfe->std_info.active_lines;
-	pix->width = vpfe->crop.width;
-	pix->height = vpfe->crop.height;
-	pix->pixelformat = V4L2_PIX_FMT_YUYV;
-
-	/* first field and frame format based on standard frame format */
-	if (vpfe->std_info.frame_format)
-		pix->field = V4L2_FIELD_INTERLACED;
-	else
-		pix->field = V4L2_FIELD_NONE;
-
-	ret = __vpfe_get_format(vpfe, &vpfe->fmt, &vpfe->bpp);
+	ret = __subdev_get_format(vpfe, &mbus_fmt);
 	if (ret)
 		return ret;
 
+	fmt = find_format_by_code(vpfe, mbus_fmt.code);
+	if (!fmt) {
+		vpfe_dbg(3, vpfe, "mbus code format (0x%08x) not found.\n",
+			 mbus_fmt.code);
+		return -EINVAL;
+	}
+
+	/* Save current subdev format */
+	v4l2_fill_pix_format(&vpfe->fmt.fmt.pix, &mbus_fmt);
+	vpfe->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vpfe->fmt.fmt.pix.pixelformat = fmt->fourcc;
+	vpfe_calc_format_size(vpfe, fmt, &vpfe->fmt);
+	vpfe->current_vpfe_fmt = fmt;
+
 	/* Update the crop window based on found values */
-	vpfe->crop.width = pix->width;
-	vpfe->crop.height = pix->height;
+	vpfe->crop.top = 0;
+	vpfe->crop.left = 0;
+	vpfe->crop.width = mbus_fmt.width;
+	vpfe->crop.height = mbus_fmt.height;
 
 	return vpfe_config_ccdc_image_format(vpfe);
 }
@@ -1356,81 +1318,74 @@ static int vpfe_querycap(struct file *file, void  *priv,
 }
 
 /* get the format set at output pad of the adjacent subdev */
-static int __vpfe_get_format(struct vpfe_device *vpfe,
-			     struct v4l2_format *format, unsigned int *bpp)
+static int __subdev_get_format(struct vpfe_device *vpfe,
+			       struct v4l2_mbus_framefmt *fmt)
 {
-	struct v4l2_mbus_framefmt mbus_fmt;
-	struct vpfe_subdev_info *sdinfo;
-	struct v4l2_subdev_format fmt;
+	struct v4l2_subdev *sd = vpfe->current_subdev->sd;
+	struct v4l2_subdev_format sd_fmt;
+	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
 	int ret;
 
-	sdinfo = vpfe->current_subdev;
-	if (!sdinfo->sd)
-		return -EINVAL;
-
-	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	fmt.pad = 0;
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sd_fmt.pad = 0;
 
-	ret = v4l2_subdev_call(sdinfo->sd, pad, get_fmt, NULL, &fmt);
-	if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV)
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+	if (ret)
 		return ret;
 
-	if (!ret) {
-		v4l2_fill_pix_format(&format->fmt.pix, &fmt.format);
-		mbus_to_pix(vpfe, &fmt.format, &format->fmt.pix, bpp);
-	} else {
-		ret = v4l2_device_call_until_err(&vpfe->v4l2_dev,
-						 sdinfo->grp_id,
-						 pad, get_fmt,
-						 NULL, &fmt);
-		if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV)
-			return ret;
-		v4l2_fill_pix_format(&format->fmt.pix, &mbus_fmt);
-		mbus_to_pix(vpfe, &mbus_fmt, &format->fmt.pix, bpp);
-	}
-
-	format->type = vpfe->fmt.type;
+	*fmt = *mbus_fmt;
 
-	vpfe_dbg(1, vpfe,
-		 "%s: size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
-		 __func__, format->fmt.pix.width, format->fmt.pix.height,
-		 print_fourcc(format->fmt.pix.pixelformat),
-		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
+	vpfe_dbg(1, vpfe, "%s: %dx%d code:%04X\n", __func__,
+		 fmt->width, fmt->height, fmt->code);
 
 	return 0;
 }
 
 /* set the format at output pad of the adjacent subdev */
-static int __vpfe_set_format(struct vpfe_device *vpfe,
-			     struct v4l2_format *format, unsigned int *bpp)
+static int __subdev_set_format(struct vpfe_device *vpfe,
+			       struct v4l2_mbus_framefmt *fmt)
 {
-	struct vpfe_subdev_info *sdinfo;
-	struct v4l2_subdev_format fmt;
+	struct v4l2_subdev *sd = vpfe->current_subdev->sd;
+	struct v4l2_subdev_format sd_fmt;
+	struct v4l2_mbus_framefmt *mbus_fmt = &sd_fmt.format;
 	int ret;
 
-	sdinfo = vpfe->current_subdev;
-	if (!sdinfo->sd)
-		return -EINVAL;
-
-	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	fmt.pad = 0;
-
-	pix_to_mbus(vpfe, &format->fmt.pix, &fmt.format);
+	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sd_fmt.pad = 0;
+	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call(sdinfo->sd, pad, set_fmt, NULL, &fmt);
+	ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
-	v4l2_fill_pix_format(&format->fmt.pix, &fmt.format);
-	mbus_to_pix(vpfe, &fmt.format, &format->fmt.pix, bpp);
+	vpfe_dbg(1, vpfe, "%s %dx%d code:%04X\n", __func__,
+		 fmt->width, fmt->height, fmt->code);
 
-	format->type = vpfe->fmt.type;
+	return 0;
+}
 
-	vpfe_dbg(1, vpfe,
-		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
-		 __func__,  format->fmt.pix.width, format->fmt.pix.height,
-		 print_fourcc(format->fmt.pix.pixelformat),
-		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
+static int vpfe_calc_format_size(struct vpfe_device *vpfe,
+				 const struct vpfe_fmt *fmt,
+				 struct v4l2_format *f)
+{
+	u32 bpp;
+
+	if (!fmt) {
+		vpfe_dbg(3, vpfe, "No vpfe_fmt provided!\n");
+		return -EINVAL;
+	}
+
+	bpp = __get_bytesperpixel(vpfe, fmt);
+
+	/* pitch should be 32 bytes aligned */
+	f->fmt.pix.bytesperline = ALIGN(f->fmt.pix.width * bpp, 32);
+	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline *
+			       f->fmt.pix.height;
+
+	vpfe_dbg(3, vpfe, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
+		 __func__, print_fourcc(f->fmt.pix.pixelformat),
+		 f->fmt.pix.width, f->fmt.pix.height,
+		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
 
 	return 0;
 }
@@ -1470,20 +1425,70 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 }
 
 static int vpfe_try_fmt(struct file *file, void *priv,
-			struct v4l2_format *fmt)
+			struct v4l2_format *f)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
-	unsigned int bpp;
+	struct v4l2_subdev *sd = vpfe->current_subdev->sd;
+	const struct vpfe_fmt *fmt;
+	struct v4l2_subdev_frame_size_enum fse;
+	int ret, found;
+
+	fmt = find_format_by_pix(vpfe, f->fmt.pix.pixelformat);
+	if (!fmt) {
+		/* default to first entry */
+		vpfe_dbg(3, vpfe, "Invalid pixel code: %x, default used instead\n",
+			 f->fmt.pix.pixelformat);
+		fmt = vpfe->active_fmt[0];
+		f->fmt.pix.pixelformat = fmt->fourcc;
+	}
 
-	return __vpfe_get_format(vpfe, fmt, &bpp);
+	f->fmt.pix.field = vpfe->fmt.fmt.pix.field;
+
+	/* check for/find a valid width/height */
+	ret = 0;
+	found = false;
+	fse.pad = 0;
+	fse.code = fmt->code;
+	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	for (fse.index = 0; ; fse.index++) {
+		ret = v4l2_subdev_call(sd, pad, enum_frame_size,
+				       NULL, &fse);
+		if (ret)
+			break;
+
+		if (f->fmt.pix.width == fse.max_width &&
+		    f->fmt.pix.height == fse.max_height) {
+			found = true;
+			break;
+		} else if (f->fmt.pix.width >= fse.min_width &&
+			   f->fmt.pix.width <= fse.max_width &&
+			   f->fmt.pix.height >= fse.min_height &&
+			   f->fmt.pix.height <= fse.max_height) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		/* use existing values as default */
+		f->fmt.pix.width = vpfe->fmt.fmt.pix.width;
+		f->fmt.pix.height =  vpfe->fmt.fmt.pix.height;
+	}
+
+	/*
+	 * Use current colorspace for now, it will get
+	 * updated properly during s_fmt
+	 */
+	f->fmt.pix.colorspace = vpfe->fmt.fmt.pix.colorspace;
+	return vpfe_calc_format_size(vpfe, fmt, f);
 }
 
 static int vpfe_s_fmt(struct file *file, void *priv,
 		      struct v4l2_format *fmt)
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
-	struct v4l2_format format;
-	unsigned int bpp;
+	struct vpfe_fmt *f;
+	struct v4l2_mbus_framefmt mbus_fmt;
 	int ret;
 
 	/* If streaming is started, return error */
@@ -1492,25 +1497,32 @@ static int vpfe_s_fmt(struct file *file, void *priv,
 		return -EBUSY;
 	}
 
-	ret = __vpfe_get_format(vpfe, &format, &bpp);
-	if (ret)
+	ret = vpfe_try_fmt(file, priv, fmt);
+	if (ret < 0)
 		return ret;
 
+	f = find_format_by_pix(vpfe, fmt->fmt.pix.pixelformat);
 
-	if (!cmp_v4l2_format(fmt, &format)) {
-		/* Sensor format is different from the requested format
-		 * so we need to change it
-		 */
-		ret = __vpfe_set_format(vpfe, fmt, &bpp);
-		if (ret)
-			return ret;
-	} else /* Just make sure all of the fields are consistent */
-		*fmt = format;
+	v4l2_fill_mbus_format(&mbus_fmt, &fmt->fmt.pix, f->code);
 
-	/* First detach any IRQ if currently attached */
-	vpfe_detach_irq(vpfe);
-	vpfe->fmt = *fmt;
-	vpfe->bpp = bpp;
+	ret = __subdev_set_format(vpfe, &mbus_fmt);
+	if (ret)
+		return ret;
+
+	/* Just double check nothing has gone wrong */
+	if (mbus_fmt.code != f->code) {
+		vpfe_dbg(3, vpfe,
+			 "%s subdev changed format on us, this should not happen\n",
+			 __func__);
+		return -EINVAL;
+	}
+
+	v4l2_fill_pix_format(&vpfe->fmt.fmt.pix, &mbus_fmt);
+	vpfe->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	vpfe->fmt.fmt.pix.pixelformat  = f->fourcc;
+	vpfe_calc_format_size(vpfe, f, &vpfe->fmt);
+	*fmt = vpfe->fmt;
+	vpfe->current_vpfe_fmt = f;
 
 	/* Update the crop window based on found values */
 	vpfe->crop.width = fmt->fmt.pix.width;
@@ -1525,43 +1537,28 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 {
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct v4l2_subdev_frame_size_enum fse;
-	struct vpfe_subdev_info *sdinfo;
-	struct v4l2_mbus_framefmt mbus;
-	struct v4l2_pix_format pix;
+	struct v4l2_subdev *sd = vpfe->current_subdev->sd;
 	struct vpfe_fmt *fmt;
 	int ret;
 
 	/* check for valid format */
 	fmt = find_format_by_pix(vpfe, fsize->pixel_format);
 	if (!fmt) {
-		vpfe_dbg(3, vpfe, "Invalid pixel code: %x, default used instead\n",
-			fsize->pixel_format);
+		vpfe_dbg(3, vpfe, "Invalid pixel code: %x\n",
+			 fsize->pixel_format);
 		return -EINVAL;
 	}
 
 	memset(fsize->reserved, 0x0, sizeof(fsize->reserved));
 
-	sdinfo = vpfe->current_subdev;
-	if (!sdinfo->sd)
-		return -EINVAL;
-
-	memset(&pix, 0x0, sizeof(pix));
-	/* Construct pix from parameter and use default for the rest */
-	pix.pixelformat = fsize->pixel_format;
-	pix.width = 640;
-	pix.height = 480;
-	pix.colorspace = V4L2_COLORSPACE_SRGB;
-	pix.field = V4L2_FIELD_NONE;
-	pix_to_mbus(vpfe, &pix, &mbus);
-
 	memset(&fse, 0x0, sizeof(fse));
 	fse.index = fsize->index;
 	fse.pad = 0;
-	fse.code = mbus.code;
+	fse.code = fmt->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	ret = v4l2_subdev_call(sdinfo->sd, pad, enum_frame_size, NULL, &fse);
+	ret = v4l2_subdev_call(sd, pad, enum_frame_size, NULL, &fse);
 	if (ret)
-		return -EINVAL;
+		return ret;
 
 	vpfe_dbg(1, vpfe, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
 		 __func__, fse.index, fse.code, fse.min_width, fse.max_width,
@@ -2050,6 +2047,7 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	struct vpfe_device *vpfe = video_drvdata(file);
 	struct v4l2_rect cr = vpfe->crop;
 	struct v4l2_rect r = s->r;
+	u32 bpp;
 
 	/* If streaming is started, return error */
 	if (vb2_is_busy(&vpfe->buffer_queue)) {
@@ -2075,10 +2073,12 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 
 	s->r = vpfe->crop = r;
 
-	vpfe_ccdc_set_image_window(&vpfe->ccdc, &r, vpfe->bpp);
+	bpp = __get_bytesperpixel(vpfe, vpfe->current_vpfe_fmt);
+	vpfe_ccdc_set_image_window(&vpfe->ccdc, &r, bpp);
 	vpfe->fmt.fmt.pix.width = r.width;
 	vpfe->fmt.fmt.pix.height = r.height;
-	vpfe->fmt.fmt.pix.bytesperline = vpfe_ccdc_get_line_length(&vpfe->ccdc);
+	vpfe->fmt.fmt.pix.bytesperline =
+		vpfe_ccdc_get_line_length(&vpfe->ccdc);
 	vpfe->fmt.fmt.pix.sizeimage = vpfe->fmt.fmt.pix.bytesperline *
 						vpfe->fmt.fmt.pix.height;
 
diff --git a/drivers/media/platform/am437x/am437x-vpfe.h b/drivers/media/platform/am437x/am437x-vpfe.h
index 6c7bcb837f4e..b08b8e19c46b 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.h
+++ b/drivers/media/platform/am437x/am437x-vpfe.h
@@ -281,8 +281,8 @@ struct vpfe_device {
 	struct vpfe_cap_buffer *next_frm;
 	/* Used to store pixel format */
 	struct v4l2_format fmt;
-	/* Used to store current bytes per pixel based on current format */
-	unsigned int bpp;
+	/* Used to keep a reference to the current vpfe_fmt */
+	struct vpfe_fmt *current_vpfe_fmt;
 	struct vpfe_fmt	*active_fmt[VPFE_NUM_FORMATS];
 	unsigned int num_active_fmt;
 
-- 
2.17.1

