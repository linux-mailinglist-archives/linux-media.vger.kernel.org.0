Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3D1070169C
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238320AbjEMMdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjEMMdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A05F35A9
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FiXmlfPowoYCYUQr47xgT8t+KlyVCADqJFszW5TdIus=;
        b=cZmmNbq31WlsJRSvF9ZJ8P7t3lSQ1Yizv0f4LgSD9KmT8JtB1COhEMZQhh4Y4cpSphTH1F
        peG8RRZ6zo5hseaJlC8VDC09Df5beeubTbwpcKkC3wL8SrTHALSIk2jTaQak9m3k6p9YRm
        /0cmUc0mMXqaSU2KdoYJMXbJsY3PRFY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-y1BofXlkNOyJfVXZx8KhlA-1; Sat, 13 May 2023 08:32:15 -0400
X-MC-Unique: y1BofXlkNOyJfVXZx8KhlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B10B629AA3B0;
        Sat, 13 May 2023 12:32:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2B06B40C2076;
        Sat, 13 May 2023 12:32:13 +0000 (UTC)
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
Subject: [PATCH 07/30] media: atomisp: Drop atomisp_is_vf_pipe()
Date:   Sat, 13 May 2023 14:31:36 +0200
Message-Id: <20230513123159.33234-8-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since there only is one /dev/video# node now (no more continuous mode),
there are now no longer separate main capture + view-finder pipes.

We are now always on the main pipe, so atomisp_is_vf_pipe() should
always return false now. Drop any checks using it, replacing them
with the code-path for a false return.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 32 ++-----------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 --
 .../staging/media/atomisp/pci/atomisp_fops.c  |  5 ++-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  3 +-
 4 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index faaa4f1c5c7c..3d6e0d0c7eaa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3216,9 +3216,6 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
 
 	lockdep_assert_held(&asd->isp->mutex);
 
-	if (atomisp_is_vf_pipe(pipe))
-		return;
-
 	/*
 	 * CSS/FW requires set parameter and enqueue buffer happen after ISP
 	 * is streamon.
@@ -3294,15 +3291,7 @@ int atomisp_set_parameters(struct video_device *vdev,
 	dev_dbg(asd->isp->dev, "set parameter(per_frame_setting %d) isp_config_id %d of %s\n",
 		arg->per_frame_setting, arg->isp_config_id, vdev->name);
 
-	if (IS_ISP2401) {
-		if (atomisp_is_vf_pipe(pipe) && arg->per_frame_setting) {
-			dev_err(asd->isp->dev, "%s: vf pipe not support per_frame_setting",
-				__func__);
-			return -EINVAL;
-		}
-	}
-
-	if (arg->per_frame_setting && !atomisp_is_vf_pipe(pipe)) {
+	if (arg->per_frame_setting) {
 		/*
 		 * Per-frame setting enabled, we allocate a new parameter
 		 * buffer to cache the parameters and only when frame buffers
@@ -3341,7 +3330,7 @@ int atomisp_set_parameters(struct video_device *vdev,
 	if (ret)
 		goto apply_parameter_failed;
 
-	if (!(arg->per_frame_setting && !atomisp_is_vf_pipe(pipe))) {
+	if (!arg->per_frame_setting) {
 		/* indicate to CSS that we have parameters to be updated */
 		asd->params.css_update_params_needed = true;
 	} else {
@@ -4780,23 +4769,6 @@ int atomisp_flash_enable(struct atomisp_sub_device *asd, int num_frames)
 	return 0;
 }
 
-bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe)
-{
-	struct atomisp_sub_device *asd = pipe->asd;
-
-	if (!asd) {
-		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, pipe->vdev.name);
-		return false;
-	}
-
-	if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
-	    pipe == &asd->video_out_preview)
-		return true;
-
-	return false;
-}
-
 static int __checking_exp_id(struct atomisp_sub_device *asd, int exp_id)
 {
 	struct atomisp_device *isp = asd->isp;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 3cf086eba06d..cbe2f48d3dfa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -291,8 +291,6 @@ void atomisp_eof_event(struct atomisp_sub_device *asd, uint8_t exp_id);
 enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 				  enum atomisp_camera_port port);
 
-bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
-
 void atomisp_apply_css_parameters(
     struct atomisp_sub_device *asd,
     struct atomisp_css_params *css_param);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 3adeeb97e570..99152db236a1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -403,9 +403,8 @@ static void atomisp_buf_queue(struct vb2_buffer *vb)
 	 *     is put to waiting list until previous per-frame parameter buffers
 	 *     get enqueued.
 	 */
-	if (!atomisp_is_vf_pipe(pipe) &&
-	    (pipe->frame_request_config_id[vb->index] ||
-	     !list_empty(&pipe->buffers_waiting_for_param)))
+	if (pipe->frame_request_config_id[vb->index] ||
+	    !list_empty(&pipe->buffers_waiting_for_param))
 		list_add_tail(&frame->queue, &pipe->buffers_waiting_for_param);
 	else
 		list_add_tail(&frame->queue, &pipe->activeq);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 392c0ed56fb4..3068f1a317f3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1045,8 +1045,7 @@ static int atomisp_qbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	if (buf->index >= vdev->queue->num_buffers)
 		return -EINVAL;
 
-	if (!atomisp_is_vf_pipe(pipe) &&
-	    (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING)) {
+	if (buf->reserved2 & ATOMISP_BUFFER_HAS_PER_FRAME_SETTING) {
 		/* this buffer will have a per-frame parameter */
 		pipe->frame_request_config_id[buf->index] = buf->reserved2 &
 			~ATOMISP_BUFFER_HAS_PER_FRAME_SETTING;
-- 
2.40.1

