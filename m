Return-Path: <linux-media+bounces-58989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH99OWgC4mna0QAAu9opvQ
	(envelope-from <linux-media+bounces-58989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:50:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5303741992A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9FA432840A1
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849BD3B9604;
	Fri, 17 Apr 2026 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDCfGnls"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40E3B4EB1
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418677; cv=none; b=ulB4Rh4Bx7gYoKYnV1GWbHY+TcjZWh4EXfIxQpe8i7rBktxDALCoYgSTYw1/2eRVOSAw9R0KemOEarTQQwYFoSomVgaC/EnyCMesp0wu3NrxG4gY0GnFKfH64jDSknMYk22IsVt6YUa+qZMUWEuJE8Chw3fFsX6cosbQx5Z2IR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418677; c=relaxed/simple;
	bh=bs5ckZUuvVRSX4pNz+txZhVzs8ilhLU/N0vuJgwX+RA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ML4KTxxB2DYpvMV849KxcvfhncilzDZxwf6gzL1Dw+c76t6kmcSUcw8ybp5dttq9qMwyKTB5pHQmWz/f5EmW0NCGJ4JSL/BA8vlLxTzqv9WwT0dD8d3DTrJBZGAs33cZ45rjI4Xyy9E/87n58vLaWo2VmMEOmOjM/ShD9BjuTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDCfGnls; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so3691855e9.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418674; x=1777023474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ldf1uFdSDfjOItd4Grh+k9eom0LIMtCneVMq6WQ2gY=;
        b=rDCfGnlsM6tXIXE1Y7MXHs46NG9zyrn2KJ0+h9CSJWTSOvUwmoTqEd2exP3iJkg40r
         t5f+9Ow7IFnUsF7PUBlGZR8dQckFdykBnYrv19Y6G/wRXolyzbS+Z0frh/3hJmAla1xY
         DPRqt+umrPFDuFgj1Nj7nxo24GZdKUWwNLF+ZM2t5qAvJ8euaTYpR6I5B0y2L6TLuF9v
         wkHXnOl3c4PJEYpkZcStVyHRZt1p9YbydvI+yjQJGY3lbZqxfkhRClENOWvixX3o7IEc
         5nULIYI/iHHtfaWoKmElLdnAb0ZasJW08YJ4q0hKS7RGVIKM5G+kH3wiuzVHY7+Yklqq
         Vymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418674; x=1777023474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ldf1uFdSDfjOItd4Grh+k9eom0LIMtCneVMq6WQ2gY=;
        b=cvjV8UqzL6J+KuvJ1xofUIRvbeX+Ryi3j0sSNItdROXIuXc+hx7ZR7DdtgpnH2+hq8
         KT10iYVWNLolT3ME9knqVYqM06sAJcOXpo9fA2X4DYIE5jc6E4s9MaHOnqNufRr8rbxs
         SmeYDwZuvc8qN/kLffCeC8Jj+EEFQDFEn8tN3RP3Z/zj3mR6390+7SjkHlkvPLl5syhr
         5WmC5UAwtCPfsfvMQiCpkcxFVW0XhkilAHJbD7IABWfsPIZgH/NRXsj9jhFLRmaEYAhF
         pZG14aSMIFKiWf9KQBRDa2b7zc9f7A9I0U7jxv3gZD378sE6bHpp7lXHVYsDR30h1+3x
         vOtw==
X-Gm-Message-State: AOJu0YxeCBeblrms5f20WhvnEX7mOBySozpCc8IricDDWn8D1UL9w6sk
	+tEOSIyK3oJLERD2sxyszV6rIoYZJJqoPcL9pxUwp6ACvNf6z8KKDyveXAeyk66HQu4=
X-Gm-Gg: AeBDiesw3enJwdHk1bR81eG5GKOEb5cRv943hPLY/+WjdWeDK3tFpzccAcHw1PwPEAd
	wS9AtF9BwMf9zPK6geguXZGbfG7UIBrElF4+/Wqc0KBusVoJfpvIDhDPvqcojuAGnddzIH8Vmk2
	pUEzaP3r9Lr/m0166s+cIig+0F6sCSy4CLH7eNAt9jf8MAnSWYlQWMNTVT6ToWcPl5p53g1SW7g
	JWAY8ECdVuuKC3kUImF7dFdh+J6Za8sVcfzaC4XSSIlGpawUndCno74PB+ap0t8wMjwN7wgZIA3
	Ik9X8ueepeil33S1W6fmJ40P1e+WdUDrJr5/4NzQ7OvWPQvuzSxhqhhFZ8Xw/cI4qABVrFDiR82
	4MrYbNZ6enOk3tBDc8ghfqgb25Dh2SoYQkSFUZL6sS05Jp/StAKXF7BUMb8EqIGrBnPvur5PhIu
	7E5lMvNjRFMTPhpVOJ3D9CN2WM4rqlFsX3qmZbyPBJahKJ5pi34kH3ttg=
X-Received: by 2002:a05:600d:9:b0:488:9c3b:ff40 with SMTP id 5b1f17b1804b1-488fb8bdfa8mr19282995e9.15.1776418673597;
        Fri, 17 Apr 2026 02:37:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:46 +0200
Subject: [PATCH v2 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-6-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4832;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bs5ckZUuvVRSX4pNz+txZhVzs8ilhLU/N0vuJgwX+RA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9rlYbfmqCkAGC+AVMVk4EjRNhTcvjja1fbYFTl
 r0xV5IKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/awAKCRB33NvayMhJ0e1JD/
 9wiGObAass/w6jSe/1X5i4slOC21Hsftse82GdPjH0VbgRl7q+izjBKt3sWV+1hCsP173bROHyx9/u
 +V6/pmIbznVdsQTBiNAH6He7A7L2TJsLp4Qvbxb/oqih/rA6ofnbY6u6V6WJdz+r6rVNkO0p+f4YUL
 AD6FgHSYZrJMayzsaFJjU8ZHMLbIrQ/BXdKYt/qack7CwfpYCloCn7dnGxQttQwpG+I3bwur1o3gwk
 TfWmbeuuEWYqrxt6r9q9MPVFbVS7uH/0of3R6GHQ57H15yNozHsgpZpFcmw80dEgarl5CSANkHDnkl
 rJbzmP0cZqbaBrNe+rMe/h6AFsmGnXM/TjpxUd1b7eDkEWeFyLbtgWNMkMuUSPiHtz9E77ifl5e4/o
 vjnNmrbWKc/v9vZ3dU/OUZkynDJSqqV5wBq6VTgB+wpV97Xn+mGZRsanTYpdrCwFovTULn643wbGku
 mKZ2N0XTn5DKet88MB3hP7jxnR/wp8deSMl8WBThiZm+AAzO09yvO0akdw+cqClT7Orpt+KFCZZA/Q
 U5Lbb9hKDmQg/QhWUb/J6Tkp8SdORVvxCXfoK8IPnX4EzpNeAb/1uFemd/2bVeWKzaTgsQeFefHVrS
 L99Pp3zbZFTpx+bmDuBmdhp9CL6VfjxYa8YWGSs9VdPQNJ6ERjCBINxmiHcQ==
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
	TAGGED_FROM(0.00)[bounces-58989-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5303741992A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the necessary bits into the gen2 platforms tables and handlers
to allow decoding streams into 10bit pixel formats.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
 drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
 drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 0541e02d7507..b6d815c01f1d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
+	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
+	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
+	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
+		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
+	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
+		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
+		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
+		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
+
 	switch (pixmp_op->pixelformat) {
 	case V4L2_PIX_FMT_P010:
 		pixmp_op->width = ALIGN(width, 128);
@@ -625,7 +634,12 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
 	inst->fw_caps[TIER].value = subsc_params.tier;
 
-	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
+	if (subsc_params.bit_depth == BIT_DEPTH_8)
+		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
+	else
+		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
+
+	if ((subsc_params.bit_depth != BIT_DEPTH_8 && subsc_params.bit_depth != BIT_DEPTH_10) ||
 	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
 		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
 			subsc_params.bit_depth, subsc_params.coded_frames);
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..16424d1e94a6 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -25,6 +25,8 @@ enum iris_fmt_type_out {
 enum iris_fmt_type_cap {
 	IRIS_FMT_NV12,
 	IRIS_FMT_QC08C,
+	IRIS_FMT_TP10,
+	IRIS_FMT_QC10C,
 };
 
 struct iris_fmt {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..ceed4b5d96ca 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -56,9 +56,10 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_HEVC,
 		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
 		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
 		.hfi_id = HFI_PROP_PROFILE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
@@ -287,7 +288,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = BIT_DEPTH,
 		.min = BIT_DEPTH_8,
-		.max = BIT_DEPTH_8,
+		.max = BIT_DEPTH_10,
 		.step_or_mask = 1,
 		.value = BIT_DEPTH_8,
 		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -866,6 +867,7 @@ static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_OPB_ENABLE,
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_UBWC_STRIDE_SCANLINE,
 };
 
 static const u32 sm8550_venc_output_config_params[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 55c4acf1aba3..3b18bb9bb71f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -76,6 +76,14 @@ static const struct iris_fmt iris_vdec_formats_cap[] = {
 		.pixfmt = V4L2_PIX_FMT_QC08C,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 	},
+	[IRIS_FMT_TP10] = {
+		.pixfmt = V4L2_PIX_FMT_P010,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	[IRIS_FMT_QC10C] = {
+		.pixfmt = V4L2_PIX_FMT_QC10C,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
 };
 
 static const struct iris_fmt *

-- 
2.34.1


