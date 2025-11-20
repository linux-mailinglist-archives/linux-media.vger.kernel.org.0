Return-Path: <linux-media+bounces-47462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9F5C730C6
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E0757351D03
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A27B2F6939;
	Thu, 20 Nov 2025 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K675UZjl"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010028.outbound.protection.outlook.com [52.101.193.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91F309EE8;
	Thu, 20 Nov 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629870; cv=fail; b=EQkWhov32ngfByIRYP2wvpK1sOg+V5gFnLdQQzEfarCVVgZMtkEeIMZVUSLhIKN6KHLs1WCk6+nJocj1XcUN/IlE6nPX1ZId+VLh65f2cy99dot53JbjaWl5j1QlyDloIHef7lgCHlSgqzxd7hZsz7jHB8qsrbLc1INaL8yPCeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629870; c=relaxed/simple;
	bh=AREUbUZ97m/Ush2THtrOr4NvxuhTq60IuHK/adNiP4s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEIEHqNBGxQv8KVP8R/OX14W9aggGb/4Pjyx4zK9o1HZ1mU0A0vFzJu9MFPnM1x7lni7f0kzOFE3UtAurRX486Xez8TYRzhj0l6IBIwfF271bYfirkZJm7I1ncu7b6bA/ZNgCjoKPr6pyvsYWnY0+p7N6QHUCZIJdWbPdbeOjpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K675UZjl; arc=fail smtp.client-ip=52.101.193.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrShBzMI0DFWNsWRH5gMHjxFZgOGi+HvVXfeZtUlmy0JL+iBcpeG2/ddUJCVlPzF8ut6dPHT/9eCqZmSvSSoYsjlYciUlzDJPp11DpA5RN7DolE6/UtFby1PBGamiarBA3vhiY2ar+TZFmAy94ueGk8YBcoQ/7XCq3avDOYCH40nEtybz4fNlyi859mopHQl5lQLL4AFc4LJVmEMcT7O0v9vgfnmMJXC44AyK9Y1alC2otO9qCQjROszyYjd9HOvTgusEjjNcJV6pdyAS5UzC5rECQMuzfYl4Vraq7SZfDNHBQyiV3DQ4bdXrd6Mv1KySz/uTJfSlZGW9AHDhYP41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2USt/DE/jo6NQKgpw8a0ISu46QEyNdfDD4TGD0TqdA=;
 b=IqTnJL1i4leuGAeyHdfCA5JcmVw6nrWZ+cSkzCmEpikI4aZbqKcisrZpRKDmJbNZvF11eOkJrHY+G8nv1EVd+JwAmdUdZg+8uQGkHWNlnlgmp+dGJc61rOCm48nBa5Uw6lKDX9iatJjxWdtFj8BURuU6PZRavuHr3uh8QcpscpHMRRL1ej2TiqR3dHQj8Ce7HlYl3VMNHkdfduy31gUlJXGuSYg+SEYgz7Hv/K8H8ga3uVB19eo0nRDMJiL72FEsm7fRYW53LlbNKcbdic3QQwzK4MCiOxlOEehDwLfUFsJs454IWMTnnHEfJbblTIwciJ19NmxMgGVr0tNRuDnhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2USt/DE/jo6NQKgpw8a0ISu46QEyNdfDD4TGD0TqdA=;
 b=K675UZjlM1Qwly/4PPEshBeh6ZlHRAvY5rNsEHBXsyC3Vxv5XuiXm9RsWAv0kf6j5SZA/xfOraDqPQ/qywXYIz4ep+XgqnW9+Qc+k/pCIPADJ6PVQBkno9GbxIsAb8YvftIaE8608TAKTNnXO9zJuNNA95WmV5BdlKeBZicTY+4=
