Return-Path: <linux-media+bounces-39876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F9B25FA5
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E878C7B3CDE
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3102B2ECD34;
	Thu, 14 Aug 2025 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzshN/Pf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4282EA497
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161583; cv=none; b=uXe6RTIRzXDabjoORXNveyopCPixvHOELpPLC7mY92gHTJrU+qrbmMpQ5TCNCa/i/CP1KbtXjiDAAQ/Rd1fzf5dQfzvjQA/tL9FR1k0688wzAtAxMT7GPGX5gSt9nXteHuwJaZHAh8uUlNVWXWudzaX/G+zIo184R+eizfAdL0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161583; c=relaxed/simple;
	bh=mYyDYspAu0fUCbPnUErnST1m7NLVnYaJcGPUj9JufqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JnUFOcFgzm6zePm8otW1ZAAV+4uCeI4Lskm1Nrcu7D9wjrCFyaNJRsgUil6JSggYNclql+VC3kq0UbaOnKYasfbpFYx+98hRzWwIw9PTSwaYKIb/4b8I+Yt9cFiC+fSQNYDRFPRgtf82FhHE340ulyET5F0/akwftbsskkV/Nfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzshN/Pf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLrdOW012543
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7+b/qQOykps
	0yAY5//rOfRcyNIuwWZicShO434EstvQ=; b=bzshN/PfLZqPt2sQqOSwAuY5m/t
	Sw1ziyY5Ae/givBBwTk1FUEhDwqRwOwL/08F0EmTAdhFF8j4Mbg9d2HWB8Jv6Dj/
	fb6p3OtMYGUJkIP1cXJb9hhOxT6CglnJ1Hc27bAnVRmTwtXLrassahW8z2h4EZaU
	AQwr8tXu3K5FqTWiLDjMZ+0D2jIRlHiRIMCgvgSft5hO7LsQYmbaIdxm5nUt5cuN
	zJLU8BK0yL8ROiToJAR/yQlTQrGq+mBohirYQgeA3/Q6KABuCZ0nROzwQXZcWkA9
	i88j8PSl1IhamqWBJAgdxMILcWFfXwBgJze4bQezT9LM5tZN//SjPo6ULvw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxd6a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:52:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109c629f1so8931241cf.3
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 01:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161578; x=1755766378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+b/qQOykps0yAY5//rOfRcyNIuwWZicShO434EstvQ=;
        b=XGfrTNg48+sh/xeTGGPXOCOQBdCb/HCSDG8j2umMcZWh5U4d8qExQN65Sul3lbKQNL
         zRCOm8ZJQDv6dthBBYunOw7DtOX093bRwwx7t3MIn/6IYIjFdWY58gYZ2DnNGWxqDtxi
         Wawux1BhfY8isbcAJdERi3RGwTNum7cMAN490JLub/cKX8ZgNL3ksEIuqgI5dq9g+2yk
         vM1hmSQaq2dWBCRtuAJY8aCT62iuNfR7GPwSFrxsU2tariougsVZeLqi22PctMQVJaIs
         Zx4l+N0QH2Zcvrl8bj1iP7nUYY+rCuOTbsSQFyuegHi50lbHdzQHrKEUYOugfS95xrrN
         S1XA==
X-Gm-Message-State: AOJu0YyGGvTZEwJQa1h2334V4BppYEKsWg+7z4RW3q8lOuHnn1bvKsnu
	WTCWiNPNIclu+s9nXQw0P00Mv8tNbWJ4rUlofAd545cQZC+QpHiSCPOE+Kedp6ax4T0daTR7vns
	nd4uGfEyzXHtmw5TT6O8z2w2Q9rXUVRhmsB5R1suyr12P1NtT1fu3gfIBhQFeQwnSMA==
X-Gm-Gg: ASbGncubJ36S6CJ3GTY/kd3psZy6niucVFw+lTCy09BC1PF9hQQhEHI0wgGmfBcC7/J
	kW0iH+oQK2z/7+dvdNMi8yE9k5DKmTsLL7wubtEV15Z6oUpHmLUD9sumBlUFjEy8ZKRVNNsvsAr
	oC6E5CQA4GpmqmPW9SmcTIP+bpdMNj1e172AYZ0/6Da8ewvdEYpHlBihi2GmxgNQD1CVlIbKfIf
	9MIJDxaQ0kGoyS5Jhu80+EUfgsA+dKy9sxdb2CAAvNmiII86gLXNXiimKPDD2X16Jz+hGl7v7Nv
	vjtkhH4jXOd33Agi82yAEhB/61IgMR77OS/WuWYBSizLS8gda/TgHz8sxc4q/t8gGZzPk7BwyQI
	74QHQ+LSA1qpI
