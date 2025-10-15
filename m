Return-Path: <linux-media+bounces-44528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0599BDD3A5
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 674B74FAA6D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8E5314B8F;
	Wed, 15 Oct 2025 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wrl/XAkw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FBF314D2D
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514861; cv=none; b=Yp3MpXVKk7qD6a14nCd7ob+ocJVp2nikOTFsoqiErGPOYHIjJAO2K+739xYl+boffIaS9OMmdaihsq4z6C1uJUCpzVrT2PvdZ1d2dPMCeaFUNMeFepM+gFwIePxdhf5G2XL7o0AumF30iKYjLlwiziap8XzG8ECPstJE0fAL8FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514861; c=relaxed/simple;
	bh=1unf0fman8oPZTdterXGLhUOCSwuHbSkeB3YvkQSSXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tw4gyULcrHjS9dIHrHxeU1sE08uCcrCe4ntRTv8I/0CIR6Sf1czvgS2SDZmzsumpt7/ibtBUVDhzvEVTOlJNhRrVuYN0oJDJn4P0B0Ef2n+/bUsyNUi4ZZ9lQePoaGXZJEjnsH+Tz0w8nBWD8hfkFRqk+Z7GrzNEOauIvpEN1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wrl/XAkw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D78F919AD;
	Wed, 15 Oct 2025 09:52:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514758;
	bh=1unf0fman8oPZTdterXGLhUOCSwuHbSkeB3YvkQSSXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wrl/XAkwoObiIm2FJCzOXhuauSkT5/fgIpxH1O6vj8FJgKPOnvSAQM+pt5+OQsZwa
	 QeogUhwbFTzNl54LpaaFqnUVZwh/VbSd15VMBSmpdO2p/Saw3EStWkRueMYnAs7qTF
	 QDRV9QA1+oxtQk1q2YEJZt9dJSqfsK5SqZ2Q413k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 08/25] media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:31 +0300
Message-ID: <20251015075353.22625-9-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 6268d651bdcf..d78b83f06247 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -302,17 +302,12 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
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


