Return-Path: <linux-media+bounces-43103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C26B9C77B
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 01:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EFE04A42D5
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 23:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82892C08BB;
	Wed, 24 Sep 2025 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/3g7VMo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A12C0287
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755768; cv=none; b=PPAMJ0DOBbwAnXF+BTXrQh/7dxHUr6VgADbbXIvrNrna8UDKX8Fo5iHWTXeEUsWT9vldYmIDhQB/LHol2EdKHIDdjyQJZ0QEn+gtR0WVWLwE4fa9DjKU1bZ5Ef2GhroTO9RlsTcLi7BAQMP/mBBQ1rKZjn2z8Hh4EbtZ5XqrYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755768; c=relaxed/simple;
	bh=6XOZq7Y/TCn6ParDIYklN2NZvButqXkdK9c1YmSmKRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4KcPe/vP52gJzLkKsSk/UsW7R7mXXJU86kIinbt0WtFExqZvNnI9OBagDSNZMH3h7K73ILwkyZwxy1op4634s+dI6BlYlbMTPzogSWTX8iJ2B9VVzyHnwCCeyknerbo8wuTM8P+HDO3TOMZhNEvdAZNani8VgfWkM6B+NJBf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/3g7VMo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODCtJd002152
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 23:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXn1m+AX1340N1QGqYeacbA14KZeFEwKwXVpo+L85AY=; b=m/3g7VMohlo360j5
	wDBVU+xLVBqBLrUAsLoFai1TLum61u73+nablEEBO5WUo3hdxf3Po1d6Qon34JcU
	1vaqdg2e8YbxKPLbATsHR3eyjt/jxClG81e6R7eL56ZsmiVhGYOKryLbDdHy8RDo
	bzUrYGzoa60sch41TDXGQFWPtTrIo+uatBjkgP/6djq3EupmOBQduMkz9umRz/7Z
	tBJmiCofKyBZWNo5A4HbVbJOCsssP0/38PCWlBbeqS8HDfO98yApe4dFIl16dbXo
	ZVjmpSTLOlKLGEGbZfA7MG66Kl0g3zyJ3/QJRCkjwxjCdSQ1CDsxf1yGoFTgblXp
	PKhWNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p0u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 23:16:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-277f0ea6ee6so3282925ad.0
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 16:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755764; x=1759360564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXn1m+AX1340N1QGqYeacbA14KZeFEwKwXVpo+L85AY=;
        b=Ewu22xqIZP4bMejVM0lsAO4NH6gqhOEI5Nb0ryOVh+LSbY7p/YsrO7XVXVaz+UW+FY
         4Kxr3y3kq6SugQAHmx3AFisuAb9QdAly7U+VXEHolDrfhFTlVEbFsvu+hHwusmZxi0g0
         3lnsrkNh+KT0hUQ3rSaeoYO4Fci3YrngoghmIfKDbIvijhkqED0UuTBkfJunHFiOGNju
         FHxq3tjmxcanYZy8gFazEhl82MoNP4k5Wxw0UTnYC0NU1EroXxdgAeWHg9g6sXwCz0WI
         Y7VJ4ovHYugA/A2wrSjZXgInWYsYRzM8GbxoBo4DeHeDQFfnDPrHbdCATt81Lp79J3Qb
         Hfzg==
X-Forwarded-Encrypted: i=1; AJvYcCX2KpmAtdg+SMYjDNVhJ/2IHVJ5HQ+ykZdVfp+sKGogcCPdDd3hvxtLaiiA73y4Wh3wQ5vPRddpGcAfRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCm4/pu8tMIjsAk1liVp+HbqwNObgE3t0DsLGBQjPBqr5l3OR
	JHXFPXEJpBeO+tdbeZ8EbKWzZ8Flgc0PZVxkl5Eq32KehI8PRWkgstr8GKYjQrKRx98ERGXJRr3
	lHBqEZLQLP/S52RMzvTanpfkxj2WXsxrm/xnCzAOQB6W9/kYH9tofuZp2urg3k4UG1pyncZy+xQ
	==
