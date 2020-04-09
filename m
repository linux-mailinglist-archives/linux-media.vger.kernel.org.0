Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDF811A3AC6
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 21:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgDITrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 15:47:37 -0400
Received: from mail-dm6nam12on2070.outbound.protection.outlook.com ([40.107.243.70]:21216
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725970AbgDITrg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 15:47:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dc986nz3NUfkxKB/pLdXO6hgW5kZQQa42DiJWwFeyLDN2we8ge8f+d3JITiNJ9A5l+N4+kQU6y1vqH+3b2sSJEPDXuie1bJxYw+4hblaJFw57ArrXG1gD+ylewAhT8ooimtfa+ZfKH+QDFafxzTyh1/SlLU/NBfFLlB+PUU3cnuiQ29s6p7K5fr7ImzjT6VASBPfu6pqEN3O23HknbRyUf7qZuPWKxzNNOQ2QH5/FB65EMiY89PHr8yJsk1QZReLsjGcKuyCTN3lT0cIzczLX3vJS60pwC+LYuXVTEU/6XzyvTCVkWXVDLBWWB3fpB8/chs7ZbvSlF+L13YlDcb4Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liBPGIamiHWdgJINruw5AR6u9yWxB6ro7k98ceBf8ok=;
 b=YjurqLcV05jZUJiapGIFfKKSp5g/lrDJtmfGsnspith8t3JPLfkMZdcrEiOmKUT+IDHf7Ia/IgZo6tMXM5h2h4c6hTyYLrPj6Ps6/3RD5CJ3z2lsRotloHL3xAYpI61fIHlHc+t6K+nFKZKnzbQYS/A44DTI5/rzFM4mYkwROmLO13Nl39qjXI/vaa6j2w9aFLt8Ty3nIe3QorxT+6q4uJYRVqo3bPCZswUYGfWPgnVLlDWwPSiIxErd0945h+Rm/7ymcas51nQZYul/S8GTbJh5FZ0WUhm4GKZUrJjyNVyk1by1e/gXbqDTstRenkpCYWcvRCso5NK5tM0tI0b5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liBPGIamiHWdgJINruw5AR6u9yWxB6ro7k98ceBf8ok=;
 b=JN9T4W7rFJ8PRySypu5O/Upi2NFQbrU7/XfbVN5ywdXTeHf+AbS3fLM0lfI1QBIK04FtCQhfeowWG08Ozt+/oBqm3zMQpFfaXpflWajNx1e8GRWODnGZR/zkGyregq6I0UslRuJt0Y3yIyV1G2sz9Uwu4YcP+fJLjGNF5zK9W9c=
Received: from BL0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:91::34)
 by BL0PR02MB4673.namprd02.prod.outlook.com (2603:10b6:208:55::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Thu, 9 Apr
 2020 19:44:57 +0000
Received: from BL2NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:91:cafe::59) by BL0PR05CA0024.outlook.office365.com
 (2603:10b6:208:91::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.11 via Frontend
 Transport; Thu, 9 Apr 2020 19:44:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT030.mail.protection.outlook.com (10.152.77.172) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 19:44:57
 +0000
Received: from [149.199.38.66] (port=36420 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jMd6E-00075C-IS; Thu, 09 Apr 2020 12:44:30 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jMd6f-00089I-2r; Thu, 09 Apr 2020 12:44:57 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 039Jike4009384;
        Thu, 9 Apr 2020 12:44:46 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jMd6U-00083q-9p; Thu, 09 Apr 2020 12:44:46 -0700
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
Subject: [PATCH v11 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
Date:   Fri, 10 Apr 2020 01:14:23 +0530
Message-Id: <20200409194424.45555-2-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200409194424.45555-1-vishal.sagar@xilinx.com>
References: <20200409194424.45555-1-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966005)(81156014)(478600001)(4326008)(82740400003)(316002)(36756003)(2906002)(7416002)(81166007)(5660300002)(6666004)(70586007)(70206006)(47076004)(356004)(1076003)(8676002)(336012)(44832011)(426003)(2616005)(8936002)(9786002)(26005)(186003)(54906003)(110136005)(7696005)(921003)(1121003);DIR:OUT;SFP:1101;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33dffecc-3a1c-4b9e-4cfa-08d7dcbe7bdd
X-MS-TrafficTypeDiagnostic: BL0PR02MB4673:
X-Microsoft-Antispam-PRVS: <BL0PR02MB46739849B31A78A3E0A5DA51A7C10@BL0PR02MB4673.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0368E78B5B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L9fP7nRkcilPMulTh7UrLm+3oD99RijyYSalgUJlCdYkXZ3Tm5KXXg0KTOiIF6Bd/TJrJSPwGv2cOeFhKQTMblUUC1CMLGTt+mAL0nO5DJFWIFuKBnpRamZELZRlffVP8upkNE1BMdzNCCqVmriuOn2zuZ29TSriyKkC5491vrT1hHZMQA9kNUxW7esKAAwB85NmyHPKEUgWMyPZoa5vewuvK/rcp0NTomuyr7Zz/13nA2+7hoxsz4ZyHwsoSMnZ8NtD7u+tjodpklE64BTNCjrVwBhi7PIGowPkuA5n/Bnz4hTSa7+oEFRDl+uI6LtI8izX9DucTvUF6k/hcPKh75IBP3KOvbhw2Wmi68pM9ujwLdzu6i8WkpnwKFXwaoupFBTokGtwghkdYIbynL1qLTvSQkTJONiYlAVmZNE50l5UwiFRQzpake4ghAeP1GVX66wVOLYHVdZbFC1SBL0AMmTxMszqlOmC5YuAI34PdyrYig+GDYKzfsvhWQ+dafcefNSQ8Jw4/ZLBtBWp0tUiXZ7jsjs2m1q6ngXY9MAoZus=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 19:44:57.6032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33dffecc-3a1c-4b9e-4cfa-08d7dcbe7bdd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4673
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.

The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
DPHY in Rx mode, an optional I2C controller and a Video Format Bridge.

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
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
 .../bindings/media/xilinx/xlnx,csi2rxss.txt   | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
new file mode 100644
index 000000000000..9269a5c880aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
@@ -0,0 +1,116 @@
+Xilinx MIPI CSI2 Receiver Subsystem Device Tree Bindings
+--------------------------------------------------------
+
+The Xilinx MIPI CSI2 Receiver Subsystem is used to capture MIPI CSI2 traffic
+from compliant camera sensors and send the output as AXI4 Stream video data
+for image processing.
+
+The subsystem consists of a MIPI DPHY in slave mode which captures the
+data packets. This is passed along the MIPI CSI2 Rx IP which extracts the
+packet data. The optional Video Format Bridge (VFB) converts this data to
+AXI4 Stream video data.
+
+For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Subsystem.
+
+Required properties:
+--------------------
+- compatible: Must contain "xlnx,mipi-csi2-rx-subsystem-5.0".
+- reg: Physical base address and length of the registers set for the device.
+- interrupts: Property with a value describing the interrupt number.
+- clocks: List of phandles to AXI Lite and Video clocks.
+- clock-names: Must contain "lite_aclk" and "video_aclk" in the same order
+  as clocks listed in clocks property.
+- xlnx,csi-pxl-format: This denotes the CSI Data type selected in hw design.
+  Packets other than this data type (except for RAW8 and User defined data
+  types) will be filtered out. Possible values are as below -
+  0x1E - YUV4228B
+  0x1F - YUV42210B
+  0x20 - RGB444
+  0x21 - RGB555
+  0x22 - RGB565
+  0x23 - RGB666
+  0x24 - RGB888
+  0x28 - RAW6
+  0x29 - RAW7
+  0x2A - RAW8
+  0x2B - RAW10
+  0x2C - RAW12
+  0x2D - RAW14
+  0x2E - RAW16
+  0x2F - RAW20
+
+
+Optional properties:
+--------------------
+- xlnx,vfb: Present when Video Format Bridge is enabled in IP configuration
+- xlnx,en-csi-v2-0: Present if CSI v2 is enabled in IP configuration.
+- xlnx,en-vcx: When present, there are maximum 16 virtual channels, else
+  only 4. This is present only if xlnx,en-csi-v2-0 is present.
+- xlnx,en-active-lanes: present if the number of active lanes can be
+  re-configured at runtime in the Protocol Configuration Register.
+  Otherwise all lanes, as set in IP configuration, are always active.
+- reset-gpios: Optional specifier for a GPIO that asserts video_aresetn.
+
+Ports
+-----
+The device node shall contain two 'port' child nodes as defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+The port@0 is a sink port and shall connect to CSI2 source like camera.
+
+The port@1 is a source port and can be connected to any video processing IP
+which can work with AXI4 Stream data.
+
+Required port properties:
+--------------------
+- reg: 0 - for sink port.
+       1 - for source port.
+
+Required endpoint property:
+---------------------------
+- data-lanes: specifies MIPI CSI-2 data lanes as covered in video-interfaces.txt.
+  This is required only in the sink port 0 endpoint which connects to MIPI CSI2
+  source like sensor. The possible values are:
+  1       - For 1 lane enabled in IP.
+  1 2     - For 2 lanes enabled in IP.
+  1 2 3   - For 3 lanes enabled in IP.
+  1 2 3 4 - For 4 lanes enabled in IP.
+
+Example:
+
+	xcsi2rxss_1: csi2rx@a0020000 {
+		compatible = "xlnx,mipi-csi2-rx-subsystem-5.0";
+		reg = <0x0 0xa0020000 0x0 0x10000>;
+		interrupt-parent = <&gic>;
+		interrupts = <0 95 4>;
+		xlnx,csi-pxl-format = <0x2a>;
+		xlnx,vfb;
+		xlnx,en-active-lanes;
+		xlnx,en-csi-v2-0;
+		xlnx,en-vcx;
+		clock-names = "lite_aclk", "video_aclk";
+		clocks = <&misc_clk_0>, <&misc_clk_1>;
+		reset-gpios = <&gpio 86 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				/* Sink port */
+				reg = <0>;
+				csiss_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					/* MIPI CSI2 Camera handle */
+					remote-endpoint = <&camera_out>;
+				};
+			};
+			port@1 {
+				/* Source port */
+				reg = <1>;
+				csiss_out: endpoint {
+					remote-endpoint = <&vproc_in>;
+				};
+			};
+		};
+	};
-- 
2.21.0

