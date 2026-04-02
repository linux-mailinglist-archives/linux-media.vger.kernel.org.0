Return-Path: <linux-media+bounces-57964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPLCM21xzmkhnwYAu9opvQ
	(envelope-from <linux-media+bounces-57964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:38:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FA389DE0
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7548B313BC54
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB3430C629;
	Thu,  2 Apr 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNehMSP7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDEE1F8755
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136612; cv=none; b=hbyCEoZtqkpFpOH5YFijhjXIvZ/uLIAKrfoSCjFebbf7sEBouAHdlb5S3om1j2QbhppnjK37Yu2gMHOp1KIQPyGFADwuGAwkKtHBcpd5Z838yW831Ckkrjk4872/idY3Mrq7bCfCglMK1yE9EgCjcvSH+PKqy8cLcIdESYLn5Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136612; c=relaxed/simple;
	bh=XVCi/546amQIFXhYbaiOvywekubDKDUMCWNbag5Wb24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M4pbqtYfofnTMDKbo4jS63mYgLQ3ZJaljTt0bpMK2TthEirEV1Ey2Plzz/3aTXDe1qkJsML4gHx0ufKiqxSvAADkrOA4sETedtFuc8A8hT79xjBXe0Hqty/lHajL4pp0VOrSQC5VuAiDrbeInGfL0VqC/8VX9Ztn6zE3IynphIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNehMSP7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso9385305e9.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775136608; x=1775741408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X0MIU8GEyiO9stMRDDy9bZVbExCEI6xq1O1exAfXJh0=;
        b=eNehMSP7lWfQVVl1ZXrGxcfUUzkEGGvYjPsFJ+0FM2hN/Lp7wbZuz3sxTuTYfsBsJd
         1yDtt4yGkn53/HoH0eYxSKvYcvLGxR5ABlxXVdQDH8RfyxoY1vR2iPoy7dU8X34cEi9E
         yUFBUVCzmJm/jrhWazLzDwxdpKtObc1wEB8igiYJA7blBt8I/TVZZlsRFbbACHuPDU15
         gxYwVCFd2EyQjOquWAxyNi1gnE+siMHuA48XENqVoJhTXu9CNvisd5uiONh8yQs19tFp
         P5xtIhJdvjrP2eLJaP4XEajqjcV5DNNpEtV37w/UXpD+tMwbw00CZTG0gtRcyjNEQjS/
         nX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775136608; x=1775741408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0MIU8GEyiO9stMRDDy9bZVbExCEI6xq1O1exAfXJh0=;
        b=oiN7MJa44wED2V9kQO3Gzli5+jxbfgTtafsEav5AgeYfz1+AeZ676joXtAUw8QRhgV
         DhHUKy/vCZ0N+JiwMFuMwCtGlxXGHMtRdEl6OiPfZAxWnbyAnCG7w9Ogin/JRmtWO3pr
         X5dXcWWBDi/YJ6EN+3MXzOO1oJEpDqLlgffhygztjWTRtEwaw496YcqCsAvixTldyYZe
         mRB6FiJOTQBNLLVzb6Us5upxSO226A7scei/di58sRKf0WuVmV3CuQ4qExDNtkjyYDhV
         RHUW+0gel4XKB6L6k+TbHhHvz1UNn3Oi8s+jMQymaMev8lm1qlp/KKCSoC8EP3EyKSk3
         2abw==
X-Forwarded-Encrypted: i=1; AJvYcCVGjXSY5OAEo5Mow752xmNdPSnYGkWvb5HWeXofYODUiyaHiMNeLxGvgrmR/CZsDTxLqTNCmtxQxyTuqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIU7XSx+OdwceP9ArERdBnU5wJWLyCR8jlwakb+xdAwb3iaOdF
	hcVKO8GHiEAKRh6nlgGglU1+hrbWts1KpLN4HxQ8DZdSBP7ScmriHOvC
X-Gm-Gg: ATEYQzzCw3IijGZZyvZnZYzce20LTW89D8/NB0EnZf02s2znHsmEsZLmDXmTpt4RDIr
	RHzZUNK/raqvoPbwd9a9iob9AkbLcsOuTjEy6bs1hCykThdU5lLz8pMJfjbkDihBSFdEqMKnAm5
	x1ZDNy8wpoB649coF8z2MDrxwc8Ov8HJFphxb0z81HGgAvYGB5wYZ409tBLceLv4FX2F7rRpyOh
	Pvfq1XjsBFOnw9isCq8zMcQdE3syf38ew/MgAfRz4eSI33ghHFluw14ZP+3PTQzUt/mYhxSWilN
	x/kf3dOGD8mtILrI9tubPBeD3ZQlJ7AogiZtXg4hdC14Psg+qpWC8JYYXZExGcUp6qZ4dMyvo5E
	vHPpifk/+afVVBF20C8EyiA5EjltzXQQocZ9g3M0b7FDIH4dnqDb4CMbloEAIs3OEfcVMrzDJsv
	bor8UOjZy2HKu196RNuDgc
X-Received: by 2002:a05:600c:848d:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-488835b78f1mr141100575e9.29.1775136608192;
        Thu, 02 Apr 2026 06:30:08 -0700 (PDT)
Received: from MEROWN ([85.93.99.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm177225405e9.11.2026.04.02.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:30:07 -0700 (PDT)
From: Daniil Bulgar <bulgardaniil18@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniil Bulgar <bulgardaniil18@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation and spacing in sh_css.c
Date: Thu,  2 Apr 2026 15:30:05 +0200
Message-ID: <20260402133005.288643-1-bulgardaniil18@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-57964-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bulgardaniil18@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 2C9FA389DE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix several coding style errors reported by checkpatch.pl.
Use tabs for indentation instead of spaces.
Fix alignment of function arguments to match the opening parenthesis.
Remove trailing whitespaces and fix blank lines.

Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 103 ++++++++++-----------
 1 file changed, 49 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925f..fbfa54235 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -65,7 +65,6 @@
 
 #define SH_CSS_VIDEO_BUFFER_ALIGNMENT 0
 
-
 #include "ia_css_spctrl.h"
 #include "ia_css_version_data.h"
 #include "sh_css_struct.h"
@@ -101,7 +100,7 @@ enum ia_sh_css_modes {
 	sh_css_mode_resume
 };
 
-/**
+/*
  * struct sh_css_stream_seed - a stream seed, to save and restore the
  * stream data.
  *
@@ -115,7 +114,7 @@ enum ia_sh_css_modes {
  *
  * the stream seed contains all the data required to "grow" the seed again
  * after it was closed.
-*/
+ */
 struct sh_css_stream_seed {
 	struct ia_css_stream		**orig_stream;
 	struct ia_css_stream		*stream;
@@ -208,11 +207,11 @@ need_capture_pp(const struct ia_css_pipe *pipe);
 static bool
 need_yuv_scaler_stage(const struct ia_css_pipe *pipe);
 
-static int ia_css_pipe_create_cas_scaler_desc_single_output(
-    struct ia_css_frame_info *cas_scaler_in_info,
-    struct ia_css_frame_info *cas_scaler_out_info,
-    struct ia_css_frame_info *cas_scaler_vf_info,
-    struct ia_css_cas_binary_descr *descr);
+static int
+ia_css_pipe_create_cas_scaler_desc_single_output(struct ia_css_frame_info *cas_scaler_in_info,
+						 struct ia_css_frame_info *cas_scaler_out_info,
+						 struct ia_css_frame_info *cas_scaler_vf_info,
+						 struct ia_css_cas_binary_descr *descr);
 
 static void ia_css_pipe_destroy_cas_scaler_desc(struct ia_css_cas_binary_descr
 	*descr);
@@ -226,11 +225,10 @@ static bool need_capt_ldc(const struct ia_css_pipe *pipe);
 static int
 sh_css_pipe_load_binaries(struct ia_css_pipe *pipe);
 
-static
-int sh_css_pipe_get_viewfinder_frame_info(
-    struct ia_css_pipe *pipe,
-    struct ia_css_frame_info *info,
-    unsigned int idx);
+static int
+sh_css_pipe_get_viewfinder_frame_info(struct ia_css_pipe *pipe,
+				      struct ia_css_frame_info *info,
+				      unsigned int idx);
 
 static int
 sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
@@ -305,8 +303,8 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe);
 static unsigned int
 sh_css_get_sw_interrupt_value(unsigned int irq);
 
-static struct ia_css_binary *ia_css_pipe_get_shading_correction_binary(
-    const struct ia_css_pipe *pipe);
+static struct ia_css_binary *
+ia_css_pipe_get_shading_correction_binary(const struct ia_css_pipe *pipe);
 
 static struct ia_css_binary *
 ia_css_pipe_get_s3a_binary(const struct ia_css_pipe *pipe);
@@ -470,10 +468,9 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 	if (pipe->pipeline.stages)
 		binary = pipe->pipeline.stages->binary;
 
-	err = ia_css_isys_convert_stream_format_to_mipi_format(
-	    stream->config.input_config.format,
-	    stream->csi_rx_config.comp,
-	    &fmt_type);
+	err = ia_css_isys_convert_stream_format_to_mipi_format(stream->config.input_config.format,
+							       stream->csi_rx_config.comp,
+							       &fmt_type);
 	if (err)
 		return err;
 	sh_css_sp_program_input_circuit(fmt_type,
@@ -504,9 +501,9 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 	return 0;
 }
 
-static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
-    enum atomisp_input_format	format,
-    unsigned int			pixels_per_line)
+static unsigned int
+csi2_protocol_calculate_max_subpixels_per_line(enum atomisp_input_format format,
+					       unsigned int pixels_per_line)
 {
 	unsigned int rval;
 
@@ -629,9 +626,9 @@ static unsigned int csi2_protocol_calculate_max_subpixels_per_line(
 	return rval;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_id(struct ia_css_stream_config *stream_cfg,
+							  ia_css_isys_descr_t *isys_stream_descr)
 {
 	bool rc;
 
@@ -665,9 +662,9 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_type(struct ia_css_stream_config *stream_cfg,
+							    ia_css_isys_descr_t *isys_stream_descr)
 {
 	bool rc;
 
@@ -692,10 +689,10 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr,
-    int isys_stream_idx)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_attr(struct ia_css_stream_config *stream_cfg,
+							    ia_css_isys_descr_t	*isys_stream_descr,
+							    int isys_stream_idx)
 {
 	bool rc;
 
@@ -726,9 +723,9 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		unsigned int fmt_type;
 
 		err = ia_css_isys_convert_stream_format_to_mipi_format(
-			  stream_cfg->isys_config[isys_stream_idx].format,
-			  MIPI_PREDICTOR_NONE,
-			  &fmt_type);
+				stream_cfg->isys_config[isys_stream_idx].format,
+				MIPI_PREDICTOR_NONE,
+				&fmt_type);
 		if (err)
 			rc = false;
 
@@ -740,9 +737,8 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		if (IS_ISP2401)
 			isys_stream_descr->online = stream_cfg->online;
 
-		err |= ia_css_isys_convert_compressed_format(
-			   &stream_cfg->source.port.compression,
-			   isys_stream_descr);
+		err |= ia_css_isys_convert_compressed_format(&stream_cfg->source.port.compression,
+							     isys_stream_descr);
 		if (err)
 			rc = false;
 
@@ -750,9 +746,9 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 		isys_stream_descr->metadata.enable = false;
 		if (stream_cfg->metadata_config.resolution.height > 0) {
 			err = ia_css_isys_convert_stream_format_to_mipi_format(
-				  stream_cfg->metadata_config.data_type,
-				  MIPI_PREDICTOR_NONE,
-				  &fmt_type);
+					stream_cfg->metadata_config.data_type,
+					MIPI_PREDICTOR_NONE,
+					&fmt_type);
 			if (err)
 				rc = false;
 			isys_stream_descr->metadata.fmt_type = fmt_type;
@@ -787,10 +783,11 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_attr(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_resolution(
-    struct ia_css_stream_config *stream_cfg,
-    ia_css_isys_descr_t	*isys_stream_descr,
-    int isys_stream_idx)
+static bool
+sh_css_translate_stream_cfg_to_input_system_input_port_resolution(
+		struct ia_css_stream_config *stream_cfg,
+		ia_css_isys_descr_t *isys_stream_descr,
+		int isys_stream_idx)
 {
 	unsigned int bits_per_subpixel;
 	unsigned int max_subpixels_per_line;
@@ -840,11 +837,11 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_resolution(
 	return true;
 }
 
-static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
-    struct ia_css_stream_config *stream_cfg,
-    bool early_polling,
-    ia_css_isys_descr_t	*isys_stream_descr,
-    int isys_stream_idx)
+static bool
+sh_css_translate_stream_cfg_to_isys_stream_descr(struct ia_css_stream_config *stream_cfg,
+						 bool early_polling,
+						 ia_css_isys_descr_t *isys_stream_descr,
+						 int isys_stream_idx)
 {
 	bool rc;
 
@@ -2256,8 +2253,7 @@ alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW_PACKED\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
-	} else
-	{
+	} else {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW;
@@ -7856,8 +7852,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-		if (!IS_ISP2401 || !stream_config->online)
-		{
+		if (!IS_ISP2401 || !stream_config->online) {
 			unsigned int port = (unsigned int)stream_config->source.port.port;
 
 			if (port >= N_MIPI_PORT_ID) {
-- 
2.53.0


