Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9D170169E
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238341AbjEMMdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238330AbjEMMdm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3723635A7
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lzdrXK6oeA34c/66GxXyok5qrrDVLIpLKDmpnsDktXA=;
        b=Dwee3iaIhlbORZplZto5qPB1Uf9NTm2MD4JlnybOPavUTkCDzlXnLGzPD9Gv81yq7rmwxA
        lMDQxwRA8OQ/z5xrIhgRmO0pNzMh5MeHqlw8jYnZm1bn51G6DcLbS8GeDc/U9Hq9+u0/90
        55sgaesoPTNwITifbV7bAexcxoshrMA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-2HO30du8MUSPPGro02toOQ-1; Sat, 13 May 2023 08:32:17 -0400
X-MC-Unique: 2HO30du8MUSPPGro02toOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7648E3800C48;
        Sat, 13 May 2023 12:32:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E3F7040C2076;
        Sat, 13 May 2023 12:32:14 +0000 (UTC)
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
Subject: [PATCH 08/30] media: atomisp: Rename video_out_preview to video_out
Date:   Sat, 13 May 2023 14:31:37 +0200
Message-Id: <20230513123159.33234-9-hdegoede@redhat.com>
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

Now that we have only 1 /dev/video# node for output for all different
run-modes (with only 1 run-mode at a time) using video_out_preview for
the remaining atomisp_pipe does not properly reflect that this is
*the* output pipe. Fo the following renames to fix the naming:

s/video_out_preview/video_out/
s/ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW/ATOMISP_SUBDEV_PAD_SOURCE/

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  6 ++--
 .../media/atomisp/pci/atomisp_compat_css20.c  |  2 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  4 +--
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  2 +-
 .../media/atomisp/pci/atomisp_subdev.c        | 34 ++++++++-----------
 .../media/atomisp/pci/atomisp_subdev.h        |  5 ++-
 6 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3d6e0d0c7eaa..8cd94189052f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -643,7 +643,7 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_s
 /* Returns queued buffers back to video-core */
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd)
 {
-	atomisp_flush_video_pipe(&asd->video_out_preview, VB2_BUF_STATE_ERROR, false);
+	atomisp_flush_video_pipe(&asd->video_out, VB2_BUF_STATE_ERROR, false);
 }
 
 /* clean out the parameters that did not apply */
@@ -1032,7 +1032,7 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 		atomisp_flush_bufs_and_wakeup(&isp->asd);
 
 		/* Requeue unprocessed per-frame parameters. */
-		atomisp_recover_params_queue(&isp->asd.video_out_preview);
+		atomisp_recover_params_queue(&isp->asd.video_out);
 
 		ret = v4l2_subdev_call(
 			  isp->inputs[isp->asd.input_curr].camera, video,
@@ -1293,7 +1293,7 @@ static void atomisp_update_capture_mode(struct atomisp_sub_device *asd)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_ADVANCED);
 	else if (asd->params.low_light)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_LOW_LIGHT);
-	else if (asd->video_out_preview.sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+	else if (asd->video_out.sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_RAW);
 	else
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_PRIMARY);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 8e8caa99ce72..d5b9c0fda69a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1958,7 +1958,7 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 		list_splice_init(&asd->metadata_ready[i], &asd->metadata[i]);
 	}
 
-	atomisp_flush_params_queue(&asd->video_out_preview);
+	atomisp_flush_params_queue(&asd->video_out);
 	atomisp_free_css_parameters(&asd->params.css_param);
 	memset(&asd->params.css_param, 0, sizeof(asd->params.css_param));
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 99152db236a1..ccd96464ebfa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -362,7 +362,7 @@ int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 	}
 