X-Received: by 2002:a05:622a:4c0c:b0:4ab:3c02:c449 with SMTP id d75a77b69052e-4b10c5213a6mr28755351cf.17.1755161578061;
        Thu, 14 Aug 2025 01:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH/8S1BbpqlPcbKCaDzkJJa1l21FtNFbIQklNdHeu2LD5i/fucTmPrUPEAYksCNFN11cjAng==
X-Received: by 2002:a05:622a:4c0c:b0:4ab:3c02:c449 with SMTP id d75a77b69052e-4b10c5213a6mr28755051cf.17.1755161577413;
        Thu, 14 Aug 2025 01:52:57 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm13155895e9.2.2025.08.14.01.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:52:56 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/8] media: venus: Add framework support for AR50_LITE video core
Date: Thu, 14 Aug 2025 10:52:43 +0200
Message-Id: <20250814085248.2371130-4-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX8O98hxf5xQrB
 jfkwX1o6AsoklXr0JQDqZM80kB23BOITXNzChZxWxpYDtbUy+qWOkc3eqCbjcCfUUUsZgttRmu1
 7D4uznvBPCm4BtpinHZHwRy38KhnM38oAnR6OuJeF7Nl4AqXZeJIeYBAxl7K8kPrisjdPs6md7o
 FMYBJ4VP9B+wOQ7DFP5n7giy4SmPBahO8LLEcIx9V7i/BWKW2wkuLbp2l/Ol1r8fH7a7tS9kASg
 hVKSSUQjvmb8mJ4fizE54xvxl7kLL5umSR0tL1JU0MolH9C/PNXcLbFtLbLOR+wNVIDmgyXwtz4
 Mvs0mnNwwAkRBjcwjMYBCS5fhoKJTRycQ8mFN091K6IiwMe6zMQivdYtG+UvjkXYP+4HqFokhy7
 75TpA+by
X-Proofpoint-GUID: 9kuWKgBKYMGgA4Jgwqjq-c22105kxlDd
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689da3eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=uVAX4AjkR_zw2avW950A:9
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9kuWKgBKYMGgA4Jgwqjq-c22105kxlDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

The AR50_LITE is a simplified variant of the AR50 video core, designed for
power and cost-efficient platforms.

It supports hardware-accelerated decoding of H.264, HEVC, and VP9 formats,
and provides encoding support for H.264 and HEVC.

This commit prepares the framework to enable the AR50_LITE (it does not
enable it).

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c      | 15 ++++++--
 drivers/media/platform/qcom/venus/core.h      |  5 +++
 drivers/media/platform/qcom/venus/firmware.c  | 10 ++++++
 drivers/media/platform/qcom/venus/firmware.h  |  1 +
 drivers/media/platform/qcom/venus/helpers.c   | 12 +++++--
 .../media/platform/qcom/venus/hfi_parser.c    |  2 +-
 .../media/platform/qcom/venus/hfi_platform.c  | 23 ++++++++-----
 .../media/platform/qcom/venus/hfi_platform.h  | 34 ++++++++++++-------
 .../platform/qcom/venus/hfi_platform_v4.c     | 33 +++++++++++++-----
 .../platform/qcom/venus/hfi_platform_v6.c     | 33 +++++++++++++-----
 drivers/media/platform/qcom/venus/hfi_venus.c | 25 ++++++++++----
 .../media/platform/qcom/venus/hfi_venus_io.h  |  4 +++
 .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
 13 files changed, 145 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5d76e50234f6..bc7b255357cf 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
-		core->vbif_base = core->base + VBIF_BASE;
+	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
 		core->cpu_base = core->base + CPU_BASE_V6;
 		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
 		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
 		core->wrapper_base = core->base + WRAPPER_BASE_V6;
 		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
