Return-Path: <linux-media+bounces-58051-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNNKAc8B0WmNDQcAu9opvQ
	(envelope-from <linux-media+bounces-58051-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 14:19:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C139B0D2
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 14:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDEEC30151FF
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 12:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D5D3321C2;
	Sat,  4 Apr 2026 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7So4M95"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460B28643C
	for <linux-media@vger.kernel.org>; Sat,  4 Apr 2026 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305092; cv=none; b=pTR5uEDBADT/L9Z5o1lZHgqoL2SBWPkBGUQZDRGl78aBY4bzEivFxhYd7qxilZiPTTtQ1SZHIQarfNNsgI0h8Zezvw/ivp7SegMYBBfoZq/9o0cV3qxMd0D/v+8Bw2RfzsD3js90ov0VS2NKHENtps/KIVFf6cJCuy3WcPmEDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305092; c=relaxed/simple;
	bh=AkabFUGAkZE2eyvcIF8PNV6NL3mmr50IutCPhNS2V4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGRyfT98cr4bzFE2+lc4cym/bdDNZO85WRqRNM2diX0jK6VYNaWllF0Y2D50DilkGmHv9se+a1DWnsr/EaSrNYaMP81msHRpnViWgSMmRiMWxMHa8TGGYTyxEc7E5A9S6gDUQL/UdTN17Z2PdAufzBfNWPrWIQI4cLXk9zBz3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7So4M95; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so23464185e9.0
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2026 05:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775305088; x=1775909888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPGMod7ytQAkDmoXaGJE6MlLHF6RiPtjuIVE+LDRQX4=;
        b=Y7So4M95WjRZhZC6dFCRCdBt6ro48HQNHaUfUCJQqG5Ad06eS/MkgT3IO8qZtJwpmP
         xb8HeFxibU8/6KLFAsftoXCtwt8CHytf5t59Lr09b5nOnaaWFhoguVrli2PRVRc93AuW
         CiPcXWRM/wAW/6RqNQLUa72Zmyr/ZK0kyMWbHwClLCocJFGjhV53hSV0LMpsZoqwS8UD
         38kSIj8D89qmNSoWOESsREYcRBNs6jIOg7texPHdOffRDGrH1Lb8MfJL0UGKtRJ5armV
         tGeeVBFEhHi4VluEqxEhYJSIVTpr38FEvgAPjKiW3rAI8JCtHk+RPMUpRA4tDImDFXT4
         xGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305088; x=1775909888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPGMod7ytQAkDmoXaGJE6MlLHF6RiPtjuIVE+LDRQX4=;
        b=fvPijDccvlP7BEQbD/NKySzAvmID+cl9W8OXn7CkQbpRgWfTW6egmflrXxAR3x4ZKl
         CrY+A+ezEhyHJ6KUOQKHHJ1rrZykQbsvnKL2jAimxVlE1W53jhpfUDV8+goQB77brTZG
         RBdRwmIx8pMsy2g74i9zA719ekC/9AyLPJ9aSgsllUAJq7xrXgqrAi1acyWo4I6dAKSa
         /DBAsSIJ73lq7dxy5Ub/eqCTFGRJYixOF14TPVN5hHKmQKvyISAb9Cd7sWIxzz0XJwaF
         MoVEec4qyhl8CLUC9vfECyWY6agKYALviEJPxvMXhpSM0r7wvoY13PdiA2+Dsd4JSk79
         N8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWCFEoJH8Ou8csgAloqc8LFsM9sqn4Efwc3rs2yLR7wVzA9M3jr3GbwgVWTEE0lqJxrydAPu8LpKoHyHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxngCc/ZIimF3I+v9psLek4fgvjzrJsx53XjvJ3OXcVIfH/EIRS
	oMRqG+zqaHR1cF8hfKHaEdApmpTayx7QleL8JC8bkbwI9WAeVjK/plp/
X-Gm-Gg: AeBDiesHOdCTXaAqg2E1UoBb8z7XcKYCtP35MR4CWuk+Hcw03k6UTQXUuGAYvZiO/1o
	CUUaBt7CElwnjcaESQtqBucujaFwDFrvvmjhYWXV2uLl7LOhdRYdnmK/qTFMwimjD5z5HX/upbn
	KBxe+F/wOEO9VmrB7MFnnFeXZcG08no2NMUHSjzBm/Kgj6hsHE1Bk7xpTQebWih45wQprSHf4/s
	3JfK/pU+Kz936TVPx9KdXmwltNnHadxItu5uAtivDpBE0WhLMbV380sGbIYTymHJfLnhWb3oC0j
	adS9nRhiGtAeS8c+Tu5GB4MZZ2VX1ox+JRai+TQPGcgwDusYmvVUvX4PE1WG0RvjVvh6vkBW8Zp
	hvJu/H7Ao7vBM/AWbnf+EEqh21FzqwRweW5bwQuYoNKkyvaRuPqjj3yueLkd6g7A3DD6ZpdKfvD
	CmunnxFGxhwuqzl/fUHVcH
X-Received: by 2002:a05:600c:64cd:b0:487:1fbf:e0bb with SMTP id 5b1f17b1804b1-488996a1c9dmr103185605e9.6.1775305087673;
        Sat, 04 Apr 2026 05:18:07 -0700 (PDT)
Received: from MEROWN ([85.93.99.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm346987485e9.7.2026.04.04.05.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:18:07 -0700 (PDT)
From: Daniil Bulgar <bulgardaniil18@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniil Bulgar <bulgardaniil18@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: pci: cleanup and refactor tracing functions
Date: Sat,  4 Apr 2026 14:16:58 +0200
Message-ID: <20260404121701.47745-1-bulgardaniil18@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58051-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bulgardaniil18@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5A9C139B0D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current tracing in sh_css.c contains
ftrace-like enter/leave logs that clutter
the code and provide little diagnostic value.
This patch removes these redundant traces and
updates the remaining useful logs
to use __func__ for better maintainability.

Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 226 +++++----------------
 1 file changed, 55 insertions(+), 171 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925f..bfa50d7de 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -464,9 +464,6 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 	assert(stream);
 	assert(pipe);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_config_input_network() enter:\n");
-
 	if (pipe->pipeline.stages)
 		binary = pipe->pipeline.stages->binary;
 
@@ -499,8 +496,6 @@ sh_css_config_input_network_2400(struct ia_css_stream *stream)
 		vblank_cycles = vblank_lines * (width + hblank_cycles);
 		sh_css_sp_configure_sync_gen(width, height, hblank_cycles, vblank_cycles);
 	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_config_input_network() leave:\n");
 	return 0;
 }
 
@@ -848,8 +843,6 @@ static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
 {
 	bool rc;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_translate_stream_cfg_to_isys_stream_descr() enter:\n");
 	rc  = sh_css_translate_stream_cfg_to_input_system_input_port_id(stream_cfg,
 		isys_stream_descr);
 	rc &= sh_css_translate_stream_cfg_to_input_system_input_port_type(stream_cfg,
@@ -863,10 +856,6 @@ static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
 	isys_stream_descr->linked_isys_stream_id = (int8_t)
 		stream_cfg->isys_config[isys_stream_idx].linked_isys_stream_id;
 
-	if (IS_ISP2401)
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "sh_css_translate_stream_cfg_to_isys_stream_descr() leave:\n");
-
 	return rc;
 }
 
@@ -899,7 +888,7 @@ sh_css_config_input_network_2401(struct ia_css_stream *stream)
 
 	assert(stream);
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_config_input_network() enter 0x%p:\n", stream);
+			    "%s enter 0x%p:\n", __func__, stream);
 
 	if (stream->config.continuous) {
 		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE)
@@ -982,10 +971,6 @@ sh_css_config_input_network_2401(struct ia_css_stream *stream)
 			return -EINVAL;
 		}
 	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_config_input_network() leave:\n");
