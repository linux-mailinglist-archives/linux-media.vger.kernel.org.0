Return-Path: <linux-media+bounces-39721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A24B2405B
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1481B672C1
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 05:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975B92C15A8;
	Wed, 13 Aug 2025 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I6PbC1Td"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3042C158C;
	Wed, 13 Aug 2025 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063510; cv=none; b=Zkd7zYIFLXnRTlyERugLwVEaDtHPPYY863C2ZLm9mRpLVuDIn94SS0ol6lg5hfI5CgIOtd8J/IaGc57WQojftaBEB/h9lz7g8qHocv3oA5mYGd2ZDtqmns1WuuNz2GAssoHI5E70kwFhWEpv8Nhhq0qewoGyCkIqBafwh+cpnsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063510; c=relaxed/simple;
	bh=8zglB4zaHDYCq6xkeIEmBxjlBZqgkgXfkxnbWWFsL+M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aeftqfDJycFtYSW8oblVLv4+3fWwz8n3SC+F6EAA8NRQ6vOT+szKIBeEzX8D9M4HgtlFQVfV0ZbXY06G24PZcbT/GcSFyzyfH3WizeuPCgWZhZ2NRS9NT8Qa86oXVrh65xqwtsFAq1jPSdaklBDf2ECawKhDvJgW/BBfXiCdMkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I6PbC1Td; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nmZu007454;
	Wed, 13 Aug 2025 05:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjuuFFpyLJ1wFfdT+fLqsc7pa7FB/gXxs1NbqY3SvTI=; b=I6PbC1Td4ZgMMwqK
	+U+Wb86RTEexFn0VjEwlTmoi9Gyv9ymHmf8M5A/nARetIrfNMu+Fuli28gcEbwRx
	JOUPjd1TBUrkeIGfHTCt7Ac61Nq5AbHoyovMPJl81OMSTdeOUv32cdvpxE3S9kd6
	8TPcXwOpMEoNddwlVBGXQ4BTElvB6QUgow/OqUvKzgLfcUnBlDJwp+OkRZMJQ+wC
	pgo4cF+6VHJqGe3VRSojJKsFs7Iccti+0Lbfy5GNqHkJ6gsKWWr/UyCSIqNcl/tD
	9vFiBZSaGi7TNizXHm5EknddR1VEITfKyK9E4ZihW1s24BtlU4CJw3gvbtftfTTW
	IhzN1A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9smwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5cIHK025550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:18 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:38:13 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/7] media: qcom: camss: Add CSIPHY support for QCS8300
Date: Wed, 13 Aug 2025 11:07:20 +0530
Message-ID: <20250813053724.232494-4-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c24ca cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=8aMUJFMWNzm9pSYggZkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GZf9XGaxaySnxcrFt_8Nb0kbWhtVhzB_
X-Proofpoint-ORIG-GUID: GZf9XGaxaySnxcrFt_8Nb0kbWhtVhzB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfXyLU8Form+oBA
 bjpdnbyiP3wA4MLwunx8NoDg/G73ZsCJ5q6irixhxT0oyjVr5r+Q1JL9ZBmlCNYT5IX5ozt5TVK
 lsZzf42huYf6HC7cL+2RopASGZCx3G8fwuOWGfBoBGDLEAbxHl6NA11jrrBxyPYvVgEz8Sn7fsJ
 7kfZ6oJmAhfZ7BmlTm91BNGiXJXsrrwgVJtcOx49IlCin9op9CAv7rCe8uUKRFvz8LLf1At9eyR
 zuR9vMrrIV5Qe5GLK0TOJeMUG/nnGI3F6o/jyBDFCf8R4cikp/7lGTG4hqEHVB9te0L2a+njKMP
 RLhWhlV6AaQ8AhdXVIOAfIpU6xRDc+StY9ev8vt4Qxi+rKlqPcbFrzQfJ+tFhYlHZj2V0FmArr/
 TQqaTCYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

QCS8300 uses the same CSIPHY hardware version (v1.3.0) as
SA8775P. The only difference between the two platforms is
the number of CSIPHY instances: SA8775P has four, while
QCS8300 has three.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +
 drivers/media/platform/qcom/camss/camss.c     | 57 +++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a610504359d0..445f4d41e847 100644
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
index 6b9aba1029b5..410e188d26aa 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2483,6 +2483,63 @@ static const struct resources_icc icc_res_sm8550[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8300[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
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
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
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
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
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
 static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	/* CSIPHY0 */
 	{
-- 
2.25.1


