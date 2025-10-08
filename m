Return-Path: <linux-media+bounces-43989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D205BC6308
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CA614E8AF1
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D13F19755B;
	Wed,  8 Oct 2025 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HvqhqYgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F74C2C028D
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945877; cv=none; b=ALRws0fLyV8luo5YiXgXvKL/SM2Hxu0dQvH/j24RJTvbQ9THjSgvgtOpzGxnpqcfdfZyC72hkwRzNHYnV63KRtV2O5vt0SOFXIYo727F/oDiwETVoe1hz2cGeG2xpwHR96ozddF+4HP9jMTE7d1WFJHzYvWJ+d/1wOT+dGqgqEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945877; c=relaxed/simple;
	bh=8joE5kxUTBJ7AhnJIG9ZNJrrTBizjpxEx99YJAXdwTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoDGqnrHrDPULKOElIs+LT26tu9DdLF9iMy9I4dSTzu6NkpUjStoKNJXZt1XYm8QFK8VUKPzvb2u1apYs6koCfFwNodsWjTLsHggca2zH2pOnqwpH9jgi5Pfe09GluQPxhEuWMIplLdLAgFwmIulszAxvw5d6ckNh8ufiKfOSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HvqhqYgZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2DD2E191B;
	Wed,  8 Oct 2025 19:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945779;
	bh=8joE5kxUTBJ7AhnJIG9ZNJrrTBizjpxEx99YJAXdwTg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HvqhqYgZoJKN62QiYt23DkTr8Q58Y7XUybNFcTGgBz8Ngo55KnMSX79N+ozbz5MkF
	 F4dV7Ft/0wdvcQg9G6dwkzheraO8mH7U42yxRrXidCpT83IjuNhvPhYrguLVzWxQlX
	 WcYjHLgLrcJqWdQSpMs5WCNPcZ1KtiwxMuPmjzNM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 08/25] media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:35 +0300
Message-ID: <20251008175052.19925-9-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7eb12449b63a..35c70ec3ad2c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -302,17 +302,12 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int i;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = mtk_jpeg_get_q_data(ctx, f->type);
 
 	pix_mp->width = q_data->pix_mp.width;
@@ -416,8 +411,6 @@ static int mtk_jpeg_s_fmt_mplane(struct mtk_jpeg_ctx *ctx,
 	int i;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = mtk_jpeg_get_q_data(ctx, f->type);
 
-- 
Regards,

Laurent Pinchart


