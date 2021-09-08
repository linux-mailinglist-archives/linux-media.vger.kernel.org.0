Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF3B40366F
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 10:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350654AbhIHI5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 04:57:42 -0400
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com ([40.107.93.40]:6913
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348212AbhIHI5k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Sep 2021 04:57:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM3jfKf2tfVqCoDWOUCiDzIT0KWuImarsbcmYVwUGMqDtdS6JTHvikYSw1JSSgN4V50uh7CRxs6xPCM6WWb0A7WsnfLnnPcLTO68aRMJPipD+OVqfCx3zrwaRGBBQ656Q01Fk6JVBCXmvOnNNQMtXuSA/YS/zOrQfOW7nrlS8PhtIQh7eeU7JRJoLNus4fIbqMbHgk5laA1+6QGcWCjzwKWq7rh0Af7yYgavnMfuCtxYpB0gEN21h7aH9tckvlIBxDxsK6yykmeoUw6Iuif559jqNcgoUszZvEte12x+jUY7fVtxtPp9QA3GuoVh9+WhJ/dSqPlN56vb5qtmaCxpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=YSe+MUAQ+TulBWn/Yv6zdRQWBARc7MmKvMv2mumzct8VxsISXHcKBthJ67dQxdYW122WmY1PR7exiTtJ7QwKobQ/jtsIZcM9ZQCxyeB2NmIa0W39DlzSA7/frdK0zq2dkH6NMHZrNiW0I+FCyLroK995UVZ2ksHWrbmql1yRe8hdU7dMQx1rtVRaZ2kCZsER4scSxpdbP5LmuHxb9VoncczCPrYJyI8DuYWYbW65XF6OZEQdVm/4v+GwBnWuJ5PIK/GYuHV41XtKTW2OGji7c6UT1p9C8liz9Ev5Bx/J3GIRvuz1fvVLJSVhR9aPCVrkb3KhxSIS7RHD7qhbPPo3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=UyP9x2MGfHUQURV6AYfu1Q3UvRw0vWhvg1ysOYIFv9lm3I1UI2AXVxCZQnb2pNGepB7eairq2H+cP7DAKuuuuwmSJBmfbfdM31oAF3eeYGgAhffKU5LQp1CKCU+4gIbMdxA4Ndtzhqiij2jVVD+VMpQQ2ZuQjjlFBDqcfN80aZE=
Received: from SN7PR04CA0192.namprd04.prod.outlook.com (2603:10b6:806:126::17)
 by SJ0PR02MB7456.namprd02.prod.outlook.com (2603:10b6:a03:290::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 08:56:31 +0000
Received: from SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:126:cafe::6b) by SN7PR04CA0192.outlook.office365.com
 (2603:10b6:806:126::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 08:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0051.mail.protection.outlook.com (10.97.5.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 08:56:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 8 Sep 2021 01:56:30 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 8 Sep 2021 01:56:30 -0700
Envelope-to: linux-media@vger.kernel.org,
 sakari.ailus@iki.fi,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 stefan.hladnik@gmail.com,
 frebaudo@witekio.com
Received: from [10.140.9.1] (port=35474 helo=xhdamamidal40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <anil.mamidala@xilinx.com>)
        id 1mNtNe-0003gg-BM; Wed, 08 Sep 2021 01:56:30 -0700
From:   Anil Kumar Mamidala <anil.mamidala@xilinx.com>
To:     <linux-media@vger.kernel.org>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>
CC:     <naveenku@xilinx.com>,
        Anil Kumar Mamidala <anil.mamidala@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for AP1302
Date:   Wed, 8 Sep 2021 14:26:12 +0530
Message-ID: <1631091372-16191-2-git-send-email-anil.mamidala@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com>
References: <1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a54e9ef-3130-4572-d25e-08d972a68d81
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7456:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB74561420188337F63386965AB7D49@SJ0PR02MB7456.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFjVrQJl157iar9BTwAYmL9Sw5YWI9u7/cme6NT/aI+oGPCskO/YkYOKF45dIZEaLI4pDFqQuhVSS2xH2bsWv3thOb+4OnShuYephugiXPvHPtkoZ9uq4ApDrihZhWIynolHh6fdYis2wM7HJ/+O38Mfhti/udV8N8Fa9aeo9zhJdCQnmdOe8u6ag4uSTvktZ5G+208O+j7dFanraxF+axtKs3Xiw5+98m31Rw8Ipbgi03dt/p7c7/vl1FXB0sjaH+nuj7rEMUxTlutKx4/wT9HcRvJt/d6nAiBQCCnoytcgunt3trrF8mehLz+GbIIj9Ge1oC/tw2vqvsm/7cZ3i2Z6qvQ9//VxHrbFpxxDMcXOal14sH1C0tevHCzuWdQtgsA7WoraggI6hsrUq8ZUeyCusGsLZx/jmvbBYbKxj1VWSkC247LyEb/hOnVhB7vNR/1jrUuXkXqIgIBG8VYx1Lav8tobfuDSq5qRefYHOwb3kaaAsUMtrUUbfwmoeQi5MpvUkGmrTxkSO64iYY0peXETXPso7SFekFbJZ4GX+sYt6Feax4nqV+eOD1QCaxAbIus/X7F0gRUT3XMFH7EYGfRT7cuvOt+NX6aNeB5o/L27NrawN4mhOHw8jwfEUiX5kEbiVzIPadHEflJFgYyin2zc0uXN4HGmClT+FJxDI8g3Frmav4EmZQY2LQExl4iQcnr0dhNSp0JsirhvwlsPaf7yp4ksKSKeMOSzw8OImn/bNR1/5Wz2qCzvNvgd3Mrvc+qc8ri/uKCAX24BIXMXGVdka2TP2EVAQnben9Ftc8kNshKIUDdYd9KywQ6i90im+fCs4OE5qaJVpXJ1z3R99g+XU+oXr1cZ+zeet0Z+aFQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(9786002)(47076005)(6666004)(36860700001)(316002)(4326008)(110136005)(54906003)(70586007)(36906005)(36756003)(966005)(82310400003)(8676002)(2616005)(508600001)(7696005)(70206006)(186003)(2906002)(26005)(336012)(7636003)(426003)(83380400001)(8936002)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 08:56:31.3069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a54e9ef-3130-4572-d25e-08d972a68d81
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7456
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

