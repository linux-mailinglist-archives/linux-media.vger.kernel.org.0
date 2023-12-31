Return-Path: <linux-media+bounces-3115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A084820AFF
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 11:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB9BB1F213D4
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC65833D3;
	Sun, 31 Dec 2023 10:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VV8POzeO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E47928F5
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704018675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRjl+EEoEb7iX2OhBiLVx7Fnpl+HQgXRWjnp9dR9eE4=;
	b=VV8POzeORuNWYG7f0SolEwTEF4jRNgmO4b8o5VL5f/gGyynhJiPvP1EWgmgjH1klk4Hw4q
	GkG32BsgKNK3m7OjfEknJgbKvCvjCZoMfNjW89TqEFv7ETLNXTWTEZFLgTMTscnI9EWv54
	8fHhpIPfcCyUUIFbZ98gSeSkUZtMBJ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-IX-DVSR5O16CYB9hU__i7A-1; Sun, 31 Dec 2023 05:31:11 -0500
X-MC-Unique: IX-DVSR5O16CYB9hU__i7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF040185A780;
	Sun, 31 Dec 2023 10:31:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78681492BC6;
	Sun, 31 Dec 2023 10:31:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 02/15] media: atomisp: Refactor sensor crop + fmt setting
Date: Sun, 31 Dec 2023 11:30:44 +0100
Message-ID: <20231231103057.35837-3-hdegoede@redhat.com>
In-Reply-To: <20231231103057.35837-1-hdegoede@redhat.com>
References: <20231231103057.35837-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

There are 3 code-paths all of 3 which need to do:

1. Get try or active state
2. lock state
3. Call atomisp_set_crop()
4. Call v4l2_subdev_call(input->camera, pad, set_fmt, state, fmt)
5. unlock state

Change atomisp_set_crop into atomisp_set_crop_and_fmt() which does all of
this and change the 3 code-paths which need this to use the new
atomisp_set_crop_and_fmt() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 141 +++++++-----------
 1 file changed, 58 insertions(+), 83 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 555814012fce..bfa15fb45971 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3721,22 +3721,34 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	*padding_h = max_t(u32, *padding_h, min_pad_h);
 }
 
