Return-Path: <linux-media+bounces-58273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI0tEeyF1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:44:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1643BF03D
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86ABE3014D84
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA903D3321;
	Wed,  8 Apr 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jf4ec+Ru"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044063D330A
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666645; cv=none; b=nUXyqokRucn4oakIXvvtblJscwdI3ygJxksfVt7qUb0obzNzBQOYpBD2qCMiapLE7Ur44A3r0Iv7zZ1jigoyH4WOTmeNgBL+4o2HI1OTqBi9Qu6hStH18d5F5PZdUoKQTcRMg7MaXFEPLZzqzR31Ms5/q89tzuEUKZKPrmTHzKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666645; c=relaxed/simple;
	bh=h6zkUnNy9vxMe4HQaXIisPCrT/T6RWLbOmeWx06O7xE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HxOAJ+0AIyI797N6STsYGZqEHxGuYUHHlgUrHh2EWJlBMDW/K1UuApxoPXsreIIy7K9ZU1E69455vstl88oO3PthTG3QqzVIL7ZZuu9GfpXlKCnoYw2XbCeHxCEWn595w7HgvXZpgPphmaq7I2fFlorVQXuXTAEV1/VuCZQY2cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jf4ec+Ru; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso190245e9.2
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666641; x=1776271441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlUkpJAyKFczCXz0UgMNTWfP4cWrCCuTRRWsLVFVCcg=;
        b=Jf4ec+Rueln1SD/5O8VCL1tAzJjlEBUJ19PE6elc8J1Uz6utpBhrrgTmug4ze88HC6
         LZ2DYuFMs4ATqQtcX6Z2+hLdpAxcYPyVpkta/MQcieWU4HvHQ674yz2AsybSPdejfI0e
         TCqduKX1n4baOU/HnMvTgc2d0ZLSQywlkinwzvC8pJAhkLAw6SICQG7bs8fUayEVzD4+
         axwxZPbmxe6Z0uKwowQgkPfmQut/7RVCsLAhUBWhoCMK6RYP8aMuQUCl+Rmicyg5OkIW
         fAd//0/zVIZjp8mIHZGsGuqpqYqO4yv3uFv+z6mQDaSlYiHlPTbP57KumZ5cJlA5j21F
         qAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666641; x=1776271441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TlUkpJAyKFczCXz0UgMNTWfP4cWrCCuTRRWsLVFVCcg=;
        b=fJuCVxUnmXo4peys1sFjIEKZrevGl5Da5L3HdO+i3jhKiTmiYav8VsH/Cn3eUB7lfq
         NsS9d2B6KxMCbo55rhAp1T1ns/PRGaQT+FRqXBKJQ781/7ddFIOfHV62fjldpUqsID+z
         UKJwF0/VMR6Miw2ATgw35NnqZVEnIS6oD/0dVqrBwpRbzqQxj7MwF3srBUxGLEn/fcss
         4+5IStAFwyO8qBe+fYuWQnW23k+9CGPh8V8v4gxTvVE5e2IVhXa0yESs+mZIDntYCVVC
         kS54WllRD0hUhcN6VRIdmOEqI0fva0Dn0LwQb5Z2cEhM2Q+ZD2rjcc89eZ5ya909yeTO
         OJhw==
X-Gm-Message-State: AOJu0YxXgsEzCpaVKZ4fy7s1JI3DjswnnPY/beHoAkGcRzun4mDozkVy
	vw6ca786G8PGMo7XgZVBq56O9lJpUZq/jAaCloNfJpeeYam7jO8o+6Vmhxpm/tiw6rE=
X-Gm-Gg: AeBDievJRc+goKQPejfMs1xPGLWjVsfYjgS8+086Z86e8V3N7AHtEHd59xmdJ8NFHGk
	JWmWnzwb8x1qpHgko6E6MMvnFF/L+0GX8Xnbd04G+tDYRiBtPOE0QGcT3rk90bVl/Tqa/LDgMxq
	aI6gxtPJOz9cLsgVy+rv/TsC3ZSGm3ndOpMwdbrIy4/zVbx7aQx7Tvn7c3L8O4oWHolBdJsYrUp
	cjPLYnqvxRlT+Ty5s9OZWqrOXQvJnogxdcP5uTn1Eo8q7DIv7Pt6pBfUfzu0GLf3wzpsNZydWmy
	u8my5iXBnwUTcAHEL37G3YTNKNsDKL557o0DeOqLC5xAqq9w3DACxGHeFsaFLALP7Gr+jAThum2
	gImqYKtEEjpwShHKC+1aGSm8rPf+Oj+BRO8Xsr3A7Y+wsqk3cbBNU7BmjaiY+XDfoyNdCcFJqlK
	hTBa8aQLn4tdBe+Es/LsmGyY322lkQSGduHi1y2fIEGsaU
X-Received: by 2002:a05:600c:1e24:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488c078f73fmr89048325e9.26.1775666641310;
        Wed, 08 Apr 2026 09:44:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Apr 2026 18:43:54 +0200
