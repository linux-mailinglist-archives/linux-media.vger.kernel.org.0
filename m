Return-Path: <linux-media+bounces-38894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE89AB1AE97
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A365176673
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 06:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B322264BA;
	Tue,  5 Aug 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQBNkk1A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4F6225761
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376287; cv=none; b=bjMRNiR5SM26A/Vo8QMd4RxCZF3hflWQyUWCkn+4FE0hlUQ2rWJPO/ATDH/i6rz4Y91kXOxDWzfYLR/WRDI0VSGCpACNfGpdz3yif85F7pvSsO4EW0l2pzFIxXTj2cd+YH7oR2S92F4N2opI5qLFDoNNl7ZPbq55TPXnbMlekqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376287; c=relaxed/simple;
	bh=ezmsbCjqlnWcx48QRBjlXkmqIy+WPgZsixPM3YLOjn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c74YlOo1OgvHRX/J200FRRyIi8dnDLorb9Oa40GpWUxngu9CcmgK7lMsi6hbd2zrbCxHT+URouQ8NG+9Kp+EMA3mfvwL440sNBw6LTNitmF5xI1y6pJ+BLuH77jiB0cjI+RB9JjB9OxBDLzis6xcO0tQHCeF3P09r1Sx4hLHv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQBNkk1A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5756OOEW021762
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 06:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NhWaIo4GTcz
	dbdTKmyiH3nRkkn38J6k++Rau27lPRqk=; b=JQBNkk1AzHxibPtGDE+lITglDSd
	+QbQcUZ8l6tdTt20c2HIhqJAMcUGgjs4D+/CxS3PM3ieQaAJWMXdmzRdhEfxTk+Q
	SKR9x/Dj/Oe58/UsnWCSNBRsFkJWCOXqGo5IKQfE9hzV8wZKv1UqrQkroZ/vNSgf
	ZYphGRYDCSu8kb3lJsKmBp7qO4q3HUbaPBl1O0hkEz1eKewCEZfHwulCPHm8KTde
	EwOOpDnoB0Q9t8R7G9TfOrsv6dJuUNcJShT5V1GUmJCXZ8LAkvfhh0tWULipVxOa
	qK+YmP9aBJhqsYqeI93N8X++8MwMQLiX8FeKA6HKQymsi3biEZRPbSXSpQw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc7e6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 06:44:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70771983a52so99479966d6.2
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 23:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376281; x=1754981081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhWaIo4GTczdbdTKmyiH3nRkkn38J6k++Rau27lPRqk=;
        b=szP17aI0GZftP2gxyxmAXzHfTyiMCiG1+LMWk/6kzv1i1QJkKkZY1d8cUIH8LwgCO6
         I12KPxdHWUwL1MO4oviBlrfX10T5JUwamP95NsBcFmoWArQmm2zmMstDcVPN7Wx5rwxf
         RFx4ItpTj3Od7dTJLpNE8yGoiSKIvat0uUsRLvGcLapOygR/uYvh/YeaqzG6kxLFbLup
         h5RsVZbdVbX2kRT7dSeuRyeTxRyreml/f2vcHteCbIkBm/9bEREq52DUX/AfOGUU26cn
         pLfDe6JjRVH9b942VgyM85cKktjaRKkDT2iVNtI5AqA0Sbdi4PN5j1cyzeKSq3S59+ye
         nLIw==
X-Forwarded-Encrypted: i=1; AJvYcCXVPIGix13crTW+8d8QEbZzHgRqntEm2wIqku4hZIw3Qxw+Z6PilnVxp7wowO4Xul3h2c2/S0VbuUNtDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpmRSgefwPkvJrWQ4PIy8cmp/rjNnaw2CQZpBzsDEjR1g3b/f0
	qZvt/69wiA/jN1BWE4A9DPihM2Mme4wHKVCNXckAEknd3CtWyF09bfOAdnGc1IND5oZO1z5RF1l
	BxSZUrY3d1NBJ4xLxqw7RKE3WZ/VSdkUwcUIV7VfS/6oz3Qu5aY5F4gzV4PN53whw1g==
X-Gm-Gg: ASbGncttNZPF2/elSbzoC5hX3KbinCRHqcv3sDVsMp0Sl4ZBENDcd5MeicXOgXi6TTl
	abFDaf2I8LJ+sR8frzJdZe8k5LeCva9vB2Lio/eng3uwGImmECXu6JDsEw2Ez5oThtOIQt5n+sb
	r3pDQ7U1/5P2dTskP32qXnnQ2y5UyAzg4mUUU9HcPs08/60skLoQRPRbv6++o7VpR7rXDPvCxFu
	1VKdpEHX8EBFM/3Y7fN4H0UFWn6FKsWw9v/Z4lhxh6zzEm/yf+DOrZlqbRcZQ6Llcwz9TakGoPP
	s/6Y1sbwlULQjgNPsiN+FuoLMlUknNdqpGy5z/PWnCNvQ/J6J1LujHhvvZ8KjCLDaAfc/dRZ9XU
	mHjzyWCWp0i8x
