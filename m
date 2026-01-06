Return-Path: <linux-media+bounces-49976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A15CF763C
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 10:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A09A3300FD7C
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 09:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0192530BF68;
	Tue,  6 Jan 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSggoA/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkXfAmWh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F90830BB9E
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690282; cv=none; b=lv1pED6AhBkmWINzDcNemrc1py5NGxZAhkZnYPme9zyNxHerQVc0dR+bHlqnj8ojGR5oinqBWVqQY9Ebp9NHBGsmb17tAz7UXdRiB5LsExONuW5RSuKS88VBoEV9f+pNv6exJutMJ1WuVbAaEgQwPUJFDrkGVL1Tcz4DtOVa7NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690282; c=relaxed/simple;
	bh=eFGb2TrknCQ4oikLTHFknx3Qi5PMPqdvlpApiIlyjY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tS0DeBn8QpJd49YjbID6y8w2K/t+a3rDeOD+bq/6IcpPLLubw1JZh73jyCvSCqfz4QwWkUc0ZCzAcN43lVAlGg+qCL6gAe2Tqyla1EvfETK4UJ4fySA6f9LwsDDfzu0HGuzR7oPQC1+HzSS7yxtYQsyVv8434cUqucgs3iKXvgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSggoA/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkXfAmWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063PxOJ2429680
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 09:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7tBTi3UFmpU32lDW5rDvlycsT4ewfmDg1H09LPYcTc=; b=FSggoA/fSdCbJwcw
	/Z7Cbgj67bBCy1lb/wtubkBRUAfGC23kgxx4QI+Llhm/bQkjtudG1PhfKpeeHuE9
	FViLFYgecrB1wN4Fx/BZXhJokw9zqaPcR6l+cO3SmASQZubC9YmQXcEEtYuazaFp
	x6So9HarWvrE2W3Zsx8rM9G4kzG5bbBdc7gIw7AGAyrTu8tOfbPig9q8tJIfSVhm
	4kLJC3WT50u5c0WQjmVJ1soCm7AeiC8m0vb/4oU2ynJ16FzuHkj6LFtR3exZWqlC
	w05Ns40iYEnhDWSZcBZV5aWXxwbh9A/m5Q1VDTpYhkREwBfvOvpJLDYsP3gMZ7tI
	1b2sxg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr7398nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:04:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e41884a0so216349485a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 01:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690279; x=1768295079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7tBTi3UFmpU32lDW5rDvlycsT4ewfmDg1H09LPYcTc=;
        b=FkXfAmWhxPOhc247OyAuxwazRsESuRFZI4kAtk1JtctUmm+V1gR158ANQt9fMnoibP
         89ems+Nn1maviBbPmAjVxAXaU/wk5PyGu339mGvwTci7bWQbKZz1Qbuvsqd4U4P+b8DH
         ztehzfI8tSsBu29QFwF4j9OVU4PVqz/59tCIpNqnuy0kUGGKR8KP0hmvlrgyHjUa/SdP
         4Gtgjwcea6ab6ZbuSEiC1BMNgtBm5DBWY+rsuXlsdt3HUBqpfpSDRGfuUK4y5CyYiry5
         iQ3ya1S5x8W+lpK1NPSAIpKiOc65upXBDkV7ZRcXplKMXLDBw8rL5hns/ISZ/05NkmzU
         lFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690279; x=1768295079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H7tBTi3UFmpU32lDW5rDvlycsT4ewfmDg1H09LPYcTc=;
        b=LVpsWDEaKY2cPm6b3HpFwT9us/DvS0InVk93RMybBqfXXWf43H5V9HO6ThDk9kO4uo
         cgDJl6ec//4riWXZV5zoGuEcviyiQEMLJaclsGDCk+e4h6iUXfhqjz4T1OIf4OspHPNF
         U84Rf7rL7/VAjwr9XVjPdxPCEm0CoaFl5ORenVL7KWM+iCNHZ0r63HzXgH3pLdhomzQH
         8VUJkS7GGeCno2H5IVebGJM7bVR2uwOsWXB7c6z2SEOOVjnxxSQI1MekmnDAIgPRNJvq
         UmY0MTPHwEEHq4nolrlClsocWtwUQqWnTelT3gvjgO7aCyezBrTb5qtqceEAFG+DhYj1
         TjJQ==
