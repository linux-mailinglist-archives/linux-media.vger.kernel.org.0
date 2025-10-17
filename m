Return-Path: <linux-media+bounces-44916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14BBE92AE
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 16:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B22E7580DAA
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 14:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DC7336EDB;
	Fri, 17 Oct 2025 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4T0L+ad"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1B936CE01
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710665; cv=none; b=eNSLDbwg+6BSjFIGH1ToTFn6sPIAgrgNmoF1wr76PZl2poLcQxepumkx4imy9J2TorpXtybC2hR6w7sUxuXq1Gnu688rnZdkFwVa/hgbDpLSSwp4YxS3GgkijaFQYlF5y7vLonHu8gLg5FLe3fQGmFBI0QST/ncKELnHSoQ7BDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710665; c=relaxed/simple;
	bh=ZRzKQTaEbVIIvIehiMq8D+/8y/lZkfqQ6d+kBFPkY2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lj3F5PpuuzWWXPkYTDWwxHzakoreCPJ25oNlIsUucVY2MB4qPgb1TScI36lStrhIiikxtwGf4B0LolM/WW7f4WGt5c0/moGXSGGiKfpQd+EkNDe3VPqChe2o/dw8WsdtieWdhZ+hX+HivpXqCBh72I5H2b6wSNVbeGjYYUrA3Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4T0L+ad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8GbgZ001577
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9P/spMWDSvK8n5V3j1/tJefjc0pI9i/ss95ltdubpA=; b=Q4T0L+adlEY8Oype
	FkCNZqkBRsgO8gGuv5gKoSk2KJ/FSnft2QYnMJzWouippMhNjbNasiIRy0klqFcr
	QzdeebLD+7opExc8AtN13Sai6DkokRJZQqbZkCTlv6lqWJzP2qT6UbgBQvzfgivZ
	4YCd6q17I66IDJXCVHqSDciss+NKPl9/32S2evv3f16JuUhCMCtfehqgRmt5APp4
	Mdy9Q2L/QmTquD3vwE5eL+ie9uFQ2m0oox6Vldx95H0be7bJaQtGDB3pOuQVOB4H
	eWZ7Doj7m/ie9a19vKTzW0Y0IT6B4Nd8fJqCSc90lr559Beu7IwNbjrgbHJ1E5n2
	xjORIw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9cht8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810912fc31so2065994b3a.3
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 07:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710662; x=1761315462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9P/spMWDSvK8n5V3j1/tJefjc0pI9i/ss95ltdubpA=;
        b=BCJZVi+Q5DROKRw9lOohLgcmDAYE5pSO2gkKMQeCRtIE9PTJx9j4gQVqu9Mh77vxnd
         /6Gfu6NiUhAOp/oi45q8O8xcNI2Qzu2kGE7WIjtimsz0mb5MI8j5x5K2Zo7lTNmRP8+c
         SG/ooKJ9aof9NBGCKUPb7ENZMYzsWuOIjdhiZjjF64x0HS4efEA8B1lYp5CuK4pbRdzx
         Z6i/+p+bAOeIv84BWnMUI4aUOAiYNDQjSIGgqfCkaWF2LWgCihZqnSqrM7W8C9XeBpmv
         vw4cfEFPTqJkLHSLErWPpgPNkMuE5MPpSGyYumQYdQZ32UZ5B4ZeC10wepN/HAJt6rwq
         vaAg==
X-Forwarded-Encrypted: i=1; AJvYcCXi/g1joBGutnGlKukDUpdzRFXN+FGOtTmdSLQND1NqdWVdsMN+kry9QZSzRSx2hLq9m/OX8LNnxc9MDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPl9tXYhRvs95z7UhLA/KQRoakH/lC8Nr2J7RMeiRyYrV1hdjo
	RETp07x6AdZpQs8aWcKGGPYc5JTekQzYGSju0CzjvJwl4fX8eSsrryMO09SOZH6dp1kvHZgkd00
	OAphYrkCElMDDr5eb6QiTjWtZyjLTWETQBPDCxN1dT5p/4zRJcxbKtFbXbd1NnMv0uA==
X-Gm-Gg: ASbGncvOaaCHTDvTZXbj/n3XkK5phUNfEv1tns0mxAWkvTAqyva3vP3ufQbzpsRmqDk
	V+Dn28FhhxSp6OrUFoDWs7NBZgSIE7cNh5cl/3/H/fOSi0596EcJJ7M9zKEEbkZSz6iWjbnPZvu
	uG3U4U9KX/yXxCuhLTfAhCUfijODIocW3vlAnQvPH1vpBPJMx6DlAIufG/HfeocfKRSbTwa/3nC
	I37TICs2lJdDnlEsPL+cgfzN4NL0kv2Ms+J/XQN6uouqp+FvEY5TZXYTmFybMaJKqduliJt/fFy
	WtkT0dTQtzA51NvWHn+DRSiPSQSjej1ENRZyJJRfFxycF92iu1qtGlRP+3uZ4RMpfxL9M8/7QJu
	40EIYjLWjjLAMEFokuc7AgIls0Oeqo9SrLg==
