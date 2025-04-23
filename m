Return-Path: <linux-media+bounces-30873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ED4A9989F
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 878244A1FDD
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC5E296D2A;
	Wed, 23 Apr 2025 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q+b7naO3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4E5293469;
	Wed, 23 Apr 2025 19:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436867; cv=none; b=SALRyJvIQu6//9v7YIf/xEaslkdJsyPx6+uYUrX9tF9usmrFLAVRwBU9J2O68pk51ZU2sq1YtGike78qY0qLnmJjVU2n1re/7W7F5+58R7NLMgaP4PDYL+hi2BEvkw2lBJt26NXsLL9O6gAPaEDkVmj+9NmxiaW+kFZEQeAt3Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436867; c=relaxed/simple;
	bh=17FHpN7OPLpSTxhSQ3ax9kT0w7kb6PuiXwGLVtxjFiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MF1PGyMWbCfB0u8BW3JQFMhI+1lPaTD5cET4gEHtQ1oihDyQBYCPwSthAkYn0LvmBBANMwv74281X28BWApxcdRsKZPElWV1ipdtTJVOWbFmyRqg6xf/5qSsYrsAzsL2vz4oUHN16FCTYJJ+EVr1A/Wgu3ZhAoL/uYismVlYWio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q+b7naO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApUVW014055;
	Wed, 23 Apr 2025 19:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHM1+ecweGIUaxejqjdHohSzi4ggVpGgb90+CFG/GNw=; b=Q+b7naO3QNhTaBDy
	k9scdr52sjdfjFfd3gzmsaFbT1jCFMu32Is2LkTe0lxEucqmB/yiI7qtOFs4upA1
	YpN0lVD57Zbr5P3js9AUv/dBfHQFz4D9r6onJkQWCYe/4Bk1H4ligtZTepS8NRqy
	PBlFOpHaao4qSI5DnF5SCQcL7hei2aCI7cUOC7c0VQla/bM2crOb+efWkYrlqAjK
	GmBCoeJ3Tqfw/vOhmtK/+bcUWWkUk+ug+5YpS+6B5qJijQ6gOJonRXQFI831ZUjU
	oxreQ1p7CYhuQZSWCGP8lkT6CxAHCxwOYZGw1Xmgy4/CKpQ3poI34k3jaSGn5z0n
	ZuNe2w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3b6he-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:34:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NJXsmt012930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:33:54 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 12:33:50 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 01:03:32 +0530
Subject: [PATCH v4 2/5] media: iris: fix the order of compat strings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v4-2-6e66ed4f6b71@quicinc.com>
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
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
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745436821; l=1123;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=17FHpN7OPLpSTxhSQ3ax9kT0w7kb6PuiXwGLVtxjFiM=;
 b=7M8iX4PGZe2vJmlTNkmCPT+r1hAaALj5p1QTCLj82x3SJiu+LGgBG2SEneYag4r2CmX1EpJQY
 3YbaOATXnwtB8c2IDo1FH2Cw4iEwv/upfT2Q+ZUpE8WoDtsDMO+yNrx
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEzNSBTYWx0ZWRfX0IDepBKhTLmu hiqD3KVE6r8dmjNtTZxPBVxMm9hhFt5VW8rmEdkYz82H3TETPJLyN8192k0gzZQ3Di3eEnI/3Ur OUSShnayJ7Fz8Fa/qF9QTutz7IkYfboe7flwQPLEk1Qhbf1QWZOUkB5W9nLZnj9h5s77RUraaUt
 RKsMIpIlsX7bDwRPhxKYRZ96jZfyM9BLV9+dggA2Apxn7JCUJzam8h/yw9wpICXxCVfGN8oEXjr sN2LMXqC3s/5of6Tbvw68jkY6nucIcBJB0QL8DeIsVb8e+41GPnuRQa9hRYZW048akE7sCPsc2L cscgACmElZi4qvCe9Xp7t4E9tlOi7TZJFUYUJIVnPt7I4JseL6dM4pVnkKkICDKOxafvLV7MwvG
 kG3PgQaPmLnqtW1mDRcCpHqhfAnWxhWLDn0bVX8+tkv/joe8uYjbIojhHZsp7XGbB4YiwScd
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680940bf cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=d5lHoUSSCM4tM_bkGUsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mGUYiM-W_9V2bIYdn1eCO-jenb58LU0r
X-Proofpoint-GUID: mGUYiM-W_9V2bIYdn1eCO-jenb58LU0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230135

Fix the order of compatible strings to make it in alpha numeric order.

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


