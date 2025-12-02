Return-Path: <linux-media+bounces-48032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC54C9A8BD
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077B13A4B76
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AB330277E;
	Tue,  2 Dec 2025 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb/pV6NR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E4D1D514E
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661742; cv=none; b=TYNk+GI83Qd8FozaJcneTdDhMoPGSrLBjRWWtptpQN+4KAeRR5zeAUiWPRZe4oI6oE7mU5NGPrU8Q2RJWiHOO9X/81oJIsQw8T5c8kv0z82vIjPzVsNBq8TvvM7XnNueoo4bxWVldS1CY5hkjQpkX41w8gYg1zciDfdMkJSnJM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661742; c=relaxed/simple;
	bh=29SfeHUGCE6rbGrUJOuGECvSaTE4V8Eivk/mBXk7zaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXyUTIaCEOjktVXf2I2MjHPypIl3144pZHdGR92YmEMpcVPyY6/TTSJLM+/SID+IOxxQDghHHGGdjUrM1ZkhK5yVlyU18WDzjRV+wNsm4G45IxInnG/Xx/H0ma3/7VK5+vBMkTThl63d/Ut7lNSZCJy9NeV875mTqiRI+Z2CYHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb/pV6NR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E518C116B1;
	Tue,  2 Dec 2025 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661741;
	bh=29SfeHUGCE6rbGrUJOuGECvSaTE4V8Eivk/mBXk7zaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fb/pV6NRWgZCjOiOwhi25/+bF8w6FF7crgnt3SIddrX4EKR5N7kNKBEwSsTxw4kCr
	 IcUbbFj8JbSrRIJF7rBkrWGmlmhrDM5ho93I2fbEbMABGZ4VROOwCMYnPCY8FRCMSz
	 1NRsdLFgNzFtcMXY4L2qKkEAhaghqX+I2QS+isgHCUHxxQPLCJcqNAVAHi2ttqx5c9
	 /0DWECH+kssNOPL5uL78mP1UXVES9mNcigSmQELg9Jmnos4yV1KzX/aZ9NixN3P2vq
	 rTjUbb4SIKYb8jjsmDW3c+7jlXtH9m7sk3D9cbckiSDnuDtfafVEuyKtsZxwvK0m30
	 h5yDn6dRa+F9A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 01/11] media: omap3isp: add V4L2_CAP_IO_MC and don't set bus_info
Date: Tue,  2 Dec 2025 08:48:02 +0100
Message-ID: <0fbb6bf2218c1a74501875b84f821d7f64e42ac7.1764661692.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661692.git.hverkuil+cisco@kernel.org>
References: <cover.1764661692.git.hverkuil+cisco@kernel.org>
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


