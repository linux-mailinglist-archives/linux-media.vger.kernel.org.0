Return-Path: <linux-media+bounces-39342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8FB1F7EC
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42FB03A337C
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0788D21323C;
	Sun, 10 Aug 2025 01:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kvXb9mP8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43759212B18
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789599; cv=none; b=fi+NwWiDtVyFwYoQSf6qIWLMfun27+drC70umLz/0O8PDL//piZfXntRvCpBPe0NTxbks7ZQXxg7ecrsxAWUwccWmUXuGwnu0seHu3QSykFP7L720Zf4MR2b3DUEy04EQugE4Y+1j5lmp1yhCFmeUMho38HrWgfKUFlzWO4gnWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789599; c=relaxed/simple;
	bh=6hDiBOYBxS35W0iP+m0LDNK9hM+w/bX6SNWlBfYxWAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ab7aLyF7hpy7TSPb9PMGbMKPz0xLYtVg5zliwX3HIahWj5rmMHbFDRivp7767Rwe4/Lf15U8gIGucpmPieH9j4zO2OpICkcueJE9pNO9AMfOHNJnXwKjDWBktDI2iyrhRANSHMcoCxkV4KSHMe9dxm5gT8HEtepeEaZS91j5lSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kvXb9mP8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B7A0B7E6;
	Sun, 10 Aug 2025 03:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789543;
	bh=6hDiBOYBxS35W0iP+m0LDNK9hM+w/bX6SNWlBfYxWAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kvXb9mP8qFFB1k0CXV+vbJnScfawdrzoEB3rJW/AigM2XVXD9mER0EiXCRF8HHjzs
	 qzi79uYMcO8xJGxQhldcYv2+K9C8r8JJyF7KcrLaElTt0nN/9oo2MMGFsb9k9vwYmI
	 Bv+oLXPcBtYrpPB4REqj9rOPWlaOGWleT9EAOnMc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 69/76] media: v4l2-ioctl: Stop passing fh pointer to ioctl handlers
Date: Sun, 10 Aug 2025 04:30:51 +0300
Message-ID: <20250810013100.29776-70-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all drivers access the v4l2_fh from the file structure, there
is no need to pass it as an explicit argument to ioctl handlers. Set the
argument to NULL in the __video_do_ioctl() function, and rename the 'fh'
argument in the ioctl handler declarations to 'priv' indicate it does
not contain a file handle.

The argument could be removed altogether with a mechanical change
(probably using coccinelle), but there are plans to pass a new argument
to the ioctl handlers in the near future. The tree-wide change to remove
the argument, only to add another one soon after, would be too much
churn.

While at it, fix argument alignment in vidioc_try_fmt_vid_out_overlay().

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Pass NULL to .vidioc_query_ext_ctrl() in ctrl_is_pointer()
- Rename ioctl argument to priv instead of dropping its name
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ioctl.h                    | 238 +++++++++---------
 3 files changed, 122 insertions(+), 122 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index e5642e639811..85c10ba9f813 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -691,7 +691,7 @@ static inline bool ctrl_is_pointer(struct file *file, u32 id)
 	if (!ops || !ops->vidioc_query_ext_ctrl)
 		return false;
 
