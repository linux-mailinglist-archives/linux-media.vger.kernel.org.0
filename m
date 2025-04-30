Return-Path: <linux-media+bounces-31451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A102AA4AE7
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE499815AB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5554125B661;
	Wed, 30 Apr 2025 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TrhL8ciP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBEA25A33A;
	Wed, 30 Apr 2025 12:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015460; cv=none; b=EiQV7aaOx+XiwwWfY0iMIKCVIPVRjSFSNlUbKu+UkYG+sglBAXjRHoob8ENnngMYKL6m5DlzAbWafZLIJfazbnTvKuFElL2Ysradxv8bWowr1Mi4Mof6Vm/g9CuB8RVBqPMK6xssPys/9yCf9wvQddANBnQHa1WGUjQBp8LBkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015460; c=relaxed/simple;
	bh=4DzUzOKwy6DSSRfp+nnSfX/4PY/Jw+jHcXxpvS4r32Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UfiAdDJOwZeGNmb3sL1hV6n83yCcWbrklHmIu1WrbCyBpZ5uvOvDpSjxrIHkyZzVeOx9r8w9tyipfXP7GaF+6n+8JjeEpgkd4p/5EGCd9wH7YlLAl20OaTnW7UcbMJYdNWQt0G8IAXMkOPDMrQwuV+zKFnfmW0Ex+NA/pY2tnoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TrhL8ciP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Kj0V013711;
	Wed, 30 Apr 2025 12:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16oFqs7WbpeH5xaeg7evZDbakxDj9PDI8ujqe0iQovQ=; b=TrhL8ciPqtfJkrf/
	CUSAcf5uuDsyDg+zykx0IKsxSu8FWmv4ZeGhFtKm47JcZJ4fplsZpuCVvPf8elWv
	pSW1lKEqMPD0iNBk2lC0y3UwGXBWuLTll2BX8IF+PiPGn8t7RFTEzcWzRF5NzVTN
	pTqKrNDKF7lGJke/WOoN1Q6sYM4aYww9TcBWnb5nRgNifdSxsU7UQeprAih+GkJ2
	soUW9uGjSe3qks+JsGdYNosVCmLTF8gsLa7ErOZ1C7z/n3NkJt9IQNG9LtzsZy54
	xg2e2JLRoURLF+BeeVytQv/s755s2c8SKupM733sjoAqHEjfJnPuxA7CQyBEHEie
	tw1ddA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubj442-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UCHYcC024751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 12:17:34 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 05:17:30 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Wed, 30 Apr 2025 17:47:08 +0530
Subject: [PATCH v6 2/5] media: iris: fix the order of compat strings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-qcs8300_iris-v6-2-a2fa43688722@quicinc.com>
References: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
In-Reply-To: <20250430-qcs8300_iris-v6-0-a2fa43688722@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746015441; l=1183;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=4DzUzOKwy6DSSRfp+nnSfX/4PY/Jw+jHcXxpvS4r32Y=;
 b=LHqe+syrKPLy9KcaWXcvuonbBhCtEapWpmAkdx/rzWIxh6+raXOLz3B9Cfjh4mIm7OcIFeojp
 ajgZ3KfjT46BN1smOMhlRsHfToj52V9wog+6APkCLPjVCkW76l2lIOv
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l2fpAvMMbYEo6cjEXvfAS3HS1I76dHnM
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=681214df cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=uyQifVC19GIw0kz6rKwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NyBTYWx0ZWRfX/bY5/eiDAQmS hY0Dfnf5o6ejOKcUtczewnDD9rvy2kLLheTZc0QaqQqyXbTnfIOBqRDaPTPIr5+Zyq4MYKcvyzN cH0cioz3A/ZVjUornkIFMfYVaHSQZ7cFq4aRrU6rJNMV2iMKPzF8SY8JV2bJ9OF/iQY7/6y2fJK
 FK2ofvBtp8DRRuH0PpsQnoCZrsuQeSphB1YGGa0wa5x47JL9sf3L059NmRsYxlpBncgVVt/kL6D MDd0QGrJEZ9UjYKSonr75T87Yd1yicp+nPzx1B2SOyVjDspXNbHjKVdklg5XIDTIPLPVUn6w6V5 V0znL8KbqDmfR+hJQ3YpWrie/Mdxg9oK4jeG0GZRL788GHBgYN4U6JUoq1kGl4IiN17/ab00c7r
 GDNntxcQbDqAcjtIX7UGKtLrq/otf+bihSF32EeYkb1emq7XhBB2w3GGAlLpbmgAkj41dbzu
X-Proofpoint-ORIG-GUID: l2fpAvMMbYEo6cjEXvfAS3HS1I76dHnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300087

Fix the order of compatible strings to make it in alpha numeric order.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 7cd8650fbe9c09598670530103e3d5edf32953e7..fa3b9c9b1493e4165f8c6d9c1cc0b76d3dfa9b7b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -335,16 +335,16 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
+	{
+		.compatible = "qcom,sm8250-venus",
+		.data = &sm8250_data,
+	},
+#endif
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
 	},
-#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
-		{
-			.compatible = "qcom,sm8250-venus",
-			.data = &sm8250_data,
-		},
-#endif
 	{
 		.compatible = "qcom,sm8650-iris",
 		.data = &sm8650_data,

-- 
2.34.1


