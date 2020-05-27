Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3671E44D8
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 15:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389060AbgE0N5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 09:57:52 -0400
Received: from mail-dm6nam10on2054.outbound.protection.outlook.com ([40.107.93.54]:13793
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389056AbgE0N5v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 09:57:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ds9RdeF2i5O5rJdGi1VzGQNOSKZgKFOTivzm/dhj9Ihe826KyiOfTp2AqW+Wa8kN9g1j5Owd96oLSHPxZUzInfK1kl5FF1SAEmk2+mLReRvjtcnzyCbs2lEJ8Og1w/z1fcBwE6mtZNURP9jtqypRfPkBzWnSs5cNBMSxOJ8+AdZXE0iiXgBXF7SIYeQ2nhfQ5Nt4EyfYpPEbe8rM8PQVi+YYnTCb68jFwJtgZYd4eHfSiR8YwpOAxMJicFxiMaAj+FGPxbwUw0TZMttj28PF7C1h3ZW7Mq+u08+r11DM3HynzGRFzRCqAf8sH2rb28Ha+jgdzVPIuIvv3XKcb/9Gtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkM6lBTFFhEXRy3AVyYjuENhpwOtWBofJJAO/7Hnrw4=;
 b=SKst/tEUP7fyyY3NRS7gws8xHuk4+YJZU5qMYR6b4oi37YbQOV5pWCz7671xz9D+erSwFXse7UCyAMHmZI2784v9LLyM6jidCmsOp70LaoZsRMrDO8DC1GOATJ3YpWOlpknrvlQwNjnuCmJYT1vM4j6Pwyi6VyNH+hMM1gnruwFr2EY9rVOl+hUkHEjwEvVCQe1nQxNoYSGJmUtB7x2Lf0mdSCWwSpALuj7w5NafffXlkKXKEuAvRv7tujNawHK08HtJyXjLZCTJ7rvXnK32PKSbiJVL8M54GkV7qkhnEdl+fBcY9huhTfAN0aOgNCAuS8vmyBTqz/hAVnlbinrPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=jmondi.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rkM6lBTFFhEXRy3AVyYjuENhpwOtWBofJJAO/7Hnrw4=;
 b=N6RqqkIWX3QhNBI7xcmaqYrg5MLkxDPcgu+wbXI1gA4f8pNEIfcJsgTHsMugyXO5cAWj6GHwRieyHIkIwuDeMra8MRYzMHTNVE1czOr2Du9JqMc551fk2UKaaYazprxI89YAn0MHl6JDStmzMM4sWmxwudDoyRfwFlFTACtLpyg=
Received: from SN6PR04CA0073.namprd04.prod.outlook.com (2603:10b6:805:f2::14)
 by BN8PR02MB6436.namprd02.prod.outlook.com (2603:10b6:408:b2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 27 May
 2020 13:57:46 +0000
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::d4) by SN6PR04CA0073.outlook.office365.com
 (2603:10b6:805:f2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Wed, 27 May 2020 13:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with Microsoft SMTP
 Server id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 13:57:46
 +0000
Received: from [149.199.38.66] (port=35488 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jdwYP-0001od-I3; Wed, 27 May 2020 06:57:09 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jdwYz-0007RU-Sf; Wed, 27 May 2020 06:57:45 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04RDvb4T023049;
        Wed, 27 May 2020 06:57:37 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jdwYr-0007P3-5t; Wed, 27 May 2020 06:57:37 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH v14 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
Date:   Wed, 27 May 2020 19:27:18 +0530
Message-Id: <1590587839-129558-2-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1590587839-129558-1-git-send-email-vishal.sagar@xilinx.com>
References: <1590587839-129558-1-git-send-email-vishal.sagar@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39860400002)(396003)(46966005)(82310400002)(81166007)(7696005)(70586007)(70206006)(6666004)(47076004)(426003)(5660300002)(82740400003)(44832011)(107886003)(4326008)(110136005)(7416002)(8676002)(336012)(36756003)(356005)(316002)(26005)(186003)(966005)(478600001)(2616005)(9786002)(8936002)(2906002)(83380400001)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fa1d4dab-f0b1-4684-cac8-08d80245ef38
X-MS-TrafficTypeDiagnostic: BN8PR02MB6436:
X-Microsoft-Antispam-PRVS: <BN8PR02MB64368C3DDD03B3200E1A17FAA7B10@BN8PR02MB6436.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4OwKXR0aKLqHkQ7fEJYPmJRXwDA3VRjz9u8Clj2kDG1waxvE2Pfzfu4lBn2/bL9UCaTtYjxVymHbCOTeia0ddf50raleA/615VvJ4Cks+AUjf9yPjTtC47cXHaZuGg9HK/MCi+aOulNCfZCbXv87Zi37XY4np5Irlq4mibUrzScCitfPmDTFPynvdPjAJz9vPukCUsJ34zj2IzMmmkN7Ex8XuE38KimE6Kuk6a7R+O/HusH27C00KguVZpBqA0KxigkW/G83q0uSZPvs02fO9sOvN6LHgCKppFMnyqbUQWJK7Q9/UKpxPpQuAPT5aEqmc4SQ+sIoQi4xDVV64W55LIeWQOrZYG7tEk9ZnZP7vm0nK+naXwMQt0VbKhToh+C7CCccr0bLUTCcEf0ZWx7DSmD4hGN5naQ4XwiXOZGBAyHPKazZxHKKiufnFBeQBkQRN2XKLYp0lSDcrXctCA6VM3ByNQRELpiHwdJDHdQ4cdM27jjGOsUytj3OCv1Krn5N
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 13:57:46.2230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1d4dab-f0b1-4684-cac8-08d80245ef38
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB6436
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v14
- Removed xlnx,csi-pxl-format from required properties
- Added dependency of xlnx,csi-pxl-format on xlnx,vfb
- End the yaml file with ...
- Added Reviewed by Laurent

v13
- Based on Laurent's suggestions
- Fixed the datatypes values as minimum and maximum
- condition added for en-vcx property

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

 .../bindings/media/xilinx/xlnx,csi2rxss.yaml       | 237 +++++++++++++++++++++
 1 file changed, 237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
new file mode 100644
index 0000000..2282231
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
@@ -0,0 +1,237 @@
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
+      - anyOf:
+        - minimum: 0x1e
+        - maximum: 0x24
+        - minimum: 0x28
+        - maximum: 0x2f
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
+      When present, there are maximum 16 virtual channels, else only 4.
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
+  - ports
+
+allOf:
+  - if:
+    required:
+      - xlnx,vfb
+    then:
+      required:
+        - xlnx,csi-pxl-format
+    else:
+      properties:
+        xlnx,csi-pxl-format: false
+
+  - if:
+    not:
+      required:
+        - xlnx,en-csi-v2-0
+    then:
+      properties:
+        xlnx,en-vcx: false
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
+...
-- 
2.1.1