-
 	return 0;
 }
 
@@ -1201,16 +1186,10 @@ sh_css_invalidate_shading_tables(struct ia_css_stream *stream)
 
 	assert(stream);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_invalidate_shading_tables() enter:\n");
-
 	for (i = 0; i < stream->num_pipes; i++) {
 		assert(stream->pipes[i]);
 		sh_css_pipe_free_shading_table(stream->pipes[i]);
 	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_invalidate_shading_tables() leave: return_void\n");
 }
 
 static void
@@ -1314,8 +1293,6 @@ ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
 	if (!fw)
 		return -EINVAL;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_load_firmware() enter\n");
-
 	/* make sure we initialize my_css */
 	if (my_css.flush != env->cpu_mem_env.flush) {
 		ia_css_reset_defaults(&my_css);
@@ -1326,7 +1303,6 @@ ia_css_load_firmware(struct device *dev, const struct ia_css_env *env,
 	if (!err)
 		err = ia_css_binary_init_infos();
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_load_firmware() leave\n");
 	return err;
 }
 
@@ -1864,7 +1840,7 @@ pipe_release_pipe_num(unsigned int pipe_num)
 	my_css.all_pipes[pipe_num] = NULL;
 	my_css.pipe_counter--;
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "pipe_release_pipe_num (%d)\n", pipe_num);
+			    "%s (%d)\n", __func__, pipe_num);
 }
 
 static int