X-Received: by 2002:a05:6214:c62:b0:709:243e:9327 with SMTP id 6a1803df08f44-7093629fa3dmr167750566d6.27.1754376280572;
        Mon, 04 Aug 2025 23:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oTrbsZ6ceR/bzckUtZmdT8QIjOQBuSwzzCnERChumlvA/IZXGAw+6fpzhcu4tIoXIJ/Rkw==
X-Received: by 2002:a05:6214:c62:b0:709:243e:9327 with SMTP id 6a1803df08f44-7093629fa3dmr167750276d6.27.1754376280022;
        Mon, 04 Aug 2025 23:44:40 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:39 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/7] media: venus: Add support for AR50_LITE video core
Date: Tue,  5 Aug 2025 08:44:26 +0200
Message-Id: <20250805064430.782201-4-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vkQ8MGCWwznN72b0HtF5YeLxw1WBLWep
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891a85a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MEz7QyYSB-WHFCyNWtcA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: vkQ8MGCWwznN72b0HtF5YeLxw1WBLWep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NSBTYWx0ZWRfX35YljJursRh7
 D3ZV39gmeWeY7O2HoHrXoLxmjZW0aaLUMEvtkBkT3FCCqflAFhFLAJdec1QeAhx+9n0gy+gWMnk
 LRc2wRMGEUwPofbcHQSbh7ifBeTHqshUrjXSLrclJuKZM8R5HJ5oeKqYXwNX1465X/XBVfaXSjt
 1lOt7mhHaJaAVTLZafQPYITydFHWIk4qx8JKLGdK+c3y9IxH/jhaupIsUn03ZzopFcx9zoQ1f9N
 EbJDVNrftD4+nooV50fjBOMKBsKdUsZE8TGRCsk5Zi/6XaN8OTHtq4OkXQJrtWdro4bJO93ehW8
 OEx/bHTIAUD667WhjWnHw7iTrkEEGo7GE9MBb+1I4u6AsuoK1NACe9tF2OJkX8dCWKO0Dyz/tyN
 tfgXLhiXwQaCVU/CC7G0gcvSzDJD30yUwSgH1bFegYni9Ymi4njYSUGazBzhU/2HjwVPP8OY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050045

The AR50_LITE is a simplified variant of the AR50 video core, designed for
power and cost-efficient platforms.

It supports hardware-accelerated decoding of H.264, HEVC, and VP9 formats,
and provides encoding support for H.264 and HEVC.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c      | 15 +++++++--
 drivers/media/platform/qcom/venus/core.h      |  5 +++
 drivers/media/platform/qcom/venus/firmware.c  | 10 ++++++
 drivers/media/platform/qcom/venus/firmware.h  |  1 +
 drivers/media/platform/qcom/venus/helpers.c   | 12 +++++--
 .../media/platform/qcom/venus/hfi_parser.c    |  5 +--
 .../media/platform/qcom/venus/hfi_platform.c  | 20 +++++++-----
 .../media/platform/qcom/venus/hfi_platform.h  | 25 ++++++++-------
 .../platform/qcom/venus/hfi_platform_v4.c     | 31 ++++++++++++------
 .../platform/qcom/venus/hfi_platform_v6.c     | 32 +++++++++++++------
 drivers/media/platform/qcom/venus/hfi_venus.c | 25 +++++++++++----
 .../media/platform/qcom/venus/hfi_venus_io.h  |  4 +++
 .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
 13 files changed, 133 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index f45715c9b222..adc38fbc9d79 100644
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
index 2d3cf920198f..f8602735d6c2 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -537,6 +537,11 @@ struct venus_inst {
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
index 503dd270a14a..2e5d85e25d0f 100644
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
index 8295542e1a7c..3a761b5415c5 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1715,11 +1715,17 @@ int venus_helper_session_init(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
+	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version,
+								  is_lite(inst->core),
+								  codec,
 								  session_type);
-	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
+	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version,
+								  is_lite(inst->core),
+								  codec,
 								  session_type);
-	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
+	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version,
+								       is_lite(inst->core),
+								       codec,
 								       session_type);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 1b3db2caa99f..55cee1c786a0 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -277,12 +277,13 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 	if (inst)
 		return 0;
 
-	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count);
+	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count,
+				      is_lite(core));
 	if (ret)
 		return ret;
 
 	if (plat->capabilities)
-		caps = plat->capabilities(&entries);
+		caps = plat->capabilities(&entries, is_lite(core));
 
 	if (!caps || !entries || !count)
 		return -EINVAL;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 643e5aa138f5..c6c248561793 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -21,7 +21,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 }
 
 unsigned long
-hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite, u32 codec,
+				u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -31,13 +32,14 @@ hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session
 		return 0;
 
 	if (plat->codec_vpp_freq)
