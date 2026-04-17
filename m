Return-Path: <linux-media+bounces-58986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMaeAhcB4mna0QAAu9opvQ
	(envelope-from <linux-media+bounces-58986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:44:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C12714197F4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5463930946EB
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000383AD502;
	Fri, 17 Apr 2026 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9KlAUsS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BAA3B19AA
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418675; cv=none; b=MytcehHLTLv3NLVgI4/eTsk8lw592Sjvf3soWz0kEgy5qsjaHScWwSeZ9FVAYqr24k3VJ0LIplIMu9sSkr7QVhrFSQyLSiVVRr/20CvBHJZ5mnqj2tLsf4o0x063BymnbXU9UWghqPOYQBA5HBLiXImN5VcvFMxSxmttWFvpFe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418675; c=relaxed/simple;
	bh=vUdFYSgnBSzZgk95HkEcJ1yBIuWlbgrBUX6/E7cKxlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bT+icHFuiZbJowCXGe4n639FX07KLeJ9wVGbLc3ymDzdQYFDZcXSTtPpLqeOvlVTUDunkM4mVeNm4pxO33BUopp107B2Tx2JYGDuPeHs6elJjiaUGeWoIfgIY7Tfa3XkwwTnMBzVTWHoY5sYPpqYXcNR3Y1g8TdSLR7V2Ea0tBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9KlAUsS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso5328695e9.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 02:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418671; x=1777023471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDbXOBlWoAeeu3uACVssb9h5dacPl/RzVtWw9N7wjaM=;
        b=g9KlAUsSLDGNi3Ws0i7tAPRAkWWylpXlfaN9mjKI3+q4RwhibovsCok8j0klOVBl/W
         EbPOW/U2GoKAa7Ieu9GF5MGiC89Vr2lycQ2OASbTsHD3WamygaORWLe2HdiWUtB7jHuh
         WSp3t6O1Oq2J3UlNeULGcKxUYNjCfl1owDo4yhiQT57/ZCj63QG4exXCXLu1DJM/ZuPK
         xNHLY1qmPXxvkbOUv74GJzJCjxSdE4oe0tMYII0FgK28lVuC6IbVlbuGCRtRpYTQLTNo
         q0i11F9cbcAVO74Ze7XNLJEae6vrd/J7BlU+9jjgMvOBurKh+k3dwvfXw97MuKVY99VS
         rYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418671; x=1777023471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WDbXOBlWoAeeu3uACVssb9h5dacPl/RzVtWw9N7wjaM=;
        b=oZ5MPdOn/CtScvuF2O6aBDH0ABaQHfUHyzkYGQ0zo9sr8P44gdXEBt+aSKxfXoNKyJ
         7MyGe+k5nBD/3DDhAk4/5LVD1Y2S50TNz84jR2jKdeI/EyQN9/x3DGdqKueOSIWuxjOw
         GX0M8+zmnRamt+V0SLhTXppZ0pY5U0mFqnzuCKuxg1kkkfRDdgFUIjr/mfYTDs7C9ozA
         R6az9TxEp7hSYuB7ToGnz+5axQJZcD3vu8RtZalVA81ADESPgVbKRI4QajBs0R6k7RBJ
         9MDHJKLbJ2AHFRWYtO7zg0WtvXX6ty/6BCHfho4xFQ/+pE4fqZ9rjkJikaRjbmFVEmR0
         J90w==
X-Gm-Message-State: AOJu0YzPH9nvn8rFaQgTmRIMpOuyn7+vJOypesMRUQLCOX6SgWiJTPTD
	WveG5j7+AaeByrbsC12F0seIx56sH64LyB6qA/n8VjOxSZFnmvSc6AQYK34i2pxW84w=
X-Gm-Gg: AeBDieuI5HediVYlBru7R8nlOkyUoFbQb32q3B5BPQUeJ5lSL7tyngSJrmigT9hTaN7
	1Fs+aj5TJxxqJoZiewB3SFkmQCq+G6dXr6vK2mw0MRVNo1EM17Jx13hudmKOxhpOLK7xYzTUSoa
	LTlFOTNgLnHIKQgZd32pFfanIMbihxlDAmqT+OiQJEVFj/iHt6ZGx4iEyKJFx8enENCcuLJu1vZ
	/gBsW6EanbTtDfMobANnItlun/ZjMnmJ9LhWRY1Wnmhzzorw8FDAz/ddBZG5ET/H6/B1NqPB2SO
	BDJht9HLZDz7HF/CJ8d4/i/TA96ei88kDFToWdcxJ6Ph6Y1lOsBR+ogRFOI/JYD9ueEnk8QbT33
	U8YpWyBH1xXjQONW2lKgFHZkQBKFFuGEI+SAbHQtjVc68QRacrLyE2fwFq9yZhyBqDT/Ms62MEf
	6NyhSnOc2r7Mlq/7ygeEmtAhOFlljKFnTCUXFuYP0yYqJudhdCxa6KIis=
X-Received: by 2002:a05:600c:3513:b0:488:a977:8de with SMTP id 5b1f17b1804b1-488fb77a3a7mr27141775e9.16.1776418671041;
        Fri, 17 Apr 2026 02:37:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:43 +0200
Subject: [PATCH v2 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-3-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6219;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vUdFYSgnBSzZgk95HkEcJ1yBIuWlbgrBUX6/E7cKxlo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9qPEZNzp8pS+zT5//LmokfgsXW8PhYSXhAu2zO
 otwm8MyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/agAKCRB33NvayMhJ0YccD/
 0bGHzr6Z1ikdT6xxRrQfdd2gf0IJRC7MD2Urjf1LLXDKdPpTZNF3n2WW5sW5Gp2/cYqznChEB8y6al
 UHiMh0RT7uXBxoM6zzlglkcJ7scc9zsU8QL+HRWeb0hwdPrTgjVdICTJACv3cSznSHZqADTutJTTzK
 qTFECx8j+86RXphU9TCI+e9MkOm6gYNXqhuCzZrxSiy0wbsJI7qHPhat1hWW3roH0lqKvPjuyI3zjr
 SjU72rcjj08lc14hvMXznDluuxVYrPqJG2m1tIWvXvweLSPqIHyVz/AR5b63myNvzKpiv0LlgdNWTC
 3wqUxMQrQAyeXOAH3AbAOQLCqmXmNi7xZ4loQLtfuw5u0t8wPLXZxGFaiWNVg4DNDgQPUj75GDXU26
 NEof05ZzJ5UH2jecsAe9es+opmSYHJ8m98uJMB7mzDMw2Ag8b/oG3HPdxQCPj8kdiJP7SUYpbxuUG2
 IC47dHZ8raJWeUNFJDDqAtdrei6aSsLSOTTznfTUo2qaWP+MEt/0TZUhRDt4qeAaw3wub4crzSR3xt
 C5Jy9q10XMvbysIdLR2Qy4jnjhGdhQGNDL8DoBI9tb5bXg/rA5budsaptELtWYqz0EAn9OGyAg8xuu
 1M7u46GPAf+/1hYF0F+01d6ufIu+PxrGBXS7DBhQUfM5Arc6Iz+JD1zPPTEQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58986-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C12714197F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the necessary plumbing into the HFi Gen2 to signal the decoder
the right 10bit pixel format and stride when in compressed mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 +++++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
 3 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..d664e606e886 100644
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
@@ -532,6 +545,57 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
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
@@ -620,6 +684,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
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


