Return-Path: <linux-media+bounces-61068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAAMLJmiAWpKhAEAu9opvQ
	(envelope-from <linux-media+bounces-61068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:34:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B950AFB8
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DD773028D0B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7F73C0610;
	Mon, 11 May 2026 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuEgCN80"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532C3BD642
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491237; cv=none; b=thCPbMngxezyBw4W1fysbjtqaVUmT/k3ilR2mBZ6/mioKkN+sYNkXcGkimVW2DIVzBIBd5KZkWm6YgQMh0M4YlU8Zzy3FtrJQ8763eVDCutJX2qk3HjRi795E7jzBGlaI/xcahAegte5U7llyfDdXUN3hG7xyTRLB3J1sojXPpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491237; c=relaxed/simple;
	bh=1rSEiYXVcRcV2xZexhpwg0dlj0Dy1rXlTjlNxZeesUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5jWFFJzptyjLXVfZpTKF9uOY5lH3ghx2VRPQJF8qmehxDrIC1mIFIibRg2S/5rw+KOkvNEn1zcPTyhLoHBCTWL5O/DAjcDTgPQKXkJ04oT9sN/+8I3JvCUJU8H7LABsr6/oI6xSrhfkEk0B4VSU2xEVJTiM+zNo7oLumOkMBzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuEgCN80; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe62837baso2035844f8f.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778491233; x=1779096033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyBxidac3NtDJGTYfXnUsepNfGEUBvJmRFwXoFqDASU=;
        b=xuEgCN80tBHUyHyarb0IRp4Hv2wu2tDUMwTSAuZsZCkldblYxGnfPoLru9gatcM2HK
         mGr0L3DJ+/h4NYvvd1KIVVstkSd8jNOQfPrgPlPvBpF7HpO/cyYeGRBZ89v0S96sBuME
         KY1MsrKmuDvKJskNk0kFY9QKXeGRcZ2Soe/qUxzzdSUZgiE77Iyb4qUKtehVhF/a47Ov
         Dzh41Wbe2DzpPcmAjaxekbXYyjNbwBWHx9BVXPwQLMCi8kvt/WYfhbyZlfXiK1pE0xZp
         BCbwMZbSqbYfiR2xVgGqtoAjBouoC+iLC4ZHQEx3Gkfhyf6J5TuRcFmk8CLDeHUB9fpY
         6BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491233; x=1779096033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YyBxidac3NtDJGTYfXnUsepNfGEUBvJmRFwXoFqDASU=;
        b=e7cl9C+hvtdQIw4+Fpywp9vBDCXnyNb5SbSLfYRHo4Fip2ohPamvF8pBcA2tAMhSaB
         KRMrs2ZEH4pqkZt0aeMGOnBOmevrlxQKIoye9gHdhVFG4kiiFM0hD43e2ufA5ceeacER
         ay9rIPEbxepSHgt+3tazpZ53Q/3YGOPNrqaBaeX030G9T0+ssNn5cU86K0GnkJ32WCqC
         u5/bs93Zgizbot6pAOdUkPak7aaQXYBfKP8kARMsBoChZPnasZ0zHALU4ZSkFrQWdiyo
         FFY1Y2sFavbGIiZC94UaNm4+HKzl1NipF4XDp7me/vRS+5rbo3VfbNfXFVaP/wSdcsTw
         Pa6A==
X-Gm-Message-State: AOJu0Yy0n2oNG8km6hnk+ZFq2IMFrj6W2bfHfw+K8XUZVS8CCAG1/sED
	5mlPu7MQAvlGcqYlVWl8iwXe/K7B8fGI/SKvNBNg7ULFV9Mg1h1voe0YnOLVk7XONJM=
X-Gm-Gg: Acq92OEA4Yatnipx6RFzwedorpUanzstacjdvd2vjlQm0gHoCSU3KEJ/q5udo7g+iPZ
	oTounTw+WFEHqmOCWjdhIsMpKtkmwtEPg9S5g63yaBFbcJHVtxHpoZJDBfhHojdnmFhIZgfPTnr
	Ur5EPsSlb3gvGtjsoktZ8niTGfC+ERwBh3opphwGqypNWVlDfxsBlJQKRVKQkkhVkppSaznyjry
	AiztBuLyU2OmUrm6n0aNCsgLx7WL1YkoGpgJlKfd9lj/87MyGHzy9dvvrbYMryDWlk9PAcSuBmP
	9XxPl2KHPjdqyrVyePRCA99zq4cqYCNbwm6moZuNL9fdiBH7K8LOTk7eTFylxIFzaG3ajJgCPBy
	Z2AjTsJ4ZquR4I+OMvyqb7dSX93i45AU/C0TdZkan8G5XLs2OWs/ZqWDaKRePro6Ssk+NE3zaOZ
	mKFXujIzOC6uQNWptz/DL70K94bVhHXI+xjhJKqVK6VNzGWOkn8Vz7U2M=
X-Received: by 2002:a05:6000:1acb:b0:44a:8c10:40d9 with SMTP id ffacd0b85a97d-4515cf126camr36818311f8f.23.1778491232973;
        Mon, 11 May 2026 02:20:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm23743240f8f.17.2026.05.11.02.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:20:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 11 May 2026 11:20:28 +0200
Subject: [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6336;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1rSEiYXVcRcV2xZexhpwg0dlj0Dy1rXlTjlNxZeesUM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqAZ9cTMpGz9hHL3CBmXtJTHK88dJ0Grgk0mZxXc5l
 WsCctDiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagGfXAAKCRB33NvayMhJ0e2IEA
 DMCbqHjs29ducCTXdmU6qwuUQ+NxaJrWR9dnYcrQa7v/jJVBoP3yeOvnNFdV5JIyXBVOwWCJS0CogI
 PP4oySZL+a//8nrDW4YTw9ppdv20e67m0XWxYlEun4tk4rabT29tuUmBphOtePQv/25XRY1U0mmKIt
 lNZbvD4S+Pr+cRJ3nnFeyBS6V/Q0qVtvh5n5n+gENjtMJ29FfRiddXYqoEmHT4euJ+DQ7cCq9h/ADj
 au+7EsoC79FLMX1PsXaSjcsBSpcLOTD0v5mwGIUpnDtQWfZE+a9f8mN3cf8EU5FzZ8CRn+Ikltmwku
 a1NFzLYffEwUjG2M6Je5Shve1h8gBfxatJxymmTiyUX0KS1s6W2RDE+f71uSzR3/+A46GIRB3OlYhN
 Xe/UJp7tdlJQUn8U5vycMsRQWISUhP7O/jYXUXdLvYw0tK+vyl2O0cSa8NZ3wXSLMHqZ+HvzQi3r0K
 G4XmV0jXyW114MhiqcKxJkRPtrEr+QMuQ3BNKhPtS56Wj0dO5qdxjDO+kLsHR6nUBHLcPyt0WrVwuR
 Lysua+VsYwPJ9VXSIvMkz31sLRGHIqP4mTlHefqHbOk+AuFE98HQAp8RC6l5g4f1y6HQThdK6i7nad
 oeGivgJxRghJ2QuXURzqsXw3SguMvDta96uVY23x3VRxynmzMOCvE6rg5iBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: B81B950AFB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61068-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

Add the necessary plumbing into the HFi Gen2 to signal the decoder
the right 10bit pixel format and stride when in compressed mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
 3 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..89de8c366836 100644
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
+		};
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
+		{HFI_PROP_UBWC_STRIDE_SCANLINE,       iris_hfi_gen2_set_ubwc_stride_scanline },
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
index bdedd6bfa87a..c75dcb8e671e 100644
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
 
 bool iris_fmt_is_8bit(__u32 pixelformat)

-- 
2.34.1