-		freq = plat->codec_vpp_freq(session_type, codec);
+		freq = plat->codec_vpp_freq(session_type, codec, lite);
 
 	return freq;
 }
 
 unsigned long
-hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite, u32 codec,
+				u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -47,13 +49,14 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
 		return 0;
 
 	if (plat->codec_vpp_freq)
-		freq = plat->codec_vsp_freq(session_type, codec);
+		freq = plat->codec_vsp_freq(session_type, codec, lite);
 
 	return freq;
 }
 
 unsigned long
-hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
+hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite, u32 codec,
+			       u32 session_type)
 {
 	const struct hfi_platform *plat;
 	unsigned long freq = 0;
@@ -63,13 +66,14 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
 		return 0;
 
 	if (plat->codec_lp_freq)
-		freq = plat->codec_lp_freq(session_type, codec);
+		freq = plat->codec_lp_freq(session_type, codec, lite);
 
 	return freq;
 }
 
 int
-hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count,
+			bool lite)
 {
 	const struct hfi_platform *plat;
 
@@ -78,7 +82,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
 		return -EINVAL;
 
 	if (plat->codecs)
-		plat->codecs(enc_codecs, dec_codecs, count);
+		plat->codecs(enc_codecs, dec_codecs, count, lite);
 
 	if (IS_IRIS2_1(core)) {
 		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index ec89a90a8129..a9f1ead18084 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -47,11 +47,12 @@ struct hfi_platform_codec_freq_data {
 };
 
 struct hfi_platform {
-	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
-	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
-	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
-	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
-	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
+	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec, bool lite);
+	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec, bool lite);
+	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec, bool lite);
+	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite);
+	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries,
+						    bool lite);
 	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
 		      u32 buftype, struct hfi_buffer_requirements *bufreq);
 };
@@ -60,12 +61,12 @@ extern const struct hfi_platform hfi_plat_v4;
 extern const struct hfi_platform hfi_plat_v6;
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version);
-unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
-					      u32 session_type);
-unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
-					      u32 session_type);
-unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
-					     u32 session_type);
+unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite,
+					      u32 codec, u32 session_type);
+unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite,
+					      u32 codec, u32 session_type);
+unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite,
+					     u32 codec, u32 session_type);
 int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
-			    u32 *count);
+			    u32 *count, bool lite);
 #endif
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index e3f0a90a567b..4ae7ed476c48 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -245,14 +245,19 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
-static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
+						    bool lite)
 {
+	WARN_ON(lite);
+
 	*entries = ARRAY_SIZE(caps);
 	return caps;
 }
 
-static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
 {
+	WARN_ON(lite);
+
 	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
 		      HFI_VIDEO_CODEC_VP8;
 	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
@@ -273,12 +278,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
 };
 
 static const struct hfi_platform_codec_freq_data *
-get_codec_freq_data(u32 session_type, u32 pixfmt)
+get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
 	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
 
+	WARN_ON(lite);
+
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
 			found = &data[i];
@@ -289,33 +296,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
 	return found;
 }
 
-static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vpp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vsp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->low_power_freq;
 
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index 4e8af645f8b9..ad08d26cd7ba 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -245,14 +245,20 @@ static const struct hfi_plat_caps caps[] = {
 	.num_fmts = 4,
 } };
 
-static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
+						    bool lite)
 {
+	WARN_ON(lite);
+
 	*entries = ARRAY_SIZE(caps);
 	return caps;
 }
 
-static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count,
+		       bool lite)
 {
+	WARN_ON(lite);
+
 	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
 		      HFI_VIDEO_CODEC_VP8;
 	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
@@ -273,12 +279,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
 };
 
 static const struct hfi_platform_codec_freq_data *
-get_codec_freq_data(u32 session_type, u32 pixfmt)
+get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
 	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
 	const struct hfi_platform_codec_freq_data *found = NULL;
 
+	WARN_ON(lite);
+
 	for (i = 0; i < data_size; i++) {
 		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
 			found = &data[i];
@@ -289,33 +297,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
 	return found;
 }
 
-static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vpp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
 	if (data)
 		return data->vsp_freq;
 
 	return 0;
 }
 
-static unsigned long codec_lp_freq(u32 session_type, u32 codec)
+static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
 {
 	const struct hfi_platform_codec_freq_data *data;
 
-	data = get_codec_freq_data(session_type, codec);
+	WARN_ON(lite);
+
+	data = get_codec_freq_data(session_type, codec, lite);
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
index 8dd5a9b0d060..e09b0d9ae610 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -51,7 +51,7 @@ static int core_clks_enable(struct venus_core *core)
 	dev_pm_opp_put(opp);
 
 	for (i = 0; i < res->clks_num; i++) {
-		if (IS_V6(core)) {
+		if (IS_V6(core) || (IS_V4(core) && is_lite(core))) {
 			ret = clk_set_rate(core->clks[i], freq);
 			if (ret)
 				goto err;
-- 
2.34.1


