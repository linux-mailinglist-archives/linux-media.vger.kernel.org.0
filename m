Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13736539B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbfGKJQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:16:47 -0400
Received: from mail-eopbgr770050.outbound.protection.outlook.com ([40.107.77.50]:1408
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726088AbfGKJQr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViNQEEL322+3Anr9wLLk4w2zpOkXnKqSRA3Opg8l2cY=;
 b=AaN72X0YICxTRQ2rxU5KOfjkqssLEfhFFaeYQeIeF8CGX9CyppxBFz39L6R2d/dkgXL1PT1lmwNuy1C3wQxt0w1PtO2zTcyEHQJ2T9JPJ/6dK/1DfehR8SNTIG5ioX8NdanBaM2A2NIMZoNFSAJu0LBu225SuEJVsq4erAPUyw8=
Received: from SN4PR0201CA0012.namprd02.prod.outlook.com
 (2603:10b6:803:2b::22) by MWHPR02MB2382.namprd02.prod.outlook.com
 (2603:10b6:300:5b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 11 Jul
 2019 09:16:41 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by SN4PR0201CA0012.outlook.office365.com
 (2603:10b6:803:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.21 via Frontend
 Transport; Thu, 11 Jul 2019 09:16:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
 via Frontend Transport; Thu, 11 Jul 2019 09:16:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47259 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hlVBv-0000EI-1A; Thu, 11 Jul 2019 02:16:39 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hlVBp-0000LE-Tb; Thu, 11 Jul 2019 02:16:33 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x6B9GPtI011174;
        Thu, 11 Jul 2019 02:16:25 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hlVBg-0000I3-H1; Thu, 11 Jul 2019 02:16:24 -0700
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
Subject: [PATCH v10 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
Date:   Thu, 11 Jul 2019 14:46:11 +0530
Message-Id: <20190711091612.98175-2-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711091612.98175-1-vishal.sagar@xilinx.com>
References: <20190711091612.98175-1-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(189003)(199004)(70206006)(6666004)(356004)(478600001)(14444005)(2906002)(8676002)(47776003)(81156014)(81166006)(305945005)(336012)(9786002)(63266004)(8936002)(50466002)(5660300002)(4326008)(70586007)(86362001)(2870700001)(106002)(426003)(48376002)(50226002)(7416002)(1076003)(26005)(54906003)(36756003)(486006)(2616005)(126002)(51416003)(76176011)(7696005)(186003)(110136005)(446003)(11346002)(44832011)(316002)(476003)(36386004)(921003)(5001870100001)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB2382;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;MX:1;A:1;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6cd3d4f-47e3-498d-c5ed-08d705e07c0c
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:MWHPR02MB2382;
X-MS-TrafficTypeDiagnostic: MWHPR02MB2382:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2382F6ED549FBB95CA20ABBBF6F30@MWHPR02MB2382.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0095BCF226
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pZRLNTo5DX2aJw9FJZ6JRrKSUeXnqmjqzCFCElcS4FHd+YobxCKmAR/dxyoU4AiGDl5YpoxM5EbJUTjuEvQbEijGvI96YXdXRCEMOESo26a58JtZVRfgGydXRpXVu2q5vIl1eg5XOBshc8rGPCh9sDXNEFHI121R1lJZ3JnyXQRZsENpw5i0CthpWxcTPilMqY1k5TAmgUWS1RFb9KxPfV7dzUund1+zLXi5BgH3WjFjyEmF3r8IsBDNpzv3yehTWz6/nBuDXO/mN2GlHY1CZ9tZOO7QzZYOfH4GF0iHj1hkSBeBoiCPEnR1W7QF+FcxpFDLeefApft7PgRa5Kx+WLTXUUqfkwRKBBgDbTsKLsmNkr2Amwe3XbQJsVJa8ZjVoMJaQPzsiJ+nC9MUNU8uS/9NmX51zxORRT7QVsNlGXU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2019 09:16:40.5867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cd3d4f-47e3-498d-c5ed-08d705e07c0c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2382
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
index 000000000000..913b28d543c8
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
+- compatible: Must contain "xlnx,mipi-csi2-rx-subsystem-4.0".
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
+		compatible = "xlnx,mipi-csi2-rx-subsystem-4.0";
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

