Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D742B714801
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjE2Kjh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjE2Kjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83752DF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5drGZ9s62DP3gky6LPy5PuF3NdVXY0DkNyBKV8yGJBs=;
        b=haeDaAvGGwzC3FKRwVEiIYDGAVAbnahAiq8LxjLjdNxRoGVw09ygbcAuwGTHm4yW1MkO42
        Ywefb5SVq4YmHsrr1Rupo5I5LBxd5OZ1uSbQ6uGyZq5wq73oWpcahSYNb25k4Y+n2noi24
        TVzz1Z1kam33VbE3KgWYmoA97NTuFGk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-_hksEC8eOsmSDU8WUe2llQ-1; Mon, 29 May 2023 06:38:48 -0400
X-MC-Unique: _hksEC8eOsmSDU8WUe2llQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC0012A59561;
        Mon, 29 May 2023 10:38:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7452166B2B;
        Mon, 29 May 2023 10:38:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 14/21] media: atomisp: Refactor atomisp_try_fmt() / atomisp_set_fmt()
Date:   Mon, 29 May 2023 12:37:34 +0200
Message-Id: <20230529103741.11904-15-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are a number of bugs in atomisp_try_fmt_cap() and atomisp_set_fmt():

1. atomisp_try_fmt_cap() uses atomisp_adjust_fmt() which adds the sensor
   padding to the width passed to atomisp_adjust_fmt() to calculate
   bytesperline. This is buggy for 2 reasons:

   a) The width passed to atomisp_adjust_fmt() already contains
      the sensor padding.

   b) The fmt returned by atomisp_try_fmt_cap() is the fmt outputted by
      the ISP and the sensor padding applies to the input side of the ISP
      not the output side. The output side of the ISP has its own padding /
      pitch requirements which have nothing to do with the sensor.

   Both these issues are fixed in this refactor by switching to
   ia_css_frame_pad_width() to calculate the padding.

2. atomisp_set_fmt() takes the passed in bytesperline value without
   doing any validation on it and then passes this unchecked value to
   the configure_output() callback.

   If bytesperline converted to pixels is > 1920 ia_css_binary_find()
   will fail to find a valid binary for the preview pipeline triggering
   a dump_stack_lvl() call inside ia_css_binary_find() and causing
   atomisp_set_fmt() to fail.

   This is fixed by making atomisp_set_fmt() call atomisp_try_fmt()
   first which we override the userspace specified bytesperline with
   the correct value.

Besides this bug there is also a bunch of weirdness and a lot of
duplication in the code:

1. atomisp_try_fmt_cap() adds the sensor padding itself but then
   it gets substracted again in atomisp_adjust_fmt() not doing
   the addition + substraction in the same place makes the code hard
   to follow (weirdness).

2. atomisp_set_fmt() starts with basically an atomisp_try_fmt() call,
   except that the only atomisp_try_fmt() caller: atomisp_try_fmt_cap()
   adds the sensor padding itself rather then letting atomisp_try_fmt()
   do this (duplication).

3. Both atomisp_try_fmt_cap() and atomisp_set_fmt() contain code to
   lookup the bridge-format matching the requested pixelformat and
   both will fallback to YUV420 if this is not set (duplication).

4. Both atomisp_try_fmt_cap() and atomisp_set_fmt() contain code to
   fill in the passed in v4l2_pix_format struct (duplication).

Cleanup all of this (and fix the bugs mentioned above) by:

1. Adding a new atomisp_fill_pix_format() helper which properly uses
   ia_css_frame_pad_width() to calculate bytesperline.

2. Move all sensor padding handling to atomisp_try_fmt() and
   make atomisp_try_fmt() fill the passed in v4l2_pix_format struct.

3. This reduces atomisp_try_fmt_cap() to just a small wrapper around
   atomisp_try_fmt().

4. Replace the DIY try_fmt code at the beginning of atomisp_set_fmt()
   with atomisp_try_fmt(), this will also override/fix the bytersperline
   passed by userspace.

