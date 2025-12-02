Return-Path: <linux-media+bounces-48080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C159C9B1D3
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 11:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 10AEE346C23
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 10:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE51530DECD;
	Tue,  2 Dec 2025 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rhEQteIN"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F830BF52;
	Tue,  2 Dec 2025 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670969; cv=fail; b=achw47e4v8GVU/XlOviR6Lf6D9J6rycKXqUvBatEOqVcwOolNTtsT/OVhsXXLMu5v3L4Fdr0veAs8rGT+px5/Ms5IQyre0xS5wwf0ig6vlnbdvWSHlXSfFYmSm1cuYldlM949NeaRoJrE2JZTr1fW3Mma438mK5FT+JfdjVCG0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670969; c=relaxed/simple;
	bh=Nich7ALe0WQy8yb0zmOhyptoLTZenzb3fdFi0Ub4NlU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nGoG9SrA04WGjk6ulSN9nTAX9grzkrOr1XeKuD8LxXjCHkZiAgj0DXy5jqpWZwX80yS7F+3lekvSabpCA/BOM7X1B5j5IA+dMYo/5UvfmJem+sSVdz8m7I/q4kU171T/x6B3DO61MfymRBPnlAkyqdu/vdQ8RjsN7RWyYrTSMPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rhEQteIN; arc=fail smtp.client-ip=52.101.48.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pibGIK3JlrC2jxkhXD2Ktxh+hWHKUK1xhaZjAHL9PaufxvOI+gEIL0fyw1WkFgW5/Ga1b1bb17QKHyG1ZmrtJaMkXDjLUPpNCguRWfytdBFkGmwSDAHi3IF3ARGYQW7Tuj5cE98G6PU0kHVCi64/nrH4gLnUIbjEKvQIQGOsP70TwtihiHD3n3SKdm81GS3Uk8AlJfNywyI1t9V3GaeZm6a6G6b1ZIPJOwqYWXIGNfHR2gdIoGMWnI7RWZOH9ZmaclYdqnJfIts495qFfS6jNZNIALK0EHC+bFpbhKB0VPdwZXEtN8xz6r5vPcPdTjZQ/UA/9+2E0zFvrA7elaJwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijK1q6UU+CO6bJpglSWIJvFC+zEtOCwZB4GZER4qmxM=;
 b=xnCTcIJTw84yBjzfKRDbZa/yxlLOG+SVdafFPVRVAiEQOqcSuAcpXURKitK9XtY79J0anERQ9tG8mNGsbq5pTcdkvGcfHJIXw7bwq8SegoHDBkfL1cnBsBZp3uSOqlP+pJ5pLA8ocrC1/4NsNN4CHZzVCiP8XobzXaiQpK415vYLZdxnAYSiXVMxWQpF2wp1SVIrWBuDpyRsvgDcVGmR7IB/+Rjo96hy4giMMsr9sws/dzsnxTTelLujyOxqUwnU8dZZS4HACD3FEdriY5Bo4ZG7Hk0rg4ih2NuHnSuNicJPUDqiGsa2jxXhMV8E3pDxi7TIlFfcVYH4PIQDOGyuZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijK1q6UU+CO6bJpglSWIJvFC+zEtOCwZB4GZER4qmxM=;
 b=rhEQteINthu3x0uXe/O8XMfiPgTSQsV0E+NdxrGfOarLOzJrThzEeVJxHuCL+jBAVyUMXJ0pWZmAULFM7KC/x6qcnusqtd35w5XbgFzAGlkkZIs6Waq9s/+krs74GPphYXQLcSUPA9vxsPgAABVtWvk4U8QTElkefSjs2ygjfxk=
