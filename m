Return-Path: <linux-media+bounces-44543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F9BDD3CD
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88A91353886
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730E3315D5C;
	Wed, 15 Oct 2025 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eMtYXmcI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66681315D21
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514886; cv=none; b=k0qRbgdkZaLYKKj+sdByWGnTUVn1poN+Dy6PkZRAzhArvVQEcPsvQwRCALaBEkfaL5oQ5+x+npxs8OE5c36xBh6pOfMmeF5C4wevf9DgFh3mLnkrAeNE6FM+P2XVvbbF6qRbdk/vLI1Kef0t7M/qdkpLt5BxUBlIKjgrx+5JMEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514886; c=relaxed/simple;
	bh=JriWKeRSSP3yg4su25ogtThp7m/ShPKYrxuy7jMYVw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwWN7s4/ffk5gwFrBOcra5U71C9REGCcgEEQ+zqfA9/kHAoVF9KNoTlu4LE6S4a+DAbSby+MBmDsioF1SqMSMzrmhWJ320CJaTZ1AB82XUsXy0StSj+ZO+gCPrmZd4Ck4LNMO+6O9o8Trs/SItmvDe1f70PukMiYwknJZDUovAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eMtYXmcI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5955B190D;
	Wed, 15 Oct 2025 09:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514785;
	bh=JriWKeRSSP3yg4su25ogtThp7m/ShPKYrxuy7jMYVw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eMtYXmcItqhRKcwLcebWncwr2QmBtBRacS/VKAtz70FoPg6eCmI1kVlrjesEB0/YK
	 Y0cKmYGmi3C8yE83no+9HljrJM1TSHktP+M95Ti3/pNHiMDxInxcRLxdH86HusnaxV
	 6p3hMadVoSrmqmNAVX46Qr+OVgVaZLzN6kREHqI8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Subject: [PATCH v2 23/25] media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:46 +0300
Message-ID: <20251015075353.22625-24-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/ti/vpe/vpe.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index 6029d4e8e0bd..1a549775cabe 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -1567,13 +1567,8 @@ static int vpe_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct vpe_ctx *ctx = to_vpe_ctx(file);
-	struct vb2_queue *vq;
 	struct vpe_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
 	q_data = get_q_data(ctx, f->type);
 	if (!q_data)
 		return -EINVAL;
@@ -1740,8 +1735,6 @@ static int __vpe_s_fmt(struct vpe_ctx *ctx, struct v4l2_format *f)
 	struct vb2_queue *vq;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		vpe_err(ctx->dev, "queue busy\n");
-- 
Regards,

Laurent Pinchart