X-Gm-Gg: ASbGncs8pwXN0Un4mZVPjwEQYVUOQ5k/kcAqGD1nKBNjvcobeOoTeFam5Ohh03u86Ee
	++X/SP/E1vtnGJR1BUx3x9B10MTAGYqNqymJfvXenzhJg7+zHYNdZC8nAqTo8VPKxM+unQVnTYs
	NCLcWNcvoAWpWg9u/nXMg+3krOg7dASTPjdL33t1pJW2Aa8Fou54jogsAtQvaqVxg10wmU+0TU8
	9FZSKEcWkpEG1SlylFawJp+n8NZE/Nbr4pmW21+zuJR+czQKzZpsTzHPGy+tMW0wq0UnEkeSxAg
	ovV28poaU1MY4rcCxQI1iFo0aWCLAnDRvDzwO06Dp5U4kJLNolDip7S79UcXOrKSdty4alRmTm4
	=
X-Received: by 2002:a17:902:e5c2:b0:26a:f69a:4343 with SMTP id d9443c01a7336-27ed49df6acmr14244995ad.4.1758755763497;
        Wed, 24 Sep 2025 16:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpIn7Cvj6Brsx7P/NedJMmndFMRInWOsU8R2vXNvwmG067ycAJ9czkV09xus1XNvsQN8TFNA==
X-Received: by 2002:a17:902:e5c2:b0:26a:f69a:4343 with SMTP id d9443c01a7336-27ed49df6acmr14244595ad.4.1758755762977;
        Wed, 24 Sep 2025 16:16:02 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671c156sm3964175ad.50.2025.09.24.16.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:16:02 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 04:44:41 +0530
Subject: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755747; l=7405;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=6XOZq7Y/TCn6ParDIYklN2NZvButqXkdK9c1YmSmKRo=;
 b=ckwa/uw7GHePTvMEYOQ5tg6YtcQMGCtM5DOrTLcDa+Rbwav/r3VBmaTW9VaylDQXLMj74l+Iz
 aNNXSuhrTTOBv3myA8VvHgEwTEhnUVxk51prPOvUamQiSwSE6MJTeIA
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: B5BQIawCBlpdXZij2bRqI_xkUzWo2Epd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX93M4qGyUE7M8
 I6HcHZd7ylbPBx5emWvwsC8hmpho1H2oJTU+Aka6PaA86yKHYWSyPSuKknl4DknoDYJqOVgw+G9
 9jX4qaNUrOXmK1Byn5sBJTFSPOIvrT3WtKYxXgs5U6XAUYgSjdq/MRkEW1XVqm4R0eITvdmrike
 N6hmgyQh1GbtFm8zNO2Z9EbyjKjgzTM4i1C0QlDeDOAlZOLmBWRkkcqSTfqjnzrPMSyze6bK5V2
 srZk2pkKkHzEOpwYnUfxVm7niiXFPgW39ZBbfXrQJRddAwuJAXgUGQuxUuctoRvk4WqEIlh59Bi
 lFKd/t6scjrXZv44S+3jL8hul06CYY7gZ8+TbhPhFithriS0qBN3gSlmiLg8QZM6KgOnZn2Y5oR
 VETVdfqI
X-Proofpoint-ORIG-GUID: B5BQIawCBlpdXZij2bRqI_xkUzWo2Epd
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d47bb5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=McCQLGM9rlJ3YthuXy8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

vpu4 needs an additional configuration w.r.t CP regions. Make the CP
configuration as array such that the multiple configuration can be
managed per platform.

Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 23 ++++++++++++---------
 .../platform/qcom/iris/iris_platform_common.h      |  3 ++-
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 ++++++++++++++--------
 .../platform/qcom/iris/iris_platform_sm8250.c      | 15 ++++++++------
 4 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 9ab499fad946446a87036720f49c9c8d311f3060..ad65c419e4416d0531d4c3deb04c22d44b29e500 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -70,9 +70,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 
 int iris_fw_load(struct iris_core *core)
 {
-	struct tz_cp_config *cp_config = core->iris_platform_data->tz_cp_config_data;
+	const struct tz_cp_config *cp_config;
 	const char *fwpath = NULL;
-	int ret;
+	int i, ret;
 
 	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
 					    &fwpath);
