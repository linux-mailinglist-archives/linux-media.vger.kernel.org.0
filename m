Return-Path: <linux-media+bounces-35457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF41AE1209
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C02A618936D9
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 04:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BDD20127D;
	Fri, 20 Jun 2025 04:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eHRAmMFp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB961F0984;
	Fri, 20 Jun 2025 04:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750392503; cv=none; b=MkCG9BAIdfrtxEoPK7xd4V2YwjB5G9yX0Synk6B+DPcKvcMpmoWO8mw3Z/LaxJ29k0C0kO1sy16EsBFOWLr4CMK5dJkQ4mdekoEU2pkTnXP7cA1/W/CYlomzluO/5U8leSDdYftWAhp5yqPTdPY7g17UNtsl7m5D4JZN8WrnZpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750392503; c=relaxed/simple;
	bh=S7b0OeJh9p+z183hjORZI7TDKjX/RG1ouQnjtZYlCYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ac/tYk3VLidA1s4lT1iilAnZG+eLfLgM91TQAkPLisfIa+m850QI+weAE+Sj+0H8mUTg0U40dBIG4n5drIQ23KifsJMFfNV/KrRHwdmF8bdJDymaz+ltZCjLviahFpcGiqZW24md5D+BoNJv15QLub8pjXtQ5soYx4ui1y0mWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eHRAmMFp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JGXFtk027925;
	Fri, 20 Jun 2025 04:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cpRn6WKqmjNVD0e4sCeFiy+4RwDCUPdbguRAXbv1Pog=; b=eHRAmMFpegaXqIXU
	4TeG5WNALwKLrTB7Rfs4OGAezYE6IKqFFaEB1nY39rAxghbnokIrY50I3M9pb0+g
	GcUandbRGeEm+UsS2X9ebzC6p5cGMifK0eHZNl6NIBYLW6ZxgDVQiPEFXrrki4Je
	2eB4n69iAHsks4Juh6S7IjQQ98P5qFrZl7IMtRJPbLgnQ8emYi9hl59mH0q3OQda
	DQtaqo56OylKtRldQ99pjyhPAjz703JKuQ5ky5z7/YQ+FzcieiOPAkJlCckd3Uaa
	RaHCgQQLWJVePbfNYoSN2qxGzyycxmhYHSfeYjojSeNuPj3OJnJ3imYNa8rJmyog
	rNR/YQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791cs1r4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K489mG000684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:09 GMT
Received: from cse-cd01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 19 Jun 2025 21:08:03 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <akapatra@quicinc.com>,
        <hariramp@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>, <quic_depengs@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <quic_wenmliu@quicinc.com>
Subject: [RFC PATCH 1/3] media: dt-bindings: Add regulator current load
Date: Fri, 20 Jun 2025 12:07:34 +0800
Message-ID: <20250620040736.3032667-2-quic_wenmliu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
References: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ar_hdlCgLfdyCT4wy4v6dKVvc5btO4KO
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6854deaa cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=D8npC8GYs_Bn0z-5gJYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ar_hdlCgLfdyCT4wy4v6dKVvc5btO4KO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAyOSBTYWx0ZWRfX8wfAuPKM9vdl
 sbnKz4wO74XOmTJvQ+VpIZOhFm5qSwtKabDJrkT+FFY9GiDT0GZIo0SRPDd+NZjEq0tfvoVCT9N
 jNdIemmJyQ4M5gumgN1cQFV9arBXclCIswDhXcw8FT5HV+sPpyo5rLPYZ0QJvon2/gUrXalpI3t
 WeFgeEcn/ON+Ci2RHAjNSQey6FTwmkWkTQDy4A3Rq5rlSMvpaaUPmz87erHeJLLouq2rZIZb9Qp
 GIYCeWE5hjTRs1ezwYoUNZH4JZTCYeKGaksTTiXQefe3WGj7SVuHodyZAKFaxHlHLKIB6gLoSvf
 AlE4RryEn1cEglLjaPlAoyHzxdbscdUrnGMkrCZaep2YQokv+ALeQtPnTva7/GKt9uchQ40x/1Z
 H49V5ePKR67HN2AXAfqTsTLYCz2rxPok/Wty3wDJH31/cP4vMNo7/MCCs8FfER6PnEWwbcti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=938 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200029

Add regulator current load support for vdda-phy vdda-pll.

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
 .../devicetree/bindings/media/qcom,sc7280-camss.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index ee35e3bc97ff..a1ae4701d178 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -131,6 +131,12 @@ properties:
     description:
       Phandle to 1.8V regulator supply to PHY refclk pll block.
 
+  regulator-load-current:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Specifies the load current (in microamperes) for the regulators used by the device.
+      The first value corresponds to vdda-phy, and the second to vdda-pll.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1