X-Received: by 2002:a05:6a21:99a0:b0:2e5:655c:7f86 with SMTP id adf61e73a8af0-334a8607807mr5478489637.39.1760710661361;
        Fri, 17 Oct 2025 07:17:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcoOAhExBAilUBBlvofBF8gyCFAX8gtWT/CWRRCPM9s2CiYNdJfbxqhmC/5FcOsP1jM+Sukg==
X-Received: by 2002:a05:6a21:99a0:b0:2e5:655c:7f86 with SMTP id adf61e73a8af0-334a8607807mr5478446637.39.1760710660847;
        Fri, 17 Oct 2025 07:17:40 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm25895826b3a.40.2025.10.17.07.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:17:40 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 19:46:28 +0530
Subject: [PATCH v2 7/8] media: iris: Introduce vpu ops for vpu4 with
 necessary hooks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-knp_video-v2-7-f568ce1a4be3@oss.qualcomm.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
In-Reply-To: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760710621; l=14953;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ZRzKQTaEbVIIvIehiMq8D+/8y/lZkfqQ6d+kBFPkY2Y=;
 b=qNSZHNJgGpC4RMuj3gqjMrhF3zKar7SBorln9NUQ944/pGv9r6ey/yqhfdyH5JDEcFk47EGZC
 L+yfYQdZ1gUCAa5DHG68jqfLyeY9AoqYu+v5bPV8Rh2/QOL7iO1BnKh
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: gVLiFyupssn_o2fk6Jyxe52swMWF1QRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX87BUvR+9sI8H
 e8lMkYqGTksb98EsRv0Ti/9vf9E5PbhEDRsUUciFe4/4tb08tSgqB7axgsedHR+sBzRrr0sTFyF
 cnt4g8St0EW4k2NdDG89KhUldwzt/FPb3bc9jtwjnl99io4ZC749OrUzbqOOZpicn1kX3AiwRFL
 YKPOIu5vCNBGfaF1dNUqpDj2Fb78vOo1JR4m6WZsfjaBMLVP4NBcQU+1X8lO9BCi9AdQj72HADG
 /5UcwcSCm3XFbm7Nflitm6+1n4qoFH/6+UykLZMU5lqwLd8Mij/7ZUAX696lp5WhTdoCPWEMwje
 NG0GythfPbRUD1XleX+erT0yuMhkLiyiCCDZ9n6mez0pRtZ6wM2/C83UwgQSlQp7CHkzTyPABPZ
 oxM+AGFdygRKOQZ549dYpO2LpUPlXg==
X-Proofpoint-GUID: gVLiFyupssn_o2fk6Jyxe52swMWF1QRZ
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f25006 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=V7PGPLsNbH-VDMjO_1gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add power sequence for vpu4 by reusing from previous generation wherever
possible. Hook up vpu4 op with vpu4 specific implemtation or resue from
earlier generation wherever feasible, like clock calculation in this
case.

Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   7 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 358 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 4 files changed, 367 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..1446f5732ab51db85ea4f52636d29e36d82b7a8f 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -22,6 +22,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_venc.o \
              iris_vpu2.o \
              iris_vpu3x.o \
