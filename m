Return-Path: <linux-media+bounces-44538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C0FBDD3C3
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C161C1921AAB
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A6E315D47;
	Wed, 15 Oct 2025 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mEkyUNuH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15797314A6D;
	Wed, 15 Oct 2025 07:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514877; cv=none; b=InsmSOCSBq2zEG5H8CIPRgUEbtgVCBSrxPgKpknwEZnnTG72/iOWL5Pn78qKEMYOQLzqBUaiP+Oey9MMziIEDSYs6kJX+inUBGEQShwios9Xo2DJYH4n+OJhGoh6/nSCXVIgWP4zgEgfQe/9OhBtznmshq76D67WxfMiu3Cm134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514877; c=relaxed/simple;
	bh=nKiyKhCg0+ZQsYzKxYtjhjqufWHToDMAELf6fiemlfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lUabebLXRR83tct0f8sKA3IulrARvdUl2tWnIx3J07g1OzNmVuw01CjJ9okdslbMb5JtqDl/+/oX7jw1G2V+v8WaoeZa15ExU3HsAhFxLOBwtTf2yCiux5EsJjdraJ8IAQ/kEScFw9MegwJzMiaG4pjgDZe5dTVmc9iwllXFzXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mEkyUNuH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B3D65EB7;
	Wed, 15 Oct 2025 09:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514776;
	bh=nKiyKhCg0+ZQsYzKxYtjhjqufWHToDMAELf6fiemlfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mEkyUNuHbwalJpslTfqxCNaMUMvhozjydNqFE0S6b3vj0NdWiHseN0G8BXpZ6tJs4
	 2snuPA9vcUC3TdtUh9M3GLPhYEqVdZQM4Q8WtXrs3Fdpxk4JhyKNBA9L9wio3DvlM6
	 f2msyb5eRfGMvRkedSdoOVHPJzexTn0y07pH08AI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 18/25] media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:41 +0300
Message-ID: <20251015075353.22625-19-laurent.pinchart@ideasonboard.com>
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

In the get and try format handlers, the return value is not used for any
purpose other than the NULL check, which was therefore probably intended
to catch invalid format types. That's not needed for the same reason as
in the set format handler.

Drop the unneeded return value check and, as the function has no side
effect, the unneeded function calls as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar_jpu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 46ea259a2bb9..3d714fec4fad 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -825,9 +825,6 @@ static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct jpu_ctx *ctx = file_to_ctx(file);
 
-	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
-		return -EINVAL;
-
 	return __jpu_try_fmt(ctx, NULL, &f->fmt.pix_mp, f->type);
 }
 
@@ -841,8 +838,6 @@ static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	int ret;
 
 	vq = v4l2_m2m_get_vq(m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&ctx->jpu->v4l2_dev, "%s queue busy\n", __func__);
@@ -866,9 +861,6 @@ static int jpu_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	struct jpu_ctx *ctx = file_to_ctx(file);
 	struct jpu_q_data *q_data;
 
-	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
-		return -EINVAL;
-
 	q_data = jpu_get_q_data(ctx, f->type);
 	f->fmt.pix_mp = q_data->format;
 
-- 
Regards,

Laurent Pinchart


