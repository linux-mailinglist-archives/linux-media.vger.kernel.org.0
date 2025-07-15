Return-Path: <linux-media+bounces-37813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B185BB067F5
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 22:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E79411AA7F85
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 20:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6222C1580;
	Tue, 15 Jul 2025 20:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+zgH/7f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E3029B796
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612484; cv=none; b=YGF/5NHB2lxTIT4zLMHx1PGqHF6+IRWnSJUeW2mSmUx6rI3y8nkGSHnWLxSVoObXnzhzDkUmWosl98xVbBjU6viTDRCBHs8HlvKXmPSaVphHfdK4L8VfMNSAN1htSOrLmYyCfGMSpYsg8A5rEfMe6rxKPLcYx4rPamhkuqrDKjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612484; c=relaxed/simple;
	bh=JLxRVXQhon6gxubKoqqTIwexA1gN3xO3FmETcqxOKgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ue76IwcbpFieARWb9wi12KbBozoWUVNoN/Adx9rVx94jHB0Xcvubv5HPg6xygrNQ92D+qSA60DdPydCXC05Q4eJ+BQlhuaMvOnvF9KEDhFVdB8ADrCZHGx1Pcn6RR3ZV2Lm8C7aeLFqChrPOTZRyX81DFc0hgalDdf04W9DXOYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+zgH/7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDH0a025919
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xqIJdlz4cKk
	IgtCaMYekqr5WxjgSE1e16/qhi8p04Sw=; b=o+zgH/7fycK1TVAMJXWmkfNwBy0
	h69KVQRJBljc18REs+OJPqGYzcODG36GRBHWehfc5v/BNsFFaO89i0BC1IReJPhF
	QzojPvXA3jrJnuYs+PP783ieM+Q9XO+/FXzGg4sotcJvScajfMBH548KuLt1zXGb
	B7rOQsBgdMEmD0uosc57JziQK5KO7a63ouuazVe6DxFG0dy8EUtQhZb1KuUiU4zY
	V3zp48386+zU9VeU+GdzsdY9llxUKBOqAqphbDW5XEDc9e0FeS197PzrTjzyYSdb
	Vo5UIRLytzGHfTxpM5k9nFeOXACisBj/qZe4+c1NmgB/FUwGjNMSydOrv0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca2ugf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 20:48:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e278d83457so418692485a.2
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 13:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612479; x=1753217279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqIJdlz4cKkIgtCaMYekqr5WxjgSE1e16/qhi8p04Sw=;
        b=gQ+XR3HJtjJ73fArjqRjZf+2zcoH9AzBNd0vBY04pEuDTtMIaxsqaCKOtu/0HUom4W
         Qt9mnNlirRajgSJN9jr/GwS7H2T6Phw8o9ZI32qhSpz+5h5YqhoRMtLT3w2s1dkuTp59
         D7ZLsKF8wiv5VFw+20jEGgk9N5Q4euCdk+vbH1BhCa3viQQ0JUUv0txdn3Tq6OHDePWO
         aUMtdcEHp4RArMDQKOLEb8EtM9HtNG/bxtN6brgPts77EAqt/1kSSE9evcW1ZziHjn3e
         z+lx9VIKjVh3fme+VfuO8d85V0+BG+ZNWe4KRQ+Bmolvf7XKCWu20AaWKIs1gobZPt73
         Lxgw==
X-Gm-Message-State: AOJu0YzQpZHqiAI562IVqfo6j4DpfcFZbnOot4elDQjSARDLvbeUlzsD
	qTK3sLYWcgukKLGXI6aYYETFK5JJOvidS/e4qh2nXHi9nWnfQS0apD6jP2oA26x6cgcqQVp9vrn
	ubVEUKeJcC0+gQjKgWR6Tu0WflJ2QykffAaun8hfn5U4NZwN9hoeyWpmbd64unHx/hA==
X-Gm-Gg: ASbGnct0C2goHsLKGym5oX6FLwEwLBs3RAa6tz/erUr5cJWcpe5xPAo5Ex+5E6VKdoV
	COKelYBtQmTGTW5JO0arRQDTjp7Cp+p3MS8lM/vUxLMzQ3eqQFLTtX00rhygh3rU6vzDbtyO2dH
	0wr0KUnyN+KwA0938kbXL6ARR499taBC2Ck9B789R/DLcbTFIX8/xfxCWMEJIFrSojLvnaAptav
	wxnck2iTi3M02fX/AXA5FJ63jkO798rP2g5Y40JgRNgO9mSq8Jybzlm6erCYONdJabltcSNUVDq
	Ij4AYiuOqcPJ8qxpGkyPPqWyYyfbR+bEqpD/DtsTqXRv4kAZDQqxWP/VYdNnUzx3A3TePRvOBnC
	KuND4S12YSTGAQqsoeQ==
