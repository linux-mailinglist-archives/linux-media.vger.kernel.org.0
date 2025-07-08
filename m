Return-Path: <linux-media+bounces-37158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA9AFD60C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 20:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8A3427987
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 18:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772E22E92BD;
	Tue,  8 Jul 2025 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAJ8n/Pe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB12E88A9
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 18:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751997947; cv=none; b=b1hcQoBn/+1o8SvorrKZK4f3+71BkrbMDLl9mrMm7FwreMc9cxFJmi+9hmrLj65DNlBEzGs78u4PXvZ0g0GKy0WZFuro5bzx9abSiZfvoJ0FGJMPgrA5Se5gtqhwvDWYgh6We6yE7oR9ZY5Eqm7fj/DlQBmgeoGY+pEe2H873FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751997947; c=relaxed/simple;
	bh=RPrPvvEpNn/ARuaVNHd+GcE7NgZFHqSh8tBOt5Jynz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aJTl8DjN/oX5OjsyLLwZj+M0Cu49zTI4FFKBygvxgqcdIXd6vMkvKQPBq+6B6YPUCSfxHVrbdQ8w0PvpnNFWoMzwwxh5w+1sDFAFQrrwEhkxyRSs/6CWVLbo0lYQG1FMJ9vV2/aZORKCtpsvyE2MM9ud9oeydI3pDwbDNe2fJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAJ8n/Pe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAOF6003435
	for <linux-media@vger.kernel.org>; Tue, 8 Jul 2025 18:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r2hsmPxmoR8
	OiP5n8eICcy6+qgLvWLU8g7rv3qplVvA=; b=VAJ8n/PebHUOICgWaqXYRy1FrgO
	IifyNrEzjnMEJvLZsGp8doM4P5JjV2sMs2NDpLlnKR8TgPg5T9Xh/hFAZhOD6QTl
	qAtkRjfh2N+bGa57TUFJpzg0DcfCJHjqPLMwL6+s8Aks3Sl5NrGDCzWb3TYX23oM
	m9tJVkRW2Un5LiR7GATqAhaOIusPHRzqQw4ETwV3ta1cxmnMRGIvHrm33yEScAR6
	+Mp75q2SHFzZAJLlp4tYQrGD/WQEkjHr9NWLsp4PeElf6dk80R1eEstGXO9kXFnF
	4jx11rm5WlWDXq9e4QMbQymhcFJu0G3NrS0moYpZFh3Pdm8OVDz3yN5Etfw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefh2ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 18:05:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43988c314so80199161cf.2
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 11:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751997943; x=1752602743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2hsmPxmoR8OiP5n8eICcy6+qgLvWLU8g7rv3qplVvA=;
        b=kxy/owst3Hq7hYIz2vYdH4gkmzX+jlibGv25qN9VWto4AFTmhpFOUvYThw2AtinmJz
         8BQZ4oaYExn6FfkmR3Cy3SlN8UWtURqeSt6yZjNkBjCEK0mI9QJ34De4WEn0C6OSHziQ
         SWOLhMqzY9Ei7FZBtjvTEAWKvPtqEFvGLBd8divTE8KS/Xiifq7fTLm7ZXQ/BPabdLoU
         O8lS/bWV/QlIiDMb39DgNhMqSrP3eftHss4G1mI0uO0y/Kp4lePiVn/NIuU4yjKmbj4R
         haVsl6Kgv0GJcT4dGKbxEwMKBa/fK4Epnb4triUtCzbqd2ebSE3xxZhUwqki5I/CLbEv
         rnTg==
X-Gm-Message-State: AOJu0YzmbAypxb7i96mGMW8C4sKgCpSsqIaoK0nK/4sfVcmcHrTBIVV6
	GpbUpIcA7vzjXuUh2PwwvP8Bjkex7+GRy6KxIXwgbbJnsyg49c8PvB6Z9oXO/TKojK4uZ3misCI
	RqbFeMoZWPdT9QugxFnSvl3uELYQRsKZA9zNBiIJ5mFyvsUliE24iMIWqppsn9LMRsQ==
X-Gm-Gg: ASbGncuBORxN361/OndC/V88DrW1HE/YdDqNPUGSSg8EvDpFGXO8rZ1tnaE71/7NwL8
	lyEdi+QeiHx4QHnQqfxV64JWwT31ixH7MgrHUDVD0N29ODdHao4D87hQ6xGzy8qYAP3q1aPcJyY
	hFLMoNVTt4YGHfDNnIMaHhYbJeGHvmfpWVrtWddR59enUG3or1LIq4eUZBXfbe+DTgf2jf/KkZy
	bVit4I88qIiZ/g7mF8CTFqU/TVoz/+nCBahKWz1Bd63rNhitNS7ZrHBm6NC/FfJgmdDUpq3XWwT
	/S2xGBz7a3Op/t+gXm1tkXZsjUaFX+BzU06oOXVQL8d0ZK65By8ekF2uFuaAlKRA1PZmjPTAyQ=
	=