+             iris_vpu4x.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index ae49e95ba2252fc1442f7c81d8010dbfd86da0da..d6d4a9fdfc189797f903dfeb56d931741b405ee2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -54,6 +54,10 @@ enum platform_clk_type {
 	IRIS_AXI1_CLK,
 	IRIS_CTRL_FREERUN_CLK,
 	IRIS_HW_FREERUN_CLK,
+	IRIS_BSE_HW_CLK,
+	IRIS_VPP0_HW_CLK,
+	IRIS_VPP1_HW_CLK,
+	IRIS_APV_HW_CLK,
 };
 
 struct platform_clk_data {
@@ -188,6 +192,9 @@ struct icc_vote_data {
 enum platform_pm_domain_type {
 	IRIS_CTRL_POWER_DOMAIN,
 	IRIS_HW_POWER_DOMAIN,
+	IRIS_VPP0_HW_POWER_DOMAIN,
+	IRIS_VPP1_HW_POWER_DOMAIN,
+	IRIS_APV_HW_POWER_DOMAIN,
 };
 
 struct iris_platform_data {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
new file mode 100644
index 0000000000000000000000000000000000000000..fa72f16ac38dcbc061698e3d496a1d2bbf17be27
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+#include "iris_vpu_register_defines.h"
+
+#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
+#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_BASE_OFFS + 0x174)
+#define MVP_NOC_RESET_REQ_MASK			0x70103
+#define VPU_IDLE_BITS				0x7103
+#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
+
+#define APV_CLK_HALT		BIT(1)
+#define CORE_CLK_HALT		BIT(0)
+#define CORE_PWR_ON		BIT(1)
+#define DISABLE_VIDEO_APV_BIT	BIT(27)
+#define DISABLE_VIDEO_VPP1_BIT	BIT(28)
+#define DISABLE_VIDEO_VPP0_BIT	BIT(29)
+
+static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
+{
+	int ret;
+
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
+	if (ret)
+		return ret;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_hw_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_vpp0_domain_mode;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
+					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
+		if (ret)
+			goto restore_vpp1_domain_mode;
+	}
+
+	return 0;
+
+restore_vpp1_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_vpp0_domain_mode:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
+					!hw_mode);
+restore_hw_domain_mode:
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
+
+	return ret;
+}
+
+static int iris_vpu4x_power_on_apv(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_APV_HW_CLK);
+	if (ret)
+		goto disable_apv_hw_power_domain;
+
+	return 0;
+
+disable_apv_hw_power_domain:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu4x_power_off_apv(struct iris_core *core)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	if (value & APV_CLK_HALT)
+		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	do {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+			   value, value & 0x080200, 200, 2000);
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+			   value, value == 0x0, 200, 2000);
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+
+	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+}
+
+static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+}
+
+static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+}
+
+static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_value)
+{
+	int ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	if (ret)
+		goto disable_axi_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto disable_hw_free_run_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret)
+		goto disable_hw_clock;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_prepare_enable_clock(core, IRIS_VPP0_HW_CLK);
+		if (ret)
+			goto disable_bse_hw_clock;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_prepare_enable_clock(core, IRIS_VPP1_HW_CLK);
+		if (ret)
+			goto disable_vpp0_hw_clock;
+	}
+
+	return 0;
+
+disable_vpp0_hw_clock:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
+disable_bse_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+disable_hw_free_run_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+
+	return ret;
+}
+
+static void iris_vpu4x_disable_hardware_clocks(struct iris_core *core, u32 efuse_value)
+{
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP1_HW_CLK);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
+
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+}
+
+static int iris_vpu4x_power_on_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
+		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		if (ret)
+			goto disable_hw_power_domain;
+	}
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
+		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		if (ret)
+			goto disable_vpp0_power_domain;
+	}
+
+	ret = iris_vpu4x_enable_hardware_clocks(core, efuse_value);
+	if (ret)
+		goto disable_vpp1_power_domain;
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
+		ret = iris_vpu4x_power_on_apv(core);
+		if (ret)
+			goto disable_hw_clocks;
+
+		iris_vpu4x_ahb_sync_reset_apv(core);
+	}
+
+	iris_vpu4x_ahb_sync_reset_hardware(core);
+
+	ret = iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
+	if (ret)
+		goto disable_apv_power_domain;
+
+	return 0;
+
+disable_apv_power_domain:
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_power_off_apv(core);
+disable_hw_clocks:
+	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
+disable_vpp1_power_domain:
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP1_HW_POWER_DOMAIN]);
+disable_vpp0_power_domain:
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+						[IRIS_VPP0_HW_POWER_DOMAIN]);
+disable_hw_power_domain:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static void iris_vpu4x_power_off_hardware(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+
+	iris_vpu4x_genpd_set_hwmode(core, false, efuse_value);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_power_off_apv(core);
+
+	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
+
+	if (!(value & CORE_PWR_ON))
+		goto disable_clocks_and_power;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	if (value & CORE_CLK_HALT)
+		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN, value,
+			   value & VPU_IDLE_BITS, 2000, 20000);
+
+	do {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	writel(MVP_NOC_RESET_REQ_MASK, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+			   value, value == MVP_NOC_RESET_REQ_MASK, 200, 2000);
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+			   value, value == 0x0, 200, 2000);
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+
+	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
+		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
+					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+const struct vpu_ops iris_vpu4x_ops = {
+	.power_off_hw = iris_vpu4x_power_off_hardware,
+	.power_on_hw = iris_vpu4x_power_on_hardware,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 7cf4304604cca590544a938c7e811c202cea3d93..f6dffc613b822341fb21e12de6b1395202f62cde 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -12,6 +12,7 @@ extern const struct vpu_ops iris_vpu2_ops;
 extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
+extern const struct vpu_ops iris_vpu4x_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);

-- 
2.34.1


