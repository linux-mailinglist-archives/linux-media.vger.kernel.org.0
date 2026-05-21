Return-Path: <linux-media+bounces-62437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH1VD5rWDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:55:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 963BF5A2C3C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1373231D60E7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B2F3769FD;
	Thu, 21 May 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mffafI2C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E53373BE9
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355507; cv=none; b=XoV2jqfKyG4rmRSfmvkRTTbqEeV2BDdJNdqjy55Wb3dGv0wmM2it2ME3j/yVMq6t5DmF0kV2pMtHBPcL+tmaCAF1z7BznT0s9yEJ1IzJY7KqLqeFIyg6JOuyufskXKB+dPW5dEbfpqnNzv45FID0dS8Jq2urZPgwxZP2aYj7G5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355507; c=relaxed/simple;
	bh=1YwTc1u9GV8fmhP1+J0vFa20RmdKpvYjpawvaFU/zAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRJi67RMtstd6FseeBzQWwSVH5Wyu9vNTJoFKiq1kwco7yvwc10/C1tllc94Igit4DXeh0i+dyyLWmW2k4MTVNYMmsNoSa1gLO0lfPBWsw4QO327IVtFh9yiUDi3UGWQdleSq851lKLuG7R5Rs6123mJkN7fxO9z245Y40WSSFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mffafI2C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso61485535e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355502; x=1779960302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+V645Hcn7ev2MWMZW7amLtyehEhpvkwVi07UuZWarg=;
        b=mffafI2CNSeT8CcIRWT+TLnjQ7aHUt8tWu+WcbOQhMpy7M9QsVYOQnZNsXyFqx6vSl
         HJqzAZMmalzz4YSzJGW3203ua9arF9derSXOG6s+zeQl6N8n8KzikoCagUZrhsyMVK1t
         rYgAA/bpSvxtxWXLU1IZnmD6AJVScL7CSrbdLO9aLXWf1gV8sZhLb3nGTLv37mrqbhBX
         uUyJ4UZE8ileQiEgDQ58xtIhYOxGmxHZTtXlXtsLn95brzY4PdBw2Gzejtw9BxpQjLLY
         Q541RyZ4YZox00UO+zJ+dnz/R3wHmFczHKjlbGHo410bsqDX/BKjppwEMkzVqwxr4zch
         5Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355502; x=1779960302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+V645Hcn7ev2MWMZW7amLtyehEhpvkwVi07UuZWarg=;
        b=rE2qZq7EZd9G+sTCBhbF2eyGL1LLkw9r8Fwps53o1SkR3/coT2ByMspIv0eGkXdZGc
         EhoYkBaSO1SXgOkq5jMEdtvut/0cmBpnvgMoouB2l9n44wfAz34TVvCsC1T8j0UiyNdc
         7FifaJvYqVlNzfkMEHqPTn2dOwypp0b+4Xi7z4c4A/7JULRfbAkdXjG3ez7WmZOYlfbi
         cu1ijaDipRTOgYWtajmha46sUjL1IGPA2wVnh1pC0X7/fcHS3XtcX8J/75zNVzCbPvpv
         WI+mENQ/k7skFBpSmLwvXgJwFDyy+AcCBUyYDp4xLsZ73dCE7dUJu49NU61uiBzgmjI1
         Ljnw==
X-Gm-Message-State: AOJu0YwnYg8IyU1fhjFOQFO+SRH67xEigXPNAFz26U4FeTLva6GqDM6a
	Zkb1Ys/ahZVPIuyBE3XgNRXarFcVQIgf7GDaAZx4Oqm2DGTWu+QJld3RvPJru8hRldQ=
X-Gm-Gg: Acq92OGDIWpZF5K264SM0R/MuT2oAUISeAy/AApfFb8DsSQr2zsPRkEu2+HK3wXIqDG
	QEHH5zTdL5Doc+forbxaEDujrJyNBjRDyjGyEYEtX0GXT/s/ckNFpCHBXpFm/XgbLXs4rNI7rer
	EgcLLc2mLe7Mpjc8phvqCoOleSN8MnABaDbP5g5HakEG7bsnUgIfMMJkI6LpzRerQGGhGeLVN7r
	slqdaB1fSmDDyUP0XpfDF6bw14mmsxvHelQXQaYyYoy53ogYFWsSnfkfq6qh3DhAxvowxBrDqM+
	2LXRljfAMwXq+SnHvYau0SF5+tLduRmGW7mIAWacw9SrCmPq5AH4w6oorDTRXJgl2i2FpBMXHij
	cTgtd2obGmg/iOUI3jGnwVxBsEgq+b+ZU6IviI7M0Uc90P1kKyWqMrkfVWKQdCWJks4uEih/IXW
	qSpxWGvXJ0KKaMFZrdRIFUpDHSL4GM6W9DTdaYdqUhmFSR
X-Received: by 2002:a05:600c:34c3:b0:48f:d0f7:78f1 with SMTP id 5b1f17b1804b1-4903604d089mr32061235e9.4.1779355502136;
        Thu, 21 May 2026 02:25:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:25:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 11:24:55 +0200
Subject: [PATCH v4 2/6] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-2-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10212;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1YwTc1u9GV8fmhP1+J0vFa20RmdKpvYjpawvaFU/zAc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9ptCdEJXyL3D7hLO/ub5ICBqKYZM88ttkChLBk
 u9qugkGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PaQAKCRB33NvayMhJ0QDPEA
 CWJ/ado+BDndc+xc2yVyWSyvJy1ZuqsPor9NZI//hnqjsqu7+6t6gnntk/Izj6vOPMfv9HL0FtjpQN
 IJ4A8hJ+5iUGqFrOalJyEsgSIk8i6sjWuXi7/Cdu+/lZGjrbhf9vhC89C4bu94MYsAGPhOyFB5xAqS
 0JHj/JUanFH7337To7LzyEcntrsyeGAWhCKEDV9blSW9o0tkgcN3D0MB42Y0Wg2Xtfmr9egfrniH8A
 V7sWvoXSL7e2cJV6B/v74XPKLiSzFJuEUI6jNfkzuC4W76T/eksp+kQZ+Ezr+HgNqBEiIQabhZYYKd
 NFpC9AQByF1/ERAl/vbJ/YsFD0Lq28aQiu6JtCpbKCKCQSsLY1+m5qz19o5X1ZKeYa560eTOM1BUq0
 hN+ZN67ueKZcAkgdBvUkiTd8MO2LlYGtFOcaEhTs7DYYzLJmeriaAktUsI2yFeYWY0Mfowp/hqUcSK
 tzPUfN3K56yzb7e36gPZirG6fnOMZ+egykdfOIw8MfTjHOJeHQG5nfQvn/3ivlC/lQyfbY6Lp+SNYP
 bTf2QkxLtxfo93WhJormxwzSeT2aZyfCMtwggeOvjYck4MqNCJqS4bU76wXRr8o1MLPqICfPVXbV2L
 vPLt0tPUZDtBxhKRo0sqMtbTa4KjKvbwkJ8SFDj3oIs5suBor9Ou5Yt7DnqQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
	TAGGED_FROM(0.00)[bounces-62437-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 963BF5A2C3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The P010 (YUV format with 16-bits per pixel with interleaved UV)
and QC10C (P010 compressed mode similar to QC08C) requires specific
buffer calculations to allocate the right buffer size for the DPB
(decoded picture buffer) frames and frames consumed by userspace.

Similar to 8bit, the 10bit DPB frames uses QC10C format.

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