Received: from BYAPR07CA0054.namprd07.prod.outlook.com (2603:10b6:a03:60::31)
 by MW4PR10MB6322.namprd10.prod.outlook.com (2603:10b6:303:1e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Tue, 2 Dec
 2025 10:22:45 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::d2) by BYAPR07CA0054.outlook.office365.com
 (2603:10b6:a03:60::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 10:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:22:43 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:39 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 04:22:39 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2AMDKS2072084;
	Tue, 2 Dec 2025 04:22:34 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<y-abhilashchandra@ti.com>
Subject: [PATCH V2 3/4] media: dt-bindings: ti,ds90ub960: Add support for DS90UB954-Q1
Date: Tue, 2 Dec 2025 15:52:07 +0530
Message-ID: <20251202102208.80713-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202102208.80713-1-y-abhilashchandra@ti.com>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|MW4PR10MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: 41dbfcfd-75e9-4484-70e3-08de318cbaef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9fXo2l0w3FyI8NqZNSvpLJauHqAnHWUUO4o2hk7dFxLlZbNwkraE71jXfVtN?=
 =?us-ascii?Q?PbNakE3rha3lF5km36xLWHNdxCgwJWTMFnxVBuQDQk3jbI/8+qKumHbuVK2M?=
 =?us-ascii?Q?P2bnr2jXVqpKSAtYBptVoeWVOlx5wINC2oirTHgxwSbSaofVLlNXIyNXTrn4?=
 =?us-ascii?Q?6N1OcvSUoEbsU32RgROvz3F7CLuqxR+9OnHz52Ts34O5n2WLXhBfpCYlLUmM?=
 =?us-ascii?Q?kN7tb7o2CeRtF4MnLLKOaPx1DLX/bC+7VvrP7crMmDrTyisg8DDIkLMHOXxW?=
 =?us-ascii?Q?OXsUjHVvvToP/fW+ltHDU37e9YT3WbwcVOa1IZvc/7H0y0yney9qqX7wiP/H?=
 =?us-ascii?Q?e6WFzeKpkuiH3EVCUkPGSzN/pMQk9QJdPOacV5vj4IAbXyoBad9szt8RNeg2?=
 =?us-ascii?Q?3I+RnFR0YK2OAzIhrx45Qd9lUW+vjW+LNRux7grS46kWkri6M3rAhaC/elPv?=
 =?us-ascii?Q?DuUXzhhYJRZEU0cLmZnvhfJ2TuRIo3BDJ5UP3jAm5NW+n+o7Sh+xpUq21aLW?=
 =?us-ascii?Q?7qTc5BwTF/F11HSyc9vKuDtwr3/7YYtqGc5byF+IIODHCNiDAl7jYYjmub2n?=
 =?us-ascii?Q?WYBQiq2hhRKBRxqfN77Sje8f2ZLfx4Eovtlr0Pu7ji++SSRnq04UiIhUUfjw?=
 =?us-ascii?Q?bVwWrM/q2JyLzOF8+JaH5u1av/dylZq5BTqmxMFjWNSSPiok7mW/lExHmR6z?=
 =?us-ascii?Q?6mam3pLgQp3qL9FbRAgQo09aAcRQC7XkJtyjQ5ypIeeTKab6AfZ0aPjZF6RB?=
 =?us-ascii?Q?wF7Nqf0qodp8xX9nDEQ7xZ/8TlpxrTRh4kx/hCcAUBTg4Vw3JnObKJX7U/l9?=
 =?us-ascii?Q?LY6GCrJeeffvG1tZGcIk9DkdvKHqQp2R7GP+EY/ihH6+oafNMG9tu3o48iOm?=
 =?us-ascii?Q?kwMnslIazzBuufLNSiRdTTmoiCLnPVjwX2/dqCQNKPfWY8fNjQJn8dFZQbWg?=
 =?us-ascii?Q?vScaDaA0kGC8gf23fRTXQ5UkM7cxCKc9a6cGwdlDFcwpUeD5gHkYcZWCRh0C?=
 =?us-ascii?Q?CSZBMRj/56S9kXSb68KeXEOeaqwR/yQyBHRhr7L6AXW7JEm9pTVc67SMdNDC?=
 =?us-ascii?Q?gWbC/NlBcwti3YbTqSA/tDrc3/5ZaCCtV9Ryn1bhThBH1d5L8+an7FS0hOUc?=
 =?us-ascii?Q?xPcmCS4AQ0wp2YGarDH0XtJqAlvawt39QQrqCWJ/OkL0yV2fa3u2KWnh3/I2?=
 =?us-ascii?Q?HAMYxaJUbMT/bQCv0y+ZnCcNOhgak1Prg+6IIOkquRk4UyWZGs8WDzQ90j/L?=
 =?us-ascii?Q?IDbuNmUhrT2Ip2XG2FdN2M7R7dbqjWb9mGZrzNAxKcsTycOBaHvMPlrnZjvV?=
 =?us-ascii?Q?AkL7k+bOodPeK9+HEO0XQbzQvtuCgngNof7EATK8V1wsC6n/eGDsWzhNC0er?=
 =?us-ascii?Q?TVeFFg3g2yxMJtpJooxjbjIHO4MF71DNDUcuddVAz066zK3+0GaIzrXi6vEd?=
 =?us-ascii?Q?WzoJsgbAeBux6Wm0AVA15SjJWtaNVoZxibiWh9dSmm7e0P1/zAnyDNRLzPdL?=
 =?us-ascii?Q?vR7kjprFK7YN/auPSACD2mVcg6OdT7NPj0Jf9xyCNca8nS3QIi90BF1QbxyM?=
 =?us-ascii?Q?t/9r78p524wSf7wm9Eo=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:22:43.3398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41dbfcfd-75e9-4484-70e3-08de318cbaef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6322

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing bindings.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../bindings/media/i2c/ti,ds90ub960.yaml      | 300 +++++++++++++++---
 1 file changed, 264 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 6a78288aebaa..1ef977c2e479 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -13,12 +13,10 @@ description:
   The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
   forwarding.
 
-allOf:
-  - $ref: /schemas/i2c/i2c-atr.yaml#
-
 properties:
   compatible:
     enum:
+      - ti,ds90ub954-q1
       - ti,ds90ub960-q1
       - ti,ds90ub9702-q1
 
@@ -129,39 +127,6 @@ properties:
       Ports represent FPD-Link inputs to the deserializer and CSI TX outputs from the deserializer.
       Their number is model-dependent.
 
-    properties:
-      port@0:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 0
-
-      port@1:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 1
-
-      port@2:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 2
-
-      port@3:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 3
-
-      port@4:
-        $ref: '#/$defs/CSI2-output-port'
-        description: CSI-2 Output 0
-
-      port@5:
-        $ref: '#/$defs/CSI2-output-port'
-        description: CSI-2 Output 1
-
-    required:
-      - port@0
-      - port@1
-      - port@2
-      - port@3
-      - port@4
-      - port@5
-
 required:
   - compatible
   - reg
@@ -204,9 +169,86 @@ $defs:
           - data-lanes
           - link-frequencies
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,ds90ub960-q1
+              - ti,ds90ub9702-q1
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 0
+
+            port@1:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 1
+
+            port@2:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 2
+
+            port@3:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 3
+
+            port@4:
+              $ref: '#/$defs/CSI2-output-port'
+              description: CSI-2 Output 0
+
+            port@5:
+              $ref: '#/$defs/CSI2-output-port'
+              description: CSI-2 Output 1
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+            - port@3
+            - port@4
+            - port@5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,ds90ub954-q1
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 0
+
+            port@1:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 1
+
+            port@2:
+              $ref: '#/$defs/CSI2-output-port'
+              description: CSI-2 Output 0
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        links:
+          properties:
+            link@2: false
+            link@3: false
+
 unevaluatedProperties: false
 
 examples:
+  # Example with ds90ub960 Deserializer
   - |
     #include <dt-bindings/gpio/gpio.h>
 
@@ -406,4 +448,190 @@ examples:
         };
       };
     };
