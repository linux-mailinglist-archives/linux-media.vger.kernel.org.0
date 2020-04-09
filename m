Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A47731A3AB9
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 21:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgDIToy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 15:44:54 -0400
Received: from mail-co1nam11on2064.outbound.protection.outlook.com ([40.107.220.64]:2848
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725970AbgDIToy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 15:44:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6fD/hH7fN+2Q2FzG7jvAW89IUi9W8L+pKpXFQh2rJgqRw4Gl2jbIbxhdcAOG8DL8ty3s4hPpEsCvQvPF55t+73jiJ1hlsX7V9RQIU1pXqas0raz+5vGpCaSXT6hyo4/jMA1hVdpBC8IRfj1teU02ZNgVWcYQIvh8QPtNw3ERbtWgFRh/ezyYyVdezXj/gSlbFUHzog9EurL14yfVEehTL2eeRfFbDgkWw/rOUTyzmSDSu6Kp5ayzoBnFyDVH0MHIKzuAsW2/xTThC2LE60YHFhY9RsnA9NgR1SLxlGecB52Nb9drWehA84irf8xBsr0dgpCdUTpuf0fk6Sg4EL2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQoj2j0yOba+YsbXrWDwJXFd6MnSDTZguM4Ip43A148=;
 b=XaNApEL6OogichY9Sk/lo8u/AMxHHlQte2EUAjZvgW/1+VEA98FxKgICw8STPi6kyIHnZ5VY7JbvDof2UHWZp/XX/tntaASmK/hJoxw17+X6bxxRV2c+YrEPMNrotuYkpKdj+b4ykQTOhhvpsU7MsOtqPv8CiuXFGFrfwTM6f0rdgpDzuVtKjSnsPRw1pbruFOnx0NGGwqBuGgBJ+X6VH8Qa8puKpd4H1AesSe47N5px+cQBUBW1AOqkdJMQy/gDc9d2s3vJIhMibN0uJGSvDGNnvh6w/aRrJZRCNNEn/XAetUdDg8cHBsrP1aof3+e7A7lQNT4fsQVr+ocFqDEqPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=jmondi.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQoj2j0yOba+YsbXrWDwJXFd6MnSDTZguM4Ip43A148=;
 b=CQXGLASrTPI8i787c0dCh9Gb208+JHiyk1H5JBrc1yEBRYM1fHbZcNUv8DKPs1m/d1jU6UPpbx4DHayNeUJRcmpNWL+8oIJ3xUNIXhouYtCa/YrOHnBUajwi5fI7ZrE+N3Ec2PMexm8wPLsyULPx6bB9OC1g4Ebt+wSPebTC0E0=
Received: from MN2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:208:d4::34)
 by MN2PR02MB6813.namprd02.prod.outlook.com (2603:10b6:208:1db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.16; Thu, 9 Apr
 2020 19:44:47 +0000
Received: from BL2NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:d4:cafe::7) by MN2PR04CA0021.outlook.office365.com
 (2603:10b6:208:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend
 Transport; Thu, 9 Apr 2020 19:44:47 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT015.mail.protection.outlook.com (10.152.77.167) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 19:44:47
 +0000
Received: from [149.199.38.66] (port=36227 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jMd64-00074y-BG; Thu, 09 Apr 2020 12:44:20 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jMd6U-00087P-SA; Thu, 09 Apr 2020 12:44:46 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 039JigiN009296;
        Thu, 9 Apr 2020 12:44:42 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jMd6P-00083q-NV; Thu, 09 Apr 2020 12:44:42 -0700
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
Subject: [PATCH v11 0/2] Add support for Xilinx CSI2 Receiver Subsystem
Date:   Fri, 10 Apr 2020 01:14:22 +0530
Message-Id: <20200409194424.45555-1-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(46966005)(70206006)(356004)(6666004)(2616005)(81166007)(26005)(47076004)(1076003)(44832011)(5660300002)(2906002)(336012)(9786002)(36756003)(8676002)(8936002)(426003)(186003)(81156014)(7416002)(498600001)(7696005)(70586007)(107886003)(4326008)(110136005)(921003)(1121003);DIR:OUT;SFP:1101;
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66fd6cbc-1e4e-43cf-52e1-08d7dcbe75b0
X-MS-TrafficTypeDiagnostic: MN2PR02MB6813:
X-Microsoft-Antispam-PRVS: <MN2PR02MB68133F0D455BED96B6AA656EA7C10@MN2PR02MB6813.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-Forefront-PRVS: 0368E78B5B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PM6EfsIgMbg3yIZbLyY626Cyp5RsdtIC3hALGKe5ZlbnI8JL/ccsaZuJN3ovvl84P5HKNlPTC1NvVBEKmZWX6YtJT5VeoxI7Fqktjj419Z3VPG3MJYtkYL4vu2231R1R2gctEsOO7E/5Dizw7oCZOd+1+41NrlAZnFwPwIEkgI1dy/Q7vX+O2IMLgUTlya738DxFUsQ8nnefSEPwH4tj8BbdGtXeO28BQecjcca6LHXV301riY2cfF3YJO2vRk01P1ezcIgo3jFUPwwcaQGqULE5yufrQghLh2aNX+/i/NenC8tcY3Oy4BuhGnfd6Sl8bK6z1U0GJ3rg43zax5YDJn7NGKeGqH0zfOhsqmJxi4MnmjzJM2r9Vu+frHAV8R0GlCdM7dImojv5M2DzbaWNBpb9QgjLvaziVm2zxIi/q3FhRndrzdusxdoih1sDxxH6YbuqQSV0qavHIrSATBpsfLmlVsF0InHgJr7QKcs0v6TaWd5UNSKMfWSu8+8MAqYCqwild+hlGMUV7AQIBzI2rXLPNYtqTPLqIecCcIdfN3OcgpMSVXw9NjHxF7KWpKvY
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 19:44:47.2451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fd6cbc-1e4e-43cf-52e1-08d7dcbe75b0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6813
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

 .../bindings/media/xilinx/xlnx,csi2rxss.txt   |  116 ++
 drivers/media/platform/xilinx/Kconfig         |   10 +
 drivers/media/platform/xilinx/Makefile        |    1 +
 .../media/platform/xilinx/xilinx-csi2rxss.c   | 1234 +++++++++++++++++
 4 files changed, 1361 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
 create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c

-- 
2.21.0

