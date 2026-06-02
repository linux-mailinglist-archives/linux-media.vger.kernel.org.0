Return-Path: <linux-media+bounces-63355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEWjJPSWHmrPlAkAu9opvQ
	(envelope-from <linux-media+bounces-63355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:40:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52F62AB88
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C561301642D
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729FF3C9898;
	Tue,  2 Jun 2026 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEOjrJuF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF53C8724
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389571; cv=none; b=OZCeF4XSke8iIZ8V6ys0Yvl4CdBgyXufi7N5f5f74FxWyVEtO+cieb9dSnSJx+L6WWb/VQXOZ4bEc4DpSrJ+nm/HwevMW6w8bK9Kw7ym/YYjGE2xEb1TYHm4NGyo8YFi2l80MQQQ4GLz6cJGO0qm6op/KnKPZ3IHd0jsbEwZsy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389571; c=relaxed/simple;
	bh=fIMj9J3bf66tJ0SCujCc667QSjtjF1FCVosD2tmUDVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BenE+eAmbpuBziDcDg0No+PQN+6iRNDvYwsJX/3BZARAkPFb4hUTgdm7Jdtg8oGM3FYkQSUIgqbRVrmbCqQ2x51vHCEbGy/rN7OcJNTTsTmg/GuFw3IHvn/YWymNBmlih84b8wcqFIzEqVS9qE6Jqd3VrFBbY7sznT3+yHRnTu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEOjrJuF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4905529b933so85809125e9.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389564; x=1780994364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+d/vjagw3btqR9jRfyvVTPfDk4CiJBd17ayADhnvx4=;
        b=HEOjrJuF5uLjEA6+D1rurpIWw43TfzPfoX/RV9SG1I1keGE0/3V3JbnuA+6SCUy+VB
         Jh8QRbWXRAk9ZnJv2Y7gWB2PfB8dawuJBHlmMV2kBpuNZ27wItDr4LgKeTG3LifXijjJ
         V+Xr8/KNjI0FINByiZiwIasxGtsRyycKJJvCDqF0RxJiieAikjb6qC+y9GCfaejB/+n5
         5Vj+wf8V2P/jU4jw1X8Bz8XE4Z3EvoTfLFKiKkeGVnZUIjsSgjKNIxsEzfMIQCRWiT9c
         7zKLxo8NTHmejNcW18Dj2hdVEOt6vMmJsUtzEF7vIT5YV/WpCwC3w5sgN1ZeJyhI2Iaz
         uygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389564; x=1780994364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x+d/vjagw3btqR9jRfyvVTPfDk4CiJBd17ayADhnvx4=;
        b=Z0IMw9PgWwEhRpgxhaR6YIJJWRI5MpLsFaBpP8k8N5kybE/R/bnTft9V/iaI/qDynO
         fO3LGV/pqBmqo1Fxzspv5D5GG0/5Q2RRqu+xi0eEJglpdG5roN0yMGraAFmX+0Yvdxyl
         ngguhPbuWAK99yWGXVNyI/Q2XUoooVKzRQfHB7BI0rPd143SnvyY8Xhp2S3A/2NGAkB+
         fMiMd69hiFufWx2NZ77owWzrL6uy1ytyUwb9iNOchdSKJ2rr/Q5X7jUjhl/Tu17FVTku
         bKclqNc5cck1qzlO1eky5GxQTX03d3T4alVRi++WTFGJj0x3JOaKn18KvCT1U6/UA0kV
         vGGg==
X-Gm-Message-State: AOJu0YyVtOpEevuZNlNCS3F5uGazGn3jJkx9ft3ofXSuUdcdJaikXyud
	1R+MO7lWo3sf4SYn/Y46fmb8Vh46iLjGdYV0ZRln8QoVlFckCLQiiNrRw+TFPcA6f2ZKcoQwgvX
	MnYGL
X-Gm-Gg: Acq92OGyhl4LgMJA7P6+WgNIYOqUOtpBQebQCVGPxkPxA6vwOcLfd0B6CvSXQu9i6bI
	xEFuhPsISyfU7jmpJfyKy7lnBqbVe4XHLuywLAN1tKYBj4OWfoofimBw2BzY/VKWqFPtf/pFB/q
	+d+dfDR4hiNrCLl8grcOGRABb25+2IahaGhKQs/7MhbPHRYcKsbUeDoj0U5KO38HQKDYWO5rSw9
	Sosc/QL4q39/Cb7d38xQe7tmIooBclNqsEZsEepJQSHvE7Q2b/jnH1PIBo+tXwq5tOMmyYryN/C
	HWPZ9lpMoL2yJZ18mMYtitErkEemuSJPy2bCm50YWyyQEMzPESeRGogylELJQGw+TMH5Mk93Wxl
	dRaSfCpytXp8GPAdYNGLJasJn0B7WjRruvoamNr6eWpTGdvKGB8f5XMmpKF3vBg7Kemz8iv///V
	7RURBEnwBWTWUM55U1BJmlfntjhgrArloPu6Q3x+YlOIahJa/SUPaIMIKEdtYKrvd8cA==
X-Received: by 2002:a05:600c:2a8a:b0:490:6869:7d8b with SMTP id 5b1f17b1804b1-490a293cf20mr198069715e9.15.1780389563957;
        Tue, 02 Jun 2026 01:39:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Jun 2026 10:39:19 +0200
Subject: [PATCH v5 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-4-c2b32474ed67@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3729;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fIMj9J3bf66tJ0SCujCc667QSjtjF1FCVosD2tmUDVA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa3IUPhLMJS595Po4f2N7hGKHKchnIkrmXC55UO
 1+FmtNWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtwAKCRB33NvayMhJ0fCND/
 9kh4aCyBLUxSs/+3ucFkXWirorf1+bV7FNNBmzNeRH5c6YDWV31KsLP0WSCPxIPVW+x4BY1MJNy5ye
 T9htDNR8SQy646PS/nC0y5BaMFTHCA1vgafDHX+PuA6Z/CGFk2BrrR51tt3UMm26h02XIyWmf0viSV
 C7aIytsrEnezFJRwaJO37pqRbbjulVKWzGngJOAv4y97aQbhIcSOsqnOkbkfAGmAAz1P1CrKIVjuwl
 sWEIW9/vP4kmlgpv8Ia90+hjF0UEx+XZU8j0XnnhuP1HvXgg+oDqcDaEVNcM8Z/P5VGSJxy11KMqtZ
 JLouLB2wKjaAAV8L0NI72YRizVQnKEUmGH0n8QqiR1trO/HpxYkjgZFy7MI1fUP5R52+NHt607gj4g
 /btiSuNW9o0R6o1cZDslcAotN0T3dP+MFs4baIGp8nzrDEBqCj5jqKfwabSEcaMohBkn2VGHBOITBw
 fvhw915XOXGvi2QW2M/PEjrQiozETAvRW7zMrVW99vXWEQqqA3dRdHX9SScghPU0vMyykePC7GWyQh
 9YYfPaAgMaTBj+yllna4h/FG2sySmtPA023VIB8Aya5pu0hUb7IwkIhRK6RQ+3+sqNCZWVcD6PsuiH
 dQplDFi3NZDguVO7c+gv5cEqIR/+oLcbJuNE6iL3dRObFppKe4kPBXOqfeZQ==
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
	TAGGED_FROM(0.00)[bounces-63355-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 3A52F62AB88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gen2 response and vdec s_fmt code to take in account
the P010 and QC010 when calculating the width, height and stride.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index c350d231265e..aca90aab8548 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,9 +542,24 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
-	pixmp_op->width = ALIGN(width, 128);
-	pixmp_op->height = ALIGN(height, 32);
-	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+	switch (pixmp_op->pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		pixmp_op->width = roundup(width, 192);
+		pixmp_op->height = ALIGN(height, 16);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_QC08C:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
+		break;
+	}
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 
 	matrix_coeff = subsc_params.color_info & 0xFF;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index b65832042dc8..92e9201cd3a4 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -263,10 +263,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
 		fmt->fmt.pix_mp.num_planes = 1;
-		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+		switch (f->fmt.pix_mp.pixelformat) {
+		case V4L2_PIX_FMT_P010:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 2, 256);
+			break;
+		case V4L2_PIX_FMT_QC10C:
+			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
+			break;
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_QC08C:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width, 128);
+			break;
+		}
 		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;

-- 
2.34.1


