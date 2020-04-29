Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAD01BE094
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 16:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgD2OSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 10:18:05 -0400
Received: from mail-eopbgr700055.outbound.protection.outlook.com ([40.107.70.55]:22112
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726701AbgD2OSE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 10:18:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5BviPSTY7PsYX3mmcaKVEkFMdDH2Z5c7jX8ZqAEQGSWN024T3OSiNbrmO+2f13Vo9CYPAKLxKtmL+c4W+5GM6jHpMnp4CwJd9XRgLCEhHxHOAfSA0bxcf3bh+yHNut2JswtThnfxHnK1OrkOYm2QcG9XRkKVCdO2vB68jJWOCnGSJDYEWLNM86ay8Q8JtX8GNcbtn57P7b6fmah3vx1pg98j2opzXqqOBAiJF0BE02aaIHQJCsEnEcnupQ3KaSSmUEnV2YqJ+GLcTpJYHoG8zKITc4pzpoaIIaCCsuPv+tKgcEjHSHecYLWhFWv2tWlyqT+4S4oLoBmOW7QpUw+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Etzpn6tzGE/Y5aOX7dnLk1IdG2C7CP3cb0VmoiAI6TM=;
 b=CVlp1WN2CC4cekRxH/XAc2RMKVk3PoTAq5tlT42sRjSjj/hNJdBqCPdDK7O4A0QTJ0G+uS2+lRj4YkGMZFNVdLzDUSZNtsASRs7L+Edx2i+ARtYWgFoRfglbkK87CnXwPEeI8PKpFmZGRDEF9v9sAbgmYmoAyAaHd8vtIjJYYxhk1xDeEYxdKZzfDeYvuoEyVqZ/6MOkqua67VkIjXIDwLBAATteptjCsLkAyOTTLEFumgtw1kNMnstCfc0iBz2sEji54fvIswxqr6jkskR2jMSXYMULzZQOUlFWSMDo5/SJP0Xgwbc5ebXrxyR27414fqM4ZExoi2/ydXCKVFPvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=perches.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Etzpn6tzGE/Y5aOX7dnLk1IdG2C7CP3cb0VmoiAI6TM=;
 b=pUkm0ymWy1nsxy861MxNHfwDx8aNe6//lLhvSFCso94ErH0McnRK/L3yNPNXi+ZSIhOZ2Jng+fok/jb7YBHCrjzK6+9xkJevFipuY8ihr0TVt3FoEGMj2P6HmFQqYCLIYhZYC/Odn9NfNNZMaEuQWJ37wIXO7DWAn3MHCa5tvcc=
Received: from CY4PR15CA0018.namprd15.prod.outlook.com (2603:10b6:910:14::28)
 by BYAPR02MB4872.namprd02.prod.outlook.com (2603:10b6:a03:46::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 14:17:25 +0000
Received: from CY1NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:14:cafe::9e) by CY4PR15CA0018.outlook.office365.com
 (2603:10b6:910:14::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Wed, 29 Apr 2020 14:17:25 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT056.mail.protection.outlook.com (10.152.74.160) with Microsoft SMTP
 Server id 15.20.2937.19 via Frontend Transport; Wed, 29 Apr 2020 14:17:25
 +0000
Received: from [149.199.38.66] (port=42024 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jTnWZ-0006Ii-Tt; Wed, 29 Apr 2020 07:17:19 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jTnWe-0007vB-Ua; Wed, 29 Apr 2020 07:17:24 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03TEHFSB028449;
        Wed, 29 Apr 2020 07:17:15 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jTnWV-0007pS-5R; Wed, 29 Apr 2020 07:17:15 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Joe Perches <joe@perches.com>
Cc:     Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH v2 1/2] media: dt-bindings: media: xilinx: Add Xilinx UHD-SDI Receiver Subsystem
Date:   Wed, 29 Apr 2020 19:47:03 +0530
Message-Id: <20200429141705.18755-2-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200429141705.18755-1-vishal.sagar@xilinx.com>
References: <20200429141705.18755-1-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(8936002)(2906002)(70586007)(316002)(47076004)(110136005)(9786002)(36756003)(7416002)(7696005)(8676002)(5660300002)(4326008)(82310400002)(356005)(426003)(26005)(186003)(81166007)(966005)(1076003)(478600001)(82740400003)(70206006)(2616005)(44832011)(6666004)(336012)(107886003)(921003);DIR:OUT;SFP:1101;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e78e1eec-d332-4acb-ad10-08d7ec480a64
X-MS-TrafficTypeDiagnostic: BYAPR02MB4872:
X-Microsoft-Antispam-PRVS: <BYAPR02MB487209EC9F4C5CB42D1EB7B0A7AD0@BYAPR02MB4872.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-Forefront-PRVS: 03883BD916
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aOLTtcyHdQINdIJ0HLnbcgdc/LhtonED2VhxvAHuvlfOTz0fjmfX5xkSfiyK+MHm3eN1SEXkOtC17L+0Y0ZHYjPMlUt4EWWoZrk9z2r1zMT5F8tc1GUH2i+lDe6kWU37Bk4dO48EUSnJY4aUjFZWWIaYnzAwx1geAt3M+BNbIV+IJUqqe22z4+62HlWR6hvYoHYcrFDSEhmWOq8W811ijlInfyNMNqdfZHTLsgW3nBl9zNruOteoisQxCKegiiX4IAsFrx5zc016b+84iCtCcUYVeCBTtBYfE3W7q1PammBSkxRlFwNJghBLdqjY/BslBznCyQtL8f7ITVEpK6/hLBfJboWiPaE1mvynrWp2Zn2RermeKKTYAS2LIZJ3NwQIv+iMlSNOrkk/xrrIgOvSdvaZfm8S1uDF3Iwdtq8TYAlezMiPc+S/Zmj0tSAOgFzojtNnomOJzWxzNzQIy2xC9dFEJsWKKsrFYl0qWIOYkR+FpYMb5qSNmVKGN20lz61avoSKUiqzU6V9/gyCsE0ouD0gmdhXuRCI835w8YNFRiwKXxzDJBqDFJuhH/6julzyg8VFyfDY/X6aF1UqfdrbHRK9kxhO8tHyGnPaKzv8C4s=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 14:17:25.2230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78e1eec-d332-4acb-ad10-08d7ec480a64
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4872
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
v2
- Removed references to xlnx,video*
- Fixed as per Sakari Ailus and Rob Herring's comments
- Converted to yaml format

 .../bindings/media/xilinx/xlnx,sdirxss.yaml   | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
new file mode 100644
index 000000000000..9133ad19df55
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/xilinx/xlnx,sdirxss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+
+title: Xilinx SMPTE UHD-SDI Receiver Subsystem
+
+maintainers:
+  - Vishal Sagar <vishal.sagar@xilinx.com>
+
+description: |
+  The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create systems
+  based on SMPTE SDI protocols. It receives unaligned native SDI streams from
+  the SDI GT PHY and outputs an AXI4-Stream video stream, native video, or
+  native SDI using Xilinx transceivers as the physical layer.
+
+  The subsystem consists of
+  1 - SMPTE UHD-SDI Rx
+  2 - SDI Rx to Native Video Bridge
+  3 - Video In to AXI4-Stream Bridge
+
+  The subsystem can capture SDI streams in upto 12G mode 8 data streams and output
+  a dual pixel per clock RGB/YUV444,422/420 10/12 bits per component AXI4-Stream.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - xlnx,v-smpte-uhdsdi-rx-ss-2.0
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
+      - description: AXI4-Lite clock
+      - description: SMPTE UHD-SDI Rx core clock
+      - description: Video clock
+
+  clock-names:
+    items:
+      - const: s_axi_aclk
+      - const: sdi_rx_clk
+      - const: video_out_clk
+
+  xlnx,bpp:
+    description: Bits per pixel supported. Can be 10 or 12 bits per pixel only.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum: [10, 12]
+
+  xlnx,line-rate:
+    description: |
+      The maximum mode supported by the design. Possible values are as below
+      12G_SDI_8DS - 12G mode with 8 data streams
+      6G_SDI      -  6G mode
+      3G_SDI      -  3G mode
+    enum:
+      - 12G_SDI_8DS
+      - 6G_SDI
+      - 3G_SDI
+
+  xlnx,include-edh:
+    type: boolean
+    description: |
+      This is present when the Error Detection and Handling processor is
+      enabled in design.
+
+  ports:
+    type: object
+    description: |
+      Generally the SDI port is connected to a device like SDI Broadcast camera
+      which is independently controlled. Hence port@0 is a source port which can be
+      connected to downstream IP which can work with AXI4 Stream data.
+    properties:
+      port@0:
+        type: object
+        description: Source port
+        properties:
+          reg:
+            const: 0
+          endpoint:
+            type: object
+            properties:
+              remote-endpoint: true
+            required:
+              - remote-endpoint
+            additionalProperties: false
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - xlnx,line-rate
+  - xlnx,bpp
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    uhdsdirxss: v-smpte-uhdsdi-rxss@80000000 {
+      compatible = "xlnx,v-smpte-uhdsdi-rx-ss-2.0";
+      interrupt-parent = <&gic>;
+      interrupts = <0 89 4>;
+      reg = <0x0 0x80000000 0x0 0x10000>;
+      xlnx,include-edh;
+      xlnx,line-rate = "12G_SDI_8DS";
+      clocks = <&clk_1>, <&si570_1>, <&clk_2>;
+      clock-names = "s_axi_aclk", "sdi_rx_clk", "video_out_clk";
+      xlnx,bpp = <10>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port@0 {
+          reg = <0>;
+          sdirx_out: endpoint {
+            remote-endpoint = <&vcap_sdirx_in>;
+          };
+        };
+      };
+    };
-- 
2.21.0