@@ -1946,8 +1922,8 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 			if (pipe->pipe_settings.preview.copy_pipe) {
 				err = ia_css_pipe_destroy(pipe->pipe_settings.preview.copy_pipe);
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-						    "ia_css_pipe_destroy(): destroyed internal copy pipe err=%d\n",
-						    err);
+						    "%s: destroyed internal copy pipe err=%d\n",
+						    __func__, err);
 			}
 		}
 		break;
@@ -1960,8 +1936,8 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 			if (pipe->pipe_settings.video.copy_pipe) {
 				err = ia_css_pipe_destroy(pipe->pipe_settings.video.copy_pipe);
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-						    "ia_css_pipe_destroy(): destroyed internal copy pipe err=%d\n",
-						    err);
+						    "%s: destroyed internal copy pipe err=%d\n",
+						    __func__, err);
 			}
 		}
 		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
@@ -1998,8 +1974,6 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 void
 ia_css_uninit(void)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_uninit() enter: void\n");
-
 	sh_css_params_free_default_gdc_lut();
 
 	/* cleanup generic data */
@@ -2021,8 +1995,6 @@ ia_css_uninit(void)
 	sh_css_sp_reset_global_vars();
 
 	ia_css_isys_uninit();
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_uninit() leave: return_void\n");
 }
 
 int ia_css_irq_translate(
@@ -2035,7 +2007,8 @@ int ia_css_irq_translate(
 	/* irq_infos can be NULL, but that would make the function useless */
 	/* assert(irq_infos != NULL); */
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_irq_translate() enter: irq_infos=%p\n", irq_infos);
+			    "%s enter: irq_infos=%p\n",
+			    __func__, irq_infos);
 
 	while (status == hrt_isp_css_irq_status_more_irqs) {
 		status = virq_get_channel_id(&irq);
@@ -2085,8 +2058,8 @@ int ia_css_irq_translate(
 		*irq_infos = infos;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_irq_translate() leave: irq_infos=%u\n",
-			    infos);
+			    "%s leave: irq_infos=%u\n",
+			    __func__, infos);
 
 	return 0;
 }
@@ -2155,10 +2128,9 @@ sh_css_get_sw_interrupt_value(unsigned int irq)
 	unsigned int irq_value;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_get_sw_interrupt_value() enter: irq=%d\n", irq);
+			    "%s enter: irq=%d\n", __func__, irq);
 	irq_value = sh_css_sp_get_sw_interrupt_value(irq);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_get_sw_interrupt_value() leave: irq_value=%d\n", irq_value);
+
 	return irq_value;
 }
 
@@ -2179,8 +2151,6 @@ static int load_copy_binary(
 	/* next_binary can be NULL */
 	assert(pipe);
 	assert(copy_binary);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "load_copy_binary() enter:\n");
 
 	if (next_binary) {
 		copy_out_info = next_binary->in_frame_info;
@@ -2254,12 +2224,12 @@ alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 
 	if (pipe->stream->config.pack_raw_pixels) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW_PACKED\n");
+				    "%s IA_CSS_FRAME_FORMAT_RAW_PACKED\n", __func__);
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
 	} else
 	{
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW\n");
+				    "%s IA_CSS_FRAME_FORMAT_RAW\n", __func__);
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW;
 	}
 
