Return-Path: <linux-media+bounces-44527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57FBDD39F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 85A394FBCB9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA7D314D28;
	Wed, 15 Oct 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tnqFQuDP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32512BDC23
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514859; cv=none; b=OqBQ55zrRi21y8pn6lxWTc5pUKJPZv0jvFo0lkUA7i/Wyb+tbUW+9n8Y0TgEBRNWcIaJ90JdJIkNS5mRPjnDVHjK2WoRLl2EijCtyrWQL5CQbI4llzjm6CSc+Y615t7D1FIXfQ3eDY/73Oykr81crSHpfeunBSZM8a7dH0c9UyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514859; c=relaxed/simple;
	bh=Cw1UkQnrwRK9WLchntodGwO1LUJsF1vCgcVz3nJM4rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kr4MvyynYqyTceP66G5XNto/O7Tv8rkRMb8HADpm3wj6nJiK5Ncy4WkG7hGIQoXnN+Q4xUheJo12b2IbTu7YXKzXXWH6p8l53Te7NZahlgmV/nGDRQnHWN7JRQN+BangMDGHrvugfHSSTgzJ8zapSH568CwOCQ8KVZS+XzbZBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tnqFQuDP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 20CDF190D;
	Wed, 15 Oct 2025 09:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514756;
	bh=Cw1UkQnrwRK9WLchntodGwO1LUJsF1vCgcVz3nJM4rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tnqFQuDPiGu6tv1RDxEvjYUHinOMZ7i67dB440mmCGnMraAN7/flOQzzTRMd6svVd
	 l0bHti/9AD3gOZ4eEeDWThoQg/C2YYfhrOHuYzC6aPQxhMEonEvfnZoy3fjwShgo1m
	 zNRnhK0c4oNfYjkRHYjJQNknuHcQxmDeWwKKfkTM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH v2 07/25] media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:30 +0300
Message-ID: <20251015075353.22625-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/m2m-deinterlace.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index e07e57d4206b..af098874ead5 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -485,13 +485,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct deinterlace_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(f->type);
 
 	f->fmt.pix.width	= q_data->width;
@@ -586,8 +581,6 @@ static int vidioc_s_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


