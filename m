Return-Path: <linux-media+bounces-28030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 400BBA5C07F
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 13:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 254E1189B0ED
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 12:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ADB25FA15;
	Tue, 11 Mar 2025 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h+iuXzlg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7AD25FA17;
	Tue, 11 Mar 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741694684; cv=none; b=YX5an/mYmdPquz6q4A5u8jiqjiwLaareOQaF7QWZt0PhlFoxzfK2yuUMAcT4dV9BvM/0NxNG4A6FovmMK6f5EHEu+KBRBZblHznKU/3TomsFshxmF4aPqkjvanmPiid9s+elyvAgHNdeHZvVg4VRGMDd69qvYJI+PNf6DkPjRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741694684; c=relaxed/simple;
	bh=x+brunSIe8spcJ9OZUp5ttMkGMis+fI0McNuE/eDipM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=n2DqvmN6gz6MdzAGZVzZWE7NCAwoj8uxpyeiUr2m2sMb/ABrX9SaYmRT1M7ilj8eyALImt2/K5fICdco0KmAy5reBy8rpRYJ1W2av8SBrqJY3JBD2dDRMZGkURlMON5w3jCh978X7AGjgH+IEHbyVFfydyUozYnFOQh7iSJhEC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h+iuXzlg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7onne028025;
	Tue, 11 Mar 2025 12:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gn02GrEVFnOVWjiLjtYk8M4UayIgDBlB0lAEyHumBEY=; b=h+iuXzlgaSA9Sn4j
	tzPTh4PJooch9yA9xdXmLkhT8JCr0rsx4t0V42Q6GLZ1Q2U/ZhQklfyTK5uBbX/7
	JUBnVIMvb8eOMP4LEfc3MEtS3N0+uvEem8tEG+BQZud+tY6vBXOzjxZArk9iIcny
	TqIoLi7hRCWdto1JnNdVIwv04CQl+wd9Ac6dTNmw51fXXNOvHFUBTm75JgoIupwk
	d2f3JQrLGyi20f7e9jAzjE4ltTORkhVjXe9chgQ7vVeQXgyeshnHbzKbzAZ2tkiM
	PTf48y9jcvDzzRrCvuU+GkeOdI8UW+FUZSwR59LHxtJ85Y+wRt73caTmLvGjFox/
	2s9Eng==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ah528sjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52BC4cja026928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:04:38 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Mar 2025 05:04:34 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 11 Mar 2025 17:33:54 +0530
Subject: [PATCH 2/4] dt-bindings: media: qcom,sm8550-iris: document SA8775p
 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250311-dtbinding-v1-2-5c807d33f7ae@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741694666; l=912;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=x+brunSIe8spcJ9OZUp5ttMkGMis+fI0McNuE/eDipM=;
 b=P9YTco55eX1nI7LtUqPeGdFFFMbpio120kttwTf2y4wDn321/cbi5Sv33GcnytBYDRaOMR8hx
 1vt7PFzCdQ/B6n+DdTDraxgQHQci4RVMZE45phd43D/5zhI6M05z9GF
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T8az8wvD0Fib3YQLNl-WEMQV2kEMf26X
X-Proofpoint-ORIG-GUID: T8az8wvD0Fib3YQLNl-WEMQV2kEMf26X
X-Authority-Analysis: v=2.4 cv=DfTtqutW c=1 sm=1 tr=0 ts=67d026d7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=_ptYEHGy1yi0hVg_d7AA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503110078

Document the IRIS video decoder and encoder accelerator found in the
SA8775P platform. SA8775P has collapsible MX compared to SM8550.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 440a0d7cdfe19a1ccedefc207d96b26eed5d6630..20ac596638ba33f49cce9e42d70d31a8aaa7c36e 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -19,7 +19,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,sm8550-iris
+    enum:
+      - qcom,sm8550-iris
+      - qcom,sa8775p-iris
 
   power-domains:
     maxItems: 4

-- 
2.34.1