-static int atomisp_set_crop(struct atomisp_device *isp,
-			    const struct v4l2_mbus_framefmt *format,
-			    struct v4l2_subdev_state *sd_state,
-			    int which)
+static int atomisp_set_crop_and_fmt(struct atomisp_device *isp,
+				    struct v4l2_mbus_framefmt *ffmt,
+				    int which)
 {
 	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
 	struct v4l2_subdev_selection sel = {
 		.which = which,
 		.target = V4L2_SEL_TGT_CROP,
-		.r.width = format->width,
-		.r.height = format->height,
+		.r.width = ffmt->width,
+		.r.height = ffmt->height,
 	};
-	int ret;
+	struct v4l2_subdev_format format = {
+		.which = which,
+		.format = *ffmt,
+	};
+	struct v4l2_subdev_state *sd_state;
+	int ret = 0;
+
+	if (!input->camera)
+		return -EINVAL;
+
+	sd_state = (which == V4L2_SUBDEV_FORMAT_TRY) ? input->try_sd_state :
+						       input->camera->active_state;
+	if (sd_state)
+		v4l2_subdev_lock_state(sd_state);
 
 	if (!input->crop_support)
-		return 0;
+		goto set_fmt;
 
 	/* Cropping is done before binning, when binning double the crop rect */
 	if (input->binning_support && sel.r.width <= (input->native_rect.width / 2) &&
@@ -3757,6 +3769,14 @@ static int atomisp_set_crop(struct atomisp_device *isp,
 		dev_err(isp->dev, "Error setting crop to %ux%u @%ux%u: %d\n",
 			sel.r.width, sel.r.height, sel.r.left, sel.r.top, ret);
 
+set_fmt:
+	if (ret == 0)
+		ret = v4l2_subdev_call(input->camera, pad, set_fmt, sd_state, &format);
+
+	if (sd_state)
+		v4l2_subdev_unlock_state(sd_state);
+
+	*ffmt = format.format;
 	return ret;
 }
 
@@ -3767,16 +3787,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 {
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
-	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
-	struct v4l2_subdev_format format = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
+	struct v4l2_mbus_framefmt ffmt = { };
 	u32 padding_w, padding_h;
 	int ret;
 
-	if (!input->camera)
-		return -EINVAL;
-
 	fmt = atomisp_get_format_bridge(f->pixelformat);
 	/* Currently, raw formats are broken!!! */
 	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
@@ -3797,38 +3811,27 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
 	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
-	v4l2_fill_mbus_format(&format.format, f, fmt->mbus_code);
-	format.format.width += padding_w;
-	format.format.height += padding_h;
+	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
+	ffmt.width += padding_w;
+	ffmt.height += padding_h;
 
-	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
-		format.format.width, format.format.height);
-
-	v4l2_subdev_lock_state(input->try_sd_state);
-
-	ret = atomisp_set_crop(isp, &format.format, input->try_sd_state,
-			       V4L2_SUBDEV_FORMAT_TRY);
-	if (ret == 0)
-		ret = v4l2_subdev_call(input->camera, pad, set_fmt,
-				       input->try_sd_state, &format);
-
-	v4l2_subdev_unlock_state(input->try_sd_state);
+	dev_dbg(isp->dev, "try_mbus_fmt: try %ux%u\n", ffmt.width, ffmt.height);
 
+	ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
 	if (ret)
 		return ret;
 
-	dev_dbg(isp->dev, "try_mbus_fmt: got %ux%u\n",
-		format.format.width, format.format.height);
+	dev_dbg(isp->dev, "try_mbus_fmt: got %ux%u\n", ffmt.width, ffmt.height);
 
-	snr_fmt = atomisp_get_format_bridge_from_mbus(format.format.code);
+	snr_fmt = atomisp_get_format_bridge_from_mbus(ffmt.code);
 	if (!snr_fmt) {
 		dev_err(isp->dev, "unknown sensor format 0x%8.8x\n",
-			format.format.code);
+			ffmt.code);
 		return -EINVAL;
 	}
 
-	f->width = format.format.width - padding_w;
-	f->height = format.format.height - padding_h;
+	f->width = ffmt.width - padding_w;
+	f->height = ffmt.height - padding_h;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4236,28 +4239,22 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = asd->isp;
-	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_format_bridge *format;
-	struct v4l2_subdev_state *act_sd_state;
-	struct v4l2_subdev_format vformat = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_mbus_framefmt *ffmt = &vformat.format;
-	struct v4l2_mbus_framefmt *req_ffmt;
+	struct v4l2_mbus_framefmt req_ffmt, ffmt = { };
 	struct atomisp_input_stream_info *stream_info =
-	    (struct atomisp_input_stream_info *)ffmt->reserved;
+	    (struct atomisp_input_stream_info *)&ffmt.reserved;
 	int ret;
 
 	format = atomisp_get_format_bridge(f->pixelformat);
 	if (!format)
 		return -EINVAL;
 
-	v4l2_fill_mbus_format(ffmt, f, format->mbus_code);
-	ffmt->height += asd->sink_pad_padding_h + dvs_env_h;
-	ffmt->width += asd->sink_pad_padding_w + dvs_env_w;
+	v4l2_fill_mbus_format(&ffmt, f, format->mbus_code);
+	ffmt.height += asd->sink_pad_padding_h + dvs_env_h;
+	ffmt.width += asd->sink_pad_padding_w + dvs_env_w;
 
 	dev_dbg(isp->dev, "s_mbus_fmt: ask %ux%u (padding %ux%u, dvs %ux%u)\n",
-		ffmt->width, ffmt->height, asd->sink_pad_padding_w, asd->sink_pad_padding_h,
+		ffmt.width, ffmt.height, asd->sink_pad_padding_w, asd->sink_pad_padding_h,
 		dvs_env_w, dvs_env_h);
 
 	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
@@ -4266,28 +4263,17 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 
 	/* Disable dvs if resolution can't be supported by sensor */
 	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		v4l2_subdev_lock_state(input->try_sd_state);
-
-		ret = atomisp_set_crop(isp, &vformat.format, input->try_sd_state,
-				       V4L2_SUBDEV_FORMAT_TRY);
-		if (ret == 0) {
-			vformat.which = V4L2_SUBDEV_FORMAT_TRY;
-			ret = v4l2_subdev_call(input->camera, pad, set_fmt,
-					       input->try_sd_state, &vformat);
-		}
-
-		v4l2_subdev_unlock_state(input->try_sd_state);
-
+		ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_TRY);
 		if (ret)
 			return ret;
 
 		dev_dbg(isp->dev, "video dis: sensor width: %d, height: %d\n",
-			ffmt->width, ffmt->height);
+			ffmt.width, ffmt.height);
 
