Return-Path: <linux-media+bounces-44525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1FBDD396
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340823B7160
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974DA314D17;
	Wed, 15 Oct 2025 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qVPDsfcs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C32BDC23
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514856; cv=none; b=gAOOTanJPfe5IJpGX3oyySAxfU/d8TAoNkA7+YjIIqSxHdOqAXYz15Hrw2P5TVf/gff2GZYNCgOHbDR3n9u4MHnb1aH5BYEm0nUlSUMc0suf7LnvPpPpE/mwk3XoWO+0YQWbd1V2vYj6qzCxw2JvmJ4u4Qy4qoywY6+I3v3/Hs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514856; c=relaxed/simple;
	bh=/u7xUAVULdhha8dRBBpg5yxvcAOVtB3rl4tJcnCSyjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g54EjiNwRO7vsH+EML93Dgyh6ZrnXmHgyZvhmAE1KwYcvOuj5+TbLpq05hHF+C5vWtjZHYyYV56N4QB8Bp4M1GU28JFNRO+cGxST51/rZhrdN6JV6gChEUCRtFPshFA11WoHZEOJJQ0v5TtEJjMzTEx1wNf1jP0caT9cyVWBl/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qVPDsfcs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0F4F9E92;
	Wed, 15 Oct 2025 09:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514752;
	bh=/u7xUAVULdhha8dRBBpg5yxvcAOVtB3rl4tJcnCSyjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qVPDsfcs88C5pUWEHFqIyWZn2F0HQLjLJh+u9kUm88wL0xjitPLKmeSno8vuiwbGv
	 ZoACEfO+NhbbnSnduzHtwvp1H46pfIM9fPm177CP1a+akyNkRPQFgYUUciZZCHzEB+
	 lY5Tvnk0J3qVTBzhtuXnk7hVZCQ4C9T0ENi1AX54=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 05/25] media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:28 +0300
Message-ID: <20251015075353.22625-6-laurent.pinchart@ideasonboard.com>
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

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 9a57b042d9fd..33f712ff8556 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -790,8 +790,6 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
@@ -942,8 +940,6 @@ static int coda_s_fmt_vid_out(struct file *file, void *priv,
 	ctx->codec = codec;
 
 	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
-	if (!dst_vq)
-		return -EINVAL;
 
 	/*
 	 * Setting the capture queue format is not possible while the capture
-- 
Regards,

Laurent Pinchart


