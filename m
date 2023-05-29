Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C777714805
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjE2Kjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjE2Kjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6204C9
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4J2pDOIuXm1d3F/ROy7HoG7UcufQR9wQsI+BRl9yAl0=;
        b=ZhaxgvEXMpP3XMbkjsYd5m0RKPyN/dDih70Gm2FOwopNdYsiWDnIQZwWjP3BvSlDAJmwAE
        UfghNTpRNu11rj+8PUnvP4S2+weENWeCynjpWGMDMIUiK0D3xo5cxLhDc2p3/sTD36h1RK
        KGPVeCWx07zK10/ChCE4IR3+LKsd/Y0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-Wdppck6uN_Gjno0pnsLiGQ-1; Mon, 29 May 2023 06:38:44 -0400
X-MC-Unique: Wdppck6uN_Gjno0pnsLiGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19F57185A78E;
        Mon, 29 May 2023 10:38:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C9C22166B2B;
        Mon, 29 May 2023 10:38:40 +0000 (UTC)
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
Subject: [PATCH 12/21] media: atomisp: Add input helper variable for isp->asd->inputs[asd->input_curr]
Date:   Mon, 29 May 2023 12:37:32 +0200
Message-Id: <20230529103741.11904-13-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-1-hdegoede@redhat.com>
References: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
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

Passing 'isp->asd->inputs[asd->input_curr].foo' as argument to
various function calls is rather long.

Add a local input helper variable for this, so that the function
calls will fit on one line.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 33 +++++++++----------
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +--
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 87184ddf94c5..243a789fef6a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3662,6 +3662,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 {
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
 		.pads = &pad_cfg,
@@ -3678,7 +3679,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 		return -EINVAL;
 	}
 
-	if (!isp->inputs[asd->input_curr].camera)
+	if (!input->camera)
 		return -EINVAL;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3700,8 +3701,7 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f)
 	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
 		format.format.width, format.format.height);
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-			       pad, set_fmt, &pad_state, &format);
+	ret = v4l2_subdev_call(input->camera, pad, set_fmt, &pad_state, &format);
 	if (ret)
 		return ret;
 
@@ -3761,6 +3761,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_in_fmt_conv *fc;
 	int mipi_freq = 0;
 	unsigned int input_format, bayer_order;
@@ -3768,8 +3769,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	u32 mipi_port, metadata_width = 0, metadata_height = 0;
 
 	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].camera->ctrl_handler, &ctrl) == 0)
+	if (v4l2_g_ctrl(input->camera->ctrl_handler, &ctrl) == 0)
 		mipi_freq = ctrl.value;
 
 	if (asd->stream_env[stream_id].isys_configs == 1) {
@@ -3827,7 +3827,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		return -EINVAL;
 
 	input_format = fc->atomisp_in_fmt;
-	mipi_port = atomisp_port_to_mipi_port(isp, isp->inputs[asd->input_curr].port);
+	mipi_port = atomisp_port_to_mipi_port(isp, input->port);
 	atomisp_css_input_configure_port(asd, mipi_port,
 					 isp->sensor_lanes[mipi_port],
 					 0xffff4, mipi_freq,
@@ -3905,6 +3905,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	struct camera_mipi_info *mipi_info;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_format_bridge *format;
 	struct v4l2_rect *isp_sink_crop;
 	enum ia_css_pipe_id pipe_id;
@@ -3936,9 +3937,8 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	if (!format)
 		return -EINVAL;
 
-	if (isp->inputs[asd->input_curr].type != TEST_PATTERN) {
-		mipi_info = atomisp_to_sensor_mipi_info(
-				isp->inputs[asd->input_curr].camera);
+	if (input->type != TEST_PATTERN) {
+		mipi_info = atomisp_to_sensor_mipi_info(input->camera);
 
 		if (atomisp_set_sensor_mipi_to_isp(asd, ATOMISP_INPUT_STREAM_GENERAL,
 						   mipi_info))
@@ -4122,6 +4122,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 {
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
+	struct atomisp_device *isp = asd->isp;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_pad_config pad_cfg;
 	struct v4l2_subdev_state pad_state = {
@@ -4132,7 +4134,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	};
 	struct v4l2_mbus_framefmt *ffmt = &vformat.format;
 	struct v4l2_mbus_framefmt *req_ffmt;
-	struct atomisp_device *isp;
 	struct atomisp_input_stream_info *stream_info =
 	    (struct atomisp_input_stream_info *)ffmt->reserved;
 	int ret;
@@ -4143,8 +4144,6 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		return -EINVAL;
 	}
 
-	isp = asd->isp;
-
 	format = atomisp_get_format_bridge(f->pixelformat);
 	if (!format)
 		return -EINVAL;
@@ -4164,8 +4163,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 	/* Disable dvs if resolution can't be supported by sensor */
 	if (asd->params.video_dis_en && asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
 		vformat.which = V4L2_SUBDEV_FORMAT_TRY;
-		ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-				       pad, set_fmt, &pad_state, &vformat);
+		ret = v4l2_subdev_call(input->camera, pad, set_fmt, &pad_state, &vformat);
 		if (ret)
 			return ret;
 
@@ -4183,8 +4181,7 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		}
 	}
 	vformat.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
-			       set_fmt, NULL, &vformat);
+	ret = v4l2_subdev_call(input->camera, pad, set_fmt, NULL, &vformat);
 	if (ret)
 		return ret;
 
@@ -4216,6 +4213,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info;
@@ -4259,8 +4257,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	vformat.format.height += padding_h;
 	vformat.format.width += padding_w;
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
-			       set_fmt, NULL, &vformat);
+	ret = v4l2_subdev_call(input->camera, pad, set_fmt, NULL, &vformat);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 6a86dc7a933f..fc3f9883914e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -703,14 +703,14 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
+	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_frame_size_enum fse = {
 		.index = fsize->index,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	int ret;
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-			       pad, enum_frame_size, NULL, &fse);
+	ret = v4l2_subdev_call(input->camera, pad, enum_frame_size, NULL, &fse);
 	if (ret)
 		return ret;
 
-- 
2.40.1

