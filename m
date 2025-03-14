Return-Path: <linux-media+bounces-28252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A0A614FF
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4084A8838EA
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A39205E26;
	Fri, 14 Mar 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2BDEDFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC7205AC7;
	Fri, 14 Mar 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966214; cv=none; b=MWenkWnTJ302B+hxVeKj/aVyXY0l3ViFPapNMt0UMILQ4a2anqKR6sCIw71srK+dgQy1YH6AHDpV5pXzazv3EpaNLnDtf2iH95r4IhsIgeCAAtLyjrrZ88jY6y9HZkKvQt0iSgfONvuQDJ0UGQzT03yA4CyICVLyz82a9E2kQTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966214; c=relaxed/simple;
	bh=HBais1f2vz4kMRf/cldht6E+mcty9TdtSZxdPWoqcfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cyHPxFfPrPY1Sx8A1JNN2u/GfU0f8AMFrykTa8RYZLrwLoo/1eigUEPtji41zaMc5HhCxxDSOseoLw/NqzmLjz6OTo/UyxZ3RDDEWbgInzKYmSUyY2c6/o3JJbw2ADbBrl1JLSpjco1jysI9ZofP1kL2KlLmVc3kdT/wMzRCIm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2BDEDFU; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30762598511so23188721fa.0;
        Fri, 14 Mar 2025 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966211; x=1742571011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwwz1u8FJDnJhqE7LdfxAKBgdcZ4z4VuuYDXy4Qw3lk=;
        b=I2BDEDFUroHrDr9hl0hUaMh1yORGflu1T38vEaJXt0S3KUvVkH+ra+auXtd0Km2Egf
         ouj+X4+daPfyZ14LJb1aG56cJPWqoplk3NwmHym9xu+cmYNAGKGAUWK25Du4WBt1DhFz
         26xeWr4VHq8aANO/RetvU635ENhbAZ/UGPrhZv3WKur8UQDliCNzQMGmoEvJFyaWPe5n
         tE3z6CrmSCTgJZvpy0zvJyNjrlBheHkk6miCWxB/05fed4VPqPXgDP6F5usPvO0oJ6bB
         AeCJXUJHJMXNI5meEba1bLjs+hfD+GnoUGxmbYiUsSOhkB8Kbkz/X0vmixUBypNjfWF+
         Tb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966211; x=1742571011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwwz1u8FJDnJhqE7LdfxAKBgdcZ4z4VuuYDXy4Qw3lk=;
        b=VFSgMm8WbqI+0ZttZEeoNmigs4UYKHHGxzxNjl26rUDSKXOjBCeHATBV2cARdHx9R2
         +NtIP8dbqcXZPunyFguhnjHXzXw1Q6id5y56ypW5XuxoGQ1WIsyK3UkGmsQ6gDetS3Tv
         tzfFf5eA3qo/WBmfhXCrI/1QFEAlHkjI2MF4stFfvXzG2xUoK/BGfOFGeGAepUd9vbks
         Y+wQTaBFoTaQe9aIWvE6mcQZDT54rQp9dNCg5p321hLLBTuh5zUoNVs8QH/W61sVCeYW
         jc1ev03eYkc5VLkqxUO88IE3oMkZXPAdF2TYEM7nWn2IE7BsTgbodmM1YlSbSev1PSOg
         JIaA==
X-Forwarded-Encrypted: i=1; AJvYcCVHMDDixpE2fCa0SvkKI5zsolKiwE5f1l8gEJ/rhnphrdrSzhoCrMub3mbtm/kYYh86+EMeZ7mBsIbvZZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRRi3QumaifyQxBtReeKK0qX63RC0KekcYA/s08UQjra1hbcn
	jza11Kym/c2oORwMIztXSLKgycfxw+KcwqyRo1lHUNtTkrWY/a+IRiy5Ur/JwkQ=
X-Gm-Gg: ASbGncu3XJMLZeoc7l8VSPMZfZaQz7L35i+BEpHBrGJzUZm9AMehNb7xZVhaNGjwVrB
	WSrjaAVySRD6bHhVSX0aK2bN35fppEeZhg36iS1HJr4YC9BKURig20Jkfh4vVmZ8FL+GrHTRpdH
	/sWso6BncG7wSsxq1sYtacbSt+xkvvBaP81cus9bG71iUU6+fZlFLJoIoAak0Esu+XAAMxYJAsk
	GVoLP2M4Edya2sgKXhTdm6KcRMniV4WIA5aCTWE4wL67nXFm4WbB3pwTa0EIJHo4B2uyPvkAInQ
	ym1NIRBtdE6BCHOkp2Jo9Dq5K/f29mb846YaRouPupXxpmg2FzS5f2KpQLZgNsYzTZWz
X-Google-Smtp-Source: AGHT+IEhwe/I7cON1IM9+xq7BbkWIky5UqcKei97voBNkrPmSwIuzbNjKLzE12QptgVORsDRWur/vA==
X-Received: by 2002:a2e:a781:0:b0:30b:a92c:7dd9 with SMTP id 38308e7fff4ca-30c4a875fd8mr9921781fa.17.1741966210634;
        Fri, 14 Mar 2025 08:30:10 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:10 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 15/18] media: coda: Use v4l2_ctrl to set gamma for h264enc
Date: Fri, 14 Mar 2025 18:29:36 +0300
Message-Id: <20250314152939.2759573-16-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

