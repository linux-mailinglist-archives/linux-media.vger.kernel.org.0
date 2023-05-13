Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E1070169D
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238321AbjEMMdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238306AbjEMMdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F143583
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mDVQOEfSIJjlCZed7p+LWOLPgaQbm5azq4o3gHVbYLg=;
        b=UPeYUP5/cB/5JQ/1aVlsbN1WjMqkQbG00YpZKwCSPU2Fyk0zL2iIcz0v6+IIXEu8L16ING
        5d4hrSSEHI9PhnuzlcmH+4s8eEG3ZC8eKI90U5PrpjMeuvwl2ej1fWWrxXJ9hScxTneETo
        vGZQFtSiXEanjRXoZW9Zdz/VY92s5Gg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-PSKkbRhWOxKnHwuzBvtHCA-1; Sat, 13 May 2023 08:32:11 -0400
X-MC-Unique: PSKkbRhWOxKnHwuzBvtHCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1361E101A551;
        Sat, 13 May 2023 12:32:11 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 829A840C2076;
        Sat, 13 May 2023 12:32:09 +0000 (UTC)
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
Subject: [PATCH 05/30] media: atomisp: Replace source-pad checks with run-mode checks
Date:   Sat, 13 May 2023 14:31:34 +0200
Message-Id: <20230513123159.33234-6-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently atomisp behavior is determined by a mix of which /dev/video# node
(which isp-subdev source-pad) is opened + which run-mode is set.
With various combinations not being allowed and likely leading to crashes
due to lack of error checking.

Now that we no longer support continuous mode and thus no longer support
streaming from 2 /dev/video# nodes at the same time, there is no need
to have a separate /dev/video# node for each run-mode. Instead the plan is
to support the 3 different run-modes on a single /dev/video# node.
Since we are moving to a single isp-subdev source-pad, the behavior should
then be solely and consistently be defined by the run-mode.

Replace various source-pad checks with run-mode checks in preparation for
moving to a single source-pad. In some places the new run-mode checks
overlap with existing run-mode checks and the checks are folded together
into a single check.

This removes handling of the ATOMISP_SUBDEV_PAD_SOURCE_VF source-pad,
this source-pad was only useful for continuous mode, for which support has
been removed.

Note that currently the only run-mode which we actually have been able to
get to work is the video-capture with scaler aka preview mode and as such
that is also the only run-mode tested. This patch is intended to preserve
the current (known to not work 100%) behavior of the other run-modes, so
that those maybe can be enabled later.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 37 +++-------
 .../media/atomisp/pci/atomisp_compat_css20.c  | 72 ++++---------------
 .../media/atomisp/pci/atomisp_subdev.c        | 23 ++----
 3 files changed, 29 insertions(+), 103 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index ed1a534b7c05..710e97a492c6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4215,21 +4215,12 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 					ATOMISP_SUBDEV_PAD_SOURCE_VF, &vf_ffmt);
 		asd->video_out_vf.sh_fmt = IA_CSS_FRAME_FORMAT_NV12;
 
-		if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
+		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
+		    asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
 			atomisp_css_video_configure_viewfinder(asd,
 							       vf_size.width, vf_size.height, 0,
 							       asd->video_out_vf.sh_fmt);
