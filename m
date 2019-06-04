Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C212534993
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 15:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfFDN47 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 09:56:59 -0400
Received: from mail-eopbgr820045.outbound.protection.outlook.com ([40.107.82.45]:36512
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727622AbfFDN45 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 09:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQNv3VBghq+BTGaaEwSVtqaUR1IxnU2QQKen8A52bkc=;
 b=Ro8R3prUKhJbv4skenWjt3xdo6lCsTE8OD6RQAmLf7QNI1FhxZHXWkjJbJ+lvloQWm3qO8jY/J0FEksHSMwMBdQ2+Nyzvm90JSABOAFwUToOqTro0zFJXN+9m0dgdN3/awlOWFtTJ6iaQMo4oWauJDAqs8Qs+38cbBfbk8Bl6ww=
Received: from BYAPR02CA0051.namprd02.prod.outlook.com (2603:10b6:a03:54::28)
 by BYAPR02MB4935.namprd02.prod.outlook.com (2603:10b6:a03:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17; Tue, 4 Jun
 2019 13:56:54 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by BYAPR02CA0051.outlook.office365.com
 (2603:10b6:a03:54::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17 via Frontend
 Transport; Tue, 4 Jun 2019 13:56:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1943.19
 via Frontend Transport; Tue, 4 Jun 2019 13:56:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hY9vo-0005GC-Qg; Tue, 04 Jun 2019 06:56:52 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hY9vj-00057J-NW; Tue, 04 Jun 2019 06:56:47 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x54DukXS006948;
        Tue, 4 Jun 2019 06:56:46 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hY9vh-00054P-Oj; Tue, 04 Jun 2019 06:56:46 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH 1/2] media: dt-bindings: media: xilinx: Add Xilinx UHD-SDI Receiver Subsystem
Date:   Tue,  4 Jun 2019 19:25:55 +0530
Message-Id: <1559656556-79174-2-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(2980300002)(199004)(189003)(4720700003)(4326008)(76176011)(478600001)(110136005)(86362001)(7696005)(51416003)(70586007)(16586007)(14444005)(316002)(70206006)(2906002)(107886003)(9786002)(36386004)(11346002)(186003)(77096007)(63266004)(44832011)(36756003)(26005)(48376002)(356004)(6666004)(50226002)(50466002)(81166006)(81156014)(106002)(305945005)(2616005)(54906003)(476003)(486006)(126002)(8936002)(336012)(8676002)(446003)(47776003)(5660300002)(426003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4935;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7361b989-9dfd-45ab-fcbc-08d6e8f48014
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BYAPR02MB4935;
X-MS-TrafficTypeDiagnostic: BYAPR02MB4935:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4935CED916219009C3C9D1C5F6150@BYAPR02MB4935.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FAefvWU/CRkxJYegV22UwcWMPpPzKkhRrGveC0NAG2BqOQN9ZxonnhsE25KQGLt5JWpC8CSWilYoSnkbjvV7uRW4ntDznH+QbAizvmYPXzeoNYA57DALTXsHxw5IwoMBwe6M4/UpvujiKJ6MfipOt+YnXdiZx2OcdeWbTxp9h8HEKyjCIJyDbx7DgquS1s0irDWZpMixWzQBT2ZF6eGOk1B8QDK0iBoxHAig6vKZ+g11gW6e2aZzCwRTAmmITb+FBxEyMPw0Pz8wI89s/sLNbSBkeaHMpzei5cEEHxFvnNz4z4tYZMzAZghQoXioflBtH0yPRcpn6ggE/BNf41xcbOF4s+HFEtkTDwhqX9NW8Zbp+MqpoIAIM65uVVWlNmcq7n1xMo407V77wfcilcnPNabL7sx+DIa+pOdrOIvSlb8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 13:56:53.2923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7361b989-9dfd-45ab-fcbc-08d6e8f48014
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4935
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings documentation for Xilinx UHD-SDI Receiver Subsystem.

The Xilinx UHD-SDI Receiver Subsystem consists of SMPTE UHD-SDI (RX) IP
core, an SDI RX to Video Bridge IP core to convert SDI video to native
video and a Video In to AXI4-Stream IP core to convert native video to
AXI4-Stream.

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
---
 .../bindings/media/xilinx/xlnx,sdirxss.txt         | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
new file mode 100644
index 0000000..8445bee
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
@@ -0,0 +1,80 @@
+
+Xilinx SMPTE UHD-SDI Receiver Subsystem Device Tree Bindings
+------------------------------------------------------------
+
+The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create systems
+based on SMPTE SDI protocols. It receives unaligned native SDI streams from
+the SDI GT PHY and outputs an AXI4-Stream video stream, native video, or
+native SDI using Xilinx transceivers as the physical layer.
+
+The subsystem consists of
+1 - SMPTE UHD-SDI Rx
+2 - SDI Rx to Native Video Bridge
+3 - Video In to AXI4-Stream Bridge
+
+The subsystem can capture SDI streams in utpo 12G mode and output a dual pixel
+per clock YUV 422 or 420 10 bits per component AXI4-Stream.
+
+Required properties:
+--------------------
+- compatible: Must contain "xlnx,v-smpte-uhdsdi-rx-ss"
+- reg: Physical base address and length of the registers set for the device.
+- interrupts: Contains the interrupt line number.
+- clocks: List of phandles to AXI4-Lite clock, core clock to SMPTE UHD-SDI Rx
+  and Video clocks.
+- clock-names: Must contain "s_axi_aclk", "sdi_rx_clk" and "video_out_clk" in
+  the same order as clocks listed in clocks property.
+- xlnx,line-rate: The maximum mode supported by the design. Possible values are
+  are as below -
+  12G_SDI_8DS	- 12G mode
+  6G_SDI	-  6G mode
+  3G_SDI	-  3G mode
+
+Optional properties:
+--------------------
+- xlnx,include-edh: This is present when the Error Detection and Handling
+  processor is enabled in design.
+
+Ports
+-----
+The device node shall contain one 'port' child node as defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Generally the SDI port is connected to a device like SDI Broadcast camera which
+is independently controlled. Hence port@0 is a source port which can be
+connected to downstream IP which can work with AXI4 Stream data.
+
+Required port properties:
+-------------------------
+- reg: 0 - for source port.
+
+- xlnx,video-format: This can be XVIP_VF_YUV_422 or XVIP_VF_YUV_420.
+- xlnx,video-width: This is should be 10.
+
+Example:
+		v_smpte_uhdsdi_rx_ss: v_smpte_uhdsdi_rx_ss@80000000 {
+			compatible = "xlnx,v-smpte-uhdsdi-rx-ss";
+			interrupt-parent = <&gic>;
+			interrupts = <0 89 4>;
+			reg = <0x0 0x80000000 0x0 0x10000>;
+			xlnx,include-edh;
+			xlnx,line-rate = "12G_SDI_8DS";
+			clocks = <&clk_1>, <&si570_1>, <&clk_2>;
+			clock-names = "s_axi_aclk", "sdi_rx_clk", "video_out_clk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					xlnx,video-format = <XVIP_VF_YUV_422>;
+					xlnx,video-width = <10>;
+
+					sdirx_out: endpoint {
+						remote-endpoint = <&vcap_sdirx_in>;
+					};
+				};
+			};
+		};
-- 
1.8.3.1

