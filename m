Return-Path: <linux-media+bounces-30777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE81A98087
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5D8441C97
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 07:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E0D267F75;
	Wed, 23 Apr 2025 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="az5ksTKK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00622676DF
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392864; cv=none; b=l7gjJRBVtZEPchfPnBARPgcTW1m2nD1e4FNtUmTgwa9worHG1ax442cN/HV/MPqGsCUIpEXg2E7Rj99MFb25HVEDRLHHuIexKUQyhdA9Xv+/Ki9GpBSmmRjhXIjygMtIdBvA8colM24cdTa92S3O/5XWQGDGYuUN7uNB6MT8JTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392864; c=relaxed/simple;
	bh=X+alFMRpOfesOk/IJi5wo30ja91IZAsoaus9JZDGqQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q3WnkQegVjeyx79UTRoPP31+JdlQlZXKwlR8gUnFfR087zwhTSJGbf6HFGVNjManGmDT6SUi1tcLhrlvMFMl3qvE3CkmZgXsbOrP49tAf0Mq164zvxL3R6GcNc2AcI27/VroPJ4tcSLk7HidwQdRSewoptr9aDWWWVWhKBXSFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=az5ksTKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i7ek003025
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LKuqsPzAXCz
	FWePIoEgomsLN2CbaF43dCIi9kkExK8E=; b=az5ksTKKjLiz6kywT6qxpekEYC3
	TJPdQl5UYnd7LgxfcaXZbBvW3ta3hK61L/jz0hkLKMnuTGC5ilQvZDezy6Rw+BrT
	2ZRoJftBn7uv/sDYXT49QMjdQPgkAEeZoZkNgnzkMd680cLV1470VXhAq+ByhgQl
	S9+hUAqwnOkltoeDDuqYzKJUzULY8u0K3G80z4pXZDl0xv4uCgqev1HYnR4SEqa3
	MKJm4jj23tEbmAscYT83B9ARy438oebajfvRGelJCCP2KHbdnBiPIvvWh58L0KYM
	D2B3/u47qjFvHR65O1ls3Ucg1kdYr6xiSHHzxUxVp9DOu3ZuFrmxJqUmjsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy179r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 07:21:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0c1025adbso1156894985a.1
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 00:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392861; x=1745997661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKuqsPzAXCzFWePIoEgomsLN2CbaF43dCIi9kkExK8E=;
        b=UQdAqg2UP3ZCXmiizYIrYAM5+CBvQj6+PJbeNA0QnheViaZc6kRRqHz5ZwaPXYELzO
         Nu99X9H6VH6yiHrLJoBTlrj382fMndFyzT/qP2awUq8IMZynMUeYFF8uOD9pJ3tu76y5
         kZrGgjJiO7+SbYJ8t3dng1Ki6gS/VswuZiaF8xAu+bv+TsR17gSEMZFi6jmKDzXwL/hy
         Nxy4D4jFMd7pSnwuD+swDicJJQt2EbUw/EJlIcz/Y3J6JpR/SnEq3vcA9pNl9eOYBJOT
         bJpW+o4jv5HptgBRvB/151w8jEkU/knxBtanWMm6/vd2WUretT4U+zAOFxPOcplpBTmh
         W4jA==
X-Forwarded-Encrypted: i=1; AJvYcCUcjPb+MkjL00Rzu2VjIJ32sC3i0Mr07Wn9uDJxfm53+n/JVs/OmxZ8YLJo2gDlg76XCv5/fmaASKMBsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUT9zVIZUUGYoSJN+t5W3p//IaZIyudGinSshXqgLDht4jC/XC
	saWQID26N3D/v2yC90rULUtmMVrzv1FsYDRqphbMGYw1V57kdtFzXCZkAN+V2hIzrUgNLuVDOoK
	iAGn0wUuQCCST+Bl25B5mOcmGcYoaXpcBxk9x+cr1yR1vzkuCv+q9zTy21mk9lQ==
X-Gm-Gg: ASbGncv+IYCMy8M0p8R32EsQm0SCLajrpybPl1hdWMbOs1oh1Huy+ETvM+H/vIbVp2C
	SL3nKjWa+bfdmwtZp4vKXSkmkcCQteNpaS4dapCFo1nBmVYV5xPGZru9f6ITXsEDpPSxrbRKCP7
	AH2KUlmVXDwve9U2khEKXQ+GMuOJ40rT2ejw6H88+rrcEqGcRmBpwrSwHnV2gntMtPRd3/H00Aq
	qfVaYzljtbHYwGH50jwlBYeB+t4EKrpel/f/1UxnqobRkKm8vbkTGBirsX8Yna+yvRpC8ucn/X3
	8xU6VG/UJ/+9usSQVmCDjWAZ+fDR4bLvjHNcqx7pFK8PHoI=
X-Received: by 2002:a05:620a:5ece:b0:7c9:4d4d:206e with SMTP id af79cd13be357-7c94d4d21f3mr281133285a.6.1745392860714;
        Wed, 23 Apr 2025 00:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0UPk1lUMWe1R7PeZhmMEGfZByAK0XYQ4UhgB3PUm5+9GincFeZninZj7EJQUIIEfkFSssPA==
X-Received: by 2002:a05:620a:5ece:b0:7c9:4d4d:206e with SMTP id af79cd13be357-7c94d4d21f3mr281111885a.6.1745392855536;
        Wed, 23 Apr 2025 00:20:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:10e3:ecaa:2fb2:d23a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec42af6sm757138366b.43.2025.04.23.00.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:20:55 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v4 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Wed, 23 Apr 2025 09:20:42 +0200
Message-Id: <20250423072044.234024-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0OSBTYWx0ZWRfX9R9Lzn4oxAzF mTaILJgwoQOnnMEz+Yg168zLupaTw90ee+M46X2y8UpexuJEC76kgyC28aMIwuyPZpFmxDT06OG pt+pEK960Nkx39BRVyielU0RTQcYR9YkyhG6Oq6bjTA2+j01ggdDwvN6/Cjbdy6ZgRWJA/bjceE
 6f8MbYnK2TAmVX0tAC3sF76NVtiGIwMa2IEduSWY3b8BvC8ArAjzJTFiRZRig07pb2BQ2XZNZus BjecWgbZXRubimGdup4XbQEtDGVBN5qq0CjTntteVn2nhrXN9WEDKthph1n4/DZVIE00g03d4PO FcM75JU9RhM4NVErNHSMV+2CL2Yj4X7j0UdELSvgqCuPpMX2Ccp3x45T3zlI9xLK4Vhim94Obr6
 tOxbKFn0vrnlKilQ9z/8LWhy2jAn1KhZR1GrbwLmoNsGQ1Yt3RCsQOfMU5hHsGneC2sp22Zo
X-Proofpoint-GUID: wD8SVpfZA8WyEeEj4DZBNSeTHG8UjZxe
X-Proofpoint-ORIG-GUID: wD8SVpfZA8WyEeEj4DZBNSeTHG8UjZxe
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680894dd cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230049

The camera subsystem for QCM2290 which is based on Spectra 340.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