-		} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-			if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW ||
-			    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO)
-				atomisp_css_video_configure_viewfinder(asd,
-								       vf_size.width, vf_size.height, 0,
-								       asd->video_out_vf.sh_fmt);
-			else
-				atomisp_css_capture_configure_viewfinder(asd,
-					vf_size.width, vf_size.height, 0,
-					asd->video_out_vf.sh_fmt);
-		} else if (source_pad != ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW ||
+		} else if (asd->run_mode->val == ATOMISP_RUN_MODE_STILL_CAPTURE ||
 			   asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
 			atomisp_css_capture_configure_viewfinder(asd,
 				vf_size.width, vf_size.height, 0,
@@ -4255,7 +4246,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		configure_output = atomisp_css_video_configure_output;
 		get_frame_info = atomisp_css_video_get_output_frame_info;
 		pipe_id = IA_CSS_PIPE_ID_VIDEO;
-	} else if (source_pad == ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW) {
+	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
 		configure_output = atomisp_css_preview_configure_output;
 		get_frame_info = atomisp_css_preview_get_output_frame_info;
 		configure_pp_input = atomisp_css_preview_configure_pp_input;
@@ -4386,7 +4377,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	struct atomisp_device *isp;
 	struct atomisp_input_stream_info *stream_info =
 	    (struct atomisp_input_stream_info *)ffmt->reserved;
-	int source_pad = atomisp_subdev_source_pad(vdev);
 	struct v4l2_subdev_fh fh;
 	int ret;
 
@@ -4417,8 +4407,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	req_ffmt = ffmt;
 
 	/* Disable dvs if resolution can't be supported by sensor */
-	if (asd->params.video_dis_en &&
-	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO) {
+	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 		vformat.which = V4L2_SUBDEV_FORMAT_TRY;
 		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
 				       pad, set_fmt, &pad_state, &vformat);
@@ -4453,8 +4442,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	    ffmt->height < ATOM_ISP_STEP_HEIGHT)
 		return -EINVAL;
 
-	if (asd->params.video_dis_en &&
-	    source_pad == ATOMISP_SUBDEV_PAD_SOURCE_VIDEO &&
+	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
 	    (ffmt->width < req_ffmt->width || ffmt->height < req_ffmt->height)) {
 		dev_warn(isp->dev,
 			 "can not enable video dis due to sensor limitation.");
@@ -5005,16 +4993,11 @@ static int atomisp_get_pipe_id(struct atomisp_video_pipe *pipe)
 		return IA_CSS_PIPE_ID_VIDEO;
 	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
 		return IA_CSS_PIPE_ID_CAPTURE;
-	} else if (pipe == &asd->video_out_video_capture) {
+	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 		return IA_CSS_PIPE_ID_VIDEO;
-	} else if (pipe == &asd->video_out_vf) {
-		return IA_CSS_PIPE_ID_CAPTURE;
-	} else if (pipe == &asd->video_out_preview) {
-		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
-			return IA_CSS_PIPE_ID_VIDEO;
-		else
-			return IA_CSS_PIPE_ID_PREVIEW;
-	} else if (pipe == &asd->video_out_capture) {
+	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
+		return IA_CSS_PIPE_ID_PREVIEW;
+	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_STILL_CAPTURE) {
 		if (asd->copy_mode)
 			return IA_CSS_PIPE_ID_COPY;
 		else
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index e8c26e66ae7e..dfed7f1fbf6b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2416,41 +2416,21 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 	return -EINVAL;
 }
 
-static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd,
-	uint16_t source_pad)
+static unsigned int atomisp_get_pipe_index(struct atomisp_sub_device *asd)
 {
-	struct atomisp_device *isp = asd->isp;
-
-	switch (source_pad) {
-	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO:
-		if (asd->copy_mode)
-			return IA_CSS_PIPE_ID_COPY;
-		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO
-		    || asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER)
-			return IA_CSS_PIPE_ID_VIDEO;
+	if (asd->copy_mode)
+		return IA_CSS_PIPE_ID_COPY;
 
+	switch (asd->run_mode->val) {
+	case ATOMISP_RUN_MODE_VIDEO:
+		return IA_CSS_PIPE_ID_VIDEO;
+	case ATOMISP_RUN_MODE_STILL_CAPTURE:
 		return IA_CSS_PIPE_ID_CAPTURE;
-	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE:
-		if (asd->copy_mode)
-			return IA_CSS_PIPE_ID_COPY;
-
-		return IA_CSS_PIPE_ID_CAPTURE;
-	case ATOMISP_SUBDEV_PAD_SOURCE_VF:
-		if (!atomisp_is_mbuscode_raw(asd->fmt[asd->capture_pad].fmt.code)) {
-			return IA_CSS_PIPE_ID_CAPTURE;
-		}
-		fallthrough;
-	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
-		if (asd->copy_mode)
-			return IA_CSS_PIPE_ID_COPY;
-		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
-			return IA_CSS_PIPE_ID_VIDEO;
-
+	case ATOMISP_RUN_MODE_PREVIEW:
 		return IA_CSS_PIPE_ID_PREVIEW;
 	}
-	dev_warn(isp->dev,
-		 "invalid source pad:%d, return default preview pipe index.\n",
-		 source_pad);
+
+	dev_warn(asd->isp->dev, "cannot determine pipe-index return default preview pipe\n");
 	return IA_CSS_PIPE_ID_PREVIEW;
 }
 
