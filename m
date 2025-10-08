Return-Path: <linux-media+bounces-43984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 427EEBC630E
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564C43B9DD1
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A162C08BF;
	Wed,  8 Oct 2025 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FhhRXZ4i"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC072C027F
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945869; cv=none; b=ZFH1+WjBKp1/i4uFJTibb/57wwVmp0l0jQcfzGR60j0MDc2qkEBWqxvGg6EGo8TWwT7S/L4vyzkk4PafmeiOy6tumyID7hyB/S9ZVpvPaOBdAHj1FxUZENQtkqnPPNqGlSzID0fo87kfyRAKIyZVsHx1CnM38ox0wP49NBRXNck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945869; c=relaxed/simple;
	bh=/c/M6dN55o/aLTOruXQriqJCzqFxJD0UbyfBCqPUydg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aidS1qwzsnM5Pr9JDnjSh0rR1QhATuF1xjFt6bTns2qW4fRa/4JrVglvdVHzxkROqpA9a66072pLn52dAlowQqZ81uN4/VmTTkMaRLmw65Kz7uYnCKsGQCtCI5RE8GCnsMVYVsRMlxnWSDCWaPvBDKvf7e4S7HKU3hRZWYwWO6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FhhRXZ4i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F23D11E3A;
	Wed,  8 Oct 2025 19:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945771;
	bh=/c/M6dN55o/aLTOruXQriqJCzqFxJD0UbyfBCqPUydg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FhhRXZ4iSSZUBAXI6Df1p8KLG2iszNH46eVF9br9q7J+FOIgFyiwxvcHvJwrevHMp
	 Np+g/lvBeRq2w0jQ/N9yOoXwiaabPJTnGi4EeNgGjcwO0qz27corpYVRA/x1Qumx0k
	 t2XxP19L/rFLxMSoiMUZgkB4ZOFA4BtSmFaeZopA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 03/25] media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:30 +0300
Message-ID: <20251008175052.19925-4-laurent.pinchart@ideasonboard.com>
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
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 0c004bb8ba05..a9323b383547 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -627,13 +627,8 @@ static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct ge2d_ctx *ctx = priv;
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


