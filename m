Return-Path: <linux-media+bounces-49166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003DCCFD2F
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D75A3054F5A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4B23346B0;
	Fri, 19 Dec 2025 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rYNbzDjx"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010018.outbound.protection.outlook.com [52.101.85.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32E21773D;
	Fri, 19 Dec 2025 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147433; cv=fail; b=Jh4C9ZQFJYpxriK0FQNEzptE+AcOZ6r2IbA2+bqHCeePopaprRu5rXLxll5I4y7Ebqy/TRj/JfILQAnSSw3WmJTGoYk953UizOPIe5SOlfFgYGYHxG4HzdEu4u/Zt4BErg+3erxF6GP97wrZYzU822F9PAhYcTLM1nj05Z3IunQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147433; c=relaxed/simple;
	bh=komnouein05NgnSxFFeNq9WZ40MaOLIuea+IgU/Au3I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQTcxBES4BZI0l1T56oZvUlSs8PbamX66ocy8Ack6JEWAy2xafweTXNUBPRXOHc44zeUPPi0gPltjgd3cA4OoGpVPCqQTjs/6CuWlFKNFgk7ySOafIQF2tOuvFWR1As0M0CLYjGkKfquMODDmMpFLJhLEJlvxyaXfE16mIqB8lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rYNbzDjx; arc=fail smtp.client-ip=52.101.85.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzyWR1LSairz7W00OJEObcyb7ARgaT/F9xNzU9bEypOSKve7/pohegfqn+c9ehtI31PXwIrzbs/XfzuaznCMhKbL/VyQcL9F5iKKfY89PRViB7xuW+RYlRvHVf8GPnHnB8/uFFB1ih3uPcACu8jo1YiN6vFrKz38KwcuIDDTtgWBjRKbyce/7WDlCNFi8KM+BrmQmaPEajkOcYvCOwC2o5ybjYedr4Mys51NzTnxMP6aI+TFFtudigHWSOynzVJYGO7WNvjPK6FJwAqx398EEmneYlLGEdQY7/vc2+/HY8G9YLRsN9pE1OlQyEeq20Xlh6ld5xFJmWJT7ulJYvWK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpOSGxKba2nn3iHvSfR6ZnSXkpqDM6o90+UrWXBosOc=;
 b=O1doNp8dAaA+iZHS4MnC0t9FnKVnmErnkIHR5jv3Z8R006yP/NJLa5GTtxVSP9BtN9lmRQ/BaiL5Ax2HB6QEjcAf59ImA4oWThWiOqqkly5bXSGNlY4fTaBm7bn0XT4IJf2z3cDNJu7MI6lk/A7DaN3v/4+4KcHrziEPIsPP/9X9nmCWcJvKRdRQtQ0QEQOnxXxdO5o4lQahJ6gSAIOsZPXoa/QcK8Kagh/TmPd8jvfRU0pXSkKp1N7isvNhe/NlPdEAk2Bk7zbNaqSuXZDasoZTJ5GR+S0/bkW5vgHslFIlezOXhj1QKTzpDM7NolQlzMD0TJdBUbumLXwi403x+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpOSGxKba2nn3iHvSfR6ZnSXkpqDM6o90+UrWXBosOc=;
 b=rYNbzDjx/vXzD3XXn9HT3ET5GykfXfEQLzhZimk5kE9AzC2HKnS3tDKgv3OxmtMNghnCowmmkLPuon3GF7v9y5oHq0p1x/ffrtkX6gQW4KrrCNgHjgKJ+JatNiBxbQyP6QTgO3/lawBKR3FjRdUDr/Vuu8gP5FdC7U0a1pOLc18=
