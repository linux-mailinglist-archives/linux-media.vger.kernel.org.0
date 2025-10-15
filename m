Return-Path: <linux-media+bounces-44581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06819BDEA18
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10E9A506AD3
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3C332BF23;
	Wed, 15 Oct 2025 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mPU7EwQN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF32326D5D;
	Wed, 15 Oct 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533334; cv=none; b=Lo6n9Ttw4wBfn0DAeZnpNuK6uRYlGocwIgsBtYMqY8DEpnngQGfuBHYdUsJswgQHLkTZcBvU/MvPuoS3CXE790m4BQLa0IPp7Jq2NmCTaM5v1Bd2yTWJTP+NROnSSjRqK0++H6fEawzmik5hYFYSR4lSgr4m8Goyzw8C0us4oOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533334; c=relaxed/simple;
	bh=8lNjWCCOf8AtDyHmHEyF9+qh8fr3LuFgEFXJ2Tb9Mak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjjPzaJZvZOaTWFwFz/MGgVJlSSlveybgANxsJXx/t+fONcD1C6fQIABfilbj4SjdNcM85yj+WUe4H5VkVtvXgy2pVP03vYnUFR5fUB4qR1bb8LuTr1pJqenJnc6trtdlLX8fDNvFZ4qe7dq1RolKmNFFXpJiO6iSDcr02RhGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mPU7EwQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FB0OjN004300;
	Wed, 15 Oct 2025 13:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egS0INP4+7mItlWy6PC1ldwGPHFg3WZ1xXhklimKiXs=; b=mPU7EwQNEqrqmrWP
	DBds9vKcUWi6Kt0U6mg02YqhPK7bZflEUCpIGJyVStX/lS1yv4y5V+seyu1baa3c
	DZ7M/XfnhIuOOcMP2iq8eTriPQSo/YnkWC90jjF9Y24wZwu3qvIIMRWewb8FUH8N
	lWfIedNH7MnBJMogRId4hrhEmjh0v0siSSg3izD9ry/CBCKEP7IEOMEwx5Z5Z0DN
	57wn69vhfTcvGxP5T0Dj6OmvfQeZu7id6gqhK5/RmzRhntBfOzRMAQX0GHqhps10
	EuRsHIa5gAc5GtFNWHUXVJ/xXHFRV7RMi5IoVsHjkjeufNSyMQcj9ukNqymnT2eU
	JukCng==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1agrej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:01:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59FD1vx1026463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:01:57 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 06:01:52 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
Date: Wed, 15 Oct 2025 18:31:29 +0530
Message-ID: <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef9b46 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=Xm6lRcf7MHjJYKRB2dIA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: LUWVI2qlKkNiupA52Ou-BSFTlzSvg4NE
X-Proofpoint-ORIG-GUID: LUWVI2qlKkNiupA52Ou-BSFTlzSvg4NE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXwufPtuCv8+mm
 osPhXkfvJBWtt/YeoujUU28dk+ug+6IxQvq3HaROUmQ20ZTZLDKHShjpJmM+hvs79xpaVjDVY2N
 qh/gqFG9FARCskM4HY09Z1KnW84DpbrSuvrX2+8f0thlJE/If9VYyQqgmLzxYp/ihjKtfvXroUJ
 4UAopYbFPXzVUsTvuRkFAtZGbEhtLKVEqKZHokiOwRtIC81qem2C3bxOhMkmlnM3fQ9iqrNB1o0
 pGrE/JzkQcJFxGEntKuUxpm2xjBdHEFlnc23cecTpoTKte/W+b74OWe9ndWXZmbjYJg1PJs8N+0
 +qqQkUGaTCntpsGZn1ZrqUqZJXK+luVxszjJiYei9x3x1hIxvZX0zEOHe5Uw9q86DirNcfH0mi1
 B6HOtVKnUWtsw6ixbwujNSJcxbwD0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
CAMSS binding to reflect camera sensor hardware requirements.

Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index 80a4540a22dc..dce0a1fcb10c 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -120,6 +120,14 @@ properties:
     items:
       - const: top
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -160,6 +168,8 @@ required:
   - power-domains
   - power-domain-names
   - ports
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -328,6 +338,9 @@ examples:
             power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
             power-domain-names = "top";
 
+            vdda-phy-supply = <&vreg_l4a_0p88>;
+            vdda-pll-supply = <&vreg_l1c_1p2>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.25.1


