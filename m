Return-Path: <linux-media+bounces-28032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8AA5C088
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 13:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0702B189D959
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 12:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CE6260A2A;
	Tue, 11 Mar 2025 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="es8V7vrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D3260397;
	Tue, 11 Mar 2025 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741694691; cv=none; b=LajFpvhV8jbhlRPO7ApNtmyA0Wfcp/KhjjUlh8gjT8QSb5+LqqP4gwnf7bpFeRRk9I6NrXWnpprvwVDTO6rTI/H54zh7UOyGBzve10XzNNKSPv4KsVu0XWme6OSqFbr1coaHnb7HpHHdrt3SVNBLfj7mlzCBVn4GWFSHSbbKDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741694691; c=relaxed/simple;
	bh=EUvBOPRBNMUzY5oXa8fdFGkO7p8sO7vMgeD833I44qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KiP6Rxk/HNEJq+pfz/5plfzjBJcko6FTl6VEZ+6oeCkNGSyPJlc/5s3tpGFGqm5XNSCHQ+WPKZg/bA9QEv2BKR2OeSR2Vf1EDLYZX8jHxhoe9o1FNUiOc4Jk3599cFTn6FaJDATq9hA5WasE3VgPjvNq0iWaTMIw6qSpRpDH7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=es8V7vrJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7lAeX001680;
	Tue, 11 Mar 2025 12:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvM6XBi8PzZIc190rqU5Cj7PO52ayu9ud9wWdcjq/JE=; b=es8V7vrJvJcgxCPd
	iA1WPlidzn5pfyTIAWNCPOfVk1HrVKx7SEHddNb0+Tmljb1bnjJeWbAkb9CyxVxn
	+x1xAQJEDY2YJQT+sQEwOpERoH4Kv4w/m8R7Lg6vzgexPh5jVxNU8cM+YTQWYXFB
	FfuPhc03luntZzyl8kYTz6ZggAL5d8/IwAP1EPFfMgmNYvS9LqZqGVwRQTSEY2yZ
	UjR0VR8/CsxS6SWg2b/g2IlzDp3tjx8RNV+qGhujexzJp3jvTTz40i2JRvEbgLAR
	xfP5Qcg/Jo6ZKqeGFbZ0F4QNoRj7OQ3zq+XvM4ypH10AFwqNugK/IpcmXEwGLKZP
	AiJXvw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk8ehp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BC4jUR028742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:45 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Mar 2025 05:04:42 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 11 Mar 2025 17:33:56 +0530
Subject: [PATCH 4/4] media: iris: add compatible string for sa8775p
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250311-dtbinding-v1-4-5c807d33f7ae@quicinc.com>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
In-Reply-To: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741694666; l=880;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=EUvBOPRBNMUzY5oXa8fdFGkO7p8sO7vMgeD833I44qo=;
 b=AuqVntTv/pJ1XpXbHnq2VCcFFjSFzp8YQGReqnpVtu603tLA+mBUU0m5KqcEqk6JmYJ08Iah8
 l8ibVCMzOI8CLTyOGxNZT/zlhKFSuNvujArmnhgdLttFCBz8QIopCOy
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67d026de cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=hFD4c8h0E7I3NbZ52p0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aHYC8eVWuiY_UtKzKoxIeA4tamtbLSl8
X-Proofpoint-ORIG-GUID: aHYC8eVWuiY_UtKzKoxIeA4tamtbLSl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110078

Add required compatible string to enable video hardware
acceleration on sa8775p.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index aca442dcc153830e6252d1dca87afb38c0b9eb8f..23c9e76a68013399b0fc1d68c1ccf0f8b0ddb037 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -324,6 +324,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
 	},
+	{
+		.compatible = "qcom,sa8775p-iris",
+		.data = &sm8550_data,
+	},
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 		{
 			.compatible = "qcom,sm8250-venus",

-- 
2.34.1


