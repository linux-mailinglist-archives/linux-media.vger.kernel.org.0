Return-Path: <linux-media+bounces-61067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJv2K8KlAWpDhQEAu9opvQ
	(envelope-from <linux-media+bounces-61067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:47:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C83750B41D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECBE03075393
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8E63BF66B;
	Mon, 11 May 2026 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXdRx0dU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7433BBA08
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491236; cv=none; b=svuz2nQP+MPxXNQmyuxk9VdeG8V62WZnGMizLLvTgdlyLuXfYwzZVE8U830VEVnp/R+oiYmNDO1KQ+q43Vfb6t2ROy1N6/CXQRkFXP5lGBTUKJxPy3/TruJTn0EZ++OQYblGQwSmZ75j0JCFT/WevlGomywQSmSPAQ71ESAwd88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491236; c=relaxed/simple;
	bh=TAhQZw0wpyy7M1R35sWEGKNJTx38Wi1ZyfZZ3XckPRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1WStZlA3nkn198XObcMSmrM9Zz7aTZjCUzccCnA3vuP9zg3shf4Sav4mpgxxS3Z76ZMguvMCWf+t4w7QTSHV0OrT0GL0MPR8dAGwh9BIr1wscXGobG/z61Q0bKdZTQJk7XJSoHPq0geZ8OmIcakFFGW/knIUJdREQuTRkdXt3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXdRx0dU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso2274003f8f.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778491232; x=1779096032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70RRHIcPtjWb3dpDxzH5BIzTRCGXwzXLne5sT6oMZeE=;
        b=dXdRx0dU0YOGYHlT58R04EqpXKbAjtWGQPfet0IzMExksAs3aruJkMgs36m5kWYSn5
         ekFV3Eh4ryK3iF8vwFszlq5CrYfbk7dSDLKehs9TE5k8JVeshiRVqnxJegNP5jsyL/jr
         bwO1ECz2iMHCkeehnTfOs4FJZNVPE88tcuJ3XxQKjeCw4Kj/kaDH+QHXi4bt/bg6Usq6
         01uBYB7QiX4hJQOJijLqdqOBieLPRiSM5Ircl0e1pMSqB8qy/AKUHYL/Uq7NQMlcG9nt
         9CaK8m68l2fGkTKY/83OCxJsL1W0isR1WIso5pXs2jCaG8w5GtFe1UuVhEOGux3BYO4W
         n9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491232; x=1779096032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=70RRHIcPtjWb3dpDxzH5BIzTRCGXwzXLne5sT6oMZeE=;
        b=ZFL1qoaO6yxya9JRXdyEFm1tefw5TksCd6Ct/6FKVfP28VhT6l/GOyZAyY/t24M8NO
         o05o7yFVIrzEu2PhCwicQNw0Z3MpzLKJH4S3bSJzP0Rzp5qtAtn4gqV0gu8W2jrG0aaN
         r86FaWnTC3dZg9keiQT3MV63Jo0qYxQU/HFDmCPeei2wFxgBA3WlJJDXypndwgY1VfEi
         sWWbC3TAlKYto/fqFscjVUuFM+87+iVDaWoCaNl/c+IF6dq06XbVGC9wutF/YDl+Jlkq
         jTGDN+UYvuBt70F6R6Ml0jaMULtCDDeZ54RPQJdcZVfE2DVcuRe7Inot1prKhnJCfxgD
         z9hw==
X-Gm-Message-State: AOJu0YwKjRkdhMG2dGJAzI72ZOIliaFYxPWfkrRC1QJXNmDRTtRiYIEy
	cUWaAA8fSARaCH1CS5IwDXpxL5cFE9qEOVXlRbozpVmYkcQVyZ2vTp1u+xD18d6/g4I=
X-Gm-Gg: Acq92OHnBCoHQwGWXIHUOhooHRVuoLuhiUO/Vmo4VDUwyVFGK05/hfa9uK5ucVLwJr5
	ijtDl6hZi06YU0/sCogE62VaDOR7FnNUNoC2ZJGVRCfrRZkYaqneeMmEHhR2NdxZVQ12afbd0LM
	sX0Rq1eWSeVq1pLCPJRCvSQpVYmRSY1tByp9jjSFi2ftl4O044wwG7ffQssBryp27RktpP8a9Mc
	vwzCcthotBPWcig9Gj709VXaP5JN/liLt9o8CgWNb84TkePUwr0dbaAUHDZRbg9gYzB2biiNByU
	b7sJoMHmqba1x6ISx2FF2H0gnU+yhI2xfjvl8OH7cJiUrxZZ2GyqFd8YaxnzBCNXPwD8HcMT8U8
	syj4DGIUT62N/jEfys/glYleddVwuJjYqSzE7ZKCzS6mwqPrDlPJt+Sm9kAdN9gFxhRsE9yHuB+
	cLwmeor0LeNf4zSkPJ4aZAO3AxS26gC/woiS80vzrLbcw7
X-Received: by 2002:a05:6000:3107:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-4515dc8095fmr32953188f8f.39.1778491232261;
        Mon, 11 May 2026 02:20:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm23743240f8f.17.2026.05.11.02.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:20:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 11 May 2026 11:20:27 +0200
Subject: [PATCH v3 2/6] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-topic-sm8x50-iris-10bit-decoding-v3-2-7fc049b93042@linaro.org>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10187;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TAhQZw0wpyy7M1R35sWEGKNJTx38Wi1ZyfZZ3XckPRY=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBqAZ9bhS22tB5+HUPMYAcJ2SC4HNr9lw2nFUcUgYKe
 YqtTvFuJAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagGfWwAKCRB33NvayMhJ0SDzD/
 iQPV5TBPeDhherAbdia567cDu91JKP8PKtYAHmXDEd/XqCRELlvEEJ/NnWPwlgau6K+fBlthiY9p9w
 94FD0S+CZvAT/S+Iq8MLBD6XV1tBOL5r7vw/lC2lfVtVAZbe6YYddQ+B+w3ljnOXamYEPhWE4SIhm1
 +dBNBE82W5GrtiDewtwIX3/IGnrm/G3/tL/YvTEgJlJCVyNq4m3y3TSLJ3A0FMqG+6cPJvb4T1oq3s
 LzV6JmodLIW9PQI3slilO1eLRb7CviKxXXc5R5PptcCLyJ1k2MV4l2sJf2Fu65FBOJXennC0/P0wYX
 C2GbzpQKTBjuqQHBbQLY5khA5FtHOGblSMgaxJJxTeqIWyeVO7xkgjmu2zwxg2nj2D5kCaCfjRPOgC
 prYxKgNfGpdAur/iTHZsXWPIbgEsqmTkj1TViSpmdiAJlNb+ri1WnSLrAjXaqi1aXxJSVPVx2sEG3d
 8A0cQaAU79PSHU4Oj3osWECtVoHcKb7NHLGy8n59XE9P8ewSeofsiaG4j9ACr1/KKAVoSowIb5rHw9
 0p7zvgiDse3ffqgeWUFmF3qf5IVykdPos/ZcYunEOTCY62O8TbdcDI9z/ddQkZIK734kO8mjwIxiRH
 lw5teMsKGhWV/b7kS3wCWpXvZa+GQwC3wuz5N96LV+bW5In59xhAPUuzUY
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 2C83750B41D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61067-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

The P010 (YUV format with 16-bits per pixel with interleaved UV)
and QC10C (P010 compressed mode similar to QC08C) requires specific
buffer calculations to allocate the right buffer size for DPB frames
and frames consumed by userspace.

Similar to 8bit, the 10bit DPB frames uses QC10C format.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 195 ++++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 1d53c7414b75..713a63d0ca0c 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -15,8 +15,11 @@
 #define MAX_WIDTH 4096
 #define MAX_HEIGHT 2304
 #define Y_STRIDE_ALIGN 128
+#define Y_STRIDE_ALIGN_P010 256
 #define UV_STRIDE_ALIGN 128
+#define UV_STRIDE_ALIGN_P010 256
 #define Y_SCANLINE_ALIGN 32
+#define Y_SCANLINE_ALIGN_QC10C 16
 #define UV_SCANLINE_ALIGN 16
 #define UV_SCANLINE_ALIGN_QC08C 32
 #define META_STRIDE_ALIGNED 64
@@ -80,6 +83,63 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
 	return ALIGN(y_plane + uv_plane, PIXELS_4K);
 }
 
