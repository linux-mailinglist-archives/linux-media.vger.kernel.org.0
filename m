Return-Path: <linux-media+bounces-62438-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPxCMwrRDmrOCQYAu9opvQ
	(envelope-from <linux-media+bounces-62438-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:31:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5855A263B
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C45630B387C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B92F378D87;
	Thu, 21 May 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+Rz31yK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028D93769F7
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355507; cv=none; b=izXtJUmZv1crEsqJmTwr0qZi6L6RAojXD/Me/nvJZx/iU4FzAuRSV2gnskI8knSzYgg5YlEGOp8D8P1YwI+fTAEolzQqwH3ZRJW03HT2Rk0fHNpVxsHhZTUes7nYmBn4WIkrOBv9wa22wQNYgmsIoBZXQByok0pvJKKWvpuaz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355507; c=relaxed/simple;
	bh=XwGr9tyt3hvPaymnCZfqwqr/45L2MCnptFtwTTHBXNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVVpiF6ZY016QiCpgJpm9se94yqTO1NwD4B0jYwwUfLBE+tGSi8v/9PPqU9U2tr8HDHxaRZLnAYnQsAHqvzIzKCSeh9QNk6U4RS1pjnSPNm1nfbSy1/WJcN8b657EGtjN8SdZxPp94bb/4ImKmytFMR4xvRdrxlZFBva9ePCnvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S+Rz31yK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48e82c23840so47471295e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355503; x=1779960303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtfQTQItLHGkPPyqlJcA4HuqW4jsk65SOAFKJ/4eG70=;
        b=S+Rz31yKNhfDUvMCrQBWiVt2wlyQu2nxcI8sS16onywBw8vqHmeD2VrzQT/7kM9lUV
         2UepwCn5oYkoom6w4iK17F0keKkxkyfG+sFWR8SKkfuaklSQQi+2/Hg7GpTB1mqz01iR
         P+kfv6vyi8IuzaGVByg9cRFBeynHK5TcprKv4szIdwy/rZpG/G0bWr/GCBmGNG64hBS7
         KFYtXhrtwyg6ABS5J7Ahok8KB+qjikBAshGbEc6tnhedfGBS0qC/F7T7tkwf9P0n9fbr
         UbCZjFyCNDQ3B79EPV6GVIzbXLyTQ0LhlfnfY1YWWmPNPjC81lZVStV+MMbVB2r3gmy2
         GsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355503; x=1779960303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtfQTQItLHGkPPyqlJcA4HuqW4jsk65SOAFKJ/4eG70=;
        b=OSHkJmeajhIDIdkYR6LaaDzIr3cgB2X+f3xYMQAHPxy8pCQrDctiRGlBmNiab8DDLo
         0Wq8p3X+oaakgGcd2olCQ2giIsTuS/ZVxj3iJiQeuRNRCHfNC15Avx38EjIfIt8RqqjA
         4oLhdSJAMc6g89v4uUIVnLurYFh8UWqs1pze7BipimLs7BM28rhOeHDCo1BXeEQM4NBv
         Max1OimeQ77v3nOrXmDTlTl8Xh4ei2HL5AAM23DoySaFppn4bB18CHL6op+2aZ4lbud7
         u+XIt47S+wnm+zbNH/1cfp7tFYWBGb6L5LMKwE/jylDGJZqMu9ZrvYM2Bz1USD/HNE9r
         l8WA==
X-Gm-Message-State: AOJu0YzkzBUkePZ1Kf8gP/NLn5t8lQp3bUIUwD+eo7OHFIEW7nCSmc76
	ghdRaEudukir2mpNeYWt3t3eEA9jQt8Z/6sRa5xR3Xd8XVQSG8SgGazcDm26pZ8SWls=
X-Gm-Gg: Acq92OGP2YDZG5obq3T53/aciB/gWV3NSCL86fr2V6ISTYi5RijYqcYfk23BSct+vgd
	lwjqXCofEHYrT65gIaNnqpRnGagLavd/bg066EyWy4N72GI0DDZM7o29EKeo/Lu+1TyFsl9Yv75
	ZTIoapbOiV6O+yTTlZFtsssxNwYDNTOQRk56FnE2nNeEohjJIPP9xSTmGmTeJUJosUNi0VyAqLG
	+jYyLlqC0i3cpdzQaj5qocs+HPMOZ9yVnS/kzkOkqRz9Cwk/dJVmb0EVqbi85N7xNDffxQ6UUBR
	/TcFOUECrnJsO04T8wrww75zd0PHgJ09TC1iTWqx5KAik0sLnhA+ySoGO6l9tco0hJqxkQgnNQ7
	B6yNL/a41bBT0Z/gvCnA4H3hAnDkna0MnQ8ENflRTsnn8y6GxGVLtMRxd8lru/yEPruqZa5yfP7
	NqILBb8hFnIMGSqWrU8NQibmD4ry/0632G/SKAvRMvi2qe
X-Received: by 2002:a05:600c:620f:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-4903604cc8dmr22768965e9.4.1779355502886;
        Thu, 21 May 2026 02:25:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:25:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 11:24:56 +0200
Subject: [PATCH v4 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-3-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6402;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XwGr9tyt3hvPaymnCZfqwqr/45L2MCnptFtwTTHBXNw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9pFxMcx5vgSPt1XV6BcWTwv3OIOrX5ZxW1JxjM
 3q9DptqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PaQAKCRB33NvayMhJ0RCKEA
 CCnt5LfU3sX6LFjTnfJfADp9X7s6E6FjMFRHU7InUDs4HTGfe1ndxsE0JLuPgrwb3C2rr5nzzpEf1z
 ywYDXsDNgzNesrJmny9kZd/SqAA8v5Sx61uihwLi+CS2ntOsprQt5RlqHH3TyxvhCq4Me34Ddo4rs0
 HcbV+cIt/JDfRS7JuudOf5L/KTiT0K748IZ72aMwSwA2U/XDBEklhD6cN5TxIB7IpZFkQHVLyBw6va
 gdwK87cd4bDb6OCfvVlk/e4HY1lo9lG28ZzT/RAiuF6OkXa8Vbe46t4MRaaHCUGLNd1uZesDZfLKzM
 oF9AkcPhbgEPYb4II+4kfCvUekDCNYCfluXctzjC8uW0foizWAXy1scDcFtdDqZ7UtYz5QSimm6uU6
 wo7IJnbgPOYv3Hst5FmeLu2eONEOgXd9sC6Zc9TjM3u+qsIlKKKUB58cyiCKpnWdMliZtejxFIJpPg
 Xgn3oq+9LK+vsWCSo6gShLQ1mSVawyrUS79OQz8xlqmwBJjJQTyGGWjbBrS17JY5HH0M/ZZAmHPmtY
 MS5c0NyqM+ZxuT+Kf0kk6RDFRS+dRj20QcVcg2nUMPAWV89nEUcCYZIeiAwhCVLLK7xECd4o/Vn+bg
 RSC0OlGYRRFsXEpy+OKxRwpq5gqikBqdTDYrbw8jE6Ft7aexRHOpC6UPSqQg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62438-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 6C5855A263B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the necessary plumbing into the HFi Gen2 to signal the decoder
the right 10bit pixel format and stride when in compressed mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
 3 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index c90b22a75bc5..1d0ab30093db 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
-		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
-			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
+		switch (pixelformat) {
+		case V4L2_PIX_FMT_NV12:
+			hfi_colorformat = HFI_COLOR_FMT_NV12;
+			break;
+		case V4L2_PIX_FMT_QC08C:
+			hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
+			break;
+		case V4L2_PIX_FMT_P010:
+			hfi_colorformat = HFI_COLOR_FMT_P010;
+			break;
+		case V4L2_PIX_FMT_QC10C:
+			hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
+			break;
+		}
 	} else {
 		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
 		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
@@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
 	stride_uv = stride_y;
 	scanline_uv = scanline_y / 2;
 
-	if (pixelformat != V4L2_PIX_FMT_NV12)
+	if (pixelformat != V4L2_PIX_FMT_NV12 &&
+	    pixelformat != V4L2_PIX_FMT_P010)
 		return 0;
 
 	payload[0] = stride_y << 16 | scanline_y;
@@ -532,6 +545,61 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
 						  sizeof(u64));
 }
 
