Return-Path: <linux-media+bounces-26201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D928A37BCC
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 08:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A396A3A9BFA
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 07:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C2D192B81;
	Mon, 17 Feb 2025 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QMmXlOX5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5FA4C70;
	Mon, 17 Feb 2025 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739775888; cv=none; b=IqzSsSTSZ6rIT26sJdJOFn35GYmgwZeztSw/pcubXG1N4e/evQ5vE2+P3HCHBqknABgSTf2617qi1wW8HY1MlkblGnYlu00NwnnCUMQp/bOB2ddEBHzhAY5DTbFq6MR9vPiahfkbmmQemy38+xl0n6ZckEyyEPEQAj8a6iMAjWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739775888; c=relaxed/simple;
	bh=sdqm44NCO/TQfCUSYdeoJj4Ud8/Ae9XnTTeWWL+1ZGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=OR/D1M8z2Ni/mKuAfu1TCfWwCLkhSwJVXN7syjVjLErddTWAwA+6nH7/Y7J1QrRT3M7au97VBATQ389rm3JsAKsaeN+9DuQVHzaFn8cgvfYslTxejuY4TzodaLjaAwv7KOIqnyJWSwlKQcU0L9G/58ANii2eWqb0nXsQbjKJ3vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QMmXlOX5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03L04027466;
	Mon, 17 Feb 2025 07:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AggSp4TbP3rCwOgWF0wKlH
	4lHqyJ2q7ZyfHnyM0mO2A=; b=QMmXlOX55XqhlaNadQdZBZPYBMUemE0D99IwfN
	lRrFZMKcw/To1bEk13DTVDQzJUG8fVuZUbjsqOviF6soNaS2QRGj9FQ0t0hvvRvN
	9vFyFea9h9Eo5f35LA0/cIKCfc3fvUbJxYe4F55fmjgr9leLCHokoWlkRy5yaYDX
	PSRjoIuuC7/uUXlMt7dTM1SVCqP2FgX1U0/co06LKlHC6568V7X8HJw9wKBZNeLJ
	u+k0EsAtcP6fXpbMU0ffvh3+zbnRg6o3L/lar4b3VacMcrVbdm7Oh+e59Jts9j+Q
	ws3f3B6M/Aev8Tgo8P1U8eg+wkSfatT747xT5KIN+r8QvcJQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sgsgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 07:04:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H74ecv019287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 07:04:40 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 16 Feb 2025 23:04:38 -0800
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Mon, 17 Feb 2025 15:03:40 +0800
Subject: [PATCH] media: qcom: camss: tpg: Add tpg support for qcs8300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFLfsmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nz3cLkYgtjA4P4koJ0XSOD5BTDlCQz02RjcyWgjoKi1LTMCrBp0bG
 1tQAStfb+XQAAAA==
X-Change-ID: 20250217-qcs8300_tpg-20cd1db65c37
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739775878; l=3789;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=sdqm44NCO/TQfCUSYdeoJj4Ud8/Ae9XnTTeWWL+1ZGA=;
 b=iSWSKv6tznFPk2rd3FfzlbiFFk/cKNLmJCKZNCfl2WqE8EiqzTEPHt+PsgJKdc1uvf2O5aSWg
 rgaThGCsEitANkTZDbfHAeuvG/0Qr1tbAQguCgFA5UbTnPFUBaZR5Qf
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KFSViyUtd-gnxFsl2mh2KAmv9uLK1Vk5
X-Proofpoint-ORIG-GUID: KFSViyUtd-gnxFsl2mh2KAmv9uLK1Vk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=720 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170059

Add support for TPG found on QCS8300 (Titan 690).

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
QCS8300 is a Qualcomm SoC. This series adds driver changes to
bring up TPG in QCS8300.

Tested with following commands:
- media-ctl --reset
- v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=0
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
  --capture=7

Used following tools for the sanity check of these changes.

- make -j32 W=1
- ./scripts/checkpatch.pl
---
This patch series depends on patch series:
- https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com/
- https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-1-3f76c5f8431f@quicinc.com/
---
Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss.c | 52 ++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 63dc8222bda7ae957041fe4124a6b5194dfe0ce2..39442e2e36c31b58ba529ffdeab11a9bcc57178c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2320,6 +2320,53 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_8300[] = {
+	/* TPG0 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx" },
+		.clock_rate = { { 400000000 } },
+		.reg = { "tpg0" },
+		.interrupt = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG1 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx" },
+		.clock_rate = { { 400000000 } },
+		.reg = { "tpg1" },
+		.interrupt = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG2 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx" },
+		.clock_rate = { { 400000000 } },
+		.reg = { "tpg2" },
+		.interrupt = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8300[] = {
 	/* CSID0 */
 	{
@@ -3986,7 +4033,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
-	if (camss->res->version == CAMSS_8775P) {
+	if (camss->res->version == CAMSS_8775P ||
+	    camss->res->version == CAMSS_8300) {
 		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
 					  sizeof(*camss->tpg), GFP_KERNEL);
 		if (!camss->tpg)
@@ -4171,11 +4219,13 @@ static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8300,
+	.tpg_res = tpg_res_8300,
 	.csid_res = csid_res_8300,
 	.csid_wrapper_res = &csid_wrapper_res_qcs8300,
 	.vfe_res = vfe_res_8300,
 	.icc_res = icc_res_qcs8300,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.tpg_num = ARRAY_SIZE(tpg_res_8300),
 	.csid_num = ARRAY_SIZE(csid_res_8300),
 	.vfe_num = ARRAY_SIZE(vfe_res_8300),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),

---
base-commit: 4b67fdfa7ee9fad4ec451ac0670dd8ee8df6345d
change-id: 20250217-qcs8300_tpg-20cd1db65c37

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


