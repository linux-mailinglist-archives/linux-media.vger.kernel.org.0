Return-Path: <linux-media+bounces-58275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNTUJWWH1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:50:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4F3BF195
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEA9F30A5066
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4133D75C2;
	Wed,  8 Apr 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fSxqyoC9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66D3D3328
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666646; cv=none; b=LMxzs9iFXp/kBKcce/aFoJ6oN/YS0qmm6Wg0aCJ0Zief+EnkSl3SsjsxF6Mrl3kw03TBjlMM7Xug86qzffDD7na3q/nELtwPzp6QPpFdQF1HSvbzJogQqPGrddQ4Ey3pO0n8K9/bQXexNcfWGyqa+dvxkDz9SAYNcJE9Lf0PJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666646; c=relaxed/simple;
	bh=c5lPlNh0EIIjXAYuZG/IE0taKr3/cGQrgHpPBW+1/eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7HB98+0a22/gVcz1fMdUob+U1MEESz3Lu4mdi/5i+Twz5jRIpqmMhI2g1qiFUkFZLmauDcopcV+6gUHbwB/WdgumEew7ynRzCMMTzbwrmIbcBmBs6Dj9sTF1XqeJ63Eq4bJ3zIEoMDTaUhcdQJPFkVL1BCChMJlGebD5WtSImI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fSxqyoC9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso131545e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666642; x=1776271442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wNBkrMYpeliqbYGaP3l0VZbhejzwqIXrq3NicZEUc0=;
        b=fSxqyoC9ZgYQGKjQyvJQEJZ6Vjh5pudkWLXLiIYWcxhzgm4af3BdRoHEQAW/WmKysj
         UtvWPizBJe2qANLuPdCrfPDnjCFmrYLa0O4AIs4KPpNc8/h5yNgal+povbwTEiJiVjn0
         s3PlvU7hzcgQar+uWhvBib5AZULf3sW9d4/UUjMm1h+PvHl9jxjhrSCyoTNcrjBn3jF8
         DYNIHlPO9PZkBqJZLmgewc2AhZhQjG9svINWPKqZrsXjYOGdRwGqDeSQdQAy2qVkxDPH
         MlHgpFcLQLsXbcsm1e34O1aYizNEnu8Cbps/7xKU9uORbILKWcdQBH1L8mrpYF62F8ek
         5Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666642; x=1776271442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wNBkrMYpeliqbYGaP3l0VZbhejzwqIXrq3NicZEUc0=;
        b=TwIlKsRN5R8wSorxDfaL1FnsWFCHtPtGFoKpbmeoxDyR6SsaHrbY+6xyJ6byGwAUFJ
         OfecTVpFB0J8UT4YgP73pVhGUngMNXQugZueazSOFycN8bjGEXT6YVHwEn8PwPmfzJ7A
         pRegOloeEgsG3GDgNbmhKTzgzdhT8c88qHOBEjutUVpEcQPJtmOSvQ3SKuOI672qvbjP
         bwH4+YObLjUx/J3xalE7yH63s9hANw2Xhaaeg52IZJjIGIoXBYlNhsGf4Qj3ahWXp3Dp
         VI1IOz7bJuxpqpjUn7dpADebFC+8BxT4vZP2mxAq1zG7zkeMi20YOY0K8dfNh5wSzr9G
         +ndw==
X-Gm-Message-State: AOJu0Yw0Coqq6ZjQPs9LX+xxpVPAD/2uH60mPkCd/nhAiTeL2kF+poHn
	R87aBZTxL+ZwmzH3KqFB68SdeXsO5Z2Hdx8Ay+vK5DiN+RMJdXNkJeFu5SGObrgQ9KQ=
X-Gm-Gg: AeBDiesyboXMt9Hvd45anz0T4G5nzoerOGhsp1muVo9HMZV1Swy6mkxzs5ZwBrQ7DYU
	H4+ud4EA93rQH91NYx6YRCRe0sddXfmwj+5y2nxgHg65ZHCdAueUiY0xkKkLn3DHhyfe8JkRfEQ
	SQwNvTco/xZJokbeq5Ov3na+M86hWG6N23QzWP9hkWEkxwN7q3Rzyt+xksTRKGgRhU/L0ls6cUl
	o1+3qAntDLc/Dlf4HY4RZZnhr341Ah4QpCFidQy0oXBiZZCYnguTgQ3dZn+Z0DqlLDBc521XG2S
	jhnZNCu6MIwhG5CIUwqO/5j0zCY/M2z1KegneYPlCLPlBKkrptrFCFxfdmgVn3Cr/yReD+J/EEs
	ppJuenC/c/iVWzyGPQ2iTExJLvJdbMPNyJ0rdRDJM6BC7y/kyAThbxYCyr2myAyOCLIlfXG8VQJ
	Eqtn1/1YXLFZXTARQIk5hwoV5ezLP+k/hszY78KdjM+3pG
X-Received: by 2002:a05:600c:4e86:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-488997c9b69mr290314325e9.29.1775666642079;
        Wed, 08 Apr 2026 09:44:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Apr 2026 18:43:55 +0200
Subject: [PATCH RFC 2/7] media: qcom: iris: gen2: add support for 10bit
 decoding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-2-428c1ec2e3f3@linaro.org>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6275;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=c5lPlNh0EIIjXAYuZG/IE0taKr3/cGQrgHpPBW+1/eg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXM4v2u7WSEOrvO6Ai6v6Laxvmc1CiZVsj0+rq1
 8ktP496JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFzAAKCRB33NvayMhJ0QlXD/
 91FiLAjcUjCPZnD5YHGbGjqKonIrG7+GFMAXEJaURCZI7xrew0uCkVv/jD+gnl275gJUNxVOKXlnCq
 ZV5oyNWKsua93VGk0T0L/LunOoQ1NDNq6Wp9YRX33OsdqApS0WlWRJ/XlTEGl94ESL+3IL/BjxXng3
 zfZv2Eed9Y2TVx7ccHUMM4BDN9a5aqpLRU8DCBOUbIYZHa/G9aHvVrVIG6JFpNC6THyaApiGaMaqwr
 98eC1QKSG0lxiDJWwNmdLLWIIjG39Jty6fnD4rfBnT0WcC8unTmBdBv5YuvBkIr6FkZ0kPpEIvBYTI
 rUYmVBEHsEAS6gE+KuZouBMrcsvDPe327b2fhMCq6HZaCSk+mokFy3tCrmrSXlJ9gAcfoInUj5pNZ8
 pnpcI1ixxs6Zspz+gx3JkNJDSDQfhMOr9Zf8NopVAs5Qgk48qskzYMBskUp8HqrR/AdG1UjuOffCt4
 2rK8Olz3yoTv/1bKO6PjkXCvwi9Ko0ZRau2hpVnqtI0AwqRIdw30cI2uFjDQRcuzX9z6euCc34Kdl0
 PLfqkRd0MpGvidwd4uw0ZV35XxqRA8TV+5fBOpLkuJnHoPa3ymCno8mpmNT2CfmmEM/w4uSH9MDFYS
 US4JgHKlOMDiOu8S5daaXVmODG84bBw6FlN0uMXsZKrDs4Ch9hoPs9z1UJNA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58275-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 43C4F3BF195
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
index 30bfd90d423b..8e547e390fa3 100644
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
+		stride_y = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+		scanline_y = ALIGN(height, 16);
+		stride_uv = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
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
index cfc5b576ec56..26f51a0ccd04 100644
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
 
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,

-- 
2.34.1


