Return-Path: <linux-media+bounces-58090-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFsKOdSI02lEiwcAu9opvQ
	(envelope-from <linux-media+bounces-58090-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 12:20:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9147E3A2C4A
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 12:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 778253008993
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 10:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9642D3290C3;
	Mon,  6 Apr 2026 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="h3UWFny+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069F327C09
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470795; cv=none; b=E3uYmJDz0aH3AXTzZAl+dzWlaLcxN7QxvE9+EQ4bSkSc//fRvKl9mH2KR24U/UNE28ItSgeYUicVpJiBt9UueuvDAOdpJ4JKVBh9z+3TwYyjGJpGg3wIdGHG05+2u+9A2+/nDKDY1l09+qXKXRTaV9TlpNsvC8nZOMsTZGuX9XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470795; c=relaxed/simple;
	bh=EWtbV05iLD/vAolX/931VZaBbU/m/hDYmS7SzY6zwPY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CL/apEBrUnfu6ASiVZEZBgHZTguxueZfqCC4Jfe8HMJGcgGun0douNcqNW8lhexqch+o3wTHTP8hoWjWluQdc3GNP3NWbVjylkwTU+/AK8xVSU/6dE9cBTLx4nUgi/2RLGblbF7jqfa3SZ70+H2/XESySN8Ta+Ft6wlC5GyQuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=h3UWFny+; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775470786; x=1775729986;
	bh=2CGSMmqZdPTgnMH99i2IZgKi3HZinBkkv7lT+JA3kCM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=h3UWFny+oxdvxN4+fT3+LD0AZXhJJu6tkIPtq6QYNqpk/P6enscMtqYEcp/zjTRze
	 iLHcd6B1KC7K0XHCmQkW8451MgPTngIMXhM/D9f7LWwgtw+RizYzUEBECLBT4GIaRF
	 IYNifOrDjv0PRBj9XIFLXCQ0oJrX6XLN3I2AlfEk65ItinGMO3gaDz6nXMxTascEGX
	 qEpwrNr7k3U1j5K80le22IsAxY4dNbgTc6JI/nZeOmOzAEN6j8pd+xngblNtshLY1m
	 ee122jicw3uBGxnOinQkm/Nf0Hn0RNbO7EurmWoJGZegcbOPfA1ur1z4faoLiGkq4J
	 174vPqI0aWBGA==
Date: Mon, 06 Apr 2026 10:19:41 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <20260406-milos-iris-v1-2-17ed0167ba6f@pm.me>
In-Reply-To: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
References: <20260406-milos-iris-v1-0-17ed0167ba6f@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f69f3fa144524c9ec771ca15441fca415c247942
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58090-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid,30fps:email,0.0.0.30:email]
X-Rspamd-Queue-Id: 9147E3A2C4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Milos Iris codec. This only supports the variant
found on the SM7635-AB that has half of it's pipes disabled via efuse.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 106 ++++
 .../media/platform/qcom/iris/iris_platform_milos.h | 655 +++++++++++++++++=
++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 4 files changed, 766 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/driv=
ers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..c8a9f122952e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,6 +41,7 @@ enum pipe_type {
 =09PIPE_4 =3D 4,
 };
