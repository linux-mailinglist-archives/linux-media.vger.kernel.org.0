Return-Path: <linux-media+bounces-18028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F8972296
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 21:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76D06B227A2
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 19:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160CA18C01F;
	Mon,  9 Sep 2024 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="bUhtETlv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E593418C023
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.246.76.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909976; cv=none; b=OwQvVu5iZTTh8rDKKa61pG3+9Lj/hxvn7I9UFef90+8c2WvF9nrpSp0++5icVSWyPg1o4dJdy8mDr0mdkRaAdUfKjtoVcNGDf1kR9ztUJyXSH7g97POvabQCnswR7gjsWJYvMYXkjAp2dKuaGmrXH/Y0ZmVR1Vdft0O9ils1caI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909976; c=relaxed/simple;
	bh=i+JdmSi6eafftQF+OnQwSt0auBGSPwxnwLS0cLpc/nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKw+TmWmjbHu+TZ7PYe/A/yFwvXUf2j2FkjeFaFpxSkwsJ4649KbPuZUldUVM/ctj0XfeNHM9759cqOnNK9nRX3RhQLZEDI25l4uHtg2Ja+DBx1WP0vOqlEC3W3qsi8jM13bmt9lFO5/www1YQnH0lqvXFPCsCBuJQKVZq/ujxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=bUhtETlv; arc=none smtp.client-ip=207.246.76.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909965; bh=1XPfZdWEVhjIGMhqhg2f2J8FpThlVEHreHUtrk5OF2U=;
 b=bUhtETlvsGC67tmnXJtHeE4ddtpgiSNtes3CsW4ftezW3JJYGtVOag1WN2apDW39E1vhp/8sQ
 2Ah0s4iVnhAGfgspxSmkMmB4Vsw6h+nve3H/FL6yTSHqLtqlB/RTU82mdEwa2NXCjFtH8uIEvJm
 YbiS5uIv+ZT3gR10HJcUs2TDk8/O/H4lu6J+WcmBa5PEK7jSDxmMijNyMWeW7UGxJSnb1X4AJ5g
 8GBdr4zS+/NFHQL1VmeP/nb1/mfkCGgpah0w1kHV3EWf1LHmsYMrqJk+oWZ5Ow0E4tX7GntKfH3
 vAruK1x1YIywfIZFrlGXzhSujsSMIW7y9SQwmFR4L4SQ==
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
Subject: [PATCH v6 06/11] media: rkvdec: Move rkvdec_reset_decoded_fmt helper
Date: Mon,  9 Sep 2024 19:25:04 +0000
Message-ID: <20240909192522.1076704-7-jonas@kwiboo.se>
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
 207.246.76.47
X-ForwardEmail-ID: 66df4bccc680cb8b7d2dc1ed

Move rkvdec_reset_decoded_fmt() and the called rkvdec_reset_fmt() helper
functions in preparation for adding a new caller in an upcoming patch.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Tested-by: Christopher Obbard <chris.obbard@collabora.com>
---
v6:
- No change

v5:
- Collect r-b and t-b tags

v4:
- No change

v3:
- New patch
---
 drivers/staging/media/rkvdec/rkvdec.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d1087519d218..7e59db3fc24d 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -37,6 +37,29 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
 		DIV_ROUND_UP(pix_mp->height, 16);
 }
 
+static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
+			     u32 fourcc)
+{
+	memset(f, 0, sizeof(*f));
+	f->fmt.pix_mp.pixelformat = fourcc;
+	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
+{
+	struct v4l2_format *f = &ctx->decoded_fmt;
+
+	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
+	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
+	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
+	rkvdec_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
+}
+
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
@@ -169,18 +192,6 @@ rkvdec_find_coded_fmt_desc(u32 fourcc)
 	return NULL;
 }
 
-static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
-			     u32 fourcc)
-{
-	memset(f, 0, sizeof(*f));
-	f->fmt.pix_mp.pixelformat = fourcc;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
-	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
-	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
-}
-
 static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_format *f = &ctx->coded_fmt;
@@ -196,17 +207,6 @@ static void rkvdec_reset_coded_fmt(struct rkvdec_ctx *ctx)
 		ctx->coded_fmt_desc->ops->adjust_fmt(ctx, f);
 }
 
-static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
-{
-	struct v4l2_format *f = &ctx->decoded_fmt;
-
-	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
-	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
-	f->fmt.pix_mp.height = ctx->coded_fmt.fmt.pix_mp.height;
-	rkvdec_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
-}
-
 static int rkvdec_enum_framesizes(struct file *file, void *priv,
 				  struct v4l2_frmsizeenum *fsize)
 {
-- 
2.46.0


