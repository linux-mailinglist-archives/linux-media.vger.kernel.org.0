Return-Path: <linux-media+bounces-64015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g152BtYIJGpM2AEAu9opvQ
	(envelope-from <linux-media+bounces-64015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 13:47:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD264D47F
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 13:47:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pEyimEt0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64015-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64015-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3D973017AD4
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 11:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F63932C5;
	Sat,  6 Jun 2026 11:47:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBA383C94
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 11:47:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780746434; cv=none; b=uu9nfPsdm/Q+FZP4dbhcvGgN7VZ2LzX/DFZ27AqN8zPGU5s4DIyNf5AxbRT7wirQk40XPQULDC8tjUewbDmky8+mBsIBlNIFqi5mM+pYOwPW9EXTH+q+EsUaZJamNmulQSeSoLvOA8fMDPqPI9swR4ahsWPEQ4Dd/a2JfEA+Wdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780746434; c=relaxed/simple;
	bh=Ud+L8RX0/ONTx9AN+SCwYHws8tWaBfr63/tQ2nKJTtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ldyD3skCTERxbLwrGNGeluABuxzGSZ2Wh1p6r27cG9Iub+qCn1z0cx+j7YEr7aIRWi1jKQF3aD9DKAh+CTcXJ6eFxUnan14enNVeT+Uv21Cr0DnR4Bt26N22gLGjoqVbI+RzUTQppO5KsYvPXNEjauF8qoszgxfKnZDCQfOH8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEyimEt0; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c35980fdso28189575ad.2
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780746430; x=1781351230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIR/QbzXK+b8Jr6rPykOzMarQ8n0SX4F6p7WAI1P/lE=;
        b=pEyimEt0TXlDJFMvwS4bfmgvAZxLZ+VHmNAEYSAmJjMW/yjg2dXQZBHL76n4r3aPQ3
         A4q9R5txxYU+OLvu/ZwgMVKVtgPMOAp0SF8KSSK43l60w3VDgvtbbxVpU+tzh3tLnq6a
         27/WXEJcS2mY29AKGHqHsIFdG35IAx1a7bB1Pu8wa7Ygp+gPG6X2E2M1xudLwNmZf1N8
         wfdylZw6RufDd2sy8mJ35MfUWIJXsOZbTRj0xiL7dmZve56+QVqk2AbWjqN0iZwMCyUb
         ILAXK0tB13EpNGG4yeyDQvC7tLb/SF9uMtDpBw0ysjSXC7Lup/ek886qvwcVHVwasf4Z
         OCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780746430; x=1781351230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIR/QbzXK+b8Jr6rPykOzMarQ8n0SX4F6p7WAI1P/lE=;
        b=R9nMqFp4IPNR2/EcwJDRsWfl8l7pbfqkN5ogmk45QeD85ZxnPUTCowNl311pthNqCP
         FOJeTGLrw2yygDaS1jLyItSE0ewHNcQ5/ZrChTN1qGjt04lzO9VWN6e+rUcGSB2SPCyV
         XR2Uycv9SEJYDK424chZOvuHcICQagrjG+Sh9AT4m6jQd5L9aEmU+DUDpLmMGs3+LmbL
         CqXQy0xV1bg4JKdSXLZ6b8dECulraU+Nf5dCZAH19I6tziPG5GgNCOU5ssJ5j0zfkYZO
         XdIVF18I8+onB2qj6kHz7hrwVcubDPSMFkEMv50i62e5PH3ctOyZvMU12MdnAsQcDGEH
         ngYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SxMUjrscftTss9Ns3+TSXXevKWELbky3MJ9MNVUOIKcS5P9rgayuiZ31tRqhU2KIHZTqyRRgccqnLew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbhPNGqYzfPxO6RDeF+y20HTkZMb9yBU3pXkO+LAx5t4DnEQpZ
	YkEvMvSvkx2UITk0z9vAI54OCGiXpDFJAJ1OPOBs1fv+kIxqZwmYdmhH
X-Gm-Gg: Acq92OFGYhXCapKnRfJuzIcmSQuCKdKD9NEHAymtGDQYlbxT/KBnW1+rgMhU9ExCLxh
	yHquQxs8OQU4XIM/qbNQNoFPj4WQCGA+Nk5OOjVX1aJoS0OUQ9Gt2XulRt32n6GEVoourJVTTYw
	0JlwdXWjTxIFpmISUN1klVCikooNWLykyeXDHbC0Px1Xt1yAsTVfEqVhJzP8ZdOY7NhyIktSqph
	RIJlif2A6iN99nkK2J0WIz/WpDNMbDIZK3PX3oo1grb4G2j14EyvT7BTjbDmVHGH78Ijs8ngHW+
	9o4Yr1DMVrMzBjIPdmjhPT/KmUxYe8onot/tO78q2ohM1NpM9MWv/IYnDSw0cOv37uV1ylh9axT
	brfBERJaz0qvq6YyAYSJ80nn96+9uAEAs70Hv/JN5Pdc7mWbBjzwMGn1/BQ+HqPguI7uxIRDftk
	+YRVrdDOlJGoL1zN1izYsNxUa3BOxerh0kaH7oypRqtA0HY0aSDYmZ4A==
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr13876565ad.13.1780746430022;
        Sat, 06 Jun 2026 04:47:10 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:967f:7ce4:ec98:f08b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm160933745ad.65.2026.06.06.04.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:47:09 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v3] media: iris: store formats in the instance
