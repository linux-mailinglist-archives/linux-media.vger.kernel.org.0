Return-Path: <linux-media+bounces-39249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68CB1F6AF
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B41A3B3911
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8812C327C;
	Sat,  9 Aug 2025 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U6zjXtlR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D72827EFE3;
	Sat,  9 Aug 2025 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774330; cv=none; b=ZzzpW3rK/JNLJ8MtE/9bHVZ0GQgKSPizRgk43+XxZB2eLTU201wW2PBeu+rK608eY73f1kkcM5rdguU1Q4jWzcK9cbn4uDjQ/EycQTek9Qm7J3KDLd8kmZ9N30BoAzetCT0mvolv21BJ6P6vfWX7mZyjHxzVeSD2u9Wb8yqgo68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774330; c=relaxed/simple;
	bh=Jsn+YquA5csQGU9Ci5rSo9Jyfo9qGTFwJulolC06ZgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbedGIdZOkWDtsY/l5J4BMFzRetihVONjdh5Hfmrf9YoSV+VNSZNHml7l61S9blp5lPgFhV4q9I/nCOdmJkwAY38BdVEGWaeoTVye+aLknFSMJsjElGlyo4u5U/EXp16wZfaatZC4Pa8Jmt6eURh24Gu9PqETQTZoRzS4nw5qf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U6zjXtlR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9A0C989A;
	Sat,  9 Aug 2025 23:17:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774270;
	bh=Jsn+YquA5csQGU9Ci5rSo9Jyfo9qGTFwJulolC06ZgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6zjXtlRLmgxeaCPGWN367gh232C40g8CWagv0LKXADNtYbnMdT33JW02Aan34Prl
	 xMQjfrj/nwl4tBV6NLZe9MU/H24HXjxCt4/HUwjH9YS7xT/oQRhFdt2R6LBsVR8mAi
	 2jlmYNjiDYiph2I0UzFaLLukugj+B0lmPVmsNs1M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 54/76] media: s3c-camif: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:31 +0300
Message-ID: <20250809211654.28887-55-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh from the file * in all ioctl handlers. The v4l2_fh
pointer is used to keep track of which user owns the streaming queue.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../samsung/s3c-camif/camif-capture.c         | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index cae15a4ce5fd..ed1a1d693293 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -791,7 +791,7 @@ static int s3c_camif_vidioc_s_fmt(struct file *file, void *priv,
 	out_frame->rect.top = 0;
 
 	if (vp->owner == NULL)
-		vp->owner = priv;
+		vp->owner = file_to_v4l2_fh(file);
 
 	pr_debug("%ux%u. payload: %u. fmt: 0x%08x. %d %d. sizeimage: %d. bpl: %d\n",
 		 out_frame->f_width, out_frame->f_height, vp->payload,
@@ -841,7 +841,7 @@ static int s3c_camif_streamon(struct file *file, void *priv,
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	if (s3c_vp_active(vp))
@@ -872,7 +872,7 @@ static int s3c_camif_streamoff(struct file *file, void *priv,
 	if (type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	ret = vb2_streamoff(&vp->vb_queue, type);
@@ -888,9 +888,9 @@ static int s3c_camif_reqbufs(struct file *file, void *priv,
 	int ret;
 
 	pr_debug("[vp%d] rb count: %d, owner: %p, priv: %p\n",
-		 vp->id, rb->count, vp->owner, priv);
+		 vp->id, rb->count, vp->owner, file_to_v4l2_fh(file));
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	if (rb->count)
@@ -910,7 +910,7 @@ static int s3c_camif_reqbufs(struct file *file, void *priv,
 
 	vp->reqbufs_count = rb->count;
 	if (vp->owner == NULL && rb->count > 0)
-		vp->owner = priv;
+		vp->owner = file_to_v4l2_fh(file);
 
 	return ret;
 }
@@ -929,7 +929,7 @@ static int s3c_camif_qbuf(struct file *file, void *priv,
 
 	pr_debug("[vp%d]\n", vp->id);
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	return vb2_qbuf(&vp->vb_queue, vp->vdev.v4l2_dev->mdev, buf);
@@ -942,7 +942,7 @@ static int s3c_camif_dqbuf(struct file *file, void *priv,
 
 	pr_debug("[vp%d] sequence: %d\n", vp->id, vp->frame_sequence);
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	return vb2_dqbuf(&vp->vb_queue, buf, file->f_flags & O_NONBLOCK);
@@ -954,14 +954,14 @@ static int s3c_camif_create_bufs(struct file *file, void *priv,
 	struct camif_vp *vp = video_drvdata(file);
 	int ret;
 
-	if (vp->owner && vp->owner != priv)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		return -EBUSY;
 
 	create->count = max_t(u32, 1, create->count);
 	ret = vb2_create_bufs(&vp->vb_queue, create);
 
 	if (!ret && vp->owner == NULL)
-		vp->owner = priv;
+		vp->owner = file_to_v4l2_fh(file);
 
 	return ret;
 }
-- 
Regards,

Laurent Pinchart