+
+  # Example with ds90ub954 Deserializer
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      clock-frequency = <400000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      deser@3d {
+        compatible = "ti,ds90ub954-q1";
+        reg = <0x3d>;
+
+        clock-names = "refclk";
+        clocks = <&fixed_clock>;
+
+        powerdown-gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
+
+        i2c-alias-pool = <0x4a 0x4b 0x4c>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          /* Port 0, Camera 0 */
+          port@0 {
+            reg = <0>;
+
+            ub954_fpd3_1_in: endpoint {
+              remote-endpoint = <&ub953_2_out>;
+            };
+          };
+
+          /* Port 1, Camera 1 */
+          port@1 {
+            reg = <1>;
+
+            ub954_fpd3_2_in: endpoint {
+              remote-endpoint = <&ub913_3_out>;
+              hsync-active = <0>;
+              vsync-active = <1>;
+            };
+          };
+
+          /* Port 2, CSI-2 TX */
+          port@2 {
+            reg = <2>;
+            ds90ub954_0_csi_out: endpoint {
+              data-lanes = <1 2 3 4>;
+              link-frequencies = /bits/ 64 <800000000>;
+              remote-endpoint = <&csi2_phy0>;
+            };
+          };
+        };
+
+        links {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          /* Link 0 has DS90UB953 serializer and IMX274 sensor */
+
+          link@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            reg = <0>;
+            i2c-alias = <0x44>;
+
+            ti,rx-mode = <3>;
+
+            serializer3: serializer@30 {
+              compatible = "ti,ds90ub953-q1";
+              reg = <0x30>;
+
+              gpio-controller;
+              #gpio-cells = <2>;
+
+              #clock-cells = <0>;
+
+              ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                  reg = <0>;
+                  ub953_2_in: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&sensor_3_out>;
+                  };
+                };
+
+                port@1 {
+                  reg = <1>;
+
+                  ub953_2_out: endpoint {
+                    remote-endpoint = <&ub954_fpd3_1_in>;
+                  };
+                };
+              };
+
+              i2c {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@1a {
+                  compatible = "sony,imx274";
+                  reg = <0x1a>;
+
+                  clocks = <&serializer>;
+                  clock-names = "inck";
+
+                  reset-gpios = <&serializer3 0 GPIO_ACTIVE_LOW>;
+
+                  port {
+                    sensor_3_out: endpoint {
+                      remote-endpoint = <&ub953_2_in>;
+                    };
+                  };
+                };
+              };
+            };
+          };  /* End of link@0 */
+
+          /* Link 1 has DS90UB913 serializer and MT9V111 sensor */
+
+          link@1 {
+            reg = <1>;
+            i2c-alias = <0x45>;
+
+            ti,rx-mode = <0>;
+
+            serializer4: serializer {
+              compatible = "ti,ds90ub913a-q1";
+
+              gpio-controller;
+              #gpio-cells = <2>;
+
+              clocks = <&clk_cam_48M>;
+              clock-names = "clkin";
+
+              #clock-cells = <0>;
+
+              ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                  reg = <0>;
+                  ub913_3_in: endpoint {
+                    remote-endpoint = <&sensor_4_out>;
+                    pclk-sample = <1>;
+                  };
+                };
+
+                port@1 {
+                  reg = <1>;
+
+                  ub913_3_out: endpoint {
+                    remote-endpoint = <&ub954_fpd3_2_in>;
+                  };
+                };
+              };
+
+              i2c {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@48 {
+                  compatible = "aptina,mt9v111";
+                  reg = <0x48>;
+
+                  clocks = <&serializer4>;
+
+                  port {
+                    sensor_4_out: endpoint {
+                      remote-endpoint = <&ub913_3_in>;
+                    };
+                  };
+                };
+              };
+            };
+          }; /* End of link@1 */
+        };
+      };
+    };
 ...
-- 
2.34.1


