Return-Path: <linux-media+bounces-66627-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id STt5GcUtSmpj/AAAu9opvQ
	(envelope-from <linux-media+bounces-66627-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:11:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B14709B23
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:11:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=JY4lbXI9;
	dmarc=pass (policy=quarantine) header.from=pm.me;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66627-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66627-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4538300B57D
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 10:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CD3390C9F;
	Sun,  5 Jul 2026 10:11:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D918A391846
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 10:10:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246263; cv=none; b=Cz9kwyEB2MHknTwsMusxjUsQpmFalaB0bZJ4pNfuB48oa/lGtZ8ojGxx/LSSWiHuVTnvxsec6ZuXU0z0T2/fI37dSEbm1GSNr3JWyecO5EJ5BNt4PRcO5o4MseoCycBh3Y4GF5++/o/sDkhWM5GNtzAKaKcZsTcErDzY8dtnjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246263; c=relaxed/simple;
	bh=FsmAE+PCvQvCOTSIvRv3Hy9jJA80MALyDwBkG00Ol7o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tm4YdGYYLFk0yO64IKqXKwl+j2/YJs9450mlO2NCD2LW1YQc3b2zIrciTy4eGBIg5kU18TXU0mwYE4GNcO/1NYLKmdEN/IaiELBaNaxsETB9+lLPTykcemskOdQItSOcOV4q2qVXAlJhEWXWcPvkf6Rph881WT0D0NYLzAuoAz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=JY4lbXI9; arc=none smtp.client-ip=85.9.210.45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783246240; x=1783505440;
	bh=NKcFMuLEz47gVYUmJoo7f69K3786N4qolXFpSe2Kan8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JY4lbXI9PDunvMosKmsPvlgm5uRNK9TQOo0apkRXYU55Gu6KyjkzKwT0LjDr475b9
	 tMikbIDIUNfQxFC2s4zlJ+eGt2NPQ7y3YAiy0U99lFBjGzA6cINY5x9gWYthZVUC6P
	 FRthmvAZr/cAjL2N8EUdZabMIv0gN27FVpDOzbcBEVPYe4gKys52H6vPfAT9ptSMk0
	 KlFEXVeiAJ6x81pZCkuT3q5pD4BOxSoTzSf1nfyouuOLUTfUfWMDFcMJ33xWSlpv4U
	 utv0kscCsvrUJ94vSPSb1IaFX+ek/+cTJDsDliLEP+QcrTKzmsv4dXxBMd+TRqIduA
	 MYGEYT5vglRjg==
Date: Sun, 05 Jul 2026 10:10:35 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] media: iris: Add support for Milos (VPU v2.0)
Message-ID: <20260705-milos-iris-v3-2-8c1353530f24@pm.me>
In-Reply-To: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 0fe0abe578d658ef108c8ff73df5b9df636f3166
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66627-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:from_mime,pm.me:email,pm.me:mid,pm.me:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0B14709B23

Add support for the Milos Iris codec. This only supports the variant
found on the SM7635-AB that has half of it's pipes disabled via efuse.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 883 +++++++++++++++++=
++++
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_milos.h |  28 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  35 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 5 files changed, 952 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/med=
ia/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..5c88312944c9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -11,8 +11,832 @@
 #include "iris_vpu_buffer.h"
=20
 #define VIDEO_ARCH_LX 1
+#define MILOS_BITRATE_MAX=09=09=09100000000
 #define BITRATE_MAX=09=09=09=09245000000