-	atomisp_q_video_buffers_to_css(asd, &asd->video_out_preview,
+	atomisp_q_video_buffers_to_css(asd, &asd->video_out,
 				       ATOMISP_INPUT_STREAM_GENERAL,
 				       IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, pipe_id);
 	return 0;
@@ -494,7 +494,7 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
  */
 static unsigned int atomisp_subdev_users(struct atomisp_sub_device *asd)
 {
-	return asd->video_out_preview.users;
+	return asd->video_out.users;
 }
 
 unsigned int atomisp_dev_users(struct atomisp_device *isp)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 3068f1a317f3..1684ea6ad735 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -618,7 +618,7 @@ static int atomisp_enum_input(struct file *file, void *fh,
 static unsigned int
 atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 {
-	return vb2_start_streaming_called(&asd->video_out_preview.vb_queue);
+	return vb2_start_streaming_called(&asd->video_out.vb_queue);
 }
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index d510fdd8389c..fb145044e9a4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -355,7 +355,7 @@ static const char *atomisp_pad_str(unsigned int pad)
 {
 	static const char *const pad_str[] = {
 		"ATOMISP_SUBDEV_PAD_SINK",
-		"ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW",
+		"ATOMISP_SUBDEV_PAD_SOURCE",
 	};
 
 	if (pad >= ARRAY_SIZE(pad_str))
@@ -431,7 +431,7 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 			struct v4l2_rect tmp = *crop[pad];
 
 			atomisp_subdev_set_selection(sd, sd_state, which,
-						     ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW,
+						     ATOMISP_SUBDEV_PAD_SOURCE,
 						     V4L2_SEL_TGT_COMPOSE, flags, &tmp);
 		}
 
@@ -593,7 +593,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 
 		break;
 	}
-	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
+	case ATOMISP_SUBDEV_PAD_SOURCE:
 		__ffmt->code = ffmt->code;
 		break;
 	}
@@ -900,12 +900,10 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	pads[ATOMISP_SUBDEV_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
-	pads[ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW].flags = MEDIA_PAD_FL_SOURCE;
+	pads[ATOMISP_SUBDEV_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
-	asd->fmt[ATOMISP_SUBDEV_PAD_SINK].fmt.code =
-	    MEDIA_BUS_FMT_SBGGR10_1X10;
-	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW].fmt.code =
-	    MEDIA_BUS_FMT_SBGGR10_1X10;
+	asd->fmt[ATOMISP_SUBDEV_PAD_SINK].fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE].fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	me->ops = &isp_subdev_media_ops;
 	me->function = MEDIA_ENT_F_PROC_VIDEO_ISP;
@@ -913,13 +911,11 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret < 0)
 		return ret;
 
-	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_preview,
-				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	ret = atomisp_init_subdev_pipe(asd, &asd->video_out, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	if (ret)
 		return ret;
 
-	ret = atomisp_video_init(&asd->video_out_preview, "PREVIEW",
-				 ATOMISP_RUN_MODE_PREVIEW);
+	ret = atomisp_video_init(&asd->video_out, "PREVIEW", ATOMISP_RUN_MODE_PREVIEW);
 	if (ret < 0)
 		return ret;
 
@@ -981,9 +977,8 @@ int atomisp_create_pads_links(struct atomisp_device *isp)
 			return ret;
 	}
 
-	ret = media_create_pad_link(&isp->asd.subdev.entity,
-				    ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW,
-				    &isp->asd.video_out_preview.vdev.entity, 0, 0);
+	ret = media_create_pad_link(&isp->asd.subdev.entity, ATOMISP_SUBDEV_PAD_SOURCE,
+				    &isp->asd.video_out.vdev.entity, 0, 0);
 	if (ret < 0)
 		return ret;
 
@@ -1015,7 +1010,7 @@ void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd)
 {
 	atomisp_subdev_cleanup_entities(asd);
 	v4l2_device_unregister_subdev(&asd->subdev);
-	atomisp_video_unregister(&asd->video_out_preview);
+	atomisp_video_unregister(&asd->video_out);
 }
 
 int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
@@ -1029,10 +1024,9 @@ int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
 {
 	int ret;
 
-	asd->video_out_preview.vdev.v4l2_dev = vdev;
-	asd->video_out_preview.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_out_preview.vdev,
-				    VFL_TYPE_VIDEO, -1);
+	asd->video_out.vdev.v4l2_dev = vdev;
+	asd->video_out.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	ret = video_register_device(&asd->video_out.vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 2be594a8e733..c4f312c55a4a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -32,7 +32,7 @@
 #define ATOMISP_MAX_EXP_ID     (250)
 
 #define ATOMISP_SUBDEV_PAD_SINK			0
-#define ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW	1
+#define ATOMISP_SUBDEV_PAD_SOURCE		1
 #define ATOMISP_SUBDEV_PADS_NUM			2
 
 struct atomisp_in_fmt_conv {
@@ -244,8 +244,7 @@ struct atomisp_sub_device {
 	u16 capture_pad; /* main capture pad; defines much of isp config */
 
 	unsigned int output;
-	struct atomisp_video_pipe video_out_preview; /* preview output */
-	/* struct isp_subdev_params params; */
+	struct atomisp_video_pipe video_out;
 	struct atomisp_device *isp;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *run_mode;
-- 
2.40.1

