Return-Path: <linux-media+bounces-31539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9CAA6482
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 21:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE3C31BA2787
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C10423C50F;
	Thu,  1 May 2025 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ig+PwqmM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F0323959D;
	Thu,  1 May 2025 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746129376; cv=none; b=RZTFQ0jgoFsOK9ZsI9fO/clB4r4qyeoS4EbPYK/oKJ1Jo2yK5LfMyCrOE2xi62PHQJOg6f7hW5IVbe/dkyF7dIuFlOBnTm5qt00Be7izzNIFCfaiU8Rv2jHjmNc6rnPrGpFCfsd+fO/13omYVGELoFzsZ1vG+sox1ebp4YomX8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746129376; c=relaxed/simple;
	bh=F8QH/ocNr8Msfc15yLu3IucOFvml0k937ZAmGMEg8lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZPMOdpK7mcdabCCovcZEbooagk74NYPirF2te4Cl9TiwO/+XEmQYI2SZQ+HJ7NPE0jONqhFHMb5b8nZ2h5a+G5SRKMIsWCiHmzmlV/WWsok6rL4CxWdUVmLFcwunq+5dm3cZmu7DXmTtCMoe19K104Cw/xmUi14Xk+9crfvDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ig+PwqmM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746129373;
	bh=F8QH/ocNr8Msfc15yLu3IucOFvml0k937ZAmGMEg8lE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ig+PwqmMqyrZpfWyvRKuzdDYLsYeYs5IakbcKMPMzE2BXMf7hDELt93eKZaC86YBX
	 4Z8YRPddIB5WDdNKeZCK8hnAXe8eeJ1KlfGiq3YJSRoNcDtpdNl/ArSFUw+oOAAzBn
	 s1PLHSLvxTc0BTmgrbQVQrslxfAJMUBdjrvnSuPBBZcuo4CGEeP2bKbP4symKhcvjt
	 y8q8hXwE9O9sqpZiF62aTN/fNwCfneJ51wQVQuVbRqmUce9gggjDntIT+Xexe6XuqC
	 pBQ47ruPwwhmcn+VjyqzeArHshq7gDqfqSV5pz/wWkElvIMQ1b1A3CRUa9GppBpmC3
	 TiNTd1cCSMjdg==
Received: from [192.168.13.3] (unknown [IPv6:2606:6d00:17:8242::c73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C915C17E1500;
	Thu,  1 May 2025 21:56:11 +0200 (CEST)
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date: Thu, 01 May 2025 15:55:49 -0400
Subject: [PATCH v10 3/4] media: rkvdec: Add get_image_fmt ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-3-c380ba452108@collabora.com>
References: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-0-c380ba452108@collabora.com>
In-Reply-To: <20250501-b4-rkvdec_h264_high10_and_422_support-v10-0-c380ba452108@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, kernel@collabora.com, 
 Jonas Karlman <jonas@kwiboo.se>
X-Mailer: b4 0.14.2

From: Jonas Karlman <jonas@kwiboo.se>

Add support for a get_image_fmt() ops that returns the required image
format.

The CAPTURE format is reset when the required image format changes and
the buffer queue is not busy.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 35 +++++++++++++++++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 7b780392bb6a63cc954655ef940e87146d2b852f..f7eb67520ab0edd9ac1da3d0daf2af1bc6d37a09 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -34,6 +34,15 @@ static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
 	       fmt1 == RKVDEC_IMG_FMT_ANY;
 }
 
+static bool rkvdec_image_fmt_changed(struct rkvdec_ctx *ctx,
+				     enum rkvdec_image_fmt image_fmt)
+{
+	if (image_fmt == RKVDEC_IMG_FMT_ANY)
+		return false;
+
+	return ctx->image_fmt != image_fmt;
+}
+
 static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index,
 				   enum rkvdec_image_fmt image_fmt)
 {
@@ -118,8 +127,34 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
+	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	enum rkvdec_image_fmt image_fmt;
+	struct vb2_queue *vq;
+
+	/* Check if this change requires a capture format reset */
+	if (!desc->ops->get_image_fmt)
+		return 0;
+
+	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
+	if (rkvdec_image_fmt_changed(ctx, image_fmt)) {
+		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
+				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (vb2_is_busy(vq))
+			return -EBUSY;
+
+		ctx->image_fmt = image_fmt;
+		rkvdec_reset_decoded_fmt(ctx);
+	}
+
+	return 0;
+}
+
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
2.49.0