5. Replace the DIY v4l2_pix_format fillint at the end of atomisp_set_fmt()
   with atomisp_fill_pix_format().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 168 ++++++++----------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  67 +------
 3 files changed, 76 insertions(+), 163 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 243a789fef6a..9531baa26fe0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3657,11 +3657,44 @@ static void __atomisp_init_stream_info(u16 stream_index,
 	}
 }
 
-/* This function looks up the closest available resolution. */
-int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
+static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
+				    u32 width, u32 height,
+				    const struct atomisp_format_bridge *br_fmt)
 {
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	f->width = width;
+	f->height = height;
+	f->pixelformat = br_fmt->pixelformat;
+
+	/* Adding padding to width for bytesperline calculation */
+	width = ia_css_frame_pad_width(width, br_fmt->sh_fmt);
+
+	if (br_fmt->planar) {
+		f->bytesperline = width;
+		f->sizeimage = PAGE_ALIGN(height * DIV_ROUND_UP(br_fmt->depth * width, 8));
+	} else {
+		f->bytesperline = DIV_ROUND_UP(br_fmt->depth * width, 8);
+		f->sizeimage = PAGE_ALIGN(height * f->bytesperline);
+	}
+
+	if (f->field == V4L2_FIELD_ANY)
+		f->field = V4L2_FIELD_NONE;
+
+	/*
+	 * FIXME: do we need to setup this differently, depending on the
+	 * sensor or the pipeline?
+	 */
+	f->colorspace = V4L2_COLORSPACE_REC709;
+	f->ycbcr_enc = V4L2_YCBCR_ENC_709;
+	f->xfer_func = V4L2_XFER_FUNC_709;
+}
+
+/* This function looks up the closest available resolution. */
+int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
+		    const struct atomisp_format_bridge **fmt_ret,
+		    const struct atomisp_format_bridge **snr_fmt_ret)
+{
+	const struct atomisp_format_bridge *fmt, *snr_fmt;
+	struct atomisp_sub_device *asd = &isp->asd;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
@@ -3670,33 +3703,29 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
-	const struct atomisp_format_bridge *fmt;
 	int ret;
 
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
 	if (!input->camera)
 		return -EINVAL;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	if (!fmt) {
-		dev_err(isp->dev, "unsupported pixelformat!\n");
-		fmt = atomisp_output_fmts;
+	/* Currently, raw formats are broken!!! */
+	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		f->pixelformat = V4L2_PIX_FMT_YUV420;
+
+		fmt = atomisp_get_format_bridge(f->pixelformat);
+		if (!fmt)
+			return -EINVAL;
 	}
 
-	if (f->width <= 0 || f->height <= 0)
-		return -EINVAL;
-
-	format.format.code = fmt->mbus_code;
-	format.format.width = f->width;
-	format.format.height = f->height;
-
-	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL,
-				   (struct atomisp_input_stream_info *)format.format.reserved);
+	/*
+	 * atomisp_set_fmt() will set the sensor resolution to the requested
+	 * resolution + padding. Add padding here and remove it again after
+	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
+	 */
+	v4l2_fill_mbus_format(&format.format, f, fmt->mbus_code);
+	format.format.width += pad_w;
+	format.format.height += pad_h;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
 		format.format.width, format.format.height);
@@ -3708,16 +3737,15 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 	dev_dbg(isp->dev, "try_mbus_fmt: got %ux%u\n",
 		format.format.width, format.format.height);
 
