Return-Path: <linux-media+bounces-44001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCC8BC634A
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C0A3403BD7
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B162C0F67;
	Wed,  8 Oct 2025 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nPAXdfk+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6570A2C026C
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945897; cv=none; b=tzYEWGKIvKCAF1U1E6tPY0ycUVfScYYcApAskmEyrk3LzSuTcEqAoGdifdo1AaWONr9gyd3kbDRt6zIhGJTmAjCcAoTKak8GacfSIpofqOTVyxCcOyiIh1UolOfJJaKd88OYPn6nOGDy64rG1T85vhBntMa9FpgEp+XEVtQCqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945897; c=relaxed/simple;
	bh=U4XDPHzwHTtHzCJ0SP7WwNFhqbaBOg8OWXtYtCgxlT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsuLoZa7TfS6P2EJB9QzJ97Qgkj0/ajRQoNvPCf0aTxOuRDa7MfCiVlXHfGeO3lhp1TvHm0KM3zaEqjaeBG+y418DoxUYxNKJpJG7FjUbwL4m1aS8yYWZeNxER2nxmi7PXX8dd+ia/1v4oP9Ni4O4V6mGDoojeYpVdQ8l2ElGlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nPAXdfk+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 89CD7EFE;
	Wed,  8 Oct 2025 19:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945799;
	bh=U4XDPHzwHTtHzCJ0SP7WwNFhqbaBOg8OWXtYtCgxlT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nPAXdfk+mpXi4d1x5VdX26bbBmorRErU+wvmXfIwqNO9KnoFPiNYuRgJWrxCcw2ra
	 73nX9vDe7OF/M9QkTK2VKYBeSh8cScxLsqYFx89NEzFUVYcudQomKsyBUKWWiU5BYT
	 agfO0eMmjGqYjVZhXmgCfKUkypnpZr7Iwa5nOuVU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH 20/25] media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:47 +0300
Message-ID: <20251008175052.19925-21-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/samsung/s5p-g2d/g2d.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media/platform/samsung/s5p-g2d/g2d.c
index ffed16a34493..7b0481c7f953 100644
--- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
+++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
@@ -306,12 +306,8 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
 static int vidioc_g_fmt(struct file *file, void *prv, struct v4l2_format *f)
 {
 	struct g2d_ctx *ctx = prv;
-	struct vb2_queue *vq;
 	struct g2d_frame *frm;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 	frm = get_frame(ctx, f->type);
 	if (IS_ERR(frm))
 		return PTR_ERR(frm);
-- 
Regards,

Laurent Pinchart


