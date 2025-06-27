Return-Path: <linux-media+bounces-36118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0143AEBC50
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E10217BE9D
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB192EA152;
	Fri, 27 Jun 2025 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YoQkjlmX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F462E9EBD;
	Fri, 27 Jun 2025 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039313; cv=none; b=PtImh8+rowdGZo5I0VYbcATpJr6o4NAEwsO065AquqEXSB0iBjssv8WGfxF46aRrmypyU0R0MHQPpGwEIDoiFejbh+HwhiW7ZlZI7dGWaD5ldkm2u6GtZypIOk4CmLVhSz4oaIcFTFo3IHCvpVVx5t1hYPlcnWFmW1J30XSFH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039313; c=relaxed/simple;
	bh=lPUj0ZS+JIjR93Ymz5Wr75qm8fLJvAWE3vvsWceS7Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oeLjCYP7ybtoL75GkqwmpJe8M8kSAIRWyFO4y4bfZFSCWeLr2OFhqgr8imCpwW4hV0fkbkq8UHcxjFAUXdRP8TzfVyN+tF1pjrIU+iAIsdT8vPCmyfyO3aVu6f2BxdEVtCpB/8QUYgRP8qAnsteiYcSufZhoiQziXx6AkK+c2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YoQkjlmX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCTJOb011462;
	Fri, 27 Jun 2025 15:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9zBTx9oEg56qxof1puCCB00RBEOC/lpooworXFFdO3w=; b=YoQkjlmX1XbbUuTu
	BsSc6hn3kmhO+w1VqNouCR9qrtkXGELIH9la1Z3f6fEbgB1iewVE0vyyAQeh4W1r
	Ffvg/TZE4pQs8PUPJ4q+gKNVQzVN6bDcHThKenHH5rEjXICnhvdH6iQTrUshaRLc
	e/dFtUJWBLoDekZwl9hWVyYq9VUlQ/Cs1v8m5SMAxMd2fn4bxgsLP9Zv1kgy7T7O
	WNVWaceOXN+vH68QCLtzvijBeuhgsV7K76LEXbOUXgmf+5x/xTrTW/Sysk2uTFrh
	4+ZLfRAElcTUbzRNd2wbsgQ8SJ146LqBAxyTADI5tkdJjS/1/5GS324NSnZTtCm7
	KdLqcQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgq9sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFmOl1022557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:24 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:48:20 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:18:07 +0530
Subject: [PATCH v3 1/5] media: dt-bindings: add non-pixel property in iris
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v3-1-51e18c0ffbce@quicinc.com>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
In-Reply-To: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751039297; l=3746;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=lPUj0ZS+JIjR93Ymz5Wr75qm8fLJvAWE3vvsWceS7Ao=;
 b=qv1JV4/yGm94GN/Av5lIyghac4QwpqsSd+JDtH97+ySJhbJgD2WYQo+WN1DHUwvejfDnogdtc
 51P0HQKDlfyBSVTjUB2cizDhK2wgpYwpbxUsLnbTNwV82dXNQDLBZVc
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A-VbURgTUPMeX_4YeEVveaJomZZ2J-1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfXwhkHUr5DnHyl
 9Y/N/ht3WOe9fZXFX+AspxVWepm3tya/z7PMs8LTn6hbSqIZAg6LHcFcMwATnfs0r9ep1Sd2h2S
 fypvsfyvIva8xBIREDPKrLgy1soqk3AtjnYMhXCnUIGJRpQzNNRjJBzGZnjbQq1MPlNoNaeXv/H
 +ZZdZPem+oY48y6+c6k8CTgnrw5RykYEbeaQopKhVEhf8bparzyMiBi1ps2Bl3fQnvdlr9lXh46
 ardauJhDpuCRI1TwfRwuEu1HRkGFTnytdxBhzQfSy92rLzr1fMeGAkKSI8gYGxy8EeloaXl7HPc
 wEvYgLTgz2nEa7l3mhmrIt5bYuArj5g+ELvPBvc1hkNM5qdkqkV0CTNDPb/e1FnYk/J5nPCCCTB
 bdsgOkK8ZIlgorn6wIGyMxaStcsQ1vrKlKET1v41mu3iqEQEYtcCuZptFrxQOtJgCkeHFRje
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685ebd49 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=PYxMoiBjk0tJv0C1prkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: A-VbURgTUPMeX_4YeEVveaJomZZ2J-1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270128

Existing definition limits the IOVA to an addressable range of 4GiB, and
even within that range, some of the space is used by IO registers,
thereby limiting the available IOVA to even lesser. Video hardware is
designed to emit different stream-ID for pixel and non-pixel buffers,
thereby introduce a non-pixel sub node to handle non-pixel stream-ID.

With this, both iris and non-pixel device can have IOVA range of 0-4GiB
individually. Certain video usecases like higher video concurrency needs
IOVA higher than 4GiB.

Add reference to the reserve-memory schema, which defines reserved IOVA
regions that are *excluded* from addressable range. Video hardware
generates different stream IDs based on the predefined range of IOVA
addresses. Thereby IOVA addresses for firmware and data buffers need to
be non overlapping. For ex. 0x0-0x25800000 address range is reserved for
firmware stream-ID, while non-pixel (bitstream) stream-ID can be
generated by hardware only when bitstream buffers IOVA address is from
0x25800000-0xe0000000.
Non-pixel stream-ID can now be part of the new sub-node, hence iommus in
iris node can have either 1 entry for pixel stream-id or 2 entries for
pixel and non-pixel stream-ids.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index c79bf2101812d83b99704f38b7348a9f728dff44..4dda2c9ca1293baa7aee3b9ee10aff38d280fe05 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -65,10 +65,31 @@ properties:
       - const: core
 
   iommus:
+    minItems: 1
     maxItems: 2
 
   dma-coherent: true
 
+  non-pixel:
+    type: object
+    additionalProperties: false
+
+    description:
+      Non pixel context bank is needed when video hardware have distinct iommus
+      for non pixel buffers. Non pixel buffers are mainly compressed and
+      internal buffers.
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
@@ -86,6 +107,7 @@ required:
 
 allOf:
   - $ref: qcom,venus-common.yaml#
+  - $ref: /schemas/reserved-memory/reserved-memory.yaml
   - if:
       properties:
         compatible:
@@ -117,6 +139,16 @@ examples:
     #include <dt-bindings/power/qcom-rpmpd.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
 
+    reserved-memory {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      iris_resv: reservation-iris {
+        iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>,
+                          <&iris_non_pixel 0x0 0xe0000000 0x0 0x20000000>;
+      };
+    };
+
     video-codec@aa00000 {
         compatible = "qcom,sm8550-iris";
         reg = <0x0aa00000 0xf0000>;
@@ -144,12 +176,16 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
+        iommus = <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        iris_non_pixel: non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0000>;
+            memory-region = <&iris_resv>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1