-	return !ops->vidioc_query_ext_ctrl(file, fh, &qec) &&
+	return !ops->vidioc_query_ext_ctrl(file, NULL, &qec) &&
 		(qec.flags & V4L2_CTRL_FLAG_HAS_PAYLOAD);
 }
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 378a2a149fec..d815291624a9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3126,11 +3126,11 @@ static long __video_do_ioctl(struct file *file,
 
 	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
 	if (info != &default_info) {
-		ret = info->func(ops, file, vfh, arg);
+		ret = info->func(ops, file, NULL, arg);
 	} else if (!ops->vidioc_default) {
 		ret = -ENOTTY;
 	} else {
-		ret = ops->vidioc_default(file, vfh,
+		ret = ops->vidioc_default(file, NULL,
 			v4l2_prio_check(vfd->prio, vfh->prio) >= 0,
 			cmd, arg);
 	}
diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 82695c3a300a..6f7a58350441 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -293,144 +293,144 @@ struct v4l2_ioctl_ops {
 	/* ioctl callbacks */
 
 	/* VIDIOC_QUERYCAP handler */
-	int (*vidioc_querycap)(struct file *file, void *fh,
+	int (*vidioc_querycap)(struct file *file, void *priv,
 			       struct v4l2_capability *cap);
 
 	/* VIDIOC_ENUM_FMT handlers */
-	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *priv,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *priv,
 					   struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *priv,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *priv,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *priv,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *priv,
 					struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *priv,
 					struct v4l2_fmtdesc *f);
 
 	/* VIDIOC_G_FMT handlers */
-	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *priv,
 					struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *priv,
 					    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *priv,
 				     struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_meta_out)(struct file *file, void *priv,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_S_FMT handlers */
-	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *priv,
 					struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *priv,
 					    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *priv,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *priv,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *priv,
 				     struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_meta_out)(struct file *file, void *priv,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_TRY_FMT handlers */
-	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *priv,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *priv,
 					  struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out)(struct file *file, void *priv,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
-					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *priv,
+					      struct v4l2_format *f);
+	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *priv,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *priv,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *priv,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *priv,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *priv,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *priv,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *priv,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *priv,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *priv,
 				       struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_meta_out)(struct file *file, void *priv,
 				       struct v4l2_format *f);
 
 	/* Buffer handlers */
-	int (*vidioc_reqbufs)(struct file *file, void *fh,
+	int (*vidioc_reqbufs)(struct file *file, void *priv,
 			      struct v4l2_requestbuffers *b);
-	int (*vidioc_querybuf)(struct file *file, void *fh,
+	int (*vidioc_querybuf)(struct file *file, void *priv,
 			       struct v4l2_buffer *b);
-	int (*vidioc_qbuf)(struct file *file, void *fh,
+	int (*vidioc_qbuf)(struct file *file, void *priv,
 			   struct v4l2_buffer *b);
-	int (*vidioc_expbuf)(struct file *file, void *fh,
+	int (*vidioc_expbuf)(struct file *file, void *priv,
 			     struct v4l2_exportbuffer *e);
-	int (*vidioc_dqbuf)(struct file *file, void *fh,
+	int (*vidioc_dqbuf)(struct file *file, void *priv,
 			    struct v4l2_buffer *b);
 
-	int (*vidioc_create_bufs)(struct file *file, void *fh,
+	int (*vidioc_create_bufs)(struct file *file, void *priv,
 				  struct v4l2_create_buffers *b);
-	int (*vidioc_prepare_buf)(struct file *file, void *fh,
+	int (*vidioc_prepare_buf)(struct file *file, void *priv,
 				  struct v4l2_buffer *b);
-	int (*vidioc_remove_bufs)(struct file *file, void *fh,
+	int (*vidioc_remove_bufs)(struct file *file, void *priv,
 				  struct v4l2_remove_buffers *d);
 
-	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
-	int (*vidioc_g_fbuf)(struct file *file, void *fh,
+	int (*vidioc_overlay)(struct file *file, void *priv, unsigned int i);
+	int (*vidioc_g_fbuf)(struct file *file, void *priv,
 			     struct v4l2_framebuffer *a);
-	int (*vidioc_s_fbuf)(struct file *file, void *fh,
+	int (*vidioc_s_fbuf)(struct file *file, void *priv,
 			     const struct v4l2_framebuffer *a);
 
 		/* Stream on/off */
-	int (*vidioc_streamon)(struct file *file, void *fh,
+	int (*vidioc_streamon)(struct file *file, void *priv,
 			       enum v4l2_buf_type i);
-	int (*vidioc_streamoff)(struct file *file, void *fh,
+	int (*vidioc_streamoff)(struct file *file, void *priv,
 				enum v4l2_buf_type i);
 
 		/*
@@ -438,135 +438,135 @@ struct v4l2_ioctl_ops {
 		 *
 		 * Note: ENUMSTD is handled by videodev.c
 		 */
-	int (*vidioc_g_std)(struct file *file, void *fh, v4l2_std_id *norm);
-	int (*vidioc_s_std)(struct file *file, void *fh, v4l2_std_id norm);
-	int (*vidioc_querystd)(struct file *file, void *fh, v4l2_std_id *a);
+	int (*vidioc_g_std)(struct file *file, void *priv, v4l2_std_id *norm);
+	int (*vidioc_s_std)(struct file *file, void *priv, v4l2_std_id norm);
+	int (*vidioc_querystd)(struct file *file, void *priv, v4l2_std_id *a);
 
 		/* Input handling */
-	int (*vidioc_enum_input)(struct file *file, void *fh,
+	int (*vidioc_enum_input)(struct file *file, void *priv,
 				 struct v4l2_input *inp);
-	int (*vidioc_g_input)(struct file *file, void *fh, unsigned int *i);
-	int (*vidioc_s_input)(struct file *file, void *fh, unsigned int i);
+	int (*vidioc_g_input)(struct file *file, void *priv, unsigned int *i);
+	int (*vidioc_s_input)(struct file *file, void *priv, unsigned int i);
 
 		/* Output handling */
-	int (*vidioc_enum_output)(struct file *file, void *fh,
+	int (*vidioc_enum_output)(struct file *file, void *priv,
 				  struct v4l2_output *a);
-	int (*vidioc_g_output)(struct file *file, void *fh, unsigned int *i);
-	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
+	int (*vidioc_g_output)(struct file *file, void *priv, unsigned int *i);
+	int (*vidioc_s_output)(struct file *file, void *priv, unsigned int i);
 
 		/* Control handling */
-	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
+	int (*vidioc_query_ext_ctrl)(struct file *file, void *priv,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_g_ext_ctrls)(struct file *file, void *priv,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_s_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_s_ext_ctrls)(struct file *file, void *priv,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_try_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_try_ext_ctrls)(struct file *file, void *priv,
 				    struct v4l2_ext_controls *a);
-	int (*vidioc_querymenu)(struct file *file, void *fh,
+	int (*vidioc_querymenu)(struct file *file, void *priv,
 				struct v4l2_querymenu *a);
 
 	/* Audio ioctls */
-	int (*vidioc_enumaudio)(struct file *file, void *fh,
+	int (*vidioc_enumaudio)(struct file *file, void *priv,
 				struct v4l2_audio *a);
-	int (*vidioc_g_audio)(struct file *file, void *fh,
+	int (*vidioc_g_audio)(struct file *file, void *priv,
 			      struct v4l2_audio *a);
-	int (*vidioc_s_audio)(struct file *file, void *fh,
+	int (*vidioc_s_audio)(struct file *file, void *priv,
 			      const struct v4l2_audio *a);
 
 	/* Audio out ioctls */
-	int (*vidioc_enumaudout)(struct file *file, void *fh,
+	int (*vidioc_enumaudout)(struct file *file, void *priv,
 				 struct v4l2_audioout *a);
-	int (*vidioc_g_audout)(struct file *file, void *fh,
+	int (*vidioc_g_audout)(struct file *file, void *priv,
 			       struct v4l2_audioout *a);
-	int (*vidioc_s_audout)(struct file *file, void *fh,
+	int (*vidioc_s_audout)(struct file *file, void *priv,
 			       const struct v4l2_audioout *a);
-	int (*vidioc_g_modulator)(struct file *file, void *fh,
+	int (*vidioc_g_modulator)(struct file *file, void *priv,
 				  struct v4l2_modulator *a);
-	int (*vidioc_s_modulator)(struct file *file, void *fh,
+	int (*vidioc_s_modulator)(struct file *file, void *priv,
 				  const struct v4l2_modulator *a);
 	/* Crop ioctls */
-	int (*vidioc_g_pixelaspect)(struct file *file, void *fh,
+	int (*vidioc_g_pixelaspect)(struct file *file, void *priv,
 				    int buf_type, struct v4l2_fract *aspect);
-	int (*vidioc_g_selection)(struct file *file, void *fh,
+	int (*vidioc_g_selection)(struct file *file, void *priv,
 				  struct v4l2_selection *s);
-	int (*vidioc_s_selection)(struct file *file, void *fh,
+	int (*vidioc_s_selection)(struct file *file, void *priv,
 				  struct v4l2_selection *s);
 	/* Compression ioctls */
-	int (*vidioc_g_jpegcomp)(struct file *file, void *fh,
+	int (*vidioc_g_jpegcomp)(struct file *file, void *priv,
 				 struct v4l2_jpegcompression *a);
-	int (*vidioc_s_jpegcomp)(struct file *file, void *fh,
+	int (*vidioc_s_jpegcomp)(struct file *file, void *priv,
 				 const struct v4l2_jpegcompression *a);
-	int (*vidioc_g_enc_index)(struct file *file, void *fh,
+	int (*vidioc_g_enc_index)(struct file *file, void *priv,
 				  struct v4l2_enc_idx *a);
-	int (*vidioc_encoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_encoder_cmd)(struct file *file, void *priv,
 				  struct v4l2_encoder_cmd *a);
-	int (*vidioc_try_encoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_try_encoder_cmd)(struct file *file, void *priv,
 				      struct v4l2_encoder_cmd *a);
-	int (*vidioc_decoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_decoder_cmd)(struct file *file, void *priv,
 				  struct v4l2_decoder_cmd *a);
-	int (*vidioc_try_decoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_try_decoder_cmd)(struct file *file, void *priv,
 				      struct v4l2_decoder_cmd *a);
 
 	/* Stream type-dependent parameter ioctls */
-	int (*vidioc_g_parm)(struct file *file, void *fh,
+	int (*vidioc_g_parm)(struct file *file, void *priv,
 			     struct v4l2_streamparm *a);
-	int (*vidioc_s_parm)(struct file *file, void *fh,
+	int (*vidioc_s_parm)(struct file *file, void *priv,
 			     struct v4l2_streamparm *a);
 
 	/* Tuner ioctls */
-	int (*vidioc_g_tuner)(struct file *file, void *fh,
+	int (*vidioc_g_tuner)(struct file *file, void *priv,
 			      struct v4l2_tuner *a);
-	int (*vidioc_s_tuner)(struct file *file, void *fh,
+	int (*vidioc_s_tuner)(struct file *file, void *priv,
 			      const struct v4l2_tuner *a);
-	int (*vidioc_g_frequency)(struct file *file, void *fh,
+	int (*vidioc_g_frequency)(struct file *file, void *priv,
 				  struct v4l2_frequency *a);
-	int (*vidioc_s_frequency)(struct file *file, void *fh,
+	int (*vidioc_s_frequency)(struct file *file, void *priv,
 				  const struct v4l2_frequency *a);
-	int (*vidioc_enum_freq_bands)(struct file *file, void *fh,
+	int (*vidioc_enum_freq_bands)(struct file *file, void *priv,
 				      struct v4l2_frequency_band *band);
 
 	/* Sliced VBI cap */
-	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *priv,
 				       struct v4l2_sliced_vbi_cap *a);
 
 	/* Log status ioctl */
-	int (*vidioc_log_status)(struct file *file, void *fh);
+	int (*vidioc_log_status)(struct file *file, void *priv);
 
-	int (*vidioc_s_hw_freq_seek)(struct file *file, void *fh,
+	int (*vidioc_s_hw_freq_seek)(struct file *file, void *priv,
 				     const struct v4l2_hw_freq_seek *a);
 
 	/* Debugging ioctls */
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-	int (*vidioc_g_register)(struct file *file, void *fh,
+	int (*vidioc_g_register)(struct file *file, void *priv,
 				 struct v4l2_dbg_register *reg);
-	int (*vidioc_s_register)(struct file *file, void *fh,
+	int (*vidioc_s_register)(struct file *file, void *priv,
 				 const struct v4l2_dbg_register *reg);
 
-	int (*vidioc_g_chip_info)(struct file *file, void *fh,
+	int (*vidioc_g_chip_info)(struct file *file, void *priv,
 				  struct v4l2_dbg_chip_info *chip);
 #endif
 
-	int (*vidioc_enum_framesizes)(struct file *file, void *fh,
+	int (*vidioc_enum_framesizes)(struct file *file, void *priv,
 				      struct v4l2_frmsizeenum *fsize);
 
-	int (*vidioc_enum_frameintervals)(struct file *file, void *fh,
+	int (*vidioc_enum_frameintervals)(struct file *file, void *priv,
 					  struct v4l2_frmivalenum *fival);
 
 	/* DV Timings IOCTLs */
-	int (*vidioc_s_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_s_dv_timings)(struct file *file, void *priv,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_g_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_g_dv_timings)(struct file *file, void *priv,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_query_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_query_dv_timings)(struct file *file, void *priv,
 				       struct v4l2_dv_timings *timings);
-	int (*vidioc_enum_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_enum_dv_timings)(struct file *file, void *priv,
 				      struct v4l2_enum_dv_timings *timings);
-	int (*vidioc_dv_timings_cap)(struct file *file, void *fh,
+	int (*vidioc_dv_timings_cap)(struct file *file, void *priv,
 				     struct v4l2_dv_timings_cap *cap);
-	int (*vidioc_g_edid)(struct file *file, void *fh,
+	int (*vidioc_g_edid)(struct file *file, void *priv,
 			     struct v4l2_edid *edid);
-	int (*vidioc_s_edid)(struct file *file, void *fh,
+	int (*vidioc_s_edid)(struct file *file, void *priv,
 			     struct v4l2_edid *edid);
 
 	int (*vidioc_subscribe_event)(struct v4l2_fh *fh,
@@ -575,7 +575,7 @@ struct v4l2_ioctl_ops {
 					const struct v4l2_event_subscription *sub);
 
 	/* For other private ioctls */
-	long (*vidioc_default)(struct file *file, void *fh,
+	long (*vidioc_default)(struct file *file, void *priv,
 			       bool valid_prio, unsigned int cmd, void *arg);
 };
 
-- 
Regards,

Laurent Pinchart


