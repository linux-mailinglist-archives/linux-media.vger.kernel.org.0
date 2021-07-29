Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625813DA2F0
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 14:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbhG2MR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 08:17:29 -0400
Received: from mail-sn1anam02on2066.outbound.protection.outlook.com ([40.107.96.66]:57089
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231674AbhG2MR1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 08:17:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oI/9RgAZaUJSb0T24YsAawJJEq+TIHNzGM4sp85L/X/kuHUGifajDEqUin0oCw/JbKz928J2tqTDJVolM6b2O0b8+oRW3PauOTuF9ANh1S0oK9ZfZzgoI1XJLX5BIjjQC8ZkdLIgoKG2X9IwLI/FtPy641ypq1pvQyrNuAAnIDxBsvspNhuQS6r+Vrrll34uq6MAmu6mCEPvUWXLzy7+8JZSfuc353pZH50MSAw0u+PQICO/kenalIZg3aiiYdPOUOmBZmfA9hIn7WlgBAfltxTbpDKN4V3Jq5TOAD3I7Ici9SCYYfTp/iC9J+Rj/Kb9Hs9zwW/W2KWKrRpzujV6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=UZvNlzfNCz3xVskUuXxZ+gWgDyLOM1SxL0ABVSxD0RjkSjKJiGugewYnzlnCf/54b6Z87Wsh8AmpqX203gRH/XQog99bvyR5M71SYMM+51iDXpz+zeFWXo0Op+AcMVtoCuk+36yryom1OPLsCeYCQ0hrzvjGFYnGeCNuSFeqHEKVxLwbCe5PgJZlP8Py0Idb0lzjyCQoKByTJlVn1CYa/Nv4rip+Zm3GY5WzEUVwgxtQoXkfxI2RuGJkxyIim+9VTha/J0RDZpJlZ1HAARXwBRcGCcdq1LJN2pIPdhSspafKGRtxLIJ/dpoTKczhBq3S+CF1rvcj+ahdlqYbTjhXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=HajRUhzSDC1Btwh0Kut3aKUu1DAVnmb1y0S7ENh6i6wQ4Ecdcp/bHSdPFvzzuTvIYhQ5/vJSil7MQpKxe+YN/+jWFtfF3ljETTtAirEPFtPHGwqA7MkXOZv2FDV90Kyspf8jgQCtm8MRKHw1Hle2B7xl+x067HIqxwHGdi9KPJo=
Received: from SA0PR11CA0095.namprd11.prod.outlook.com (2603:10b6:806:d1::10)
 by BYAPR02MB5542.namprd02.prod.outlook.com (2603:10b6:a03:96::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Thu, 29 Jul
 2021 12:17:22 +0000
Received: from SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::26) by SA0PR11CA0095.outlook.office365.com
 (2603:10b6:806:d1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Thu, 29 Jul 2021 12:17:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0049.mail.protection.outlook.com (10.97.5.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 12:17:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 05:17:19 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 29 Jul 2021 05:17:19 -0700
Envelope-to: linux-media@vger.kernel.org,
 sakari.ailus@iki.fi,
 laurent.pinchart@ideasonboard.com,
 stefan.hladnik@gmail.com,
 frebaudo@witekio.com
Received: from [10.140.9.1] (port=36814 helo=xhdamamidal40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <anil.mamidala@xilinx.com>)
        id 1m94yU-0001dt-PN; Thu, 29 Jul 2021 05:17:19 -0700
From:   Anil Kumar Mamidala <anil.mamidala@xilinx.com>
To:     <linux-media@vger.kernel.org>
CC:     <sakari.ailus@iki.fi>, <naveenku@xilinx.com>,
        Anil Kumar Mamidala <anil.mamidala@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for AP1302
Date:   Thu, 29 Jul 2021 17:41:32 +0530
Message-ID: <1627560692-21675-2-git-send-email-anil.mamidala@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627560692-21675-1-git-send-email-anil.mamidala@xilinx.com>
References: <1627560692-21675-1-git-send-email-anil.mamidala@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65e08260-e149-4e3a-4104-08d9528ad12a
X-MS-TrafficTypeDiagnostic: BYAPR02MB5542:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5542235BC4F71A04D6DFF1F0B7EB9@BYAPR02MB5542.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fR+Fu2VcenIWpuD/93U1bR4Kb+URapGwL4KyKU9vhBdD9K9HrtcZXiE3qFOScOq7s5Q7PKqgdlyGOVeZA3OnLPbZNjnWbf+Y+rI4dGiQs7zKHc6GKNTBcgq4gdOHyojdjD9mgybQKadvYOmBBH7Y4QzQbsglphUABOteD0oz4WiiTtFSHFYvY9kBTYkFSFs/6Oz0NbfhNJfEC0ZhIQ3ZwwfhJH73bzMv2B5l/Z2dxs2YbF1Hmq3Y3I5EDK62MfPiV97MjkxkSbV9I2XFslgHBQbClUl0HHwwupAeEL+iUmY6FOAh3CERgRQ2NgcrUEt96Cxsi467E4N6J8X3NtEYCgqLLZmTqQFveGwux+tNd5qg7GjGAOV9l9CU0VaXZSTSlzUYri15geP7O1bLlnAbi+/jm7bGIwiBzHmO29vaSZdSLsqtCFy1npCUW+rLyx4mVrhqXwKdogzO1OX5qijR7CQodi09QixuO2qojalBg6HNl23cxoROwvRIFkJklEpbqar4vx2xPJXeDLq58W+gwryrzyL/wRq2BTxw4P7J+6Y/TIalsbaevHQGW7nqAdJwkyQ9yeAFUIsSZdCN9Vdhslzq8uI5xb0z9JriTzrpZsipstp2AtQMO2ulW2iGlLJ7DFjlnafYBViHZmObMq9ELd3NXOQ+X1TVQNi6Nn9PZuAtdt77APGTPZLH/G6tEt/utormCu/7U5w96nisEBWOlTu5aUtmVbCEJbZTyG4L3z+jEF0JsQ8nJDXsnX0vRrqv+HnuYnebrQ9s8HCnAM5FtOeieZUYiOp9yPuARA7DXPvJDAae2lS1bai5mgIQ6PGPKrAFKoyLfAgqNMBwxEYIwT6jrs5dkwNEQRy9Ue95iik=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(8936002)(36860700001)(336012)(36906005)(4326008)(9786002)(7636003)(8676002)(47076005)(6916009)(6666004)(508600001)(36756003)(966005)(7696005)(70586007)(83380400001)(70206006)(356005)(82310400003)(5660300002)(186003)(426003)(26005)(54906003)(2616005)(316002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 12:17:21.7007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e08260-e149-4e3a-4104-08d9528ad12a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5542
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AP1302 is a standalone ISP for ON Semiconductor sensors.
Add corresponding DT bindings.

Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
---
 .../devicetree/bindings/media/i2c/onnn,ap1302.yaml | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
new file mode 100644
index 0000000..d96e9db
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ap1302.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ap1302.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AP1302 Advanced Image Coprocessor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Anil Kumar M <anil.mamidala@xilinx.com>
+
+description: |-
+  The AP1302 is a standalone ISP for ON Semiconductor sensors. It interfaces to
+  up to two RAW CMOS sensors over MIPI CSI-2 connections, processes the two
+  video streams and outputs YUV frames to the host over a MIPI CSI-2 interface.
+  Frames are output side by side or on two virtual channels.
+
+  The sensors must be identical. They are connected to the AP1302 on dedicated
+  I2C buses, and are controlled by the AP1302 firmware. They are not accessible
+  from the host.
+
+properties:
+  compatible:
+    const: onnn,ap1302
+
+  reg:
+    description: I2C device address.
+    maxItems: 1
+
+  clocks:
+    description: Reference to the CLK clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Reference to the GPIO connected to the RST pin (active low).
+    maxItems: 1
+
+  standby-gpios:
+    description:
+      Reference to the GPIO connected to the STANDBY pin (active high).
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: MIPI CSI-2 output interface to the host.
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+
+        properties:
+          clock-noncontinuous:
+            type: boolean
+
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+        required:
+          - data-lanes
+
+  sensors:
+    type: object
+    description: List of connected sensors
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      onnn,model:
+        $ref: "/schemas/types.yaml#/definitions/string"
+        description: |
+          Model of the connected sensors. Must be a valid compatible string.
+
+          If no sensor is connected, this property must no be specified, and
+          the AP1302 can be used with it's internal test pattern generator.
+
+    patternProperties:
+      "^sensor@[01]":
+        type: object
+        description: |
+          Sensors connected to the first and second input, with one node per
+          sensor.
+
+        properties:
+          reg:
+            description: AP1302 input port number
+            maxItems: 1
+
+        patternProperties:
+          ".*-supply":
+            description: Power supplies for the sensor
+
+        required:
+          - reg
+
+        additionalProperties: false
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+    # How can we express that onnn,model requires one sensor object to be set ?
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+  - sensors
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "onnn,ap1302";
+            reg = <0x3c>;
+
+            clocks = <&clk24mhz>;
+
+            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
+            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
+
+            port {
+                isp1_out: endpoint {
+                    remote-endpoint = <&seninf_in1>;
+                    data-lanes = <1 2 3 4>;
+                };
+            };
+
+            sensors {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                onnn,model = "onnn,ar0144";
+
+                sensor@0 {
+                    reg = <0>;
+
+                    vdd-supply = <&mt6358_vcamd_reg>;
+                    vaa-supply = <&mt6358_vcama1_reg>;
+                    vddio-supply = <&reg_1p8v_ext>;
+                };
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "onnn,ap1302";
+            reg = <0x3c>;
+
+            clocks = <&topckgen 0>;
+
+            reset-gpios = <&pio 102 GPIO_ACTIVE_LOW>;
+            standby-gpios = <&pio 40 GPIO_ACTIVE_HIGH>;
+
+            port {
+                isp2_out: endpoint {
+                    remote-endpoint = <&seninf_in1>;
+                    data-lanes = <1 2>;
+                };
+            };
+
+            sensors {
+                #address-cells = <1>;
+                #size-cells = <0>;
+            };
+        };
+    };
+
+...
-- 
2.7.4

