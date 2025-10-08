Return-Path: <linux-media+bounces-43987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E75BC6326
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA043C756A
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768812C0269;
	Wed,  8 Oct 2025 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b+xVCsaq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6672719755B
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945874; cv=none; b=J+sb+5uec92ISueJRVWDcGClT19Vv8ObQ0gQ7aDqLxBfsoyaRuxpnzHx2Mo/ScoVc8AaAaCVrnkyC92LW93fIbTEosGvfD6Fl4Oyj+V8Zny/uVqT7EE6lgrngMkkf8/MCPzPFqcDQ4gT854eIGSy+qWPE0BTyLfimRcaBpxi2c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945874; c=relaxed/simple;
	bh=QCiU8JHUl9jPUSEJASW6f2XpA8/gRdl3sirJeW31TD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKvqro+N4bRFQCeQkYODxwv4feVBfghROvqXT2B3lHXcNgEKndGYh0vHnuLOLYHnkhRTZFbsl28NGzwSIVRjag7IPFNgbHLiScfIB7Nh6eJDv0OHZYKODe/ek7bZO0C+MWSuHL21/bMghLkFhCN6SoCu/38WXV+S7qXq/UB+CsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b+xVCsaq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D22F919C4;
	Wed,  8 Oct 2025 19:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945776;
	bh=QCiU8JHUl9jPUSEJASW6f2XpA8/gRdl3sirJeW31TD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b+xVCsaq5ad3d0mXKqYfc+x7VJyT3AsArlpqDsNpZPAW6jzN6hqhJqxfrdJQV+IIT
	 WAjBtub4IaGf5Sl9BhhYxkgPBxVkcHo9DXqruPEXexIlZCYUsIoc4ByHWnhzOUNMlq
	 aLr4+WCE6iXLw+NqP1nziDG42TDSqPjKXR5JE9Sk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [PATCH 06/25] media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:33 +0300
Message-ID: <20251008175052.19925-7-laurent.pinchart@ideasonboard.com>
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
index ae868d9f73e1..a7afcc300b55 100644
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