-	fmt = atomisp_get_format_bridge_from_mbus(format.format.code);
-	if (!fmt) {
+	snr_fmt = atomisp_get_format_bridge_from_mbus(format.format.code);
+	if (!snr_fmt) {
 		dev_err(isp->dev, "unknown sensor format 0x%8.8x\n",
 			format.format.code);
 		return -EINVAL;
 	}
 
-	f->pixelformat = fmt->pixelformat;
-	f->width = format.format.width;
-	f->height = format.format.height;
+	f->width = format.format.width - pad_w;
+	f->height = format.format.height - pad_h;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -3727,7 +3755,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 	 */
 	if (f->pixelformat == V4L2_PIX_FMT_JPEG ||
 	    f->pixelformat == V4L2_PIX_FMT_CUSTOM_M10MO_RAW)
-		return 0;
+		goto out_fill_pix_format;
 
 	/* app vs isp */
 	f->width = rounddown(clamp_t(u32, f->width, ATOM_ISP_MIN_WIDTH,
@@ -3735,6 +3763,15 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 	f->height = rounddown(clamp_t(u32, f->height, ATOM_ISP_MIN_HEIGHT,
 				      ATOM_ISP_MAX_HEIGHT), ATOM_ISP_STEP_HEIGHT);
 
+out_fill_pix_format:
+	atomisp_fill_pix_format(f, f->width, f->height, fmt);
+
+	if (fmt_ret)
+		*fmt_ret = fmt;
+
+	if (snr_fmt_ret)
+		*snr_fmt_ret = snr_fmt;
+
 	return 0;
 }
 
@@ -3900,7 +3937,7 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 
 static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 				  struct ia_css_frame_info *output_info,
-				  struct v4l2_pix_format *pix)
+				  const struct v4l2_pix_format *pix)
 {
 	struct camera_mipi_info *mipi_info;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
@@ -4213,16 +4250,12 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
-	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
 	unsigned int padding_w = pad_w, padding_h = pad_h;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
-	struct v4l2_subdev_format vformat = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
 	struct v4l2_rect isp_sink_crop;
 	int ret;
 
@@ -4234,41 +4267,13 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		"setting resolution %ux%u bytesperline %u\n",
 		f->fmt.pix.width, f->fmt.pix.height, f->fmt.pix.bytesperline);
 
-	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-	if (!format_bridge)
-		return -EINVAL;
-
-	/* Currently, raw formats are broken!!! */
-
-	if (format_bridge->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
-		f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420;
-
-		format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-		if (!format_bridge)
-			return -EINVAL;
-	}
-	pipe->sh_fmt = format_bridge->sh_fmt;
-	pipe->pix.pixelformat = f->fmt.pix.pixelformat;
-
 	/* Ensure that the resolution is equal or below the maximum supported */
-
-	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	v4l2_fill_mbus_format(&vformat.format, &f->fmt.pix, format_bridge->mbus_code);
-	vformat.format.height += padding_h;
-	vformat.format.width += padding_w;
-
-	ret = v4l2_subdev_call(input->camera, pad, set_fmt, NULL, &vformat);
+	ret = atomisp_try_fmt(isp, &f->fmt.pix, &format_bridge, &snr_format_bridge);
 	if (ret)
 		return ret;
 
-	f->fmt.pix.width = vformat.format.width - padding_w;
-	f->fmt.pix.height = vformat.format.height - padding_h;
-
-	snr_format_bridge = atomisp_get_format_bridge_from_mbus(vformat.format.code);
-	if (!snr_format_bridge) {
-		dev_warn(isp->dev, "Can't find bridge format\n");
-		return -EINVAL;
-	}
+	pipe->sh_fmt = format_bridge->sh_fmt;
+	pipe->pix.pixelformat = format_bridge->pixelformat;
 
 	atomisp_subdev_get_ffmt(&asd->subdev, NULL,
 				V4L2_SUBDEV_FORMAT_ACTIVE,
@@ -4348,42 +4353,11 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		return -EINVAL;
 	}
 
-	pipe->pix.width = f->fmt.pix.width;
-	pipe->pix.height = f->fmt.pix.height;
-	pipe->pix.pixelformat = f->fmt.pix.pixelformat;
-	/*
-	 * FIXME: do we need to setup this differently, depending on the
-	 * sensor or the pipeline?
-	 */
-	pipe->pix.colorspace = V4L2_COLORSPACE_REC709;
-	pipe->pix.ycbcr_enc = V4L2_YCBCR_ENC_709;
-	pipe->pix.xfer_func = V4L2_XFER_FUNC_709;
-
-	if (format_bridge->planar) {
-		pipe->pix.bytesperline = output_info.padded_width;
-		pipe->pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height *
-						 DIV_ROUND_UP(format_bridge->depth *
-							 output_info.padded_width, 8));
-	} else {
-		pipe->pix.bytesperline =
-		    DIV_ROUND_UP(format_bridge->depth *
-				 output_info.padded_width, 8);
-		pipe->pix.sizeimage =
-		    PAGE_ALIGN(f->fmt.pix.height * pipe->pix.bytesperline);
-	}
-	dev_dbg(isp->dev, "%s: image size: %d, %d bytes per line\n",
-		__func__, pipe->pix.sizeimage, pipe->pix.bytesperline);
-
-	if (f->fmt.pix.field == V4L2_FIELD_ANY)
-		f->fmt.pix.field = V4L2_FIELD_NONE;
-	pipe->pix.field = f->fmt.pix.field;
+	atomisp_fill_pix_format(&pipe->pix, f->fmt.pix.width, f->fmt.pix.height, format_bridge);
 
 	f->fmt.pix = pipe->pix;
 	f->fmt.pix.priv = PAGE_ALIGN(pipe->pix.width *
 				     pipe->pix.height * 2);
