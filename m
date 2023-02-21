Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C09E69E2E8
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbjBUPA4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjBUPAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7732B60C
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 07:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cCHQpVhGQcTxlg2tn6KMidOIFhUN3/xM0/6PlOWePJI=;
        b=GAjO7n6Vbs5QG41tCaiF2XH7gbMhIya506mrxSgcYbqMpKoLOpGZxNMxEDgQhwQyyDp8eD
        4CyJdymO9yXjKi0zLbX2STaMLiJq9H9Ae3W2rgd0IVLXk8wwZXvcgUsFx5k4WjoOvJQedX
        M3JnaLyZaLRl+wH+IcrfIa3mMqlfLkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-cXq6VLyWNfW62EdGlqZboQ-1; Tue, 21 Feb 2023 09:59:55 -0500
X-MC-Unique: cXq6VLyWNfW62EdGlqZboQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD82B811E9C;
        Tue, 21 Feb 2023 14:59:54 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 95D562026D4B;
        Tue, 21 Feb 2023 14:59:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 10/10] media: atomisp: Remove online_process setting
Date:   Tue, 21 Feb 2023 15:59:06 +0100
Message-Id: <20230221145906.8113-11-hdegoede@redhat.com>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

online_process is always true, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 30 ++-----------------
 .../media/atomisp/pci/atomisp_compat.h        |  4 ---
 .../media/atomisp/pci/atomisp_compat_css20.c  |  8 -----
 .../staging/media/atomisp/pci/atomisp_fops.c  |  1 -
 .../media/atomisp/pci/atomisp_subdev.h        |  4 ---
 5 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 937cfe9489fc..b8112721f0a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1622,11 +1622,6 @@ int atomisp_formats(struct atomisp_sub_device *asd, int flag,
 void atomisp_free_internal_buffers(struct atomisp_sub_device *asd)
 {
 	atomisp_free_css_parameters(&asd->params.css_param);
-
-	if (asd->raw_output_frame) {
-		ia_css_frame_free(asd->raw_output_frame);
-		asd->raw_output_frame = NULL;
-	}
 }
 
 static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
@@ -4221,7 +4216,6 @@ static int css_input_resolution_changed(struct atomisp_sub_device *asd,
 
 static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 				  struct ia_css_frame_info *output_info,
-				  struct ia_css_frame_info *raw_output_info,
 				  struct v4l2_pix_format *pix,
 				  unsigned int source_pad)
 {
@@ -4372,20 +4366,13 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 
 		/* in case of ANR, force capture pipe to offline mode */
 		atomisp_css_capture_enable_online(asd, ATOMISP_INPUT_STREAM_GENERAL,
-						  asd->params.low_light ?
-						  false : asd->params.online_process);
+						  !asd->params.low_light);
 
 		configure_output = atomisp_css_capture_configure_output;
 		get_frame_info = atomisp_css_capture_get_output_frame_info;
 		configure_pp_input = atomisp_css_capture_configure_pp_input;
 		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 
-		if (!asd->params.online_process) {
-			ret = atomisp_css_capture_get_output_raw_frame_info(asd,
-				raw_output_info);
-			if (ret)
-				return ret;
-		}
 		if (asd->run_mode->val != ATOMISP_RUN_MODE_STILL_CAPTURE) {
 			dev_err(isp->dev,
 				"Need to set the running mode first\n");
@@ -4430,16 +4417,6 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	}
 
 	atomisp_update_grid_info(asd, pipe_id, source_pad);
-
-	/* Free the raw_dump buffer first */
-	ia_css_frame_free(asd->raw_output_frame);
-	asd->raw_output_frame = NULL;
-
-	if (!asd->params.online_process &&
-	    ia_css_frame_allocate_from_info(&asd->raw_output_frame,
-		    raw_output_info))
-		return -ENOMEM;
-
 	return 0;
 }
 
@@ -4595,7 +4572,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	struct atomisp_sub_device *asd = pipe->asd;
 	const struct atomisp_format_bridge *format_bridge;
 	const struct atomisp_format_bridge *snr_format_bridge;
-	struct ia_css_frame_info output_info, raw_output_info;
+	struct ia_css_frame_info output_info;
 	struct v4l2_pix_format snr_fmt;
 	struct v4l2_pix_format backup_fmt, s_fmt;
 	unsigned int dvs_env_w = 0, dvs_env_h = 0;
@@ -4912,8 +4889,7 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	}
 
 set_fmt_to_isp:
-	ret = atomisp_set_fmt_to_isp(vdev, &output_info, &raw_output_info,
-				     &f->fmt.pix, source_pad);
+	ret = atomisp_set_fmt_to_isp(vdev, &output_info, &f->fmt.pix, source_pad);
 	if (ret) {
 		dev_warn(isp->dev, "Can't set format on ISP. Error %d\n", ret);
 		return -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 06d54c9bcb49..707509922784 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -303,10 +303,6 @@ int atomisp_css_copy_get_output_frame_info(
     unsigned int stream_index,
     struct ia_css_frame_info *info);
 
-int atomisp_css_capture_get_output_raw_frame_info(
-    struct atomisp_sub_device *asd,
-    struct ia_css_frame_info *info);
-
 int atomisp_css_preview_get_output_frame_info(
     struct atomisp_sub_device *asd,
     struct ia_css_frame_info *info);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 10be77c478b8..a1c1c9b1e806 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2630,14 +2630,6 @@ int atomisp_css_capture_get_viewfinder_frame_info(
 				ATOMISP_CSS_VF_FRAME, IA_CSS_PIPE_ID_CAPTURE);
 }
 
-int atomisp_css_capture_get_output_raw_frame_info(
-    struct atomisp_sub_device *asd,
-    struct ia_css_frame_info *info)
-{
-	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
-				ATOMISP_CSS_RAW_FRAME, IA_CSS_PIPE_ID_CAPTURE);
-}
-
 int atomisp_css_copy_get_output_frame_info(
     struct atomisp_sub_device *asd,
     unsigned int stream_index,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index d8d4c412f66a..7f757f510190 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -564,7 +564,6 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
 	asd->params.fpn_en = false;
 	asd->params.xnr_en = false;
 	asd->params.false_color = 0;
-	asd->params.online_process = 1;
 	asd->params.yuv_ds_en = 0;
 	/* s3a grid not enabled for any pipe */
 	asd->params.s3a_enabled_pipe = IA_CSS_PIPE_ID_NUM;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index df6e2a8c5f84..bcb0fe8d0538 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -183,9 +183,6 @@ struct atomisp_css_params {
 };
 
 struct atomisp_subdev_params {
-	/* FIXME: Determines whether raw capture buffer are being passed to
-	 * user space. Unimplemented for now. */
-	int online_process;
 	int yuv_ds_en;
 	unsigned int color_effect;
 	bool gdc_cac_en;
@@ -303,7 +300,6 @@ struct atomisp_sub_device {
 	spinlock_t dis_stats_lock;
 
 	struct ia_css_frame *vf_frame; /* TODO: needed? */
-	struct ia_css_frame *raw_output_frame;
 	enum atomisp_frame_status frame_status[VIDEO_MAX_FRAME];
 
 	/* This field specifies which camera (v4l2 input) is selected. */
-- 
2.39.1

