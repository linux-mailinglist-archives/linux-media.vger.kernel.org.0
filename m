Return-Path: <linux-media+bounces-58276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMJrBCeG1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:45:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B6B3BF0B1
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BC4030166D1
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344EC3D7D7E;
	Wed,  8 Apr 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pk99o4D+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A13D47A5
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666647; cv=none; b=GbEBBt1vV3O2fQtajkvIh7wdq7H0Gf7HFVGwksRDmZvTM+zFiwaC3fZThJBeqBHsM/68RrZqnjnXOkQWitUZHYsDe0hBOB88E6PAqeMalioa4QsEtD03RSVn701Ofn2Jk0++x+IMEYU8I2IvPudrLYlOdwr2yjRFh27uStJIRZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666647; c=relaxed/simple;
	bh=tKZadNj62OmxNTSuUaJwBgBko5grNq0eWhaWbj/Mau4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mEa12hhI7hAFmANpW6X5NZZSKMGIIn25pZyDb3ISkDtTBJ+KoaT8WuHuSq3xY0d5PpU/lanlN1ahYrqB6QVfatvqwlXjf79rG524iZn7UIZKX+9cULv8TMfjdu2AYeejU2D00BDvtvxG5wWtkLaFsbKS2mA9+qMwXn8kFjYjpMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pk99o4D+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4888375f735so208045e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666644; x=1776271444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GSrZhGrMMS7PLI4vCkRGCJCpMffY00f+pIcf7FWs54=;
        b=Pk99o4D+2NQKZKVzL5vAwp/nQ5WPMkeqvDsfI01dx1Qexug5LJtU3MRx7vCD1O9Myo
         QOqZa9o58vd1qSRJUolaKzSswpTuKIcg8Wsba1dN2MFrawGfNdI6q+LX2IkumlrXjjPk
         dIfKlfYfrvOVL5DWKbksr1+oVEd5W/da6sOjiYn79Gvw1cZoa9bymDEi5ukPgOGuWtnI
         bOMOetwNlvOJRazPQONBUJAcMkGUqHwXkJdFW8/MIHZ7jHCy59DhE3V6NjLY/ij6T/tW
         oy8EpjGcvS5fyM2fZHot4tKbRpDYMwwLFKlwFXQkhIoZ5OSnGhlCNFPCMCwW2fbmtum9
         cMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666644; x=1776271444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8GSrZhGrMMS7PLI4vCkRGCJCpMffY00f+pIcf7FWs54=;
        b=FcyY4F1u4wu1qzisUvxQOmU8W176uBTPKAjbVT1YNgjTogNGEnPTSV0y2hhOLsqQgb
         ay721VUjcIDf8YV/tgOUAcaADUQxqf2xAPp2K8pwPi0Wiqf/LrOAiTGRNhLaAi/r1CuJ
         kwQ9DQZtPeZtpJa6vr+rwRVTkMa2Lq8OSLKkD39wbAxyAKHR3ZSDrVhjc128LzkhSFcM
         h1pEWyz4yGWfaXivpfzsswt8bTVNVtTA8t7L8Uc2gPblWuSaHiLZ8GFLSjeX3ENcmD81
         uZ4Yx60y7mxWUe1AYHODDxqS2dMVFoH5NBeezf/Idx4yJkfb3dFTXcrJrdfP0cmV4eo1
         ekzw==
X-Gm-Message-State: AOJu0YwwDwgnWG2hGq6sULpGYHPnUFhQ/FxP7QxNSjqg5UHgUdIrI41h
	TJpjJegWFXksq/uESDnyLU+BcDp2IYfN+pO2l9F6RP0XclGmYgg0zxgSBmawRr+FZ/s=
