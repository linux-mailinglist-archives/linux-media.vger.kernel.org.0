Return-Path: <linux-media+bounces-44895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F09BE8F59
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7FC188DF6A
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDC42F690B;
	Fri, 17 Oct 2025 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shizvwus"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE22F6901
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708317; cv=none; b=ib3MsVlgAU2mbya/KVF5hDi/mXIOoqeTppWcmZp9VQoq0rhjIchXXR8e511OUdWJSkp17vSshPLQ/BpgXJX56MzlJg4qFVSIWV4fQLRQJ9aFKs/asUQjg7N07kXz0d5cwUIjtxlQSdQ6ELNQDbqg2ZWYTR1UyLaUeLTxbUUWodI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708317; c=relaxed/simple;
	bh=nJra6+O7MgYQMoBGLVPRbS/U7tbIs8QzRTeclle44o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csGI88Q64e8jmFmCiytwYjF4mdiDfeYeuUo5LiqL4R3u/eb6kWqOiNmDGy+qerS7IMq4AGNU4/C3m/7iux/KZ8sT4h4xNQQ+EeIwdKXNq5ujYCvozjCeF/ocKJ5qEQHwseNatbHSwSRNHmz9oTq1v64/GQm7szYVOGjFFtcWIgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shizvwus; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6E0C4CEF9;
	Fri, 17 Oct 2025 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708317;
	bh=nJra6+O7MgYQMoBGLVPRbS/U7tbIs8QzRTeclle44o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=shizvwushPKNeL3E7yAfCxR/+XBB5b4CSEPOqqJse19BpYO2qThSG9mTHHng61bTO
	 5f3GBdgVVpE7j1LAsYmAojr9dubNekZamc7nCImGpEnbjOr8aN/x5trcs0sZK9nE9V
	 w8iP0wiF9HP9Qa1pZ4d2wTLbmWOB/t0DHqKZRJtCkVaCglZhhYjXfS7JgKzak+KrL/
	 G65q1nVqIopn8nAAPtRA1IXnUU+dYBWdP2suCxEIK4KG6++9O/fDPUcN9CSASR7TXm
	 aWJDrsjU4DRTp6bNMPWQhWU90vwGyz398VGiYEARycfDPipzwytBlJN1CebsHKqaUc
	 /1JDberBa2x+Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 04/14] media: omap3isp: implement enum_fmt_vid_cap/out
Date: Fri, 17 Oct 2025 15:26:41 +0200
Message-ID: <30813a3e81f2d8a6f42f637eba6fba2481b535cf.1760707611.git.hverkuil+cisco@kernel.org>
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

Add missing ioctls. This makes v4l2-compliance happier:

fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
	test VIDIOC_G_FMT: FAIL
fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
	test VIDIOC_TRY_FMT: FAIL
fail: v4l2-test-formats.cpp(516): pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
	test VIDIOC_S_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 864d38140b87..77beea00d507 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -652,6 +652,38 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	return 0;
 }
 
+static int
+isp_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct isp_video *video = video_drvdata(file);
+	unsigned int i, j;
+	unsigned int skip_last_fmts = 1;
+
+	if (f->type != video->type)
+		return -EINVAL;
+
+	/*
+	 * The last two formats have the same pixelformat as the two
+	 * formats before them, but they do have different mediabus
+	 * codes. So to avoid reporting duplicate pixelformats we skip
+	 * those two, provided f->mbus_code is 0.
+	 */
+	if (!f->mbus_code)
+		skip_last_fmts += 2;
+	for (i = 0, j = 0; i < ARRAY_SIZE(formats) - skip_last_fmts; i++) {
+		if (f->mbus_code && formats[i].code != f->mbus_code)
+			continue;
+
+		if (j == f->index) {
+			f->pixelformat = formats[i].pixelformat;
+			return 0;
+		}
+		j++;
+	}
+
+	return -EINVAL;
+}
+
 static int
 isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
@@ -1258,9 +1290,11 @@ isp_video_s_input(struct file *file, void *fh, unsigned int input)
 
 static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
 	.vidioc_querycap		= isp_video_querycap,
+	.vidioc_enum_fmt_vid_cap	= isp_video_enum_format,
 	.vidioc_g_fmt_vid_cap		= isp_video_get_format,
 	.vidioc_s_fmt_vid_cap		= isp_video_set_format,
 	.vidioc_try_fmt_vid_cap		= isp_video_try_format,
+	.vidioc_enum_fmt_vid_out	= isp_video_enum_format,
 	.vidioc_g_fmt_vid_out		= isp_video_get_format,
 	.vidioc_s_fmt_vid_out		= isp_video_set_format,
 	.vidioc_try_fmt_vid_out		= isp_video_try_format,
-- 
2.51.0