-		core->aon_base = core->base + AON_BASE_V6;
+		if (IS_AR50_LITE(core)) {
+			core->vbif_base = NULL;
+			core->aon_base = NULL;
+		} else {
+			core->vbif_base = core->base + VBIF_BASE;
+			core->aon_base = core->base + AON_BASE_V6;
+		}
 	} else {
 		core->vbif_base = core->base + VBIF_BASE;
 		core->cpu_base = core->base + CPU_BASE;
@@ -456,6 +461,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_firmware_deinit;
 
+	ret = venus_firmware_cfg(core);
+	if (ret)
+		goto err_venus_shutdown;
+
 	ret = hfi_core_resume(core, true);
 	if (ret)
 		goto err_venus_shutdown;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 58da4752569a..7506f5d0f609 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -533,6 +533,11 @@ struct venus_inst {
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
 
+static inline bool is_lite(struct venus_core *core)
+{
+	return IS_AR50_LITE(core);
+}
+
 #define ctrl_to_inst(ctrl)	\
 	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
 
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 3666675ae298..2483998360f7 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -207,6 +207,16 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	return 0;
 }
 
+int venus_firmware_cfg(struct venus_core *core)
+{
+	void __iomem *cpu_cs_base = core->cpu_cs_base;
+
+	if (IS_AR50_LITE(core))
+		writel(CPU_CS_VCICMD_ARP_OFF, cpu_cs_base + CPU_CS_VCICMD);
+
+	return 0;
+}
+
 int venus_boot(struct venus_core *core)
 {
 	struct device *dev = core->dev;
diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
index ead39e3797f0..87e1d922b369 100644
--- a/drivers/media/platform/qcom/venus/firmware.h
+++ b/drivers/media/platform/qcom/venus/firmware.h
@@ -10,6 +10,7 @@ struct device;
 int venus_firmware_init(struct venus_core *core);
 void venus_firmware_deinit(struct venus_core *core);
 int venus_firmware_check(struct venus_core *core);
+int venus_firmware_cfg(struct venus_core *core);
 int venus_boot(struct venus_core *core);
 int venus_shutdown(struct venus_core *core);
 int venus_set_hw_state(struct venus_core *core, bool suspend);
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 8295542e1a7c..2e4363f82231 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1715,11 +1715,17 @@ int venus_helper_session_init(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
+	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(inst->core,
+								  version,
+								  codec,
 								  session_type);
-	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
+	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(inst->core,
+								  version,
+								  codec,
 								  session_type);
-	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
+	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(inst->core,
+								       version,
+								       codec,
 								       session_type);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 1b3db2caa99f..92765f9c8873 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -282,7 +282,7 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 		return ret;
 
 	if (plat->capabilities)
-		caps = plat->capabilities(&entries);
+		caps = plat->capabilities(core, &entries);
 
 	if (!caps || !entries || !count)
 		return -EINVAL;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 643e5aa138f5..cde7f93045ac 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -21,7 +21,9 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 }
 
 unsigned long
-hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_vpp_freq(struct venus_core *core,
+				enum hfi_version version, u32 codec,
+				u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -31,13 +33,15 @@ hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session
 		return 0;
 
 	if (plat->codec_vpp_freq)
-		freq = plat->codec_vpp_freq(session_type, codec);
+		freq = plat->codec_vpp_freq(core, session_type, codec);
 
 	return freq;
 }
 
 unsigned long
-hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_vsp_freq(struct venus_core *core,
+				enum hfi_version version, u32 codec,
+				u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -47,13 +51,15 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
 		return 0;
 
 	if (plat->codec_vpp_freq)
-		freq = plat->codec_vsp_freq(session_type, codec);
+		freq = plat->codec_vsp_freq(core, session_type, codec);
 
 	return freq;
 }
 
 unsigned long
-hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_lp_freq(struct venus_core *core,
+			       enum hfi_version version, u32 codec,
+			       u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -63,13 +69,14 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
 		return 0;
 
 	if (plat->codec_lp_freq)
-		freq = plat->codec_lp_freq(session_type, codec);
+		freq = plat->codec_lp_freq(core, session_type, codec);
 
 	return freq;
 }
 
 int
-hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs,
+			u32 *dec_codecs, u32 *count)
 {
 	const struct hfi_platform *plat;
 
@@ -78,7 +85,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
 		return -EINVAL;
 
 	if (plat->codecs)
-		plat->codecs(enc_codecs, dec_codecs, count);
+		plat->codecs(core, enc_codecs, dec_codecs, count);
 
 	if (IS_IRIS2_1(core)) {
 		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index ec89a90a8129..5e4f8013a6b1 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -47,11 +47,16 @@ struct hfi_platform_codec_freq_data {
 };
 
 struct hfi_platform {
-	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
-	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
-	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
-	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
-	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
+	unsigned long (*codec_vpp_freq)(struct venus_core *core,
+					u32 session_type, u32 codec);
+	unsigned long (*codec_vsp_freq)(struct venus_core *core,
+					u32 session_type, u32 codec);
+	unsigned long (*codec_lp_freq)(struct venus_core *core,
+				       u32 session_type, u32 codec);
+	void (*codecs)(struct venus_core *core, u32 *enc_codecs,
+		       u32 *dec_codecs, u32 *count);
+	const struct hfi_plat_caps *(*capabilities)(struct venus_core *core,
+						    unsigned int *entries);
 	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
 		      u32 buftype, struct hfi_buffer_requirements *bufreq);
 };
@@ -60,12 +65,15 @@ extern const struct hfi_platform hfi_plat_v4;
 extern const struct hfi_platform hfi_plat_v6;
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version);
-unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
-					      u32 session_type);
-unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
-					      u32 session_type);
-unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
-					     u32 session_type);
-int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
-			    u32 *count);
+unsigned long hfi_platform_get_codec_vpp_freq(struct venus_core *core,
+					      enum hfi_version version,
+					      u32 codec, u32 session_type);
+unsigned long hfi_platform_get_codec_vsp_freq(struct venus_core *core,
+					      enum hfi_version version,
+					      u32 codec, u32 session_type);
+unsigned long hfi_platform_get_codec_lp_freq(struct venus_core *core,
+					     enum hfi_version version,
+					     u32 codec, u32 session_type);
+int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs,
+			    u32 *dec_codecs, u32 *count);
 #endif
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index e3f0a90a567b..41e4dc28ec1b 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
+#include "core.h"
 #include "hfi_platform.h"
 
 static const struct hfi_plat_caps caps[] = {
@@ -245,14 +246,22 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
-static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+static const struct hfi_plat_caps *get_capabilities(struct venus_core *core,
+						    unsigned int *entries)
 {
+	if (is_lite(core))
+		return NULL;
+
 	*entries = ARRAY_SIZE(caps);
 	return caps;
 }
 
-static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+static void get_codecs(struct venus_core *core,
+		       u32 *enc_codecs, u32 *dec_codecs, u32 *count)
 {
+	if (is_lite(core))
+		return;
+
 	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
 		      HFI_VIDEO_CODEC_VP8;
 	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
@@ -273,12 +282,15 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
 };
 
 static const struct hfi_platform_codec_freq_data *
-get_codec_freq_data(u32 session_type, u32 pixfmt)
+get_codec_freq_data(struct venus_core *core, u32 session_type, u32 pixfmt)
 {
 	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
 	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
 
+	if (is_lite(core))
+		return NULL;
+
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
 			found = &data[i];
@@ -289,33 +301,36 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
 	return found;
 }
 
-static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vpp_freq(struct venus_core *core,
+				    u32 session_type, u32 codec)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	data = get_codec_freq_data(core, session_type, codec);
 	if (data)
 		return data->vpp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vsp_freq(struct venus_core *core,
+				    u32 session_type, u32 codec)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	data = get_codec_freq_data(core, session_type, codec);
 	if (data)
 		return data->vsp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+static unsigned long codec_lp_freq(struct venus_core *core,
+				   u32 session_type, u32 codec)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	data = get_codec_freq_data(core, session_type, codec);
 	if (data)
 		return data->low_power_freq;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index 4e8af645f8b9..d8568c08cc36 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
+#include "core.h"
 #include "hfi_platform.h"
 
 static const struct hfi_plat_caps caps[] = {
@@ -245,14 +246,22 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
-static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+static const struct hfi_plat_caps *get_capabilities(struct venus_core *core,
+						    unsigned int *entries)
 {
+	if (is_lite(core))
+		return NULL;
+
 	*entries = ARRAY_SIZE(caps);
 	return caps;
 }
 
-static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+static void get_codecs(struct venus_core *core, u32 *enc_codecs,
+		       u32 *dec_codecs, u32 *count)
 {
+	if (is_lite(core))
+		return;
+
 	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
 		      HFI_VIDEO_CODEC_VP8;
 	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
@@ -273,12 +282,15 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
 };
 
 static const struct hfi_platform_codec_freq_data *
-get_codec_freq_data(u32 session_type, u32 pixfmt)
+get_codec_freq_data(struct venus_core *core, u32 session_type, u32 pixfmt)
 {
 	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
 	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
 
+	if (is_lite(core))
+		return NULL;
+
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
 			found = &data[i];
@@ -289,33 +301,36 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
 	return found;
 }
 
-static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vpp_freq(struct venus_core *core, u32 session_type,
+				    u32 codec)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	data = get_codec_freq_data(core, session_type, codec);
 	if (data)
 		return data->vpp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vsp_freq(struct venus_core *core, u32 session_type,
+				    u32 codec)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	data = get_codec_freq_data(core, session_type, codec);
 	if (data)
 		return data->vsp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+static unsigned long codec_lp_freq(struct venus_core *core, u32 session_type,
+				   u32 codec)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	data = get_codec_freq_data(core, session_type, codec);
 	if (data)
 		return data->low_power_freq;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index cec7f5964d3d..d3da35f67fd5 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -380,7 +380,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
 	void __iomem *cpu_ic_base = hdev->core->cpu_ic_base;
 	u32 clear_bit;
 
-	if (IS_V6(hdev->core))
+	if (IS_V6(hdev->core) || (IS_V4(hdev->core) && is_lite(hdev->core)))
 		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT_V6);
 	else
 		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT);
