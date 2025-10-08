Return-Path: <linux-media+bounces-44006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7ABC633F
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4E0834E82A
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B362C0291;
	Wed,  8 Oct 2025 17:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G0rC7mFV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9AE2C0F7D
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945905; cv=none; b=ODrd+l2egAZaLv5zOMibqvmwJTZPQcVngst0h5fGDJF3rx0e/D8YsRnV3UMYLuEGG0MXvXDDEJHSAfVwcP6aRydraI1N+NmlD4HzqRkXomdZI1HvKyjOw3XNYF5AuQTWlRyuudgkl4k+UU47+WMxSYeWNhRdVhb555U7ro5R+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945905; c=relaxed/simple;
	bh=8dk5t5f2KFImtZAb0vIXoHfzNOkQHg/HefPLj0XBNKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0E5rsgoiQanEpn18rAWSj/2MN0meN/qAjYCxpUtOwV0sdU7YtRHqtV6s4dIJN2EwWI1jeRcSuvxBrNwbYRcLf/9YIQ9UnDR6367juPe2ZMR2rHfu2D8meEm7Au3aTdvbvq6jDWs/UFDSwgK2LzIAbObMfhaxoRhVOVjOjmuO+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G0rC7mFV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 57911191B;
	Wed,  8 Oct 2025 19:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945808;
	bh=8dk5t5f2KFImtZAb0vIXoHfzNOkQHg/HefPLj0XBNKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0rC7mFV71OYq1+MEbWP9noVXYAGfCnR8uOt/rpEGYEPkbH0Lvqb3HrSLDB0N9EbZ
	 hxslFX9AgUhvZTUSZUTa/xCfMHkcLA2NVT8Gpfr61EtEvI/td5fKvI4txLC8GUG2Sx
	 7tQMUl+Uu7cTLJNk2g8+V3BGKUT8EuaoFkRYyneQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 25/25] media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:52 +0300
Message-ID: <20251008175052.19925-26-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL.

In the set format handler, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handler, the return value is not used for any purpose
other than the NULL check, which was therefore probably intended to
catch invalid format types. That's not needed for the same reason as in
the set format handler.

Drop the unneeded return value checks and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/test-drivers/vim2m.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 1d1a9e768505..dc82830a35a5 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -729,14 +729,9 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct vim2m_q_data *q_data;
 	int ret;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
 		return -EINVAL;
@@ -757,14 +752,9 @@ static int vidioc_g_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 
 static int vidioc_g_fmt_mplane(struct vim2m_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct vim2m_q_data *q_data;
 	int ret;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
 		return -EINVAL;
@@ -976,8 +966,6 @@ static int vidioc_s_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 	u32 height = (is_mplane) ? f->fmt.pix_mp.height : f->fmt.pix.height;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


