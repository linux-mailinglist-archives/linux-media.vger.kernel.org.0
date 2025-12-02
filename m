Return-Path: <linux-media+bounces-48049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FAAC9A905
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1B33A5FF4
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B99A302745;
	Tue,  2 Dec 2025 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iluSwDC0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF3A302772
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661963; cv=none; b=pWEkLGKzMlvCvu9xdVAHqWBgcKoTY/07m147eiQShXAoY01sOknl0FbpgcDpYnCSPQHx3zZQY4EeI/ttaBz8g1q1D2ijfgvdvsfrpvR94uKPIHMbLqcBYijSt55Qk/uyCgZLjOSKMc0B63poTXi5mqTAuNLrz0/kGYUaajMleLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661963; c=relaxed/simple;
	bh=l+jU2o4Cp/fMly8PA41JYwzAIBTQAddqleVXLYuHVwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhQGQHd9RzTUKBiu0zHXeLjPXbNE+idf9ALnIjvSlEWK9fBCMk42TO/YItyVdVZ5C8dWslt1rQC3qJqc91EyiYsihW5iKdTSJOTCe/OniWj1P84D2WNjicv43JsKjf68teioEV5J5GMIe6QnZqZe+QpYhlLsxT1A/lIoGodmMtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iluSwDC0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDECC4CEF1;
	Tue,  2 Dec 2025 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661963;
	bh=l+jU2o4Cp/fMly8PA41JYwzAIBTQAddqleVXLYuHVwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iluSwDC0bKAkB7yYVLJ3IGTOh9OCyT9iUy5cDYJ0lkoDiucam7KblRLIyMC3X3ppv
	 wgrtQFsfG+m6vkQzR1taOiPM4TOa2fhkBPTnOqvGL2jXGYQv8WfZ5B4uwqvdcKND0Z
	 ViRlbwBRcGOCqGtqUOQG6O+Gx5Oc5nReDwgK6vWg9738qtUXCi4kc6lfeDh158u5m+
	 MXTOFABVV0+MppV10NhIohu4HqsOCsBFWUAKr/ATd0VRaSdXKRW8tJb7jjuras8+vT
	 Sf3HsCXebLj5Btt5qGseZVKwfNyg0dzWD3eBwrFuRxlalYGfnDDaZ68bHgGhi/6hjI
	 svzz1OGhiTrtA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 06/12] media: omap3isp: set initial format
Date: Tue,  2 Dec 2025 08:51:14 +0100
Message-ID: <ba1f29fa4919cee573074cc86813614982588776.1764661880.git.hverkuil+cisco@kernel.org>
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

Initialize the v4l2_format to a default. Empty formats are
not allowed in V4L2, so this fixes v4l2-compliance issues:

	fail: v4l2-test-formats.cpp(514): !pix.width || !pix.height
test VIDIOC_G_FMT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 5ce8736ca5bd..c52312b39598 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1319,6 +1319,7 @@ static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
 static int isp_video_open(struct file *file)
 {
 	struct isp_video *video = video_drvdata(file);
+	struct v4l2_mbus_framefmt fmt;
 	struct isp_video_fh *handle;
 	struct vb2_queue *queue;
 	int ret = 0;
@@ -1361,6 +1362,13 @@ static int isp_video_open(struct file *file)
 
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


