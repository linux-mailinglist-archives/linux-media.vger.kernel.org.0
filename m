Return-Path: <linux-media+bounces-35461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8EAE13AB
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A47B19E3347
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2639622128E;
	Fri, 20 Jun 2025 06:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CGj/q9KR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82A30E837;
	Fri, 20 Jun 2025 06:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400495; cv=none; b=AYrDo5z7dxf0cYUltOR/f7yL2FgreIexnLjZfwotec8spUngc9wrkDS59641tyQDWqPgRY6kA3oI95E/BFxDop79YMR4k0er92jkfXlvQsZt5S3uynOGIvstXyQe1unzr8F0QglNg7E/9VzvxuABouSXwkc4j5QjdscDnmlodxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400495; c=relaxed/simple;
	bh=5JbCcV3BJfx/Xm/lqtqP8TEaR7KOehOa40rnp0JfL0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XnFWK3zZORHSb2RZv7nGnFUbM4dQ+4g1gGvPDjVkAN94iW2dxjpUWSfnPQDMDFCVQ9zMnaxdfnluvSKd95Pra8jDmRLDUEzHx6I3T9M9Hal4NsM+g6DYLanAlpXzzPIz5WITKKsv+WLXqWSZ8nspmqc2bnAZx7tA5dRbO8FdRRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CGj/q9KR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIeZuc004996;
	Fri, 20 Jun 2025 06:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FpS12xtYv1+mzQnpBw3E4RKi7Ow2hqKC9fSjBZd+U7Y=; b=CGj/q9KRyWmElOfK
	BDTJ951vMGMGmNDhr11fTnNmvQVwJmEF2VyOsollbPJQBckIbDCdiQjxHcqLY2Y+
	NqmYWSv1NbDQjobfOrVMqINOe/8dQXUSFKLAZIfNvB1RXzCNVd3tF43jOo/CBsJm
	aI/Ti7d7CplVghIfHFSbUvuOqqWN/hifGRyRf58rhOTQdwyag8f+bhLM/yXJkBsV
	jORm9Kpse01crW1SR1wuxjxIwy/NDDON4aEDWOAtRriWOwXswv3ooZMVox1pffqI
	cTVkIce+uXj4pGQHcNRWcO0lyA+ij016SEzlMlLVSHeu6WoVd4OWK5CK6y+m9yQK
	SHbmaw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mt531-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K6LRQu023522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:27 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 23:21:23 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 20 Jun 2025 11:50:51 +0530
Subject: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
In-Reply-To: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750400480; l=2464;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=5JbCcV3BJfx/Xm/lqtqP8TEaR7KOehOa40rnp0JfL0k=;
 b=q8bTU1cmV7cHC4aZKOregDo5bnsC6xAHV26I0Fce6aGwN9WsyZHNRwY4oAO47vFBuDtr22+hX
 ZtMTyf052ZGBvuZKYDy5V1dr1vHurquPQ6pKXOKVDIfJeG1sY+NxQVi
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NiBTYWx0ZWRfX49W1uohd05Y1
 sXLYDcWS+W0o9raiigjnasYNeqdWgIpduzq7U7eLDebMoi80i1kEJUcGM2HZt3Zp9SNb4tJPPek
 ZxR1gDC6w0ZNHe2sSZlqxJAx3Qg82r5WxdH4leptDT6j2nvTIzPTbttDAaYkkpNr9CB5NuMiMQ+
 FcrwLWhdJVcXgSGGxOTw4RftwRgmTyEnuAMHYCdr7KIR9tFrmzeSK+9a5Pduk4iOZLUhBiZgn/J
 RybIhe7PZhSyOMUdh010TwYBDOocmEC6FKXIG6C9OzTeTzp4r2itGnTnUd8WfHjyNgCocZFt352
 1yuq5EraNIfU7pv2mucHhJ/RXH/VLOtMIenBLk+7ManpJx0jbL2euISu1OLKXgSn9IQjl0eeMFP
 L+9X6o+xfEK89BU7m2mtEkx3uZ1g6ZHADXjIXmDQPaKHmWBqnCXxnFdSgtNiPWVMNX53uvsC
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6854fde7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=E6x5WMc5iwfpEpjNtQEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JicO9dGdIASamUJxz-KHbUlU7m28mdEV
X-Proofpoint-ORIG-GUID: JicO9dGdIASamUJxz-KHbUlU7m28mdEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=658 phishscore=0 clxscore=1011 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200046

Existing definition limits the IOVA to an addressable range of 4GiB, and
even within that range, some of the space is used by IO registers,
thereby limiting the available IOVA to even lesser. Video hardware is
designed to emit different stream-ID for pixel and non_pixel buffers,
thereby introduce a non_pixel sub node to handle non_pixel stream-ID.

With this, both iris and non_pixel device can have IOVA range of 0-4GiB
individually. Certain video usecases like higher video concurrency needs
IOVA higher than 4GiB.

Add the "resv_region" property, which defines reserved IOVA regions that
are *excluded* from addressable range. Video hardware generates
different stream IDs based on the range of IOVA addresses. Thereby IOVA
addresses for firmware and data buffers need to be non overlapping. For
ex. 0x0-0x25800000 address range is reserved for firmware stream-ID,
while non_pixel (bitstream ) stream-ID can be generated by hardware only
when bitstream buffers IOVA address is from 0x25800000-0xe0000000.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index c79bf2101812d83b99704f38b7348a9f728dff44..a1e83bae3c36f3a4c58b212ef457905e38091b97 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -65,10 +65,45 @@ properties:
       - const: core
 
   iommus:
+    minItems: 1
     maxItems: 2
 
   dma-coherent: true
 
+  resv_region:
+    type: object
+    additionalProperties: false
+
+    description:
+      Reserve region specifies regions which should be excluded from IOVA.
+
+    properties:
+      iommu-addresses:
+        minItems: 1
+        maxItems: 4
+
+    required:
+      - iommu-addresses
+
+  non_pixel:
+    type: object
+    additionalProperties: false
+
+    description:
+      Non pixel context bank is needed when video hardware have distinct iommus
+      for non pixel buffers.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+      memory-region:
+        maxItems: 1
+
+    required:
+      - iommus
+      - memory-region
+
   operating-points-v2: true
 
   opp-table:

-- 
2.34.1


