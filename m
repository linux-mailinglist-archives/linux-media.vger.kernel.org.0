Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 603F632D51
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 12:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfFCKAE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 06:00:04 -0400
Received: from mail-eopbgr750043.outbound.protection.outlook.com ([40.107.75.43]:34838
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727003AbfFCKAE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 06:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSySRpPrnpZf1tjbBvHg+9ujlAfg46/Mj9t/j1b6ynQ=;
 b=vqEaZYdYkjLxRiWywTe6BFLR8V74GOhnUx8L6beg5LFTGeaHrsbJ6FeX+zSbEqX1d1VC1VcZh+6fpQIMYpmxsz1MoiiYqYuUJCdUg8WrNTC3x15PG6Alk/H8SzdQrOaTcThJtKzzVWN23PJ4rDFWsoGyayt+HTG/OBr/P69RsLg=
Received: from CY4PR02CA0024.namprd02.prod.outlook.com (2603:10b6:903:18::34)
 by BN6PR02MB2673.namprd02.prod.outlook.com (2603:10b6:404:fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Mon, 3 Jun
 2019 09:59:59 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::200) by CY4PR02CA0024.outlook.office365.com
 (2603:10b6:903:18::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.17 via Frontend
 Transport; Mon, 3 Jun 2019 09:59:59 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1943.19
 via Frontend Transport; Mon, 3 Jun 2019 09:59:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hXjl0-0006bS-2O; Mon, 03 Jun 2019 02:59:58 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hXjku-0006Zl-WC; Mon, 03 Jun 2019 02:59:53 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x539xgcu018342;
        Mon, 3 Jun 2019 02:59:42 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hXjkj-0006Xs-Pq; Mon, 03 Jun 2019 02:59:42 -0700
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
Subject: [PATCH v8 0/2] Add support for Xilinx CSI2 Receiver Subsystem
Date:   Mon,  3 Jun 2019 15:29:29 +0530
Message-Id: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 1.8.3.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(199004)(189003)(8676002)(4326008)(81156014)(2906002)(2616005)(77096007)(107886003)(8936002)(186003)(305945005)(26005)(336012)(50226002)(50466002)(356004)(476003)(81166006)(4720700003)(6666004)(48376002)(36756003)(44832011)(426003)(14444005)(126002)(486006)(47776003)(36386004)(316002)(63266004)(110136005)(16586007)(478600001)(70586007)(51416003)(86362001)(5660300002)(7416002)(7696005)(106002)(9786002)(70206006)(921003)(42866002)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB2673;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a9473fd-4a91-4f3c-7e7c-08d6e80a3cf3
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BN6PR02MB2673;
X-MS-TrafficTypeDiagnostic: BN6PR02MB2673:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2673519F738294B4BB8B857EF6140@BN6PR02MB2673.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0057EE387C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2x0HIU5WLUpLDXQ7CcttJJTihzGjEYzBUrVZPrOFy0e0w3exBKMt/n61JC87KxXnHLhobIEJ1BN0V3bjjfjH6MCYRTxRR/+Eqi9POBzzQKC6YQH4qX4lQG8O78iIXcH7Q50+0/c6lPL5hwMdO5e3X3eOrRhXqkilBvs8ywXTFJy21xT9Dir+pVFxRsior0vclW3jCaQfsIL8lI3Pzj8N52X+htNP//3JV/g+/6k+GUAKnQZilKij8VuVok5w5A7Zd4CeqkMe0D5JRo9ltZeG2XDwlnT86R6W6ybMaPOJPX8n79E0jk8PKHbU6vBn442mz4DH+E7/IdeZ1D7VMhHlRBdr2f6KZhP2ueV6UA3nusfEzjb6O4G1tQSwJrswnikwMXX0VYRgBhy7wjks6SFV4fa79yKSLLkNvYpA9dHjNlg=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2019 09:59:58.4727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9473fd-4a91-4f3c-7e7c-08d6e80a3cf3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2673
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

 .../bindings/media/xilinx/xlnx,csi2rxss.txt        |  119 ++
 drivers/media/platform/xilinx/Kconfig              |   10 +
 drivers/media/platform/xilinx/Makefile             |    1 +
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 1406 ++++++++++++++++++++
 include/uapi/linux/xilinx-v4l2-controls.h          |   12 +
 include/uapi/linux/xilinx-v4l2-events.h            |   21 +
 6 files changed, 1569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c
 create mode 100644 include/uapi/linux/xilinx-v4l2-events.h

-- 
1.8.3.1

