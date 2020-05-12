Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFBAC1CF8ED
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 17:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730593AbgELPUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 11:20:25 -0400
Received: from mail-dm6nam10on2066.outbound.protection.outlook.com ([40.107.93.66]:48641
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730527AbgELPUY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 11:20:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5j3DEknyFCnPQsec278KHi/jyAyGcsAQc6fppNZ6yRPuVCn3NjHp5Rgb21Edk5hi+tDaISgh4hPmsA7wXmteX2SoUTFgDLxm1FR4uLnsyt2DLn0Q4UV61UQ3W+LxS/x/j/fMhlFCHtaCbxUmmOdDXhq5/j5pTfPsKZxPPa9S/AmY6pqgceEZUiElKxwjtPkaZWMzTjb0qgvmJJGX7F2c+DfuV/b9i90uZyCkJpFumiAoY6PxeBUE6Q7KkKjwd4n+WtyW6uPIOYp9Pd6daGmf1CjQuLvNGcRAp5hNPCrn/zUUxdjBXW1/RURNCYV78p0t/AOCZOyVCEdEWxF945Pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNHWCsOml36uiq4/r17C8XRAxXNriGIEbEC0YPNIQo4=;
 b=VvLTB9k2C5S8uJtyqDTA76xr3UjO1JHbxiUfj5Kk5zO0yzb3CIN59NMo7jApJRPAckLaBAt4GP/U8faPONDcF0G8kr9mnT2hPyoNU4kqGWXJKkeAGwyYw14edgr0j5EWauaaqG2VdMaaZQxcyAqWfBSXzz1HMBz6oIJeTN0jvfsEU8v4+76a/EwIxgeXGS3Uw1CLVtRvDdmFzwULznyIvGEyu4nZmkWyYNwXSBzFCTFVgeN4tHj6XVnd12oLJPwHAGC5RAX6k4F01HrMAA9wdhQA4e6cYu3PMvkyMD85/W3vKvUF8sMNGL12mSOT4ixSspA3zG0VvR3HTiuPYuuh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNHWCsOml36uiq4/r17C8XRAxXNriGIEbEC0YPNIQo4=;
 b=AFVJDcAdB0/BgeU8Y/ix0XG2OkOzxWh6cHiIqtzpQT/IAe0VKJYpnJJJeipgZIuEUpmYg/BQWhRuN1/bJDJzm1teGeJsfFhh0obmoyUg1xeAR7dEpNlInRFawO6SyVTVbI8fd+0JvgKuGjHdfOKFwx5iFQQkOGiX3VF92gST3Nk=
Received: from MN2PR22CA0010.namprd22.prod.outlook.com (2603:10b6:208:238::15)
 by MN2PR02MB6621.namprd02.prod.outlook.com (2603:10b6:208:1db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 15:20:21 +0000
Received: from BL2NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:238:cafe::ef) by MN2PR22CA0010.outlook.office365.com
 (2603:10b6:208:238::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Tue, 12 May 2020 15:20:21 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT012.mail.protection.outlook.com (10.152.77.27) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Tue, 12 May 2020 15:20:20
 +0000
Received: from [149.199.38.66] (port=47702 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jYWhP-0004LE-PP; Tue, 12 May 2020 08:20:03 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jYWhg-0000YH-4e; Tue, 12 May 2020 08:20:20 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04CFK5nn030871;
        Tue, 12 May 2020 08:20:06 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jYWhQ-0008NS-TM; Tue, 12 May 2020 08:20:05 -0700
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
Cc:     Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v13 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
Date:   Tue, 12 May 2020 20:49:46 +0530
Message-Id: <20200512151947.120348-2-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200512151947.120348-1-vishal.sagar@xilinx.com>
References: <20200512151947.120348-1-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(396003)(376002)(39860400002)(346002)(46966005)(33430700001)(8936002)(9786002)(44832011)(8676002)(36756003)(356005)(7696005)(54906003)(7416002)(33440700001)(316002)(110136005)(5660300002)(82310400002)(186003)(26005)(426003)(81166007)(47076004)(82740400003)(4326008)(336012)(2616005)(478600001)(1076003)(70206006)(2906002)(6666004)(70586007)(966005)(921003);DIR:OUT;SFP:1101;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 019c6d05-b23a-4ffa-fa40-08d7f687fc0a
X-MS-TrafficTypeDiagnostic: MN2PR02MB6621:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6621D6600BEC3C647A1A51D5A7BE0@MN2PR02MB6621.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WhBed8RLVdpHE4zjtNgXbFZKaIr9KtazsVZB3LQY6LBGa6Y0Xpq6daDSQNS4PdMys+apWkwv3xoIC39A7ZgqKAp1Gc+ESjcaBYYTFr8TwBouj2AvhcoDfK48iTjeGFvz7+8swK+jg3BGPzgnrHD8C7TWjeup/7fO2/xdOHe4zsyhYJk3682rwtowtSmtCvhiFW7WK9Sg0iFgkkt0TJhjN/+y6IThXkJ2k2zR4+/Cm+c6Uee/D6jgIQGQHA77x404oiHyw6gyQN8QL74XAjdRxgyGvqc4JIJ9BCDz3Md53njiyMsZz1+a91qTXYhMXs6GNv0UR4hnWKeJIeruMGUXnndiO1OzGluozdUsoi8MaNc7nSWOzmGlu163D19aOXTD3dUos0FlruNfl/i3qbxeTGiwaRnOcc9VPum4kw1tT+v+nV/ygxce1muN8TDB/PelldU3PmiEqTzO0O9XOaBrnopT1cfNtwL0kasip97PC3iwlBdTyFbjXru3qa2zCDPhu40MdXdIEwSeO96q9lfhDGLbzg8Mx9NKdxJFO4ebBKC9Mt1jdQJy3rBxzYl9zIlYzlpzYS7sk9u+bTiYY5cVZgr96y6ayB8ETbO5PmIWBJxEypXjbo9iq7zDmol8L5i7wIXW9Hjn8tMchWFC1wHkYJNE9bf+TEe1veqF26wQEQI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 15:20:20.5630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 019c6d05-b23a-4ffa-fa40-08d7f687fc0a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6621
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
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 226 ++++++++++++++++++
 1 file changed, 226 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
new file mode 100644
index 000000000000..b0885f461785
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
@@ -0,0 +1,226 @@
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
+  - xlnx,csi-pxl-format
+  - ports
+
+if:
+  not:
+    required:
+      - xlnx,en-csi-v2-0
+then:
+  properties:
+    xlnx,en-vcx: false
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

