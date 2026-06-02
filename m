Return-Path: <linux-media+bounces-63352-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJmGBE6XHmrPlAkAu9opvQ
	(envelope-from <linux-media+bounces-63352-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:41:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8740C62ABE7
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 883EC305ACAD
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02FC3C870E;
	Tue,  2 Jun 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsrJfMZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1782E3C8719
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389569; cv=none; b=g/DUQOGH++IH5kbFWoomWXecq2yKeBMyxbN/mbB6VyJuNRhhv9yCvDnhT+o9gRKlAArkdi49yweU/xLKQS1ABbUdGVbJ3xT1syUrsULzynkiMrBk16PCnJa/VKev5LB058JGbAbXISvRxgTGVL3XIyWzigi05pX+fgx9Q+qH31o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389569; c=relaxed/simple;
	bh=Aivtp95wV2tJK8BU4UcdJBDDqczU83zO4d2Fedom0S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7ISMkQyb7vW5YxfsXnmnl0Cxungb64/9wNzi9XuTS72WcqA9YfHfYFLmShlgd7H+FvjatJoKcRqNUfCwy9TOzEVN3Hys/SAv5GWMB5K5VrhrWhEw9XjzlWuAfGC681eLmIdjk6VdleyrOXaMbtZ69fnPQwWsIQl9JXvPJil4uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fsrJfMZ0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4905529b933so85808955e9.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389563; x=1780994363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WW8A+O5CaCJo51Sk2hlF19QmFYNNtctthgExs50X4Uo=;
        b=fsrJfMZ0OvLzSMv2IpxvBaGjQWeDsuUX50XjC9kJCzHaDJuz3l2SuKGSHhfJkoYIW4
         UJO0qwLKi/WvLRAG5tMmUsMGP73h/hidcEewvtLjuI40Aw8+T6y1KHs7kYmbAxZussbA
         j2e925PL5oDm2uy38TMpbhtmKlI4G8A8iSnvaApUxSxpVf2e8YIIvfi8fzQvjunH6JN1
         nTeV/mp7JZJ5BElkjvasS5dsfXUKtW8fevLW7gXP4AHtr5+dlX6a4AIhT6EFkbR51oo/
         XugTwPY1dIi9RQ8idde0rICRpnmowqKhKKDj3nkp/Zs5LpdFW1iF06XAm/Xp3jC9K4zl
         UP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389563; x=1780994363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WW8A+O5CaCJo51Sk2hlF19QmFYNNtctthgExs50X4Uo=;
        b=LLTYJaRAx3VLLiwnaC9N6+QnTUdAolpgAW2UTrs/ns3CnkCY+Y2EflSt7aNoqbphEq
         q0ccDrfL60jE6cbPb3C01emXtZ/g/qSvz5zABAMJ/Woezdhhs3/dAvTyw1U228VuOQHt
         q7Ena+yCxm38iPkKXjDSfkJnqGWZrTPuPJagGdmuZhXQkXLP9ZUMM/Ozhr4O5goWCeFE
         L2oGlktIrtF4pWOiEdeKwnqEUlzG02a6QQtVwg5VUHr68dHmAW7vr1rHLlsSF5E0hDfz
         gxNm+zOwyUgk+FaqEv2LODsWoz5oCtwFjDxxTv4wbw2m/03Wn348S2n6uvtJ3D+qJ65h
         El/A==
X-Gm-Message-State: AOJu0YwLKnVSzwY9HQzZx0aTilUmkSNJVM+wkYvT0Tqv7p4w9Mr3Ba8U
	fwLxx/ghw2lpiJ8EZMTCgmm0F+xjtXttVm07uTy7rrj5z8+r86LQAkI5nWZyDsFBbrIS63aAbSI
	VSTPP
X-Gm-Gg: Acq92OFNckcf3/83D/nhnu1qx2y18z0wNhnZw0voy99ETeliW5MmDtz5zsaFLMCpP/b
	mSNX6W9fHefoy678zm9eHSWsrVTRUh7eSaUTc6u4nmUYS0A9NskreNBtd0zEzzMcH4jFoVwukoH
	7HL6ybIOYyQ9nogCB/I7D35SNmyox0XG2kWOH51wkTbncUGp/0h3QkmRAaUcmn7EwMpLXnLRVxn
	bNrW2axI3WHU5ST9zEgnncpUwlQ970XkVvSg/lJjHRv4THOZ3FCBs7qlfbQLVwRMHcbHLYwCLn+
	950evPc6q7MRYmrSoV5UjLeyCzBVnYUcf1tx7Rnw5seTx3Jlycuo4IdEaNQTprjBJuwBxCZlAh1
	oIfnlMlpxacgusylAeNkYvQj5Q+Y8BUEqxwYgnLH/PnU4ejmw6Z/yYfaIRAU8dmaKaDP/QmlnFJ
	hb8H3ndnJSw9xuCK+mSr61Zgd0jAgt+lzXvWlRglp6pDbZPf9dB9pver4=
X-Received: by 2002:a05:600d:8498:20b0:490:484b:bf41 with SMTP id 5b1f17b1804b1-490a2923b7fmr198737535e9.6.1780389563215;
        Tue, 02 Jun 2026 01:39:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Jun 2026 10:39:18 +0200
Subject: [PATCH v5 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-3-c2b32474ed67@linaro.org>
References: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
In-Reply-To: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6457;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Aivtp95wV2tJK8BU4UcdJBDDqczU83zO4d2Fedom0S8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa2ujjiaqf+MlEKH9YPwoQly9De4MGFYFfBtyZ8
 Vi1P6MiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtgAKCRB33NvayMhJ0bV/EA
 CBOGGvmoU1cjndlXKZv249sw41DMCjRSFbhfYEeAn6HuQXwuqacPP+dwiGLVhowv01wBOSrQMz4+rY
 5KnWsTGf0noZdBrevlteXDJWlJ4mR5h9yqT8amaDZKmAXJaF4itmB0vWRfyNbBb8WVdpc2IH2HNe++
 207ThWbD9prVhA8/vRHv8JK/JVNiDTGbuRi/Xl2bKH26i2fUH+6MWKyGXUifgN1b42Rn3bmkAAJyru
 SyI6k3ulHBh6JIKXsihanzlK2vVKJWa8itA6M4IF6haYBcn+37HogXmkWBhQl1PTyndCnomWuqOwwM
 kmBYIxqEw+bqBcjh1hI2PhKbW7Hol0PQ1Ez0nYVTot0WXPC9SOGrV9XCi8zH5ANZp4bxIi6AHHeG9b
 0j5cTjPxp2Sx0c2fdDQ1v1/n7TyUaF0B0qqLbw57QWPpRMDXQ54uAKpUI6E2eGlk8nX3/craR7FQG5
 +CwCS5axS8dSSF4qMQopnpDX0qszZMBQaHUU7ynBbT+DVpprWRHS05kn0pM0nML4kEJyg/3fhDenvP
 owdL55cpiCuz56zrAtKI+CYjSc3HIJd//3MqNR716RlDhLuY9VCUqC8vAimByXFnqwbp84eQtGCmfG
 po3dvPT+TAWjE8QDM33Y13s4cKuOSNgePO5/Aci5zXNn2MJqR30CvmjxBoNQ==
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
	TAGGED_FROM(0.00)[bounces-63352-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8740C62ABE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the necessary plumbing into the HFi Gen2 to signal the decoder
the right 10bit pixel format and stride when in compressed mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
 3 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 7ac69af63ead..ca2954f8bd3a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -480,8 +480,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 
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
@@ -516,7 +528,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
 	stride_uv = stride_y;
 	scanline_uv = scanline_y / 2;
 
-	if (pixelformat != V4L2_PIX_FMT_NV12)
+	if (pixelformat != V4L2_PIX_FMT_NV12 &&
+	    pixelformat != V4L2_PIX_FMT_P010)
 		return 0;
 
 	payload[0] = stride_y << 16 | scanline_y;
@@ -531,6 +544,61 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
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
@@ -619,6 +687,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
+		{HFI_PROP_UBWC_STRIDE_SCANLINE,       iris_hfi_gen2_set_ubwc_stride_scanline   },
 		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index d09096a9d5f9..776b21cd11b2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -136,6 +136,7 @@ enum hfi_flip {
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