+/*
+ * P010:
+ * YUV 4:2:0 image with a plane of 10 bit Y samples followed
+ * by an interleaved U/V plane containing 10 bit 2x2 subsampled
+ * colour difference samples.
+ *
+ * <-Y/UV_Stride (aligned to 256)->
+ * <----- Width*2 ------->
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  ^           ^
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  Height      |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |          y_scanlines (aligned to 32)
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  |           |
+ * Y Y Y Y Y Y Y Y Y Y Y Y . . . .  V           |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              V
+ * U V U V U V U V U V U V . . . .  ^
+ * U V U V U V U V U V U V . . . .  |
+ * U V U V U V U V U V U V . . . .  |
+ * U V U V U V U V U V U V . . . .  uv_scanlines (aligned to 16)
+ * . . . . . . . . . . . . . . . .  |
+ * . . . . . . . . . . . . . . . .  V
+ * . . . . . . . . . . . . . . . .  --> Buffer size aligned to 4K
+ *
+ * y_stride : Width*2 aligned to 256
+ * uv_stride : Width*2 aligned to 256
+ * y_scanlines: Height aligned to 32
+ * uv_scanlines: Height/2 aligned to 16
+ * Total size = align((y_stride * y_scanlines
+ *          + uv_stride * uv_scanlines , 4096)
+ *
+ * Note: All the alignments are hardware requirements.
+ */
+static u32 iris_yuv_buffer_size_p010(struct iris_inst *inst)
+{
+	u32 y_plane, uv_plane, y_stride, uv_stride, y_scanlines, uv_scanlines;
+	struct v4l2_format *f;
+
+	if (inst->domain == DECODER)
+		f = inst->fmt_dst;
+	else
+		f = inst->fmt_src;
+
+	y_stride = ALIGN(f->fmt.pix_mp.width * 2, Y_STRIDE_ALIGN_P010);
+	uv_stride = ALIGN(f->fmt.pix_mp.width * 2, UV_STRIDE_ALIGN_P010);
+	y_scanlines = ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN);
+	uv_scanlines = ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN);
+	y_plane = y_stride * y_scanlines;
+	uv_plane = uv_stride * uv_scanlines;
+
+	return ALIGN(y_plane + uv_plane, PIXELS_4K);
+}
+
 /*
  * QC08C:
  * Compressed Macro-tile format for NV12.
@@ -204,6 +264,132 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
 }
 
+/*
+ * QC10C:
+ * UBWC-compressed format for P010.
+ * Contains 4 planes in the following order -
+ * (A) Y_Meta_Plane
+ * (B) Y_UBWC_Plane
+ * (C) UV_Meta_Plane
+ * (D) UV_UBWC_Plane
+ *
+ * Y_Meta_Plane consists of meta information to decode compressed
+ * tile data in Y_UBWC_Plane.
+ * Y_UBWC_Plane consists of Y data in compressed macro-tile format.
+ * UBWC decoder block will use the Y_Meta_Plane data together with
+ * Y_UBWC_Plane data to produce loss-less uncompressed 10 bit Y samples.
+ *
+ * UV_Meta_Plane consists of meta information to decode compressed
+ * tile data in UV_UBWC_Plane.
+ * UV_UBWC_Plane consists of UV data in compressed macro-tile format.
+ * UBWC decoder block will use UV_Meta_Plane data together with
+ * UV_UBWC_Plane data to produce loss-less uncompressed 10 bit 2x2
+ * subsampled color difference samples.
+ *
+ * Each tile in Y_UBWC_Plane/UV_UBWC_Plane is independently decodable
+ * and randomly accessible. There is no dependency between tiles.
+ *
+ * <----- Y Meta stride -----> (aligned to 64)
+ * <-------- Width ----------> (aligned to 48)
+ * M M M M M M M M M M M M . .      ^           ^
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      Height      |
+ * M M M M M M M M M M M M . .      |         Meta_Y_Scanlines (aligned to 16)
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      |           |
+ * M M M M M M M M M M M M . .      V           |
+ * . . . . . . . . . . . . . .                  |
+ * . . . . . . . . . . . . . .                  |
+ * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
+ * . . . . . . . . . . . . . .                  V
+ * <--Compressed tile Y stride --> (aligned to 256)
+ * <------- Width * 4/3 ---------> (aligned to 48)
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  ^           ^
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  Height      |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |        Macro_tile_Y_Scanlines (aligned to 16)
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  |           |
+ * Y* Y* Y* Y* Y* Y* Y* Y* . . . .  V           |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .              |
+ * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
+ * . . . . . . . . . . . . . . . .              V
+ * <---- UV Meta stride ----> (aligned to 64)
+ * <----- Width / 2 --------> (aligned to 24)
+ * M M M M M M M M M M M M . .    ^           ^
+ * M M M M M M M M M M M M . .    |           |
+ * M M M M M M M M M M M M . .    Height/2    |
+ * M M M M M M M M M M M M . .    V           M_UV_Scanlines (aligned to 16)
+ * . . . . . . . . . . . . . .                |
+ * . . . . . . . . . . . . . .                V
+ * . . . . . . . . . . . . . .      -------> Buffer size aligned to 4k
+ * <--Compressed tile UV stride--> (aligned to 256)
+ * <------- Width * 4/3 ---------> (aligned to 48)
+ * U* V* U* V* U* V* U* V* . . . .  ^
+ * U* V* U* V* U* V* U* V* . . . .  |
+ * U* V* U* V* U* V* U* V* . . . .  |
+ * U* V* U* V* U* V* U* V* . . . .  UV_Scanlines (aligned to 16)
+ * . . . . . . . . . . . . . . . .  |
+ * . . . . . . . . . . . . . . . .  V
+ * . . . . . . . . . . . . . . . .  -------> Buffer size aligned to 4k
+ *
+ * y_stride: width aligned to 256
+ * uv_stride: width aligned to 256
+ * y_scanlines: height aligned to 16
+ * uv_scanlines: height aligned to 16
+ * y_plane: buffer size aligned to 4096
+ * uv_plane: buffer size aligned to 4096
+ * y_meta_stride: width aligned to 64
+ * y_meta_scanlines: height aligned to 16
+ * y_meta_plane: buffer size aligned to 4096
+ * uv_meta_stride: width aligned to 64
+ * uv_meta_scanlines: height aligned to 16
+ * uv_meta_plane: buffer size aligned to 4096
+ *
+ * Total size = align( y_plane + uv_plane +
+ *           y_meta_plane + uv_meta_plane, 4096)
+ *
+ * Note: All the alignments are hardware requirements.
+ */
+static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
+{
+	u32 y_plane, uv_plane, y_stride, uv_stride;
+	u32 uv_meta_stride, uv_meta_plane;
+	u32 y_meta_stride, y_meta_plane;
+	struct v4l2_format *f = NULL;
+
+	if (inst->domain == DECODER)
+		f = inst->fmt_dst;
+	else
+		f = inst->fmt_src;
+
+	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
+			      META_STRIDE_ALIGNED);
+	y_meta_plane = y_meta_stride * ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
+					     META_SCANLINE_ALIGNED);
+	y_meta_plane = ALIGN(y_meta_plane, PIXELS_4K);
+
+	y_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, Y_STRIDE_ALIGN_P010);
+	y_plane = ALIGN(y_stride * ALIGN(f->fmt.pix_mp.height, Y_SCANLINE_ALIGN_QC10C),
+			PIXELS_4K);
+
+	uv_meta_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) / 2, 24),
+			       META_STRIDE_ALIGNED);
+	uv_meta_plane = uv_meta_stride *
+			ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) / 2, 4),
+			      META_SCANLINE_ALIGNED);
+	uv_meta_plane = ALIGN(uv_meta_plane, PIXELS_4K);
+
+	uv_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, UV_STRIDE_ALIGN_P010);
+	uv_plane = ALIGN(uv_stride * ALIGN((f->fmt.pix_mp.height + 1) / 2, UV_SCANLINE_ALIGN),
+			 PIXELS_4K);
+
+	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
+}
+
 static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
@@ -268,10 +454,17 @@ int iris_get_buffer_size(struct iris_inst *inst,
 		case BUF_OUTPUT:
 			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
 				return iris_yuv_buffer_size_qc08c(inst);
+			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C)
+				return iris_yuv_buffer_size_qc10c(inst);
+			else if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
+				return iris_yuv_buffer_size_p010(inst);
 			else
 				return iris_yuv_buffer_size_nv12(inst);
 		case BUF_DPB:
-			return iris_yuv_buffer_size_qc08c(inst);
+			if (iris_fmt_is_10bit(inst->fmt_dst->fmt.pix_mp.pixelformat))
+				return iris_yuv_buffer_size_qc10c(inst);
+			else
+				return iris_yuv_buffer_size_qc08c(inst);
 		default:
 			return 0;
 		}

-- 
2.34.1


