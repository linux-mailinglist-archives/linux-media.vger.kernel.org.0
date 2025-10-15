Return-Path: <linux-media+bounces-44532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F81BDD3C0
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EA50E4FBEA9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C239314A97;
	Wed, 15 Oct 2025 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S57TxcW3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278A3314A8A
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514868; cv=none; b=jevd3ow5joJvuHb7fqV03yZKwRyCJyIPizDaj5MGklSu7aCNlHyILTV9Rj9jov1W3rLnfaIni5s02kVEyPl66qWWMkyZQspAjy4z+iUsxZHp4cbPced90LjDk1idvjsdm9z+IzGtpE+Iw2wkxKZy3V3sf/o3QwA1JS01xJVs+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514868; c=relaxed/simple;
	bh=GyN5dO2q8CNnA8mbshQ6j2DDwtQzZldeYpp1do0QZpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+sVVnSGiJOrtOHlAsCEHXAznoTEh4UIOfPrUtWeOcUOc0Lt4HpqpKYj1xoAr/b5hyj0LnGfuBmZ1Hveik9sSYMKslrbx6Do3WW/rmmXQrmlHnmXIU1ZWl1/kDnULiBcEPxIA0BPhHUFDqWXA2RPKEFh34wqP4N84oSk7Lun3b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S57TxcW3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B43861A8F;
	Wed, 15 Oct 2025 09:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514765;
	bh=GyN5dO2q8CNnA8mbshQ6j2DDwtQzZldeYpp1do0QZpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S57TxcW3dbK975VLRiYnG8xeJTNAWYQKdgUVfFfieeDokkdXkuL1Dpm92ojA+sM5Q
	 W5YM7WkvjAPX61ovLj6IpfTKdVTnWTmfuixqOLJqR3iV8HPSn/OYFblmIUm6mbHRTV
	 z2ZDpeSNnLJ2W/VAPrVZg9y1CB0ZlEqXFkQtyx3U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 12/25] media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:35 +0300
Message-ID: <20251015075353.22625-13-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 6cc9b07ea53a..3f9a67a6bd4d 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1180,13 +1180,8 @@ static int pxp_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int pxp_g_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 {
-	struct vb2_queue *vq;
 	struct pxp_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 
 	f->fmt.pix.width	= q_data->width;
@@ -1329,8 +1324,6 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
-- 
Regards,

Laurent Pinchart


