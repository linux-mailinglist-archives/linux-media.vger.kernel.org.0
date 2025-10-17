Return-Path: <linux-media+bounces-44893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF0BE8F4C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E80E188A56E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028C92F6903;
	Fri, 17 Oct 2025 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+AUaleX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0B2F6918
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708314; cv=none; b=RApcXmdotH/Gg/KHorm9BzJP2n2jrTQREbhcGIuHauHnZI+Py/mHANrMjdbWxDslh53zCdcovc0QbjHmvX2l12M8rWgu9JYuIQaCFruG6S3yLF9a0QxNQc9HLGHsZNNu19VtxNexIA6hBXbQar3S1v98xZYPMoP4nxcYmysUny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708314; c=relaxed/simple;
	bh=29SfeHUGCE6rbGrUJOuGECvSaTE4V8Eivk/mBXk7zaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0MoJbhGw0JeeDvnpjGWESKDzmCT5XWN/qQNP2xRs9SVC3qZYJttADAwL7AJP4Z35LB760vnk0OLFHYtPOyEaksWFYgpZgjRy92UpBM99aOlLKd9zbsR+Q7Axd64Q8Qk+DW0HHzzPrQ1L/LTKGBZ3LnGWYfU1nuYn9jxYonKysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+AUaleX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EA9C113D0;
	Fri, 17 Oct 2025 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708313;
	bh=29SfeHUGCE6rbGrUJOuGECvSaTE4V8Eivk/mBXk7zaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U+AUaleXynjHF0eGSKPRI3tKww0C7aR9eMW40VHzYJksGgQNVIy0gRGPeMlq4/l73
	 khg9xHLv9ipXBGv1GYgste8JjLQ5XRhDvML4ppu2UQd4p9TMA/zRHHDFJvMIdcNETV
	 QMhH5BAIFdfRJ3w68SaNsU5EFFOI5C3+843rv+f0Qqqaoo9+MqY+YXAmT7a8PboaxH
	 Ef9x7OvGb3WlLy/Z+/0rpfAiycPtK4XPY7JoCDNzdXDuqcVZUaIzsUFq6OkYyx3BNa
	 hwnF1gsZs1uuj38dgUSMvwjYcpbF78AcP/h0tn2PYr7fuuvu1CUDnC7ZnRM2EeIT/L
	 RGlLDpxDkRBKQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 02/14] media: omap3isp: add V4L2_CAP_IO_MC and don't set bus_info
Date: Fri, 17 Oct 2025 15:26:39 +0200
Message-ID: <1a380c3be77363f980ff07e3fe3c87f8346ee55d.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
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


