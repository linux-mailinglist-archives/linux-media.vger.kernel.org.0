Return-Path: <linux-media+bounces-37933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB35B083B0
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5A3F1AA37BA
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 04:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684802010EE;
	Thu, 17 Jul 2025 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c3yQibEB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234910E3;
	Thu, 17 Jul 2025 04:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752725919; cv=none; b=kR9/pgbMrTdZeahJgt3oUODOv7NDZ/Ztj3lnvcUJKY/RDMKlfXIrylgDSw8iK+Dp+18a7GoVXzSqYDIpIoCnmaeusVwoweBYmo2UyvdWnGA+FHIGLSaeKRR/NQxwgBY9eiUYu80xquEM+eg5oqnkeoKa+hHuRzffNm5apbIymxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752725919; c=relaxed/simple;
	bh=Fo4mFAhDLcwIZ2pO9ndfoh9vqg1njXyVZjqEXZ0roi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=mvy1IgJHQBZYosAFmTwCosDkwwgEtaICCjc3rQdyVYgEOsiExX2/saJbwZBvZCpBgR4HW7edVDmf6fIC8zeh57srOnisf9Nam/o4ZddDGvJ8/SNSlVfzxdFhssvX/920n94S/vmEQjzi/2sg3ZsMVM5Q4JSfq6j3QhKYdIlE00g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c3yQibEB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H3uRZo000598;
	Thu, 17 Jul 2025 04:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hYSdIOjaB+pyKQFB/LTUM2
	tBu9eePHb0Zy4vXY/kupM=; b=c3yQibEBrALNO1DMYISSHE9nS3tgZY2injSZbb
	Su1h6U2rsPVU+G5FrAdisjce2GVDxSvvwcJK9hzoJrNW4cIDSSu7Yc/i6OPYuh+2
	VXzZ/pYCH790Ib60N0/tPPg+N6VUTig1Y8r0IJR0W46RSfkI0TnYzh46aBvtgbrE
	DGYA7x0vMIQh+74E7pxNUCBgLx7yM7TkRUMHmL7uE4hkTiXgN4P1GIKvQf/K8omE
	PrzpyZI6v4Ddi55244+sJYsF5Njb6HO94R/mJcjwBNG7GSTaTqTSXmTpQt1ugrdy
	xYAuWvSNcCo2poFeJQJ9DJk1MJkPP6SX4grQtRfIiw2akVUQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drs8ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 04:18:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H4IWNT010396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 04:18:32 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 21:18:30 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Date: Thu, 17 Jul 2025 12:18:18 +0800
Subject: [PATCH v2] media: qcom: camss: tpg: Add tpg support for qcs8300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250717-qcs8300_tpg-v2-1-0946c69c2c8b@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIp5eGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nz3cLkYgtjA4P4koJ03TRzc2PTVEtLC2NDAyWgjoKi1LTMCrBp0bG
 1tQBohbuVXQAAAA==
X-Change-ID: 20250717-qcs8300_tpg-f7735e998310
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752725909; l=3684;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=Fo4mFAhDLcwIZ2pO9ndfoh9vqg1njXyVZjqEXZ0roi4=;
 b=i3vwyg2fSpNGdDbiMihPUYEnpjydrs+eyWc46tz8Gifr+k1Ga7t8GNr6xueZyqzHGthwb3WMd
 2MdOh4yrbazBjXKxjpkElvQmOh2mBoKEaUhGdJzjq7r1ogPzwCebHMk
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BqvvxgB__gw35BpUZivMKoHZLgtaNx2B
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68787999 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=x-1_j7_4LkbRn8_73tIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BqvvxgB__gw35BpUZivMKoHZLgtaNx2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAzNSBTYWx0ZWRfX7nnkNJpr19cl
 dEVinODtXTE85r5cYYUHtckGHyZfQ/cTqSURhWcB+TkNnrk51Ap9mjDGdi02Yo/hFCXC8PT1a66
 Ly1rukrgMZGY9H2ZbNQC+QLf62pIqI/VLQYrCP/0CFXwKWAjQUq4ROVIqEFrA7nOMYFiC3Pilpt
 2gg7DZTtY15sqRTctMcHqDam3DcQh5eKaKjqim1/vl8xOmkDBY9rlcI9jYPnlC6jfsFy/310jRS
 QrQPcxuJyy2r2M1azpUEvKmQrUF/Olfk5vIRiw9bqGOJB26sMcdHDW7bHsfKUoNXx4Gk08V9FlY
 gIDSR3tCDlOqXsI+CCitCTCbXTQdmi8fp1jypl2fvM60VJbF/1DmM6qaFMvb0d5aGYokl4OrDyq
 guMARw8W13vjFOEHpXjtDTZaGepTUQ9ZX+PtBrw6pMCcZ2bWd5Oh+aMbjRuBNaU80svVk5/M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=891 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170035

Add support for TPG found on QCS8300.

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
- v4l2-ctl -d /dev/v4l-subdev3 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
  --capture=7

Dependencies:
https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in v2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to v1: https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quicinc.com/
---
 drivers/media/platform/qcom/camss/camss.c | 52 ++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ced31e3655a52a7b2e55b109085cf24a9e230f1d..68411e4a5c55b394145ba907f18cb03e235dcc23 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2548,6 +2548,53 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
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
@@ -4492,7 +4539,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
-	if (camss->res->version == CAMSS_8775P) {
+	if (camss->res->version == CAMSS_8775P ||
+	    camss->res->version == CAMSS_8300) {
 		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
 					  sizeof(*camss->tpg), GFP_KERNEL);
 		if (!camss->tpg)
@@ -4677,11 +4725,13 @@ static const struct camss_resources qcs8300_resources = {
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
base-commit: dc3d6ecbfebec02791feea0b08062540badcb5a2
change-id: 20250717-qcs8300_tpg-f7735e998310

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


