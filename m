Return-Path: <linux-media+bounces-17318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA3396821A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D524DB22F34
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 08:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB201865F6;
	Mon,  2 Sep 2024 08:36:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F3186E55
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 08:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266161; cv=none; b=ToJdm3RzeGDLT64AFRjazQF1SsA0PQabXVZ3651CjW2GSIb8bX6t1fIIF6OZkF6OOgDVMCRyVXBg087l7Qm6TOSOwF6X1xMixV3MV+pO415/9QMxvHd9+KEbtQ2Pmdb3tbtDIB9d0zLSWRJT916taKLINnNROQ+OFJZIIicyNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266161; c=relaxed/simple;
	bh=i1zW5ezhI+uzHZi3F5gsg5NhDVl/y+quoO8No/mYr3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piLtCSjmPReueU6qeUv88lCX0Mh9GXkeHUTw52v1dsxlX4mS5XSln39pNuktfVoQBYmG81VjiaRcnwPOVG7LQ8gsewVPn44BlX/pP/YogcH6Toptdg8I+LgKVPzKysfbgkX6Fd7M49+C9sECKZcMHEm0u/+nSfaDxltL7AR+ymU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6619C4CEC8;
	Mon,  2 Sep 2024 08:35:59 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 2/4] media: omap3isp: add missing wait_prepare/finish ops
Date: Mon,  2 Sep 2024 10:31:22 +0200
Message-ID: <1dc1a43151a5c66ed00935055730c56517b44ac9.1725265884.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without these ops the v4l2-compliance blocking wait test will fail.
These ops are required to ensure that when VIDIOC_DQBUF has to
wait for buffers to arrive, the queue lock is correctly released
and retaken. Otherwise the wait for a buffer would block all other
queue ioctls.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index daca689dc082..5c9aa80023fd 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -480,11 +480,29 @@ static int isp_video_start_streaming(struct vb2_queue *queue,
 	return 0;
 }
 
+static void omap3isp_wait_prepare(struct vb2_queue *vq)
+{
+	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
+	struct isp_video *video = vfh->video;
+
+	mutex_unlock(&video->queue_lock);
+}
+
+static void omap3isp_wait_finish(struct vb2_queue *vq)
+{
+	struct isp_video_fh *vfh = vb2_get_drv_priv(vq);
+	struct isp_video *video = vfh->video;
+
+	mutex_lock(&video->queue_lock);
+}
+
 static const struct vb2_ops isp_video_queue_ops = {
 	.queue_setup = isp_video_queue_setup,
 	.buf_prepare = isp_video_buffer_prepare,
 	.buf_queue = isp_video_buffer_queue,
 	.start_streaming = isp_video_start_streaming,
+	.wait_prepare = omap3isp_wait_prepare,
+	.wait_finish = omap3isp_wait_finish,
 };
 
 /*
-- 
2.43.0


