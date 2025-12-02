Return-Path: <linux-media+bounces-48036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23334C9A8C9
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 173DC4E2D6A
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7944F303C8F;
	Tue,  2 Dec 2025 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cB4ADof5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E91D514E
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661748; cv=none; b=MuKURRtpnYCj59S9gOsIbDmQFUfE8+Uko8TF1t44WE9/qaP95kOCGhKEAYMo1umePFco4xhsqcC0weQrFKKp3y1iRim9Ewvl4qXIUFZIqgVSqJR5Cfk1YebD1lbKq/yI9LctGGFe16WZdN399GjflZkhN+3IWmmY3RshZreF3vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661748; c=relaxed/simple;
	bh=l+jU2o4Cp/fMly8PA41JYwzAIBTQAddqleVXLYuHVwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfh9y3sQkLZeNc0jEsmUb0cpj8gI/kb2LgdulYrYTzXbEz+h1/uUnvZj2aPpVIK+W4Xyz9N12G7PjbpXZh5SJsKfzDhEjJ9QaN5JZvMhu/fqrdxAdb66BkPjw3HAQ6JpdL8xSNESEH03sZV8N3LGYeS5GRIBXlWe/yEJ07t97e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cB4ADof5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF96C116B1;
	Tue,  2 Dec 2025 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661748;
	bh=l+jU2o4Cp/fMly8PA41JYwzAIBTQAddqleVXLYuHVwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cB4ADof5yycisSAYAJT5LPeak7y5K+SnWt96+SZWKeP6Xf0r9VTPngl4+2z/QtmUN
	 BRJ/4X/eMJwQ+Oyc/pEj8fpwx0+6YlwQEGo19BFZikHzAx3NwcpquvKPGfpuATd3kR
	 rfTA8M4IaiDTaUrqB/lBgjdbRXTu7L/W0RXxoHKClPeO8AjNG+eO0Ss4WsDptzDj8h
	 5YWN8+FwSIvijmL/uSn3uXkKCKQd1cOOqbSGdpnoz1uAUCIz9j2G5KyuPNZTS3e64X
	 ahtmk2H0kMyB1mH0BDLALSxgGXxkSazdv3wxDnFgC9TDj+zaN0IikvbImNd1ggpn4Q
	 wfqEmnLkyBXDA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 05/11] media: omap3isp: set initial format
Date: Tue,  2 Dec 2025 08:48:06 +0100
Message-ID: <2a53dd918a751bebf40f6a704f5b9ca718710852.1764661692.git.hverkuil+cisco@kernel.org>
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


