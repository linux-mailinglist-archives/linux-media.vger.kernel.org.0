Return-Path: <linux-media+bounces-43990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DCBC6332
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27173400A5E
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F212C0298;
	Wed,  8 Oct 2025 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h8qd0YBG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9892BD029
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945880; cv=none; b=PvdzqVKl9bkbMjfUPEY+zDK6c+RxLKOlEMn5qwGjt7DjStt/heBvQJVV1DXW++AfL2pjmShVoCI+fhHXvaJ30WcfkeHwX7WYogU++JSYNslOGHpHdfB4i2KW8taokqXo1VOPUCILltBuicyZR9eP8I9iYAoEx9wRmZw/C+VtfkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945880; c=relaxed/simple;
	bh=nipkQtAKSBsTxoBb+ZWegtqeT0QKIfCRRHGUc9xHTzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqPjYp6YXpZfzy1RKUaq6jMB+P5aW3rdBnkVecKgva09ithJFVcAFzEdURTDS79IUWpzEpBjlIsRBrAr873jgGgzPZ6ETMjPoIBtrAGCgtNgMexbH+T17xYPupEmjXTsLN0EaAYpEyKmpiGgb6Wf9OCv77OhZrE0Rlk4cv1Sj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h8qd0YBG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C170519C4;
	Wed,  8 Oct 2025 19:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945783;
	bh=nipkQtAKSBsTxoBb+ZWegtqeT0QKIfCRRHGUc9xHTzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8qd0YBG+pSl4De2FJUrQWM0pKxxdf8dF2EEcKJjJLn3G6yyMNbYHhYBzWaUqc8iX
	 oj3anNz3Tu5hFbFfNnz7f9eRMA61Y7GLYl5TRW3U9Q5EhskT4KxGzAfxdV75wJOZv6
	 NSPD3lEcCxX8DocqwrdUwILDI0p/Irofxu3agoFI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH 10/25] media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:37 +0300
Message-ID: <20251008175052.19925-11-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/nxp/dw100/dw100.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index fed1788d0702..7a0ee44d9e1f 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -765,13 +765,8 @@ static int dw100_enum_framesizes(struct file *file, void *priv,
 static int dw100_g_fmt_vid(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct dw100_ctx *ctx = dw100_file2ctx(file);
-	struct vb2_queue *vq;
 	struct dw100_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = dw100_get_q_data(ctx, f->type);
 
 	f->fmt.pix_mp = q_data->pix_fmt;
@@ -833,8 +828,6 @@ static int dw100_s_fmt(struct dw100_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = dw100_get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