-	/* Report the needed sizes */
-	f->fmt.pix.sizeimage = pipe->pix.sizeimage;
-	f->fmt.pix.bytesperline = pipe->pix.bytesperline;
 
 	dev_dbg(isp->dev, "%s: %dx%d, image size: %d, %d bytes per line\n",
 		__func__,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index ff2178c96fb8..c9a587b34e70 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -251,7 +251,9 @@ int atomisp_compare_grid(struct atomisp_sub_device *asd,
 			 struct atomisp_grid_info *atomgrid);
 
 /* This function looks up the closest available resolution. */
-int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f);
+int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
+		    const struct atomisp_format_bridge **fmt_ret,
+		    const struct atomisp_format_bridge **snr_fmt_ret);
 
 int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index fc3f9883914e..8ba1d11ae907 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -806,77 +806,14 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int atomisp_adjust_fmt(struct v4l2_format *f)
-{
-	const struct atomisp_format_bridge *format_bridge;
-	u32 padded_width;
-
-	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!format_bridge || format_bridge->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
-		f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420;
-
-		format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-		if (!format_bridge)
-			return -EINVAL;
-	}
-
-	padded_width = f->fmt.pix.width + pad_w;
-
-	if (format_bridge->planar) {
-		f->fmt.pix.bytesperline = padded_width;
-		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height *
-						  DIV_ROUND_UP(format_bridge->depth *
-						  padded_width, 8));
-	} else {
-		f->fmt.pix.bytesperline = DIV_ROUND_UP(format_bridge->depth *
-						      padded_width, 8);
-		f->fmt.pix.sizeimage = PAGE_ALIGN(f->fmt.pix.height * f->fmt.pix.bytesperline);
-	}
-
-	if (f->fmt.pix.field == V4L2_FIELD_ANY)
-		f->fmt.pix.field = V4L2_FIELD_NONE;
-
-	/*
-	 * FIXME: do we need to setup this differently, depending on the
-	 * sensor or the pipeline?
-	 */
-	f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
-	f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_709;
-	f->fmt.pix.xfer_func = V4L2_XFER_FUNC_709;
-
-	f->fmt.pix.width -= pad_w;
-	f->fmt.pix.height -= pad_h;
-
-	return 0;
-}
-
 /* This function looks up the closest available resolution. */
 static int atomisp_try_fmt_cap(struct file *file, void *fh,
 			       struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
-	u32 pixfmt = f->fmt.pix.pixelformat;
-	int ret;
+	struct atomisp_device *isp = video_get_drvdata(vdev);
 
-	/*
-	 * atomisp_try_fmt() gived results with padding included, note
-	 * (this gets removed again by the atomisp_adjust_fmt() call below.
-	 */
-	f->fmt.pix.width += pad_w;
-	f->fmt.pix.height += pad_h;
-
-	ret = atomisp_try_fmt(vdev, &f->fmt.pix);
-	if (ret)
-		return ret;
-
-	/*
-	 * atomisp_try_fmt() replaces pixelformat with the sensors native
-	 * format, restore the actual format requested by userspace.
-	 */
-	f->fmt.pix.pixelformat = pixfmt;
-
-	return atomisp_adjust_fmt(f);
+	return atomisp_try_fmt(isp, &f->fmt.pix, NULL, NULL);
 }
 
 static int atomisp_g_fmt_cap(struct file *file, void *fh,
-- 
2.40.1