@@ -91,14 +91,17 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
-					     cp_config->cp_size,
-					     cp_config->cp_nonpixel_start,
-					     cp_config->cp_nonpixel_size);
-	if (ret) {
-		dev_err(core->dev, "protect memory failed\n");
-		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
-		return ret;
+	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
+		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
+		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
+						     cp_config->cp_size,
+						     cp_config->cp_nonpixel_start,
+						     cp_config->cp_nonpixel_size);
+		if (ret) {
+			dev_err(core->dev, "protect memory failed\n");
+			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+			return ret;
+		}
 	}
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index df03de08c44839c1b6c137874eb7273c638d5f2c..ae49e95ba2252fc1442f7c81d8010dbfd86da0da 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -220,7 +220,8 @@ struct iris_platform_data {
 	u32 inst_fw_caps_dec_size;
 	struct platform_inst_fw_cap *inst_fw_caps_enc;
 	u32 inst_fw_caps_enc_size;
-	struct tz_cp_config *tz_cp_config_data;
+	const struct tz_cp_config *tz_cp_config_data;
+	u32 tz_cp_config_data_size;
 	u32 core_arch;
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index fea800811a389a58388175c733ad31c4d9c636b0..00c6b9021b98aac80612b1bb9734c8dac8146bd9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -648,11 +648,13 @@ static struct ubwc_config_data ubwc_config_sm8550 = {
 	.bank_spreading = 1,
 };
 
-static struct tz_cp_config tz_cp_config_sm8550 = {
-	.cp_start = 0,
-	.cp_size = 0x25800000,
-	.cp_nonpixel_start = 0x01000000,
-	.cp_nonpixel_size = 0x24800000,
+static const struct tz_cp_config tz_cp_config_sm8550[] = {
+	{
+		.cp_start = 0,
+		.cp_size = 0x25800000,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
@@ -771,7 +773,8 @@ struct iris_platform_data sm8550_data = {
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
-	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.ubwc_config = &ubwc_config_sm8550,
@@ -864,7 +867,8 @@ struct iris_platform_data sm8650_data = {
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
-	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.ubwc_config = &ubwc_config_sm8550,
@@ -947,7 +951,8 @@ struct iris_platform_data sm8750_data = {
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
-	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.ubwc_config = &ubwc_config_sm8550,
@@ -1035,7 +1040,8 @@ struct iris_platform_data qcs8300_data = {
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
 	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
-	.tz_cp_config_data = &tz_cp_config_sm8550,
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.ubwc_config = &ubwc_config_sm8550,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 1b1b6aa751106ee0b0bc71bb0df2e78340190e66..8927c3ff59dab59c7d2cbcd92550f9ee3a2b5c1e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -278,11 +278,13 @@ static const char * const sm8250_opp_clk_table[] = {
 	NULL,
 };
 
-static struct tz_cp_config tz_cp_config_sm8250 = {
-	.cp_start = 0,
-	.cp_size = 0x25800000,
-	.cp_nonpixel_start = 0x01000000,
-	.cp_nonpixel_size = 0x24800000,
+static const struct tz_cp_config tz_cp_config_sm8250[] = {
+	{
+		.cp_start = 0,
+		.cp_size = 0x25800000,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
 };
 
 static const u32 sm8250_vdec_input_config_param_default[] = {
@@ -348,7 +350,8 @@ struct iris_platform_data sm8250_data = {
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
 	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
-	.tz_cp_config_data = &tz_cp_config_sm8250,
+	.tz_cp_config_data = tz_cp_config_sm8250,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,

-- 
2.34.1