+static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
+{
+	u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
+	u32 stride_y, scanline_y, stride_uv, scanline_uv;
+	u32 port = iris_hfi_gen2_get_port(inst, plane);
+	u32 pixelformat, width, height;
+	u32 payload[4];
+
+	if (inst->domain != DECODER ||
+	    inst->fmt_src->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_AV1)
+		return 0;
+
+	pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
+	width = inst->fmt_dst->fmt.pix_mp.width;
+	height = inst->fmt_dst->fmt.pix_mp.height;
+
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_QC08C:
+		stride_y = ALIGN(width, 128);
+		scanline_y = ALIGN(height, 32);
+		stride_uv = ALIGN(width, 128);
+		scanline_uv = ALIGN((height + 1) >> 1, 32);
+		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 32), 64);
+		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 8), 16);
+		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
+		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 8), 16);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		stride_y = ALIGN(width * 4 / 3, 256);
+		scanline_y = ALIGN(height, 16);
+		stride_uv = ALIGN(width * 4 / 3, 256);
+		scanline_uv = ALIGN((height + 1) >> 1, 16);
+		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 48), 64);
+		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 4), 16);
+		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
+		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
+		break;
+	default:
+		return 0;
+	}
+
+	payload[0] = stride_y << 16 | scanline_y;
+	payload[1] = stride_uv << 16 | scanline_uv;
+	payload[2] = meta_stride_y << 16 | meta_scanline_y;
+	payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_UBWC_STRIDE_SCANLINE,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32_ARRAY,
+						  &payload[0],
+						  sizeof(u32) * 4);
+}
+
 static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
@@ -620,6 +688,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
+		{HFI_PROP_UBWC_STRIDE_SCANLINE,       iris_hfi_gen2_set_ubwc_stride_scanline   },
 		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd..68f849232906 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -118,6 +118,7 @@ enum hfi_flip {
 #define HFI_PROP_OPB_ENABLE			0x03000184
 #define HFI_PROP_AV1_TILE_ROWS_COLUMNS		0x03000187
 #define HFI_PROP_AV1_DRAP_CONFIG		0x03000189
+#define HFI_PROP_UBWC_STRIDE_SCANLINE		0x03000190
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
 #define HFI_PROP_END				0x03FFFFFF
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 085665cd74ff..ba5c8dc1280c 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -35,7 +35,9 @@ int iris_get_mbpf(struct iris_inst *inst)
 bool iris_split_mode_enabled(struct iris_inst *inst)
 {
 	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
-		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
+		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C ||
+		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010 ||
+		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C;
 }
 
 bool iris_fmt_is_8bit(u32 pixelformat)

-- 
2.34.1