Received: from MN2PR16CA0065.namprd16.prod.outlook.com (2603:10b6:208:234::34)
 by SJ5PPFD6523AA75.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:11:02 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::cb) by MN2PR16CA0065.outlook.office365.com
 (2603:10b6:208:234::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:11:01 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:56 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:10:56 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9AXWf3413879;
	Thu, 20 Nov 2025 03:10:52 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
	<y-abhilashchandra@ti.com>, Sukrut Bellary <sbellary@baylibre.com>
Subject: [PATCH V6 3/4] dt-bindings: media: ti: vpe: Add support for Video Input Port
Date: Thu, 20 Nov 2025 14:40:29 +0530
Message-ID: <20251120091030.2081594-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120091030.2081594-1-y-abhilashchandra@ti.com>
References: <20251120091030.2081594-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|SJ5PPFD6523AA75:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de28f36-f6a0-46eb-4ec3-08de2814b9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qkjbvcuspIAAENvS5gGKZABRQkU5gQVpHbA0IHJTZ9xJcDyzjpdsLx0X+2+l?=
 =?us-ascii?Q?m3wRPEEq8BGhQfOoJ2i/CWBHZ9q2YtE1LaagpH/QHwWmy3JDeWJHprZcgjNu?=
 =?us-ascii?Q?8T3OBgsn6SrdniagZmxu/P4Te/SMCOWaKZ3/m5hhdk5DoT+tNitSZW4ttEIf?=
 =?us-ascii?Q?3M+2rCFvImzgiybkJYvTjHWRDpZ5Zo0zNcnOiC1hyrM36UgmcgQ00M4bbgKc?=
 =?us-ascii?Q?+RSDBg3m+gw920tXQ8pyH4NTjfHBtCZtiHyhuZVISyEqOWGPZo3f1cEUFHGX?=
 =?us-ascii?Q?rzX5Nyg0M8Peamdf2X7v0B+8rdoPJ++SUoTMxGLwexSSILfcmE09K22TpUDB?=
 =?us-ascii?Q?QD8MrNv1X9/KZWBVUVmlEYGGB4gvn1H+SJbw15ogxDs1Ek+BKGyrnhYccdEB?=
 =?us-ascii?Q?fsB4qF0SkJ1NSUzHHl1G5JmI5bxqsw1YF3OfhdEzJiJWUTgjMtN33z6CS8iQ?=
 =?us-ascii?Q?dreUbYgpyBWUXqJoTkLI+tyJinXcvmETac8Qy9/bjquZGyJnxLbmPOvBancq?=
 =?us-ascii?Q?SEvU2RCjPdk/3/5ymq+UwUM4Ltx8/3elqJ1GzlyNB7l6Y0OIwJiuek1SH/HN?=
 =?us-ascii?Q?BsRA99eNBHHPA+luVGkdh9ZohSVTfkTzptX+DBCGqOA9EWkyYnjm7YCs9MuL?=
 =?us-ascii?Q?dMT5oe9sE5QwsSMzUABSBJm7+68l6O7QMgnyzVDPxVThS5W9xSckdr/UZ+tj?=
 =?us-ascii?Q?+M6Q0qYbFX43DOSFJOHf0SwzdWZ9PLYjk2P+QkYMWKF3kP2oluQQw1F3Fi1C?=
 =?us-ascii?Q?685os+nEs01ilmu5dyusUkIVDeIsFWzEFZWDHYff4AzLb5WxJDrAisEjDjZO?=
 =?us-ascii?Q?aOcjziujkGqn0432WpZ6my80t+0L0hX0LgUiidoak2exCnxT8XEsq9n+lFrW?=
 =?us-ascii?Q?w8VDtERwm9T3ic5xi7c1aQI3Hc4KhU3NROI+3ahtgDPhivI/KY2nsuSYzTb6?=
 =?us-ascii?Q?lV3Za5hYazJY4xLjE99y9ZS5OuKxrSTU1pKSGO2ZLmV2mvkv8+O6cjzj/iOd?=
 =?us-ascii?Q?jfoz/HMyQsnM7Zxm0xWp59KcZkysSX0viZ3e3DcGsL5hDf+2eN3jp4A3mHU/?=
 =?us-ascii?Q?kBStmr/aScoxk+vn4YhgH/FwjWJfGgaSqh/UBxe8XIvJJR5dh1J+C31Q3DOt?=
 =?us-ascii?Q?8Zk622vNZsY/SEz/QwdjnLrshuS3NeaNwr7gpcguV45UtlxSi+yNSHOVaS1g?=
 =?us-ascii?Q?UAh9x8LKEVHyVKbXQofV9UG87bManfPiHMzkvYRE7XSu+W3A+qMvu2tnl/HX?=
 =?us-ascii?Q?Xu6rY8JMDLJolSXzSs9TL+5SYSxgtq2db7mCsPzsh1nktxtUOmc8V31ZPWDu?=
 =?us-ascii?Q?tp4uXZ4+7xNXMkNaSYJOrMK3CpePIpbb6teSr8xsEmkbMNE1ejOkE9ZktEeB?=
 =?us-ascii?Q?l/w6X10bn1+ZQ39h6rj3a+D2FDCFY36+RKqgLdq4FMW9o80cjkUwcW6Grqxw?=
 =?us-ascii?Q?Bu51fbjaQNZ2YUFLXQCdXqrNS7pJrou8dkfAid5HkSAeTNBTMYiB68aaG+he?=
 =?us-ascii?Q?p37WwiSisGz/vho=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:11:01.3722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de28f36-f6a0-46eb-4ec3-08de2814b9cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD6523AA75

From: Dale Farnsworth <dale@farnsworth.org>

Add device tree bindings for the Video Input Port. Video Input Port (VIP)
can be found on devices such as DRA7xx and provides a parallel interface
to a video source such as a sensor or TV decoder.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v6:
- Collect R/B from Rob

 .../devicetree/bindings/media/ti,vip.yaml     | 152 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml

diff --git a/Documentation/devicetree/bindings/media/ti,vip.yaml b/Documentation/devicetree/bindings/media/ti,vip.yaml
new file mode 100644
index 000000000000..e30cc461542b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/ti,vip.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/ti,vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DRA7x Video Input Port (VIP)
+
+maintainers:
+  - Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
+
+description: |-
+  Video Input Port (VIP) can be found on devices such as DRA7xx and
+  provides the system interface and the processing capability to
+  connect parallel image-sensor as well as BT.656/1120 capable encoder
+  chip to DRA7x device.
+
+  Each VIP instance supports 2 independently configurable external
+  video input capture slices (Slice 0 and Slice 1) each providing
+  up to two video input ports (Port A and Port B).
+
+properties:
+  compatible:
+    enum:
+      - ti,dra7-vip
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: IRQ index 0 is used for Slice0 interrupts
+      - description: IRQ index 1 is used for Slice1 interrupts
+
+  ti,ctrl-module:
+    description:
+      Reference to the device control module that provides clock-edge
+      inversion control for VIP ports. These controls allow the
+      VIP to sample pixel data on the correct clock edge.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to device control module
+        - description: offset to the CTRL_CORE_SMA_SW_1 register
+        - description: Bit field to slice 0 port A
+        - description: Bit field to slice 0 port B
+        - description: Bit field to slice 1 port A
+        - description: Bit field to slice 1 port B
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@[0-3]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: |
+          Each VIP instance supports 2 independently configurable external video
+          input capture slices (Slice 0 and Slice 1) each providing up to two video
+          input ports (Port A and Port B). These ports represent the following
+          port@0 -> Slice 0 Port A
+          port@1 -> Slice 0 Port B
+          port@2 -> Slice 1 Port A
+          port@3 -> Slice 1 Port B
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-width:
+                enum: [8, 16, 24]
+                default: 8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ti,ctrl-module
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    video@48970000 {
+      compatible = "ti,dra7-vip";
+      reg = <0x48970000 0x1000>;
+      interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
+      ti,ctrl-module = <&scm_conf 0x534 0x0 0x2 0x1 0x3>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vin1a: port@0 {
+          reg = <0>;
+
+          vin1a_ep: endpoint {
+            remote-endpoint = <&camera1>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <8>;
+          };
+        };
+
+        vin1b: port@1 {
+          reg = <1>;
+
+          vin1b_ep: endpoint {
+            remote-endpoint = <&camera2>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <8>;
+          };
+        };
+
+        vin2a: port@2 {
+          reg = <2>;
+
+          vin2a_ep: endpoint {
+            remote-endpoint = <&camera3>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <16>;
+          };
+        };
+
+        vin2b: port@3 {
+          reg = <3>;
+
+          vin2b_ep: endpoint {
+            remote-endpoint = <&camera4>;
+            hsync-active = <1>;
+            vsync-active = <1>;
+            pclk-sample = <0>;
+            bus-width = <8>;
+          };
+        };
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 59b145dde215..808030187d45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26159,6 +26159,7 @@ S:	Maintained
 W:	http://linuxtv.org/
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/ti,cal.yaml
+F:	Documentation/devicetree/bindings/media/ti,vip.yaml
 F:	Documentation/devicetree/bindings/media/ti,vpe.yaml
 F:	drivers/media/platform/ti/cal/
 F:	drivers/media/platform/ti/vpe/
-- 
2.34.1