@@ -501,9 +501,11 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	if (count >= max_tries)
 		ret = -ETIMEDOUT;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
 		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
-		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
+
+		if (!IS_AR50_LITE(hdev->core))
+			writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
 	}
 
 	return ret;
@@ -569,6 +571,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 	u32 mask_val;
 	int ret;
 
+	if (IS_AR50_LITE(hdev->core))
+		return 0;
+
 	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
 		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
 
@@ -1138,7 +1143,13 @@ static irqreturn_t venus_isr(struct venus_core *core)
 	wrapper_base = hdev->core->wrapper_base;
 
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
-	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
+
+	if (IS_AR50_LITE(core)) {
+		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
+		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE ||
+		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
+			hdev->irq_status = status;
+	} else if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
 		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
 		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
 		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
@@ -1150,7 +1161,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
 			hdev->irq_status = status;
 	}
 	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
-	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
+	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
 		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
 
 	return IRQ_WAKE_THREAD;
@@ -1535,7 +1546,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
@@ -1555,7 +1566,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
index 9735a246ce36..f2c3064c44ae 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
@@ -51,6 +51,9 @@
 /* Venus cpu */
 #define CPU_CS_SCIACMDARG3			0x58
 
+#define CPU_CS_VCICMD				0x20
+#define CPU_CS_VCICMD_ARP_OFF			BIT(0)
+
 #define SFR_ADDR				0x5c
 #define MMAP_ADDR				0x60
 #define UC_REGION_ADDR				0x64
@@ -100,6 +103,7 @@
 #define WRAPPER_INTR_MASK_A2HCPU_MASK		0x4
 #define WRAPPER_INTR_MASK_A2HCPU_SHIFT		0x2
 
+#define WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE	0x10
 #define WRAPPER_INTR_STATUS_A2HWD_MASK_V6	0x8
 #define WRAPPER_INTR_MASK_A2HWD_BASK_V6		0x8
 
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index e32f8862a9f9..88618378129a 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -52,7 +52,7 @@ static int core_clks_enable(struct venus_core *core)
 		dev_pm_opp_put(opp);
 
 	for (i = 0; i < res->clks_num; i++) {
-		if (IS_V6(core)) {
+		if (IS_V6(core) || (IS_V4(core) && is_lite(core))) {
 			ret = clk_set_rate(core->clks[i], freq);
 			if (ret)
 				goto err;
-- 
2.34.1


