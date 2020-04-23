Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2F11B5F3A
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 17:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgDWPbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 11:31:25 -0400
Received: from mail-mw2nam10on2085.outbound.protection.outlook.com ([40.107.94.85]:6091
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729077AbgDWPbX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 11:31:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0bpTbf12QAWSH45WQ2oR9zHy2YJ0JCy9Z7Bv0tNXE5KCZEo7vtzRK7vLjmQxGqTXWNeijZ/E2MnaNw5/+N3Y39fzLAN+uQXcL0EQajZABcwrgDBO8RW5UpevDj/S8+NDT6pUNRaG0TCnb9ncBjF/TI72Xx9qSCKk4uWWwuuE0jmC7lDUfNXLMUyVsHBzxX1EvLvmxwJYa8JWtMhI2ZVc2KP/6z6hcotSYPW4LJefx0fWgrS4pKrIhyRDDI6GyyLcuilkdh7tCXTIHqXr/zkLeVV82piMbIXeZsHrFZdAUlW79Vo4HPWCrRi1/5VYhfO5yAjN5CmhBuuirpmJde52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB/A1qQx81DwzTiC7xpDWhEAEIpw/ID2+2MyaA9i5qI=;
 b=bSJPC6qTWBOUKDgQ7MQwZMiNWeTKQhLf0wnEypUL3ICakW3Cr11l51BtXFxz+74n/NXQTqku/YSltKbe4mYYUF84CVeHtTgj0hyljKWTFVaHNlq0VzpAgDd5iv75yGQpnIBSzsgIZ7P/1aBmFVxuuxFZSmyZgJvkzYvxkLl0/KsnJ5vuOssAL44iNmOrH28n9OI2WwjfDBbxF3Jwfw0v+hY2TIBLTzNxUTURSR8iv2JZWCm4nLSPTvvP2XRvoE3faoivta5NjXxEZve6avdTWnvENatN7a7HPowZf7YnVmIxZ/tU9jyyXi06+UsTO0+H5KojwQQYKNbQFJUULznUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IB/A1qQx81DwzTiC7xpDWhEAEIpw/ID2+2MyaA9i5qI=;
 b=UfzFC96fqlbKGWZ5e6TrYIhTmCKKw0wyp4fTn/xNYWEWSS+n6OaFub9JbRyxBxm4le1tLd/cE3gJn6/fLPUCqugMZjx92vSbexSS7NDbkDn+prDMWp9PYrk7HpSii3wPcwQlDyI+8m/RozBxypaT4342kI3HJT5jatDRVUFKEAQ=
Received: from SN4PR0801CA0013.namprd08.prod.outlook.com
 (2603:10b6:803:29::23) by SN1PR02MB3789.namprd02.prod.outlook.com
 (2603:10b6:802:27::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Thu, 23 Apr
 2020 15:31:19 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::b7) by SN4PR0801CA0013.outlook.office365.com
 (2603:10b6:803:29::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Thu, 23 Apr 2020 15:31:19 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with Microsoft SMTP
 Server id 15.20.2921.25 via Frontend Transport; Thu, 23 Apr 2020 15:31:18
 +0000
Received: from [149.199.38.66] (port=42638 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jRdnm-0003mY-C5; Thu, 23 Apr 2020 08:30:10 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jRdor-00054A-LG; Thu, 23 Apr 2020 08:31:17 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jRdog-000505-Ph; Thu, 23 Apr 2020 08:31:07 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        hans.verkuil@cisco.com, Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH v12 0/2] Add support for Xilinx CSI2 Receiver Subsystem
Date:   Thu, 23 Apr 2020 21:00:36 +0530
Message-Id: <20200423153038.106453-1-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966005)(44832011)(6666004)(426003)(7696005)(36756003)(70586007)(186003)(82310400002)(26005)(336012)(107886003)(4326008)(9786002)(1076003)(316002)(7416002)(5660300002)(70206006)(2616005)(82740400003)(81156014)(81166007)(8676002)(478600001)(8936002)(54906003)(110136005)(356005)(2906002)(47076004);DIR:OUT;SFP:1101;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c262c728-73b4-4053-cd5a-08d7e79b5e99
X-MS-TrafficTypeDiagnostic: SN1PR02MB3789:
X-Microsoft-Antispam-PRVS: <SN1PR02MB3789DA6CB81328A843DD4A7EA7D30@SN1PR02MB3789.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 03827AF76E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YxpiIIYd1m9WDwsIk2xLRM2tW2KlfLB5dGW8mP2ZA/6ePBnKrNzEar4vNt1SIiwSUhTAfsxuBQ/KB4YDLz1r00j6XNLgbfwoFBYXqCntckns5D29gEOTcyQgX4XMOcHtup78CYLI3TlZKLhSUjY/TrivugN51d+EpBHiNlTzotKfJ/QH4k34bYZYIY2no1na/7RaTkmeYUCv2AD4LiaVDuufvj+4H/Q1HDtGknAv3fks2bewj3SGU4R9EYydA3o8XEc64KN+H+NL016N2j3sASbzhFnzd9JRd4N85wwK8SWUTjM2ic1oSjxZLFaqy25nQ+Hrpnjum9TxUjJK7d+HJp+3J2oH44R/vXrObpnOixsELRQVmpN1vtUa7quRCZNxOlX/3RJmlRQxd8BZrKdFYfteuXCMOaQ4nRQiSzs4f/uLmaHRKtxevyAQRG4FILLFqSE/apYkrKCZ+5C1ZoYX9htTGHtfsXitZzmfEgLQ+qSbTrwBmETeEAzHO9gtwTElsj98Cmqgnm8+ESxnQ85bag==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 15:31:18.9109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c262c728-73b4-4053-cd5a-08d7e79b5e99
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3789
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Xilinx MIPI CSI-2 Receiver Subsystem
------------------------------------

The Xilinx MIPI CSI-2 Receiver Subsystem Soft IP consists of a D-PHY which
gets the data, a CSI-2 Receiver controller which parses the data and
converts it into AXIS data.
This stream output maybe connected to a Xilinx Video Format Bridge.
The maximum number of lanes supported is fixed in the design.

The pixel format set in design acts as a filter allowing only the selected
data type or RAW8 data packets. The D-PHY register access can be gated in
the design.

The device driver registers the MIPI CSI-2 Rx Subsystem as a V4L2 sub device
having 2 pads. The sink pad is connected to the MIPI camera sensor and
output pad is connected to the video node.
Refer to xlnx,csi2rxss.yaml for device tree node details.

This driver helps enable the core, setting and handling interrupts.
It logs the number of events occurring according to their type between
streaming ON and OFF.

The Xilinx CSI-2 Rx Subsystem outputs an AXI4 Stream data which can be
used for image processing. This data follows the video formats mentioned
in Xilinx UG934 when the Video Format Bridge is enabled.

v12
- 1/2
  - Moved to yaml format
- 2/2
  - Changes done as suggested by Laurent Pinchart and Luca Ceresoli
  - Removed unused macros
  - No local storage of supported formats
  - Dropped init mbus fmts and removed xcsi2rxss_init_mbus_fmts()
  - XCSI_GET_BITSET_STR removed
  - Add data type and mbus LUT
    - Added xcsi2rxss_get_nth_mbus() and xcsi2rxss_get_dt()
  - Replaced all core->dev with dev in dev_dbg() and related debug prints
  - Replaced xcsi2rxss_log_ipconfig() with single line
  - Removed small functions to enable/disable interrupts and core
  - Now save remote subdev in state struct before streaming on
  - Made xcsi2rxss_reset as soft_reset()
  - Added hard reset using video-reset gpio
    - 2 modes one with delay and another sleep
  - Instead of reset-gpios it is not video-reset-gpios
  - In irq handler
    - Moved clearing of ISR up
    - Dump / empty short packet fifo
    - Irq handler is now threaded 
  - Added init_cfg pad ops and removed open()
  - Updated xcsi2rxss_set_format(), xcsi2rxss_enum_mbus_code() to use the dt mbus lut
  - xcsi2rxss_set_default_format() updated
  - Moved mutex_init()
  - Updated graph handling
  - Removed unnecessary prints
  - devm_platform_ioremap_resource() and platform_get_irq()
  
v11
- 1/2
  - Modified the compatible string to 5.0 from 4.0
- 2/2
  - Fixed changes as suggested by Sakari Ailus
  - Removed VIDEO_XILINX from KConfig
  - Minor formatting
  - Start / Stop upstream sub-device in xcsi2rxss_start_stream()
    and xcsi2rxss_stop_stream()
  - Added v4l2_subdev_link_validate_default() in v4l2_subdev_pad_ops()
  - Use fwnode_graph_get_endpoint_by_id() instead of parsing by self
  - Set bus type as V4L2_MBUS_CSI2_DPHY in struct v4l2_fwnode_endpoint
  - Remove num_clks from core. Instead use ARRAY_SIZE()
  - Fixed SPDX header to GPL-2.0
  - Update copyright year to 2020

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

 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  215 +++
 drivers/media/platform/xilinx/Kconfig         |    7 +
 drivers/media/platform/xilinx/Makefile        |    1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 1157 +++++++++++++++++
 4 files changed, 1380 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c

-- 
2.21.0

