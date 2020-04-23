Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B5C1B5F38
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 17:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgDWPbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 11:31:24 -0400
Received: from mail-eopbgr750047.outbound.protection.outlook.com ([40.107.75.47]:23254
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729055AbgDWPbW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 11:31:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHmxJDlzHtM/XyBRiGA8Z0xioCZpeCXR1iuHzXdPmkk+dG2j1XCrgRrXGsTyPVMOTnjAJpwt671+KUTyQmCoqGq3Eh+elN4bVs7VFDt2FfyZnNftf1cF9r/YzNb+DExKgbNOT0E+9zEUTh8+KnVn2V+9HGGVKRfOh2NW7ufwRwc3cs8Fyir0CMMBuKD3JWtrLn+WckeBCWG+o1vSSZ0QIUzx4QatCcExFCIX2nY+Jg/DUhQdEkprE14z+ekAQOF9Uc3CGYAvqP5JwKppv505JBh5KBsOxHHgjMlWxb0GQI3IomUyYBSJbOBYmgy6PNaKl4Mn6DShFTfIK0hFCD7Lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWeoGUPUWKiPLj8zDV+vKK3D4ZDnsst/miMcSMnWyc8=;
 b=kvKGkbpUFEZEKRsqkNkf26PMEWbI3PVZXJpx362e62CGk7nqjjDMjUbgW70YP+ur5pTfqMOoCyo36I7Q7giZC5bdH+o/54Ap9pBarZerKZKEu9qEIBjeJQ076G9zGWohDWpwVgOfSQ8JWDi8pvvXVZAJWSsBTM49rio+A/Gt23zN0jaFJlI6j6a5NZxwRazRY+yxWcxG0xUzcIArunWfHx2RR2gS0RmTCGBoPdGYkBq/gIs8kXvqB5sJ14C66AHs/rZz3Ij4t8IldYl5sbEyqipulyaBF3oP7O6Ym0FuHrangiMof5E4rtYE0DiOn129Cei8Raq9EvXHxk9XmKpE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWeoGUPUWKiPLj8zDV+vKK3D4ZDnsst/miMcSMnWyc8=;
 b=lP5rt/ZKZWBgHnpBKe8y/BayNhVCx695h803aQvtwXSgT32QPaZOucWuRUDg2f6PftsS6PLQ61hB6YE/l/mTavf5ItfZn7BAbQ+IbzWGY5AqHxTg4c3veDgU4pieakcEt9dcY6a8En72ldnFydlGM1f37LwmGg5eS91Yx1Qhg6s=
Received: from SN6PR01CA0003.prod.exchangelabs.com (2603:10b6:805:b6::16) by
 CY4PR02MB2726.namprd02.prod.outlook.com (2603:10b6:903:124::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 23 Apr
 2020 15:31:18 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:b6:cafe::c6) by SN6PR01CA0003.outlook.office365.com
 (2603:10b6:805:b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Thu, 23 Apr 2020 15:31:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server id 15.20.2937.19 via Frontend Transport; Thu, 23 Apr 2020 15:31:17
 +0000
Received: from [149.199.38.66] (port=42623 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jRdnm-0003mQ-6r; Thu, 23 Apr 2020 08:30:10 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jRdor-00054A-Fk; Thu, 23 Apr 2020 08:31:17 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jRdol-000505-GR; Thu, 23 Apr 2020 08:31:11 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        hans.verkuil@cisco.com, Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v12 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
Date:   Thu, 23 Apr 2020 21:00:37 +0530
Message-Id: <20200423153038.106453-2-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200423153038.106453-1-vishal.sagar@xilinx.com>
References: <20200423153038.106453-1-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(54906003)(110136005)(8676002)(81156014)(81166007)(9786002)(36756003)(7416002)(316002)(82310400002)(356005)(5660300002)(47076004)(82740400003)(4326008)(8936002)(6666004)(966005)(186003)(44832011)(2616005)(336012)(7696005)(478600001)(426003)(70586007)(1076003)(70206006)(26005)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99275f51-c3d3-497f-db5d-08d7e79b5df1
X-MS-TrafficTypeDiagnostic: CY4PR02MB2726:
X-Microsoft-Antispam-PRVS: <CY4PR02MB27269C9E842637D4FE3F3505A7D30@CY4PR02MB2726.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03827AF76E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lOBjL2RxPsd6zYuJ4VubUoB0LQhULeHdpTHsCqXLZnAlIE3/hhNmTK5S4OY9lgxUEcYFq7omKakUQuTXPPWpOz0tSwmoe7qD2P+xdRTDbswWW341ykAtuSIYURdK81ZAHxFVff3iE6gW39zD65zCCyi/wzjU04aYyhDuyw8oShTeE1jL/m9x2Voj6odwL9yhtoMBsg/lW9Awo/7F7jVdPGydGVXQ4eHaYiZ4thMoqxZu2BUheMhTIgOboVilxo9xpXOrriDt4bnji1EttuHgY02hGU/BZYAjfo9T8ClcrdZS4nkMdcWlRPcjHHNUihUilzAsRdgUYjA+TEwFpKaKTPAXfv/zt2alQvbCAAN4dHv1LzJMD32IsaS6a060OUdGwRy2iOA8FHae6rThOrpgdkgZHhBcCLGOOdPvb37HNJ0WIKND6S8Yfi7ms0O3bVls+UZRkOcyHXfUYXvyn8ZS+m7arSTWFXQgyQE7qmEXy+F4G6NzIpKSIo/oJs3j+h2AWeyKy3twsqlGMl/P4b2+YJqpX2YOxD1uTXaUiZ+MBtLtFarnPQhW8D+p/CKkpVsKJPJUcEvhVNWjW3k4dZsWww==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 15:31:17.8103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99275f51-c3d3-497f-db5d-08d7e79b5df1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2726
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.

The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
D-PHY in Rx mode and a Video Format Bridge.

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v12
- Moved to yaml format
- Update CSI-2 and D-PHY
- Mention that bindings for D-PHY not here
- reset -> video-reset

v11
- Modify compatible string from 4.0 to 5.0

v10
- No changes

v9
- Fix xlnx,vfb description.
- s/Optional/Required endpoint property.
- Move data-lanes description from Ports to endpoint property section.

v8
- Added reset-gpios optional property to assert video_aresetn

v7
- Removed the control name from dt bindings
- Updated the example dt node name to csi2rx

v6
- Added "control" after V4L2_CID_XILINX_MIPICSISS_ACT_LANES as suggested by Luca
- Added reviewed by Rob Herring

v5
- Incorporated comments by Luca Cersoli
- Removed DPHY clock from description and example
- Removed bayer pattern from device tree MIPI CSI IP
  doesn't deal with bayer pattern.

v4
- Added reviewed by Hyun Kwon

v3
- removed interrupt parent as suggested by Rob
- removed dphy clock
- moved vfb to optional properties
- Added required and optional port properties section
- Added endpoint property section

v2
- updated the compatible string to latest version supported
- removed DPHY related parameters
- added CSI v2.0 related property (including VCX for supporting upto 16
  virtual channels).
- modified csi-pxl-format from string to unsigned int type where the value
  is as per the CSI specification
- Defined port 0 and port 1 as sink and source ports.
- Removed max-lanes property as suggested by Rob and Sakari
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 215 ++++++++++++++++++
 1 file changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
new file mode 100644
index 000000000000..365084e27f7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
@@ -0,0 +1,215 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/xilinx/xlnx,csi2rxss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx MIPI CSI-2 Receiver Subsystem
+
+maintainers:
+  - Vishal Sagar <vishal.sagar@xilinx.com>
+
+description: |
+  The Xilinx MIPI CSI-2 Receiver Subsystem is used to capture MIPI CSI-2
+  traffic from compliant camera sensors and send the output as AXI4 Stream
+  video data for image processing.
+  The subsystem consists of a MIPI D-PHY in slave mode which captures the
+  data packets. This is passed along the MIPI CSI-2 Rx IP which extracts the
+  packet data. The optional Video Format Bridge (VFB) converts this data to
+  AXI4 Stream video data.
+  For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Subsystem.
+  Please note that this bindings includes only the MIPI CSI-2 Rx controller
+  and Video Format Bridge and not D-PHY.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - xlnx,mipi-csi2-rx-subsystem-5.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: List of clock specifiers
+    items:
+      - description: AXI Lite clock
+      - description: Video clock
+
+  clock-names:
+    items:
+      - const: lite_aclk
+      - const: video_aclk
+
+  xlnx,csi-pxl-format:
+    description: |
+      This denotes the CSI Data type selected in hw design.
+      Packets other than this data type (except for RAW8 and
+      User defined data types) will be filtered out.
+      Possible values are as below -
+      0x1e - YUV4228B
+      0x1f - YUV42210B
+      0x20 - RGB444
+      0x21 - RGB555
+      0x22 - RGB565
+      0x23 - RGB666
+      0x24 - RGB888
+      0x28 - RAW6
+      0x29 - RAW7
+      0x2a - RAW8
+      0x2b - RAW10
+      0x2c - RAW12
+      0x2d - RAW14
+      0x2e - RAW16
+      0x2f - RAW20
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f]
+
+  xlnx,vfb:
+    type: boolean
+    description: Present when Video Format Bridge is enabled in IP configuration
+
+  xlnx,en-csi-v2-0:
+    type: boolean
+    description: Present if CSI v2 is enabled in IP configuration.
+
+  xlnx,en-vcx:
+    type: boolean
+    description: |
+      When present, there are maximum 16 virtual channels, else
+      only 4. This is present only if xlnx,en-csi-v2-0 is present.
+
+  xlnx,en-active-lanes:
+    type: boolean
+    description: |
+      Present if the number of active lanes can be re-configured at
+      runtime in the Protocol Configuration Register. Otherwise all lanes,
+      as set in IP configuration, are always active.
+
+  video-reset-gpios:
+    description: Optional specifier for a GPIO that asserts video_aresetn.
+    maxItems: 1
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Input / sink port node, single endpoint describing the
+          CSI-2 transmitter.
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+
+            properties:
+
+              data-lanes:
+                description: |
+                  This is required only in the sink port 0 endpoint which
+                  connects to MIPI CSI-2 source like sensor.
+                  The possible values are -
+                  1       - For 1 lane enabled in IP.
+                  1 2     - For 2 lanes enabled in IP.
+                  1 2 3   - For 3 lanes enabled in IP.
+                  1 2 3 4 - For 4 lanes enabled in IP.
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+              remote-endpoint: true
+
+            required:
+              - data-lanes
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+      port@1:
+        type: object
+        description: |
+          Output / source port node, endpoint describing modules
+          connected the CSI-2 receiver.
+
+        properties:
+
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+
+            properties:
+
+              remote-endpoint: true
+
+            required:
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - xlnx,csi-pxl-format
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    xcsi2rxss_1: csi2rx@a0020000 {
+        compatible = "xlnx,mipi-csi2-rx-subsystem-5.0";
+        reg = <0x0 0xa0020000 0x0 0x10000>;
+        interrupt-parent = <&gic>;
+        interrupts = <0 95 4>;
+        xlnx,csi-pxl-format = <0x2a>;
+        xlnx,vfb;
+        xlnx,en-active-lanes;
+        xlnx,en-csi-v2-0;
+        xlnx,en-vcx;
+        clock-names = "lite_aclk", "video_aclk";
+        clocks = <&misc_clk_0>, <&misc_clk_1>;
+        video-reset-gpios = <&gpio 86 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                /* Sink port */
+                reg = <0>;
+                csiss_in: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    /* MIPI CSI-2 Camera handle */
+                    remote-endpoint = <&camera_out>;
+                };
+            };
+            port@1 {
+                /* Source port */
+                reg = <1>;
+                csiss_out: endpoint {
+                    remote-endpoint = <&vproc_in>;
+                };
+            };
+        };
+    };
-- 
2.21.0