=20
+extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/driver=
s/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..78cd4656b981 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
=20
+#include "iris_platform_milos.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
@@ -1317,3 +1318,108 @@ const struct iris_platform_data qcs8300_data =3D {
 =09.enc_op_int_buf_tbl =3D sm8550_enc_op_int_buf_tbl,
 =09.enc_op_int_buf_tbl_size =3D ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - vpu_ops to iris_vpu2_ops
+ * - icc_tbl to milos_icc_table
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - opp_pd_tbl to milos_opp_pd_table
+ * - fwname to "qcom/vpu/vpu20_2v.mbn"
+ * - inst_iris_fmts to platform_fmts_milos_dec
+ * - inst_caps to platform_inst_cap_milos
+ * - inst_fw_caps_dec to inst_fw_cap_milos_dec
+ * - inst_fw_caps_enc to inst_fw_cap_milos_enc
+ * - ubwc_config to ubwc_config_milos
+ * - num_vpp_pipe to 2
+ * - max_core_mbpf scaled for 4k@30fps dec/enc
+ * - max_core_mbps scaled for 4k@30fps dec & 1080p@30 enc
+ */
+const struct iris_platform_data milos_data =3D {
+=09.get_instance =3D iris_hfi_gen2_get_instance,
+=09.init_hfi_command_ops =3D iris_hfi_gen2_command_ops_init,
+=09.init_hfi_response_ops =3D iris_hfi_gen2_response_ops_init,
+=09.get_vpu_buffer_size =3D iris_vpu_buf_size,
+=09.vpu_ops =3D &iris_vpu2_ops,
+=09.set_preset_registers =3D iris_set_sm8550_preset_registers,
+=09.icc_tbl =3D milos_icc_table,
+=09.icc_tbl_size =3D ARRAY_SIZE(milos_icc_table),
+=09.clk_rst_tbl =3D sm8650_clk_reset_table,
+=09.clk_rst_tbl_size =3D ARRAY_SIZE(sm8650_clk_reset_table),
+=09.bw_tbl_dec =3D sm8550_bw_table_dec,
+=09.bw_tbl_dec_size =3D ARRAY_SIZE(sm8550_bw_table_dec),
+=09.pmdomain_tbl =3D sm8550_pmdomain_table,
+=09.pmdomain_tbl_size =3D ARRAY_SIZE(sm8550_pmdomain_table),
+=09.opp_pd_tbl =3D milos_opp_pd_table,
+=09.opp_pd_tbl_size =3D ARRAY_SIZE(milos_opp_pd_table),
+=09.clk_tbl =3D sm8550_clk_table,
+=09.clk_tbl_size =3D ARRAY_SIZE(sm8550_clk_table),
+=09.opp_clk_tbl =3D sm8550_opp_clk_table,
+=09/* Upper bound of DMA address range */
+=09.dma_mask =3D 0xe0000000 - 1,
+=09.fwname =3D "qcom/vpu/vpu20_2v.mbn",
+=09.pas_id =3D IRIS_PAS_ID,
+=09.inst_iris_fmts =3D platform_fmts_milos_dec,
+=09.inst_iris_fmts_size =3D ARRAY_SIZE(platform_fmts_milos_dec),
+=09.inst_caps =3D &platform_inst_cap_milos,
+=09.inst_fw_caps_dec =3D inst_fw_cap_milos_dec,
+=09.inst_fw_caps_dec_size =3D ARRAY_SIZE(inst_fw_cap_milos_dec),
+=09.inst_fw_caps_enc =3D inst_fw_cap_milos_enc,
+=09.inst_fw_caps_enc_size =3D ARRAY_SIZE(inst_fw_cap_milos_enc),
+=09.tz_cp_config_data =3D tz_cp_config_sm8550,
+=09.tz_cp_config_data_size =3D ARRAY_SIZE(tz_cp_config_sm8550),
+=09.core_arch =3D VIDEO_ARCH_LX,
+=09.hw_response_timeout =3D HW_RESPONSE_TIMEOUT_VALUE,
+=09.ubwc_config =3D &ubwc_config_milos,
+=09.num_vpp_pipe =3D 2,
+=09.max_session_count =3D 16,
+=09.max_core_mbpf =3D ((4096 * 2176) / 256) * 2,
+=09.max_core_mbps =3D ((3840 * 2176) / 256) * 30 + ((1920 * 1088) / 256) *=
 30,
+=09.dec_input_config_params_default =3D
+=09=09sm8550_vdec_input_config_params_default,
+=09.dec_input_config_params_default_size =3D
+=09=09ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+=09.dec_input_config_params_hevc =3D
+=09=09sm8550_vdec_input_config_param_hevc,
+=09.dec_input_config_params_hevc_size =3D
+=09=09ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+=09.dec_input_config_params_vp9 =3D
+=09=09sm8550_vdec_input_config_param_vp9,
+=09.dec_input_config_params_vp9_size =3D
+=09=09ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+=09.dec_output_config_params =3D
+=09=09sm8550_vdec_output_config_params,
+=09.dec_output_config_params_size =3D
+=09=09ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+=09.enc_input_config_params =3D
+=09=09sm8550_venc_input_config_params,
+=09.enc_input_config_params_size =3D
+=09=09ARRAY_SIZE(sm8550_venc_input_config_params),
+=09.enc_output_config_params =3D
+=09=09sm8550_venc_output_config_params,
+=09.enc_output_config_params_size =3D
+=09=09ARRAY_SIZE(sm8550_venc_output_config_params),
+
+=09.dec_input_prop =3D sm8550_vdec_subscribe_input_properties,
+=09.dec_input_prop_size =3D ARRAY_SIZE(sm8550_vdec_subscribe_input_propert=
ies),
+=09.dec_output_prop_avc =3D sm8550_vdec_subscribe_output_properties_avc,
+=09.dec_output_prop_avc_size =3D
+=09=09ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+=09.dec_output_prop_hevc =3D sm8550_vdec_subscribe_output_properties_hevc,
+=09.dec_output_prop_hevc_size =3D
+=09=09ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+=09.dec_output_prop_vp9 =3D sm8550_vdec_subscribe_output_properties_vp9,
+=09.dec_output_prop_vp9_size =3D
+=09=09ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+
+=09.dec_ip_int_buf_tbl =3D sm8550_dec_ip_int_buf_tbl,
+=09.dec_ip_int_buf_tbl_size =3D ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+=09.dec_op_int_buf_tbl =3D sm8550_dec_op_int_buf_tbl,
+=09.dec_op_int_buf_tbl_size =3D ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+=09.enc_ip_int_buf_tbl =3D sm8550_enc_ip_int_buf_tbl,
+=09.enc_ip_int_buf_tbl_size =3D ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+=09.enc_op_int_buf_tbl =3D sm8550_enc_op_int_buf_tbl,
+=09.enc_op_int_buf_tbl_size =3D ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/drive=
rs/media/platform/qcom/iris/iris_platform_milos.h
new file mode 100644
index 000000000000..dacd3ad5aa7e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
@@ -0,0 +1,655 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __IRIS_PLATFORM_MILOS_H__
+#define __IRIS_PLATFORM_MILOS_H__
+
+#define MILOS_V1_MAX_BITRATE=09100000000
+#define MILOS_V1_MAX_FPS=09240
+
+static struct iris_fmt platform_fmts_milos_dec[] =3D {
+=09[IRIS_FMT_H264] =3D {
+=09=09.pixfmt =3D V4L2_PIX_FMT_H264,
+=09=09.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+=09},
+=09[IRIS_FMT_HEVC] =3D {
+=09=09.pixfmt =3D V4L2_PIX_FMT_HEVC,
+=09=09.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+=09},
+=09[IRIS_FMT_VP9] =3D {
+=09=09.pixfmt =3D V4L2_PIX_FMT_VP9,
+=09=09.type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+=09},
+};
+
+static const struct platform_inst_fw_cap inst_fw_cap_milos_dec[] =3D {
+=09{
+=09=09.cap_id =3D PROFILE_H264,
+=09=09.min =3D V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+=09=09.max =3D V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
+=09=09.value =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+=09=09.hfi_id =3D HFI_PROP_PROFILE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_u32_enum,
+=09},
+=09{
+=09=09.cap_id =3D PROFILE_HEVC,
+=09=09.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+=09=09.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+=09=09.value =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+=09=09.hfi_id =3D HFI_PROP_PROFILE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_u32_enum,
+=09},
+=09{
+=09=09.cap_id =3D PROFILE_VP9,
+=09=09.min =3D V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+=09=09.max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
+=09=09.value =3D V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+=09=09.hfi_id =3D HFI_PROP_PROFILE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_u32_enum,
+=09},
+=09{
+=09=09.cap_id =3D LEVEL_H264,
+=09=09.min =3D V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+=09=09.max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
+=09=09.value =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+=09=09.hfi_id =3D HFI_PROP_LEVEL,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_u32_enum,
+=09},
+=09{
+=09=09.cap_id =3D LEVEL_HEVC,
+=09=09.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+=09=09.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5),
+=09=09.value =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
+=09=09.hfi_id =3D HFI_PROP_LEVEL,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_u32_enum,
+=09},
+=09{
+=09=09.cap_id =3D LEVEL_VP9,
+=09=09.min =3D V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
+=09=09.max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_0,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0),
+=09=09.value =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_0,
+=09=09.hfi_id =3D HFI_PROP_LEVEL,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_u32_enum,
+=09},
+=09{
+=09=09.cap_id =3D TIER,
+=09=09.min =3D V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
+=09=09.max =3D V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
+=09=09.value =3D V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
+=09=09.hfi_id =3D HFI_PROP_TIER,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_u32_enum,
+=09},
+=09{
+=09=09.cap_id =3D INPUT_BUF_HOST_MAX_COUNT,
+=09=09.min =3D DEFAULT_MAX_HOST_BUF_COUNT,
+=09=09.max =3D DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_MAX_HOST_BUF_COUNT,
+=09=09.hfi_id =3D HFI_PROP_BUFFER_HOST_MAX_COUNT,
+=09=09.flags =3D CAP_FLAG_INPUT_PORT,
+=09=09.set =3D iris_set_u32,
+=09},
+=09{
+=09=09.cap_id =3D STAGE,
+=09=09.min =3D STAGE_1,
+=09=09.max =3D STAGE_2,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D STAGE_2,
+=09=09.hfi_id =3D HFI_PROP_STAGE,
+=09=09.set =3D iris_set_stage,
+=09},
+=09{
+=09=09.cap_id =3D PIPE,
+=09=09/* .max, .min and .value are set via platform data */
+=09=09.step_or_mask =3D 1,
+=09=09.hfi_id =3D HFI_PROP_PIPE,
+=09=09.set =3D iris_set_pipe,
+=09},
+=09{
+=09=09.cap_id =3D POC,
+=09=09.min =3D 0,
+=09=09.max =3D 2,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 1,
+=09=09.hfi_id =3D HFI_PROP_PIC_ORDER_CNT_TYPE,
+=09},
+=09{
+=09=09.cap_id =3D CODED_FRAMES,
+=09=09.min =3D CODED_FRAMES_PROGRESSIVE,
+=09=09.max =3D CODED_FRAMES_PROGRESSIVE,
+=09=09.step_or_mask =3D 0,
+=09=09.value =3D CODED_FRAMES_PROGRESSIVE,
+=09=09.hfi_id =3D HFI_PROP_CODED_FRAMES,
+=09},
+=09{
+=09=09.cap_id =3D BIT_DEPTH,
+=09=09.min =3D BIT_DEPTH_8,
+=09=09.max =3D BIT_DEPTH_8,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BIT_DEPTH_8,
+=09=09.hfi_id =3D HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+=09},
+=09{
+=09=09.cap_id =3D RAP_FRAME,
+=09=09.min =3D 0,
+=09=09.max =3D 1,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 1,
+=09=09.hfi_id =3D HFI_PROP_DEC_START_FROM_RAP_FRAME,
+=09=09.flags =3D CAP_FLAG_INPUT_PORT,
+=09=09.set =3D iris_set_u32,
+=09},
+};
+
+static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] =3D {
+=09{
+=09=09.cap_id =3D PROFILE_H264,
+=09=09.min =3D V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+=09=09.max =3D V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
+=09=09.value =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+=09=09.hfi_id =3D HFI_PROP_PROFILE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_profile,
+=09},
+=09{
+=09=09.cap_id =3D PROFILE_HEVC,
+=09=09.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+=09=09.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
+=09=09.value =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+=09=09.hfi_id =3D HFI_PROP_PROFILE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_profile,
+=09},
+=09{
+=09=09.cap_id =3D LEVEL_H264,
+=09=09.min =3D V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+=09=09.max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
+=09=09.value =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
+=09=09.hfi_id =3D HFI_PROP_LEVEL,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_level,
+=09},
+=09{
+=09=09.cap_id =3D LEVEL_HEVC,
+=09=09.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+=09=09.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5),
+=09=09.value =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
+=09=09.hfi_id =3D HFI_PROP_LEVEL,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_level,
+=09},
+=09{
+=09=09.cap_id =3D STAGE,
+=09=09.min =3D STAGE_1,
+=09=09.max =3D STAGE_2,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D STAGE_2,
+=09=09.hfi_id =3D HFI_PROP_STAGE,
+=09=09.set =3D iris_set_stage,
+=09},
+=09{
+=09=09.cap_id =3D HEADER_MODE,
+=09=09.min =3D V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+=09=09.max =3D V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+=09=09.value =3D V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+=09=09.hfi_id =3D HFI_PROP_SEQ_HEADER_MODE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_header_mode_gen2,
+=09},
+=09{
+=09=09.cap_id =3D PREPEND_SPSPPS_TO_IDR,
+=09=09.min =3D 0,
+=09=09.max =3D 1,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09},
+=09{
+=09=09.cap_id =3D BITRATE,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_V1_MAX_BITRATE,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_TOTAL_BITRATE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D BITRATE_PEAK,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_V1_MAX_BITRATE,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_TOTAL_PEAK_BITRATE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_peak_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D BITRATE_MODE,
+=09=09.min =3D V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+=09=09.max =3D V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+=09=09.value =3D V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+=09=09.hfi_id =3D HFI_PROP_RATE_CONTROL,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_bitrate_mode_gen2,
+=09},
+=09{
+=09=09.cap_id =3D FRAME_SKIP_MODE,
+=09=09.min =3D V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+=09=09.max =3D V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+=09=09.value =3D V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09},
+=09{
+=09=09.cap_id =3D FRAME_RC_ENABLE,
+=09=09.min =3D 0,
+=09=09.max =3D 1,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 1,
+=09},
+=09{
+=09=09.cap_id =3D GOP_SIZE,
+=09=09.min =3D 0,
+=09=09.max =3D INT_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 2 * DEFAULT_FPS - 1,
+=09=09.hfi_id =3D HFI_PROP_MAX_GOP_FRAMES,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_u32,
+=09},
+=09{
+=09=09.cap_id =3D ENTROPY_MODE,
+=09=09.min =3D V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+=09=09.max =3D V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+=09=09.value =3D V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+=09=09.hfi_id =3D HFI_PROP_CABAC_SESSION,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_entropy_mode_gen2,
+=09},
+=09{
+=09=09.cap_id =3D MIN_FRAME_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09=09.hfi_id =3D HFI_PROP_MIN_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_min_qp,
+=09},
+=09{
+=09=09.cap_id =3D MIN_FRAME_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09=09.hfi_id =3D HFI_PROP_MIN_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_min_qp,
+=09},
+=09{
+=09=09.cap_id =3D MAX_FRAME_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09=09.hfi_id =3D HFI_PROP_MAX_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_max_qp,
+=09},
+=09{
+=09=09.cap_id =3D MAX_FRAME_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09=09.hfi_id =3D HFI_PROP_MAX_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_max_qp,
+=09},
+=09{
+=09=09.cap_id =3D I_FRAME_MIN_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09},
+=09{
+=09=09.cap_id =3D I_FRAME_MIN_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09},
+=09{
+=09=09.cap_id =3D P_FRAME_MIN_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09},
+=09{
+=09=09.cap_id =3D P_FRAME_MIN_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09},
+=09{
+=09=09.cap_id =3D B_FRAME_MIN_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09},
+=09{
+=09=09.cap_id =3D B_FRAME_MIN_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MIN_QP_8BIT,
+=09},
+=09{
+=09=09.cap_id =3D I_FRAME_MAX_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09},
+=09{
+=09=09.cap_id =3D I_FRAME_MAX_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09},
+=09{
+=09=09.cap_id =3D P_FRAME_MAX_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09},
+=09{
+=09=09.cap_id =3D P_FRAME_MAX_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09},
+=09{
+=09=09.cap_id =3D B_FRAME_MAX_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09},
+=09{
+=09=09.cap_id =3D B_FRAME_MAX_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D MAX_QP,
+=09},
+=09{
+=09=09.cap_id =3D I_FRAME_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_QP,
+=09=09.hfi_id =3D HFI_PROP_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_frame_qp,
+=09},
+=09{
+=09=09.cap_id =3D I_FRAME_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_QP,
+=09=09.hfi_id =3D HFI_PROP_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_frame_qp,
+=09},
+=09{
+=09=09.cap_id =3D P_FRAME_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_QP,
+=09=09.hfi_id =3D HFI_PROP_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_frame_qp,
+=09},
+=09{
+=09=09.cap_id =3D P_FRAME_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_QP,
+=09=09.hfi_id =3D HFI_PROP_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_frame_qp,
+=09},
+=09{
+=09=09.cap_id =3D B_FRAME_QP_H264,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_QP,
+=09=09.hfi_id =3D HFI_PROP_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_frame_qp,
+=09},
+=09{
+=09=09.cap_id =3D B_FRAME_QP_HEVC,
+=09=09.min =3D MIN_QP_8BIT,
+=09=09.max =3D MAX_QP,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_QP,
+=09=09.hfi_id =3D HFI_PROP_QP_PACKED,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_frame_qp,
+=09},
+=09{
+=09=09.cap_id =3D INPUT_BUF_HOST_MAX_COUNT,
+=09=09.min =3D DEFAULT_MAX_HOST_BUF_COUNT,
+=09=09.max =3D DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_MAX_HOST_BUF_COUNT,
+=09=09.hfi_id =3D HFI_PROP_BUFFER_HOST_MAX_COUNT,
+=09=09.flags =3D CAP_FLAG_INPUT_PORT,
+=09=09.set =3D iris_set_u32,
+=09},
+=09{
+=09=09.cap_id =3D OUTPUT_BUF_HOST_MAX_COUNT,
+=09=09.min =3D DEFAULT_MAX_HOST_BUF_COUNT,
+=09=09.max =3D DEFAULT_MAX_HOST_BURST_BUF_COUNT,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D DEFAULT_MAX_HOST_BUF_COUNT,
+=09=09.hfi_id =3D HFI_PROP_BUFFER_HOST_MAX_COUNT,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_u32,
+=09},
+=09{
+=09=09.cap_id =3D ROTATION,
+=09=09.min =3D 0,
+=09=09.max =3D 270,
+=09=09.step_or_mask =3D 90,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_ROTATION,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_rotation,
+=09},
+=09{
+=09=09.cap_id =3D HFLIP,
+=09=09.min =3D 0,
+=09=09.max =3D 1,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_FLIP,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_flip,
+=09},
+=09{
+=09=09.cap_id =3D VFLIP,
+=09=09.min =3D 0,
+=09=09.max =3D 1,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_FLIP,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_flip,
+=09},
+=09{
+=09=09.cap_id =3D IR_TYPE,
+=09=09.min =3D V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+=09=09.max =3D V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+=09=09.step_or_mask =3D BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_=
RANDOM),
+=09=09.value =3D V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09},
+=09{
+=09=09.cap_id =3D IR_PERIOD,
+=09=09.min =3D 0,
+=09=09.max =3D INT_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_ir_period,
+=09},
+};
+
+static struct platform_inst_caps platform_inst_cap_milos =3D {
+=09.min_frame_width =3D 96,
+=09.max_frame_width =3D 4096,
+=09.min_frame_height =3D 96,
+=09.max_frame_height =3D 4096,
+=09.max_mbpf =3D (4096 * 2176) / 256,
+=09.mb_cycles_vpp =3D 200,
+=09.mb_cycles_fw =3D 326389,
+=09.mb_cycles_fw_vpp =3D 44156,
+=09.num_comv =3D 0,
+=09.max_frame_rate =3D MILOS_V1_MAX_FPS,
+=09.max_operating_rate =3D MILOS_V1_MAX_FPS,
+};
+
+static const struct icc_info milos_icc_table[] =3D {
+=09{ "cpu-cfg",    1000, 1000     },
+=09{ "video-mem",  1000, 10000000 },
+};
+
+static const char * const milos_opp_pd_table[] =3D { "cx", "mx" };
+
+static struct ubwc_config_data ubwc_config_milos =3D {
+=09.max_channels =3D 8,
+=09.mal_length =3D 32,
+=09.highest_bank_bit =3D 15,
+=09.bank_swzl_level =3D 0,
+=09.bank_swz2_level =3D 1,
+=09.bank_swz3_level =3D 1,
+=09.bank_spreading =3D 1,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/=
platform/qcom/iris/iris_probe.c
index ddaacda523ec..ff3f4f1dc2ff 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -348,6 +348,10 @@ static const struct dev_pm_ops iris_pm_ops =3D {
 };
=20
 static const struct of_device_id iris_dt_match[] =3D {
+=09{
+=09=09.compatible =3D "qcom,milos-iris",
+=09=09.data =3D &milos_data,
+=09},
 =09{
 =09=09.compatible =3D "qcom,qcs8300-iris",
 =09=09.data =3D &qcs8300_data,

--=20
2.53.0



