Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584D91CF8EA
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 17:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbgELPUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 11:20:17 -0400
Received: from mail-bn8nam11on2052.outbound.protection.outlook.com ([40.107.236.52]:9056
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726055AbgELPUP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 11:20:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epsdWASq2aI1nsDkgYaeP5AfJSc0O5qeNsfnH5ryNX8FYE30TBlCtOSaTfCKhV5Afri+P2QIalZSbMg4WlXXIXwE2B4XYThj4Egi/U2+ChHGZj0tJGEsQ1gxGKG9tCllgyJ+Dci3PjPXbFsevX+j1TJF82MDhbef5SRkaSdBZT3JMjhtnSDeegMsBJWUV5eI3IFA5NHTLaz9iTe+iQt5s4KZPN9Bg/wS3nL68OMK/c1J2JNlA84CER2AecPlJozj1Z13ftgtlYA/bMUoRxWGjbAbIRLLvPoY4zDLnzxhowuZaPD2/bceKmwr276O25fbmy3Ffoxx37fzIZQcR8lJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e14/e9vvfMfSVAEA9JqCjNhNEOl4W+sX2WJmr8WJXgc=;
 b=UDNx6AG84H2AfdfWOmzYYu67EocqrJCXDEtE9HpK8Mqteoii7bscTfnV33KkbXzSdHzaGioiJunFOapWxlqp3byHFtSZ4HbKP2fAtugYNTpKpwvu3VhACQj1CdD/E17BKEn/h9DwAPqqnrXGibRN7uokJ9SCIeWsmKpjddjulCA7q5tM7GX5Dyda2pMCUUYABXuj30Ch9ypfM2F0rVbYo8wWvFwihFRfoQZb9PP+yjWV9QUd0n2EKlyqXkiRWqv1zXuiPJfD44zQXN+txP6o7ufzgcOvnrjrb4lT/tjTFELQQx4pCi9/CgT3tm3LudExvlwWvB2lVLyq7v6dhMQNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=jmondi.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e14/e9vvfMfSVAEA9JqCjNhNEOl4W+sX2WJmr8WJXgc=;
 b=XYety179ljM3V7NEBgqHx5iq8G+bq8cj22TVseeFq+Y86WhKgg4AV2Josmxe87ac8+STVyP450PLlqE8FPzC6BHq4h56eyXJebnRrwOynP8iKZ37m0W1Fi5h42Lvw5lduFyvq9MWECcTqV+sxGV965vN2GbhB7nx6wMuBLMcdf8=
Received: from SN2PR01CA0081.prod.exchangelabs.com (2603:10b6:800::49) by
 DM6PR02MB5530.namprd02.prod.outlook.com (2603:10b6:5:7a::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.35; Tue, 12 May 2020 15:20:11 +0000
Received: from SN1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::97) by SN2PR01CA0081.outlook.office365.com
 (2603:10b6:800::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Tue, 12 May 2020 15:20:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT051.mail.protection.outlook.com (10.152.73.103) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Tue, 12 May 2020 15:20:10
 +0000
Received: from [149.199.38.66] (port=46125 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jYWhF-0004KX-H2; Tue, 12 May 2020 08:19:53 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jYWhV-0000Fo-Sa; Tue, 12 May 2020 08:20:09 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04CFK0wI030673;
        Tue, 12 May 2020 08:20:01 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jYWhM-0008NS-Bn; Tue, 12 May 2020 08:20:00 -0700
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
Subject: [PATCH v13 0/2] Add support for Xilinx CSI2 Receiver Subsystem
Date:   Tue, 12 May 2020 20:49:45 +0530
Message-Id: <20200512151947.120348-1-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(376002)(346002)(396003)(39860400002)(46966005)(33430700001)(70586007)(7696005)(316002)(8676002)(70206006)(9786002)(26005)(186003)(110136005)(2906002)(36756003)(8936002)(2616005)(44832011)(336012)(6666004)(426003)(1076003)(478600001)(82310400002)(82740400003)(47076004)(7416002)(5660300002)(107886003)(4326008)(356005)(81166007)(33440700001)(921003);DIR:OUT;SFP:1101;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82946eaf-940f-4ab9-6549-08d7f687f5da
X-MS-TrafficTypeDiagnostic: DM6PR02MB5530:
X-Microsoft-Antispam-PRVS: <DM6PR02MB553039278CC7C634AB197416A7BE0@DM6PR02MB5530.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8jldp0Z2g2PTcObtmG++S2lTDDE22gd/xm+7LrqieudM1ekjL/UxjtJCP+y99K0b675MgYpNIx1DKN9AH4Wc4v5DwJ+Rd7zy1eBvbWrViamXeLgBQB4Gb5K3fGzOvEMGHnrffYxbDtJyQWWmIcTujvyaVpHk6jIVgqJ09E0lIFsZk8rZm23tp0lr+H4MHwhIyN0/hgduC17jj/Py0r16ttpdn9WYmLmQjX5RWuLXnzlRwcL5FdtBrzSLgNYFlTNVnixkjrQVjyvw6qntLedtFNRl7do/oLXtLwvd0McUN36QovFUgkH7kKxB3DWfBx2O8TJI25ryy4c7np5vUyCaSmdxC31VJFVTxmmtERwBfY2yWVDoWTBiuL4e/72AFgCvsiQotUf2PIyQjapvw5hA5GHO/4pwXAib/vqcj/1CYOMeEX3etAK3hSOgKnkVW2eLF+FWmZ0cTlpisZL0Ic+WJiF6t68PrNgVjDYratvFK8BSUx1cZZumlLgOkoGoMIc1RCscdtVAex1HZXvZd3s2PP03PmXsusUEDZOZ1sIDXwHJaCiO4+BvZAhDAheEswW2hFcc+HSuZ6B730EbdXIVlw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 15:20:10.1793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82946eaf-940f-4ab9-6549-08d7f687f5da
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5530
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

v13
- 1/2
  - Based on Laurent's suggestions
  - Fixed the datatypes values as minimum and maximum
  - condition added for en-vcx property
- 2/2
  - Based on Laurent's suggestions
  - Removed unnecessary debug statement for vep
  - Added TODO for clock to enable disable at streamon/off
  - Fix for index to start from 0 for get_nth_mbus_format
  - Removed macro XCSI_TIMEOUT_VAL
  - Remove ndelay from hard reset
  - Remove hard reset from irq handler
  - Fix short packet fifo clear
  - Add TODO for v4l2_subdev_notify for SLBF error
  - Fix the enable condition in s_stream
  - Fix condition in xcsi2rxss_set_format
  - Fix enum_mbus_code for double enumeration of RAW8 Data type
  - Removed core struct
  - Added reviewed by Laurent

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

 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  226 ++++
 drivers/media/platform/xilinx/Kconfig         |    7 +
 drivers/media/platform/xilinx/Makefile        |    1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 1114 +++++++++++++++++
 4 files changed, 1348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c

-- 
2.21.0

