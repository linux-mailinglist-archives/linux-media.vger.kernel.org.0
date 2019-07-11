Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A6F65398
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfGKJQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:16:37 -0400
Received: from mail-eopbgr770047.outbound.protection.outlook.com ([40.107.77.47]:12516
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726088AbfGKJQg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azZC8C07v5w/GIFcYL+MaHUw0oO2Q4FSb3CMAyts7JU=;
 b=RUtNHO4LQbeC3qREbooI4w09QM/aPaUAmBHgEGTQ1ZnKdo2l3xG00njLtk/j70LKqpPFASbrAVBB/TS8ERc90GVNzREpbePVb69TSthvYgjY2yvepsTZoMRHgURo2vltCAZq8BGxgE6GoZ5NODBeSgOsJ7tM1UluWFGQ8XU8GLw=
Received: from BYAPR02CA0058.namprd02.prod.outlook.com (2603:10b6:a03:54::35)
 by BN6PR02MB2372.namprd02.prod.outlook.com (2603:10b6:404:2b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18; Thu, 11 Jul
 2019 09:16:30 +0000
Received: from BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by BYAPR02CA0058.outlook.office365.com
 (2603:10b6:a03:54::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Thu, 11 Jul 2019 09:16:30 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT063.mail.protection.outlook.com (10.152.77.121) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
 via Frontend Transport; Thu, 11 Jul 2019 09:16:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47140 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hlVBk-0000EC-QS; Thu, 11 Jul 2019 02:16:28 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hlVBf-0000JY-Lk; Thu, 11 Jul 2019 02:16:23 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x6B9GKDj011170;
        Thu, 11 Jul 2019 02:16:20 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hlVBb-0000I3-Pb; Thu, 11 Jul 2019 02:16:20 -0700
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
Subject: [PATCH v10 0/2] Add support for Xilinx CSI2 Receiver Subsystem
Date:   Thu, 11 Jul 2019 14:46:10 +0530
Message-Id: <20190711091612.98175-1-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(2980300002)(199004)(189003)(426003)(50466002)(86362001)(48376002)(1076003)(316002)(126002)(110136005)(106002)(356004)(6666004)(476003)(186003)(70586007)(2616005)(70206006)(5660300002)(26005)(336012)(14444005)(36386004)(486006)(4326008)(9786002)(63266004)(8676002)(47776003)(50226002)(51416003)(7696005)(478600001)(7416002)(107886003)(2906002)(2870700001)(305945005)(44832011)(36756003)(81156014)(81166006)(8936002)(921003)(1121003)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB2372;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;A:1;MX:1;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 711b17fa-9bfa-40ee-5246-08d705e0755b
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BN6PR02MB2372;
X-MS-TrafficTypeDiagnostic: BN6PR02MB2372:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2372E002A9949736D03C2410F6F30@BN6PR02MB2372.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0095BCF226
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rWKy3y02f0s0zaO71jRd7EhDE/IrknSZpQWcREd/thhMD6GgA3d7ROK4bvTUagdbt24GszMnNKVTzCUpdXD2sMDXNzAKlw4l1LtFcZvs35xAH0KdhO1uPLRyc3sk8doBZzcx2YidKQ5t7N3BHBv/elR55sbrOxWGQHSphdWDPC8Z0pJFApbPe8PnjwwV3dfkBVJpykG3Ow4+NcyZw2ue8tNo6lWEg3+bdmT/yiza2GEmeU3HxD3W7xII/SHlHZ/eeZ5j2jumtffsgNEWRqP58xYQvgIRNFEz1bmPg8SOuSmCE3lmwCvNt7Df3Dd7ViPOoJM6ofkMXpcbbqe1KOscagx9jOtltQcOC9IpatAzPZKqGBJOUY+/MN8yt6pjtnigwg1jvKkJoiT5lXG1EGlyLy2ysKEcmSfGn6QW22SfQ4A=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2019 09:16:29.3574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 711b17fa-9bfa-40ee-5246-08d705e0755b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2372
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Xilinx MIPI CSI-2 Receiver Subsystem
------------------------------------

The Xilinx MIPI CSI-2 Receiver Subsystem Soft IP consists of a DPHY which
gets the data, an optional I2C, a CSI-2 Receiver which parses the data and
converts it into AXIS data.
This stream output maybe connected to a Xilinx Video Format Bridge.
The maximum number of lanes supported is fixed in the design.

The pixel format set in design acts as a filter allowing only the selected
data type or RAW8 data packets. The D-PHY register access can be gated in
the design. The base address of the DPHY depends on whether the internal
Xilinx I2C controller is enabled or not in design.

The device driver registers the MIPI CSI2 Rx Subsystem as a V4L2 sub device
having 2 pads. The sink pad is connected to the MIPI camera sensor and
output pad is connected to the video node.
Refer to xlnx,csi2rxss.txt for device tree node details.

This driver helps enable the core, setting and handling interrupts.
It logs the number of events occurring according to their type between
streaming ON and OFF.

The Xilinx CSI-2 Rx Subsystem outputs an AXI4 Stream data which can be
used for image processing. This data follows the video formats mentioned
in Xilinx UG934 when the Video Format Bridge is enabled.

v10
- 1/2
  - No changes
- 2/2
  - Removed all V4L2 controls and events.
  - Now stop_stream() before toggling rst_gpio
  - Updated init_mbus() to throw error on array out of bound access
  - Added XADD_MBUS macro
  - Make events and vcx_events as counters instead of structures
  - Minor fixes in set_format() enum_mbus_code() as suggested by Sakari

v9
- 1/2
  - Fix xlnx,vfb description.
  - s/Optional/Required endpoint property.
  - Move data-lanes description from Ports to endpoint property section.
- 2/2
  - Moved all controls and events to xilinx-csi2rxss.h
  - Updated name and description of controls and events
  - Get control base address from v4l2-controls.h (0x10c0)
  - Fix KConfig for dependency on VIDEO_XILINX
  - Added enum_mbus_code() support
  - Added default format to be returned on open()
  - Mark variables are const
  - Remove references to short packet in comments
  - Add check for streaming before setting active lanes control
  - strlcpy -> strscpy
  - Fix xcsi2rxss_set_format()

v8
- 1/2
  - Added reset-gpios optional property
- 2/2
  - Use clk_bulk* APIs
  - Add gpio reset for asserting video_aresetn when stream line buffer occurs
  - Removed short packet related events and irq handling
    - V4L2_EVENT_XLNXCSIRX_SPKT and V4L2_EVENT_XLNXCSIRX_SPKT_OVF removed
  - Removed frame counter control V4L2_CID_XILINX_MIPICSISS_FRAME_COUNTER
    and xcsi2rxss_g_volatile_ctrl()
  - Minor formatting fixes

v7
- 1/2
  - Removed the name of control from en-active-lanes as suggested by Sakari
  - Updated the dt node name to csi2rx
- 2/2
  - No change

v6
- 1/2
  - Added minor comment by Luca
  - Added Reviewed by Rob Herring
- 2/2
  - No change

v5
- 1/2
  - Removed the DPHY clock description and dt node.
  - removed bayer pattern as CSI doesn't deal with it.
- 2/2
  - removed bayer pattern as CSI doesn't deal with it.
  - add YUV422 10bpc media bus format.

v4
- 1/2
  - Added reviewed by Hyun Kwon
- 2/2
  - Removed irq member from core structure
  - Consolidated IP config prints in xcsi2rxss_log_ipconfig()
  - Return -EINVAL in case of invalid ioctl
  - Code formatting
  - Added reviewed by Hyun Kwon

v3
- 1/2
  - removed interrupt parent as suggested by Rob
  - removed dphy clock
  - moved vfb to optional properties
  - Added required and optional port properties section
  - Added endpoint property section
- 2/2
 - Fixed comments given by Hyun.
 - Removed DPHY 200 MHz clock. This will be controlled by DPHY driver
 - Minor code formatting
 - en_csi_v20 and vfb members removed from struct and made local to dt parsing
 - lock description updated
 - changed to ratelimited type for all dev prints in irq handler
 - Removed YUV 422 10bpc media format

v2
- 1/2
  - updated the compatible string to latest version supported
  - removed DPHY related parameters
  - added CSI v2.0 related property (including VCX for supporting upto 16
    virtual channels).
  - modified csi-pxl-format from string to unsigned int type where the value
    is as per the CSI specification
  - Defined port 0 and port 1 as sink and source ports.
  - Removed max-lanes property as suggested by Rob and Sakari

- 2/2
  - Fixed comments given by Hyun and Sakari.
  - Made all bitmask using BIT() and GENMASK()
  - Removed unused definitions
  - Removed DPHY access. This will be done by separate DPHY PHY driver.
  - Added support for CSI v2.0 for YUV 422 10bpc, RAW16, RAW20 and extra
    virtual channels
  - Fixed the ports as sink and source
  - Now use the v4l2fwnode API to get number of data-lanes
  - Added clock framework support
  - Removed the close() function
  - updated the set format function
  - Support only VFB enabled config

Vishal Sagar (2):
  media: dt-bindings: media: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
  media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem driver

 .../bindings/media/xilinx/xlnx,csi2rxss.txt   |  116 ++
 drivers/media/platform/xilinx/Kconfig         |   11 +
 drivers/media/platform/xilinx/Makefile        |    1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 1230 +++++++++++++++++
 4 files changed, 1358 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c

-- 
2.21.0

