Return-Path: <linux-media+bounces-36111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E096AEBBE4
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8892A644E07
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECB92E9ECD;
	Fri, 27 Jun 2025 15:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X9OTBeYy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8E2E9749;
	Fri, 27 Jun 2025 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038386; cv=none; b=Y4IndSCeujR6CpyqyzrNMPpVkijDtIcBBPSjfDHGBtjfL/IBFV7fZ/EEcKxYuLxmgnh2Yp1pL6hZ/0jEPUfptgQu9nGbPnMV/RQiqdiBxDXCgNq7VIsZW7+GPaml2SYV0yWf7u29gN4vrci4aJV9ICJhfkSTKnj7uEhw+I2zHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038386; c=relaxed/simple;
	bh=x7TrWzl0vmdW72cGXoKDrWehoBJMvORlw4ylRPQ1a/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hZH9putbx4g7RLaWEN6H0CrqjggAQ0abnGyPzmFQdevkRbBaBf3KYt3Ig+28qBewqhsBWdxt6qXXk1YfrojMl1fAyHPfaQa089FQUabd1ccOxMxeXw9bFgRsoHb30THd5jApfL21f47KeZvVdoFHl7AuEB2NN0Sx54YHeQBO/f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X9OTBeYy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC1cCK032657;
	Fri, 27 Jun 2025 15:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScGX7//Aa/vXpPts6JOh+RRdDSNYRcaqf4SUATARBkc=; b=X9OTBeYyRcpQzHrG
	AGadZWRyhCw4dO50bUmO0Wprx7DNzQg22RKdYqCfFVnWXJq9FdecNTKGq+p4ChBD
	sfNNT+pvvvvhEUmt+yBZiAhq/+JU+LTVipSObQxvOgTLDA9/irP9JOr6ivW7PdSs
	p2/lTjomfcoNOfUGSmWercv2IGra1+VRAI2f5XoSC/UeQAfqwNiRYib53UQ1Gc+l
	k/fezLwULz9C9ZOdWqj0WG7Fffb4qy8LG+txZFekdfNMX78NwqRpxWgm+uFw5efb
	FMFWRX2dYcAcEhMWjfaKoBQZ39pnR5pHkLbLouWUEkHrkTj+/h3062uQjUVtLT8U
	9U0Jrg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdhaw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:32:58 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFWviX006326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:32:57 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:32:54 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:02:38 +0530
Subject: [PATCH v2 1/5] media: dt-bindings: add non-pixel property in iris
 schema
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v2-1-3931c3f49361@quicinc.com>
References: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
In-Reply-To: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751038370; l=3567;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=x7TrWzl0vmdW72cGXoKDrWehoBJMvORlw4ylRPQ1a/A=;
 b=6GFJeBY/zjfp/MW0jdD+S+o9ImB8jT6sizTBIPKkLlRCejxKvo/MgpfsyouhNiQKTbTYsQi2P
 zHK5OxW8G6YCPOqnL9azWCDtcH+jpxCX9LTGnTUbxHZaE5c91O1PKuo
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685eb9aa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=PYxMoiBjk0tJv0C1prkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNiBTYWx0ZWRfXw/ehngEe6bWX
 1aY7m4wgvnqDVsKew8pt7LoxwUpRabGTJW+8DOxgo2zwfPpQhOcT6ocJSH5/++oP+3xqmiwpPM3
 pkWD9qh+GRaRI0r1pQkdYjXkx34GutmaU24Hz59HI7/sfyP99D3mfOfUG6DV7MYDDjfVrUl4918
 GDj7aHE8SFFRw7u3VHdY4xC8eNsClcwRZJvHQlUJrxtOmgfyw0zyGDAByErcmhkL118vL4Xsq2I
 cLOoBHTjjuJsRJASIBxDGq4jTNnl16BoeZ6yDYMRMCvNWU6SlFnkaZIM416mtqsO2RlK8EbysfF
 oLMVMaCcG2jDzrVjbTLu+1BY4vUiBU4djK8X8aK/Z/HHGYV+nny1t+wSnj966e21E+q0naBsvdE
 O0bnHqOb9RLfye2CIsqZWaZkiOLry1yvf2vWQIdIubgGB2euKamQLfH5lFP5Y+h4adGnJ/0H
X-Proofpoint-GUID: 28_CT0lEwyjtu3viQfyNIkY7oGrW4VOi
X-Proofpoint-ORIG-GUID: 28_CT0lEwyjtu3viQfyNIkY7oGrW4VOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270126

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