@@ -2543,8 +2513,6 @@ static int add_firmwares(
 	struct ia_css_pipeline_stage_desc stage_desc;
 
 	/* all args can be NULL ??? */
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "add_firmwares() enter:\n");
 
 	for (; fw; fw = fw->next) {
 		struct ia_css_frame *out[IA_CSS_BINARY_MAX_OUTPUT_PORTS] = {NULL};
@@ -2604,9 +2572,6 @@ static int add_vf_pp_stage(
 	ia_css_pipe_util_create_output_frames(out_frames);
 	me = &pipe->pipeline;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "add_vf_pp_stage() enter:\n");
-
 	*vf_pp_stage = NULL;
 
 	last_fw = last_output_firmware(pipe->vf_stage);
@@ -2653,8 +2618,6 @@ static int add_yuv_scaler_stage(
 	assert(me);
 	assert(yuv_scaler_binary);
 	assert(pre_vf_pp_stage);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "add_yuv_scaler_stage() enter:\n");
 
 	*pre_vf_pp_stage = NULL;
 	ia_css_pipe_util_create_output_frames(out_frames);
@@ -2684,9 +2647,6 @@ static int add_yuv_scaler_stage(
 	/* If a firmware produce vf_pp output, we set that as vf_pp input */
 	(*pre_vf_pp_stage)->args.vf_downscale_log2 =
 	    yuv_scaler_binary->vf_downscale_log2;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "add_yuv_scaler_stage() leave:\n");
 	return err;
 }
 
@@ -2710,8 +2670,6 @@ static int add_capture_pp_stage(
 	assert(me);
 	assert(capture_pp_binary);
 	assert(capture_pp_stage);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "add_capture_pp_stage() enter:\n");
 
 	*capture_pp_stage = NULL;
 	ia_css_pipe_util_create_output_frames(out_frames);
@@ -2765,7 +2723,6 @@ static void sh_css_setup_queues(void)
 	sp_dmem_store_uint32(SP0_ID,
 			     (unsigned int)sp_address_of(host_sp_queues_initialized),
 			     (uint32_t)(1));
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "sh_css_setup_queues() leave:\n");
 }
 
 static int
@@ -3519,8 +3476,9 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		ddr_buffer.payload.frame.flashed = 0;
 
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_pipe_enqueue_buffer() buf_type=%d, data(DDR address)=0x%x\n",
-				    buf_type, buffer->data.frame->data);
+				    "%s buf_type=%d, data(DDR address)=0x%x\n",
+				    __func__, buf_type,
+				    buffer->data.frame->data);
 
 	}
 
@@ -3763,8 +3721,9 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 				}
 
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-						    "ia_css_pipe_dequeue_buffer() buf_type=%d, data(DDR address)=0x%x\n",
-						    buf_type, buffer->data.frame->data);
+						    "%s buf_type=%d, data(DDR address)=0x%x\n",
+						    __func__, buf_type,
+						    buffer->data.frame->data);
 
 				break;
 			case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
@@ -4211,7 +4170,8 @@ void
 sh_css_enable_cont_capt(bool enable, bool stop_copy_preview)
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_enable_cont_capt() enter: enable=%d\n", enable);
+			    "%s enter: enable=%d\n",
+			    __func__, enable);
 //my_css.cont_capt = enable;
 	my_css.stop_copy_preview = stop_copy_preview;
 }
@@ -4223,13 +4183,14 @@ sh_css_continuous_is_enabled(uint8_t pipe_num)
 	bool continuous;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_continuous_is_enabled() enter: pipe_num=%d\n", pipe_num);
+			    "%s enter: pipe_num=%d\n",
+			    __func__, pipe_num);
 
 	pipe = find_pipe_by_num(pipe_num);
 	continuous = pipe && pipe->stream->config.continuous;
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "sh_css_continuous_is_enabled() leave: enable=%d\n",
-			    continuous);
+			    "%s leave: enable=%d\n",
+			    __func__, continuous);
 	return continuous;
 }
 