X-Received: by 2002:a05:620a:1b9b:b0:7e0:cb93:6fb1 with SMTP id af79cd13be357-7e3433511a5mr45661085a.9.1752612479328;
        Tue, 15 Jul 2025 13:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3uztf4eAZmDM24bnWWjsOEqyZP7OJqBLki+Bu0uvZ5eYMZGFNWgaXX9r3S8S4GW0aowWycQ==
X-Received: by 2002:a05:620a:1b9b:b0:7e0:cb93:6fb1 with SMTP id af79cd13be357-7e3433511a5mr45658385a.9.1752612478892;
        Tue, 15 Jul 2025 13:47:58 -0700 (PDT)
Received: from trex.. (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm16331877f8f.38.2025.07.15.13.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:47:58 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] media: venus: Conditionally register codec nodes based on firmware version
Date: Tue, 15 Jul 2025 22:47:44 +0200
Message-Id: <20250715204749.2189875-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5MSBTYWx0ZWRfX5y6Gmlseu53Y
 UApV3E+bDXexZ+h1WXLAYPZeqk68qDfIDJKOyAZm7drULt/m47+dFpAD7U0voxUf3hRbZ2ewElO
 G9cTPIf2VMCLZZZtnIavmi90dioMszW16MkGyYgPO5HsPahWoFOpKK3oIDO1gwyU2Jab01TWrIe
 n9mcwegUcagc9ZcbY0+wUh8kkY6RXS2suh9BLtyt6sV3lw3THwEg6UlR8J3Y4qcgYqLjssXXXc/
 S0WxqrvuKQYFmLo/9+7RJafoycscHnFDeNTif+3um80TcyoPRbXjmbt9ZA69cT9yOJFGcncec2f
 qsjjIMtmkX+VUvqhqyQP6mU2mBN8DORw5gfaOEproaP1iOiKnjD8DmeazP8SzH0FVefqhqa546l
 RfRevoeg1y2AOcJmxRsEidsVm2MywBPXwkxToRWTcZPxte3nwFPMbVC02CZRt/4dhBGaWVnw
X-Proofpoint-GUID: xJxFxi360HNlRkQv49sOcHzylzI3x415
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=6876be80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=b6RcsaAH2Bz4aJime2YA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xJxFxi360HNlRkQv49sOcHzylzI3x415
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150191

The encoding and decoding capabilities of a VPU can vary depending on the
firmware version in use.

This commit adds support for platforms with OF_DYNAMIC enabled to
conditionally skip the creation of codec device nodes at runtime if the
loaded firmware does not support the corresponding functionality.

Note that the driver becomes aware of the firmware version only after the
HFI layer has been initialized.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 76 +++++++++++++++---------
 drivers/media/platform/qcom/venus/core.h |  8 +++
 2 files changed, 57 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4c049c694d9c..b7d6745b6124 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -28,6 +28,15 @@
 #include "pm_helpers.h"
 #include "hfi_venus_io.h"
 
+static inline bool venus_fw_supports_codec(struct venus_core *core,
+					   const struct venus_min_fw *ver)
+{
+	if (!ver)
+		return true;
+
+	return is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev);
+}
+
 static void venus_coredump(struct venus_core *core)
 {
 	struct device *dev;
@@ -103,7 +112,9 @@ static void venus_sys_error_handler(struct work_struct *work)
 	core->state = CORE_UNINIT;
 
 	for (i = 0; i < max_attempts; i++) {
-		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
+		/* Not both nodes might be available */
+		if ((!core->dev_dec || !pm_runtime_active(core->dev_dec)) &&
+		    (!core->dev_enc || !pm_runtime_active(core->dev_enc)))
 			break;
 		msleep(10);
 	}
@@ -202,7 +213,8 @@ static u32 to_v4l2_codec_type(u32 codec)
 	}
 }
 
