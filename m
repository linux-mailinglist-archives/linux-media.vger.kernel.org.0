Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6E43C838
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 12:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbfFKKLH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 06:11:07 -0400
Received: from mail-eopbgr760088.outbound.protection.outlook.com ([40.107.76.88]:64322
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727641AbfFKKLG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 06:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHk81ag2Fs1KDQB6p35QTUeeBjjkkmIYRLGsS9gkdxc=;
 b=Z+sici6MUnauhYQ8dB2BZStT5JVhnwAdAbRoyQQMfP1RA8Y2LOhObjLJtV+e+96E2MOLLGvhwsH8mpVVCKMiLZ94tEKNoyfUj1OYLfUZcF0U0c/sV65ByW2sK9ab5jhIutV0bLBE+67Q3BvPZPnXImmj9FD/Hi78qW9pRq7eEGQ=
Received: from MWHPR0201CA0057.namprd02.prod.outlook.com
 (2603:10b6:301:73::34) by MWHPR02MB2686.namprd02.prod.outlook.com
 (2603:10b6:300:109::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.14; Tue, 11 Jun
 2019 10:11:03 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::201) by MWHPR0201CA0057.outlook.office365.com
 (2603:10b6:301:73::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12 via Frontend
 Transport; Tue, 11 Jun 2019 10:11:03 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
 via Frontend Transport; Tue, 11 Jun 2019 10:11:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60944 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hadk5-00073o-Sh; Tue, 11 Jun 2019 03:11:01 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hadk0-0002Cv-P2; Tue, 11 Jun 2019 03:10:56 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x5BAArBF020039;
        Tue, 11 Jun 2019 03:10:53 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hadjx-00029I-3o; Tue, 11 Jun 2019 03:10:53 -0700
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
Subject: [PATCH v9 0/2] Add support for Xilinx CSI2 Receiver Subsystem
Date:   Tue, 11 Jun 2019 15:40:07 +0530
Message-Id: <1560247809-117978-1-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 1.8.3.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(189003)(199004)(7416002)(478600001)(70586007)(70206006)(5660300002)(36756003)(2906002)(107886003)(63266004)(4326008)(9786002)(8936002)(36386004)(110136005)(305945005)(81156014)(16586007)(4720700003)(106002)(7696005)(50226002)(51416003)(8676002)(81166006)(426003)(47776003)(476003)(26005)(356004)(186003)(2616005)(44832011)(48376002)(50466002)(6666004)(86362001)(336012)(126002)(14444005)(77096007)(316002)(486006)(921003)(5001870100001)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB2686;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75db53b4-c5b2-4960-3b00-08d6ee551bec
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:MWHPR02MB2686;
X-MS-TrafficTypeDiagnostic: MWHPR02MB2686:
X-Microsoft-Antispam-PRVS: <MWHPR02MB268623A8FBF301FC189ED32EF6ED0@MWHPR02MB2686.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 006546F32A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: tH8YDYRYv91CDeXh4hjiI9KLcjQ/fb7Kx/Xf7S7qhKvE7vyt9QyRjJF+ujfsqC1BSqrt/GOhBHheAK533aYkxBHAnqGwl+d8v/DwViDMHBRFvG+R9Fa8h999r+YUUDZK9B2PdJpPGRHt+SVeESkdNi7kfzD4eyntcwLzxD9dd0zL0cwXvf2wOeu7wBZBASJFr8BaaYilFRkxVWOig3j8AQtIbreL3D9Woz1nnkb5RKz/SMMWqF3Kegxz6iwiuuF3EsNvDYFwAxcUPscXXEcEbLxUcoqfYJ2Hkbs98YjGzcbXRs6oXBUAP1p7ELwrxi+R9cGbbDsxgrSru/g+phK0l722utoNaK33iEptsYmRbGhhm2wm9ntZ8tUMp+RL+YKPkatvjiI9JsHq+6M0IeFLtYdCN/vgYo21k3CAKA3ejNw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2019 10:11:02.2887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75db53b4-c5b2-4960-3b00-08d6ee551bec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2686
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
The number of active lanes can be programmed.
For e.g. the design may set maximum lanes as 4 but if the camera sensor has
only 1 lane then the active lanes shall be set as 1.

The pixel format set in design acts as a filter allowing only the selected
data type or RAW8 data packets. The D-PHY register access can be gated in
the design. The base address of the DPHY depends on whether the internal
Xilinx I2C controller is enabled or not in design.

The device driver registers the MIPI CSI2 Rx Subsystem as a V4L2 sub device
having 2 pads. The sink pad is connected to the MIPI camera sensor and
output pad is connected to the video node.
Refer to xlnx,csi2rxss.txt for device tree node details.

This driver helps configure the number of active lanes to be set, setting
and handling interrupts and IP core enable. It logs the number of events
occurring according to their type between streaming ON and OFF.

It adds new V4L2 controls which are used to get the event counter values
and reset the subsystem.

The Xilinx CSI-2 Rx Subsystem outputs an AXI4 Stream data which can be
used for image processing. This data follows the video formats mentioned
in Xilinx UG934 when the Video Format Bridge is enabled.

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

 .../bindings/media/xilinx/xlnx,csi2rxss.txt        |  116 ++
 drivers/media/platform/xilinx/Kconfig              |   11 +
 drivers/media/platform/xilinx/Makefile             |    1 +
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 1488 ++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h                 |    4 +
 include/uapi/linux/xilinx-csi2rxss.h               |   52 +
 6 files changed, 1672 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c
 create mode 100644 include/uapi/linux/xilinx-csi2rxss.h

-- 
1.8.3.1

