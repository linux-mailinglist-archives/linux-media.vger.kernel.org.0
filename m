Return-Path: <linux-media+bounces-39347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF33B1F7F1
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB883B075E
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD35121638A;
	Sun, 10 Aug 2025 01:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pgENzDds"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22E189902
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789607; cv=none; b=c5bWxXrAJQIcf2qmFeUVgT/R3bAfcIHwa47gmS87KyNtaR05BI1zSGeMBl1fqwzwpahkIRk8LFoSvOuh8cNESEAfjA26FLoOCRsvAvJpHT94js+UxabAxO/fP6nM9rdNo5atO2lUDT7bQRyJhNQh0SApSjAc4zrufGTUKZkb3Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789607; c=relaxed/simple;
	bh=TUsWG1D+aU2pkcWeFGlJM2FHVtMbQksKxYxc9BHPS+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzX9M+2dVSuumG98X/S9jOZAFPVTIQIxaJkS3qWdSongWfvV6vkGrF/VPDJ8EzX7CH96DHhqFd3v2govfR09hWr6RVPmXAsbeJ+1jNi6Ygy+gFUG+51Fn8G5q0YdMemvNoKAKnamfA08nkgIuq0OSGlh5O9QvwgDqRtV3BLVWj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pgENzDds; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 584E919C6;
	Sun, 10 Aug 2025 03:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789552;
	bh=TUsWG1D+aU2pkcWeFGlJM2FHVtMbQksKxYxc9BHPS+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pgENzDdsoMB9JYPDvIGMvtXjHluAerCETeY34XS6Q1f53qT+rMv9gD2DdcaHZPjyx
	 IOtPPgV619gEVBc1MhQmuyuA4AV0gNjQC59vR6Ny2sP22vLyLIF33nIaUwwO8sLvib
	 2w1D1jPSoqTo9KglouCdTgZ0CCIcK34HRRvOeKbk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v3 74/76] media: v4l2-core: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 04:30:56 +0300
Message-ID: <20250810013100.29776-75-laurent.pinchart+renesas@ideasonboard.com>
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

The second argument to the ioctl handlers is not a file handle any more.
Rename it from 'void *fh' to 'void *priv' in the V4L2 core, to avoid
misconceptions.

While at it, align function arguments in include/media/v4l2-mem2mem.h.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c |  2 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c   |  6 ++--
 include/media/v4l2-ctrls.h               |  4 +--
 include/media/v4l2-mem2mem.h             | 42 ++++++++++++------------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index afb4e5581b90..49a5c7538a09 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1250,7 +1250,7 @@ EXPORT_SYMBOL(v4l2_querymenu);
  * VIDIOC_LOG_STATUS helpers
  */
 
-int v4l2_ctrl_log_status(struct file *file, void *fh)
+int v4l2_ctrl_log_status(struct file *file, void *priv)
 {
 	struct video_device *vfd = video_devdata(file);
 
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 7678b8dbedbd..21acd9bc8607 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1460,7 +1460,7 @@ int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_streamoff);
 
-int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *priv,
 				   struct v4l2_encoder_cmd *ec)
 {
 	if (ec->cmd != V4L2_ENC_CMD_STOP && ec->cmd != V4L2_ENC_CMD_START)
@@ -1471,7 +1471,7 @@ int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_encoder_cmd);
 
-int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *priv,
 				   struct v4l2_decoder_cmd *dc)
 {
 	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
@@ -1553,7 +1553,7 @@ int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
 
-int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *priv,
 					     struct v4l2_decoder_cmd *dc)
 {
 	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index c32c46286441..4a294a5c7bdd 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1313,13 +1313,13 @@ void v4l2_ctrl_merge(const struct v4l2_event *old, struct v4l2_event *new);
  * v4l2_ctrl_log_status - helper function to implement %VIDIOC_LOG_STATUS ioctl
  *
  * @file: pointer to struct file
- * @fh: unused. Kept just to be compatible to the arguments expected by
+ * @priv: unused. Kept just to be compatible to the arguments expected by
  *	&struct v4l2_ioctl_ops.vidioc_log_status.
  *
  * Can be used as a vidioc_log_status function that just dumps all controls
  * associated with the filehandle.
  */
-int v4l2_ctrl_log_status(struct file *file, void *fh);
+int v4l2_ctrl_log_status(struct file *file, void *priv);
 
 /**
  * v4l2_ctrl_subscribe_event - Subscribes to an event
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 0af330cf91c3..09c6164577cc 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -864,34 +864,34 @@ void v4l2_m2m_request_queue(struct media_request *req);
 /* v4l2 ioctl helpers */
 
 int v4l2_m2m_ioctl_reqbufs(struct file *file, void *priv,
-				struct v4l2_requestbuffers *rb);
-int v4l2_m2m_ioctl_create_bufs(struct file *file, void *fh,
-				struct v4l2_create_buffers *create);
+			   struct v4l2_requestbuffers *rb);
+int v4l2_m2m_ioctl_create_bufs(struct file *file, void *priv,
+			       struct v4l2_create_buffers *create);
 int v4l2_m2m_ioctl_remove_bufs(struct file *file, void *priv,
 			       struct v4l2_remove_buffers *d);
-int v4l2_m2m_ioctl_querybuf(struct file *file, void *fh,
-				struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_expbuf(struct file *file, void *fh,
-				struct v4l2_exportbuffer *eb);
-int v4l2_m2m_ioctl_qbuf(struct file *file, void *fh,
-				struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_dqbuf(struct file *file, void *fh,
-				struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_prepare_buf(struct file *file, void *fh,
+int v4l2_m2m_ioctl_querybuf(struct file *file, void *priv,
+			    struct v4l2_buffer *buf);
+int v4l2_m2m_ioctl_expbuf(struct file *file, void *priv,
+			  struct v4l2_exportbuffer *eb);
+int v4l2_m2m_ioctl_qbuf(struct file *file, void *priv,
+			struct v4l2_buffer *buf);
+int v4l2_m2m_ioctl_dqbuf(struct file *file, void *priv,
+			 struct v4l2_buffer *buf);
+int v4l2_m2m_ioctl_prepare_buf(struct file *file, void *priv,
 			       struct v4l2_buffer *buf);
-int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
-				enum v4l2_buf_type type);
-int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
-				enum v4l2_buf_type type);
-int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_streamon(struct file *file, void *priv,
+			    enum v4l2_buf_type type);
+int v4l2_m2m_ioctl_streamoff(struct file *file, void *priv,
+			     enum v4l2_buf_type type);
+int v4l2_m2m_ioctl_encoder_cmd(struct file *file, void *priv,
 			       struct v4l2_encoder_cmd *ec);
-int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
 			       struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *priv,
 				   struct v4l2_encoder_cmd *ec);
-int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *priv,
 				   struct v4l2_decoder_cmd *dc);
-int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
+int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *priv,
 					     struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
 					 struct v4l2_decoder_cmd *dc);
-- 
Regards,

Laurent Pinchart


