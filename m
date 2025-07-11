Return-Path: <linux-media+bounces-37508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CF2B01D23
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D98C766404
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A432E427B;
	Fri, 11 Jul 2025 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cugXmxVX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FFA2E11B3;
	Fri, 11 Jul 2025 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752239574; cv=none; b=Bhi7PrFkbl3YB/6007sqYI0nYwBotDigzHf1MMcRy5MEDT/LThEwq7GqOXEIrfqJUIwqHwATVeonwu6f62zIYoQBFD7LDGrANyc0omPBSXEzUvdUa5LJXpo4hRpstHmrrsic6r4RLQuscjW8T39mhBA4zp0YgpEmfmexQtnyM8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752239574; c=relaxed/simple;
	bh=7I3bU8IRZ5LIrUh9DTxS955/meHfuw3hibv3fRyLNAY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PD/MStCFbCEhg21LVY66Gvxv+xNX28cubN+l1s298cbxNW8hyiT1QveyQkZDSKubdzce272qPITj2TnKJgD8+xlb/ODJjYPYCldexfovjaQq2Vhy+sJwfohASGRJAA9s4FBuopskNYU1MvgFlgdBjOnJ2JAZAXDcy8Qy+dkRCP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cugXmxVX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BATaI5008001;
	Fri, 11 Jul 2025 13:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sg9El2RNDhGBvNMVt4G/+d/AimpEjyKy8uzIw7grPLU=; b=cugXmxVXzr9IEPJy
	IFjKhK3T6MM/gGkDQB+ShOVWX7Urx2b0zrIUewcpfgZcW1bbeafyXhw0G3OPN6V8
	7ghVCC+skeawTh4dFulo0AWG/aIQoAoRWZ+2fpvXRc/XPBCceyW7hzrxxz9VJPMG
	n/LY0kcBR2yCeem5kT8awGpg9DdZEw17q3ffweqgjcJupUBzovg94660aV5K4PUm
	25v13eAkOmw2lxyn/cpLDJwmThEXG2hic49hnDE83Txu5HHKsN5a1fsZqm9Jo7++
	QxBzeKZq+M9DvopV4QDb81SAv5NPLLpIsKUjxOWgbeWRJDS0X0/X7P/STzJOzyLa
	xh6sfA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8n27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDCghx001914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:42 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:36 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/7] media: qcom: camss: Add support for CSIPHY QCS8300
Date: Fri, 11 Jul 2025 18:41:33 +0530
Message-ID: <20250711131134.215382-7-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=68710dcb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=8aMUJFMWNzm9pSYggZkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ans5s06nRM3f5ylGIbmNoV-o5Dzae77y
X-Proofpoint-GUID: Ans5s06nRM3f5ylGIbmNoV-o5Dzae77y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfX2KGl249IbolR
 Tr6af7rrz2xnXhA6jfjWUEHCsU5v6gaIEVUxn/mvVCkUqtpRLd4yOoz7Eha05T7MwseEO4S7WA5
 817qyDfxaVZf8Opk2kpRARJhgBDonUYJY0nf+2g/OfL9wBx3QwfMMgkLS2Hdwu2k1vL560wJq2v
 DIIPqIePhTZ3tTOy1X31vhq5ydE6K2OI5JCPtz9G01EW1VayUVzgJCYaua/E76t4DbmYy5Qsf3X
 zcL3iajqdCSBAZ6/A2Gb4WbFoY8RkcohEomGrqQQig263VNY9j37Sa0vtjCI+cC1Xu+VgCVY1Uk
 2UutnpJS508GiFd6TEzaOJkYhEJ7g4ommBXvvKOwmcbscCQrEG1rSeam0/83Kmoq++uKkbqpV9p
 0bHYW2J6ujI0Byf15oOyPZqf3+4kl4jTrxFR+T9VpysuiiM+tHFrfoGFWQt3SyYezEoJBEgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110093

Add support for CSIPHY found on QCS8300.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +
 drivers/media/platform/qcom/camss/camss.c     | 57 +++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e8dbf9af6ccb..667a8cf349cb 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -826,6 +826,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
@@ -928,6 +929,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
 		regs->offset = 0x1000;
 		break;
+	case CAMSS_8300:
 	case CAMSS_8775P:
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index abfaa489cc0c..124bb56167cd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2491,6 +2491,63 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8300[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
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
+			.formats = &csiphy_formats_sdm845,
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
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
+			.formats = &csiphy_formats_sdm845,
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
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
+			.formats = &csiphy_formats_sdm845,
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8300[] = {
 	/* CSID0 */
 	{
-- 
2.25.1


