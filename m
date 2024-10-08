Return-Path: <linux-media+bounces-19224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD6C99469B
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F8D1C2266A
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5951DE4C9;
	Tue,  8 Oct 2024 11:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WRxnhRVV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5AD1CFEB9;
	Tue,  8 Oct 2024 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386497; cv=none; b=aieiNmIm04/g6pAwknbdlTA6LwLtt5GS6ySXFaoLP58QGDJPq+HrAPaAHrXjfbgyWWWOZlacADDr1ggA1UVcXkl1z/U6xC5LwjCu7wSC8bY513/fxFY2vJOys0wy3my2eRnFAoguEFfG4Yv/hIGh8t7mQ1F2HG/r7rGkgqkyQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386497; c=relaxed/simple;
	bh=pO0baIQClf0ZdjAYNoEuMxIqy6s3Z1E7Gir62gq3KUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VbDQjn1pniXfNbXqTDQIgioPRQQiXv1l7lZZpiexH3/UJA9TjUQInYbeKKS4aqpT6LMWTtdHRtKhT0nCVsZkt+Rs5bF5GPVotGEdY0rLH619PwdHbPty46w3yHN3oHgl/AIEts2XAdsB/kbv8CpHdhgOQKtzFke2dpKNnYAbMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WRxnhRVV; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989eiZf006897;
	Tue, 8 Oct 2024 13:21:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iIY+1AsYhidNu2mjIxZYKmfOZ/gtOZIy7jg5tbnDPgM=; b=WRxnhRVVc/QyFSFJ
	IMorsWiwRWXXbiQlUT/O0JDDW7wNB1OEsaiwRWRl8/mzgWu10dKH6CKMFYgV9PWV
	8CakFY6H1NE9/l9asw7mJ6dwk9oakKGWTNDo0OAAV5UT1QaVyfPNGoFFpAPg1Ebg
	LFy/JkLyHoFz9T68BeicVPwh/aoCZNe8W6MF0bOAT9qXjb/+OuiIpHzc7wbT5XJL
	3L7on4+/DSjOYpKyEj2JiMfafp08dUEudn8in4vkEIvZP83au9PZgkqMIe/UfIZF
	zzzfzbzsfCvp3lnrrlIR5kDfzUuMm5SCLLt4xCw5dASyQQPWt1Bl69CgoXnz8p69
	avLIGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv760qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 56F884005C;
	Tue,  8 Oct 2024 13:20:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 011D0285A0A;
	Tue,  8 Oct 2024 13:18:21 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:20 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:14 +0200
Subject: [PATCH 12/15] dt-bindings: media: addition of stm32mp25 compatible
 of DCMIPP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Addition of the stm32mp25 compatible for the DCMIPP.
The stm32mp25 distinguish with the stm32mp13 by the fact that:
 - supports also csi inputs in addition to parallel inputs
 - requires an addition csi clock to be present

The commit also adds access-controllers, an optional property that
allows a peripheral to refer to one or more domain access controller(s).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
index 87731f3ce7bd..bda28fef0b78 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -10,9 +10,40 @@ maintainers:
   - Hugues Fruchet <hugues.fruchet@foss.st.com>
   - Alain Volmat <alain.volmat@foss.st.com>
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp13-dcmipp
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        port:
+          properties:
+            endpoint:
+              properties:
+                bus-type:
+                  enum: [5, 6]
+    else:
+      properties:
+        clocks:
+          minItems: 2
+
+        clock-names:
+          minItems: 2
+
 properties:
   compatible:
-    const: st,stm32mp13-dcmipp
+    enum:
+      - st,stm32mp13-dcmipp
+      - st,stm32mp25-dcmipp
 
   reg:
     maxItems: 1
@@ -21,11 +52,24 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    items:
+      - description: bus clock
+      - description: csi clock
+    minItems: 1
+
+  clock-names:
+    items:
+      - const: kclk
+      - const: mclk
+    minItems: 1
 
   resets:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    maxItems: 2
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false
@@ -39,7 +83,7 @@ properties:
 
         properties:
           bus-type:
-            enum: [5, 6]
+            enum: [4, 5, 6]
             default: 5
 
           bus-width:
@@ -50,9 +94,6 @@ properties:
           hsync-active: true
           vsync-active: true
 
-        required:
-          - pclk-sample
-
 required:
   - compatible
   - reg

-- 
2.25.1


