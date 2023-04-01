Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC876D31CE
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjDAPBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjDAPBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B0B20316
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vLLGFFZ5T4qOEbu+uYcxBCyPbyHarXfWcqcHhnOPA8M=;
        b=f5ZZA7ZmAfifBQkAqbwsFUHrwRwryRtn2TjQ+n2m3RA3xHQHDaa45JMkpIHo9WlDywbj73
        JrtdBXn0UT1vJcIV2ywggAq7E08/i6vrOQmFmGlgGT+iYgXNh67M+Em0HhDzbwLIRdZ2TE
        G35Qs/WGOrj+AzkIwDKm2+7HbFfdvjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-4iuCk85fOu6nyzUS2CsV3g-1; Sat, 01 Apr 2023 11:00:27 -0400
X-MC-Unique: 4iuCk85fOu6nyzUS2CsV3g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47473185A78F;
        Sat,  1 Apr 2023 15:00:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B87784021BC;
        Sat,  1 Apr 2023 15:00:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 26/28] media: atomisp: Remove struct atomisp_sub_device index field
Date:   Sat,  1 Apr 2023 16:59:24 +0200
Message-Id: <20230401145926.596216-27-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the struct atomisp_sub_device.

This was used for 2 things:

1. In dev_dbg() messages
2. To set the name of the v4l2_subdev for each struct atomisp_sub_device

Now that only 1 subdev is used neither is useful anymore. Remove the _%d
postfix from the v4l2_subdev name and remove the logging of the asd index
from the dev_dbg() messages.

In case of the atomisp_s_input() check to see if an input/sensor has
already been assigned to another subdev the entire check no longer
makes sense, so instead of changing the dev_err() message there just
drop the entire check.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 15 +++++-------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 23 ++++---------------
 .../media/atomisp/pci/atomisp_subdev.c        |  3 +--
 .../media/atomisp/pci/atomisp_subdev.h        |  5 ----
 4 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index d0386dcb24ce..28663d6fc4dd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -523,9 +523,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
 		while (ia_css_dequeue_isys_event(&eof_event.event) == 0) {
 			atomisp_eof_event(&isp->asd, eof_event.event.exp_id);
 			dev_dbg_ratelimited(isp->dev,
-					    "%s ISYS event: EOF exp_id %d, asd %d\n",
-					    __func__, eof_event.event.exp_id,
-					    isp->asd.index);
+					    "%s ISYS event: EOF exp_id %d\n",
+					    __func__, eof_event.event.exp_id);
 		}
 
 		irq_infos &= ~IA_CSS_IRQ_INFO_ISYS_EVENTS_READY;
@@ -3302,9 +3301,8 @@ int atomisp_set_parameters(struct video_device *vdev,
 	}
 
 	dev_dbg(asd->isp->dev,
-		"%s: set parameter(per_frame_setting %d) for asd%d with isp_config_id %d of %s\n",
-		__func__, arg->per_frame_setting, asd->index,
-		arg->isp_config_id, vdev->name);
+		"%s: set parameter(per_frame_setting %d) isp_config_id %d of %s\n",
+		__func__, arg->per_frame_setting, arg->isp_config_id, vdev->name);
 
 	if (IS_ISP2401) {
 		if (atomisp_is_vf_pipe(pipe) && arg->per_frame_setting) {
@@ -4515,9 +4513,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 		return -EINVAL;
 
 	dev_dbg(isp->dev,
-		"setting resolution %ux%u on pad %u for asd%d, bytesperline %u\n",
-		f->fmt.pix.width, f->fmt.pix.height, source_pad,
-		asd->index, f->fmt.pix.bytesperline);
+		"setting resolution %ux%u on pad %u bytesperline %u\n",
+		f->fmt.pix.width, f->fmt.pix.height, source_pad, f->fmt.pix.bytesperline);
 
 	v4l2_fh_init(&fh.vfh, vdev);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 14700afd92c2..384f31fc66c5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -671,18 +671,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 		return -EINVAL;
 	}
 
-	/*
-	 * check whether the request camera:
-	 * 1: already in use
-	 * 2: if in use, whether it is used by other streams
-	 */
-	if (isp->inputs[input].asd && isp->inputs[input].asd != asd) {
-		dev_err(isp->dev,
-			"%s, camera is already used by stream: %d\n", __func__,
-			isp->inputs[input].asd->index);
-		return -EBUSY;
-	}
-
 	camera = isp->inputs[input].camera;
 	if (!camera) {
 		dev_err(isp->dev, "%s, no camera\n", __func__);
@@ -1106,9 +1094,8 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	buf->reserved2 = pipe->frame_config_id[buf->index];
 
 	dev_dbg(isp->dev,
-		"dqbuf buffer %d (%s) for asd%d with exp_id %d, isp_config_id %d\n",
-		buf->index, vdev->name, asd->index, buf->reserved >> 16,
-		buf->reserved2);
+		"dqbuf buffer %d (%s) with exp_id %d, isp_config_id %d\n",
+		buf->index, vdev->name, buf->reserved >> 16, buf->reserved2);
 	return 0;
 }
 
@@ -1186,8 +1173,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	mutex_lock(&isp->mutex);
 
-	dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
-		atomisp_subdev_source_pad(vdev), asd->index);
+	dev_dbg(isp->dev, "Start stream on pad %d\n", atomisp_subdev_source_pad(vdev));
 
 	ret = atomisp_pipe_check(pipe, false);
 	if (ret)
@@ -1320,8 +1306,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
 
 	mutex_lock(&isp->mutex);
 
-	dev_dbg(isp->dev, "Stop stream on pad %d for asd%d\n",
-		atomisp_subdev_source_pad(vdev), asd->index);
+	dev_dbg(isp->dev, "Stop stream on pad %d\n", atomisp_subdev_source_pad(vdev));
 
 	/*
 	 * There is no guarantee that the buffers queued to / owned by the ISP
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 143176bc684a..a0acfdb87177 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -918,7 +918,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	int ret;
 
 	v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
-	sprintf(sd->name, "ATOMISP_SUBDEV_%d", asd->index);
+	sprintf(sd->name, "ATOMISP_SUBDEV");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
@@ -1161,7 +1161,6 @@ int atomisp_subdev_init(struct atomisp_device *isp)
 {
 	int ret;
 
-	isp->asd.index = 0;
 	isp->asd.isp = isp;
 	isp_subdev_init_params(&isp->asd);
 	ret = isp_subdev_init_entities(&isp->asd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 117803f3cbd1..fee663bc415a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -315,11 +315,6 @@ struct atomisp_sub_device {
 	unsigned int streaming;
 	bool stream_prepared; /* whether css stream is created */
 
-	/* subdev index: will be used to show which subdev is holding the
-	 * resource, like which camera is used by which subdev
-	 */
-	unsigned int index;
-
 	unsigned int latest_preview_exp_id; /* CSS ZSL/SDV raw buffer id */
 
 	unsigned int mipi_frame_size;
-- 
2.39.1

