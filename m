Return-Path: <linux-media+bounces-43988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76629BC6305
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B15A4E6442
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C162C0292;
	Wed,  8 Oct 2025 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mTHWxS/G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FD19755B
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945877; cv=none; b=HWX9BLvk4Ir5MqSeW+nR618HKJyNyEkqrRDY72ObsQEOCHAz9mcJDfTJiSlIQCbGzqM+YLbK5hOzNZgC+EymTz7R+h2UwLoX1x5MpW4Vxzyesv1eFKf2NNDhEtxZo6EjcdQQ1COgOPR4Egc+3HdryZixXIAZSNY4B0Zd0VocgmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945877; c=relaxed/simple;
	bh=LFOu3U0XYF2bYSXMlFPwILkto/Qgj/ryiKliNPo9Zhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/6V999qVNtDN1Z2RY5j/2dp+q3AU3tq3rl8IhhjD32FF/5joW6E/kn+6R9pqgGJ1dBlv0I/eA1lu5GC94fAp9i+5hUHoE0ffiK1uDOFrPMne/6YGGvsx3V9XFF47k6z7TLYrahcZhC0O3bbd3wNOhxilJQilPqOQAZ2ojWDaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mTHWxS/G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8C76B1E3A;
	Wed,  8 Oct 2025 19:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945777;
	bh=LFOu3U0XYF2bYSXMlFPwILkto/Qgj/ryiKliNPo9Zhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mTHWxS/Ges012O6SymYC8gUh1T8NPZ8OA8QDW6wK24z/W8CP39oEQhcOCZxz1XkkI
	 4fbLcRWb4pB5PnPKNJ+2n/XvHsb4X8QqNTX6xzITWdFzasAv64JulTxcSzWKjH3vmk
	 vst4H7CHuVHs+XZSsJb+jBEHPpqdCCPYvX0/puG8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 07/25] media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:34 +0300
Message-ID: <20251008175052.19925-8-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/m2m-deinterlace.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 5188f3189096..009e866859f9 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -480,13 +480,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 
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
@@ -581,8 +576,6 @@ static int vidioc_s_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