X-Gm-Message-State: AOJu0Yx5GFbNQ0Y5ceGpj7RWHwGjzP42IOSbwOKVnoWDo03zKWRUFN6T
	wkWCvKfigqM6xCsY54NyOmsJC48MWCHH7QCBSzsq19a8DbDTzW7HEQkIs2ry5tmukJHLxxzNIBo
	bRfjrox0eqG26SWkB6B3XpDCpE2QvX2aA+y3lxUsUbcwwMbFWdNya/Xxh6BBbVSXyYw==
X-Gm-Gg: AY/fxX4GC8MQtVNVGXDN3MtzOOKmP5PqoaUsOKQM+Gi1RAKkwJj691bD4ohb3pT+ZWL
	i72j6UHPu0v1+17Hmc06BA4Gd/avJ+5v5yx0yfTlsxf8N1dH/XbPG+l2U+7Af+v98kF3dbLWX+c
	xqak+o2ocf50BoW/MK0VmC+HPanBPiTSOFk1LV+lAJ2DI9C63Vd+HkmdXrf2A9udQniu7r0bSby
	dPtBmANR/fvudwQbyjAivJkloFRk/srCHBYdiBl/qVzCKB7mj5qPw5kQ8rPnB4wDC9AEQrXMGwq
	Kszk4Q4AE36OZpYTWI0kC4uHC9/fsaU+IZx226wFJkzB68/2gr82o46nnHgNUQ4JDdkmRQiHkXv
	EobUv+sYI/4s9uuBrxYJXRLV7SWwTBMUjJvzmgviS17J5Ubun5A7EJEQ1S3FZBu3wEZvIWoRzEz
	2U
X-Received: by 2002:a05:620a:2808:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c37eb71eaamr311111385a.9.1767690278480;
        Tue, 06 Jan 2026 01:04:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0LWWySRGTBAKyvTcuKEdY/bom8iXcbwDtrwB4+0geTEYZCGDg69vBXsA3gYbHfU90iCm3UQ==
X-Received: by 2002:a05:620a:2808:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c37eb71eaamr311107785a.9.1767690277591;
        Tue, 06 Jan 2026 01:04:37 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53113fsm134368185a.41.2026.01.06.01.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:04:37 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:04:17 +0800
Subject: [PATCH v3 2/3] media: qcom: camss: add support for SM6150 camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150-camss-v3-2-d1d5c4d02b0b@oss.qualcomm.com>
References: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767690260; l=8778;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=eFGb2TrknCQ4oikLTHFknx3Qi5PMPqdvlpApiIlyjY4=;
 b=EaGcFVM/y8y1V4/XsniAzNhHdbs397bO+aT7a5u7IVmnO6UcAa2/Be5qTvw6cGuhcpPuStAPh
 QPd5DOB85UzDKbwPx20DbZaVp7a+XTNKChY6M+3KF+aOaeDGOxicpck
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd027 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OCzWwVoLxjedvhaVoqAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WJJXu_Tkk9O8aaFWj1E3lC1BqpS19ucv
X-Proofpoint-GUID: WJJXu_Tkk9O8aaFWj1E3lC1BqpS19ucv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfX7tHV+hLqH4yX
 cDo2/ZtPpwubGj4h/hwrmyEnyqbOH21fqJop3BjQmL6JesGqH9JUpmI+kyyrSNgrAJBSkxO1n6R
 7QFqUX9q/zlKVaS/Q/kK71IcPw1d+7JWpPnlneHl+nibHKaMYMtCTyw1XvfA5AS4UpA32fI93OD
 p5D/gqdKkkB+Ws6EeSchYd65nvv/JA7TFioukdwnnmi6IrUwQhjsV6QPZKGiVQ4wuC+ctdL+WLe
 W+fdqsdkDpLT3zWekTYxtrsSKUvimHvlMUxuNCRL58Hhbra8XGzb582zXBPiBKZif3HZpyGGVJU
 SlsPhLvxCHGAY7eOBYOFxdlCp6sPbNcr883RrJtvcucKvQW0wRHrSx1xItIQCLci/AFvC1Vntuc
 kC6qvk2ASSmdqaMjRceohEXSiUa6MDKQ6aCdkNDDKfXy+ALDJEnFS0fBMKAiDYmZ8GrctGFkpkX
 ab9evU+A8vNhgIaF07Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060076