Date: Sat,  6 Jun 2026 19:47:03 +0800
Message-ID: <20260606114703.5-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64015-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1CD264D47F

The source and destination v4l2_format objects are per-instance state
with the same lifetime as struct iris_inst, but iris allocates them
separately during decoder and encoder instance initialization.

Keeping the formats as separate allocations adds failure paths before
all users can safely dereference them. It also requires every later
initialization failure to remember to free both objects before the
instance is released.

Store the formats directly in struct iris_inst and update users to take
the address of the embedded objects where a pointer is needed. This
removes the allocation failure path and the matching close-time frees.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
v3:
- Embed source and destination formats in struct iris_inst.
- Remove separate decoder and encoder format allocations and frees.
- Update users to take addresses of the embedded formats.

v2:
- Allocate source and destination formats into local variables first.
- Assign them to the instance only after both allocations succeed.
- Free any partial allocation on failure.

 .../media/platform/qcom/iris/iris_buffer.c    | 16 ++++-----
 drivers/media/platform/qcom/iris/iris_ctrls.c |  2 +-
 .../qcom/iris/iris_hfi_gen1_command.c         | 22 ++++++------
 .../qcom/iris/iris_hfi_gen1_response.c        |  4 +--
 .../qcom/iris/iris_hfi_gen2_command.c         | 30 ++++++++--------
 .../qcom/iris/iris_hfi_gen2_response.c        |  8 ++---
 .../media/platform/qcom/iris/iris_instance.h  |  4 +--
 drivers/media/platform/qcom/iris/iris_power.c |  2 +-
 drivers/media/platform/qcom/iris/iris_utils.c |  6 ++--
 drivers/media/platform/qcom/iris/iris_vb2.c   |  6 ++--
 drivers/media/platform/qcom/iris/iris_vdec.c  | 19 +++++-----
 drivers/media/platform/qcom/iris/iris_venc.c  | 36 ++++++++-----------
 drivers/media/platform/qcom/iris/iris_vidc.c  | 10 +++---
 drivers/media/platform/qcom/iris/iris_vpu2.c  |  2 +-
 .../platform/qcom/iris/iris_vpu_buffer.c      | 28 +++++++--------
 .../platform/qcom/iris/iris_vpu_common.c      |  2 +-
 16 files changed, 92 insertions(+), 105 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 1d53c7414b754..95e77f4fb14e4 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -66,9 +66,9 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_inst *inst)
 	struct v4l2_format *f;
 
 	if (inst->domain == DECODER)
-		f = inst->fmt_dst;
+		f = &inst->fmt_dst;
 	else
-		f = inst->fmt_src;
+		f = &inst->fmt_src;
 
 	y_stride = ALIGN(f->fmt.pix_mp.width, Y_STRIDE_ALIGN);
 	uv_stride = ALIGN(f->fmt.pix_mp.width, UV_STRIDE_ALIGN);
@@ -173,12 +173,12 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 	u32 y_plane, uv_plane, y_stride, uv_stride;
 	u32 uv_meta_stride, uv_meta_plane;
 	u32 y_meta_stride, y_meta_plane;
-	struct v4l2_format *f = NULL;
+	struct v4l2_format *f;
 
 	if (inst->domain == DECODER)
-		f = inst->fmt_dst;
+		f = &inst->fmt_dst;
 	else