Subject: [PATCH RFC 1/7] media: qcom: iris: add QC10C & P010 buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-1-428c1ec2e3f3@linaro.org>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4641;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=h6zkUnNy9vxMe4HQaXIisPCrT/T6RWLbOmeWx06O7xE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXM3AXdUizYKspKzvr6kAqUYfyGXqfclUBdsl4I
 7Sxd+MiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFzAAKCRB33NvayMhJ0f2wEA
 CwJY9d9azifaSyMWc/UFRLqLI8XCkWhnVXPRhGrKwG24Y0sTBCawqQ9n5oJHYISCyWGf1UKEJeZXvh
 lRDVJW5P5QyJ/8zoGHyv+dqMIyBkF9ozx8ksfbGwhu+LMFql47Erl6IokR5/UZqH6t5uNNi1JHL2vG
 PbVAVf4ylD3jbEamIy034ZuD9zJRuTA1xa0UQwkskRDZyh+TROSikNxbKG7Llh3U+Qb7HkjGO9kZil
 TQkX1dbqEPss9brYZG3hr02DJ2YZBsOqJk4hJe6xU53iN/CNJFjFa8YM6ShC65Zey8fghUSZYzlGv6
 EKGobo12e0KhdMLILRqJHGsK1T1+4pVkXnChD9gIsceWXeQDkgvM21lx8SK1Do0rQ6cB+SeiCgEQAf
 rCCVrnvp+7l/hpqj2kF7+ZxPDsB6zUfojqOGWybA/IsRMazBKrEVLponFIcs6tVPJr3EceNxO7S2wm
 +I/T8MoGEPPxYsLEY31w3yObwWFNbwjaHvCM3F+LbI+vF7h4NgROTQriDbGuwzG+xhedPP5unE9BNv
 vtB5McuRrbW1ZVbL7hwzej90Y9s/F54KbsBxISh9caPWNnroe8EFFc5U3xp82/YjP1HnTD0GXepZ5r
 NrBzR6JLqWvFh9w8uTtac9lpSNApeDyQxfnz+3eCvL39AeQJ0bFykgE2Y6/Q==
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
	TAGGED_FROM(0.00)[bounces-58273-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B1643BF03D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The P010 (YUV format with 16-bits per pixel with interleaved UV)
and QC10C (P010 compressed mode similar to QC08C) requires specific
buffer calculations to allocate the right buffer size for DPB frames
and frames consumed by userspace.

Similar to 8bit, the 10bit DPB frames uses QC10C format.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 81 +++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9151f43bc6b9..a0e31bff8f26 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -15,7 +15,9 @@
 #define MAX_WIDTH 4096
 #define MAX_HEIGHT 2304
 #define Y_STRIDE_ALIGN 128
+#define Y_STRIDE_ALIGN_P010 256
 #define UV_STRIDE_ALIGN 128
+#define UV_STRIDE_ALIGN_P010 256
 #define Y_SCANLINE_ALIGN 32
 #define UV_SCANLINE_ALIGN 16
 #define UV_SCANLINE_ALIGN_QC08C 32
@@ -80,6 +82,26 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
 	return ALIGN(y_plane + uv_plane, PIXELS_4K);
 }
 
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
@@ -204,6 +226,55 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 	return ALIGN(y_meta_plane + y_plane + uv_meta_plane + uv_plane, PIXELS_4K);
 }
 
+/*
+ * QC10C:
+ * Compressed Macro-tile format for TP10.
+ */
+static u32 iris_yuv_buffer_size_qc10c(struct iris_inst *inst)
+{
+	u32 y_stride, y_buf_height;
+	u32 uv_stride, uv_buf_height;
+	u32 y_md_stride, y_md_height;
+	u32 uv_md_stride, uv_md_height;
+	u32 y_data_size, uv_data_size;
+	u32 y_md_size, uv_md_size;
+	struct v4l2_format *f = NULL;
+
+	if (inst->domain == DECODER)
+		f = inst->fmt_dst;
+	else
+		f = inst->fmt_src;
+
+	y_stride = ALIGN(ALIGN(f->fmt.pix_mp.width, 192) * 4 / 3,
+			 Y_STRIDE_ALIGN_P010);
+	y_buf_height = ALIGN(f->fmt.pix_mp.height, UV_SCANLINE_ALIGN);
+
+	y_data_size = ALIGN(y_stride * y_buf_height, PIXELS_4K);
+
+	uv_stride = ALIGN(ALIGN(f->fmt.pix_mp.width, 192) * 4 / 3,
+			  UV_STRIDE_ALIGN_P010);
+	uv_buf_height = ALIGN((f->fmt.pix_mp.height + 1) / 2,
+			      UV_SCANLINE_ALIGN);
+
+	uv_data_size = ALIGN(uv_stride * uv_buf_height, PIXELS_4K);
+
+	y_md_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, 48),
+			    META_STRIDE_ALIGNED);
+	y_md_height = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.height, 4),
+			    META_SCANLINE_ALIGNED);
+
+	y_md_size = ALIGN(y_md_stride * y_md_height, PIXELS_4K);
+
+	uv_md_stride = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.width + 1) / 2, 24),
+			     META_STRIDE_ALIGNED);
+	uv_md_height = ALIGN(DIV_ROUND_UP((f->fmt.pix_mp.height + 1) / 2, 4),
+			     META_SCANLINE_ALIGNED);
+
+	uv_md_size = ALIGN(uv_md_stride * uv_md_height, PIXELS_4K);
+
+	return y_data_size + uv_data_size + y_md_size + uv_md_size;
+}
+
 static u32 iris_dec_bitstream_buffer_size(struct iris_inst *inst)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
@@ -268,10 +339,18 @@ int iris_get_buffer_size(struct iris_inst *inst,
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
+			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ||
+			    inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_P010)
+				return iris_yuv_buffer_size_qc10c(inst);
+			else
+				return iris_yuv_buffer_size_qc08c(inst);
 		default:
 			return 0;
 		}

-- 
2.34.1


