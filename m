Return-Path: <linux-media+bounces-39324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBCEB1F7D7
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60ACA17D2AA
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DD01FA859;
	Sun, 10 Aug 2025 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BE2WN99P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193F31624D5
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789568; cv=none; b=CC0s4nFh5VbGytbL2tKSKsrFx1dUGgffbc8gIuxXCLjw14ROa3krtRvGEWEG1cphKhudlFTdZPZg20Lbip+9EGSU0h0qv0X7PY9NeXhv96F6gf98MrDpErysjRK6eIl78AQrJXjCKC200O+g5Btcw83Xhnq4F8BUfLzNzdHqG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789568; c=relaxed/simple;
	bh=+d8HCAd9saeFQoG/BxnHXNphCksZ/kk7HrgRZCzeUlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pm3UGg20RgPX5QoiP6X5kAtn/bjul/Bj7tCVhFIHP+m6A91oUXBOuoLUEDGhdTGwRfmdL4CwUDUNEksaIEmKBVW0Ad4vUSmpyKGwMohnlTaRdhouQ5WxNt/M/8DT0QSHk2LeRjhWKQUWAeo4tuG2Ahht8gXg9eZC3/kEAH9uT0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BE2WN99P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E6FD318B9;
	Sun, 10 Aug 2025 03:31:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789515;
	bh=+d8HCAd9saeFQoG/BxnHXNphCksZ/kk7HrgRZCzeUlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BE2WN99Pbmg4PiFm9GSb31ByiP+ZPpRHpsrjdd5dVmVwV0bWNo6tflveTuRp39/qo
	 uViqvYuqXKvRdXl3miMwjdpxBJn/7o+w6kT45ge08Ko9abFW3z6WLqX5ir6ZDJHUGX
	 kmmAbW4Aegcq11oV3FqF0ZribKHGiNDNMyOzcQBk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 51/76] media: rockchip: rkvdec: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:33 +0300
Message-ID: <20250810013100.29776-52-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Detlev Casanova <detlev.casanova@collabora.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  7 +------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 481c2488f9ac..9fa80ab3c62b 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -354,7 +354,7 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *coded_desc;
 
 	/*
@@ -387,7 +387,7 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 				 struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	const struct rkvdec_coded_fmt_desc *desc;
 
 	desc = rkvdec_find_coded_fmt_desc(pix_mp->pixelformat);
@@ -418,7 +418,7 @@ static int rkvdec_try_output_fmt(struct file *file, void *priv,
 static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	struct vb2_queue *vq;
 	int ret;
 
@@ -439,7 +439,7 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 static int rkvdec_s_output_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct rkvdec_coded_fmt_desc *desc;
 	struct v4l2_format *cap_fmt;
@@ -504,7 +504,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 static int rkvdec_g_output_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 
 	*f = ctx->coded_fmt;
 	return 0;
@@ -513,7 +513,7 @@ static int rkvdec_g_output_fmt(struct file *file, void *priv,
 static int rkvdec_g_capture_fmt(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 
 	*f = ctx->decoded_fmt;
 	return 0;
@@ -532,7 +532,7 @@ static int rkvdec_enum_output_fmt(struct file *file, void *priv,
 static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 				   struct v4l2_fmtdesc *f)
 {
-	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
 	u32 fourcc;
 
 	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index, ctx->image_fmt);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 3a6322d42b26..481aaa4bffe9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -124,14 +124,9 @@ struct rkvdec_ctx {
 	void *priv;
 };
 
-static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct rkvdec_ctx, fh);
-}
-
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)
 {
-	return fh_to_rkvdec_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct rkvdec_ctx, fh);
 }
 
 struct rkvdec_aux_buf {
-- 
Regards,

Laurent Pinchart


