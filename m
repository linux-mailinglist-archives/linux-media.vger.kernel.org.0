Return-Path: <linux-media+bounces-28550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80121A6B33C
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 04:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A313BAE7F
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 03:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278221EB5F4;
	Fri, 21 Mar 2025 03:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S4h0DEi8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4091E9B19;
	Fri, 21 Mar 2025 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742527194; cv=none; b=nIK0QJNZqm3/hmOXytIlCpCP3gCfjWrx71meTyjOods+tux8Rg0XbXCfYUfFINXNl8gwRrrRCw3MSLNFHO6WBwnQF8G1v8XNPaLtunSI2f4ShqmXTMEdzAtqOfPetEJ6EwuRaSaOHrCX/n0Hpk01a6fy8MRTF7hYUeP4oY5eI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742527194; c=relaxed/simple;
	bh=QVHSXRSxgRAIyci3IMM5gY262f2WC5b5oC/fErjG73M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VtyJ3KF9A44FaJ1HWLr+YsSW/kTbO0sQLLm8KILRLJL4VCIcvCb2ZkNl3BJYJyFR7g1CYrPFdwc9Xvx5j5ev24JygB8osbD8gPMiELgkbtdRHEHIyRQJxrmSVlQE3zOZSciHZU/Z2/TAl84QR16NhyBoD6dCJUV3/4KuCbC3+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S4h0DEi8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1WUxo017936;
	Fri, 21 Mar 2025 03:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BbH4XjZwFxuODVOBvsGqeqOQCwo9CPYlufSn0drpqB8=; b=S4h0DEi8wwLa3KrY
	j+Gp1t60gGKlY5FIXdQA7XtTA2YqYDqgCazkVZuN5lr+ZHLRWwhuB18SleSPkOV6
	rScM3gGQamy/bDa1EmsaBZxQF9iAYwwNiGk9TqLK8utxtFxPKMtGXCrfkqx99vh4
	HvRlDRsSWQqEYi6GtEuBeeb4ISpOV3xrd/NOgIY5iKOdACqV0gs3YCB/lruwC2MM
	QszEHrswRxOxzXOPk/SDmOfIyQVrKVwOitnlFDvHPWR93RY1OFhdwj9V+briXadJ
	Ga2HlKU71IVUleSQWPmOvwOwhAvVd9RLRt3ujyBuiCpI7KbfOrQPO8/A/FHzuI5T
	S40LaQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtu9c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:19:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L3JlNk016265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 03:19:47 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 20:19:43 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 21 Mar 2025 08:49:02 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: sa8775p-ride: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-dtbinding-v4-3-6abd4575bff4@quicinc.com>
References: <20250321-dtbinding-v4-0-6abd4575bff4@quicinc.com>
In-Reply-To: <20250321-dtbinding-v4-0-6abd4575bff4@quicinc.com>
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
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742527168; l=814;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=QVHSXRSxgRAIyci3IMM5gY262f2WC5b5oC/fErjG73M=;
 b=fiAcJvKBZtSZljz4VEjvW5KZoN5rRV3+aADROmn9CRvBN7zGCQu0oO+V6aeoM3HxC8+AsLVtI
 QtmNbNADG8cBauidtmkXjp5iDqmV5QqiRwDeJqqPceTrlhOEKuuOjC8
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -Jhw8AP8rjAOWGC-Vb3O8uQbjnOHWmRr
X-Proofpoint-ORIG-GUID: -Jhw8AP8rjAOWGC-Vb3O8uQbjnOHWmRr
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dcdad3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bnThFhelgDCT6RDeMd8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=750
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210021

Enable video nodes on the sa8775p-ride board and point to the
appropriate firmware files.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2ded15fc3265ac8c26b14473b618f6..bad141cb15e2fe51bb80b10906d9c7ef84e6d52f 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -522,6 +522,12 @@ &i2c18 {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
+
+	status = "okay";
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.34.1


