Return-Path: <linux-media+bounces-44897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93701BE8F31
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F1094E2384
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994012F6912;
	Fri, 17 Oct 2025 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0tH8z7T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500D2F690E
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708321; cv=none; b=rQ9uRYZ5kdlZmdi98imgaVA4yz4OxkkZU5yzQzKM3xWsMCJEjacSSe9AG+gccnAlA3NV6Qnhg7xte3kehTgVQF9cIiLKCknKFTBR3js6DBCsATq3lLx7ehzvQlXkacrKHlLfp28rHCOCgu5ulcySjfTp/AGSXlSAWOdLe7sXY4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708321; c=relaxed/simple;
	bh=tc0lfoXFcmalcCZpeCdH7CzaoSqLHDKkTCiLKA8dt4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unnZ+gWr9oOggD1+2Es4uCCK3XKfnmVTgnWpT8bZAHlFcACIP5K7ndHtNNat7smJTlk5t6KWV9JYpFDrq9ylK99a6o1wQ/M/7mbe73QQ+e1TTpQ/vllaGdhRChFslLb2R3ahO59mqSfyw+52EVZA1G+hREvzcmwCneC2zeqgmgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0tH8z7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FC7C4CEF9;
	Fri, 17 Oct 2025 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708320;
	bh=tc0lfoXFcmalcCZpeCdH7CzaoSqLHDKkTCiLKA8dt4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0tH8z7T4NYu+i3xhb4bl1Jq2vilbjbzoeMjjAN90GhaxX0ZzKwL64ken/bU1iEnh
	 gDyZGN0sSyScg/G/7+DO0TpLMrTffhTznEKlMF6JT0WMBlSG3UY3w5bjHJ0x8zvPgY
	 QbZohKgK6UaN8askZu17auHEZQ5Zydl1hjrXFbibZ2Joy8ndRNugI/fAHsOVN8zFR1
	 DtXVt0ScP2F52uPlQ8BZMECkotdJon+PlDcuLsE/Q1kxlVL63b1Fu5HKnhAseb4ysf
	 AOcVHOz/6ladKXWKkQpGsHQJiPP5fpyANfxNqW8Hz779kuTXGpVTqA86X13e5nB7vA
	 bjdqKFIWeKm7A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 06/14] media: omap3isp: set initial format
Date: Fri, 17 Oct 2025 15:26:43 +0200
Message-ID: <44ca7df373589c7e55d477fa8bf1eefb378422f8.1760707611.git.hverkuil+cisco@kernel.org>
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

Initialize the v4l2_format to a default. Empty formats are
not allowed in V4L2, so this fixes v4l2-compliance issues:

	fail: v4l2-test-formats.cpp(514): !pix.width || !pix.height
test VIDIOC_G_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 77beea00d507..d3fe28506fb0 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1320,6 +1320,7 @@ static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
 static int isp_video_open(struct file *file)
 {
 	struct isp_video *video = video_drvdata(file);
+	struct v4l2_mbus_framefmt fmt;
 	struct isp_video_fh *handle;
 	struct vb2_queue *queue;
 	int ret = 0;
@@ -1362,6 +1363,13 @@ static int isp_video_open(struct file *file)
 
 	memset(&handle->format, 0, sizeof(handle->format));
 	handle->format.type = video->type;
+	handle->format.fmt.pix.width = 720;
+	handle->format.fmt.pix.height = 480;
+	handle->format.fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
+	handle->format.fmt.pix.field = V4L2_FIELD_NONE;
+	handle->format.fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+	isp_video_pix_to_mbus(&handle->format.fmt.pix, &fmt);
+	isp_video_mbus_to_pix(video, &fmt, &handle->format.fmt.pix);
 	handle->timeperframe.denominator = 1;
 
 	handle->video = video;
-- 
2.51.0