@@ -4240,7 +4201,6 @@ ia_css_stream_get_max_buffer_depth(struct ia_css_stream *stream,
 {
 	if (!buffer_depth)
 		return -EINVAL;
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_max_buffer_depth() enter: void\n");
 	(void)stream;
 	*buffer_depth = NUM_CONTINUOUS_FRAMES;
 	return 0;
@@ -4249,7 +4209,9 @@ ia_css_stream_get_max_buffer_depth(struct ia_css_stream *stream,
 int
 ia_css_stream_set_buffer_depth(struct ia_css_stream *stream, int buffer_depth)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_set_buffer_depth() enter: num_frames=%d\n", buffer_depth);
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
+			    "%s enter: num_frames=%d\n",
+			    __func__, buffer_depth);
 	(void)stream;
 	if (buffer_depth > NUM_CONTINUOUS_FRAMES || buffer_depth < 1)
 		return -EINVAL;
@@ -4266,7 +4228,6 @@ ia_css_stream_get_buffer_depth(struct ia_css_stream *stream,
 {
 	if (!buffer_depth)
 		return -EINVAL;
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_buffer_depth() enter: void\n");
 	(void)stream;
 	*buffer_depth = stream->config.target_num_cont_raw_buf;
 	return 0;
@@ -4278,7 +4239,7 @@ sh_css_get_mipi_sizes_for_check(const unsigned int port, const unsigned int idx)
 	OP___assert(port < N_CSI_PORTS);
 	OP___assert(idx  < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT);
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_get_mipi_sizes_for_check(port %d, idx %d): %d\n",
+			    "%s(port %d, idx %d): %d\n", __func__,
 			    port, idx, my_css.mipi_sizes_for_check[port][idx]);
 	return my_css.mipi_sizes_for_check[port][idx];
 }
@@ -4327,9 +4288,6 @@ sh_css_pipe_get_shading_info(struct ia_css_pipe *pipe,
 	int err = 0;
 	struct ia_css_binary *binary = NULL;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_pipe_get_shading_info() enter:\n");
-
 	binary = ia_css_pipe_get_shading_correction_binary(pipe);
 
 	if (binary) {
@@ -4615,7 +4573,8 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		if (need_vf_pp) {
 			/* save the current vf_info format for restoration later */
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "load_video_binaries() need_vf_pp; find video binary with YUV_LINE again\n");
+				"%s need_vf_pp; find video binary with YUV_LINE again\n",
+				__func__);
 
 			vf_info_format = video_vf_info->format;
 
@@ -4659,8 +4618,8 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		pipe->num_invalid_frames *= 2;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "load_video_binaries() num_invalid_frames=%d dvs_frame_delay=%d\n",
-			    pipe->num_invalid_frames, pipe->dvs_frame_delay);
+			    "%s num_invalid_frames=%d dvs_frame_delay=%d\n",
+			    __func__, pipe->num_invalid_frames, pipe->dvs_frame_delay);
 
 	/* pqiao TODO: temp hack for PO, should be removed after offline YUVPP is enabled */
 	if (!IS_ISP2401) {
@@ -4855,8 +4814,6 @@ int sh_css_pipe_get_viewfinder_frame_info(
 	assert(info);
 
 	/* We could print the pointer as input arg, and the values as output */
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_pipe_get_viewfinder_frame_info() enter: void\n");
 
 	if (pipe->mode == IA_CSS_PIPE_ID_CAPTURE &&
 	    (pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW ||
@@ -4866,11 +4823,8 @@ int sh_css_pipe_get_viewfinder_frame_info(
 	*info = pipe->vf_output_info[idx];
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_pipe_get_viewfinder_frame_info() leave: \
-		info.res.width=%d, info.res.height=%d, \
-		info.padded_width=%d, info.format=%d, \
-		info.raw_bit_depth=%d, info.raw_bayer_order=%d\n",
-			    info->res.width, info->res.height,
+			    "%s leave: info.res.width=%d, info.res.height=%d, info.padded_width=%d, info.format=%d, info.raw_bit_depth=%d, info.raw_bayer_order=%d\n",
+			    __func__, info->res.width, info->res.height,
 			    info->padded_width, info->format,
 			    info->raw_bit_depth, info->raw_bayer_order);
 
@@ -5619,7 +5573,6 @@ static bool copy_on_sp(struct ia_css_pipe *pipe)
 	bool rval;
 
 	assert(pipe);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "copy_on_sp() enter:\n");
 
 	rval = true;
 
@@ -5802,9 +5755,6 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 	assert(in_info);
 	assert(out_info);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_pipe_create_cas_scaler_desc() enter:\n");
-
 	/* We assume that this function is used only for single output port case. */
 	descr->num_output_stage = 1;
 
@@ -5902,9 +5852,6 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		tmp_in_info = descr->internal_out_info[i];
 	}
 ERR:
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_pipe_create_cas_scaler_desc() leave, err=%d\n",
-			    err);
 	return err;
 }
 
@@ -5926,9 +5873,6 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 
 	unsigned int max_scale_factor_per_stage = MAX_PREFERRED_YUV_DS_PER_STEP;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_pipe_create_cas_scaler_desc() enter:\n");
-
 	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
 		out_info[i] = NULL;
 		vf_out_info[i] = NULL;
@@ -6065,17 +6009,12 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		tmp_in_info = descr->internal_out_info[i];
 	}
 ERR:
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_pipe_create_cas_scaler_desc() leave, err=%d\n",
-			    err);
 	return err;
 }
 
 static void ia_css_pipe_destroy_cas_scaler_desc(struct ia_css_cas_binary_descr
 	*descr)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_pipe_destroy_cas_scaler_desc() enter:\n");
 	kfree(descr->in_info);
 	descr->in_info = NULL;
 	kfree(descr->internal_out_info);
