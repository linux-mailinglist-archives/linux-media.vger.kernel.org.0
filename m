Return-Path: <linux-media+bounces-31483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B9CAA5607
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 22:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71EB61BC172C
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 20:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A642D0261;
	Wed, 30 Apr 2025 20:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lTOU+ups"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A42C2AA6;
	Wed, 30 Apr 2025 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046040; cv=none; b=sN4cHuqCSOYCiCZkVX2KGFEOjYEUj0rdcJSR1DRrgerZwomrmdYwaK2yczj8Pwa0nlyjwtdpfYHFgUx3Lzz33hmfr+T3foIf+RGbnMxVHC718uAOYpygHShbcTN26LPgaEqfZWPcwmk472TcIu/qH5U1e0LyK37qPk3J9IQ/K5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046040; c=relaxed/simple;
	bh=4DzUzOKwy6DSSRfp+nnSfX/4PY/Jw+jHcXxpvS4r32Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J4aOrBoVLgY3k/ttUTc7E54QfjmiawGfZDxYlKvuZRS024AuvY8szeO4bNP8Lt04Tm9pnWgUYdw7fUUbzpBOAMwIbHcfZ/RRk09NA2XRBB4yyNU05jJBTQIc47yImJgRxMqJYyC0gEqCpdS6o6exwnCkFJ+NNnrGJPsAsPCgLQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lTOU+ups; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH3WIQ016768;
	Wed, 30 Apr 2025 20:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16oFqs7WbpeH5xaeg7evZDbakxDj9PDI8ujqe0iQovQ=; b=lTOU+upsz9tQkQt4
	O5uk7z5ahg5nlJUKyDmZ9vLaEGh5jBVdPJ5DRNFD7QESOmAoQaWhxg68nUO94pd1
	s7GtZdTSiGVMMO81l1m1wb5pkOfqm5syoNmt5ecWfAkrtoIf0H7iroNpzYTf4gRN
	qQBVNfBI3mPX3hZw+XAYfjpyc2fvWjO16UBQ6RZghORwqJFxSC5AF+PIWZEZBFTI
	p870+kJ1PTJRm7T4ZwoXs7ErDSKuQR3v/OCK+gJhoFbA3Y0TLS0c4sMVwkyrYxhX
	omQkGCrdGIRuPOHMxCmDnTJPhpUOi7pTZil8uGhuplvbvbRAX3vea/7nSOgFmpO1
	58/73Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uabhm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UKlFdK015233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 20:47:15 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Apr 2025 13:47:11 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 1 May 2025 02:16:48 +0530
Subject: [PATCH v7 2/5] media: iris: fix the order of compat strings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250501-qcs8300_iris-v7-2-b229d5347990@quicinc.com>
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
In-Reply-To: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746046022; l=1183;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=4DzUzOKwy6DSSRfp+nnSfX/4PY/Jw+jHcXxpvS4r32Y=;
 b=Qb84a8w8PxrQqaBgirvdlMdBlZozD4fOMKnk48szqSRLGemfbjBkaxu25zbRuQ3a9QkR2F535
 P4irEHBC5JHB8QZ5iLACVk7oMejQe+QfPpA4rlH1Fq5AMbsnJ+UnCI7
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68128c53 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=uyQifVC19GIw0kz6rKwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE1MSBTYWx0ZWRfXyiQeBaS+KyiW 4NPPMcDvDvSmTMyc7WCSdDwvrGNToUtcjThHFRpQ66nB8kefbxfA/Z9DcZuErgAZTv/7P66Hrhq z+O6WuUnmtzMrOY0KUnDcA/nA1hMwrCm4PU7rReYRVxMKlRGNb+hsiIaFhfaVgn2chG0olJIjSC
 QUA/E558AVx0eMKI8NfgnNj9eiwsiHtqHjxd0Kg5CN+mC+0OSp7tIHJjWwBmwpOz1SmOua9JXpK 7cbUqnFzRMdwh8LtCoiSba8kUrAxs0UKkyyXksjcswNTbvD1c7bUUgNNmAPwUjAgkOmGkqwoYxV ClhwOURv1l5CGXm2l8K2ixvpB6X4jCAI9ZsV2w8flEJPjM49/+JVAOZsIEPyp6cOZzG0kaYg6mh
 EzoOWGxd5S421GoVRXWbzFm1ZH82KTPXg0Yi4AVZVFDKBd6kLYyh4XbjjfnRM/CWmPg+NYvE
X-Proofpoint-GUID: 8K-qwZtO9viNc2hB4PFEnH09DqAn88G3
X-Proofpoint-ORIG-GUID: 8K-qwZtO9viNc2hB4PFEnH09DqAn88G3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300151

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


