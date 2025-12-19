Return-Path: <linux-media+bounces-49164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7BCCFD35
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D108D303498F
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5D632BF52;
	Fri, 19 Dec 2025 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="m7JEGVJy"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012029.outbound.protection.outlook.com [52.101.43.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BCE32AAD8;
	Fri, 19 Dec 2025 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147415; cv=fail; b=fSrHXgfpL0JxXmmNtcdYpgToXIYTsTms5/8A7glHD66C6aDvrsXFgiz3Y2N81hfYrD0SKt+lms0kdSNRhXzjSp3TqFNPPSspXPDBm8/UeGUXcxwSxl816SNgYcPsVbDasXfAzG0tTalqykbpX5qYg/SAd+dIjejP6PMyE4tY90Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147415; c=relaxed/simple;
	bh=3VN1i/Q2siHZ0hFFqe7Xzb+yCAA2eSJZQPUtAjlv81w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d0bemwqRa0BivT6zbB1cF+h39RoWhWrlunu/LEkDsJ2acy3+71w44WFjZtczP2lHs8vdHemo6hbtkeebCH3i6qq4hm+zmi/jg/5hFQXbgoc4Mw1KPx4as4fAe+1hTbJK/V+zGNj3CnF2XOICU0/wtbNTs0eav4wq3VFgMm/O3eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=fail smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=m7JEGVJy; arc=fail smtp.client-ip=52.101.43.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACQggiRxKKZqqaq1F8tcI6IFcIQzaK57RChS/MrUiUfN+28t8U5IGAyyUAKuyNTF53pDc0qZsa7EijWcWRIjGRzT0m0kr2jSkX62DlN8TFJIwO0hodd6xDeGdgfUAu6b265F8+rFlI+stttpZsRWIAmMgHy9qVc0Pmpe3LG5TzlkCn9OOnv4U993FNXOpxOoCC4toWGk7UxIynktCQhgtXaJitlJk/DKCvekDF8wpr8XGvDrIpX5EjuZotrAs0B0YbT+senSpViXi+W7y9WPzZDXMP4NTvHMlW8a8WqgyzkY4zrvSf1qMbnt6S7mNH5LJHn8TS6IEiV2SZ8oaIEfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYBVZFe4+gFgdHgkN9SPFIKpcR5SIl7BwFiUl0CmPoE=;
 b=q47ZW2Wty1/GCNXISLT6JqQUgAnor6HmT/9w2emSneXmOavkuCiP318FfSq8tLrZ9RFU7XgpB0z4OgQJ4CicX5m793u1Dno8+UYiqfrXkdXSUdLRLCtzG/fjs6gOXYkJL4LWdNIVnFPxnz2QYHB8KI9Fe6W0AO1MA3xTP5iViaJ2C0hV84A5iPDGTccn2M+751V/5NBMrlUVQozUq5pXLo64kcciC546RtoJsHHcbtZE+2g3AqjG3ZKDs1UA1HtLliVdIRTU3+7ADdBtMxLXh/gSLkyv+6BBa1apmSQn8sK+p5s8b1fxTjDUg3/TCX1RHnkzdhV6aRi8oJnPOzUpbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYBVZFe4+gFgdHgkN9SPFIKpcR5SIl7BwFiUl0CmPoE=;
 b=m7JEGVJypYIcrArV8OWHmvWQ/oLYoP29wwoNqJA+Y6skGKwyDaPTeEu8rQHUN387gpbnIHdGDFpVFzjrGwL836laZURMM3X2tbpfL6EAz7z+ui3s7WBoPzGJzDco2F7SuhPSU01lRrUErqDy3tVUmJHIgHz9Ocj3XThNzA2nujM=
Received: from MN2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:208:1a0::15)
 by DS0PR10MB8126.namprd10.prod.outlook.com (2603:10b6:8:1fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 12:30:11 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::eb) by MN2PR07CA0005.outlook.office365.com
 (2603:10b6:208:1a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 12:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:30:10 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:10 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 06:30:10 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJCTuJk918224;
	Fri, 19 Dec 2025 06:30:04 -0600
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
Subject: [PATCH V3 1/4] media: dt-bindings: ti,ds90ub960: Refactor port definitions
Date: Fri, 19 Dec 2025 17:59:52 +0530
Message-ID: <20251219122955.2078270-2-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DS0PR10MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edb208e-a34f-4f66-08d2-08de3efa5a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HsZ6KlcpMTv58cd2RdZvZK7Iraurz+arssU7sDJ/lhCZ+7PuJJ+3i8fLPd4D?=
 =?us-ascii?Q?hO1Wr8i85p3in3etit/t+XCSWZYSJkW+88v+n1iH0+71lARVmKWAy4JhrCSo?=
 =?us-ascii?Q?x5KfI6hKaG2FmjkCY/D53x+Ya6iLOSh3Sbzr1R8trDo1tnDDIqE/szInvBHi?=
 =?us-ascii?Q?4Xjkm+v1IOlhuIJTM31A2VGP2Ua4uzEbjccOXshmC8v/eB23m79EIPFe2T4D?=
 =?us-ascii?Q?DOvU88MLWTfdbAiQhMRQEo5hbSjmb8ceQTtspU7nmJzd3AcfOlwCLNyfzeBx?=
 =?us-ascii?Q?WM08LB/UDt+HE/xUXBSm3KB5BzTVTJa9TBXZBlRY0+Md+OgWR5KztUuKML5D?=
 =?us-ascii?Q?/b6FDZ1RKGOi8Xtt+dM3j8COX8It+mLE86wCEJG+Du/NFSuKwbHsdBpXfqV4?=
 =?us-ascii?Q?9uerVRIGp1m6jewa669OyOESYXckQyLEfql7ukY2FlpEGA6PjmDL15SrPOXK?=
 =?us-ascii?Q?uMeJJgM4EvQvpczaAhZmcEwdcAedWCgujcXNi8VbrM/29/dJs3ykVXSl3mXu?=
 =?us-ascii?Q?g838Iu8ezjAiDttgnN7WUOGhn+T2Z6KzXiM3s/oEiwgHvsG3uxCFoG0vk0lB?=
 =?us-ascii?Q?g0QUTRczt1rvk1AuuutUmaIzwGoXBhzzhRCPye5XpFWRLAcd5rSssRV5DY/a?=
 =?us-ascii?Q?TPWryaTjzb5xrJKcP6L3lSGX/sfhKk209bPd6k3wwO731Rm8Y1RGfNIV0I/C?=
 =?us-ascii?Q?vJBPTM3noeV0isCV3YdKrvtqqqKHhzbwHZXe9s/yND+5lgGOzQveeFouXVoM?=
 =?us-ascii?Q?mASP7rYBeLfHYjed6n4Q8fpHqpe+xaUhrYmJ3RU3XkP5v5qmza5dhd4H9XNg?=
 =?us-ascii?Q?YlO7SoWhj6qd/hkkzDykosQDLSxE9vQwE2kzvcY+MjqbzjYCeiwkVet3ZG05?=
 =?us-ascii?Q?8GIwkelxndGYFNoWwTGN1H9Sf4LwSfRVWaInnBDKsI+IyrR1AxHxA6CXUfwk?=
 =?us-ascii?Q?VW70lvKYUG+eQPMa0dkdjcxAJhPetm8jS/s+NzBYojd/NR4mBxuwwDwhNbnH?=
 =?us-ascii?Q?E3/ioG3llvrN87emPS50vnhXR5t3Co5YTkbqSY0MM4+44BzDfb+q+4E1abWn?=
 =?us-ascii?Q?FU0DEjmEjkm7LahhMmH+qdGVFmY9z37+qbXcBdWtnJMarus2O/SZ9j4+rbsj?=
 =?us-ascii?Q?fUrBe92yPu5roYX0ZIBlTcmjuqKR/xdOmwgp2wn1wgmxaAQjQH4ejKITnYik?=
 =?us-ascii?Q?0FpEgG1VFgHTO7lm2xdkQb1Kk7MGRbGUAXGymAg7pZvZMuteLHjK103YYQht?=
 =?us-ascii?Q?rZ6vqn1UMbSPCafrgbM+ciizbMdST6UG0y3vOd5VoqbCnzs/hmyaqWamj42h?=
 =?us-ascii?Q?8q4y3+1gBI9VVz2W2wn5MBFuIpA0bWH4wQkKzs8mULnaClbCjP2H9qvvFtdK?=
 =?us-ascii?Q?7ZwSmfESN+F0YwYlHNUEwi77F3nxBTVkC03Jzk6L15pRfUV4t1iKpY7XHMgJ?=
 =?us-ascii?Q?zbikbI5zAR5poWnezNYVNAugQYBhYmQT9LkWDurpvm1fiqrmTIhyLsjuXJBo?=
 =?us-ascii?Q?4DFqcjkhR+ftQzl8N5/kMrkwNSlOmdJ37zNDZNBpPj3QnuoFYIBobKEdMGRp?=
 =?us-ascii?Q?4JTsuXIMiodIqxYUjG0=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:30:10.8606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edb208e-a34f-4f66-08d2-08de3efa5a3a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8126

The current bindings duplicate the port definitions for each FPD-Link RX
and CSI-2 TX ports. This results in a large amount of repeated schema
blocks and makes it harder to extend the bindings for new devices.

Refactor the bindings by introducing shared deftinitions for FPD-Link
input ports and CSI-2 output ports. No functional change intended.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Remove the | character from the ports description since preserving formatting is not required. (Rob)
- Wrap the ports description at 80 characters. (Rob)

 .../bindings/media/i2c/ti,ds90ub960.yaml      | 120 +++++++-----------
 1 file changed, 44 insertions(+), 76 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0539d52de422..cc61604eca37 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -125,102 +125,35 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Ports represent FPD-Link inputs to the deserializer and CSI TX outputs
+      from the deserializer. The number of ports is model-dependent.
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 0
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 1
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@2:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 2
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@3:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/FPDLink-input-port'
         description: FPD-Link input 3
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-            description:
-              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
-              hsync-active and vsync-active must be defined.
-
       port@4:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/CSI2-output-port'
         description: CSI-2 Output 0
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-              link-frequencies:
-                maxItems: 1
-
-            required:
-              - data-lanes
-              - link-frequencies
-
       port@5:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
+        $ref: '#/$defs/CSI2-output-port'
         description: CSI-2 Output 1
 
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            unevaluatedProperties: false
-
-            properties:
-              data-lanes:
-                minItems: 1
-                maxItems: 4
-              link-frequencies:
-                maxItems: 1
-
-            required:
-              - data-lanes
-              - link-frequencies
-
     required:
       - port@0
       - port@1
@@ -236,6 +169,41 @@ required:
   - clock-names
   - ports
 
+$defs:
+  FPDLink-input-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: FPD-Link input
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+        description:
+          Endpoint for FPD-Link port. If the RX mode for this port is RAW,
+          hsync-active and vsync-active must be defined.
+
+  CSI2-output-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: CSI-2 Output
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+          link-frequencies:
+            maxItems: 1
+
+        required:
+          - data-lanes
+          - link-frequencies
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


