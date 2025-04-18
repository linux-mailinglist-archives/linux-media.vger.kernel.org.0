Return-Path: <linux-media+bounces-30510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9DCA931EE
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152BC8E2434
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 06:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E2C2690D0;
	Fri, 18 Apr 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CbuE3nSk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744BC268FC9;
	Fri, 18 Apr 2025 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744957746; cv=none; b=MsTbkkguPc77s4+WTllQoqB5LnwUIEP9Y2RdF+NBdOt4p5JKKA67mHGt667UyYRv7wlpARroqgx0TVO5I6lce6BXdNxXF2kum0yyqdwnfpZL9Mbhktg9qKGWUX3fJJbtBuA5nzng9hody2Mal88dLEtq4f4Wdjpnh//Cxy+ea50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744957746; c=relaxed/simple;
	bh=eKVrl6rJnd0g6KWuwOvnZ7F27JN9U3wGDnrj1cjxhFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jUQOK7SqEHZ09X+pE9qAbaiJ31zJ/eO3vdHDiveVwU7qXVpfIKs1AILgWvblkfpxRNWImAUCz9b2D9WE/Mmt0UafKps2VK3JMF7KzYtfGyk3xB76A935YPfA9g6V+0oWmo0U89N1KoW9hsmcqaxlNLnzXQUbkNIwFV14gE+cELY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CbuE3nSk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2h1P5015566;
	Fri, 18 Apr 2025 06:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Foz5ZZ9HdVrfyiX706MDP/Fuwupk+OIxXs/bI2mUhzc=; b=CbuE3nSkncalRxWd
	7Hd+yg0lccqqBT0grCl1BaVtS7FKOqe6roMORRic1C3N2H7zN8/Fk6jS58axivJh
	oxo54TH94qjSQzSGxS9zoh0i6Dt9WSQRSYkHTluyMXoi5WoM8FGfvYtwvnr33X+q
	cCMMV7bVGhPjq/HKPJeM42YRr24mGoeONOshuAQX30fJzsew0+jLK5Ae2J4qhMXf
	0z6aqIz+64Ed9HxXhgVKDj6dpeGc4jRpjvUbUtyBJXP6lNINmOeqRF8Q5++ZA1a0
	ioY34SuSz3IKe1HYnMbiTf74Wa6JO80KaxWE6zKgirAp7CPdVvWBQWyouIM3Ihmp
	HeV70w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1h297-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:29:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I6SxPl006613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:28:59 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 23:28:55 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 18 Apr 2025 11:58:39 +0530
Subject: [PATCH v2 1/4] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-qcs8300_iris-v2-1-1e01385b90e9@quicinc.com>
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744957731; l=1018;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=eKVrl6rJnd0g6KWuwOvnZ7F27JN9U3wGDnrj1cjxhFY=;
 b=/jggPJjJXHycpfaWUlESXOHuBKiC6Jus040qEtb5Tp7tbl6FZg037lOvtoWmGhqG3XhOHvqS5
 Jwd9exJg8HRCsaMTKiUQmMkqjRlYeB6klQj6qHCBrSnJkLdliS3wkZ8
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=6801f12c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=sterj6uKq7s_ONq5bUQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: VxQphomX-Q0GXAhYiYgXv45ysWWdvxyF
X-Proofpoint-ORIG-GUID: VxQphomX-Q0GXAhYiYgXv45ysWWdvxyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180046

Document the IRIS video decoder and encoder accelerator found in the
QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby
have different(lower) capabilities when compared to SM8550.

This patch depends on patch 20250225-topic-sm8x50-iris-v10-a219b8a8b477

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index f567f84bd60d439b151bb1407855ba73582c3b83..3dee25e99204169c6c80f7db4bad62775aaa59b5 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,qcs8300-iris
 
   power-domains:
     maxItems: 4

-- 
2.34.1


