Return-Path: <linux-media+bounces-18030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5AA972299
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 21:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A536284761
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 19:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8013B189907;
	Mon,  9 Sep 2024 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="EhhqMby/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6427A18C347
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 19:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909984; cv=none; b=qrrW/yP4n0SqN6Rp2uMBPDkkJ1VEwdWP32yTklpI036w7Q+RSzL6FXpKVtiK9s0Dd/+S/B15m9nvVjxl+ZAqdiYhbfni5HRwbg3P/yV7uKuhwS9N9R/9X4nfUxyqTziNx/LpGIYMo0LlObdmYVlwvI8K5NP6VpGx0E477H2FsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909984; c=relaxed/simple;
	bh=tkE99i3lOnmErRaLwtdFNLjtsxB0HjwXqaOWWSXWU2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ur/pubyRjdwVUZtZTRrNI7bfEv2vzm6aXAjYt/VkFc/pwUUhXkTLg+ky8EPzcJ7w0EXYaEuM6OSTWBcQxpTW0B86o1mnymFz1sRjQ03MjXhZvHLXfjmOvxf8k4lC7+AGzdhIATDO8ZczjRK5UcIxjQcHwTHpCtjbZKE39xTmm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=EhhqMby/; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909978; bh=4gklXqyktcof8ba4FurfBU5esS2Yxx641ea2Fa/v1L0=;
 b=EhhqMby/2vQ/JJhXfdW5+/zd8DRVoymOzU6Q//ouhAj9MpGaIQG19UG23XOWWKVsnMiSyXJQK
 95i99G1dqp6aPMmoePcptElmCVBmu8orhFKy8OTvcFkFIpM6byg3k6PkYpzmDKzKRCdfOGMLQhJ
 NXopcT/GpqVJuKOlI537JW/O/xfUQMSiQYjCKa3rfRYlgPVqaG16F/QQ83QSMnayZ/wbhfj+fmo
 ZvfMk5t+SeD1A16DI1uEFZ0kJxdQ8AOFBYnZ4Kf4tZwp1aDqxmNPGth+j0um/cf7iYWyXHqTk6d
 C/6rM0vDbxZBT/9didW3tWJ+KzsNt6m5hkK3bZQ647Ew==
From: Jonas Karlman <jonas@kwiboo.se>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v6 08/11] media: rkvdec: Add image format concept
Date: Mon,  9 Sep 2024 19:25:06 +0000
Message-ID: <20240909192522.1076704-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66df4bd8c680cb8b7d2dc21c

Add an enum rkvdec_image_fmt used to signal an image format, e.g.
4:2:0 8-bit, 4:2:0 10-bit or any.

Tag each supported CAPUTRE format with an image format and use this tag
to filter out unsupported CAPTURE formats.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
v6:
- Change to use fmt_idx instead of j++ tucked inside a condition (Dan)

v5:
- Collect t-b tags

v4:
- Change fmt_opaque into an image format
- Split patch into two

v3:
- New patch
---
 drivers/staging/media/rkvdec/rkvdec.c | 48 ++++++++++++++++++++-------
 drivers/staging/media/rkvdec/rkvdec.h | 13 +++++++-
 2 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index efbf9aa578ae..467fc05b347a 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -27,26 +27,45 @@
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
 
-static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index)
+static inline bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
+					  enum rkvdec_image_fmt fmt2)
+{
+	return fmt1 == fmt2 || fmt2 == RKVDEC_IMG_FMT_ANY ||
+	       fmt1 == RKVDEC_IMG_FMT_ANY;
+}
+
+static u32 rkvdec_enum_decoded_fmt(struct rkvdec_ctx *ctx, int index,
+				   enum rkvdec_image_fmt image_fmt)
 {
 	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
+	int fmt_idx = -1;
+	unsigned int i;
 
 	if (WARN_ON(!desc))
 		return 0;
 
-	if (index >= desc->num_decoded_fmts)
-		return 0;
+	for (i = 0; i < desc->num_decoded_fmts; i++) {
+		if (!rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
+					    image_fmt))
+			continue;
+		fmt_idx++;
+		if (index == fmt_idx)
+			return desc->decoded_fmts[i].fourcc;
+	}
 
-	return desc->decoded_fmts[index];
+	return 0;
 }
 