Received: from SJ0PR13CA0139.namprd13.prod.outlook.com (2603:10b6:a03:2c6::24)
 by BL3PR10MB6044.namprd10.prod.outlook.com (2603:10b6:208:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:30:29 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::60) by SJ0PR13CA0139.outlook.office365.com
 (2603:10b6:a03:2c6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.5 via Frontend Transport; Fri,
 19 Dec 2025 12:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:30:28 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:23 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 06:30:23 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJCTuJm918224;
	Fri, 19 Dec 2025 06:30:18 -0600
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
Subject: [PATCH V3 3/4] media: dt-bindings: ti,ds90ub960: Add support for DS90UB954-Q1
Date: Fri, 19 Dec 2025 17:59:54 +0530
Message-ID: <20251219122955.2078270-4-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|BL3PR10MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: df157fad-3a86-4553-6b02-08de3efa64af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cJZjztl6Dy0Rfsr5wOZdbLYGiY09lQLk+Xjz4x7OnjvCS9V80kx+UR11Yy16?=
 =?us-ascii?Q?CUHzbslkC/T10X1pMd7+C86UJ7RerqtF37zLjdallrLkpGuV9mn9hBL55TXC?=
 =?us-ascii?Q?3l+y+2MIq96KitUIQJdjw4ROhmusI3rZ9qzrh+oJ1WpIlu0jcRVVGJNsMmoR?=
 =?us-ascii?Q?pj+genUbinN+/E1Dlp8AVGkEqCuOaNk5+7zTWER5pXmnskwF4ueCHgu9dyQ3?=
 =?us-ascii?Q?aiU2h6hjxFV7vjL7aBYfKdV+mxXX6zwOoY6krjDS28fLqbEZWitnUbvkeuNu?=
 =?us-ascii?Q?rSUwS94Fwkp84iUNExpqXAT7mrzJ0UmH+ixvNMCT4YMV+8sNS4AEkq2KlB4P?=
 =?us-ascii?Q?BWjHo7m+e9qjd/5jEEz1PC4IXCmKMwm+A4Y7KR20bI4yKYDD+fH+fDKL0zBV?=
 =?us-ascii?Q?rz59UfDP01wMSHX1JpOhIqcPLOlL9mzof4NGTwJEoK0nH6UjrP/fHWxNu2wz?=
 =?us-ascii?Q?D32K8pQN5THyq3CCMRh6/1aPDiLWLVCLYwFZJMniTxbGDng6Cxd8qx6XEqe4?=
 =?us-ascii?Q?/e7u9GhzoGxxfU/HTYctN/0BHFWg1JJ9Ke49sG5Iy0a5qbG2BoPUrEyMPErP?=
 =?us-ascii?Q?075w30XhGVVdexV3RLCPufig5FbzqcYs/a2cLsiStU6WD7qd+rsNPUkyHnp3?=
 =?us-ascii?Q?T7GoKcdMh1l+o3cl8UxTYLB1SL6ClHWrTTAiYU3fril/54JyeoJiUI+VeXOY?=
 =?us-ascii?Q?aQ71AJq4dEqusghcyUK89mfIijwxaJlqn0UDWKKP9gJ9gWkhj4UW0A38NVTP?=
 =?us-ascii?Q?GgpvwwZ0IBvqh4n9MdvXBrA5P2lTvjLW5naj1DlsTAcnqPV6NcwDbkb16+ll?=
 =?us-ascii?Q?tt6P2gZrKdSHD/Msn1g5wQ1dflIXoSA2TBYSSvjUa4hvb5nGJPkp4wAqKCaM?=
 =?us-ascii?Q?bftJi0vnlIkuIJfcyXmobt7fWhz+k4SJGVcPh9X/kMQdCjbqezi1HcUEcNhI?=
 =?us-ascii?Q?mr2KXcqROEO8xESKeFgfdgF9kWPiG4ImvYeXDUMMgMmDKOLWLTNihAwmOGwj?=
 =?us-ascii?Q?rmhHIgzTk5c1nSfus6fDH69FxnzREKqJbBDDClUAvtPEaLuS2IZ1fZczvSai?=
 =?us-ascii?Q?sfQ/6nLxhJk1IazxDL38wbzVAGnedXl7YZqdk66/rQzCRNNikm68Zc8Il/Jo?=
 =?us-ascii?Q?wvEIriiauaD8SDILbXPUHobFBt5DrC4f2mLAtREw15ZfXj2zPo0XVqNsfyRW?=
 =?us-ascii?Q?m9NsfIYDVZjbb4ORVYTyRugJIVBr+RnBxJ5Ddo3zADX55j7nZWrpbEnAbVvt?=
 =?us-ascii?Q?HrBwxW/YpHof72cBcCTtE7abSkFz5cS2fGCXDLW4BDyza1cbT/gnIaBxwSCK?=
 =?us-ascii?Q?pTUH1iIXUYvPuBNHicRM4Mo+7ZP0PGeSflaxAfwtzyMFiH+1909/Gc2WKFOX?=
 =?us-ascii?Q?+HkpXQkXpSdami3vv+k7B3V5rEk++Bt6Br6Tfubf8QddJtvL3JwLqgNvMoN8?=
 =?us-ascii?Q?dus0zcksN3ECJIYQsAbncyKYzPsR81HmjKgO6PzY9sYkjKgxQy7+k1XC3gbg?=
 =?us-ascii?Q?l1vaaQbTd3FIkWeTw3eGnJQUANpGP7BNPoQFcS7rxkGMZnprm4sB5qkHg9tZ?=
 =?us-ascii?Q?/xfLG1ursIqC/mSZDjs=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:30:28.4147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df157fad-3a86-4553-6b02-08de3efa64af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6044

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing bindings.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Remove the example added for DS90UB954, as it is just a subset of the DS90UB960 example. (Rob)

 .../bindings/media/i2c/ti,ds90ub960.yaml      | 113 ++++++++++++------
 1 file changed, 77 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index cc61604eca37..8e2b82d6dc81 100644
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
       Ports represent FPD-Link inputs to the deserializer and CSI TX outputs
       from the deserializer. The number of ports is model-dependent.
 
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
@@ -204,6 +169,82 @@ $defs:
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
-- 
2.34.1


