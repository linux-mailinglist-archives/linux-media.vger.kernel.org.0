Return-Path: <linux-media+bounces-48078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32836C9B1F1
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 11:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C37B63A7834
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 10:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA57830FC12;
	Tue,  2 Dec 2025 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HtwtOfyk"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292930EF96;
	Tue,  2 Dec 2025 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670958; cv=fail; b=AYS3tIAIkankd8lLTb6ru1Uwbg//Ab4PjpTfilkp5FdlJ3ZB7y9jUoV+TNnxAaG3MJbe/ZYsXYkc/BpaLAm3YUdH1oiZ9cotG9zX+s+zPFnTsNjSgmVxB67GDCp3cIJ/uI6KmxwSYLTL8POSuh2otelHkA9WYuMDFfsSE7hxbS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670958; c=relaxed/simple;
	bh=4lqiCQnvnhL4mDYh0+Wi5qdRm2Wmrv3eNg/xcTQoT14=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKKyErKxzFp26GcsH6TUKBo3WM9zG54JRVE0XjRmlypUdpgBH0WohVdbl3H79R507WaKjF9mSoTEpngyd/tZJL2sGdHy24mnc+lhWEMAAHnDXv51gFRcibRpbA+Xn3SKpIvErD58t0vXJODlln7Kgvm33hLbaiT7DNVSjEAod+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HtwtOfyk; arc=fail smtp.client-ip=40.93.195.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpZ4mgQnp/hkKv86g88lOM6okPFj5tlVPDBz7mDA0r3OCiYiT6S8SPxHStU6COZdlcYL5FvvrYGkukrUsHGH9yczgilXHCE7v2QXFcx+QGjOC1OvKoT5PEapMjA4RaDyEoMK1yGrBRadkY8fRJ8M5zzxFawRgPIDyGkavQ7548P3vTFUmkz/vQKzi4lnSvwTsfCRNHoZcczh6kfsf4/Ab12/XDknlIoU1Ao38EWLUsSFyPFgNPTC4d7HehRF1s+9dcZqvdBCEvdr3vkh+X5rBsX8fJHk9lt8U0/GcdhVCVWNPCTZpaLhGz0vdN8ISZJTNDxxThq/l++JOYzmnOyLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IDI9tsORHhspyAU3B31vwb48dBZqR4RFBd2Oiln0lA=;
 b=BS3yKcmIV85mfeZODBVqnQMLCsDVnG19clnupYLlHHJvYUJs8HTrAMr9VbrjFuTXEDbXYK2CKB18Ty9/lYA7rJfO5REtEdCI019GN1cD7ahjLMJZ9RTk84gZ99QLCNigr+6i+wqvoxUgnjNwwproTLrss5EwKJlpZ+fYurKx6yfai6h/coJhBzlsoyrLu+GUkGfo/pkku+hN97a+DaQyO/AX3rRS7jsebfFZt3EPGP/qBJaHsrFG9oXjKfyCyRgOKKrH6FizohIT0HNMmI4fhYNSGnMnReyTAb21uktit00Ow/9laRAL/1FbpGNacV2hFQZasIo/FQzrN46u+/W9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IDI9tsORHhspyAU3B31vwb48dBZqR4RFBd2Oiln0lA=;
 b=HtwtOfykWMByOxqSrRB1ESdeXgaZy+T42al83UqFcN7G0rhy6DtaGhcbV2NwdN8ofn94du+jCfGnSEb9hoCc6fcXJskg+VHI2GOzssbP7eXY+heBsKBiAafH+Kz2Hp43RkEO5/E3eveJqSp+gTM+0qrbihW2mt9149EQfe3edOI=
