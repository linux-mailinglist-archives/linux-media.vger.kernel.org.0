Return-Path: <linux-media+bounces-44004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6403ABC633B
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1052934EE38
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D162C0292;
	Wed,  8 Oct 2025 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oi+Xfg/l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F99281358
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945902; cv=none; b=IXNYlmwQ7tMkxApJmrRQOmckWM4kkx3v8WjZY2jVFasovh4E/l5MfrO9OTnk1w+sYCHqwL4BBKLRZi0pZ5MP+F0361+R28e5AsPt23MtvfTMkhQo3YTmmXDLtc27lkr8OT+qJJ8eUPJ1n9DF128Fxqnid9GvkhEXgnHPhs/ZsLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945902; c=relaxed/simple;
	bh=ULi8LrmQWYWEBdWaKMOjJ6tCTBPFvqb9O7DhPt3MkY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsHfrECUj6Ab0zCHxAZwqpfdysKfv3yPqahQlCUynDiml1Sa4A5UGgfQc/PGLQ62gxDKjxRRVnsr7TQVjfooD9njA2dWPCkqiuIpxfJWHzUsh0LChIIKmg6AHnd72GNgbArSZZ+JerRr0afRhxraiw9muerlvtIYBuQTy4/P9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oi+Xfg/l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E6602EFE;
	Wed,  8 Oct 2025 19:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945805;
	bh=ULi8LrmQWYWEBdWaKMOjJ6tCTBPFvqb9O7DhPt3MkY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oi+Xfg/lhvnGV71qEf68NLMHL/QnM5iBMHAKluaoRe4yhm2StopukJNsiyfOqHpwK
	 tAyn/QW9O28rDn54qqeoILgvy5qchHWrKrLPchvwFE5vKvlP7i3t6fPgL72BhyEaB7
	 QX6vd96TJ9d7qpbt3grEJ2+qLTId9F75Bj14sBxk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benoit Parrot <bparrot@ti.com>
Subject: [PATCH 23/25] media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:50 +0300
Message-ID: <20251008175052.19925-24-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/ti/vpe/vpe.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 636d76ecebcd..70cb430b099c 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -1563,13 +1563,8 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct vpe_ctx *ctx = file->private_data;
-	struct vb2_queue *vq;
 	struct vpe_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
 		return -EINVAL;
@@ -1736,8 +1731,6 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		vpe_err(ctx->dev, "queue busy\n");
-- 
Regards,

Laurent Pinchart


