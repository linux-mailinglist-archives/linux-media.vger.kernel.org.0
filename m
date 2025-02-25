Return-Path: <linux-media+bounces-26925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC8A43A1E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 10:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C87C917DBF9
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 09:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E568E266F07;
	Tue, 25 Feb 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="gAezVFRb"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE6A266B6A;
	Tue, 25 Feb 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476556; cv=pass; b=fKczQ/Zt4hfVvXfD8il4RjgBhdnYHqGETSvGY2peTqKcvE6BMVjCTm69f0c+1zAS6ZlJPr9S/v7qUpa0d6wn3QwwtCD8P/O2xxBLaYwuZ+3l8cWJPmPdzvqluxMSHy4YiOLP4wIEL+ZvgPNeDaBq8W2asdIj3YfKl/YLjeI/yuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476556; c=relaxed/simple;
	bh=eVwfkJgrtg/ojk4C322PTszqycQHo6H0RjPzqZkoPRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNKyTih2byr2fhYiK+08vjTr8eHKFQG0UezXFKrv/Cu3uwbZXQ0vLTabJX7TVJLIZLvq9ErBl4VjvXoI3Cy5yOx+cURsLO+sntFKeeZg/QEjtgUeb+bC/x4h+bGLRszYdCUGdKkHG/p1Foyv1t/3N0cFV8BUEppj40PryrJDtAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=gAezVFRb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740476535; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kjhfYKacagn7OGxW8vpe/RG0uXAvLFpqOQaKXPdyVrRlUpCCXXHE3EiRgDQ8BLGY10IpGXZ1kP3Jrgg8g8ylbwwDZbDNpbU1gywQlEI/O5p+mm+qBc12b4eShdFtfN7vOoqRzZLEMd+Nd52mHpY7Rg7HFcBXUBzc3j3Y/2QGTF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740476535; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/8A7cEnXp8nqZSIzTdM5HSiUNLhttee1lozg4tIvdoc=; 
	b=khpuzu4WJBh+Mj3Q5udxNj1IG6RTdbRCILPFQEYO3AnYbcya6C2AnjeHQFIOP3ut4sdobi073FbDjVHAdvxVEDbb1i6EHV3QFG6ybcnG1ZhC6ql2SOpHjepwsmVVH5tfIeU6SRHyJFtvSlW0YbAPyeOJJA9R6PM5ovD6zu3gWzQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740476535;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/8A7cEnXp8nqZSIzTdM5HSiUNLhttee1lozg4tIvdoc=;
	b=gAezVFRb2JnB0sDbHuthPK6vunPim94elYStVh3Kq2pKUnpQQqNSfvGQtMkwroU5
	A8nGJPaTtDO1a9Y9zSpdg+jjb489ZbE8frMECgC23A7MSuM8laIRJmeQvbGjXIOR3jA
	K59++doc6/tqaDGuiaco32J6UomIyyrq5VBPtdUA=
Received: by mx.zohomail.com with SMTPS id 1740476532125542.1938108427083;
	Tue, 25 Feb 2025 01:42:12 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Tue, 25 Feb 2025 10:40:30 +0100
Subject: [PATCH v7 09/12] media: rkvdec: Add get_image_fmt ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-rkvdec_h264_high10_and_422_support-v7-9-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476426; l=3356;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=CwMixnkIZ/allNwX4Kc5noJDx3ycu+QFQATghvvWml8=;
 b=b5AtoQiu6u0MbqANEjQWro6j75NOwil1ENlDIZbECq7Y4f1q04MKnytzZ0Kx30msXVMaTilUUvBZ
 b1oGeS91ADoc0uU6FIwmBaKnVu4A5YEfX0DVu78SKzsaehqyyU6P
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

From: Jonas Karlman <jonas@kwiboo.se>

Add support for a get_image_fmt() ops that returns the required image
format.

The CAPTURE format is reset when the required image format changes and
the buffer queue is not busy.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 49 +++++++++++++++++++++++++++++++++--
 drivers/staging/media/rkvdec/rkvdec.h |  2 ++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 70154948b4e32e2c439f259b0f1e1bbc8b52b063..5394079509305c619f1d0c1f542bfc409317c3b7 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -111,15 +111,60 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
 	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
+	enum rkvdec_image_fmt image_fmt;
+	struct vb2_queue *vq;
+	int ret;
+
+	if (desc->ops->try_ctrl) {
+		ret = desc->ops->try_ctrl(ctx, ctrl);
+		if (ret)
+			return ret;
+	}
+
+	if (!desc->ops->get_image_fmt)
+		return 0;
 
-	if (desc->ops->try_ctrl)
-		return desc->ops->try_ctrl(ctx, ctrl);
+	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
+	if (ctx->image_fmt == image_fmt)
+		return 0;
+
+	if (rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, image_fmt))
+		return 0;
+
+	/* format change not allowed when queue is busy */
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (vb2_is_busy(vq))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
+	enum rkvdec_image_fmt image_fmt;
+
+	if (!desc->ops->get_image_fmt)
+		return 0;
+
+	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
+	if (ctx->image_fmt == image_fmt)
+		return 0;
+
+	ctx->image_fmt = image_fmt;
+	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
+		rkvdec_reset_decoded_fmt(ctx);
 
 	return 0;
 }
 
 static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
 	.try_ctrl = rkvdec_try_ctrl,
+	.s_ctrl = rkvdec_s_ctrl,
 };
 
 static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..e466a2753ccfc13738e0a672bc578e521af2c3f2 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
 		     struct vb2_v4l2_buffer *dst_buf,
 		     enum vb2_buffer_state result);
 	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
+	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
+					       struct v4l2_ctrl *ctrl);
 };
 
 enum rkvdec_image_fmt {

-- 
2.25.1


