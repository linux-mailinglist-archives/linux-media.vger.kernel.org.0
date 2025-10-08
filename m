Return-Path: <linux-media+bounces-43998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2ABC6329
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93AD118969AC
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A9F2C11F7;
	Wed,  8 Oct 2025 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gGw7zvFw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430952C11F2;
	Wed,  8 Oct 2025 17:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945892; cv=none; b=g7UzN+BQ5h5Rifbjb5D5PpFlDfxOexlhu2iF1cDoL7wg9bYqMVpaKHidswFNYSntzR5yhmTLTslKqjhjvQ+Of4NKpEKzQty6H9fchqbEqFlydb2uVRlBmUr0fOLwP1lORcN7CF8AehfW5wh9OftCQ3OBX/1Se9AIOK1F00eWCUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945892; c=relaxed/simple;
	bh=0JlpTQM5TcAI4Txy23yC/64PyspSVizZIgqfC+m7fAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMoZxeRtklprS3ZGw5VgiC9/KvIEUT+GUN+Ze4OXTmVIUoDhEApEHS6R2PT4E8i0dFvKne7kIOBluDrXxejxAWqQqWJurY938jpd5JhiN4kbXglJbwXx3ObZJEKT60mPKVZRU0EpgUk2pPQnZW2OTbD/66hD0SAxneD6QzgmNlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gGw7zvFw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65405EFE;
	Wed,  8 Oct 2025 19:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945794;
	bh=0JlpTQM5TcAI4Txy23yC/64PyspSVizZIgqfC+m7fAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gGw7zvFwa4lWftYeTOhyr4RgPD8zvhvf7ZLE0WuBqlOqV2LgEABvg6ZyGGdi5hgBC
	 uP6UkD3Nk0l3PiVhHW2W+ubnO1IgKoG1pHM3afOndHQqcn8bjVnTo4jjFbKaTi2bG1
	 ughIbKrNS4B6Q/JnM/LcxXscHkuD7rgs+6xDvg1M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 17/25] media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:44 +0300
Message-ID: <20251008175052.19925-18-laurent.pinchart@ideasonboard.com>
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

The v4l2_m2m_get_vq() function never returns NULL. The check was
probably intended to catch invalid format types, but that's not needed
as the V4L2 core picks the appropriate VIDIOC_G_FMT ioctl handler based
on the format type, so the type can't be incorrect. Drop the unneeded
return value check and, as the function has no side effect, the function
call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar_fdp1.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index 5d453a7a8988..e260d31e3a9f 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -1409,9 +1409,6 @@ static int fdp1_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct fdp1_q_data *q_data;
 	struct fdp1_ctx *ctx = fh_to_ctx(priv);
 
-	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	f->fmt.pix_mp = q_data->format;
 
-- 
Regards,

Laurent Pinchart