We can use v4l2_ctrl (V4L2_CID_GAMMA) to set gamma for
configuration h.264 encoder.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 .../platform/chips-media/coda/coda-bit.c      | 28 ++++++-------------
 .../platform/chips-media/coda/coda-common.c   |  7 +++++
 .../media/platform/chips-media/coda/coda.h    |  4 +++
 3 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index 50350d657f91..782b299e9b12 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -35,9 +35,6 @@
 #define CODA7_PS_BUF_SIZE	0x28000
 #define CODA9_PS_SAVE_SIZE	(512 * 1024)
 
-#define CODA_DEFAULT_GAMMA	4096
-#define CODA9_DEFAULT_GAMMA	24576	/* 0.75 * 32768 */
-
 static void coda_free_bitstream_buffer(struct coda_ctx *ctx);
 
 static inline int coda_is_initialized(struct coda_dev *dev)
@@ -1065,7 +1062,7 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	struct coda_q_data *q_data_src, *q_data_dst;
 	u32 bitstream_buf, bitstream_size;
 	struct vb2_v4l2_buffer *buf;
-	int gamma, ret, value;
+	int ret, value;
 	u32 dst_fourcc;
 	int num_fb;
 	u32 stride;
@@ -1251,13 +1248,14 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 
 
 	value = 0;
-	if (dev->devtype->product == CODA_960)
-		gamma = CODA9_DEFAULT_GAMMA;
-	else
-		gamma = CODA_DEFAULT_GAMMA;
-	if (gamma > 0) {
-		coda_write(dev, (gamma & CODA_GAMMA_MASK) << CODA_GAMMA_OFFSET,
-			   CODA_CMD_ENC_SEQ_RC_GAMMA);
+	if (ctx->params.gamma > 0) {
+		if (dev->devtype->product == CODA_960)
+			value |= 1 << CODA9_OPTION_GAMMA_OFFSET;
+		else if (dev->devtype->product == CODA_DX6)
+			value |= 1 << CODADX6_OPTION_GAMMA_OFFSET;
+		else
+			value |= 1 << CODA7_OPTION_GAMMA_OFFSET;
+		coda_write(dev, ctx->params.gamma, CODA_CMD_ENC_SEQ_RC_GAMMA);
 	}
 
 	if (ctx->params.h264_min_qp || ctx->params.h264_max_qp) {
@@ -1269,15 +1267,7 @@ static int coda_start_encoding(struct coda_ctx *ctx)
 	if (dev->devtype->product == CODA_960) {
 		if (ctx->params.h264_max_qp)
 			value |= 1 << CODA9_OPTION_RCQPMAX_OFFSET;
-		if (CODA_DEFAULT_GAMMA > 0)
-			value |= 1 << CODA9_OPTION_GAMMA_OFFSET;
 	} else {
-		if (CODA_DEFAULT_GAMMA > 0) {
-			if (dev->devtype->product == CODA_DX6)
-				value |= 1 << CODADX6_OPTION_GAMMA_OFFSET;
-			else
-				value |= 1 << CODA7_OPTION_GAMMA_OFFSET;
-		}
 		if (ctx->params.h264_min_qp)
 			value |= 1 << CODA7_OPTION_RCQPMIN_OFFSET;
 		if (ctx->params.h264_max_qp)
diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 9b443ddabeab..9ca459793050 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2205,6 +2205,9 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->params.bitrate = ctrl->val / 1000;
 		ctx->params.bitrate_changed = true;
 		break;
+	case V4L2_CID_GAMMA:
+		ctx->params.gamma = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		ctx->params.gop_size = ctrl->val;
 		break;
@@ -2311,9 +2314,13 @@ static const struct v4l2_ctrl_ops coda_ctrl_ops = {
 static void coda_encode_ctrls(struct coda_ctx *ctx)
 {
 	int max_gop_size = (ctx->dev->devtype->product == CODA_DX6) ? 60 : 99;
+	u32 def_gamma = (ctx->dev->devtype->product == CODA_960) ?
+			 CODA9_DEFAULT_GAMMA : CODA_DEFAULT_GAMMA;
 
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_BITRATE, 0, 32767000, 1000, 0);
+	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
+			  V4L2_CID_GAMMA, 0, 0x7FFFFFFF, 1, def_gamma);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, max_gop_size, 1, 16);
 	v4l2_ctrl_new_std(&ctx->ctrls, &coda_ctrl_ops,
diff --git a/drivers/media/platform/chips-media/coda/coda.h b/drivers/media/platform/chips-media/coda/coda.h
index ddfd0a32c653..007f56b24c61 100644
--- a/drivers/media/platform/chips-media/coda/coda.h
+++ b/drivers/media/platform/chips-media/coda/coda.h
@@ -29,6 +29,9 @@
 #define CODA_MAX_FRAMEBUFFERS	19
 #define FMO_SLICE_SAVE_BUF_SIZE	(32)
 
+#define CODA_DEFAULT_GAMMA	4096
+#define CODA9_DEFAULT_GAMMA	24576	/* 0.75 * 32768 */
+
 /*
  * This control allows applications to read the per-stream
  * (i.e. per-context) Macroblocks Error Count. This value
@@ -150,6 +153,7 @@ struct coda_params {
 	u32			vbv_size;
 	u32			slice_max_bits;
 	u32			slice_max_mb;
+	u32			gamma;
 	bool			force_ipicture;
 	bool			gop_size_changed;
 	bool			bitrate_changed;
-- 
2.30.2


