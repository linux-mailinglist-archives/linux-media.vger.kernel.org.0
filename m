Return-Path: <linux-media+bounces-31120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD979A9E041
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 09:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08315A236E
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 07:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7426D2512FB;
	Sun, 27 Apr 2025 07:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m/PlECdd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426CE245035;
	Sun, 27 Apr 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745737384; cv=none; b=P+KlitfAN0ZfaVW4hcrr5U4JgpvKQvOL4G2q9X2qEMOs2Sv88ioUT8uJ+OgxJ4t1M1ggpOIEga7QRUIzwSfQ+2k/zNdipxfKCTh9SJ+oPAg9u+SQjQNP6fptR0PgO8esozPbeWrT3z/LnftchnIBnmbfwDqcP/wR8yVTFHrcLN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745737384; c=relaxed/simple;
	bh=GgLCAxFjHwRruk8oPW1QdP29qDAmLmr11Up0fwUXhPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bm8M+M3lWWLv2Lwn6UfMYcJ4Vww/U2Mrpx3Eh2J71+s6EG5jLzQ8Fl+4ipjwSWVCwofI1AHEE2TIEl0bNpNxIL/0y44V7CJggiYvTlrtN5pFHAHVO2+CDa5wrXbH6sOYBSlpLCWjC/uJPj5drMrKpO9nnJ5zZQMCr9tQhwqQqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m/PlECdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGM1ih024808;
	Sun, 27 Apr 2025 07:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K36bmCsvMfBwcYtwVqh5TUPjXE5em0RjY8FB9UJJGIg=; b=m/PlECddy1opIp+h
	+cBAR965r6zLB0jUHyIv0RMrO46bC4o/1K1GTEjb8hXhRL1L/M9S+ivfHJCEHLIo
	YnLxkEq82DKixgyrYhXaqK4GGK6WW0p2EYZise71WNS3pWse0WqkeyyYsUvHhLe2
	w9QW4UvcVV4TPA/d/htoiaw6osQs5dzFv7jzJaW1YcVieBWWhKYC1IGgUSiZhxsy
	poG5NA58qIoqoPgFF8Fa6TKB7/7YmXYSnypz3nkgBlk+AZZc/OBfYg0aIKnlwHpt
	0pmSZQDt6nDack2rPSMlcpOD6fg0Wmfi+zCUWXeJy+TTbvBPBHhFCt/1hWdFFIEK
	RRYs4w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsb33e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R72n3V016951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:49 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:43 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Suresh
 Vankadara" <quic_svankada@quicinc.com>
Subject: [PATCH RFC/WIP v2 7/9] media: qcom: camss: Add support for CSID for sa8775p
Date: Sun, 27 Apr 2025 12:31:33 +0530
Message-ID: <20250427070135.884623-8-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfX8qwRoErxG4zp o+SQrlgvkOl32kdYPpdeum+eBgZeJynSCkSUkcTxzCmAKAYHZo8Ozj80hZeJZf7Guuw8NjxKs5s EIJKBBKgkM0/WGq6snyfH2F52A9Xx8cU6Ii54XFKMTBDGiXXtSNm1pckWQS6Jw1qKnW08Cksxah
 +DUYHJkh6mzxW9zRLtg/90bakNQLJjLncLOk7t5szbgJ3rLgBXePFODH2UF6+CcED/GZ2N3gZXx b+B1chWRIcRJh+/hder2DRkvJbyVQOkDoX1X5jV2p8O/WGXlc10WYVSH2DllqGpPfsDKcwX2kKd wIDpHxO4v0Oz7WmY5FWdsk9hfGdj8tOempfWrrHJ/ql+88ZsYiasXL0dTQ330uVCMbcU362sxMy
 M83pAX9E/65bfRPgxMfBTMvb6Ek3T6UWRLIDHnXvIoHT3Ef1nioqH2MaXueChauc7hGOkrQv
X-Proofpoint-GUID: p3_1EbaIFFokyAhG3cf7n79hfHSj-sFV
X-Proofpoint-ORIG-GUID: p3_1EbaIFFokyAhG3cf7n79hfHSj-sFV
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=680dd69a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=uDS5G4RjUlL95bN0Uw4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055

The CSID in sa8775p is version 690, This csid is different from
csid 780 w.r.t few bit-fields.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../platform/qcom/camss/camss-csid-gen3.c     |  31 +++-
 drivers/media/platform/qcom/camss/camss.c     | 151 ++++++++++++++++++
 2 files changed, 175 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index b66105f7b901..4f9471523a08 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -48,8 +48,12 @@
 #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
 #define CSID_CSI2_RX_IRQ_SET		0xA8
 
+#define IS_CSID_690(csid)	(csid->camss->res->version ==\
+					CAMSS_8775P ? true : false)
 #define CSID_BUF_DONE_IRQ_STATUS	0x8C
-#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
+#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
+						1 : (IS_CSID_690(csid) ?\
+						13 : 14))
 #define CSID_BUF_DONE_IRQ_MASK		0x90
 #define CSID_BUF_DONE_IRQ_CLEAR		0x94
 #define CSID_BUF_DONE_IRQ_SET		0x98
@@ -62,6 +66,7 @@
 
 #define CSID_CSI2_RX_CFG0		0x200
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
+#define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
 
@@ -69,7 +74,9 @@
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
 #define		CSI2_RX_CFG1_VC_MODE		BIT(2)
 
-#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
+#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+					(0x300 + 0x100 * (rdi)) :\
+					(0x500 + 0x100 * (rdi)))
 #define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
 #define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
 #define		RDI_CFG0_DECODE_FORMAT		12
@@ -78,10 +85,14 @@
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
@@ -89,9 +100,12 @@
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
@@ -103,6 +117,9 @@ static void __csid_configure_rx(struct csid_device *csid,
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
 
+	if (IS_CSID_690(csid) && (vc > 3))
+		val |= 1 << CSI2_RX_CFG0_VC_MODE;
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 60279f3a47bf..ef7b06c9f258 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2269,6 +2269,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 	}
 };
 
+static const struct resources_wrapper csid_wrapper_res_sa8775p = {
+	.reg = "csid_wrapper",
+};
+
 static const struct resources_wrapper csid_wrapper_res_sm8550 = {
 	.reg = "csid_wrapper",
 };
@@ -2554,6 +2558,153 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_8775p[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+
+		.reg = { "csid0", "csid_top" },
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
+
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+
+		.reg = { "csid1", "csid_top" },
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
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+
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
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+
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
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+
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
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+
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
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+
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


