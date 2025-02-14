Return-Path: <linux-media+bounces-26151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A477A35AF2
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68E5F7A2634
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 09:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712FC25D52B;
	Fri, 14 Feb 2025 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D0QD7XRy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13B25A640;
	Fri, 14 Feb 2025 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526999; cv=none; b=lykVUiqrViI62k9uX9Frsp8h9UJx/ysNYu8uRSKqhnZekFOsIXEiVCYugLj8QQSld7Oq4v63etu6nudJi0I1lovIGia/X3X3uRuKNYeXPvp5u9l5Thgle0uVqmTD6UST/cRqy3BvOsA6xhRTfg/SHHWj6wnCz9p1N/yZhQcXGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526999; c=relaxed/simple;
	bh=cjRkm3uh/e//CfBttj9mAhGUBQTHG8t6ruCTx5IGxBM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XIBea+Q7EeCtnCZL3CVaaIRHFE0a+RomFwzkMnheYSeGn8YwB7+BNqJLRaoKER8R37Ioy5bxUILI45gO70PWdWrxiaNfkHvPMaGRaOiKF9C2EhFvilHwk/BFK7QUopUGzPviuxLVuu9P6lDtIDx81KWDXhWDBKa3kTtaHhAsc7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D0QD7XRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E8s2dK028708;
	Fri, 14 Feb 2025 09:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNjhAfW6/peszqKRsXRZ2D/Am9WCq21HAOCNWHy/qP8=; b=D0QD7XRyFmI20R4p
	0pxAMbMOUvzt+ct8nW74qUNHyeHE9Qdy+MzRwwnUyMlnzc2rm8Jp/0UvNHEmQWUK
	gPUGsgLogs+QHWVUbE1PMqrTdL2wytKVFYLqHQLjniPrdLaM0cyr5WWHomhIX9Qx
	cd4YS/RoegCU5uwcprJk9xL0j4+o5rjQNY7YoWEu31HiFMy3Cm53mfxRs2GyuLlN
	hsLwu59o0TW8cEMGxhiYjcsJEuwGxnNH5sd9RSUOTqjYUnUBdKtj20JOcR0reMar
	ZiZ3YYfl2O0OQTSr3V8iSOHk5Zpbyz98oxAQwhq8bvhpV1QFGhg1yN0UEOJ8MTVo
	Iayadg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebnbatf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9uXr2018189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:33 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 01:56:31 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>
Subject: [PATCH v1 2/5] media: qcom: camss: Add support for CSIPHY QCS8300
Date: Fri, 14 Feb 2025 15:26:08 +0530
Message-ID: <20250214095611.2498950-3-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
References: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N96OAEVjKgQyobXuCGkEq-YplMLIK_zR
X-Proofpoint-ORIG-GUID: N96OAEVjKgQyobXuCGkEq-YplMLIK_zR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=997 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140071

Add support for CSIPHY found on QCS8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +
 .../media/platform/qcom/camss/camss-csiphy.c  |  5 ++
 .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
 drivers/media/platform/qcom/camss/camss.c     | 48 +++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index b69c20b0544e..4f97beef168d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -703,6 +703,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
@@ -799,6 +800,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
 		regs->offset = 0x1000;
 		break;
+	case CAMSS_8300:
 	case CAMSS_8775P:
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index e07e871113d9..c462e0bd7ad0 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -103,6 +103,11 @@ const struct csiphy_formats csiphy_formats_8x96 = {
 	.formats = formats_8x96
 };
 
+const struct csiphy_formats csiphy_formats_qcs8300 = {
+	.nformats = ARRAY_SIZE(formats_sdm845),
+	.formats = formats_sdm845
+};
+
 const struct csiphy_formats csiphy_formats_sa8775p = {
 	.nformats = ARRAY_SIZE(formats_sdm845),
 	.formats = formats_sdm845
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9f2e088b1e47..7cd2697d9d54 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -125,6 +125,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
 
 extern const struct csiphy_formats csiphy_formats_8x16;
 extern const struct csiphy_formats csiphy_formats_8x96;
+extern const struct csiphy_formats csiphy_formats_qcs8300;
 extern const struct csiphy_formats csiphy_formats_sa8775p;
 extern const struct csiphy_formats csiphy_formats_sc7280;
 extern const struct csiphy_formats csiphy_formats_sdm845;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1c0c3c019803..108470a2e70f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2447,6 +2447,54 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8300[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer"},
+		.clock_rate = {
+			{ 400000000, 0, 400000000}
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_qcs8300
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer"},
+		.clock_rate = {
+			{ 400000000, 0, 400000000}
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_qcs8300
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdd-csiphy-0p8-supply",
+				"vdd-csiphy-1p2-supply" },
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer"},
+		.clock_rate = {
+			{ 400000000, 0, 400000000}
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_qcs8300
+		}
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	/* CSIPHY0 */
 	{
-- 
2.25.1


