Return-Path: <linux-media+bounces-44526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD2BDD399
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 892424F9174
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44A6314B72;
	Wed, 15 Oct 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DK+bNb7K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9E314A7E
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514858; cv=none; b=ouY9lSt6Lz340MRxR6731fGQ6T7WFSdCx7HiuqWWM+NENwqW4+nOeFN9b1e+Ufp+2RJzH/x4hEL9pqWIj5cX/x4AnB7H6KnW0GTDipGGf1hzjo/E6CIaQVkc63OX+PL6UPYOcssiszNY3mvTqci5X2jbMJNZLpwQjDYxnL+tBp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514858; c=relaxed/simple;
	bh=hssVcaRGMmdu4re9u7TE7giniI23fYUhySswWFWOXbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FnO6RwE943e9TEzVf5Jyo5pN84FZgo6g1QnLzFx7WRSd9pnoHhzutsnXtfI9lQA29M47rGgKN1NzKMb6NgOLs57MRHT2RCDG292IEEquEEJ79qA25aak/1vI3M5nyL7k+uju8q/k43lRxU4DuenuSbdYfRyer5dhM5ccyMiyzYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DK+bNb7K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 09FFBEB7;
	Wed, 15 Oct 2025 09:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514754;
	bh=hssVcaRGMmdu4re9u7TE7giniI23fYUhySswWFWOXbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DK+bNb7KW5lVIlVeTsetrLwpSrbO2M1OE9RFn7mOwg37j5n9eMYH9vTAFy6vLr9D9
	 K17fbo1jL4T34paI3lcfotqbKJinNlPiHz4uOmxe6CSkkWMR5GsLOFi63ED5GnSJuo
	 /uU/z3ynna0bbRQBvry9t3e3/B4d2reJyiatNEY4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [PATCH v2 06/25] media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:29 +0300
Message-ID: <20251015075353.22625-7-laurent.pinchart@ideasonboard.com>
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

In e5010_s_fmt(), the check may have been intended to catch invalid
format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In e5010_s_selection(), the function performs an explicit type check, so
the NULL check couldn't have been intended as a type check.

Drop the unneeded return value check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imagination/e5010-jpeg-enc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index c4e0097cb8b7..1b5c8b1d6a31 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -396,8 +396,6 @@ static int e5010_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct e5010_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&ctx->e5010->v4l2_dev, "queue busy\n");
@@ -496,8 +494,6 @@ static int e5010_s_selection(struct file *file, void *fh, struct v4l2_selection
 	struct v4l2_rect base_rect;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, s->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_streaming(vq))
 		return -EBUSY;
-- 
Regards,

Laurent Pinchart


