Return-Path: <linux-media+bounces-63353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJxQJVWXHmoAlQkAu9opvQ
	(envelope-from <linux-media+bounces-63353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:41:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5D862AC05
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB93F305FB3C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FAC3CAA48;
	Tue,  2 Jun 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="medjD/Ht"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7809A3C8705
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389569; cv=none; b=rDYwzuanf5VS3e5fwThSdPNZs7nyf2+Eg9BDsbzneZzUKFOZr0qxe9cTs7iTjI0iiKeY3eRC67qKPHZT3WfdF+qq1ZfC5STd0LTKpocj9JUabtB3LUM01Ntaktba7cW2IUOdnFDcWqKSfxt/bQCfptumHxdrLC9ODtYRVuLYqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389569; c=relaxed/simple;
	bh=S0Db5q5hr6FHFvR+xCmOQpGFoF3p1CIuLIlhmqNs5vA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtEKAJqz+qf1XkkLgIFHfYl1KjaAlfHz53y76or51kL+utccFZ4Ff79lk8Pm2LKBgtizQpfFjsApm6SimvaXszTjuPdquq+WrevBD055bKNb1Ot52duQ6U5qMYisWIjFPwRHmdjrjLA7bM6IHI/Qhl33zAKTaF5usKE4SN8h8CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=medjD/Ht; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4909e3fa4b2so39273595e9.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389563; x=1780994363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHVYWOR+HRE1TX1JuspNow2YGDrcXnqJ6OCBB/dIJOs=;
        b=medjD/HtVOtfRQXJkUumD3w0wEsvNjI4tqxJs3E/Jz1+k/d4HVNV9cpH7rVzEeYoHG
         +2kbUb6p5Tc8ibV2ObQJm570HVQOJInJrO/caW/VeDiMzTN7TGb/dVMVbv3cfCpoczw0
         /AeCpWlA6L6zfzpc4SfHQ3H6EEoubyXuY3gGkSBzOuJz4IJPiEKUeq+WjoYA0h9vxxhL
         3vNPyC5j+GS3G82+UC5qIlONY+v7ZdjDPmD+gkqIYcwzw0uhfLYGT0LOCItsO6S9p6fE
         HAzZN0/DSFhOBSwsG72BlxkzOMvXChtvQUbJGZssKD6vZ8fBf0I6dyOvd9J+XI1UY0U5
         H5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389563; x=1780994363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHVYWOR+HRE1TX1JuspNow2YGDrcXnqJ6OCBB/dIJOs=;
        b=NB503JSEgki1AJnw3XlTV6WvHp3sxRqoLWqDjUXAK7KcrooXz3Fv2UYtbzo06iRed/
         HQ5ssOpPC8lhok8koLyqq2ZQe4JeEVkEEBikYSgfkTLZmlcuHNIoiNqdQtYdtF99WgxT
         ZNzSZgPGCOOqUqEbuDksbXHDJb26bpnJxMwNsS32U3WWRr3NafesGdZtUjWIKRXyJKwE
         ngieLcuJPZUywMuIl3vmfT8mPbtckpaWV8juvW/syCBpmkDrt7xtkIBK/6MnPII7G4UF
         TSrwx9fnCLyNJIsiY4DTtxKpFKiSN8DWIBzjsxsLAQ4I9ZUPHkyPDs/xxrTa6sFUadf7
         C2Ww==
X-Gm-Message-State: AOJu0YzthjESnAE1+akzNF8TmMNoD6onZvJF4E/8wEcZkmW+2SMrMNCd
	CEuEXN/2viQaQ1St3cS+QxJIDXYGLhhFer3X/ybtKmwqzwP8Uk+Uovx8w2Mn5kbQMDEcMDGKONe
	kjdcM
X-Gm-Gg: Acq92OGb6hC0Zyit7FRAUzkd3KieRlFEnoP1PhXj6lSply5F3boHsdBsBzul8pAcLRx
	GuBC/sjagryDnNXtqbnixn87cO74zoHNrsWImU7eQZytMPFbbs7pwOgzRRHetGrQLdwNPjzJG5J
	c5S/iiG/ylM9/gfKupYN3JvXUewxM61ehqGw9jLampHxR6gRafoA2UW5HqYhwALVNBViVRZUQ98
	mvA+jKAkr//igGxbzGrtuEftx3mB+SC1fbba5Qi9CMpgsnPfc60Mpt3p4SlGa3EPbXga9PuvWTN
	h6my9mLUCBsKFdUt6U9fS08I3tTldpAyc0xSCF1rAia0emFfSQyp2L/JB3+EzqE6e4YXw+Kp+SD
	Lg6ObetjHPOJIG89FAiKNjYnQVW5rEUC/4DJURk5YHZ097JpqOIvWo0SMne577uPwRVIgFpY9uu
	E4WLpDk0ZMmaQYaET1T2fdcb8L42x+CEO0QsP3YO4NYzD7jVMxp2kTF5tWRZT9f663Fg==
X-Received: by 2002:a05:600c:654b:b0:48f:e1ac:c94f with SMTP id 5b1f17b1804b1-490b071b95fmr37621185e9.10.1780389562507;
        Tue, 02 Jun 2026 01:39:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Jun 2026 10:39:17 +0200
Subject: [PATCH v5 2/6] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-2-c2b32474ed67@linaro.org>
References: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
In-Reply-To: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10325;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=S0Db5q5hr6FHFvR+xCmOQpGFoF3p1CIuLIlhmqNs5vA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa2aBax2W8lHXTcA0lvliooN4DlfQttxYdSXtg+
 pY/ywCuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtgAKCRB33NvayMhJ0fUGEA
 CHB4DuC2zl4b7KvrU+JHOqbHxUH02ajjcQO7+Zxt0yvsLxiC9EnqAlgO2UxzF8NRCQSfgQBUMQFbW+
 GDG8+Nq88eiUrmhEX9aHAIhB38n16523yL22G334WLzjzo6bcLaM81awpJst3xk4QH7Td/ke5LFxQN
 Vj+yiGm9KgLh4kLpgYRVs+wkG/wZHNNj2GsyDY6oMTqN1K2JJu3g98qMarq13op0gf6e3ygJ/CHhYd
 TavULCCp4WYYdNZWou6eBZDTZjEg59nMgqBxz36umatRTed7dKWU9Y3J5NNOY2P/ue+frjzTGcYaiT
 nxm0pEcodcnKnjZSMc+XdjuNVcnCQvA6dYnn66wtb8coufqUGo+kT7AhXgXCJZ2ZTepR/MLb6aJyEM
 tWJzSbUKYLervx+/TOz25ZueW0BM0yR9IHZouXKwsnVC9pZXDP/2iIXdrYrlMaPmvphG+qeUmTRSZL
 KZBZ4H8nhX/mO6QxYG75sDhqNinxvwcPv1u0O12YM6YckZOvuTHZNyXyKAQNqs7jS2SF8KmFIWZuuv
 aIUkQ4GZNxzalrDoAYg+YzGmAQhjh6EJD+JIEoJ8NQV3+ATy0Md9XCZCmf/0tbDfsU5sdozASTI6Ks
 OCkqLvR1M3BN7dXVX1HfokT9Atkix/oWJcEnLfvUdM/q5mQLnXcanZA5obRA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63353-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4B5D862AC05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The P010 (YUV format with 16-bits per pixel with interleaved UV)
and QC10C (P010 compressed mode similar to QC08C) requires specific
buffer calculations to allocate the right buffer size for the DPB
(decoded picture buffer) frames and frames consumed by userspace.

Similar to 8bit, the 10bit DPB frames uses QC10C format.
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 195 ++++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index ef7f6f931557..fbe2dd87f0d6 100644
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
+	struct v4l2_format *f;
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
+	uv_meta_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) >> 1, 24),
+			       META_STRIDE_ALIGNED);
+	uv_meta_plane = uv_meta_stride *
+			ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) >> 1, 4),
+			      META_SCANLINE_ALIGNED);
+	uv_meta_plane = ALIGN(uv_meta_plane, PIXELS_4K);
+
+	uv_stride = ALIGN(f->fmt.pix_mp.width * 4 / 3, UV_STRIDE_ALIGN_P010);
+	uv_plane = ALIGN(uv_stride * ALIGN((f->fmt.pix_mp.height + 1) >> 1, UV_SCANLINE_ALIGN),
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