Received: from MN0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:52f::34)
 by CY8PR10MB7217.namprd10.prod.outlook.com (2603:10b6:930:71::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 10:22:32 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:52f:cafe::26) by MN0PR03CA0029.outlook.office365.com
 (2603:10b6:208:52f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 10:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:22:30 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:26 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 04:22:25 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2AMDKQ2072084;
	Tue, 2 Dec 2025 04:22:20 -0600
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
Subject: [PATCH V2 1/4] media: dt-bindings: ti,ds90ub960: Refactor port definitions
Date: Tue, 2 Dec 2025 15:52:05 +0530
Message-ID: <20251202102208.80713-2-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CY8PR10MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: 584088a1-32ad-4798-948c-08de318cb320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RfsQ6LQySL6YdHgnqa2C/PNWD6BrkzpsDB23HBu9SRkkQfMIgb6j1libcv18?=
 =?us-ascii?Q?5aG9lDVIjyXCA88UUHXJdPbHLZyHyeV1ZaQPKUeHL+Q3x1qrINJvVwbrNmdf?=
 =?us-ascii?Q?ZbiEtFPuoS8Hxfl7ohjzocRC0dsb5VJPegts0bnxn/QQg4h9G+6mffIk5CkQ?=
 =?us-ascii?Q?MReaaj8Z7RGsmqC+LAxnYN0rE7PjuacvuwlRXtlJsVTnfFPqJGFuSXWOU2hD?=
 =?us-ascii?Q?U1eBPUfudt6sgl1SRP5KcfoSH4Ae+hFSdzYqm3sWdbG8me01ieDb1PmIkffY?=
 =?us-ascii?Q?TDO81PTgf/+yG+yWEkGRI9m4aYTsB4F45gQi/HSHDAabGYfJbk5De3YDDSyD?=
 =?us-ascii?Q?R+U5LhLDdarckchoe8rbtTZuw2K5ytHc5BULI1Wlc7oYXo164HD1hSziTk2A?=
 =?us-ascii?Q?mjsz2noBitnAgfUMavUvp7jYYeIuZwi+UhUF3eHQnIvi651RwLbyGlgvs15f?=
 =?us-ascii?Q?460/vXHZqsB6MX3/BbPd7A5fFv6AoRK4IrLuSF2o4llZFV6TJsL9ZtFrsd2Z?=
 =?us-ascii?Q?hVHXGLQj/ZlRE6QEzqy/rR15pFvAlRTwHg8TlWK1S2PLi4MbHOUio5+elOKB?=
 =?us-ascii?Q?wRjJUQe6eYnnVOMM1UEHSFpKD0tWKm+fgT4Y8QsA8ZiRu9Z5hBSc0dvTV0P7?=
 =?us-ascii?Q?zsuKXDMr7FKlAxXB5xPUTp1SS350+ljnGLX2piJ5KLP3XA2ZLoc+Rqg8Z2XI?=
 =?us-ascii?Q?o64vVeF/ATi3IPODgGHRiMHsueuKRSFcI3JLlWlU96OCBRzI2F92tq1nMQ/v?=
 =?us-ascii?Q?6bvoxKpUqi9tPa7mn3e8pY2rnmaZ24RaU/PfZaSMlZ8RH1u3Rp9pFEG4vjAs?=
 =?us-ascii?Q?UfyZUtwiLqD74UD9dCom8XX/f/v67oLBKd6p0Ge0StG0EFtlsijSNFrIXbbN?=
 =?us-ascii?Q?yqxurFNn/H2J5HHYgZNE9aCIJWDGTDJz04H/O6VPn5IRqZpA4wQJD3mrmhdw?=
 =?us-ascii?Q?KcxhWMI9wShkt+23D9de7HNBKhg/ahNmg8jeykOCPYL5OxcoXu4dmDnLMvjA?=
 =?us-ascii?Q?KxzI88vIcI2ti7GqNk2o3KQ9dDGntFWek8HzKY+Qd0lhkrCwZw4KSeVuflkb?=
 =?us-ascii?Q?cE8noYil6GVbP+8lMqR7Bl1BsrODZtHXQMkZF8f9KS39lVi6LSa9R3aEJ9Q7?=
 =?us-ascii?Q?jAaDDNQnD1RgSFcrUxVGqvZK2ACpZoc26tNtR63eIcvMSDDGjRNanda9Bz9s?=
 =?us-ascii?Q?Ew+VVgMDaghFcMB203d0sEzKkPowDxssK5BppdnyBgRGQvM8WyhZF8FT28GM?=
 =?us-ascii?Q?3mxCMMXot8pp3kv6LM0L8yeIjS9vnXRL5OUj9CMH1WvuQEz55UFDISTDG9CM?=
 =?us-ascii?Q?U3wzePlcNChZ1iDPNce8+xF2MAdbD2MyBAsp+OCidDwzOFQMhRNYvEQhnkG8?=
 =?us-ascii?Q?lukgzFtSuMGM8mQkyCYb5BXmHfrkwn3gA4NHA8/eaLo2DTF1ZvMyfX2DOqiu?=
 =?us-ascii?Q?0843A5NzJDoRLSUzA2SBYDolzwlGVZN4ArSr+wjQNRehev2mvYAmBXJf3rCh?=
 =?us-ascii?Q?NE4Js6G3afoNExK288oVoA4OB/ZCeahwvUHv+4K1eNvXTBkS24Rj+syxvtk2?=
 =?us-ascii?Q?o3sEqBXlJmYbwA/MZpI=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:22:30.2559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 584088a1-32ad-4798-948c-08de318cb320
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7217

The current bindings duplicate the port definitions for each FPD-Link RX
and CSI-2 TX ports. This results in a large amount of repeated schema
blocks and makes it harder to extend the bindings for new devices.

Refactor the bindings by introducing shared deftinitions for FPD-Link
input ports and CSI-2 output ports. No functional change intended.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 .../bindings/media/i2c/ti,ds90ub960.yaml      | 120 +++++++-----------
 1 file changed, 44 insertions(+), 76 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index 0539d52de422..6a78288aebaa 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -125,102 +125,35 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      Ports represent FPD-Link inputs to the deserializer and CSI TX outputs from the deserializer.
+      Their number is model-dependent.
 
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


