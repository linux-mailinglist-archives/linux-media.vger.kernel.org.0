Return-Path: <linux-media+bounces-39835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD90B2554B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5175D17134E
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CC72FE59B;
	Wed, 13 Aug 2025 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gsjGD80u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647112F28FC
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120318; cv=none; b=VjOo7jNUer+XnyQwQ+AzSU/czfQQI3IjK5mTr5wph2sfLagX8qKY8m0fK1IRS/x3mTBRatKexwypfgs7xmNP7evOfm/g/7/tfD+7czl7jPviXqIMEnfMK08E0M3fbwix+j/SHfD0OiVvxGk0ACWA+u7h/BYFvKA1m3/w8qSyi+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120318; c=relaxed/simple;
	bh=CC508xyvFroE0tXpEpuvR9L5bqvPMX40ZhdQ6o2B2wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCLgR9Vy41ijYrtpQUgVGdy7mSnj3bZ6WsEwrU8K5pw4dGC47JKLzr0HYPpvQmMiARGbATs4or3kf+ARZpKNTCdBA1DRWMaj6/X8vhKfkuzl3WV1Lz1o+FanpyzB7nammWtkMTAvi62a7P6qLIyMvc+LbJ66EcrgB7+tWhajcOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gsjGD80u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1C6FD15CD;
	Wed, 13 Aug 2025 23:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755120261;
	bh=CC508xyvFroE0tXpEpuvR9L5bqvPMX40ZhdQ6o2B2wI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsjGD80uGjGEz8kC6zBSje4QrsL5cwcYzD/blgQ23crQm08reY71uyKs8UWm08ZK+
	 mRrwWS+R/mDlX0JwB2kpZlg36xWwhvDOpiXO5M8ttRSnrmHY+PgMOaDb8U2b38FIQQ
	 uyYyzNYllv3z2vltZxNScHVCVTGkYugLOF/ELnj0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Leitner <richard.leitner@linux.dev>,
	imx@lists.linux.dev
Subject: [PATCH v2 2/2] media: nxp: imx8-isi: Drop mxc_isi_video.is_streaming field
Date: Thu, 14 Aug 2025 00:24:51 +0300
Message-ID: <20250813212451.22140-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
References: <20250813212451.22140-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mxc_isi_video.is_streaming field is used to track the streaming
status of the video device. The same information is also tracked by the
videobuf2 queue. Drop the is_streaming field, and check the queue
streaming status instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h  | 3 +--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 8 ++------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 206995bedca4..d86f5ede0c0e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -202,9 +202,8 @@ struct mxc_isi_video {
 	struct video_device		vdev;
 	struct media_pad		pad;
 
-	/* Protects is_streaming, and the vdev and vb2_q operations */
+	/* Protects the vdev and vb2_q operations */
 	struct mutex			lock;
-	bool				is_streaming;
 
 	struct v4l2_pix_format_mplane	pix;
 	const struct mxc_isi_format_info *fmtinfo;
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 042b554d2775..13682bf6e9f8 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -969,8 +969,6 @@ static int mxc_isi_vb2_prepare_streaming(struct vb2_queue *q)
 	if (ret)
 		goto err_stop;
 
-	video->is_streaming = true;
-
 	return 0;
 
 err_stop:
@@ -1035,8 +1033,6 @@ static void mxc_isi_vb2_unprepare_streaming(struct vb2_queue *q)
 	mxc_isi_video_free_discard_buffers(video);
 	video_device_pipeline_stop(&video->vdev);
 	mxc_isi_pipe_release(video->pipe);
-
-	video->is_streaming = false;
 }
 
 static const struct vb2_ops mxc_isi_vb2_qops = {
@@ -1317,7 +1313,7 @@ void mxc_isi_video_suspend(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_video *video = &pipe->video;
 
-	if (!video->is_streaming)
+	if (!vb2_is_streaming(&video->vb2_q))
 		return;
 
 	mxc_isi_pipe_disable(pipe);
@@ -1348,7 +1344,7 @@ int mxc_isi_video_resume(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_video *video = &pipe->video;
 
-	if (!video->is_streaming)
+	if (!vb2_is_streaming(&video->vb2_q))
 		return 0;
 
 	mxc_isi_video_init_channel(video);
-- 
Regards,

Laurent Pinchart


