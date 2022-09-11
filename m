Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B415B5030
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiIKRRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiIKRRW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCC4275E9
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ak23rzqZ5HKVkjb3XdBK0iF4YY1Cnfx7MpyfP6mqMEY=;
        b=h/1F5NlIFWFKSqFlRYS0hgr6fCBnCx5ePBZL9d4FU/89MooWWSXs+UBrEWHek/S1PHvz9f
        KZUIvsGKCsRUyNfhcoANQOBx3ZeyTBXk1RClzYUTeRD4h2HFcvnMBuoH6oI5QWGylCjZdP
        eH3XszbCLHOucwpIKM7Z/XpnQrRrQnc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-LLLgb3PGPRKbbnhZHNjGGg-1; Sun, 11 Sep 2022 13:17:17 -0400
X-MC-Unique: LLLgb3PGPRKbbnhZHNjGGg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB0C83C025B6;
        Sun, 11 Sep 2022 17:17:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 31DFC492C3B;
        Sun, 11 Sep 2022 17:17:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 11/17] media: atomisp: Remove a couple of not useful function wrappers
Date:   Sun, 11 Sep 2022 19:16:47 +0200
Message-Id: <20220911171653.568932-12-hdegoede@redhat.com>
In-Reply-To: <20220911171653.568932-1-hdegoede@redhat.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The __atomisp_reqbufs(), __atomisp_streamoff() are 1:1 wrappers for
the non __ prefixed functions now, drop these wrappers.

The atomisp_s_fmt_cap() wrapper is almost a 1:1 wrapper for
atomisp_set_fmt() adjust the latter to have the right function
prototype and drop the wrapper.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  3 ++-
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  | 10 +++----
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 27 +++----------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  8 ++----
 5 files changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index a96a4658e113..20962d4c2b76 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5167,8 +5167,9 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev,
 	return css_input_resolution_changed(asd, ffmt);
 }
 
-int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
+int atomisp_set_fmt(struct file *file, void *unused, struct v4l2_format *f)
 {
+	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 5ab7d6aca7fa..cfc970b531f0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -266,7 +266,7 @@ int atomisp_get_sensor_mode_data(struct atomisp_sub_device *asd,
 int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 		    bool *res_overflow);
 
-int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f);
+int atomisp_set_fmt(struct file *file, void *fh, struct v4l2_format *f);
 
 int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 			      struct atomisp_shading_table *shading_table);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 531bbd6d7ee0..047e1180e35f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -836,18 +836,16 @@ static int atomisp_release(struct file *file)
 			 __func__);
 
 	if (pipe->capq.streaming &&
-	    __atomisp_streamoff(file, NULL, V4L2_BUF_TYPE_VIDEO_CAPTURE)) {
-		dev_err(isp->dev,
-			"atomisp_streamoff failed on release, driver bug");
+	    atomisp_streamoff(file, NULL, V4L2_BUF_TYPE_VIDEO_CAPTURE)) {
+		dev_err(isp->dev, "atomisp_streamoff failed on release, driver bug");
 		goto done;
 	}
 
 	if (pipe->users)
 		goto done;
 
-	if (__atomisp_reqbufs(file, NULL, &req)) {
-		dev_err(isp->dev,
-			"atomisp_reqbufs failed on release, driver bug");
+	if (atomisp_reqbufs(file, NULL, &req)) {
+		dev_err(isp->dev, "atomisp_reqbufs failed on release, driver bug");
 		goto done;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 42d8d1267553..ed3ec603a713 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -968,14 +968,6 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	return atomisp_try_fmt_cap(file, fh, f);
 }
 
-static int atomisp_s_fmt_cap(struct file *file, void *fh,
-			     struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-
-	return atomisp_set_fmt(vdev, f);
-}
-
 /*
  * Free videobuffer buffer priv data
  */
@@ -1111,8 +1103,7 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 /*
  * Initiate Memory Mapping or User Pointer I/O
  */
-int __atomisp_reqbufs(struct file *file, void *fh,
-		      struct v4l2_requestbuffers *req)
+int atomisp_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *req)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
@@ -1184,12 +1175,6 @@ int __atomisp_reqbufs(struct file *file, void *fh,
 	return -ENOMEM;
 }
 
-int atomisp_reqbufs(struct file *file, void *fh,
-		    struct v4l2_requestbuffers *req)
-{
-	return __atomisp_reqbufs(file, fh, req);
-}
-
 /* application query the status of a buffer */
 static int atomisp_querybuf(struct file *file, void *fh,
 			    struct v4l2_buffer *buf)
@@ -1793,7 +1778,7 @@ static int atomisp_streamon(struct file *file, void *fh,
 	return 0;
 }
 
-int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
+int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
@@ -2015,12 +2000,6 @@ int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type)
 	return ret;
 }
 
-static int atomisp_streamoff(struct file *file, void *fh,
-			     enum v4l2_buf_type type)
-{
-	return __atomisp_streamoff(file, fh, type);
-}
-
 /*
  * To get the current value of a control.
  * applications initialize the id field of a struct v4l2_control and
@@ -2806,7 +2785,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_enum_fmt_vid_cap = atomisp_enum_fmt_cap,
 	.vidioc_try_fmt_vid_cap = atomisp_try_fmt_cap,
 	.vidioc_g_fmt_vid_cap = atomisp_g_fmt_cap,
-	.vidioc_s_fmt_vid_cap = atomisp_s_fmt_cap,
+	.vidioc_s_fmt_vid_cap = atomisp_set_fmt,
 	.vidioc_reqbufs = atomisp_reqbufs,
 	.vidioc_querybuf = atomisp_querybuf,
 	.vidioc_qbuf = atomisp_qbuf,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 61a6148a6ad5..c660f631d371 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -39,12 +39,8 @@ int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool streaming_ok);
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				uint16_t stream_id);
 
-int __atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type);
-int __atomisp_reqbufs(struct file *file, void *fh,
-		      struct v4l2_requestbuffers *req);
-
-int atomisp_reqbufs(struct file *file, void *fh,
-		    struct v4l2_requestbuffers *req);
+int atomisp_streamoff(struct file *file, void *fh, enum v4l2_buf_type type);
+int atomisp_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *req);
 
 enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device
 	*asd);
-- 
2.37.3

