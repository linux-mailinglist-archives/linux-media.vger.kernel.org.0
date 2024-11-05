Return-Path: <linux-media+bounces-20879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6377B9BC789
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ED36B22BB5
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB15820103F;
	Tue,  5 Nov 2024 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="h75RoMIT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E01FEFAC;
	Tue,  5 Nov 2024 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793169; cv=none; b=j70PzV20U6q8QfOIJfmYdXJIQAgPKwigds/FlIqNKJmuEpff9ag0ewzFabU4N6xYic1SorhBZ4ZIF82+J5rdzaTT1yal+R88OnQuXtLjgHt920xL39Ouvhf/MkJEXTmdkUpHuy9hFfMXDr3rvGnHqmXR7wcobcTitbCjLfLiN8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793169; c=relaxed/simple;
	bh=vdyHSmHFvDc9twKJwiPBujvnXDLawADf12qsuOd+aLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Drkr8/OB6t/v+A+qKAzLvtn2gyDw4E886VYWDmYrfagd1U83kbwHeq5JrzYYJNEpHGGTS/kGHAIZS69y2nRe8E+0OGQw7xv3kj4A8q7JhB7gHaUsuFGatvsaoGh+AYjuUTM9/sD8keSg0gYJ1BizTJKe2wk0NHKb3DuMs3WIUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=h75RoMIT; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A56uQpA022315;
	Tue, 5 Nov 2024 08:52:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PXYsh4+cHK9hqfvNP3YcsqDOvzA978FnhDRsJy2BW4U=; b=h75RoMITGbMYJj+9
	hRHrpc5Nkw697o+iL6nBexnCigwF6TEs3wUTuG8VQ6qKcD5BuHIQEVDMyMUZuar1
	iPxz/kupKp1nxA9lCN/SSG26ZB6jA6hhgyAvCIxrsUywyYNFW4hTyap/qo55ilxF
	Bd7pdDaqPVnDaW1tWcDf+4zjiCmBIjnTXR3UkvMgFt35fGyT5a5jtvMUsOs/QW2A
	d5KOocUvaxzkRSRK6/HTOLw0zag9W0Yyghr0TodXTcdro2JdzJQKfGsygu67hIji
	A6ZwUPrMc8J33sMYUX4n6v3cHHR3Vwf1wAwiOyBPnUhOvNLN1Fl7ZUINh8m/qf0b
	uEmzng==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbtudg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:52:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2565840044;
	Tue,  5 Nov 2024 08:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C18B0250FC9;
	Tue,  5 Nov 2024 08:49:35 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:35 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:15 +0100
Subject: [PATCH v2 12/15] dt-bindings: media: add the stm32mp25 compatible
 of DCMIPP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-12-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
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
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
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

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
v2:
  - move allOf after required
  - reword commit message
---
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
index 87731f3ce7bd528840d5fa85a863dbdfcabfad3f..7b03a77adbce8512f622fc992ef9913d52880f74 100644
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
2.25.1


