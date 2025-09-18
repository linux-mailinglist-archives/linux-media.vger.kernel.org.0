Return-Path: <linux-media+bounces-39264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8298B1F6BF
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBC9917BBF1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4792D0C7E;
	Sat,  9 Aug 2025 21:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vwThwf6A"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280332C08A0
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774356; cv=none; b=mAmmC5g0sY0Z7wildGkFgmGlIKMSIlOo6Hsla16RszASGeH4YOsJeY2HXZD0eKno/94+hPq8C0141J/1tEsomvs4JhgnjlQgtYIbuge6fn3emEVfAMF5/eaSITkSc8+tbyij9QK8ET5A8Qb9svoaP3mrM+qpBGabvhV3nl9Ma/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774356; c=relaxed/simple;
	bh=fprBA2UReHaIpGpE6AehrJjRmLLv/MXb35A6bC7YaS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcLAa26hMojcIPCclUGSBrO27HfnJBACoqmmS7l4WeIF9uAGoe5ScplkBdKrFCH1Q6QKyssyNrEQhB92qAgwq6OLLqWNpCk6Wc+fNWNv2Ubi5OtZ6DNfVpZ9jxUxQ0Zz0FBMwhEJ88yHqsP2d3OLomODanLVmOLYWXBZ0B4MDn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vwThwf6A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E588589A;
	Sat,  9 Aug 2025 23:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774296;
	bh=fprBA2UReHaIpGpE6AehrJjRmLLv/MXb35A6bC7YaS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vwThwf6A7IZathR8JNOXT8GlOYj/ayBPfJ3PCI2DpFZjWJtXizNoALHBKyub/3q6c
	 Wgptc440v18NdoRHIkPdtaCRNLay6EwZYHIyyQeDzKFue9BUHHzrz/Fdf7zxxTyYGs
	 452ASVh294c8LJ/3Bc9/A0H848OXfoAhFp/6Z9aM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 69/76] media: v4l2-ioctl: Stop passing fh pointer to ioctl handlers
Date: Sun, 10 Aug 2025 00:16:46 +0300
Message-ID: <20250809211654.28887-70-laurent.pinchart@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Now that all drivers access the v4l2_fh from the file structure, there
is no need to pass it as an explicit argument to ioctl handlers. Set the
argument to NULL in the w__video_do_ioctl(), and drop the name of the
void *fh argument in the ioctl handler declarations to indicate it is
not used.

The argument could be removed altogether with a mechanical change
(probably using coccinelle), but there are plans to pass a new argument
to the ioctl handlers in the near future. The tree-wide change to remove
the argument, only to add another one soon after, would be too much
churn.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Pass NULL to .vidioc_query_ext_ctrl() in ctrl_is_pointer()
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ioctl.h                    | 236 +++++++++---------
 3 files changed, 121 insertions(+), 121 deletions(-)

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
index 82695c3a300a..223e2c7a3516 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -293,144 +293,144 @@ struct v4l2_ioctl_ops {
 	/* ioctl callbacks */
 
 	/* VIDIOC_QUERYCAP handler */
-	int (*vidioc_querycap)(struct file *file, void *fh,
+	int (*vidioc_querycap)(struct file *file, void *,
 			       struct v4l2_capability *cap);
 
 	/* VIDIOC_ENUM_FMT handlers */
-	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_cap)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_overlay)(struct file *file, void *,
 					   struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_vid_out)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_sdr_cap)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_sdr_out)(struct file *file, void *,
 				       struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_meta_cap)(struct file *file, void *,
 					struct v4l2_fmtdesc *f);
-	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *,
 					struct v4l2_fmtdesc *f);
 
 	/* VIDIOC_G_FMT handlers */
-	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_overlay)(struct file *file, void *,
 					struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out_overlay)(struct file *file, void *,
 					    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vbi_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vbi_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sliced_vbi_cap)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sliced_vbi_out)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_cap_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_vid_out_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sdr_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_sdr_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_meta_cap)(struct file *file, void *,
 				     struct v4l2_format *f);
-	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_g_fmt_meta_out)(struct file *file, void *,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_S_FMT handlers */
-	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_overlay)(struct file *file, void *,
 					struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out_overlay)(struct file *file, void *,
 					    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vbi_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vbi_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sliced_vbi_cap)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sliced_vbi_out)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_cap_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_vid_out_mplane)(struct file *file, void *,
 					   struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sdr_cap)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_sdr_out)(struct file *file, void *,
 				    struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_meta_cap)(struct file *file, void *,
 				     struct v4l2_format *f);
