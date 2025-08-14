Return-Path: <linux-media+bounces-39905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C7B262A9
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 12:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9A52A26F03
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C1C30AAD1;
	Thu, 14 Aug 2025 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e3hPVP5G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D0306D30;
	Thu, 14 Aug 2025 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166650; cv=none; b=Wc53Yg3FWZKsRDb0cDwEAqui1sT4QSfHcLIGtTWg3mtl61u28EGoutFEuYSNmTY/3CA0nL7NKSFjYwfYjXtmhfcWhvZ2aAtO1K1O4LjNDfSiy8LkTJmKQ/nyiBKziEI5tIw+jRStvmERfTJsnFnOYWDnc1vK9L8MWTcXWFb3QB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166650; c=relaxed/simple;
	bh=6LJFBMymB/j7ywS29NiIEfOt3G10cE3vAMrAPTjvrpE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAgvTvAGmzw9wcuiqVS4zB/OJ5Hy/bCodRrT76k0gH2dNAuB4InDy8AhAh3Kw5G6wwdFAar9tThJj3WU9vl9dxLFhg03+6TST4gq6E913gbMrtFLUBOl+5SyjW9FgZ4whn0rQUuaoA79/vt7dfpws2PvnyY4Jtrp18iS+F0+9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e3hPVP5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9RuqR012974;
	Thu, 14 Aug 2025 10:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utfU3JVvYWSp8Btn2KMEY/dwp4EDE1kr0qTlamGzFUk=; b=e3hPVP5GOl01gBXy
	NS7EJy7PbID4ccp/abyFMN3EqpMI0j+y+AuxfHUn1uZsU4RWIVZZKN3A2E1mUxun
	oW4+0bAJtWI7ofpCYPPQgSvfVjcaqbSrjV2hrmsC+0WSQ97bigX9sJ4ceWPRjEZy
	T6XRxfbQn7ESaau5IyZyJ5cxq0LERplIVrAmwCQO/Imp2ieS48WaXk9QXQYcRsPU
	M1KklYZNPG8nepYq92Vjz4RNNGBhcF8UVBvF6RbO65eQqLalNTDC++++1EHOu573
	pVSIYOOxy29u1/SGmxMd1lNZBLEkiGVzxkuXOjmaqa8mq4ACuetUoafj4aU/Gpia
	MTksow==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6u5am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EAHIYQ017835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:18 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 14 Aug 2025 03:17:12 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH v5 5/9] media: qcom: camss: Add support for CSIPHY (v1.3.0)
Date: Thu, 14 Aug 2025 15:46:11 +0530
Message-ID: <20250814101615.1102795-6-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
References: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX0oVMeKrCn9XD
 CF+isj09QTFdL3k49LDTbFU4R5fV2rF+4yK3OdVO50PoyHLz8s6PZhyuFBwSFzdOfoN2vwz9+Jk
 8oEjnbHaWJdkdRoc/DTcUrOPAtviBnJck1DRSzrmkvIny3zv+L3mX8Ag1uJAxmHANslSsYsdb06
 wFNDNMxfBzfQTJsHnX8IE0JMdtRIL1WzdPJK1i99Ai8ZCN6aIdxL0l9bLuhp7FVJDK1MZYTr71w
 ZfyzK/LU6CWBed1MrdGoux+TfrnlD4nphpfIfK31W6h/EjNhWsPp71h72HgVE7ipoZesXPkPb98
 uAmy4m2XS7sIpaVtsMUwoBeRnKRl3JUhAfnzuxuEZh0KB5mPfsVr8NG+5aed0ki95BpahVTWjuh
 rRCEeIgs
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689db7af cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=fK0l7MaaGrBJy32dX0YA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3o2lBdmJqPaPwZYc0Yt0mfygKNVRLHOs
X-Proofpoint-ORIG-GUID: 3o2lBdmJqPaPwZYc0Yt0mfygKNVRLHOs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Add support for CSIPHY (v1.3.0) found on lemans(sa8775p). This
implementation is based on the titan 690 implementation.

Co-developed-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 84 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c     | 71 ++++++++++++++++
 2 files changed, 155 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 88c0ba495c32..a610504359d0 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -64,6 +64,85 @@ struct csiphy_lane_regs {
 	u32 csiphy_param_type;
 };
 
+/* 5nm 2PH v 1.3.0 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_sa8775p[] = {
+	{0x0724, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x070C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0024, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0224, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0424, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0624, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x005C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x025C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x045C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x065C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 1.0 2PH */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
@@ -749,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		ret = true;
 		break;
@@ -848,6 +928,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
 		regs->offset = 0x1000;
 		break;
+	case CAMSS_8775P:
+		regs->lane_regs = &lane_regs_sa8775p[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98efc373a694..4767d4e7c306 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2483,6 +2483,77 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8775p[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer"},
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
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
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer"},
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
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
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer"},
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "csiphy_rx", "csiphy3", "csiphy3_timer"},
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
-- 
2.25.1


