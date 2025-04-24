Return-Path: <linux-media+bounces-30914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365AA9A6FA
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0543B3A40D8
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 08:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D743F2253B7;
	Thu, 24 Apr 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jram3bqC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1664221FDE;
	Thu, 24 Apr 2025 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484676; cv=none; b=gVkylAzYi6ToxB8qdbukTUcuA00E2e8RFZZdDurbwGVXMwOVIU5Y2v0vENZsemr8ptTXFsFSwFFVNEZyslA4PVoFQW2mNyb7/U4mCsunjopv9a6wreKnulwVReoY17TdbDJpi5lluQgVHcQ7ZGtyo9rUbk0mHn2WHPGjFHBcezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484676; c=relaxed/simple;
	bh=4DzUzOKwy6DSSRfp+nnSfX/4PY/Jw+jHcXxpvS4r32Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RwEwbGNvIf4pLqR7qfl9aY9QziqJNTNSTf9DeeaAc2dSO4OYbb3vbaiec2FmQVvxgZGps98tQVUrNgVHWvBAHeak4FelQuiiZ39Smp6U8qhe1qpt7GL/r/M1mnBrAMeVIOS8KGyivVljlCu2ro4N5Fb3WAFfFe9KrJKdcvdKGlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jram3bqC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F780013259;
	Thu, 24 Apr 2025 08:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	16oFqs7WbpeH5xaeg7evZDbakxDj9PDI8ujqe0iQovQ=; b=jram3bqCxQv80Rod
	BCHpuGw+L1tEzDWWHJibtEP/13iiRNOju1mWOBWivHAdlR1PtJ5DpqONfWK1yBgN
	1GeTBjWCllCCi6IW9LHVIatxEv/mVce3ZO/msHfTj+4h7bFGkK2rqkP7p4Ebm49P
	u87mqjeiSYMprkd1HQyafhGA4fKe8otp8wcDf73EPF7sKVorn0jNI6xFhX1bHsIT
	+bhSnsI7phGykLKXLEWJQ/YhLUa1V5SqQNlcCQb2gSL3V8sLYD6Nj4/u3Ic7ROV9
	eOV2dBiG0bo1EmTO0dTFcQm/4Hjg2kZtrl9UpSwACTsuXgQjJaiPEyg5d/6SoXMF
	0qzYjA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2cuyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O8p8xG022457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 08:51:08 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 01:51:04 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 24 Apr 2025 14:20:46 +0530
Subject: [PATCH v5 2/5] media: iris: fix the order of compat strings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs8300_iris-v5-2-f118f505c300@quicinc.com>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
In-Reply-To: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745484655; l=1183;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=4DzUzOKwy6DSSRfp+nnSfX/4PY/Jw+jHcXxpvS4r32Y=;
 b=z2wVtEx1SFtXagFQScPC2Khh63SGlYfOPLOffluBSUtq7mOAl+NcPeqdoroGb6t5pisHXYtAy
 1MBafEkyZBrCaXrqWKP5NvLZIb7i8ZXlSeSeM9TR7avIHGym9f/y4C1
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LjfDlbgjerV9Dk_nsvgmvMDxC0fXkPs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA1OCBTYWx0ZWRfX4YoQrFPr1vlD 9iGuSjO5safO002QqIlwb80Zrif2qbaD1v+xr3KaTZY6GZeZ6jAgNPzWg7AlXwagpncLuoSRnJX CNu3vCIQweQVtvaSMoYy7I9pBCRJ+AEmsHPKxEfcFscWP741RflJIdlADvpsT8JRpVsjMgdx4AK
 lavLvX8Yta03WX9CDm7KH5gqGMNh09pydDZVUIfsR1eZGRdHY9SLDn4LZC057wKcy1X9Wy/I8V8 xJN/kI6OzF8PTvV6RJpXU9L2hf/SwxSmrs5XTGbzaim1be5+sb5vLVF4H1JTFOWIWTWbf1DSf2d PLXEvQLdJkDZ/jF0cuOy0fAZXvhIGw7LJd3crDbFIZat5gbsxuEusW+mVFfiKJJ4S69aKqj6BFX
 6tYqQGJx849pqOsHTsMYcMwLFVomog7bNjDb9megCwgyvg4tHrEJruRa7dlCzbbKEtD/CjeY
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6809fb7c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=uyQifVC19GIw0kz6rKwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LjfDlbgjerV9Dk_nsvgmvMDxC0fXkPs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240058

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


