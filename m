Return-Path: <linux-media+bounces-9362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 401DA8A4E60
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7931F21DDE
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3416CDC4;
	Mon, 15 Apr 2024 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OyWDz+ik"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD569D27
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182582; cv=none; b=S8na9AEhtn4BIOvsDeU3z4MEobN0g7Y1AtsrBnOhq7bfrLfxUzQMaBmTsYbExeRkiqVdL/Ahp9KyJLm7ZVhyDAvsm5sLIbYK8KuzmNJuqhipuvlRd/7X7dJosasG7589XGHV/qcQzWqBalx25v+p8uKLGdAcMf787GN2XPepA3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182582; c=relaxed/simple;
	bh=+CtNWgYGWpP5j42MzV1exFGOYqUCCjUktCEoxWwY7SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vELWATaMCKZjCpRMOpfNPBB5rdLpD5Nk5+soV2YvfIO+zcanYKhauNWxnvgyXsAKygj+veu8xTOXlKudWbtvfxn2OJd80RglAJaCNbOmiGx9rNkKbANZBFt8uIqB1Z4B0Qf1PkAwlU5+lLuJRO++XLWFRrtpGXNBMvZTG2Wq/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OyWDz+ik; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97szRONu3Y+HNfKnkwz8oaUzYMNxyyfzc++oFrEsKFA=;
	b=OyWDz+ikW22O6rw1yvWO4WFt+fWaPhD5hil5JEWI7ZQ95R7WvVizReWVaRLRoT6jko/E9F
	oEAbSkHS1ChSKaJGR/rJHB2jdWMsoNQaTHqMOl2w2v08u8hy8P3fnYu4cfy6cVQ3IbyWzG
	yAxTfuDlRIBcqbEeVsb9fMYoYJpocR8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-25-5ZMAqZ0kPbqrWJVl7CEV6Q-1; Mon,
 15 Apr 2024 08:02:56 -0400
X-MC-Unique: 5ZMAqZ0kPbqrWJVl7CEV6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDEE929AA2CD;
	Mon, 15 Apr 2024 12:02:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6AC3C13FA1;
	Mon, 15 Apr 2024 12:02:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 15/23] media: atomisp: Drop unused frame_status tracking
Date: Mon, 15 Apr 2024 14:02:12 +0200
Message-ID: <20240415120220.219480-16-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

After removing the flash support frame_status now always is
ATOMISP_FRAME_STATUS_OK aka 0. Drop frame_status tracking.

This also means one less atomisp custom use for the vb2_buffer->reserved*
fields (all custom use of these fields should be removed).

While at it also remove the no longer used vf_frame pointer from
struct atomisp_sub_device.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/include/linux/atomisp.h | 15 ---------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   |  1 -
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 12 ++----------
 .../staging/media/atomisp/pci/atomisp_subdev.h    |  3 ---
 4 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index db0c1b87c9ef..16c9da172c03 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -614,21 +614,6 @@ enum atomisp_camera_port {
 	ATOMISP_CAMERA_NR_PORTS
 };
 
-/* Frame status. This is used to detect corrupted frames and flash
- * exposed frames. Usually, the first 2 frames coming out of the sensor
- * are corrupted. When using flash, the frame before and the frame after
- * the flash exposed frame may be partially exposed by flash. The ISP
- * statistics for these frames should not be used by the 3A library.
- * The frame status value can be found in the "reserved" field in the
- * v4l2_buffer struct. */
-enum atomisp_frame_status {
-	ATOMISP_FRAME_STATUS_OK,
-	ATOMISP_FRAME_STATUS_CORRUPTED,
-	ATOMISP_FRAME_STATUS_FLASH_EXPOSED,
-	ATOMISP_FRAME_STATUS_FLASH_PARTIAL,
-	ATOMISP_FRAME_STATUS_FLASH_FAILED,
-};
-
 enum atomisp_ext_isp_id {
 	EXT_ISP_CID_ISO = 0,
 	EXT_ISP_CID_CAPTURE_HDR,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index f5a578a9c588..335f142c1fc5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -813,7 +813,6 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 		}
 
 		pipe->frame_config_id[i] = frame->isp_config_id;
-		asd->frame_status[i] = ATOMISP_FRAME_STATUS_OK;
 
 		if (asd->params.css_update_params_needed) {
 			atomisp_apply_css_parameters(asd,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index e243faec143e..d7c842997139 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -826,7 +826,6 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 {
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct atomisp_sub_device *asd = pipe->asd;
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct ia_css_frame *frame;
 	struct vb2_buffer *vb;
@@ -839,15 +838,8 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
 	frame = vb_to_frame(vb);
 
-	buf->reserved = asd->frame_status[buf->index];
-
-	/*
-	 * Hack:
-	 * Currently frame_status in the enum type which takes no more lower
-	 * 8 bit.
-	 * use bit[31:16] for exp_id as it is only in the range of 1~255
-	 */
-	buf->reserved &= 0x0000ffff;
+	/* reserved bit[31:16] is used for exp_id */
+	buf->reserved = 0;
 	if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
 		buf->reserved |= frame->exp_id;
 	buf->reserved2 = pipe->frame_config_id[buf->index];
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index 4ab123a1c165..b6c66a5d523c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -274,9 +274,6 @@ struct atomisp_sub_device {
 	struct list_head dis_stats_in_css;
 	spinlock_t dis_stats_lock;
 
-	struct ia_css_frame *vf_frame; /* TODO: needed? */
-	enum atomisp_frame_status frame_status[VIDEO_MAX_FRAME];
-
 	/* This field specifies which camera (v4l2 input) is selected. */
 	int input_curr;
 
-- 
2.44.0


