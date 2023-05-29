Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C765C714809
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjE2Kjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjE2Kju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358D3FF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6/57f7bCSmz1dsaY9gDauPjpq3rCXXd7irlGWzS0jqs=;
        b=c9djSouBxRTnyxwWIZmMSNI3qSSXi3FzArp/nUE6eog0FSB1NZr5KNXdOq3aJkTAeQAqUw
        TvIAYZsw/5yJ6cY5EFx2GdsxKCnHpSVhoqDTKwdjLS2w3RQYtN+7pEAoH0KODufSoYo6il
        VUQHTuoEPhKfNc2sUfBvQ8jq+uSMm+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-CEItAzJsN2mqdhLzaYkJ7g-1; Mon, 29 May 2023 06:38:55 -0400
X-MC-Unique: CEItAzJsN2mqdhLzaYkJ7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0825800962;
        Mon, 29 May 2023 10:38:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6A9452166B2B;
        Mon, 29 May 2023 10:38:53 +0000 (UTC)
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
Subject: [PATCH 18/21] media: atomisp: Use selection API info to determine sensor padding
Date:   Mon, 29 May 2023 12:37:38 +0200
Message-Id: <20230529103741.11904-19-hdegoede@redhat.com>
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

Using the selection / crop info to determine the padding values
to use with a specific resolution on specific sensor.

This allows e.g. automatically halving the padding when using
the max binned resolution and also ensures the right amount
of padding is used on models with 2 sensors with different
padding requirements.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 57 ++++++++++++++-----
 .../media/atomisp/pci/atomisp_subdev.c        | 14 +----
 .../media/atomisp/pci/atomisp_subdev.h        |  3 +
 3 files changed, 48 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 8c48d566131f..ce16850170c4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3688,6 +3688,33 @@ static void atomisp_fill_pix_format(struct v4l2_pix_format *f,
 	f->xfer_func = V4L2_XFER_FUNC_709;
 }
 
+/* Get sensor padding values for the non padded width x height resolution */
+static void atomisp_get_padding(struct atomisp_device *isp,
+				u32 width, u32 height,
+				u32 *padding_w, u32 *padding_h)
+{
+	struct atomisp_input_subdev *input = &isp->inputs[isp->asd.input_curr];
+	struct v4l2_rect native_rect = input->native_rect;
+
+	if (!input->crop_support) {
+		*padding_w = pad_w;
+		*padding_h = pad_h;
+		return;
+	}
+
+	width = min(width, input->active_rect.width);
+	height = min(height, input->active_rect.height);
+
+	if (input->binning_support && width <= (input->active_rect.width / 2) &&
+				      height <= (input->active_rect.height / 2)) {
+		native_rect.width /= 2;
+		native_rect.height /= 2;
+	}
+
+	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
+	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+}
+
 /* This function looks up the closest available resolution. */
 int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
@@ -3702,6 +3729,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 	};
+	u32 padding_w, padding_h;
 	int ret;
 
 	if (!input->camera)
@@ -3722,9 +3750,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
+	atomisp_get_padding(isp, f->width, f->height, &padding_w, &padding_h);
 	v4l2_fill_mbus_format(&format.format, f, fmt->mbus_code);
-	format.format.width += pad_w;
-	format.format.height += pad_h;
+	format.format.width += padding_w;
+	format.format.height += padding_h;
 
 	dev_dbg(isp->dev, "try_mbus_fmt: asking for %ux%u\n",
 		format.format.width, format.format.height);