-static int venus_enumerate_codecs(struct venus_core *core, u32 type)
+static int venus_enumerate_codecs(struct venus_core *core, u32 type,
+				  const struct venus_min_fw *ver)
 {
 	const struct hfi_inst_ops dummy_ops = {};
 	struct venus_inst *inst;
@@ -213,6 +225,9 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 	if (core->res->hfi_version != HFI_VERSION_1XX)
 		return 0;
 
+	if (!venus_fw_supports_codec(core, ver))
+		return 0;
+
 	inst = kzalloc(sizeof(*inst), GFP_KERNEL);
 	if (!inst)
 		return -ENOMEM;
@@ -288,14 +303,14 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 
 #if defined(CONFIG_OF_DYNAMIC)
 static int venus_add_video_core(struct venus_core *core, const char *node_name,
-				const char *compat)
+				const char *compat, const struct venus_min_fw *ver)
 {
 	struct of_changeset *ocs = core->ocs;
 	struct device *dev = core->dev;
 	struct device_node *np, *enp;
 	int ret;
 
-	if (!node_name)
+	if (!node_name || !venus_fw_supports_codec(core, ver))
 		return 0;
 
 	enp = of_find_node_by_name(dev->of_node, node_name);
@@ -330,11 +345,13 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
 
 	of_changeset_init(core->ocs);
 
-	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
+	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder",
+				   core->res->dec_minfw);
 	if (ret)
 		goto err;
 
-	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
+	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder",
+				   core->res->enc_minfw);
 	if (ret)
 		goto err;
 
@@ -363,6 +380,9 @@ static void venus_remove_dynamic_nodes(struct venus_core *core)
 #else
 static int venus_add_dynamic_nodes(struct venus_core *core)
 {
+	WARN_ONCE(core->res->enc_minfw || core->res->dec_minfw,
+		  "Feature not supported");
+
 	return 0;
 }
 
@@ -432,7 +452,7 @@ static int venus_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"venus", core);
 	if (ret)
-		goto err_core_put;
+		goto err_hfi_destroy;
 
 	venus_assign_register_offsets(core);
 
@@ -448,19 +468,9 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_runtime_disable;
 
-	if (core->res->dec_nodename || core->res->enc_nodename) {
-		ret = venus_add_dynamic_nodes(core);
-		if (ret)
-			goto err_runtime_disable;
-	}
-
-	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
-	if (ret)
-		goto err_remove_dynamic_nodes;
-
 	ret = venus_firmware_init(core);
 	if (ret)
-		goto err_of_depopulate;
+		goto err_runtime_disable;
 
 	ret = venus_boot(core);
 	if (ret)
@@ -474,34 +484,46 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_venus_shutdown;
 
-	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC);
+	if (core->res->dec_nodename || core->res->enc_nodename) {
+		ret = venus_add_dynamic_nodes(core);
+		if (ret)
+			goto err_core_deinit;
+	}
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret)
-		goto err_core_deinit;
+		goto err_remove_dynamic_nodes;
+
+	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_DEC,
+				     core->res->dec_minfw);
+	if (ret)
+		goto err_of_depopulate;
 
-	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC);
+	ret = venus_enumerate_codecs(core, VIDC_SESSION_TYPE_ENC,
+				     core->res->enc_minfw);
 	if (ret)
-		goto err_core_deinit;
+		goto err_of_depopulate;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
-		goto err_core_deinit;
+		goto err_of_depopulate;
 	}
 
 	venus_dbgfs_init(core);
 
 	return 0;
 
+err_of_depopulate:
+	of_platform_depopulate(dev);
+err_remove_dynamic_nodes:
+	venus_remove_dynamic_nodes(core);
 err_core_deinit:
 	hfi_core_deinit(core, false);
 err_venus_shutdown:
 	venus_shutdown(core);
 err_firmware_deinit:
 	venus_firmware_deinit(core);
-err_of_depopulate:
-	of_platform_depopulate(dev);
-err_remove_dynamic_nodes:
-	venus_remove_dynamic_nodes(core);
 err_runtime_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5b1ba1c69adb..3af8386b78be 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -50,6 +50,12 @@ struct bw_tbl {
 	u32 peak_10bit;
 };
 
+struct venus_min_fw {
+	u32 major;
+	u32 minor;
+	u32 rev;
+};
+
 enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
@@ -92,6 +98,8 @@ struct venus_resources {
 	u32 cp_nonpixel_start;
 	u32 cp_nonpixel_size;
 	const char *fwname;
+	const struct venus_min_fw *enc_minfw;
+	const struct venus_min_fw *dec_minfw;
 	const char *enc_nodename;
 	const char *dec_nodename;
 };
-- 
2.34.1


