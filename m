Return-Path: <linux-media+bounces-39044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E02B1D762
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 088A656032E
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FF12586E8;
	Thu,  7 Aug 2025 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WRyQdegD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8A2571DD;
	Thu,  7 Aug 2025 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754568729; cv=none; b=fIIRI2CPU5fgaKJ54Ug54nDIBw2eIiSQySdW72xlctihOYlbWwLscHXwzJweVA9TeI+BNWkpVAN+EEvklRuJH9GHmE6aibMSArw9iPBym6FeKviNBQbB3TqU2ZoHbQ5Bwk+ybeMYY73axb87SBf5aQq+nMSljO7J3jX/LSDMQww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754568729; c=relaxed/simple;
	bh=h9yAZiled05gNJB9cIUDqxhdja/Liuv5Fzx8JZCGZ7Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dFYexGUAV5Z2UDMoNwnNxtyRGfnM1nnZBaqerjxiJDVLY6rTwMLMudc0hmZxCrZ1xutq83NHLiBIL+yjWOAdy+sJa4KmHiVRz8GrJJMNvzLCIY6EBC/PFRoUoqDXVa410Jdt8lJE8T5ITrhjjZceMVnCw5jriAShDFquHi0DuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WRyQdegD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DA0O025036;
	Thu, 7 Aug 2025 12:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5cNQTbanw9ysVuDAyk0Q3wVAM7x04oSq5dpdpJd7jsc=; b=WRyQdegDhdSYqGxl
	YJWgzEpoCG8LNm16t1zkagyMU0XRxr1B3Mzrvk1FzgRSPhHtd9e5aNGpF8+uzNFr
	p5/YmaZE8G8XIbkszjiZy9xlXxjdBVrRdMqHF7p/DTKOUg1R5KMG95iNNU72hbOr
	uX2r7fzCKBjPsijX/+EjlAe3/h9LleYQ2ZPoFlWFSPcrTXnihNx2+23qW4jSqv+L
	VmzFr9a0U7uTWOIrEna+7A6GclAqEkKcAJQSd7Dts+PjRQ9oashBrmCqRuFYg41M
	ltgOILlDI/98TMRAmzijAgpRG4DoGmGvaO60NVcfNI6vaGP28h6efFSZEyLHCXrO
	ArJbiQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1e5us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 12:11:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577CBwfi006068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 12:11:58 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 05:11:53 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 6/9] media: qcom: camss: Add support for CSID for sa8775p
Date: Thu, 7 Aug 2025 17:41:02 +0530
Message-ID: <20250807121105.710072-7-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
References: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/zw1+XDyug/D
 6sK4McrlXfdnRuRzdUm03bRidbzK1xiPVk3iy5tLFOeIuCx29vY27skDyytz7Abmj3PIGFGLU4L
 /LNnDuWMYuB2y1kPsXyUpV3GuxWRAiPStYaeSMSUx4axSd2YU66q/vBd0o96GNcbOU+13CKyFl7
 0H6dj8213mdR5tQIc0cUUKrGcPlFfNBWKtIa3MVH/4VUN4V2DQyACH1w2lZ7ydmaFjwGvbu2IBg
 Dzpjo3gFRLYqJkPxrPSAQZBNnoaAG6723EVu3P4M24aIpue8KRBuEmPuk4cis/W4Z4sg1JcYyjC
 CidSdS7hQsKsIwzPo9L954thvPMNNk+jnF+VdppuY+e1v0ylBYFj9j332AKpNKg3MnN9eK576oQ
 jMkKft7C
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6894980f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=8yVpw4eTn7GS_Gpo2AoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S4R8FH9RY59tggK9_LIg0j55l9enlqZi
X-Proofpoint-GUID: S4R8FH9RY59tggK9_LIg0j55l9enlqZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

The CSID in sa8775p is version 690, This csid is different from
csid 780 w.r.t few bit-fields.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../platform/qcom/camss/camss-csid-gen3.c     |  27 +++-
 drivers/media/platform/qcom/camss/camss.c     | 133 ++++++++++++++++++
 2 files changed, 153 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 433908a54baa..fc6a9787febe 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -45,8 +45,11 @@
 #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
 #define CSID_CSI2_RX_IRQ_SET		0xA8
 
+#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
 #define CSID_BUF_DONE_IRQ_STATUS	0x8C
-#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
+#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
+						1 : (IS_CSID_690(csid) ?\
+						13 : 14))
 #define CSID_BUF_DONE_IRQ_MASK		0x90
 #define CSID_BUF_DONE_IRQ_CLEAR		0x94
 #define CSID_BUF_DONE_IRQ_SET		0x98
@@ -59,6 +62,7 @@
 
 #define CSID_CSI2_RX_CFG0		0x200
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
+#define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
 
@@ -66,7 +70,9 @@
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
 #define		CSI2_RX_CFG1_VC_MODE		BIT(2)
 
-#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
+#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+					(0x300 + 0x100 * (rdi)) :\
+					(0x500 + 0x100 * (rdi)))
 #define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
 #define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
 #define		RDI_CFG0_DECODE_FORMAT		12
@@ -75,10 +81,14 @@
 #define		RDI_CFG0_DT_ID			27
 #define		RDI_CFG0_EN			BIT(31)
 
-#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
+#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+					(0x304 + 0x100 * (rdi)) :\
+					(0x504 + 0x100 * (rdi)))
 #define		RDI_CTRL_START_CMD		BIT(0)
 
-#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
+#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+					(0x310 + 0x100 * (rdi)) :\
+					(0x510 + 0x100 * (rdi)))
 #define		RDI_CFG1_DROP_H_EN		BIT(5)
 #define		RDI_CFG1_DROP_V_EN		BIT(6)
 #define		RDI_CFG1_CROP_H_EN		BIT(7)
@@ -86,9 +96,12 @@
 #define		RDI_CFG1_PIX_STORE		BIT(10)
 #define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
 
-#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
-#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
-
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x348 + 0x100 * (rdi)) :\
+							(0x548 + 0x100 * (rdi)))
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x34C + 0x100 * (rdi)) :\
+							(0x54C + 0x100 * (rdi)))
 #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
 
 static void __csid_configure_rx(struct csid_device *csid,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 4767d4e7c306..5f1e267045cb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2554,6 +2554,139 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_8775p[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID2 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite2" },
+		.interrupt = { "csid_lite2" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID5 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite3" },
+		.interrupt = { "csid_lite3" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID6 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite4" },
+		.interrupt = { "csid_lite4" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
-- 
2.25.1


