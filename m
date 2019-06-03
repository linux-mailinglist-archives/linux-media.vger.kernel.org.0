Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0322F32D52
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 12:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbfFCKAH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 06:00:07 -0400
Received: from mail-eopbgr790055.outbound.protection.outlook.com ([40.107.79.55]:49952
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726840AbfFCKAG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 06:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdE0TbbfuQ32l/U+1QKFYT8DZT0X+NRmCYit8gP8VUA=;
 b=DljMzrL733W0o5Zla2nzZgteqtXzRhlKOh3Pn/Zlpfw1CrES4ghnlcJ4wT7sCQ5dVD6ja0czU3pvRpsrEZs2XY8qEClKVTHJw+riaQAZ+fZNd2+W9100oLX6AW2XJT85OghcEbJXgkZ3zMNLB7rlOYGVxH5i8mLjnpY1nfMQ3U8=
Received: from DM6PR02CA0030.namprd02.prod.outlook.com (2603:10b6:5:1c::43) by
 DM5PR02MB2681.namprd02.prod.outlook.com (2603:10b6:3:10b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 09:59:59 +0000
Received: from SN1NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::207) by DM6PR02CA0030.outlook.office365.com
 (2603:10b6:5:1c::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.18 via Frontend
 Transport; Mon, 3 Jun 2019 09:59:59 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT042.mail.protection.outlook.com (10.152.73.149) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1943.19
 via Frontend Transport; Mon, 3 Jun 2019 09:59:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hXjkz-0006bR-Ur; Mon, 03 Jun 2019 02:59:57 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hXjku-0006Zl-SH; Mon, 03 Jun 2019 02:59:52 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x539xkAI007941;
        Mon, 3 Jun 2019 02:59:46 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hXjko-0006Xs-9O; Mon, 03 Jun 2019 02:59:46 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
Date:   Mon,  3 Jun 2019 15:29:30 +0530
Message-Id: <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(199004)(189003)(476003)(48376002)(50466002)(126002)(50226002)(446003)(8936002)(26005)(36386004)(11346002)(4720700003)(44832011)(486006)(6666004)(356004)(7416002)(316002)(63266004)(4326008)(77096007)(186003)(5660300002)(86362001)(7696005)(2616005)(16586007)(51416003)(76176011)(305945005)(70586007)(36756003)(336012)(2906002)(70206006)(14444005)(110136005)(47776003)(106002)(9786002)(81166006)(426003)(81156014)(8676002)(107886003)(478600001)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR02MB2681;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 344390e8-1f6d-4dbe-7206-08d6e80a3cef
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:DM5PR02MB2681;
X-MS-TrafficTypeDiagnostic: DM5PR02MB2681:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2681304C2E20A06C1112FC63F6140@DM5PR02MB2681.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0057EE387C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NwLsql219kHv7TH2SMmOfnSHOtlu2HBl/XJesmoh44hDjjua6w4gHpaHKXeLRqgPman8xAGkU8SPAFgqDhtL3hK5H/8zspcIuR301O1QJJ3XtwKme1qzQkOpHQ3K+2XORSdTApyyMjMBxovwXLePM09yeD7awn0n7owuE56rzak3p7iwIybQdNADlbZaJBKLsd3UmeYF2rHQ9ou8qUdqIx3HMmxWGsh8R6UHqfr09fj3DQb4sQNbJr43gwdSWB0dXMjEekFWuAR1V7d+Uc87aqFzFo/k2mHz0NCoM2pO4DVbIIxR3C6hT9IOa9pB9Rdg3TuO03NI6xhH+Cz6OJLLroGH2tyl9mkQoIErkFISiriobAOiZT8hJTjD95MlsBqCFtQKkBJ6Y68oVpVXNLEq2oJibYF2vA8Qm4yYC6Mqsro=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2019 09:59:58.4442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 344390e8-1f6d-4dbe-7206-08d6e80a3cef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2681
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

 .../bindings/media/xilinx/xlnx,csi2rxss.txt        | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
new file mode 100644
index 0000000..fef8179
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
@@ -0,0 +1,119 @@
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
+- xlnx,vfb: This is present when Video Format Bridge is enabled.
+  Without this property the driver won't be loaded as IP won't be able to generate
+  media bus format compliant stream output.
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
+It must have the data-lanes property.
+
+The port@1 is a source port and can be connected to any video processing IP
+which can work with AXI4 Stream data.
+
+Required port properties:
+--------------------
+- reg: 0 - for sink port.
+       1 - for source port.
+
+Optional endpoint property:
+---------------------------
+- data-lanes: specifies MIPI CSI-2 data lanes as covered in video-interfaces.txt.
+  This should be in the sink port endpoint which connects to MIPI CSI2 source
+  like sensor. The possible values are:
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
1.8.3.1

