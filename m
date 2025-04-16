Return-Path: <linux-media+bounces-30328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE7A8B885
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B216216C074
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ED824C09A;
	Wed, 16 Apr 2025 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSoVWQWM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9924BD0C
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805364; cv=none; b=Y5eIN1nD3flwm5D8B3HNxEiEzhSJngvETCsR01hfUhPgBSZOtrQN7uQlA78n3CvAxnYCnaF1OV9vX5LsVEV7rP4cd5+Jaz60pdxENA0cmR2Rp3hrr9Qao3wfVljGdQCaqMLdvc6ERSUqJb/FUkpI5XXcmEgHqLidzRVQXKh7Dr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805364; c=relaxed/simple;
	bh=NPVt5Eh4Sxu8Ws6J9AGsZ3lKsahEbFRxLpruWStJmUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dtSP1g4W3YjPDntonJGsbZ6Z9C6+2sNRMhepCKEkIXgAO/bekPZeNQDiGF/L3D5ltJ0mbK4ZViibajuZhclF2TRIBZWjUj9LRSu/lv3xmb3atC33b+j42O6GRQlEjMM0cUTIqqeN1vIdDhQijT8ucTsIL8WeLrBV69dvJny9V0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSoVWQWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mhOm022364
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bWGiRxcgZ25
	rVa8O+VrLYX4RCWMiG+80+yHZX4iCUnY=; b=lSoVWQWMD5mqTlwdR96uxcMAHpl
	ZUKOXKNHUBcK4feyLUhOzMCyOTz5XHFahl/Bq5yZ8G2lE3xtaqfUF8j6XDNTvdCh
	QV4z4l9hRzRnDwIg5fEQpJp1anZfrORGfI05bUQeJTe7Win0g2laBp1R7C7aFMVy
	F9lrQTVuNOMEcIe+EEplkWrwXKb92q5taTBzt0u+nVvlGm7xPcC3Dk0krX+2H0l2
	1Hwj0K1qHWmo5gHO1wJHDq/7lCZ6dIRNdDt4LyipzqYJC6PI2c2kHJS2WB+NsBHq
	+HK9bIeEwc2D5sHfW0M+jS915sYDlBnPqLCU97WiBaIt2jVs7t5kdh1U0tA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9bdk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:21 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3feba2d5745so1755753b6e.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805360; x=1745410160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWGiRxcgZ25rVa8O+VrLYX4RCWMiG+80+yHZX4iCUnY=;
        b=PXNx6stQ+UrecmSmHI0vm4Z14viUlMCayv8L2QDm1fC00u8BQDaGEeyHfoYQFiNdTt
         LbjfwxH0TQ+J4vwCdt0khgt/JyV0hTw2hv/akOfyBUYzw3RQRj9mZYLdoq0oafdXZM/V
         F1MlbdlPCY77+NGsdFW0qvvFMotPFroF5DfQn3Z4iCDJnQfc/Ia4D6J/1YZ3fMox35Sg
         BrUy5AcM7JCMEsiXA1KfxvBGeX0Whg/fd9/3+BnaDk0caUTrCHiMh/lF+sFHGuZMH23J
         ABJL6t9UP4Q9ZbPZEj7lcDCY8wCdDkNK6w+ok0cIgvVUpyUZH3/b131sMgzxfNsjg2o7
         6SFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeHFllnGkBld7Dcq7IBU4iNmWe1226+BlIjHS2i4MO1woreqaE9bw9nKEwkg9kXg2ScTlVsbeNksWp9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZfZOsxATE3mgY10CxhnRemhYdeQOZjlHAMwK87M8zFKO6Pv3
	9T1mB6aq+22dXEiZ26DnJNuOeX0FBBZERiOHrCD4i0QKc5SBImdWkHW27+0ZD1vUvTdkK0DK+7E
	Dmg5YCFDiwAV2d/YTcsuxxXYV/gaYeP5VZ+K/olHWtOOR10Yg1Opi/TcWf6CSSA==
X-Gm-Gg: ASbGncv7lDof2DNubTXzTgyXkqv6EzUx0ddDUHmyMO8pOpD1AEidLUvXmmJ9NmSL8ah
	Cx8VKkrWWKR6hKOpdh+sPH2Q3x6nFM2TIpNskSTbBnNRIUzjf8Z/Gpt/moQKLnB0dNu0asgehbA
	wCBeGR7TJsGzglO03ziO7I0m2kE2zRSTYyywbo2tAPZTVo/YilMSGgz2Tu4/cTiAEYbMekfZkE2
	dMZKEq8t6KUujUtWFMxo0B7GtgUXSi3pC67KIuEdSLvKlu2+USc/5NC50V7A5xALHmdPYvUMaRm
	QMBVqMN50jSN3j7mN/U8p0ioI8rh/+VW6A/OKxoL/lWBUfU=
X-Received: by 2002:a05:6808:220f:b0:3f6:e059:40b2 with SMTP id 5614622812f47-400b0217609mr963744b6e.27.1744805360186;
        Wed, 16 Apr 2025 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERkhJLDuDjh221NQaFSFVJW/EglXsgM8zuZ1aXTPm3pwFvSY22ltbiULU+wSVMldsT2p30UQ==
X-Received: by 2002:a05:6808:220f:b0:3f6:e059:40b2 with SMTP id 5614622812f47-400b0217609mr963724b6e.27.1744805359864;
        Wed, 16 Apr 2025 05:09:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm8328669a12.35.2025.04.16.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Wed, 16 Apr 2025 14:09:06 +0200
Message-Id: <20250416120908.206873-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JUD663mySUvFNhh1ZHDIq_GYYfC_LZmH
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ff9df1 cx=c_pps a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: JUD663mySUvFNhh1ZHDIq_GYYfC_LZmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160099

The camera subsystem for QCM2290 which is based on Spectra 340.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 146 ++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..c575c9767492 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,6 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		}
 		break;
 	case CAMSS_660:
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
@@ -1969,6 +1970,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f..1e0eb2a650a3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -515,6 +515,138 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_2290[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_2290[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 192000000, 240000000, 384000000, 426400000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_340,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 192000000, 240000000, 384000000, 426400000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_340,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_2290[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+				{ 0 },
+				{ 0 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.hw_ops = &vfe_ops_340,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+				{ 0 },
+				{ 0 }, },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.hw_ops = &vfe_ops_340,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_2290[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_660[] = {
 	/* CSIPHY0 */
 	{
@@ -3753,6 +3885,19 @@ static const struct camss_resources msm8996_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources qcm2290_resources = {
+	.version = CAMSS_2290,
+	.csiphy_res = csiphy_res_2290,
+	.csid_res = csid_res_2290,
+	.vfe_res = vfe_res_2290,
+	.icc_res = icc_res_2290,
+	.icc_path_num = ARRAY_SIZE(icc_res_2290),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_2290),
+	.csid_num = ARRAY_SIZE(csid_res_2290),
+	.vfe_num = ARRAY_SIZE(vfe_res_2290),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -3865,6 +4010,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
-- 
2.34.1


