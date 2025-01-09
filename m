Return-Path: <linux-media+bounces-24507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9392A074A3
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A79893A4170
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62DA217648;
	Thu,  9 Jan 2025 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BpIf02PJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD968216E14;
	Thu,  9 Jan 2025 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736422028; cv=none; b=kuc7jK5EfN4c0dT5KkPlZ7wj+TBo17HpWCjRkR+9dSijnMS+8tjEZxdrjBuJizMNZhJqPffVDOiKKU0c8bD1lpTkbRiP+xVmemN6IJgM798RhBbhR/FxTlUo+S/zDRGkIPUi/H5MxIaXAKFgUJ3Lapif/C24iJkkD3OP/tZvQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736422028; c=relaxed/simple;
	bh=KfZnTsYf++Tw3KH8sSN1u9YI64nmS65rpNXfy2Yzatc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tXjQ7U9VQjM7L0cxWMyo9WRoRsxB/E1qcnRNK31CLMwduX9KF5OL65n6PYvzi3oQOOAY84VCCSY0vnyBu3DY24siKCXGco5TYNO0UqBFXPTERPkFLWsEnA7sC/P7IzS6OHyfH2VFrJyj21g0cq06wusR8KC6eemCvWCNI9z9FFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BpIf02PJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50959r9O028499;
	Thu, 9 Jan 2025 11:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YH09llIS0fPfpDg38K3PhnQP4gq2Fr285IRdOO8cEk=; b=BpIf02PJcbv9l5jV
	JmQsFnKKrOswdJvV88tIOXrbYdNVnOO2YucpUkz+GI51vnIIAHdn4ISveTOdEKVt
	GYIL99j0YBlKFKfZktIQzeT3ACCfeYknfmXIZOKX8gxzX+RAxC3bjwS8h9Cu1Cq0
	TvFyRI/wSbk3c8Wm6+SMOFdabAgtgiSzfykLw3jqp52/3l7ZWAkrrJsSImrIrz3B
	RbnwF1FtKNvvMHWCx6kiklW2DQmEqpSrZshXxLBhVWQyOS2rfiVxWeeiTCWp10FG
	spVVk6xxnjh3NUVPnwzbGSUkQ16D+yibTDRXGPOd3B+uIqb8dhlR/hXu8JfPNepN
	g+I3Lw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44282prvjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:26:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509BQtKv022149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 11:26:55 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 03:26:51 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Thu, 9 Jan 2025 16:56:40 +0530
Subject: [PATCH 1/2] media: iris: represent dma_mask in more readable form
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-iris-driver-fixes-v1-1-789a0f5dd7ee@quicinc.com>
References: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
In-Reply-To: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>, Joel Stanley <joel@jms.id.au>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736422008; l=1817;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=KfZnTsYf++Tw3KH8sSN1u9YI64nmS65rpNXfy2Yzatc=;
 b=Bwz7iQde7/WRc9VAB537a8XiIZIgRGXtaLo+k8YJ9vGQgHkSl0mmoTwT+Rt7CJdPfB/Qgq0t6
 oor+cT90P11BonP7cW0sXEk1FheVYfTFGsljzjDJMtN7Ev07krNzqWN
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0rt5elMw_DeLbtBGqoHZvZoRO0WLp3bY
X-Proofpoint-GUID: 0rt5elMw_DeLbtBGqoHZvZoRO0WLp3bY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=732
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090091

Update the value of dma mask from GENMASK(31, 29) - 1 to 0xe0000000-1 to
make it easier to understand and keep it consistent.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c | 3 ++-
 drivers/media/platform/qcom/iris/iris_platform_sm8550.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 9ef2fcc1a0fd..b14b1c5d632c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -125,7 +125,8 @@ struct iris_platform_data sm8250_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
 	.clk_tbl = sm8250_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
-	.dma_mask = GENMASK(31, 29) - 1,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu-1.0/venus.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_sm8250,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
index ad945489126e..35d278996c43 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
@@ -232,7 +232,8 @@ struct iris_platform_data sm8550_data = {
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
 	.clk_tbl = sm8550_clk_table,
 	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
-	.dma_mask = GENMASK(31, 29) - 1,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_sm8550,

-- 
2.34.1