@@ -6086,8 +6025,6 @@ static void ia_css_pipe_destroy_cas_scaler_desc(struct ia_css_cas_binary_descr
 	descr->vf_info = NULL;
 	kfree(descr->is_output_stage);
 	descr->is_output_stage = NULL;
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_pipe_destroy_cas_scaler_desc() leave\n");
 }
 
 static int
@@ -6269,9 +6206,6 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 ERR:
 	if (need_scaler)
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "load_yuvpp_binaries() leave, err=%d\n",
-			    err);
 	return err;
 }
 
@@ -6381,7 +6315,6 @@ sh_css_pipe_load_binaries(struct ia_css_pipe *pipe)
 	int err = 0;
 
 	assert(pipe);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "sh_css_pipe_load_binaries() enter:\n");
 
 	/* PIPE_MODE_COPY has no binaries, but has output frames to outside*/
 	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY)
@@ -6680,9 +6613,6 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 	int err = 0;
 	struct ia_css_pipeline_stage_desc stage_desc;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "create_host_copy_pipeline() enter:\n");
-
 	/* pipeline already created as part of create_host_pipeline_structure */
 	me = &pipe->pipeline;
 	ia_css_pipeline_clean(me);
@@ -6708,10 +6638,6 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 
 	ia_css_pipeline_finalize_stages(&pipe->pipeline,
 					pipe->stream->config.continuous);
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "create_host_copy_pipeline() leave:\n");
-
 	return err;
 }
 
@@ -6727,8 +6653,6 @@ create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe)
 	enum sh_css_queue_id queue_id;
 	unsigned int max_input_width = MAX_VECTORS_PER_INPUT_LINE_CONT * ISP_VEC_NELEMS;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "create_host_isyscopy_capture_pipeline() enter:\n");
 	ia_css_pipeline_clean(me);
 
 	/* Construct out_frame info */
@@ -6753,9 +6677,6 @@ create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe)
 
 	ia_css_pipeline_finalize_stages(me, pipe->stream->config.continuous);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "create_host_isyscopy_capture_pipeline() leave:\n");
-
 	return err;
 }
 
@@ -7098,9 +7019,6 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	}
 	ia_css_pipeline_finalize_stages(&pipe->pipeline, pipe->stream->config.continuous);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "create_host_regular_capture_pipeline() leave:\n");
-
 	return 0;
 }
 
@@ -7189,9 +7107,6 @@ sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 	assert(pipe);
 	assert(info);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_pipe_get_output_frame_info() enter:\n");
-
 	*info = pipe->output_info[idx];
 	if (copy_on_sp(pipe) &&
 	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8) {
@@ -7206,9 +7121,6 @@ sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 		info->raw_bit_depth =
 		ia_css_pipe_util_pipe_input_format_bpp(pipe);
 	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_pipe_get_output_frame_info() leave:\n");
 	return 0;
 }
 
