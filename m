Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3118344CD1
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 18:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhCVRIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 13:08:20 -0400
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com ([40.107.237.88]:34592
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231965AbhCVRIM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 13:08:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/ISN+lUfpGLMlDY7Qn5rqWIaOfQRmcq1kAVHHqfjiCPww/uiT2VAsDoVP9rbwh3RX9UOp5Gq4SPIDeeieTCCP6roIbdyN05NR8wnbHr88cJYfNBvw+p9Huhx7dChzhzKmH22h0OpW7GExfX5RJG3bmBQivgjWDPA0jgYINkbyYpbtT7h9z5e6hH/qMz7jrlemmyVP62VBnopxfhZaCi3jTX1Dzyb3uokSd/aTX4yc55UwYCS9GCzh75ad5+uMMFoPRWwuAMwESMQPI4UsWFg7AwOB6Ei72WQPTUC2BR74KxE7El04a5n6OV+1PG5q7XxOivzlsKaorUau9dvma1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=YpgA/5gDTbjHeZAnC3Ga/sQxIzYlXM5Zv3kXUZPgHYmGxjG9oKktB5kjQ5Lsxp7IzwKVmxx+0N/LgTITC4c4CH/teLetAvfxqh4V7y5bm8h8hoJnHAk0hZNaOei3Ygku9J8fRIXfrEj6gXjVH+nco7PFwVPOMlbJCjgLc0+zdj3SP8sJA5t/SnG3nlYXmHXGQ+yEvIqrRnDK2tIoQ4RifcZeoUMCc6woquPMx18+5czwThkku6ywVcwNCJvjDDYFaZjGxFwWXYHFRj2GrZmb26yKVrmeGxot0R+4OgLH7zibJLw7AwerzEwa4uf5MfwHqLjJWr1eGB5pVl+VcL3S9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4B4jc8sAEzgcHxkPu4reZMBSIPQB3mWHvOZluLL0NAA=;
 b=FtS5wAWGGov2h4xiUbGUr6G05jDQS5/P8QQ8SgkpQDzysAxnSsPbqXQpQOXvt5Czlikq6AetGc6BnEdpiWGf9Va8IsvipstfW+bZhVFchO2KkRi0u18ycd8MRtopq8iqDkpfON6zZQxyK52ASBwqW2CCPtWSN76JN9msBAhfz78=
Received: from SA0PR11CA0170.namprd11.prod.outlook.com (2603:10b6:806:1bb::25)
 by BY5PR02MB6290.namprd02.prod.outlook.com (2603:10b6:a03:1b1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 17:08:10 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bb:cafe::49) by SA0PR11CA0170.outlook.office365.com
 (2603:10b6:806:1bb::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 17:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.24 via Frontend Transport; Mon, 22 Mar 2021 17:08:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 10:08:07 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 22 Mar 2021 10:08:07 -0700
Envelope-to: linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com,
 stefan.hladnik@gmail.com,
 frebaudo@witekio.com
Received: from [10.140.9.1] (port=50554 helo=xhdamamidal40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <anil.mamidala@xilinx.com>)
        id 1lOO2A-0003vO-JY; Mon, 22 Mar 2021 10:08:07 -0700
From:   Anil Kumar Mamidala <anil.mamidala@xilinx.com>
To:     <linux-media@vger.kernel.org>
CC:     <naveenku@xilinx.com>,
        Anil Kumar Mamidala <anil.mamidala@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: [PATCH 2/2] media: dt-bindings: media: i2c: Add bindings for AP1302
Date:   Mon, 22 Mar 2021 22:36:33 +0530
Message-ID: <1616432793-1994-2-git-send-email-anil.mamidala@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616432793-1994-1-git-send-email-anil.mamidala@xilinx.com>
References: <1616432793-1994-1-git-send-email-anil.mamidala@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f32b40d-8346-4d6f-c247-08d8ed5511c6
X-MS-TrafficTypeDiagnostic: BY5PR02MB6290:
X-Microsoft-Antispam-PRVS: <BY5PR02MB629095A2207778C3E80EFC6FB7659@BY5PR02MB6290.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feM3DSl268iL2faBlKlM2x78hnt/Q45Ys5oDOWDiH6TxoXDMwqLxwHZtJbz29TfW5h7pUmyme/DP9fO2cAZ/Wxe+E+OqnDuve+GnOA5hbsFOTHMmsjFIe64sRUAQO8Xw64P5O2NktsC0Wkall2KeXd2Ie6qCwALAVj6lNle/+X8A4PbcyM3PCrauJAUILogbqg7242Q1tPDufmA4162JP+Fq4N4fwBCibZYmd4OmQIdD2pBwahY+vs0i9bGxulbx3gW374aRGVaVKPq8DhLR7n4peYDjnEfW069iH4SJX6uZ13x9SAdaOuysnps5wuLXFvTdQpJkwaD7mrtHNWaIU6nSPrGjOYP6Xig7quNw0ElQ5zMWRXaXyV9IxKLYTJQECY3ixXzhPTNdXdH4CE6rmOgVcjB1ys3byB098mOCNrfQP4rlzAs5+joDHFIpKPqCgnDs0hDesZjSJFaeplFeUeQxkdAazrUba3djg3mHwtiOXwSVAL8s0GzB4Jzp1JtFO9zXChhpZ1mhC/Qvy9rIjKeDMmCrW3QEQTl+XFF0YZGLPubtc6jEhrME5GH+MBW4wPBISwIjedf21nNMAXpMVpblCUy76FU3xBkB10Z8BithkecddnSBAslI3oME3iSQB+GzvchhJK6fASjoXh5FeKsLnPMyL7KSfbATXaWfmAOPzN+65GlmRjPegmioQitrde5A+IcM5WP7liPnH99UN2Fk/Qau+p5247gjEE9f25d368C+8nmWdD0rKdoXxOhB
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(36840700001)(46966006)(36860700001)(8676002)(36756003)(5660300002)(6916009)(26005)(54906003)(186003)(7696005)(336012)(426003)(8936002)(47076005)(6666004)(9786002)(82310400003)(2616005)(2906002)(70206006)(83380400001)(4326008)(478600001)(966005)(70586007)(356005)(7636003)(82740400003)(316002)(36906005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 17:08:09.8353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f32b40d-8346-4d6f-c247-08d8ed5511c6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6290
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

