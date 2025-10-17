Return-Path: <linux-media+bounces-44904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF68BE8F76
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FEED1AA6A77
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB6F3570DA;
	Fri, 17 Oct 2025 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdyhgDTG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D112F6906
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708333; cv=none; b=WqWHszUNZm+jQiGizpsVpv6YkbXMkigolYZTab5kRXHjoxkZrKHzIhXfsthief0FAL+rYfleKx5CtGCO9oWUk/TV+tBh3zQyQU5eQhAEwm7J6pm7/tDwfeEp0jlC5l3F0hNHxNMfnlv+oIwo13f56UuY9esYvmTql3HJ5eJ6kXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708333; c=relaxed/simple;
	bh=jEVQwdD86satQ8EvWTnD4FbUSKa+Mar3+KHC1FwT+FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqtNv/5jfNgJ3mduX0LJfMnK3S7QKYyNN2+aia45C4jMQ17g1ECs37dKBDSBcQ9DeHUkieNYeatEtteRLFQbU/hqsw/wnc92XA4zOeKblCRTziGll3m+aQcZ1faFtuM2BibvhzQ1hWhnjiDCzh8zeaf58ZyoMJT87ZZcjRhXUnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdyhgDTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34B0C4CEFE;
	Fri, 17 Oct 2025 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708333;
	bh=jEVQwdD86satQ8EvWTnD4FbUSKa+Mar3+KHC1FwT+FY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jdyhgDTG1n3jxFfJP6ZPmZB6RStjY1RwGN2Mg8jf6p+Fg83mQOi9NkWfciCMUa6qa
	 YRzL2TvUvC5bXC8IdVjjwHXM523rIf3hPtr5+HCtANI63uIb0WYsRzu+1EFZrNYw34
	 IFHMTOOQuIQayB5vgLHNSbJ3g8+nJFrvN2PyeK4bBgkg0gNgk9Bzvx17ZLiWwUs4pN
	 VX9jjAy/07QV96xCWIrGL8vwt+Fq2rdJbbHlcdEF2JuC8CAXO3JzuCjFq0lcd58MlD
	 sCIKXCrsmfIqqc52wE/mUOtWjwIldThrk0cRTJVOMK75OWTr/03QOsVO1TAaDfHx3Q
	 PAU2YnY7Vf0jg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 13/14] DO NOT MERGE: media: omap3isp: change default resolution to 864x648
Date: Fri, 17 Oct 2025 15:26:50 +0200
Message-ID: <0803678704c42ad8c41cdfc0fd48f62c508d8d92.1760707611.git.hverkuil+cisco@kernel.org>
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

Running v4l2-compliance with the Leopard Imaging li5m03 requires
that the default resolution matches that of the camera. Change
it accordingly.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispvideo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 5603586271f5..6ea79e4f39bc 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1409,8 +1409,8 @@ static int isp_video_open(struct file *file)
 
 	memset(&handle->format, 0, sizeof(handle->format));
 	handle->format.type = video->type;
-	handle->format.fmt.pix.width = 720;
-	handle->format.fmt.pix.height = 480;
+	handle->format.fmt.pix.width = 864;
+	handle->format.fmt.pix.height = 648;
 	handle->format.fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
 	handle->format.fmt.pix.field = V4L2_FIELD_NONE;
 	handle->format.fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
-- 
2.51.0


