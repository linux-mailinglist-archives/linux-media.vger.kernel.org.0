Return-Path: <linux-media+bounces-44000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FCBC632F
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 355444E9C4D
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC722BF002;
	Wed,  8 Oct 2025 17:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="haI7BWak"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554402C031E
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945895; cv=none; b=hfqp9alVGAdkGELUMvhA1tk5mFB/0h9iEkY+C6adqgylPMyFUkhbA6TTMlhG6QGVKYhJDcPiEDJXkA48RZvQj3wNepeNavr3/XYgQiNkZJdCh0zx9SNMfySZ4HHFsjlL6j6vJUdFraQA5Wd1Wsgkik7t3FPc2WGhNxlV07b/PRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945895; c=relaxed/simple;
	bh=tQsikKNPuxlTDZUFn8qypyiY9ILHvGdiLuivDEV8nc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZ7vMImJSZCQp1qlQ31vuwqN3Ui2e04SktYXSH/2ghDwXLUVSyWKInFREAYfmQghDpdjtxqIMdIvKxnJSsXcvzsI66JFgyeGAf8vhPZ9GNvap1Xws0WZ3BpT/xMSfUpEirocyLUpk4q/u2ITJ4v3pyhUjXX8ydwADLZUxSKT6Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=haI7BWak; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CB9DF1E45;
	Wed,  8 Oct 2025 19:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945798;
	bh=tQsikKNPuxlTDZUFn8qypyiY9ILHvGdiLuivDEV8nc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=haI7BWakdjxisAizqTmJ6ZgCVUB7y0Xf3adWLpzOlwjkcK5sny4kE84eJzySIsn3d
	 zmHOWRRBsOtsaGfjlqkLjc4WCQs3eSlPkAnw+4SbhO4epjjGvkOhqGyqo3u+95X8jR
	 BKk+l7yiHvttw59I5IplQshWeHE63iJBfg9aet+Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 19/25] media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:46 +0300
Message-ID: <20251008175052.19925-20-laurent.pinchart@ideasonboard.com>
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
return value check and, as the return value is not used for other
purposes and the function has no side effect, the function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rga/rga.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 3dccab5fa4a1..48b88da59da0 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -465,12 +465,8 @@ static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
 	struct rga_ctx *ctx = prv;
-	struct vb2_queue *vq;
 	struct rga_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 	frm = rga_get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-- 
Regards,

Laurent Pinchart


