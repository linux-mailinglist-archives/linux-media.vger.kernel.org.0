Return-Path: <linux-media+bounces-23261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003E9EE297
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5F7F188B27D
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824E520E715;
	Thu, 12 Dec 2024 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FOp3LdWX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2A20E315;
	Thu, 12 Dec 2024 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995231; cv=none; b=OjvGg2Kt/CefHFeY936OB5vYxm0oNySyJR3Kw+knsJ+zeyehpm4Fl9Fke1yBn8fxYzSGFFoFvuQvmjh72PBgEpeWFCrqfyUuJt+ecLat934ukAdWUlSHCjfwusG5kn7VW7B5mJ2UQN/eHKprXbFDK4JJMD1rtSej7jUJ/nHC92A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995231; c=relaxed/simple;
	bh=Y3+kcLnapn85+KJSfvUXb3xTOBkJjyt8xzv+T5sUMbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fVHWtMPGnXvkgXtM9psBugJnP54luahueveRcOzyoMVUu9LEda6sib3F+yRKVGS/64ZX5WTwPljZNnNXh+QlLefBNzfJ/cUS5a9baaiEGq5QAkqszB17VlzjrMJjvy5N0ZSnMoxLU+sHDv1evQoZ5SukdAqIi/QG2Rb78M+daXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FOp3LdWX; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC6CnRe002079;
	Thu, 12 Dec 2024 10:20:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	+L9rfaF3CCKOQj2fO07wjdWK0CmBJblzP3XYkNEWcs8=; b=FOp3LdWXnXsr9H5k
	XelWB38aNiAoKKjRdOq4asqxh94j5lbZBHCkq0uv4vpIj7/EmclfXaLlNbbFFdWS
	UjqjrsvqGDUcY4D/gdW1d5vbTzJ3kjY3uv4Pe5By60jV+o+81c5tkpK59XyqvYKE
	x8i4OAknWsGrc/OdZd3f8f0EGLZbiex33FP479n+7rYN3IYPjTw9DewyCdCuh1Kl
	4kiDYzCLuU6LP44QGxvsaQ3cXa4P5LMWlOE0ANMnTrCQMKfqxoSPDGPZlP4D2zW8
	NGXsgBIYHOt35zuI0z0wRQKkPjc8z+XGuZkhy8QvKhgbx7PwQveyelL85NVrNSMf
	EfeX/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ffwwaked-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:20:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 26E0540057;
	Thu, 12 Dec 2024 10:19:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FF24258A65;
	Thu, 12 Dec 2024 10:18:10 +0100 (CET)
Received: from localhost (10.129.178.65) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:18:10 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Dec 2024 10:17:36 +0100
Subject: [PATCH v4 12/15] dt-bindings: media: add the stm32mp25 compatible
 of DCMIPP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-csi_dcmipp_mp25-v4-12-fbeb55a05ed7@foss.st.com>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, Hans
 Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add the stm32mp25 compatible for the DCMIPP.
The stm32mp25 distinguish with the stm32mp13 by the fact that:
 - supports also csi inputs in addition to parallel inputs
 - requires an addition csi clock to be present

Add also access-controllers, an optional property that
allows a peripheral to refer to one or more domain access controller(s).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
v2:
  - move allOf after required
  - reword commit message
---
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
index 87731f3ce7bd..7b03a77adbce 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -12,7 +12,9 @@ maintainers:
 
 properties:
   compatible:
-    const: st,stm32mp13-dcmipp
+    enum:
+      - st,stm32mp13-dcmipp
+      - st,stm32mp25-dcmipp
 
   reg:
     maxItems: 1
@@ -21,11 +23,24 @@ properties:
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
@@ -39,7 +54,7 @@ properties:
 
         properties:
           bus-type:
-            enum: [5, 6]
+            enum: [4, 5, 6]
             default: 5
 
           bus-width:
@@ -50,9 +65,6 @@ properties:
           hsync-active: true
           vsync-active: true
 
-        required:
-          - pclk-sample
-
 required:
   - compatible
   - reg
@@ -61,6 +73,35 @@ required:
   - resets
   - port
 
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
 additionalProperties: false
 
 examples:

-- 
2.34.1