X-Gm-Gg: AeBDieuI5KEdSqE7FkPZmMoE2ZHgF/4R9a35n+MlFR/W0XXmWApJFIK55DS0DvRCy66
	mOdzdMzkDaHBsGrcJ5axdfQYgGYpYRVSibu4R1MNzynyMC44DoQZYBz7FZ2mOJuGRggTce72dw4
	SkFDGVv9eaX4GzLL/AF+ZtxQVg9P7gU8a+HgMJQtlM+kj+K9QCCQhwp+XnmJvhNV2WlDfn/Phuu
	RZQuaIMrVXaROmHIKE5Sezt45d8IQdCFjNFN3lJYiAIluXMH2HEibdx0H0C8pa/xgqECZ7/uG7W
	KLwVU5NKr/O+VaMruv+DEyag3o0KYcz/lurfAXSfee6vBEv51NECrQwznscL4rjMFB/YqN+0r6z
	BBal7DMnQNioa5gaBfAg9q6jjj8vPkdycCZJA3A4tSfMUBDo0shaFFd9mryui2wSuk3516kiRN9
	PAdVdGCm4355TDsQDm7/HaCnGHNuf9khN9mxy4yFfRJiUF
X-Received: by 2002:a05:600c:3042:b0:488:a25e:14b2 with SMTP id 5b1f17b1804b1-488a25e153amr166289505e9.9.1775666643572;
        Wed, 08 Apr 2026 09:44:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Apr 2026 18:43:57 +0200
Subject: [PATCH RFC 4/7] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3483;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tKZadNj62OmxNTSuUaJwBgBko5grNq0eWhaWbj/Mau4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXNMb8pKfGauCuFVZFlR4JhylXbwSLWdV8fANt2
 6pdcNw2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFzQAKCRB33NvayMhJ0SmHD/
 9uE0edCR7hU2yqbFPp85j+X6H76dYWMU2eX0QXvDY9OVIVrO0RRQ/WKxchHnm5wSrYg+6ltQAGiTbI
 NCF0HcLBM46zsGT9P7CDHgzfuLZ0Sn9Dq31wNDSiBVRUitTpX3RX9AGnuN4Y4sFsQP6Ic4rvrpV7pf
 v21P4THh/VnODzwnBooxLVaRQk+90Q0OAyb6wbRr0484TIsNPcGmIbvFL3Si1Qeg7DrotMa0kDLDwK
 ttS8Ae+9Gl0JoJKIRxx/8ug3tR/eiZCVFIdBW8kIRUAwWMopfbBSRw+GU8FCnkAcCGJFHVT1gcdQ6B
 NQp8M1CcreBonDy/rj6zsc7z+LIacLYYcQwbFegRz77caeg1p+BHMa2sfFi4U6nDy59akozxuMdy3G
 OxUu4BdL7ZCg4q4/76f3xlszpsJ2LzvQFctwptY875oXTSmz1uq44DXsXZOwSugLLgsw7L6ky8Mk0W
 RqpdG3TlqzvRV+gh0aCuecyhiSPk3kDyH02R7/akE9wlTf08x0IkkyfWHWAmXEv/DWRb142Ju5timh
 Ua2CGHRx9Bgki8tQwiTxxrYcczAwSkRctVxobYu2zUnD4BK2n5YtB1yj1zw7zFPKLXAfAqOtjjKt1o
 PL46vun6V7vCy5tHplafxKnfGj6lB0wQBsZ/Z6bEj0+24OhyjJXWpjPA/8yw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
	TAGGED_FROM(0.00)[bounces-58276-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 11B6B3BF0B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gen2 response and vdec s_fmt code to take in account
the P010 and QC010 when calculating the width, height and stride.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c     | 19 ++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vdec.c        | 21 ++++++++++++++++++---
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9..d268149191ea 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,9 +542,22 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
-	pixmp_op->width = ALIGN(width, 128);
-	pixmp_op->height = ALIGN(height, 32);
-	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+	pixmp_op->width = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
+		ALIGN(width, 192) : ALIGN(width, 128);
+	pixmp_op->height = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
+		ALIGN(height, 16) : ALIGN(height, 32);
+	switch (pixmp_op->pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_QC08C:
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+		break;
+	}
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 
 	matrix_coeff = subsc_params.color_info & 0xFF;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..ca0518c27834 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 192 : 128;
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+		codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 16 : 32;
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
 		fmt->fmt.pix_mp.num_planes = 1;
-		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+		switch (f->fmt.pix_mp.pixelformat) {
+		case V4L2_PIX_FMT_P010:
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 2, 256);
+			break;
+		case V4L2_PIX_FMT_QC10C:
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
+			break;
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_QC08C:
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width;
+			break;
+		}
 		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;

-- 
2.34.1