-		if (ffmt->width < req_ffmt->width ||
-		    ffmt->height < req_ffmt->height) {
-			req_ffmt->height -= dvs_env_h;
-			req_ffmt->width -= dvs_env_w;
+		if (ffmt.width < req_ffmt.width ||
+		    ffmt.height < req_ffmt.height) {
+			req_ffmt.height -= dvs_env_h;
+			req_ffmt.width -= dvs_env_w;
 			ffmt = req_ffmt;
 			dev_warn(isp->dev,
 				 "can not enable video dis due to sensor limitation.");
@@ -4295,32 +4281,21 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		}
 	}
 
-	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->camera);
-
-	ret = atomisp_set_crop(isp, &vformat.format, act_sd_state,
-			       V4L2_SUBDEV_FORMAT_ACTIVE);
-	if (ret == 0) {
-		vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		ret = v4l2_subdev_call(input->camera, pad, set_fmt, act_sd_state, &vformat);
-	}
-
-	if (act_sd_state)
-		v4l2_subdev_unlock_state(act_sd_state);
-
+	ret = atomisp_set_crop_and_fmt(isp, &ffmt, V4L2_SUBDEV_FORMAT_ACTIVE);
 	if (ret)
 		return ret;
 
 	__atomisp_update_stream_env(asd, ATOMISP_INPUT_STREAM_GENERAL, stream_info);
 
 	dev_dbg(isp->dev, "sensor width: %d, height: %d\n",
-		ffmt->width, ffmt->height);
+		ffmt.width, ffmt.height);
 
-	if (ffmt->width < ATOM_ISP_STEP_WIDTH ||
-	    ffmt->height < ATOM_ISP_STEP_HEIGHT)
+	if (ffmt.width < ATOM_ISP_STEP_WIDTH ||
+	    ffmt.height < ATOM_ISP_STEP_HEIGHT)
 		return -EINVAL;
 
 	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
-	    (ffmt->width < req_ffmt->width || ffmt->height < req_ffmt->height)) {
+	    (ffmt.width < req_ffmt.width || ffmt.height < req_ffmt.height)) {
 		dev_warn(isp->dev,
 			 "can not enable video dis due to sensor limitation.");
 		asd->params.video_dis_en = false;
@@ -4328,9 +4303,9 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 
 	atomisp_subdev_set_ffmt(&asd->subdev, NULL,
 				V4L2_SUBDEV_FORMAT_ACTIVE,
-				ATOMISP_SUBDEV_PAD_SINK, ffmt);
+				ATOMISP_SUBDEV_PAD_SINK, &ffmt);
 
-	return css_input_resolution_changed(asd, ffmt);
+	return css_input_resolution_changed(asd, &ffmt);
 }
 
 int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
-- 
2.43.0


