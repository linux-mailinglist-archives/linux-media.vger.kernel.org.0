Return-Path: <linux-media+bounces-30466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E357A92095
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 16:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F4319E8125
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 14:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA431253B55;
	Thu, 17 Apr 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fE2/W3sv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB1B25332A
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901916; cv=none; b=AoIfb1PNzSYU1oWKsG95OB2fvBOV2RvDGLTgbPv25GPeebUKU8OUcuKVD6hzN28j7p8mOGob/SbGitgyu2T91YmkmoJUufRqYi7jD7auMtO8gIR5QpSUph4mzhmpFyTYnZItWrU+i2o6TW3bGuo99VH2Thrk5AYXlOB3W8W0Lts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901916; c=relaxed/simple;
	bh=npsp5Xkr4YuC0J7hudOOEeSBuP9AhNKswNrTxoxTqSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sVSDX9x4Zw1Nu1aJEGZ8Tk6poQvCxmr38kWYSdxDIO61aw/LCiO3UPiDXWPlFceDkpEZjM1/NFb5y4VlLJjDsvzpoHdGP0mEuProb0B8KTBIN0HqHD0Sf4svMAV+mk+Ddq0m5ABz3yWD0XXDsRAUqBE0n3ze3xUksP4+q/0B8fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fE2/W3sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCleTS005967
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SPiOSKlqHwq
	BBGgAZYKsxfVM4rvOqh3ReTcJLmh0jWI=; b=fE2/W3sv7VxBtDtu4IwAi9ovgDb
	+gFcUqDOfRdTXYEThqjxJyp5YZDPZd7ImiF5wuSnW8Lv3eEOQX3WtcwgYTmiTP3Q
	xYlMQKdMzBKnFVpJHHnU2yPFUwpfZC8lvQDGPe5vyARY2cBRpTnRW0afWV719OXT
	EktDrkwy71jkFlsoir1F6TP8nlVYhgUTWOGuimmNgVlcLz7UYAdgF5NurnGCOMUH
	gFv99d+cp+CrUfowAHwWMf+2ngyZi3G7ZFb98s+3WGkwirc1ATxDq2qJphh611gY
	aLltORsPeGBCkhwB7i8I57p02H8EcfOkspVYHUuoOX/YCuAeGM0jZcWmCSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69yb80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 14:58:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f0c089909aso14682226d6.2
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901912; x=1745506712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPiOSKlqHwqBBGgAZYKsxfVM4rvOqh3ReTcJLmh0jWI=;
        b=UGLJN4uNUg+IMv/LpZuyhasx5gsBOizUIsb2ZFCFozNFVxy5tPWgGe0RzTkM9ufyud
         Wef5NVrt3ximl/c5d3wIbWGqCzMoQ4T7/1JLyIuk3R/WS+ycktRPEjsL72rZkWaHfN6t
         sopuV/ewr3wKoAUPVq1xr2+tEaigIeECY2c+ftlMghxVCkf+u1F/j2Oxf2fzI8ZVeN77
         qxTu0fOd/2a28mEI/DBb/Bc6cYQ7oJoVQOfdnLdZdNn3RJxHjXzDhvUqhr7tFc41pQWz
         jiUmgphQMpmwA5MAf8FgHfUF0RBCrPH2NqiYAfUFHA+YxLg//ZEah0ek/HZP8Gm+btPg
         ge+A==
X-Forwarded-Encrypted: i=1; AJvYcCX1sFDLnCpwKZOYrLScrOtprtM22GSSWJOiQKxsWwKgqtvwpANHxdNG5xlBAAcfNn205UGK+8Ri4jdHZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlxA9i/Gx58E4VVcbM/EF5CqhgdZIlo1KR03057f9qsI3GvkC+
	yuX1GdA4KoqeDnCrv5MOGrhlennzEoX9tu62FV/Fl39fclMV6iR9m+AqxGzsgLiPXJ4+kWC9/Lp
	8tjZ7a/XaZLQAlgs/w8jhEVtLJIN9f9TJI7VoF/fQnqYwpPecqnNu9tinmN0AUQ==
X-Gm-Gg: ASbGncsBWq3BYYEWKS8P2SxqLCIAagdfgQiBjGK23QZforZ8g4XL85mojFGT96nukSt
	M5f4gujg6lhUm0n2foYjvPtYA0eDoz8EgVYEv0Ich/Ryj0erhVIAZGYNXKY7dNNSJyjrFuYJpIa
	ZHzT5GY0wEODL+BrQRivlSUGDI1Y6NbTGLqNEfBJ7kBctnCJwV2hcp00+HvysqNvYw+p/HuKCCT
	WOkbpYqUHnPspjQeLGD8cFxuLLD7TNN0qUc04KBkk37nxKWxg9ZFsj2y9zBne4uPSiEXafmBeSe
	iMlO5+UxHd4qeoJRd/ULRykS+kh59Rhv8cBwKqZHAdTZsU8=
X-Received: by 2002:a05:6214:20a2:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6f2b304ec27mr99290376d6.34.1744901912283;
        Thu, 17 Apr 2025 07:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVJGP+skGmJ/evOqzRBSgg1meDa95jRVoVab6OBbSt7ZmSFoPQEA++LriRw0kQz1ZwWBPD3g==
X-Received: by 2002:a05:6214:20a2:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6f2b304ec27mr99290036d6.34.1744901911964;
        Thu, 17 Apr 2025 07:58:31 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm3966166b.148.2025.04.17.07.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Thu, 17 Apr 2025 16:58:17 +0200
Message-Id: <20250417145819.626733-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
References: <20250417145819.626733-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 192KAZGEdOM-lRmZFolL44eZZnP417uw
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=68011719 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 192KAZGEdOM-lRmZFolL44eZZnP417uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

The camera subsystem for QCM2290 which is based on Spectra 340.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 148 ++++++++++++++++++
 2 files changed, 150 insertions(+)

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
index 06f42875702f..64f263b8065c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -515,6 +515,140 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
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
+			.id = 0,
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
+			.id = 1,
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
+		.icc_bw_tbl.peak = 3000000,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 3000000,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_660[] = {
 	/* CSIPHY0 */
 	{
@@ -3753,6 +3887,19 @@ static const struct camss_resources msm8996_resources = {
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
@@ -3865,6 +4012,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
-- 
2.34.1