-	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_s_fmt_meta_out)(struct file *file, void *,
 				     struct v4l2_format *f);
 
 	/* VIDIOC_TRY_FMT handlers */
-	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_overlay)(struct file *file, void *,
 					  struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out_overlay)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vbi_cap)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vbi_out)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sliced_vbi_cap)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sliced_vbi_out)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_cap_mplane)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_vid_out_mplane)(struct file *file, void *,
 					     struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sdr_cap)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_sdr_out)(struct file *file, void *,
 				      struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_meta_cap)(struct file *file, void *,
 				       struct v4l2_format *f);
-	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
+	int (*vidioc_try_fmt_meta_out)(struct file *file, void *,
 				       struct v4l2_format *f);
 
 	/* Buffer handlers */
-	int (*vidioc_reqbufs)(struct file *file, void *fh,
+	int (*vidioc_reqbufs)(struct file *file, void *,
 			      struct v4l2_requestbuffers *b);
-	int (*vidioc_querybuf)(struct file *file, void *fh,
+	int (*vidioc_querybuf)(struct file *file, void *,
 			       struct v4l2_buffer *b);
-	int (*vidioc_qbuf)(struct file *file, void *fh,
+	int (*vidioc_qbuf)(struct file *file, void *,
 			   struct v4l2_buffer *b);
-	int (*vidioc_expbuf)(struct file *file, void *fh,
+	int (*vidioc_expbuf)(struct file *file, void *,
 			     struct v4l2_exportbuffer *e);
-	int (*vidioc_dqbuf)(struct file *file, void *fh,
+	int (*vidioc_dqbuf)(struct file *file, void *,
 			    struct v4l2_buffer *b);
 
-	int (*vidioc_create_bufs)(struct file *file, void *fh,
+	int (*vidioc_create_bufs)(struct file *file, void *,
 				  struct v4l2_create_buffers *b);
-	int (*vidioc_prepare_buf)(struct file *file, void *fh,
+	int (*vidioc_prepare_buf)(struct file *file, void *,
 				  struct v4l2_buffer *b);
-	int (*vidioc_remove_bufs)(struct file *file, void *fh,
+	int (*vidioc_remove_bufs)(struct file *file, void *,
 				  struct v4l2_remove_buffers *d);
 
-	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
-	int (*vidioc_g_fbuf)(struct file *file, void *fh,
+	int (*vidioc_overlay)(struct file *file, void *, unsigned int i);
+	int (*vidioc_g_fbuf)(struct file *file, void *,
 			     struct v4l2_framebuffer *a);
-	int (*vidioc_s_fbuf)(struct file *file, void *fh,
+	int (*vidioc_s_fbuf)(struct file *file, void *,
 			     const struct v4l2_framebuffer *a);
 
 		/* Stream on/off */
-	int (*vidioc_streamon)(struct file *file, void *fh,
+	int (*vidioc_streamon)(struct file *file, void *,
 			       enum v4l2_buf_type i);
-	int (*vidioc_streamoff)(struct file *file, void *fh,
+	int (*vidioc_streamoff)(struct file *file, void *,
 				enum v4l2_buf_type i);
 
 		/*
@@ -438,135 +438,135 @@ struct v4l2_ioctl_ops {
 		 *
 		 * Note: ENUMSTD is handled by videodev.c
 		 */
-	int (*vidioc_g_std)(struct file *file, void *fh, v4l2_std_id *norm);
-	int (*vidioc_s_std)(struct file *file, void *fh, v4l2_std_id norm);
-	int (*vidioc_querystd)(struct file *file, void *fh, v4l2_std_id *a);
+	int (*vidioc_g_std)(struct file *file, void *, v4l2_std_id *norm);
+	int (*vidioc_s_std)(struct file *file, void *, v4l2_std_id norm);
+	int (*vidioc_querystd)(struct file *file, void *, v4l2_std_id *a);
 
 		/* Input handling */
-	int (*vidioc_enum_input)(struct file *file, void *fh,
+	int (*vidioc_enum_input)(struct file *file, void *,
 				 struct v4l2_input *inp);
-	int (*vidioc_g_input)(struct file *file, void *fh, unsigned int *i);
-	int (*vidioc_s_input)(struct file *file, void *fh, unsigned int i);
+	int (*vidioc_g_input)(struct file *file, void *, unsigned int *i);
+	int (*vidioc_s_input)(struct file *file, void *, unsigned int i);
 
 		/* Output handling */
-	int (*vidioc_enum_output)(struct file *file, void *fh,
+	int (*vidioc_enum_output)(struct file *file, void *,
 				  struct v4l2_output *a);
-	int (*vidioc_g_output)(struct file *file, void *fh, unsigned int *i);
-	int (*vidioc_s_output)(struct file *file, void *fh, unsigned int i);
+	int (*vidioc_g_output)(struct file *file, void *, unsigned int *i);
+	int (*vidioc_s_output)(struct file *file, void *, unsigned int i);
 
 		/* Control handling */
-	int (*vidioc_query_ext_ctrl)(struct file *file, void *fh,
+	int (*vidioc_query_ext_ctrl)(struct file *file, void *,
 				     struct v4l2_query_ext_ctrl *a);
-	int (*vidioc_g_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_g_ext_ctrls)(struct file *file, void *,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_s_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_s_ext_ctrls)(struct file *file, void *,
 				  struct v4l2_ext_controls *a);
-	int (*vidioc_try_ext_ctrls)(struct file *file, void *fh,
+	int (*vidioc_try_ext_ctrls)(struct file *file, void *,
 				    struct v4l2_ext_controls *a);
-	int (*vidioc_querymenu)(struct file *file, void *fh,
+	int (*vidioc_querymenu)(struct file *file, void *,
 				struct v4l2_querymenu *a);
 
 	/* Audio ioctls */
-	int (*vidioc_enumaudio)(struct file *file, void *fh,
+	int (*vidioc_enumaudio)(struct file *file, void *,
 				struct v4l2_audio *a);
-	int (*vidioc_g_audio)(struct file *file, void *fh,
+	int (*vidioc_g_audio)(struct file *file, void *,
 			      struct v4l2_audio *a);
-	int (*vidioc_s_audio)(struct file *file, void *fh,
+	int (*vidioc_s_audio)(struct file *file, void *,
 			      const struct v4l2_audio *a);
 
 	/* Audio out ioctls */
-	int (*vidioc_enumaudout)(struct file *file, void *fh,
+	int (*vidioc_enumaudout)(struct file *file, void *,
 				 struct v4l2_audioout *a);
-	int (*vidioc_g_audout)(struct file *file, void *fh,
+	int (*vidioc_g_audout)(struct file *file, void *,
 			       struct v4l2_audioout *a);
-	int (*vidioc_s_audout)(struct file *file, void *fh,
+	int (*vidioc_s_audout)(struct file *file, void *,
 			       const struct v4l2_audioout *a);
-	int (*vidioc_g_modulator)(struct file *file, void *fh,
+	int (*vidioc_g_modulator)(struct file *file, void *,
 				  struct v4l2_modulator *a);
-	int (*vidioc_s_modulator)(struct file *file, void *fh,
+	int (*vidioc_s_modulator)(struct file *file, void *,
 				  const struct v4l2_modulator *a);
 	/* Crop ioctls */
-	int (*vidioc_g_pixelaspect)(struct file *file, void *fh,
+	int (*vidioc_g_pixelaspect)(struct file *file, void *,
 				    int buf_type, struct v4l2_fract *aspect);
-	int (*vidioc_g_selection)(struct file *file, void *fh,
+	int (*vidioc_g_selection)(struct file *file, void *,
 				  struct v4l2_selection *s);
-	int (*vidioc_s_selection)(struct file *file, void *fh,
+	int (*vidioc_s_selection)(struct file *file, void *,
 				  struct v4l2_selection *s);
 	/* Compression ioctls */
-	int (*vidioc_g_jpegcomp)(struct file *file, void *fh,
+	int (*vidioc_g_jpegcomp)(struct file *file, void *,
 				 struct v4l2_jpegcompression *a);
-	int (*vidioc_s_jpegcomp)(struct file *file, void *fh,
+	int (*vidioc_s_jpegcomp)(struct file *file, void *,
 				 const struct v4l2_jpegcompression *a);
-	int (*vidioc_g_enc_index)(struct file *file, void *fh,
+	int (*vidioc_g_enc_index)(struct file *file, void *,
 				  struct v4l2_enc_idx *a);
-	int (*vidioc_encoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_encoder_cmd)(struct file *file, void *,
 				  struct v4l2_encoder_cmd *a);
-	int (*vidioc_try_encoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_try_encoder_cmd)(struct file *file, void *,
 				      struct v4l2_encoder_cmd *a);
-	int (*vidioc_decoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_decoder_cmd)(struct file *file, void *,
 				  struct v4l2_decoder_cmd *a);
-	int (*vidioc_try_decoder_cmd)(struct file *file, void *fh,
+	int (*vidioc_try_decoder_cmd)(struct file *file, void *,
 				      struct v4l2_decoder_cmd *a);
 
 	/* Stream type-dependent parameter ioctls */
-	int (*vidioc_g_parm)(struct file *file, void *fh,
+	int (*vidioc_g_parm)(struct file *file, void *,
 			     struct v4l2_streamparm *a);
-	int (*vidioc_s_parm)(struct file *file, void *fh,
+	int (*vidioc_s_parm)(struct file *file, void *,
 			     struct v4l2_streamparm *a);
 
 	/* Tuner ioctls */
-	int (*vidioc_g_tuner)(struct file *file, void *fh,
+	int (*vidioc_g_tuner)(struct file *file, void *,
 			      struct v4l2_tuner *a);
-	int (*vidioc_s_tuner)(struct file *file, void *fh,
+	int (*vidioc_s_tuner)(struct file *file, void *,
 			      const struct v4l2_tuner *a);
-	int (*vidioc_g_frequency)(struct file *file, void *fh,
+	int (*vidioc_g_frequency)(struct file *file, void *,
 				  struct v4l2_frequency *a);
-	int (*vidioc_s_frequency)(struct file *file, void *fh,
+	int (*vidioc_s_frequency)(struct file *file, void *,
 				  const struct v4l2_frequency *a);
-	int (*vidioc_enum_freq_bands)(struct file *file, void *fh,
+	int (*vidioc_enum_freq_bands)(struct file *file, void *,
 				      struct v4l2_frequency_band *band);
 
 	/* Sliced VBI cap */
-	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *fh,
+	int (*vidioc_g_sliced_vbi_cap)(struct file *file, void *,
 				       struct v4l2_sliced_vbi_cap *a);
 
 	/* Log status ioctl */
-	int (*vidioc_log_status)(struct file *file, void *fh);
+	int (*vidioc_log_status)(struct file *file, void *);
 
-	int (*vidioc_s_hw_freq_seek)(struct file *file, void *fh,
+	int (*vidioc_s_hw_freq_seek)(struct file *file, void *,
 				     const struct v4l2_hw_freq_seek *a);
 
 	/* Debugging ioctls */
 #ifdef CONFIG_VIDEO_ADV_DEBUG
-	int (*vidioc_g_register)(struct file *file, void *fh,
+	int (*vidioc_g_register)(struct file *file, void *,
 				 struct v4l2_dbg_register *reg);
-	int (*vidioc_s_register)(struct file *file, void *fh,
+	int (*vidioc_s_register)(struct file *file, void *,
 				 const struct v4l2_dbg_register *reg);
 
-	int (*vidioc_g_chip_info)(struct file *file, void *fh,
+	int (*vidioc_g_chip_info)(struct file *file, void *,
 				  struct v4l2_dbg_chip_info *chip);
 #endif
 
-	int (*vidioc_enum_framesizes)(struct file *file, void *fh,
+	int (*vidioc_enum_framesizes)(struct file *file, void *,
 				      struct v4l2_frmsizeenum *fsize);
 
-	int (*vidioc_enum_frameintervals)(struct file *file, void *fh,
+	int (*vidioc_enum_frameintervals)(struct file *file, void *,
 					  struct v4l2_frmivalenum *fival);
 
 	/* DV Timings IOCTLs */
-	int (*vidioc_s_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_s_dv_timings)(struct file *file, void *,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_g_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_g_dv_timings)(struct file *file, void *,
 				   struct v4l2_dv_timings *timings);
-	int (*vidioc_query_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_query_dv_timings)(struct file *file, void *,
 				       struct v4l2_dv_timings *timings);
-	int (*vidioc_enum_dv_timings)(struct file *file, void *fh,
+	int (*vidioc_enum_dv_timings)(struct file *file, void *,
 				      struct v4l2_enum_dv_timings *timings);
-	int (*vidioc_dv_timings_cap)(struct file *file, void *fh,
+	int (*vidioc_dv_timings_cap)(struct file *file, void *,
 				     struct v4l2_dv_timings_cap *cap);
-	int (*vidioc_g_edid)(struct file *file, void *fh,
+	int (*vidioc_g_edid)(struct file *file, void *,
 			     struct v4l2_edid *edid);
-	int (*vidioc_s_edid)(struct file *file, void *fh,
+	int (*vidioc_s_edid)(struct file *file, void *,
 			     struct v4l2_edid *edid);
 
 	int (*vidioc_subscribe_event)(struct v4l2_fh *fh,
@@ -575,7 +575,7 @@ struct v4l2_ioctl_ops {
 					const struct v4l2_event_subscription *sub);
 
 	/* For other private ioctls */
-	long (*vidioc_default)(struct file *file, void *fh,
+	long (*vidioc_default)(struct file *file, void *,
 			       bool valid_prio, unsigned int cmd, void *arg);
 };
 
-- 
Regards,

Laurent Pinchart