@@ -7280,16 +7192,12 @@ ia_css_pipeline_uses_params(struct ia_css_pipeline *me)
 	assert(me);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_pipeline_uses_params() enter: me=%p\n", me);
+			    "%s enter: me=%p\n", __func__, me);
 
 	for (stage = me->stages; stage; stage = stage->next)
 		if (stage->binary_info && stage->binary_info->enable.params) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_pipeline_uses_params() leave: return_bool=true\n");
 			return true;
 		}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_pipeline_uses_params() leave: return_bool=false\n");
 	return false;
 }
 
@@ -7350,14 +7258,11 @@ int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
 		return -EINVAL;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_stream_capture() enter: num_captures=%d, skip=%d, offset=%d\n",
-			    num_captures, skip, offset);
+			    "%s enter: num_captures=%d, skip=%d, offset=%d\n",
+			    __func__, num_captures, skip, offset);
 
 	/* Check if the tag descriptor is valid */
 	if (num_captures < SH_CSS_MINIMUM_TAG_ID) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_stream_capture() leave: return_err=%d\n",
-				    -EINVAL);
 		return -EINVAL;
 	}
 
@@ -7370,7 +7275,7 @@ int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
 	if (!sh_css_sp_is_running()) {
 		/* SP is not running. The queues are not valid */
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_stream_capture() leaving:queues unavailable\n");
+				    "%s :queues unavailable\n", __func__);
 		return -EBUSY;
 	}
 
@@ -7382,10 +7287,6 @@ int ia_css_stream_capture(struct ia_css_stream *stream, int num_captures,
 	 */
 	return_err = ia_css_bufq_enqueue_tag_cmd((uint32_t)encoded_tag_descr);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_stream_capture() leave: return_err=%d\n",
-			    return_err);
-
 	return return_err;
 }
 
@@ -7405,9 +7306,6 @@ sh_css_init_host_sp_control_vars(void)
 
 	unsigned int i;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_init_host_sp_control_vars() enter: void\n");
-
 	fw = &sh_css_sp_fw;
 	HIVE_ADDR_ia_css_ispctrl_sp_isp_started = fw->info.sp.isp_started;
 
@@ -7440,9 +7338,6 @@ sh_css_init_host_sp_control_vars(void)
 		sh_css_update_host2sp_num_mipi_frames
 		(my_css.num_mipi_frames[i]);
 	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "sh_css_init_host_sp_control_vars() leave: return_void\n");
 }
 
 /*
@@ -7454,7 +7349,6 @@ ia_css_pipe_config ia_css_pipe_default_config = DEFAULT_PIPE_CONFIG;
 
 void ia_css_pipe_config_defaults(struct ia_css_pipe_config *pipe_config)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_config_defaults()\n");
 	memcpy(pipe_config, &ia_css_pipe_default_config, sizeof(*pipe_config));
 }
 
@@ -7477,7 +7371,6 @@ ia_css_pipe_extra_config_defaults(struct ia_css_pipe_extra_config *extra_config)
 
 void ia_css_stream_config_defaults(struct ia_css_stream_config *stream_config)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_config_defaults()\n");
 	assert(stream_config);
 	memset(stream_config, 0, sizeof(*stream_config));
 	stream_config->online = true;
@@ -7658,21 +7551,19 @@ int
 ia_css_pipe_get_info(const struct ia_css_pipe *pipe,
 		     struct ia_css_pipe_info *pipe_info)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_pipe_get_info()\n");
 	if (!pipe_info) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
-				    "ia_css_pipe_get_info: pipe_info cannot be NULL\n");
+				    "%s: pipe_info cannot be NULL\n", __func__);
 		return -EINVAL;
 	}
 	if (!pipe || !pipe->stream) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
-				    "ia_css_pipe_get_info: ia_css_stream_create needs to be called before ia_css_[stream/pipe]_get_info\n");
+			"%s: call ia_css_stream_create before ia_css_[stream/pipe]_get_info\n",
+			__func__);
 		return -EINVAL;
 	}
 	/* we succeeded return the info */
 	*pipe_info = pipe->info;
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_get_info() leave\n");
 	return 0;
 }
 
