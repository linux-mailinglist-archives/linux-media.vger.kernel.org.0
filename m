Return-Path: <linux-media+bounces-43300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15CBA7536
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 19:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5269D172FE5
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 17:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5D323BF9F;
	Sun, 28 Sep 2025 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hb+yuxZx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996B1494C3;
	Sun, 28 Sep 2025 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759079866; cv=none; b=HnRN5vq72E5M6zZ7YHEX1TB8c7wFskws05YWhnfaMcwx5QwTzayicxxSdL3ftCu3bJa2+hg/ZexytLlXMKiUfrcXRyg7riyGV2qJgIVFv4xD31G8bvb+t7Q9iGY3WfZJCvCtjlAo1Te9DPljqazK3OMzPoj204yJuuPxywb/Z9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759079866; c=relaxed/simple;
	bh=RKt8X/sSTr+X/Cyf0/C/CjKHNv4US7rI7/NlClK1Gno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rLtxu9dpK+A9mIk6X++WtAlXTXYqwjl40vGt+dp+ANyzwfEzE9+o3LVzMwZfK7ANSGmnsHsThJ8Kx232oz6fFIlLReZNCnDo45F3FvgCqNxo44zrO1wDpiOcyR3HXVoHvxEQK8aeBYxvkzECRYGxmgZ2gXMmcbQ5OOYs0kE4POA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hb+yuxZx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNawg0008082;
	Sun, 28 Sep 2025 17:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TFPCPT2+TyI
	J7MrYwRgn5gPa6YwlFTTqsD8arExCj+Q=; b=hb+yuxZxJTjTmC48FXh92vkaPh3
	VNJjhALYP6XG1X4vT0UCkQJ+r0zxPHoFcSIFN3Tr2tY2lqOlcd4zfnY0MLzj4h6+
	TU5/ABYEUUu6nn4IfOvZKE6rWYNlLmGZHv1YnLTRNHGMIUFdB8gnwWnyV6JaQLcz
	oxDK790qzIaRHXYpJfwuTzPTN7uX4l6rTpjAKbHgin64edTlbhTK6X3QjBJCZfit
	qIS3Q6edIg78peO0X+256hDGNw4jQUi6rLFWDOZDzte77duhJbDDazXaVJPbZINI
	/f2VAUxOThID8mWqChc9OBu+pLm6LwS7YLMQDYKjSnh1wNxpNI9JxNkNwPA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5u0d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58SHHMT0018673;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49e90k74pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58SHHM1V018652;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58SHHMuI018646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 33AC955D; Sun, 28 Sep 2025 22:47:21 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
        mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [RFC PATCH 1/3] dtbindings: add binding for iommu-map-masked property
Date: Sun, 28 Sep 2025 22:47:16 +0530
Message-Id: <20250928171718.436440-2-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68d96da6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=xsS8FE68tDUPogoBysgA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: QEwDG_Z7gloP8JqZ8We2oFNxGWZGn16V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX8mgnaNQSdOqk
 Bv20+LeFSB0AogyVrKK/fvI/9N+SKs3NBxkUGBikioBLTw/CkRnBjhteFwGo2He/uiIeOnB3Dyf
 wuxJ6amhIltxXI+he/zNjepcm2OAi8s0Fl/QPD/h483aYdtMdMQJaLAeX6+qfUC1ohBLR4bJf5Z
 5NqSSLqzN/GpmijIfxJ7TTRoAdwmRhnrIoubcyP6+YT4gIb+u7KgFX1hBn2x9IMCxoOT0//O+Z2
 zepdAmNuvwYN/Czf/AM+locg5AuYxzMrOgjF5MFERXtEYMhD7LJZNgm5y2Z1/mF8knA/3jG5zLf
 TqjJLd9UfneGAtYaxRpAGjfChKduh4l5gfoNRYesb/PnJ842GxYuWYSZwgESLK2/ltwUKeRBeQb
 kWphILk+2eLrHnhBn/2W+Ww/4UoGYg==
X-Proofpoint-ORIG-GUID: QEwDG_Z7gloP8JqZ8We2oFNxGWZGn16V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

Add bindings for iommu-map-masked property, which is used to represent
the IOMMU specifier pairs for each function of a multi-functional
platform device, where each function can emit unique master id that can
be associated with individual translation context. It contains syntax as
below:

iommu-map-masked = <FUNCTION_ID1 &iommu ID1 MASK1>,
		   <FUNCTION_ID2 &iommu ID2 MASK2>;

The right place for this binding to go is [1], but posting it here as
this is RFC. Please ignore the other concerns like ABI breakage, running
dt schema e.t.c.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/iommu/iommu.yaml

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml      | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b5..9940a3d7b8f9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -75,7 +75,7 @@ properties:
       - const: core
 
   iommus:
-    maxItems: 2
+    maxItems: 1
 
   dma-coherent: true
 
@@ -87,6 +87,20 @@ properties:
   opp-table:
     type: object
 
+  iommu-map-masked:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Maps function IDs to IOMMU specifiers for multi-functional devices,
+      and each function requires its own address space/translation context.
+
+      Each entry contains:-
+        a) Function - ID Identifier for the device function.
+        b) IOMMU phandle - Identifier for iommu.
+        c) Arguments - arguments representing iommu handle.
+
+    items:
+      maxItems: 4
+
 required:
   - compatible
   - power-domain-names
@@ -96,6 +110,7 @@ required:
   - reset-names
   - iommus
   - dma-coherent
+  - iommu-map-masked
 
 allOf:
   - if:
@@ -116,6 +131,16 @@ allOf:
         reset-names:
           maxItems: 1
 
+  - if:
+      properties:
+        iommu-map-masked: true
+    then:
+      not:
+        anyOf:
+          - required: [iommu-map]
+    description:
+      iommu-map-masked is mutually exclusive with iommu-map property.
+
 unevaluatedProperties: false
 
 examples:
@@ -156,8 +181,8 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
+        iommus = <&apps_smmu 0x1940 0x0000>;
+        iommu-map-masked = <0x0 &apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
-- 
2.34.1