-static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc)
+static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc,
+				enum rkvdec_image_fmt image_fmt)
 {
 	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
 	unsigned int i;
 
 	for (i = 0; i < desc->num_decoded_fmts; i++) {
-		if (desc->decoded_fmts[i] == fourcc)
+		if (rkvdec_image_fmt_match(desc->decoded_fmts[i].image_fmt,
+					   image_fmt) &&
+		    desc->decoded_fmts[i].fourcc == fourcc)
 			return true;
 	}
 
@@ -80,7 +99,7 @@ static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
 	struct v4l2_format *f = &ctx->decoded_fmt;
 	u32 fourcc;
 
-	fourcc = rkvdec_enum_decoded_fmt(ctx, 0);
+	fourcc = rkvdec_enum_decoded_fmt(ctx, 0, ctx->image_fmt);
 	rkvdec_reset_fmt(ctx, f, fourcc);
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
@@ -149,8 +168,11 @@ static const struct rkvdec_ctrls rkvdec_h264_ctrls = {
 	.num_ctrls = ARRAY_SIZE(rkvdec_h264_ctrl_descs),
 };
 
-static const u32 rkvdec_h264_vp9_decoded_fmts[] = {
-	V4L2_PIX_FMT_NV12,
+static const struct rkvdec_decoded_fmt_desc rkvdec_h264_vp9_decoded_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.image_fmt = RKVDEC_IMG_FMT_420_8BIT,
+	},
 };
 
 static const struct rkvdec_ctrl_desc rkvdec_vp9_ctrl_descs[] = {
@@ -282,8 +304,9 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
 	if (WARN_ON(!coded_desc))
 		return -EINVAL;
 
-	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat))
-		pix_mp->pixelformat = rkvdec_enum_decoded_fmt(ctx, 0);
+	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
+		pix_mp->pixelformat = rkvdec_enum_decoded_fmt(ctx, 0,
+							      ctx->image_fmt);
 
 	/* Always apply the frmsize constraint of the coded end. */
 	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
@@ -400,6 +423,7 @@ static int rkvdec_s_output_fmt(struct file *file, void *priv,
 	 *
 	 * Note that this will propagates any size changes to the decoded format.
 	 */
+	ctx->image_fmt = RKVDEC_IMG_FMT_ANY;
 	rkvdec_reset_decoded_fmt(ctx);
 
 	/* Propagate colorspace information to capture. */
@@ -449,7 +473,7 @@ static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
 	struct rkvdec_ctx *ctx = fh_to_rkvdec_ctx(priv);
 	u32 fourcc;
 
-	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index);
+	fourcc = rkvdec_enum_decoded_fmt(ctx, f->index, ctx->image_fmt);
 	if (!fourcc)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
index 633335ebb9c4..6f8cf50c5d99 100644
--- a/drivers/staging/media/rkvdec/rkvdec.h
+++ b/drivers/staging/media/rkvdec/rkvdec.h
@@ -75,13 +75,23 @@ struct rkvdec_coded_fmt_ops {
 	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
 };
 
+enum rkvdec_image_fmt {
+	RKVDEC_IMG_FMT_ANY = 0,
+	RKVDEC_IMG_FMT_420_8BIT,
+};
+
+struct rkvdec_decoded_fmt_desc {
+	u32 fourcc;
+	enum rkvdec_image_fmt image_fmt;
+};
+
 struct rkvdec_coded_fmt_desc {
 	u32 fourcc;
 	struct v4l2_frmsize_stepwise frmsize;
 	const struct rkvdec_ctrls *ctrls;
 	const struct rkvdec_coded_fmt_ops *ops;
 	unsigned int num_decoded_fmts;
-	const u32 *decoded_fmts;
+	const struct rkvdec_decoded_fmt_desc *decoded_fmts;
 	u32 subsystem_flags;
 };
 
@@ -104,6 +114,7 @@ struct rkvdec_ctx {
 	const struct rkvdec_coded_fmt_desc *coded_fmt_desc;
 	struct v4l2_ctrl_handler ctrl_hdl;
 	struct rkvdec_dev *dev;
+	enum rkvdec_image_fmt image_fmt;
 	void *priv;
 };
 
-- 
2.46.0