@@ -7872,7 +7763,8 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				my_css.mipi_frame_size[port] = stream_config->mipi_buffer_config.size_mem_words;
 			} else {
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-						    "ia_css_stream_create() exit: error, need to set mipi frame size.\n");
+						    "%s: unset mipi frame size.\n",
+						    __func__);
 				assert(stream_config->mipi_buffer_config.size_mem_words != 0);
 				err = -EINVAL;
 				IA_CSS_LEAVE_ERR(err);
@@ -7887,7 +7779,8 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				    stream_config->mipi_buffer_config.nof_mipi_buffers;
 			} else {
 				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-						    "ia_css_stream_create() exit: error, need to set number of mipi frames.\n");
+						    "%s: unset number of mipi frames.\n",
+						    __func__);
 				assert(stream_config->mipi_buffer_config.nof_mipi_buffers != 0);
 				err = -EINVAL;
 				IA_CSS_LEAVE_ERR(err);
@@ -8311,7 +8204,6 @@ int
 ia_css_stream_get_info(const struct ia_css_stream *stream,
 		       struct ia_css_stream_info *stream_info)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_info: enter/exit\n");
 	assert(stream);
 	assert(stream_info);
 
@@ -8375,11 +8267,10 @@ ia_css_stream_stop(struct ia_css_stream *stream)
 {
 	int err = 0;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop() enter/exit\n");
 	assert(stream);
 	assert(stream->last_pipe);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop: stopping %d\n",
-			    stream->last_pipe->mode);
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "%s: stopping %d\n",
+			    __func__, stream->last_pipe->mode);
 
 	/* De-initialize mipi size checks */
 	if (!IS_ISP2401 && stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
@@ -8426,7 +8317,6 @@ ia_css_stream_unload(struct ia_css_stream *stream)
 	int i;
 
 	assert(stream);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_unload() enter,\n");
 	/* some checks */
 	assert(stream);
 	for (i = 0; i < MAX_ACTIVE_STREAMS; i++)
@@ -8434,17 +8324,18 @@ ia_css_stream_unload(struct ia_css_stream *stream)
 			int j;
 
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_stream_unload(): unloading %d (%p)\n", i,
+					    "%s: unloading %d (%p)\n",
+					    __func__, i,
 					    my_css_save.stream_seeds[i].stream);
 			ia_css_stream_destroy(stream);
 			for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)
 				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_stream_unload(): after unloading %d (%p)\n", i,
+					    "%s: after unloading %d (%p)\n",
+					    __func__, i,
 					    my_css_save.stream_seeds[i].stream);
 			break;
 		}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_unload() exit,\n");
 	return 0;
 }
 
@@ -8452,7 +8343,6 @@ int
 ia_css_temp_pipe_to_pipe_id(const struct ia_css_pipe *pipe,
 			    enum ia_css_pipe_id *pipe_id)
 {
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_temp_pipe_to_pipe_id() enter/exit\n");
 	if (pipe)
 		*pipe_id = pipe->mode;
 	else
@@ -8809,14 +8699,11 @@ ia_css_update_continuous_frames(struct ia_css_stream *stream)
 	struct ia_css_pipe *pipe;
 	unsigned int i;
 
-	ia_css_debug_dtrace(
-	    IA_CSS_DEBUG_TRACE,
-	    "sh_css_update_continuous_frames() enter:\n");
-
 	if (!stream) {
 		ia_css_debug_dtrace(
 		    IA_CSS_DEBUG_TRACE,
-		    "sh_css_update_continuous_frames() leave: invalid stream, return_void\n");
+		    "%s leave: invalid stream, return_void\n",
+		    __func__);
 		return -EINVAL;
 	}
 
@@ -8829,9 +8716,6 @@ ia_css_update_continuous_frames(struct ia_css_stream *stream)
 
 	sh_css_update_host2sp_cont_num_raw_frames
 	(stream->config.target_num_cont_raw_buf, true);
-	ia_css_debug_dtrace(
-	    IA_CSS_DEBUG_TRACE,
-	    "sh_css_update_continuous_frames() leave: return_void\n");
 
 	return 0;
 }
-- 
2.53.0