=20
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
+=09=09.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
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
+=09=09.max =3D BIT_DEPTH_10,
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
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_TOTAL_BITRATE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_bitrate_gen2,
+=09},
+=09{
+=09=09.cap_id =3D BITRATE_PEAK,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
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
+=09=09.set =3D iris_set_ir_period_gen2,
+=09},
+=09{
+=09=09.cap_id =3D LTR_COUNT,
+=09=09.min =3D 0,
+=09=09.max =3D MAX_LTR_FRAME_COUNT_GEN2,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_LTR_COUNT,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_ltr_count_gen2,
+=09},
+=09{
+=09=09.cap_id =3D USE_LTR,
+=09=09.min =3D 0,
+=09=09.max =3D ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+=09=09.step_or_mask =3D 0,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_LTR_USE,
+=09=09.flags =3D CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_use_and_mark_ltr,
+=09},
+=09{
+=09=09.cap_id =3D MARK_LTR,
+=09=09.min =3D INVALID_DEFAULT_MARK_OR_USE_LTR,
+=09=09.max =3D (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D INVALID_DEFAULT_MARK_OR_USE_LTR,
+=09=09.hfi_id =3D HFI_PROP_LTR_MARK,
+=09=09.flags =3D CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_use_and_mark_ltr,
+=09},
+=09{
+=09=09.cap_id =3D B_FRAME,
+=09=09.min =3D 0,
+=09=09.max =3D 1,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_MAX_B_FRAMES,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09=09.set =3D iris_set_u32,
+=09},
+=09{
+=09=09.cap_id =3D LAYER_ENABLE,
+=09=09.min =3D 0,
+=09=09.max =3D 1,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT,
+=09},
+=09{
+=09=09.cap_id =3D LAYER_TYPE_H264,
+=09=09.min =3D V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B,
+=09=09.max =3D V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_B) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P),
+=09=09.value =3D V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+=09=09.hfi_id =3D HFI_PROP_LAYER_ENCODING_TYPE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_layer_type,
+=09},
+=09{
+=09=09.cap_id =3D LAYER_TYPE_HEVC,
+=09=09.min =3D V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B,
+=09=09.max =3D V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+=09=09.step_or_mask =3D BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_B) |
+=09=09=09=09BIT(V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P),
+=09=09.value =3D V4L2_MPEG_VIDEO_HEVC_HIERARCHICAL_CODING_P,
+=09=09.hfi_id =3D HFI_PROP_LAYER_ENCODING_TYPE,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+=09=09.set =3D iris_set_layer_type,
+=09},
+=09{
+=09=09.cap_id =3D LAYER_COUNT_H264,
+=09=09.min =3D 0,
+=09=09.max =3D 5,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_LAYER_COUNT,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_count_gen2,
+=09},
+=09{
+=09=09.cap_id =3D LAYER_COUNT_HEVC,
+=09=09.min =3D 0,
+=09=09.max =3D 5,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D 0,
+=09=09.hfi_id =3D HFI_PROP_LAYER_COUNT,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_count_gen2,
+=09},
+=09{
+=09=09.cap_id =3D LAYER0_BITRATE_H264,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER1,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER1_BITRATE_H264,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER2,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER2_BITRATE_H264,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER3,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER3_BITRATE_H264,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER4,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER4_BITRATE_H264,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER5,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER5_BITRATE_H264,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER6,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER0_BITRATE_HEVC,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER1,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER1_BITRATE_HEVC,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER2,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER2_BITRATE_HEVC,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER3,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER3_BITRATE_HEVC,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER4,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER4_BITRATE_HEVC,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER5,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09},
+=09{
+=09=09.cap_id =3D LAYER5_BITRATE_HEVC,
+=09=09.min =3D 1,
+=09=09.max =3D MILOS_BITRATE_MAX,
+=09=09.step_or_mask =3D 1,
+=09=09.value =3D BITRATE_DEFAULT,
+=09=09.hfi_id =3D HFI_PROP_BITRATE_LAYER6,
+=09=09.flags =3D CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+=09=09=09CAP_FLAG_DYNAMIC_ALLOWED,
+=09=09.set =3D iris_set_layer_bitrate,
+=09}
+};
+
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] =3D {
 =09{
 =09=09.cap_id =3D PROFILE_H264,
@@ -1118,3 +1942,62 @@ const struct iris_firmware_data iris_hfi_gen2_data =
=3D {
 =09.enc_op_int_buf_tbl =3D sm8550_enc_op_int_buf_tbl,
 =09.enc_op_int_buf_tbl_size =3D ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+const struct iris_firmware_data iris_hfi_milos_data =3D {
+=09.init_hfi_ops =3D iris_hfi_gen2_sys_ops_init,
+
+=09.core_arch =3D VIDEO_ARCH_LX,
+
+=09.inst_fw_caps_dec =3D inst_fw_cap_milos_dec,
+=09.inst_fw_caps_dec_size =3D ARRAY_SIZE(inst_fw_cap_milos_dec),
+=09.inst_fw_caps_enc =3D inst_fw_cap_milos_enc,
+=09.inst_fw_caps_enc_size =3D ARRAY_SIZE(inst_fw_cap_milos_enc),
+
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
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/driv=
ers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..f57c08990040 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -52,7 +52,9 @@ enum pipe_type {
=20
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
+extern const struct iris_firmware_data iris_hfi_milos_data;
=20
+extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/drive=
rs/media/platform/qcom/iris/iris_platform_milos.h
new file mode 100644
index 000000000000..3b6feeda76cb
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __IRIS_PLATFORM_MILOS_H__
+#define __IRIS_PLATFORM_MILOS_H__
+
+#define MILOS_MAXIMUM_FPS=09240
+
+static const struct icc_info iris_icc_info_milos[] =3D {
+=09{ "cpu-cfg",    1000, 1000     },
+=09{ "video-mem",  1000, 10000000 },
+};
+
+static const char * const milos_opp_pd_table[] =3D { "cx", "mx" };
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
+=09.max_frame_rate =3D MILOS_MAXIMUM_FPS,
+=09.max_operating_rate =3D MILOS_MAXIMUM_FPS,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/driver=
s/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..8dce45f39d40 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -13,9 +13,16 @@
 #include "iris_vpu_common.h"
 #include "iris_instance.h"
=20
+#include "iris_platform_milos.h"
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
=20
+static const struct iris_firmware_desc iris_milos_desc =3D {
+=09.firmware_data =3D &iris_hfi_milos_data,
+=09.get_vpu_buffer_size =3D iris_vpu_buf_size,
+=09.fwname =3D "qcom/vpu/vpu20_p2.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc =3D {
 =09.firmware_data =3D &iris_hfi_gen1_data,
 =09.get_vpu_buffer_size =3D iris_vpu_buf_size,
@@ -64,6 +71,34 @@ static const struct tz_cp_config tz_cp_config_vpu2[] =3D=
 {
 =09},
 };
=20
+const struct iris_platform_data milos_data =3D {
+=09.firmware_desc =3D &iris_milos_desc,
+=09.vpu_ops =3D &iris_vpu2_ops,
+=09.icc_tbl =3D iris_icc_info_milos,
+=09.icc_tbl_size =3D ARRAY_SIZE(iris_icc_info_milos),
+=09.bw_tbl_dec =3D sm8250_bw_table_dec,
+=09.bw_tbl_dec_size =3D ARRAY_SIZE(sm8250_bw_table_dec),
+=09.pmdomain_tbl =3D iris_pmdomain_table_vpu2,
+=09.pmdomain_tbl_size =3D ARRAY_SIZE(iris_pmdomain_table_vpu2),
+=09.opp_pd_tbl =3D milos_opp_pd_table,
+=09.opp_pd_tbl_size =3D ARRAY_SIZE(milos_opp_pd_table),
+=09.clk_tbl =3D sm8250_clk_table,
+=09.clk_tbl_size =3D ARRAY_SIZE(sm8250_clk_table),
+=09.opp_clk_tbl =3D sm8250_opp_clk_table,
+=09.clk_rst_tbl =3D iris_clk_reset_table_vpu2,
+=09.clk_rst_tbl_size =3D ARRAY_SIZE(iris_clk_reset_table_vpu2),
+=09.dma_mask =3D 0xe0000000 - 1,
+=09.inst_iris_fmts =3D iris_fmts_vpu2_dec,
+=09.inst_iris_fmts_size =3D ARRAY_SIZE(iris_fmts_vpu2_dec),
+=09.inst_caps =3D &platform_inst_cap_milos,
+=09.tz_cp_config_data =3D tz_cp_config_vpu2,
+=09.tz_cp_config_data_size =3D ARRAY_SIZE(tz_cp_config_vpu2),
+=09.num_vpp_pipe =3D 2,
+=09.max_session_count =3D 16,
+=09.max_core_mbpf =3D ((4096 * 2176) / 256) * 2,
+=09.max_core_mbps =3D ((3840 * 2176) / 256) * 30 + ((1920 * 1088) / 256) *=
 30,
+};
+
 const struct iris_platform_data sc7280_data =3D {
 =09.firmware_desc =3D &iris_vpu20_p1_gen1_desc,
 =09.vpu_ops =3D &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/=
platform/qcom/iris/iris_probe.c
index c2dcb50a2782..353cda58514c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -360,6 +360,10 @@ static const struct dev_pm_ops iris_pm_ops =3D {
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



