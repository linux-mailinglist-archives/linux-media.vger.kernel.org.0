Return-Path: <linux-media+bounces-48045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F64C9A8F9
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D01CE34606C
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A257D302745;
	Tue,  2 Dec 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d57ORW2H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9042FAC17
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661956; cv=none; b=hTaE/y8wnCQ7TJL480NB3fCDFM26Um5M1C2UW0UkS3+RNk5Ai0GdT9Tyn/j9jIqCIJ4mSoBZDBNMGbiHxIg8X82iZv77U76PL0T8mi4Jf0pTvxJTo+gnFKdTtCqWRryDbp9zrNxShTccr9lxx9nXITTu5YwpPNvgMXVdHO2spVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661956; c=relaxed/simple;
	bh=29SfeHUGCE6rbGrUJOuGECvSaTE4V8Eivk/mBXk7zaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wjkn7wPJCobwQdzwuWrNNdv7RJ6Rx34QIquj3KzJkrbQ1KyZi1U9eSitvwwLyP/YrIQEvqkev2PdRJTO7ZdlsM/wgN40uP6kpaJn0TMn8vAZh2LfawxmtEr2a7vAxxseH7GQXEaEw3je24pOLALnd1m1tfrUeGcpJY+LyRVJGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d57ORW2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7E9C116B1;
	Tue,  2 Dec 2025 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661955;
	bh=29SfeHUGCE6rbGrUJOuGECvSaTE4V8Eivk/mBXk7zaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d57ORW2Hh/3xCMCpfvt7ukv5x4XcoiTD+MXpH3+S7UELq80L++ylUQ6kVYcl6FC4P
	 XJxoXbu6PSpvPaSUJ6m5+8Xe5yuY6F5yKv0SvW1uEE2SPIQ90xrMihLDEuJ1oEAZtE
	 O1oCz4PdzFfoHST84fNlMC4kSVQouw0DFE1FQH+AjhyaPOy3RC8zE9sCLhJq3xyW83
	 HfUMkfJXzpEhXnRYReniQ6+1KfKfR0JwdGtPb1hjd7tGkmmvwzKoFIrfItRK4xebz2
	 BK6TAptcu8pwmZ4Tbx/0Nb64vceuI416a20YgtVL49syGkA9gwrsHMKGOCS1WtQFED
	 puz0/Lfoz2HRA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 02/12] media: omap3isp: add V4L2_CAP_IO_MC and don't set bus_info
Date: Tue,  2 Dec 2025 08:51:10 +0100
Message-ID: <304753821eac7504f2177c4369ace8c589083b4d.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since this is a media-centric device set the V4L2_CAP_IO_MC
capability. Also don't set bus_info, leave that to the v4l2 core.

This fixes v4l2-compliance errors:

test MC information (see 'Media Driver Info' above): OK
	fail: v4l2-compliance.cpp(661): missing bus_info prefix ('media')

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 0e7f0bf2b346..46609045e2c8 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -645,11 +645,9 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 
 	strscpy(cap->driver, ISP_VIDEO_DRIVER_NAME, sizeof(cap->driver));
 	strscpy(cap->card, video->video.name, sizeof(cap->card));
-	strscpy(cap->bus_info, "media", sizeof(cap->bus_info));
 
 	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_OUTPUT
-		| V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS;
-
+		| V4L2_CAP_STREAMING | V4L2_CAP_DEVICE_CAPS | V4L2_CAP_IO_MC;
 
 	return 0;
 }
@@ -1451,10 +1449,10 @@ int omap3isp_video_init(struct isp_video *video, const char *name)
 	video->video.ioctl_ops = &isp_video_ioctl_ops;
 	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE
-					 | V4L2_CAP_STREAMING;
+					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	else
 		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT
-					 | V4L2_CAP_STREAMING;
+					 | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 
 	video->pipe.stream_state = ISP_PIPELINE_STREAM_STOPPED;
 
-- 
2.51.0


