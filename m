Return-Path: <linux-media+bounces-58279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHX1H5eG1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:47:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 809623BF0ED
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4C0C30359FC
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1628388E52;
	Wed,  8 Apr 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZnsHbnW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D83D75D3
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666650; cv=none; b=oZqRG4gTcRsajxaQ7Tvri2kxF0gHQ714RO7+sb5cG6neDdmidtKEH7Q2QlKaLzaOmpSHXlpn94pWrPkozdB7dOQzqxhuUFghbrDGjhlPsO5lQDBt5rfZTKd3PUBVsbp3ISEbY9m/SX6wMtYZIM5nyKgS9r14xmppu+wOi8MGG40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666650; c=relaxed/simple;
	bh=Pv3WXhLZRgadgKs/D3CNpusvBmf28aSbGVznXVjNR9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZLrFBk39jxQsj2Nx7EMgBf4IlyOkRjg6Msj40R0Mlls8UUUviCYARQsSgiXPt1Uc2P+05TSOB/mGM5qeHO91xPxLyBQVwgpE+uwqDqY2ENf4ee6eZIG1JiK3kZ3O2Wzoove+YNlXmx3nisIau1NbnxukG1M+2t3/A22LaHEuLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DZnsHbnW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b150559bso225875e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666646; x=1776271446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nptkqOjFeBpyXOQIP1dOHpLSAoF5pyC2QiOjnimNHQM=;
        b=DZnsHbnWyR4gzzdJuyUJQMkHMBpJMxd3tfMu3GwvbBEA2ujrdqCa4MFuC9MWZrBmVU
         8Vlbxye2FlACd2xT+n7gkBt2Qb7MbOAJmlZSVsuROR7u5/ucTM6u6OyQno+cmnkn5t2m
         jaNrphzhirwos8shwciDrDJvq1bUe0CjdqXL6H5i+Mfxh9MItCXvuVf5cpMiR0y8ucqk
         g0HuLJ4vz4M1cSp7p/HxT11FjjB2QcVoDl/ZjMzAlLQNz0rglXDm3s1TK9JAacbGc27J
         HPf7h/B+3kPyMb032+NxQK9S3DpWh1KVppsOGwFgAsqj677wI6WE4CwuwFSFb0P7aJJy
         zyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666646; x=1776271446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nptkqOjFeBpyXOQIP1dOHpLSAoF5pyC2QiOjnimNHQM=;
        b=enV+KSGZH/k/Jtt/XEX4xbKCMobnth4vt1Y3Rvyr+Sc+2mC2tfc97GyZjiue4J6ZOa
         BKMN59lOxI7Q6QVQKu9m9FM/mEugwe7Kq5iDViDHt7SUwFa/C7BO3pr0KHs8qWWb5cwL
         KJxfZq+v6bxOj4jVy1a/QuMNWBeT4jd2Vms7myWdV0jjf6kllJRbcKN6zbmlKhsOcWBB
         OmuYHOdTWXzvOju3+UrEhb75l3FGlJwhLz/Mp+sVRrwGAICLIoD5z+Sk3cnwGViAEpZh
         zbWr/H5IyhA9I4lBFs4gKECtVSJeNjqZl/amhjbjECekl7S/8wutStPSfQFk062exiVG
         Xo2w==
X-Gm-Message-State: AOJu0YzalLlwBdmv7/P30EnjrwQUX7kbdPgEGNtJFULGRQQrmrqO/473
	PKrPAjqG/ICIHqQCpK73i/3GeKT0HREM3K6vTDtcX4V3JzsO3wjESeLnlRUP19zfgTQ=
X-Gm-Gg: AeBDiesKwUAupWuV1xtimkzim+D8+2x+Koj4+89eKOoxqEjE7sZP0Dp0MC70N2ir+Hc
	X39H5rLkp18SWqs7um0AeGCKfVJAqzSe+g+M2CaSmgDg/WfNF/+90BVa8tzseZKJfFl3MRJuY1v
	3xZgx/opL785G9X8QxtyeNAK9OgRPXuexsd+V9Bi3tkhnQ4h74JaerdhetqIZPl/qVlGl+O6Dyv
	klLbNiwUp3czYXOumTUmxJhvWCfzaZIy6yW13IjRERbP4FXnMTGhIqXGPhOuM3MOl8qGsB+JmdB
	9Je0CXgwBSOmEBvLJQf28dD4+shd9WaVs9dNAA7l14uYkCyuiXArLt42/0sXV+Wej1DRYOoIcL8
	EUUuhfuXL/JpeGrxOYbu46/n6g8lS/z86Ca82k8ZzDjbmLd0Fx7okZmir+uWF0karqh9Krfd8GS
	/Ha4vwL5NIoqzG8DHZ6IUOK5xqo0nZpJtV7FtP1H1N0Ct2
