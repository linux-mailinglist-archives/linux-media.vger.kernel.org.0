Return-Path: <linux-media+bounces-39855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17360B2570A
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 00:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26F405A26E2
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 22:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FE630E82C;
	Wed, 13 Aug 2025 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UUeD0BSA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE272FB992
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 22:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125724; cv=none; b=gyeL1cgJ9s2EUzuqhDZpcXQUi0nb8OEkvUtt1r/D0Nw49YSAYWb2rX8hG36qEkhd4gLKCJNKKKORTgeB+DdszVejXzooRDL+/H1031d5SzXGxuBOp3j6fRAArVDtcnB/1oCI8Q2BOEOSDJYYpl8Ue5krnFWIFjlPy9x+CiY02vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125724; c=relaxed/simple;
	bh=Bytdh1hz9XTOD39RFYGMkonImjmewvQdCnHqeFJXNqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3LcaV5u16CgOKPNLJ8t2Vk3PoIbGXS7hK9Ku20SSg4CJI6Qv3udx923P9wN8mtOgny8nr/vannDrZvdsbIn/PVXpwsERSHoG+r22pifQ7fVOBWqrLLMP8OaOs9Obi9As+43O6auVxwPsgW7zcqBAw4ELpNoZR8vlQ/b6G4llqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UUeD0BSA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2AD7C7E0;
	Thu, 14 Aug 2025 00:54:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755125667;
	bh=Bytdh1hz9XTOD39RFYGMkonImjmewvQdCnHqeFJXNqY=;
	h=From:To:Cc:Subject:Date:From;
	b=UUeD0BSA84afD9aAQMAwwsA7iKP6dXZRwyRrGC4CllhmsZEwvx6p0ZWzEM4X6O3HQ
	 mbND2UdwpPXlQhYfbWfdhHZBSjmHvXHNfozcX20/0X8qGj2FUfty9aNAsH2jgAp2gX
	 DwFl/olvvRU8kTfLEv6xUFtQQyWrDZ7liZr0svqs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Leitner <richard.leitner@linux.dev>,
	imx@lists.linux.dev
Subject: [PATCH] media: nxp: imx8-isi: Drop unused argument to mxc_isi_channel_chain()
Date: Thu, 14 Aug 2025 01:55:01 +0300
Message-ID: <20250813225501.20762-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bypass argument to the mxc_isi_channel_chain() function is unused.
Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   |  2 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 11 +++++------
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  2 +-
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index d86f5ede0c0e..5789e54f9428 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -361,7 +361,7 @@ void mxc_isi_channel_get(struct mxc_isi_pipe *pipe);
 void mxc_isi_channel_put(struct mxc_isi_pipe *pipe);
 void mxc_isi_channel_enable(struct mxc_isi_pipe *pipe);
 void mxc_isi_channel_disable(struct mxc_isi_pipe *pipe);
-int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe, bool bypass);
+int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe);
 void mxc_isi_channel_unchain(struct mxc_isi_pipe *pipe);
 
 void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 5623914f95e6..9225a7ac1c3e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -587,7 +587,7 @@ void mxc_isi_channel_release(struct mxc_isi_pipe *pipe)
  *
  * TODO: Support secondary line buffer for downscaling YUV420 images.
  */
-int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe, bool bypass)
+int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe)
 {
 	/* Channel chaining requires both line and output buffer. */
 	const u8 resources = MXC_ISI_CHANNEL_RES_OUTPUT_BUF
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 5501214cc6c0..e36781c5522e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -491,7 +491,6 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
 	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
 	struct mxc_isi_m2m *m2m = ctx->m2m;
-	bool bypass;
 	int ret;
 
 	if (q->streaming)
@@ -504,15 +503,15 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 		goto unlock;
 	}
 
-	bypass = cap_pix->width == out_pix->width &&
-		 cap_pix->height == out_pix->height &&
-		 cap_info->encoding == out_info->encoding;
-
 	/*
 	 * Acquire the pipe and initialize the channel with the first user of
 	 * the M2M device.
 	 */
 	if (m2m->usage_count == 0) {
+		bool bypass = cap_pix->width == out_pix->width &&
+			      cap_pix->height == out_pix->height &&
+			      cap_info->encoding == out_info->encoding;
+
 		ret = mxc_isi_channel_acquire(m2m->pipe,
 					      &mxc_isi_m2m_frame_write_done,
 					      bypass);
@@ -529,7 +528,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 	 * buffer chaining.
 	 */
 	if (!ctx->chained && out_pix->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
-		ret = mxc_isi_channel_chain(m2m->pipe, bypass);
+		ret = mxc_isi_channel_chain(m2m->pipe);
 		if (ret)
 			goto deinit;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index d76eb58deb09..a41c51dd9ce0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -855,7 +855,7 @@ int mxc_isi_pipe_acquire(struct mxc_isi_pipe *pipe,
 
 	/* Chain the channel if needed for wide resolutions. */
 	if (sink_fmt->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
-		ret = mxc_isi_channel_chain(pipe, bypass);
+		ret = mxc_isi_channel_chain(pipe);
 		if (ret)
 			mxc_isi_channel_release(pipe);
 	}

base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
-- 
Regards,

Laurent Pinchart