The camera subsystem for SM6150 which is based on Spectra 230.

For SM6150:
- VFE and CSID version: 170 (vfe170, csid170)
- CSIPHY version: csiphy-v2.0.1 (14nm)

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 189 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 194 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 619abbf6078130bb6f036eac3ab369cdf4841054..0bd9e1f0cd82347dc6b9d11b2d3179e4c95aa287 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1004,6 +1004,7 @@ static bool csiphy_is_gen2(u32 version)
 
 	switch (version) {
 	case CAMSS_2290:
+	case CAMSS_6150:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -1093,6 +1094,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
 	case CAMSS_2290:
+	case CAMSS_6150:
 		regs->lane_regs = &lane_regs_qcm2290[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9c7ad8aa405888ccea283ffd5cb038fc5bc4ee79..5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		break;
 	case CAMSS_660:
 	case CAMSS_2290:
+	case CAMSS_6150:
 	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
@@ -2001,6 +2002,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_6150:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fcc2b2c3cba076e598bc8aacd34efce5d71713ca..1afc7ac55f662e4ec11955328bc9848a5260f2fa 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1461,6 +1461,181 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_sm6150[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 269333333 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 269333333 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 269333333 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_sm6150[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_cphy_rx", "vfe0_csid" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 320000000, 540000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_cphy_rx", "vfe1_csid" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 320000000, 540000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite_cphy_rx", "vfe_lite_csid" },
+		.clock_rate = { { 269333333, 384000000 },
+				{ 320000000, 540000000 } },
+		.reg = { "csid_lite" },
+		.interrupt = { "csid_lite" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_sm6150[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
+			   "vfe0", "vfe0_axi"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 37500000, 40000000 },
+				{ 360000000, 432000000, 540000000, 600000000 },
+				{ 265000000, 426000000 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
+			   "vfe1", "vfe1_axi"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 37500000, 40000000 },
+				{ 360000000, 432000000, 540000000, 600000000 },
+				{ 265000000, 426000000 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "soc_ahb",
+			   "vfe_lite" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 37500000, 40000000 },
+				{ 360000000, 432000000, 540000000, 600000000 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm6150[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
@@ -4864,6 +5039,19 @@ static const struct camss_resources sdm845_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
 };
 
+static const struct camss_resources sm6150_resources = {
+	.version = CAMSS_6150,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_sm6150,
+	.csid_res = csid_res_sm6150,
+	.vfe_res = vfe_res_sm6150,
+	.icc_res = icc_res_sm6150,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm6150),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sm6150),
+	.csid_num = ARRAY_SIZE(csid_res_sm6150),
+	.vfe_num = ARRAY_SIZE(vfe_res_sm6150),
+};
+
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
@@ -4959,6 +5147,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 9d9a62640e25dce0e8d45af9df01bbfd64b9bb4b..8f635879cccca9426c512f8582a2aedaed63f8a7 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -80,6 +80,7 @@ enum pm_domain {
 enum camss_version {
 	CAMSS_660,
 	CAMSS_2290,
+	CAMSS_6150,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x39,

-- 
2.34.1


