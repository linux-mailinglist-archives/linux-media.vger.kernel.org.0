Return-Path: <linux-media+bounces-44523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59452BDD390
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0595D35022B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4500A314B9E;
	Wed, 15 Oct 2025 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IiRPjPZi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02350314B7C
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514852; cv=none; b=T6sLTzirbXOpfZO9G2fZC+giXbEmUlPrBt6iisQDqZHFu7edyHZinWba5zlA5OTBqx3yBMN/Tck4sLNNZ06kFk27umV0n569uQtO4Idtx8q/qatkBha2KDfso7AoYzh3uHquaAfwChAoLPJ3tSu/ssOdZDDw8ZSN+Ap9L2cUFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514852; c=relaxed/simple;
	bh=Uxgf1oxP9kkN4+H9BmWzXKT3e8oWnSdrgQRWaAUajUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ei9Azy9eFhaqdY/2uqvIORBqBc+qVLAyJJmLsrzz6v4Wt/8nmICGSkn0f9bYG5uBARIkGY8nqHMCG7+rR3yEg0gOTBuuP6K5w6aylKTNqNlw3wQOD+E9dvDiCKE2OblDiqJy/AEQ5MztZWzldrc+1ZyZhKvjORX6FcuNAQcNRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IiRPjPZi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5ADAB190D;
	Wed, 15 Oct 2025 09:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514748;
	bh=Uxgf1oxP9kkN4+H9BmWzXKT3e8oWnSdrgQRWaAUajUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IiRPjPZiLYusQGUslHhwVs6tUuPrcEjK1qqsG1VQeEFunGEJC5YWvwOu0YQFgOygg
	 k2cdkMolsljfitcQAuNJ+Yxsr4UKYgE1YGdenBeR0gcEl5r9nzKZQhttDLXEfsKhFD
	 DkNingh/dABrDaHjSlyo/zYM+ByoMqa9MKHlsjJg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 03/25] media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:26 +0300
Message-ID: <20251015075353.22625-4-laurent.pinchart@ideasonboard.com>
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

The v4l2_m2m_get_vq() function never returns NULL. The check was
probably intended to catch invalid format types, but that's not needed
as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
on the format type, so the type can't be incorrect. Drop the unneeded
return value check and, as the return value is not used for other
purposes and the function has no side effect, the function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 5744853a4003..c51c6f4e41dc 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -632,13 +632,8 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = file_to_ge2d_ctx(file);
-	struct vb2_queue *vq;
 	struct ge2d_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	frm = get_frame(ctx, f->type);
 
 	f->fmt.pix = frm->pix_fmt;
-- 
Regards,

Laurent Pinchart