X-Received: by 2002:a05:600c:3b87:b0:486:fe23:1707 with SMTP id 5b1f17b1804b1-488997ac1bdmr319585835e9.20.1775666645921;
        Wed, 08 Apr 2026 09:44:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Apr 2026 18:44:00 +0200
Subject: [PATCH RFC 7/7] media: qcom: iris: vdec: allow decoding into 10bit
 format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-7-428c1ec2e3f3@linaro.org>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4890;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Pv3WXhLZRgadgKs/D3CNpusvBmf28aSbGVznXVjNR9M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXPMupLaMQ0y60sJPtaWa6ocyRH8oEBIEgtvT0y
 Sxq9QHKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFzwAKCRB33NvayMhJ0RQ0D/
 9ozatqbV4b3dVutFLNwp5ap6i8HzCOFDdhEZTDd4yMQTvJuSNSFy4mQIN0sJmw0GNhOWJ+kkoK+dAC
 d3IfzIJNLRiyQpIDJgGwJ6UlAtpfrmdrYYkQ/JgBTwGPHj8/0wvtd1O5J//yZ3SrZIUjxDqn7KLWkV
 ZF9cvoQKZioUZ4SwHh3qRy9NO+O3zYItjMSw6/xf6Sy5DpqompQVvvskX5mBoTtT3iWsc8jvOkPJ78
 IXqsrfoJa59uv/yXKHHSywFGW0kkH5x2qdhnjWKQ+Y4jriHNFypv9VpZt1dg5RAnCQ/3ltrYC3rl3i
 xBH80Px6fYiFcVVgpi721Y8CzprKsnmsZOCUL2F4iQ3g4Rxpa0gNxjCpD+pw18vSfCqSZzbT/22c21
 8fIXLd/0J9wpg5TIv+YAVV5KFEw0mZeP0JHDgSC6YqXQh7IZ51x5XTtDfKvSym0dH9rM1Ecr30ahOe
 X5SBl7cRh2mdhSBdv0UKFgWynVVCiIkxBFxG0pnQ3u3gS/rL3h8mRjjYocKdrCfv2QmJ1KiqW5eh4z
 vdBbg41/ee+5vpklZggWke8cvIla/uPlU3EScrxW9vp3e+iUTShJN93fmIDvzGb5B/PiguqFNFD915
 CvCdN90UK/ms+/XG7jEbVlDGFAi+kNefbrFNktQA3x+GW7H2s9bGtO1iCQYw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58279-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 809623BF0ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the necessary bits into the gen2 platforms tables and handlers
to allow decoding streams into 10bit pixel formats.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c      | 20 +++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_instance.h     |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c    |  3 ++-
 drivers/media/platform/qcom/iris/iris_vdec.c         |  8 ++++++++
 4 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index d268149191ea..85ad43628ff9 100644
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
 	pixmp_op->width = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
 		ALIGN(width, 192) : ALIGN(width, 128);
 	pixmp_op->height = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
@@ -551,11 +560,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
 		break;
 	case V4L2_PIX_FMT_QC10C:
-		pixmp_op->plane_fmt[0].bytesperline = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
 		break;
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_QC08C:
-		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+		pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
 		break;
 	}
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
@@ -623,7 +632,12 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
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
index 5da90d47f9c6..1a80e98fd55c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -287,7 +287,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = BIT_DEPTH,
 		.min = BIT_DEPTH_8,
-		.max = BIT_DEPTH_8,
+		.max = BIT_DEPTH_10,
 		.step_or_mask = 1,
 		.value = BIT_DEPTH_8,
 		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -866,6 +866,7 @@ static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_OPB_ENABLE,
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_UBWC_STRIDE_SCANLINE,
 };
 
 static const u32 sm8550_venc_output_config_params[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index bfc13c1044c7..776504d02aa8 100644
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