-		f = inst->fmt_src;
+		f = &inst->fmt_src;
 
 	y_meta_stride = ALIGN(DIV_ROUND_UP(f->fmt.pix_mp.width, META_STRIDE_ALIGNED >> 1),
 			      META_STRIDE_ALIGNED);
@@ -235,7 +235,7 @@ static u32 iris_enc_bitstream_buffer_size(struct iris_inst *inst)
 	int bitrate_mode, frame_rc;
 	struct v4l2_format *f;
 
-	f = inst->fmt_dst;
+	f = &inst->fmt_dst;
 
 	bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
 	frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
@@ -266,7 +266,7 @@ int iris_get_buffer_size(struct iris_inst *inst,
 		case BUF_INPUT:
 			return iris_dec_bitstream_buffer_size(inst);
 		case BUF_OUTPUT:
-			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+			if (inst->fmt_dst.fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
 				return iris_yuv_buffer_size_qc08c(inst);
 			else
 				return iris_yuv_buffer_size_nv12(inst);
@@ -278,7 +278,7 @@ int iris_get_buffer_size(struct iris_inst *inst,
 	} else {
 		switch (buffer_type) {
 		case BUF_INPUT:
-			if (inst->fmt_src->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+			if (inst->fmt_src.fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
 				return iris_yuv_buffer_size_qc08c(inst);
 			else
 				return iris_yuv_buffer_size_nv12(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 3cec957580f5e..fad64d95a413d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -426,7 +426,7 @@ int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	struct v4l2_format *inp_f = inst->fmt_src;
+	struct v4l2_format *inp_f = &inst->fmt_src;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 height = inp_f->fmt.pix_mp.height;
 	u32 width = inp_f->fmt.pix_mp.width;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e42d17653c2c3..c9dba69e9c891 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -737,8 +737,8 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
 
 	if (!iris_drc_pending(inst) && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
 		fs.buffer_type = HFI_BUFFER_INPUT;
-		fs.width = inst->fmt_src->fmt.pix_mp.width;
-		fs.height = inst->fmt_src->fmt.pix_mp.height;
+		fs.width = inst->fmt_src.fmt.pix_mp.width;
+		fs.height = inst->fmt_src.fmt.pix_mp.height;
 
 		ret = hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
 		if (ret)
@@ -749,8 +749,8 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
 	else
 		fs.buffer_type = HFI_BUFFER_OUTPUT;
 
-	fs.width = inst->fmt_dst->fmt.pix_mp.width;
-	fs.height = inst->fmt_dst->fmt.pix_mp.height;
+	fs.width = inst->fmt_dst.fmt.pix_mp.width;
+	fs.height = inst->fmt_dst.fmt.pix_mp.height;
 
 	return hfi_gen1_set_property(inst, ptype, &fs, sizeof(fs));
 }
@@ -773,7 +773,7 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
 	int ret;
 
 	if (inst->domain == DECODER) {
-		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
+		pixelformat = inst->fmt_dst.fmt.pix_mp.pixelformat;
 		if (iris_split_mode_enabled(inst)) {
 			fmt.buffer_type = HFI_BUFFER_OUTPUT;
 			fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;
@@ -795,7 +795,7 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
 			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 		}
 	} else {
-		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
+		pixelformat = inst->fmt_src.fmt.pix_mp.pixelformat;
 		fmt.buffer_type = HFI_BUFFER_INPUT;
 		fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
 			HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
@@ -810,7 +810,7 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
 	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
 	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
 
-	if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+	if (inst->fmt_dst.fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
 		return 0;
 
 	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
@@ -967,13 +967,13 @@ static int iris_hfi_gen1_set_stride(struct iris_inst *inst, u32 plane)
 	plane_actual_info.buffer_type = HFI_BUFFER_INPUT;
 	plane_actual_info.num_planes = 2;
 	plane_actual_info.plane_format[0].actual_stride =
-		ALIGN(inst->fmt_src->fmt.pix_mp.width, 128);
+		ALIGN(inst->fmt_src.fmt.pix_mp.width, 128);
 	plane_actual_info.plane_format[0].actual_plane_buffer_height =
-		ALIGN(inst->fmt_src->fmt.pix_mp.height, 32);
+		ALIGN(inst->fmt_src.fmt.pix_mp.height, 32);
 	plane_actual_info.plane_format[1].actual_stride =
-		ALIGN(inst->fmt_src->fmt.pix_mp.width, 128);
+		ALIGN(inst->fmt_src.fmt.pix_mp.width, 128);
 	plane_actual_info.plane_format[1].actual_plane_buffer_height =
-		(ALIGN(inst->fmt_src->fmt.pix_mp.height, 32)) / 2;
+		(ALIGN(inst->fmt_src.fmt.pix_mp.height, 32)) / 2;
 
 	return hfi_gen1_set_property(inst, ptype, &plane_actual_info, sizeof(plane_actual_info));
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8e864c239e293..e1aea0fc78608 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -15,8 +15,8 @@
 static void iris_hfi_gen1_read_changed_params(struct iris_inst *inst,
 					      struct hfi_msg_event_notify_pkt *pkt)
 {
-	struct v4l2_pix_format_mplane *pixmp_ip = &inst->fmt_src->fmt.pix_mp;
-	struct v4l2_pix_format_mplane *pixmp_op = &inst->fmt_dst->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp_ip = &inst->fmt_src.fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp_op = &inst->fmt_dst.fmt.pix_mp;
 	u32 num_properties_changed = pkt->event_data2;
 	u8 *data_ptr = (u8 *)&pkt->ext_event_data[0];
 	u32 primaries, matrix_coeff, transfer_char;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423ba..9b55d188ee58d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -198,8 +198,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
 	u32 resolution;
 
 	if (inst->domain == DECODER) {
-		width = inst->fmt_src->fmt.pix_mp.width;
-		height = inst->fmt_src->fmt.pix_mp.height;
+		width = inst->fmt_src.fmt.pix_mp.width;
+		height = inst->fmt_src.fmt.pix_mp.height;
 		resolution = iris_hfi_get_aligned_resolution(inst, width, height);
 		inst_hfi_gen2->src_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_U32;
@@ -235,13 +235,13 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
-			right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
+			bottom_offset = (inst->fmt_src.fmt.pix_mp.height - inst->crop.height);
+			right_offset = (inst->fmt_src.fmt.pix_mp.width - inst->crop.width);
 			left_offset = inst->crop.left;
 			top_offset = inst->crop.top;
 		} else {
-			bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->compose.height);
-			right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->compose.width);
+			bottom_offset = (inst->fmt_dst.fmt.pix_mp.height - inst->compose.height);
+			right_offset = (inst->fmt_dst.fmt.pix_mp.width - inst->compose.width);
 			left_offset = inst->compose.left;
 			top_offset = inst->compose.top;
 		}
@@ -356,7 +356,7 @@ static int iris_hfi_gen2_set_picture_order_count(struct iris_inst *inst, u32 pla
 static int iris_hfi_gen2_set_colorspace(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp = &inst->fmt_src.fmt.pix_mp;
 	u32 video_signal_type_present_flag = 0, color_info;
 	u32 matrix_coeff = HFI_MATRIX_COEFF_RESERVED;
 	u32 video_format = UNSPECIFIED_COLOR_FORMAT;
@@ -480,11 +480,11 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 	u32 hfi_colorformat, pixelformat;
 
 	if (inst->domain == DECODER) {
-		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
+		pixelformat = inst->fmt_dst.fmt.pix_mp.pixelformat;
 		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
 			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
 	} else {
-		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
+		pixelformat = inst->fmt_src.fmt.pix_mp.pixelformat;
 		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
 			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
 	}
@@ -505,13 +505,13 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
 	u32 payload[2];
 
 	if (inst->domain == DECODER) {
-		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
-		stride_y = inst->fmt_dst->fmt.pix_mp.width;
-		scanline_y = inst->fmt_dst->fmt.pix_mp.height;
+		pixelformat = inst->fmt_dst.fmt.pix_mp.pixelformat;
+		stride_y = inst->fmt_dst.fmt.pix_mp.width;
+		scanline_y = inst->fmt_dst.fmt.pix_mp.height;
 	} else {
-		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
-		stride_y = ALIGN(inst->fmt_src->fmt.pix_mp.width, 128);
-		scanline_y = ALIGN(inst->fmt_src->fmt.pix_mp.height, 32);
+		pixelformat = inst->fmt_src.fmt.pix_mp.pixelformat;
+		stride_y = ALIGN(inst->fmt_src.fmt.pix_mp.width, 128);
+		scanline_y = ALIGN(inst->fmt_src.fmt.pix_mp.height, 32);
 	}
 
 	stride_uv = stride_y;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9e..726e6af777034 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -522,8 +522,8 @@ static int iris_hfi_gen2_handle_session_drain(struct iris_inst *inst,
 static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	struct v4l2_pix_format_mplane *pixmp_ip = &inst->fmt_src->fmt.pix_mp;
-	struct v4l2_pix_format_mplane *pixmp_op = &inst->fmt_dst->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp_ip = &inst->fmt_src.fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp_op = &inst->fmt_dst.fmt.pix_mp;
 	u32 primaries, matrix_coeff, transfer_char;
 	struct hfi_subscription_params subsc_params;
 	u32 colour_description_present_flag;
@@ -817,8 +817,8 @@ static int iris_hfi_gen2_handle_system_response(struct iris_core *core,
 static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	struct v4l2_pix_format_mplane *pixmp_ip = &inst->fmt_src->fmt.pix_mp;
-	struct v4l2_pix_format_mplane *pixmp_op = &inst->fmt_dst->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp_ip = &inst->fmt_src.fmt.pix_mp;
+	struct v4l2_pix_format_mplane *pixmp_op = &inst->fmt_dst.fmt.pix_mp;
 	u32 bottom_offset = (pixmp_ip->height - inst->crop.height);
 	u32 right_offset = (pixmp_ip->width - inst->crop.width);
 	struct hfi_subscription_params *subsc_params;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427b..996f724ed20a5 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -83,8 +83,8 @@ struct iris_inst {
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
 	struct mutex			lock; /* lock to serialize forward and reverse threads */
 	struct v4l2_fh			fh;
-	struct v4l2_format		*fmt_src;
-	struct v4l2_format		*fmt_dst;
+	struct v4l2_format		fmt_src;
+	struct v4l2_format		fmt_dst;
 	struct v4l2_ctrl_handler	ctrl_handler;
 	enum domain_type		domain;
 	struct iris_hfi_rect_desc	crop;
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index 91aa21d4070eb..369ce43a103cd 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -64,7 +64,7 @@ static int iris_set_interconnects(struct iris_inst *inst)
 static int iris_vote_interconnects(struct iris_inst *inst)
 {
 	struct icc_vote_data *vote_data = &inst->icc_data;
-	struct v4l2_format *inp_f = inst->fmt_src;
+	struct v4l2_format *inp_f = &inst->fmt_src;
 
 	vote_data->width = inp_f->fmt.pix_mp.width;
 	vote_data->height = inp_f->fmt.pix_mp.height;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56b..a694eb32edb6e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -25,7 +25,7 @@ bool iris_res_is_less_than(u32 width, u32 height,
 
 int iris_get_mbpf(struct iris_inst *inst)
 {
-	struct v4l2_format *inp_f = inst->fmt_src;
+	struct v4l2_format *inp_f = &inst->fmt_src;
 	u32 height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
 	u32 width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 
@@ -34,8 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
 
 bool iris_split_mode_enabled(struct iris_inst *inst)
 {
-	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
-		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
+	return inst->fmt_dst.fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
+		inst->fmt_dst.fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
 }
 
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index bf0b8400996ec..5d2528d4e0aba 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -34,8 +34,8 @@ static int iris_check_resolution_supported(struct iris_inst *inst)
 	struct platform_inst_caps *caps;
 
 	caps = inst->core->iris_platform_data->inst_caps;
-	width = inst->fmt_src->fmt.pix_mp.width;
-	height = inst->fmt_src->fmt.pix_mp.height;
+	width = inst->fmt_src.fmt.pix_mp.width;
+	height = inst->fmt_src.fmt.pix_mp.height;
 
 	min_width = caps->min_frame_width;
 	max_width = caps->max_frame_width;
@@ -113,7 +113,7 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
 	}
 
 	core = inst->core;
-	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
+	f = V4L2_TYPE_IS_OUTPUT(q->type) ? &inst->fmt_src : &inst->fmt_dst;
 
 	if (*num_planes) {
 		if (*num_planes != f->fmt.pix_mp.num_planes ||
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 99d544e2af4f9..2f001302efc3e 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -21,12 +21,9 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	struct iris_core *core = inst->core;
 	struct v4l2_format *f;
 
-	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
-	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
-
 	inst->fw_min_count = MIN_BUFFERS;
 
-	f = inst->fmt_src;
+	f = &inst->fmt_src;
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	f->fmt.pix_mp.width = DEFAULT_WIDTH;
 	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
@@ -39,7 +36,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
 	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 
-	f = inst->fmt_dst;
+	f = &inst->fmt_dst;
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
 	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
@@ -166,7 +163,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (!fmt) {
-			f_inst = inst->fmt_src;
+			f_inst = &inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
@@ -174,7 +171,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (!fmt) {
-			f_inst = inst->fmt_dst;
+			f_inst = &inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
@@ -182,7 +179,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 		src_q = v4l2_m2m_get_src_vq(m2m_ctx);
 		if (vb2_is_streaming(src_q)) {
-			f_inst = inst->fmt_src;
+			f_inst = &inst->fmt_src;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 		}
@@ -225,7 +222,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
 			return -EINVAL;
 
-		fmt = inst->fmt_src;
+		fmt = &inst->fmt_src;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		inst->codec = fmt->fmt.pix_mp.pixelformat;
@@ -243,7 +240,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 		fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
-		output_fmt = inst->fmt_dst;
+		output_fmt = &inst->fmt_dst;
 		output_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
 		output_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
 		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
@@ -263,7 +260,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
 			return -EINVAL;
 
-		fmt = inst->fmt_dst;
+		fmt = &inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 4d886769d958b..1efcf0fe80d58 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -19,15 +19,7 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	struct iris_core *core = inst->core;
 	struct v4l2_format *f;
 
-	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
-	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
-	if (!inst->fmt_src || !inst->fmt_dst) {
-		kfree(inst->fmt_src);
-		kfree(inst->fmt_dst);
-		return -ENOMEM;
-	}
-
-	f = inst->fmt_dst;
+	f = &inst->fmt_dst;
 	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	f->fmt.pix_mp.width = DEFAULT_WIDTH;
 	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
@@ -44,7 +36,7 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
 
-	f = inst->fmt_src;
+	f = &inst->fmt_src;
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
 	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
@@ -194,7 +186,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	switch (f->type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		if (!fmt) {
-			f_inst = inst->fmt_src;
+			f_inst = &inst->fmt_src;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
@@ -202,7 +194,7 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (!fmt) {
-			f_inst = inst->fmt_dst;
+			f_inst = &inst->fmt_dst;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
 			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
@@ -234,15 +226,15 @@ static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 
 	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
 
-	fmt = inst->fmt_dst;
+	fmt = &inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	/*
 	 * If output format size != input format size,
 	 * it is considered a scaling case,
 	 * and the scaled size needs to be saved.
 	 */
-	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
-	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
+	if (f->fmt.pix_mp.width != inst->fmt_src.fmt.pix_mp.width ||
+	    f->fmt.pix_mp.height != inst->fmt_src.fmt.pix_mp.height) {
 		inst->enc_scale_width = f->fmt.pix_mp.width;
 		inst->enc_scale_height = f->fmt.pix_mp.height;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
@@ -278,7 +270,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
 		return -EINVAL;
 
-	fmt = inst->fmt_src;
+	fmt = &inst->fmt_src;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
 	fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
@@ -292,7 +284,7 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
-	output_fmt = inst->fmt_dst;
+	output_fmt = &inst->fmt_dst;
 	output_fmt->fmt.pix_mp.width = fmt->fmt.pix_mp.width;
 	output_fmt->fmt.pix_mp.height = fmt->fmt.pix_mp.height;
 	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
@@ -379,17 +371,17 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		s->r.left = 0;
 		s->r.top = 0;
 
-		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
-		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
+		if (s->r.width > inst->fmt_src.fmt.pix_mp.width ||
+		    s->r.height > inst->fmt_src.fmt.pix_mp.height)
 			return -EINVAL;
 
 		inst->crop.left = s->r.left;
 		inst->crop.top = s->r.top;
 		inst->crop.width = s->r.width;
 		inst->crop.height = s->r.height;
-		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
-		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
-		return iris_venc_s_fmt_output(inst, inst->fmt_dst);
+		inst->fmt_dst.fmt.pix_mp.width = inst->crop.width;
+		inst->fmt_dst.fmt.pix_mp.height = inst->crop.height;
+		return iris_venc_s_fmt_output(inst, &inst->fmt_dst);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 5eb1786b07371..cfd95e8c57a3a 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -300,8 +300,6 @@ int iris_close(struct file *filp)
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
-	kfree(inst->fmt_src);
-	kfree(inst->fmt_dst);
 	kfree(inst);
 
 	return 0;
@@ -360,9 +358,9 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 
 	mutex_lock(&inst->lock);
 	if (V4L2_TYPE_IS_OUTPUT(f->type))
-		*f = *inst->fmt_src;
+		*f = inst->fmt_src;
 	else if (V4L2_TYPE_IS_CAPTURE(f->type))
-		*f = *inst->fmt_dst;
+		*f = inst->fmt_dst;
 	else
 		ret = -EINVAL;
 
@@ -494,8 +492,8 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
 		switch (s->target) {
 		case V4L2_SEL_TGT_CROP_BOUNDS:
 		case V4L2_SEL_TGT_CROP_DEFAULT:
-			s->r.width = inst->fmt_src->fmt.pix_mp.width;
-			s->r.height = inst->fmt_src->fmt.pix_mp.height;
+			s->r.width = inst->fmt_src.fmt.pix_mp.width;
+			s->r.height = inst->fmt_src.fmt.pix_mp.height;
 			break;
 		case V4L2_SEL_TGT_CROP:
 			s->r.width = inst->crop.width;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 01ef40f389574..574ff24ced0f5 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -15,7 +15,7 @@
 static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
+	struct v4l2_format *inp_f = &inst->fmt_src;
 	u32 mbs_per_second, mbpf, height, width;
 	unsigned long vpp_freq, vsp_freq;
 	u32 fps = DEFAULT_FPS;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c16019..bea3d4ed874a4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -708,7 +708,7 @@ static u32 hfi_buffer_ibc_av1d(u32 frame_width, u32 frame_height)
 static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_src;
+	struct v4l2_format *f = &inst->fmt_src;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
@@ -727,7 +727,7 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 {
 	u32 num_comv = VIDEO_MAX_FRAME;
-	struct v4l2_format *f = inst->fmt_src;
+	struct v4l2_format *f = &inst->fmt_src;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
@@ -778,7 +778,7 @@ static u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
 static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_src;
+	struct v4l2_format *f = &inst->fmt_src;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
@@ -793,7 +793,7 @@ static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
 static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_src;
+	struct v4l2_format *f = &inst->fmt_src;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 	bool is_opb = false;
@@ -825,17 +825,17 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
 static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
 {
 	if (is_rotation_90_or_270(inst))
-		return inst->fmt_dst->fmt.pix_mp.height;
+		return inst->fmt_dst.fmt.pix_mp.height;
 	else
-		return inst->fmt_dst->fmt.pix_mp.width;
+		return inst->fmt_dst.fmt.pix_mp.width;
 }
 
 static inline u32 iris_vpu_enc_get_bitstream_height(struct iris_inst *inst)
 {
 	if (is_rotation_90_or_270(inst))
-		return inst->fmt_dst->fmt.pix_mp.width;
+		return inst->fmt_dst.fmt.pix_mp.width;
 	else
-		return inst->fmt_dst->fmt.pix_mp.height;
+		return inst->fmt_dst.fmt.pix_mp.height;
 }
 
 static inline u32 size_bin_bitstream_enc(u32 width, u32 height,
@@ -936,7 +936,7 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
 static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
 {
-	struct v4l2_format *f = inst->fmt_src;
+	struct v4l2_format *f = &inst->fmt_src;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
@@ -1417,8 +1417,8 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
 
 inline bool is_scaling_enabled(struct iris_inst *inst)
 {
-	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
-	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst.fmt.pix_mp;
+	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src.fmt.pix_mp;
 
 	return dst_fmt->width != src_fmt->width ||
 		dst_fmt->height != src_fmt->height;
@@ -1686,7 +1686,7 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
 {
 	u32 ds_enable = is_scaling_enabled(inst);
-	struct v4l2_format *f = inst->fmt_dst;
+	struct v4l2_format *f = &inst->fmt_dst;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
@@ -1759,7 +1759,7 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
 	u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
-	struct v4l2_format *f = inst->fmt_src;
+	struct v4l2_format *f = &inst->fmt_src;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 	bool is_opb = false;
@@ -1983,7 +1983,7 @@ static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
 	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-	struct v4l2_format *f = inst->fmt_dst;
+	struct v4l2_format *f = &inst->fmt_dst;
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d95..8e68990afa73e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -416,7 +416,7 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
+	struct v4l2_format *inp_f = &inst->fmt_src;
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
-- 
2.51.0