X-Received: by 2002:a05:622a:134a:b0:4a6:f9e1:a84d with SMTP id d75a77b69052e-4a996441f05mr309754701cf.4.1751997942906;
        Tue, 08 Jul 2025 11:05:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv0wlk9nG2jOvTn6rDn/l/iOokos6fbGBQdNtNJ3P5l1AaP2KORuCAmzTIijEe2L0D1zba5w==
X-Received: by 2002:a05:622a:134a:b0:4a6:f9e1:a84d with SMTP id d75a77b69052e-4a996441f05mr309753541cf.4.1751997942139;
        Tue, 08 Jul 2025 11:05:42 -0700 (PDT)
Received: from trex.. (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0a5csm13394906f8f.29.2025.07.08.11.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:05:41 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        robh@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/7] media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
Date: Tue,  8 Jul 2025 20:05:27 +0200
Message-Id: <20250708180530.1384330-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE1MSBTYWx0ZWRfX9Kyoja4/4vHo
 ALq4EGaQhZgAQVNLG1rg1IoVd+8VXXYkCc47pylhRah4plg1RVaewfyOagWWOdoqjIyOJLk81D2
 0rST04iqdjmZ15ic71SK3xpPDeAzmZqR7bW7GA0XAobdSBy48rF3ApgCwqSmiCyVg0dJmR28mxa
 YBkhWKcDkoA+N6kRN28zlhflW7S3YJ4QBQHzLnaiJH5PnciM0gjuI1jHocvk+ksNJNaluno0eax
 aXVPTQFNpeLVNCpumi0QOQgAggVLRHaa6b+Q72XbXoz3lhEsgIzAlUBP6lPWDfw2z91dUK2rNk6
 dqORKOCu2JAFc4IPeV8s+Hw/N/ceMIpXv4DM7jyHsIt/SMq3ex2NfIVMf1PcdB1bnc3CZWImWFI
 wKzgeKTnctGgETSMBC/RUjTQvnhBvc/oMlosnf8oDyFDxGrXpZ0aewe2SpoV/fUAByO8R6MJ
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686d5df8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5l9M9ejOZEj2P9uvktAA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: G6TTLXo3H_7Hsv4mOTU1XY2UnU3Lx8xX
X-Proofpoint-ORIG-GUID: G6TTLXo3H_7Hsv4mOTU1XY2UnU3Lx8xX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080151

Populate the HFI v4 lite capability set used by the AR50_LITE video
core.

These capabilities define the supported codec formats and operational
limits specific to this streamlined VPU variant.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../platform/qcom/venus/hfi_platform_v4.c     | 165 +++++++++++++++---
 1 file changed, 145 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index c8e0f8040649..4b7271468ec4 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -245,25 +245,149 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
+static const struct hfi_plat_caps caps_lite[] = {
+{
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = { HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_VP9,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 7,
+	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
+	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_ENC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
+	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
+	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
+	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
+	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
+	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
+	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
+	.num_caps = 15,
+	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
+	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
+	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_ENC,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
+	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
+	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
+	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
+	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
+	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
+	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
+	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
+	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
+	.num_caps = 15,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
+	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
+	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
+	.num_fmts = 4,
+} };
+
 static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
 						    bool lite)
 {
-	WARN_ON(lite);
+	*entries = lite ? ARRAY_SIZE(caps_lite) : ARRAY_SIZE(caps);
 
-	*entries = ARRAY_SIZE(caps);
-	return caps;
+	return lite ? caps_lite : caps;
 }
 
 static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
 {
-	WARN_ON(lite);
-
-	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
-		      HFI_VIDEO_CODEC_VP8;
-	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
-		      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
-		      HFI_VIDEO_CODEC_MPEG2;
-	*count = 8;
+	if (lite) {
+		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC;
+		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+			      HFI_VIDEO_CODEC_VP9;
+		*count = 5;
+	} else {
+		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+			      HFI_VIDEO_CODEC_VP8;
+		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+			      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
+			      HFI_VIDEO_CODEC_MPEG2;
+		*count = 8;
+	}
 }
 
 static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
@@ -277,14 +401,21 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
 	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
 };
 
+static const struct hfi_platform_codec_freq_data codec_freq_data_lite[] = {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
+};
+
 static const struct hfi_platform_codec_freq_data *
 get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
 {
 	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
-	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
-
-	WARN_ON(lite);
+	const struct hfi_platform_codec_freq_data *data = lite ?
+					codec_freq_data_lite : codec_freq_data;
 
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
@@ -300,8 +431,6 @@ static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	WARN_ON(lite);
-
 	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vpp_freq;
@@ -313,8 +442,6 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	WARN_ON(lite);
-
 	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vsp_freq;
@@ -326,8 +453,6 @@ static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	WARN_ON(lite);
-
 	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->low_power_freq;
-- 
2.34.1