@@ -2459,7 +2439,7 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 			       struct ia_css_frame_info *frame_info)
 {
 	struct ia_css_pipe_info info;
-	int pipe_index = atomisp_get_pipe_index(asd, source_pad);
+	int pipe_index = atomisp_get_pipe_index(asd);
 	int stream_index;
 	struct atomisp_device *isp = asd->isp;
 
@@ -2473,34 +2453,8 @@ int atomisp_get_css_frame_info(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	switch (source_pad) {
-	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE:
-		*frame_info = info.output_info[0];
-		break;
-	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO:
-		*frame_info = info.output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
-		break;
-	case ATOMISP_SUBDEV_PAD_SOURCE_VF:
-		if (stream_index == ATOMISP_INPUT_STREAM_POSTVIEW)
-			*frame_info = info.output_info[0];
-		else
-			*frame_info = info.vf_output_info[0];
-		break;
-	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
-		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
-		    (pipe_index == IA_CSS_PIPE_ID_VIDEO ||
-		     pipe_index == IA_CSS_PIPE_ID_YUVPP))
-			*frame_info = info.vf_output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
-		else
-			*frame_info =
-			    info.output_info[ATOMISP_CSS_OUTPUT_DEFAULT_INDEX];
-
-		break;
-	default:
-		frame_info = NULL;
-		break;
-	}
-	return frame_info ? 0 : -EINVAL;
+	*frame_info = info.output_info[0];
+	return 0;
 }
 
 int atomisp_css_copy_configure_output(struct atomisp_sub_device *asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index cb8ab0e47d1a..ae57aef377b4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -393,8 +393,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 	r->width = rounddown(r->width, ATOM_ISP_STEP_WIDTH);
 	r->height = rounddown(r->height, ATOM_ISP_STEP_HEIGHT);
 
-	switch (pad) {
-	case ATOMISP_SUBDEV_PAD_SINK: {
+	if (pad == ATOMISP_SUBDEV_PAD_SINK) {
 		/* Only crop target supported on sink pad. */
 		unsigned int dvs_w, dvs_h;
 
@@ -445,7 +444,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		}
 
 		if (which == V4L2_SUBDEV_FORMAT_TRY)
-			break;
+			goto get_rect;
 
 		if (isp_sd->params.video_dis_en &&
 		    isp_sd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
@@ -468,12 +467,8 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 							   ATOMISP_INPUT_STREAM_GENERAL,
 							   crop[pad]->width,
 							   crop[pad]->height);
-		break;
-	}
-	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE:
-	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO: {
+	} else if (isp_sd->run_mode->val != ATOMISP_RUN_MODE_PREVIEW) {
 		/* Only compose target is supported on source pads. */
-
 		if (isp_sd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
 			/* Scaling is disabled in this mode */
 			r->width = crop[ATOMISP_SUBDEV_PAD_SINK]->width;
@@ -492,7 +487,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		if (r->width == 0 || r->height == 0 ||
 		    crop[ATOMISP_SUBDEV_PAD_SINK]->width == 0 ||
 		    crop[ATOMISP_SUBDEV_PAD_SINK]->height == 0)
-			break;
+			goto get_rect;
 		/*
 		 * do cropping on sensor input if ratio of required resolution
 		 * is different with sensor output resolution ratio:
@@ -522,18 +517,12 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				rounddown(crop[ATOMISP_SUBDEV_PAD_SINK]->
 					  width * r->height / r->width,
 					  ATOM_ISP_STEP_WIDTH));
-
-		break;
-	}
-	case ATOMISP_SUBDEV_PAD_SOURCE_VF:
-	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
+	} else {
 		comp[pad]->width = r->width;
 		comp[pad]->height = r->height;
-		break;
-	default:
-		return -EINVAL;
 	}
 
+get_rect:
 	/* Set format dimensions on non-sink pads as well. */
 	if (pad != ATOMISP_SUBDEV_PAD_SINK) {
 		ffmt[pad]->width = comp[pad]->width;
-- 
2.40.1

