Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA833423CDB
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 13:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238205AbhJFLfJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 07:35:09 -0400
Received: from mail-mw2nam10on2053.outbound.protection.outlook.com ([40.107.94.53]:3572
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237936AbhJFLfI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 07:35:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQ5NFQZQb8SDGxfa/aRCMMrvf2QAaGiiNg3SFxvTSFnQo0fB3gtHutOpTdeoE/9IwJ0zqdhgXJ9ov31cvCp6rb99Q3a/YzenaatUVoQrXiG+hrRPJyTM5bISREjV/FrnGyfceXmxoWMGoDvVl5plSMgvVvvkbmAXBKHrUGmy0CyuELv+b6DKJ9fVMhsTOrfTChHajMDpQbrca7fHmCPA4lzNtYCBpbEbhF7CqRU3bK2UBpAQ3U6s9DR4/s6ftn6zo/LPSvJApif/9ADrZjtxTxv/RxTNCp34iM0Apyw4+sFMPX8Kc2yBQNiHyu+f3dQ/WhD7KjU3SjvKlPbrOxCSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=DwSYf8ChYNxmXBWfw1H04vW6T5YZ9BSHY95PRRq/UWX62RmA/G6088aXvNw76LE6XV3BjwTogH4JZOk2i0eIPgYk1pGFHSyCmHG9TsqrIh9sDuPC2bt2kJvzfa3w9+3J0uCNcMiMfqLQqm21zYMVHiGUgvYJ9dABgGK3JRUMIo2gtBH34cgmDG5wiI933vyPipGOqt8JCMX/Dbr0u7dusU+4HUiIDSHMPFw5uU5qtFYWarAHtjzsccZ/ZVIqpAFAlRl9a4+lPzUjZK/ZEP535cW182S5TdS27ElQ4OkIq32QFIM8hZ7xcC24HI5Kv/SQA16E6NI8BwpfcQFrsGH7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=V8vlp1QfKGRLDX1EUjZVvozgCSxy4k1qrcBeR4xaB9z1DPmEqx0HuHNhKio0c8gr7FIl1F1vUy5jzX0wa1wqT7Opbxq7xxOgqSfIvtjHaqIm8d8RMtR3JRAhIoQNw3fg+bBa7xLfvsKsNrcEreXypm+FeHmF5QGlE5+pNNO+PNg=
Received: from BN6PR1101CA0019.namprd11.prod.outlook.com
 (2603:10b6:405:4a::29) by MN2PR02MB6030.namprd02.prod.outlook.com
 (2603:10b6:208:1b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Wed, 6 Oct
 2021 11:33:12 +0000
Received: from BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4a:cafe::cf) by BN6PR1101CA0019.outlook.office365.com
 (2603:10b6:405:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 11:33:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT052.mail.protection.outlook.com (10.13.2.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 11:33:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Oct 2021 04:33:11 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Oct 2021 04:33:11 -0700
Envelope-to: linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 robh+dt@kernel.org,
 sakari.ailus@iki.fi,
 laurent.pinchart@ideasonboard.com,
 stefan.hladnik@gmail.com,
 frebaudo@witekio.com
Received: from [10.140.9.5] (port=37390 helo=xhdkthangav40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <anil.mamidala@xilinx.com>)
        id 1mY5Ac-000ER0-Oo; Wed, 06 Oct 2021 04:33:11 -0700
From:   Anil Kumar Mamidala <anil.mamidala@xilinx.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <robh+dt@kernel.org>, <sakari.ailus@iki.fi>, <naveenku@xilinx.com>,
        Anil Kumar Mamidala <anil.mamidala@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for AP1302
Date:   Wed, 6 Oct 2021 05:32:54 -0600
Message-ID: <20211006113254.3470-2-anil.mamidala@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211006113254.3470-1-anil.mamidala@xilinx.com>
References: <20211006113254.3470-1-anil.mamidala@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd864c2-a14f-4370-10e1-08d988bd149b
X-MS-TrafficTypeDiagnostic: MN2PR02MB6030:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6030EFA0285485BF9B26FD86B7B09@MN2PR02MB6030.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3xSz/XpAAVyq4waD5etIV5CtM0CUBZq5gMTfBEBA3e+tmTb1mQoPWd2XKDYqeBMVgd6olamw8NrxGl/EgYtF+mBuNBHcj9MjJPpX6ePoLJTbbuSs3r3CU9RUGhLMBRiabk80zgo4PEv+IWcvz75umN1CKtV8mZJLi1DbhR5VEAiXxCjed3rGE5zpysxU5EuQtkFaSc9YPLyDjlDgaYWWMTzvl9qwrohi3j1yzPiFWOJi+K5KyxYYbBLl5RzT8U3ZJQIRInbgytzGBYl48gH6dQ1aA/5v9imoSSvaTikIov4ggTg58zLgGELVd5L14HkZuOuCJ2XJA8bR9FcjvUJOGOm5pJIKDx+JdiSJSigDZB38wBDeU20cqiQUZyxDZ6ncGVN20+keXkvjpZ+/OF+mtBmetK0I6l91VV+UsPMcevuXyHbJlywV6s4X5F4NzGyXp/fv3/vQF6JqsW6jg1Tz5HMnQoS7qAW9cgNvniBHbOWL+OF0M/718/+qpXgqZqm9DdJ9LCNZxEZwJMT8X7CCTDbatXfrsA3b3X7YnppNwPE0jJdlkCeOrNkE5cEfkAFJQGHhNpbhW851v/7DW8U7yK4HPzPf2ziQZUsPvPDr3F0emZPXZSntGZ3XWoX2ZN3uG9jISqJGY1zGTBgLtiur1NUK/xupT/0Ih7VfTs8yJOcTdqxPyyAg7rUb0SVqGT6kbgMh5n+h8CldCM5rA9sX2IxToiG8hDMMzTtGBRpLwiXZzw+rxRHq42jfNarmHf6slUeixZKt0e+KYH/I0t/F5zmwKHXogbLw0xzHb19DSqQFn/ZFJOGzvn/3UnoQSr+aTr8wZfMDgzSsmbx7NB+KHmnFvI7pjzt53izolc7I7Rc=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36756003)(6666004)(82310400003)(426003)(356005)(83380400001)(1076003)(7636003)(508600001)(966005)(36860700001)(47076005)(5660300002)(26005)(9786002)(36906005)(316002)(70206006)(8676002)(54906003)(2906002)(110136005)(7696005)(8936002)(2616005)(70586007)(336012)(4326008)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 11:33:12.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd864c2-a14f-4370-10e1-08d988bd149b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6030
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