@@ -3743,8 +3772,8 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
-	f->width = format.format.width - pad_w;
-	f->height = format.format.height - pad_h;
+	f->width = format.format.width - padding_w;
+	f->height = format.format.height - padding_h;
 
 	/*
 	 * If the format is jpeg or custom RAW, then the width and height will
@@ -4153,7 +4182,6 @@ static void atomisp_check_copy_mode(struct atomisp_sub_device *asd,
 }
 
 static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_pix_format *f,
-				  unsigned int padding_w, unsigned int padding_h,
 				  unsigned int dvs_env_w, unsigned int dvs_env_h)
 {
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
@@ -4184,11 +4212,11 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 		return -EINVAL;
 
 	v4l2_fill_mbus_format(ffmt, f, format->mbus_code);
-	ffmt->height += padding_h + dvs_env_h;
-	ffmt->width += padding_w + dvs_env_w;
+	ffmt->height += asd->sink_pad_padding_h + dvs_env_h;
+	ffmt->width += asd->sink_pad_padding_w + dvs_env_w;
 
 	dev_dbg(isp->dev, "s_mbus_fmt: ask %ux%u (padding %ux%u, dvs %ux%u)\n",
-		ffmt->width, ffmt->height, padding_w, padding_h,
+		ffmt->width, ffmt->height, asd->sink_pad_padding_w, asd->sink_pad_padding_h,
 		dvs_env_w, dvs_env_h);
 
 	__atomisp_init_stream_info(ATOMISP_INPUT_STREAM_GENERAL, stream_info);
@@ -4252,7 +4280,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	const struct atomisp_format_bridge *snr_format_bridge;
 	struct ia_css_frame_info output_info;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
-	unsigned int padding_w = pad_w, padding_h = pad_h;
 	struct v4l2_mbus_framefmt isp_source_fmt = {0};
 	struct v4l2_rect isp_sink_crop;
 	int ret;
@@ -4283,16 +4310,18 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 				V4L2_SUBDEV_FORMAT_ACTIVE,
 				ATOMISP_SUBDEV_PAD_SOURCE, &isp_source_fmt);
 
-	if (!atomisp_subdev_format_conversion(asd)) {
-		padding_w = 0;
-		padding_h = 0;
+	if (atomisp_subdev_format_conversion(asd)) {
+		atomisp_get_padding(isp, f->fmt.pix.width, f->fmt.pix.height,
+				    &asd->sink_pad_padding_w, &asd->sink_pad_padding_h);
+	} else {
+		asd->sink_pad_padding_w = 0;
+		asd->sink_pad_padding_h = 0;
 	}
 
 	atomisp_get_dis_envelop(asd, f->fmt.pix.width, f->fmt.pix.height,
 				&dvs_env_w, &dvs_env_h);
 
-	ret = atomisp_set_fmt_to_snr(vdev, &f->fmt.pix,
-				     padding_w, padding_h, dvs_env_w, dvs_env_h);
+	ret = atomisp_set_fmt_to_snr(vdev, &f->fmt.pix, dvs_env_w, dvs_env_h);
 	if (ret) {
 		dev_warn(isp->dev,
 			 "Set format to sensor failed with %d\n", ret);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 04e257ede7d4..45073e401bac 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -357,8 +357,6 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *ffmt[ATOMISP_SUBDEV_PADS_NUM];
 	struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 		       *comp[ATOMISP_SUBDEV_PADS_NUM];
-	unsigned int padding_w = pad_w;
-	unsigned int padding_h = pad_h;
 
 	if ((pad == ATOMISP_SUBDEV_PAD_SINK && target != V4L2_SEL_TGT_CROP) ||
 	    (pad == ATOMISP_SUBDEV_PAD_SOURCE && target != V4L2_SEL_TGT_COMPOSE))
@@ -384,18 +382,10 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		crop[pad]->width = ffmt[pad]->width;
 		crop[pad]->height = ffmt[pad]->height;
 
-		/* Workaround for BYT 1080p perfectshot since the maxinum resolution of
-		 * front camera ov2722 is 1932x1092 and cannot use pad_w > 12*/
-		if (!strncmp(isp->inputs[isp_sd->input_curr].camera->name,
-			     "ov2722", 6) && crop[pad]->height == 1092) {
-			padding_w = 12;
-			padding_h = 12;
-		}
-
 		if (atomisp_subdev_format_conversion(isp_sd)
 		    && crop[pad]->width && crop[pad]->height) {
-			crop[pad]->width -= padding_w;
-			crop[pad]->height -= padding_h;
+			crop[pad]->width -= isp_sd->sink_pad_padding_w;
+			crop[pad]->height -= isp_sd->sink_pad_padding_h;
 		}
 
 		if (isp_sd->params.video_dis_en &&
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index c9f6561dbcb6..9a04511b9efd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -239,6 +239,9 @@ struct atomisp_sub_device {
 	struct v4l2_subdev subdev;
 	struct media_pad pads[ATOMISP_SUBDEV_PADS_NUM];
 	struct atomisp_pad_format fmt[ATOMISP_SUBDEV_PADS_NUM];
+	/* Padding for currently set sink-pad fmt */
+	u32 sink_pad_padding_w;
+	u32 sink_pad_padding_h;
 
 	unsigned int output;
 	struct atomisp_video_pipe video_out;
-- 
2.40.1

