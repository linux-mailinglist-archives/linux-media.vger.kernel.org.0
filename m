Return-Path: <linux-media+bounces-30492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 383C5A92B5E
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 21:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7AA81886E8A
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 18:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEA825F798;
	Thu, 17 Apr 2025 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PdsLd5TP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5DB25DAFD;
	Thu, 17 Apr 2025 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916284; cv=none; b=AjEsNV88Mla5fO5e9Zk5g/rRoO2udVgHGr8uTRrzifkC5MpbwFKBg6dHDNZc7/JgANMMWNCLnanI0FD04XRJd7L2CNCvIxukzNbE+8V348F9nQPqDaqGMW0w56eWDI9Rac9gHkBQjTg1F1jqUnLJ5DG/MNI73pvM9URHUN7sWSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916284; c=relaxed/simple;
	bh=p29bPbU6I3i7UO7MEcFw+LN8HDtzsq67xi6VvBNT+bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nzAM3ATR6oasPtKJeQ9p80xdxV4lfeO9E7tCY4P8AEqllAIVRyr8BKGPM2zd9VemiywJFEujaywNVGQ2bA0cxLGGUf2K4piKt3/InFH9/dzBRFR8kiSilx+l+Yh9ZeUgevBY9nBpTAVou0+R+g0LNlW/wOXk7wr2pLHw0UHg7jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PdsLd5TP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClKmh028992;
	Thu, 17 Apr 2025 18:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zy6/sOlf/Sd9qg0d3FLfL+s47Pny8oraWpxJSnAEivU=; b=PdsLd5TPKSHVKEA5
	l7EhYyKlhBGCbptZglAssxvKMGoh5jF037GcDFeb++hPhjPtQgp4qOT9MunAbUVB
	kAZoCt8+BnwSBsPS2Al6kq1Z+SAayLC0hJ815H0zHFFmLPHzfEQhrZt5x1fUqqzo
	etTkeallQYMXr9NRlReZBZN4EBNJl2Oxp8T66+kO0JiL3T9OzlPCaCAlImPh9Hi0
	amwwzxdcJFUryQW8V6/S19KgjkWh8lDgtlAzni6TGzdACkd66fdR26PuMQ4Xhk7F
	2tdqR7mluR9wFsfEfD+t+t+Z1SuhyNR7R2G4mnfbPioj61eIntxqM3nqciF0cfut
	rZ/r5Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9fxup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 18:57:59 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HIvwrT026676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 18:57:58 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 11:57:53 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 18 Apr 2025 00:27:31 +0530
Subject: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: document QCS8300
 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-qcs8300_iris-v1-1-67792b39ba21@quicinc.com>
References: <20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com>
In-Reply-To: <20250418-qcs8300_iris-v1-0-67792b39ba21@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744916269; l=882;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=p29bPbU6I3i7UO7MEcFw+LN8HDtzsq67xi6VvBNT+bo=;
 b=ojkgCWfSukLZvU5R/nfgjMoirBYexgb9sv5O/V8KNCE4oivswWo6XnUBZRBOkB6LCmRdX6Rm6
 IbmViPRp6fNDLAih2n0tUK8TD0HaeJ3KiHUCfvg12jrcfozT/fN+aBl
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NJnxCdmzVy2--FVWCMmVzAM0gbD6qW15
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68014f37 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=sterj6uKq7s_ONq5bUQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: NJnxCdmzVy2--FVWCMmVzAM0gbD6qW15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170139

Document the IRIS video decoder and encoder accelerator found in the
QCS8300 platform. QCS8300 is a downscaled version of SM8550, thereby
have different(lower) capabilities when compared to SM8550.
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


