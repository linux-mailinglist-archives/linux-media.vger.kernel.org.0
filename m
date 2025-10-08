Return-Path: <linux-media+bounces-43986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8DABC6320
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E983C70E8
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121442C0F62;
	Wed,  8 Oct 2025 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iOmVymEN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B992C0F6D
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945874; cv=none; b=D/RiZts8b7VIkXMhZg3i4J9gMkLvOhpWvFNPO+eF80abhVQYHVgmNxAEFXFjFYDhr0DFUdfn+RZGi+chQZUo43Vs5cNAQ5cFdk8WJLCSbpDyq35zWKecgz1PQ8qu2DFHmB2Am83WPx/r9U7dC/7u8HVQClVgZFiR86GXzbgsuwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945874; c=relaxed/simple;
	bh=L+OE9xX5UsoYqtP9gRN5qvj/8uPCmCqnIwJpY8ICwY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llA0q30/sWu+l/Q0byTPGR9uarwAjl7NxyG01G5dKVwwNmltexZmjL0ECpC33szDgJQp7vmq+MJFgGpdTJ3Cnp+9Dzx9bjXBEWz/q+vqTgo3D9fSpBwKPRNFFXdAlHXKDe5pVSJlAEMTIKZaCJERr2cj/yYMfbptTFmon1glflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iOmVymEN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4439DEFE;
	Wed,  8 Oct 2025 19:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945774;
	bh=L+OE9xX5UsoYqtP9gRN5qvj/8uPCmCqnIwJpY8ICwY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOmVymENPVAGFvsmIOfArS+9HrAnIlgGaoFOggTzCROTH08URHY0u4hiqcPonq4kk
	 oH5QA2MSYdSn3CwFiJDQ+/4WGUK3iTLTgDSz1MTCqU4ECsyIukPK7W6E7GpysAlnUE
	 r0L6dNkw5FZlO5iNTEFGzFgYQw7d3GcIlsk9ayJo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 05/25] media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:32 +0300
Message-ID: <20251008175052.19925-6-laurent.pinchart@ideasonboard.com>
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

The v4l2_m2m_get_vq() function never returns NULL. The check may have
been intended to catch invalid format types, but that's not needed as
the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
the format type, so the type can't be incorrect. Drop the unneeded
return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index e6e3f5ec24f6..5451b01e0815 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -785,8 +785,6 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
@@ -937,8 +935,6 @@ static int coda_s_fmt_vid_out(struct file *file, void *priv,
 	ctx->codec = codec;
 
 	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
-	if (!dst_vq)
-		return -EINVAL;
 
 	/*
 	 * Setting the capture queue format is not possible while the capture
-- 
Regards,

Laurent Pinchart


