Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E71EA34996
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 15:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbfFDN44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 09:56:56 -0400
Received: from mail-eopbgr710041.outbound.protection.outlook.com ([40.107.71.41]:40928
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727149AbfFDN44 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 09:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3Iygo/ncemIGGHPeGIjb1WGfS9hiw/B9ZUHoA1GHJM=;
 b=rtKVVYO9Bv0f9ZLmAa+LjumU7TOUqWPAV1kqeA35FTOuLop0GlE4PUaqb//ZPhqRDKwqB0gZhQjMZz1Php6Wo/agEd/hOsMjxc1FAqtbnJRcOJRpuQeCMOyfOVMkOb60TmhrpAMS8EV9rFRqnysEerHRnEdprylLO/sVS+1Ei4Q=
Received: from DM6PR02CA0089.namprd02.prod.outlook.com (2603:10b6:5:1f4::30)
 by DM6PR02MB4939.namprd02.prod.outlook.com (2603:10b6:5:11::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.21; Tue, 4 Jun
 2019 13:56:53 +0000
Received: from BL2NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by DM6PR02CA0089.outlook.office365.com
 (2603:10b6:5:1f4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.18 via Frontend
 Transport; Tue, 4 Jun 2019 13:56:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT040.mail.protection.outlook.com (10.152.77.193) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1943.19
 via Frontend Transport; Tue, 4 Jun 2019 13:56:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:59406 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hY9vo-0008Ce-SP; Tue, 04 Jun 2019 06:56:52 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hY9vj-00057J-P1; Tue, 04 Jun 2019 06:56:47 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x54Dug3d029058;
        Tue, 4 Jun 2019 06:56:42 -0700
Received: from [172.23.62.223] (helo=xhdrdevl203.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1hY9ve-00054P-3H; Tue, 04 Jun 2019 06:56:42 -0700
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
Subject: [PATCH 0/2] Add support for Xilinx UHD-SDI Receiver subsystem
Date:   Tue,  4 Jun 2019 19:25:54 +0530
Message-Id: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 1.8.3.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(199004)(189003)(7696005)(81166006)(5660300002)(8936002)(110136005)(50226002)(8676002)(51416003)(14444005)(81156014)(70586007)(316002)(47776003)(86362001)(336012)(2616005)(476003)(63266004)(54906003)(426003)(70206006)(486006)(44832011)(26005)(77096007)(186003)(126002)(106002)(305945005)(9786002)(2906002)(107886003)(36756003)(16586007)(36386004)(6666004)(356004)(4720700003)(50466002)(4326008)(478600001)(48376002)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4939;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f412097d-5a5d-4e6c-0cb9-08d6e8f48004
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:DM6PR02MB4939;
X-MS-TrafficTypeDiagnostic: DM6PR02MB4939:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4939D3B9F8E955C40828FBCAF6150@DM6PR02MB4939.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0058ABBBC7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Pc9kvjFIEV9XnbZuB448WcAFGUjlVOPygGyNVejBza5R4MJ4epogPakB4fHuu5Bn2pN9OIAI9poqGSWVz6aTZotpfZ2kezebYxtMXlq6KiNFk9cU+nO98U6W/3tRWxTy/mj+oFTH5lYDkVCeEWOr62S/Y2QzlN9goeXWWZIDk93cy17lJfUghhhnr7Dg7JRxPcKpE2hewekAAPAQdNM3C98Feacl4/O6C0HoSH22F9xdYUrhXMVDXSn91EGw+uxVeWSdOtrlf8Dz6tVgtVFaVAtv3m9l+2ALQIUl5fxX8bVDF8KOL+ID4Tphq+ZbKJX75DnqInI2LZPcwIVcXvl8J+KDihUDyavRvndB0yafApSGNFC4BP4EnH9t6GKj2P57/WLfMNp0Cg9NS0jChk0llXj0BRgU7t10J8XIbXdh6Mw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2019 13:56:53.4535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f412097d-5a5d-4e6c-0cb9-08d6e8f48004
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4939
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Xilinx SMPTE UHD-SDI Receiver Subsystem
----------------------------------------

The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create
systems based on SMPTE SDI protocols. It receives unaligned native SDI
streams from the SDI GT PHY and outputs an AXI4-Stream video stream,
native video, or native SDI using Xilinx transceivers as the physical
layer.

                SMPTE UHD-SDI Rx Subsystem AXI4-Stream Architecture

          +============================================================+
	  |           Native SDI           Native Video                |
SDI	  |   +=========+   |   +============+  |   +=============+    |AXI4
Stream	  |   |  SMPTE  |   V   |   SDI Rx   |  V   | Video In    |    |Stream
--------->|-->| UHD-SDI |------>|    to      |----->|   to        |--->|------->
	  |   |   RX    |       |  Native    |      | AXI4-Stream |    |
	  |   +=========+       |Video Bridge|      +=============+    |
	  |      |  ^           +============+                         |
   <------|------+  |                                                  |
sdi_rx_irq|         |                                                  |
	  +=====+===+==================================================+
                    |                            ^              ^
                    |                            |              |
                 s_axi_aclk                   sdi_rx_clk   video_out_clk


The subsystem consists of the following subcores:
- SMPTE UHD-SDI (RX)
- SDI RX to Video Bridge
- Video In to AXI4-Stream

At design time, this subsystem can be configured in 3Gbps, 6Gbps or
12Gbps mode. It can also be configured to output
- SDI Native stream
- Native Video
- AXI4-Stream

This driver only supports the AXI4-Stream configuration as there is a
corresponding media bus format for YUV 422 10 bits per component in
MEDIA_BUS_FMT_UYVY10_1X20.

Though the core also supports YUV 420 10 bits per component, this is
not supported in driver due to lack of corresponding media bus format
currently.

The SDI core has detection modes where in it can be configured to detect
one or more modes from SD (Standard Definition), HD (High Definition),
3GA, 3GB, 6G and 12G modes. When the core has detected the format, it
generates a video lock. In case the source is removed or there is data
corruption, the video may unlock. This is intimated to the application
via a V4L2 event. Other events which application can subscribe are for
overflow and underflow of the video bridges.

The driver gives out the stream properties like width, height, colorformat,
frame interval and progressive/interlaced based on the ST352 packet in SDI
stream. If the ST352 packet is absent, then the values detected by the
SMPTE UHD-SDI Rx core are used.

The SDI core detection modes and detected mode, errors, etc are all
accessible via v4l controls. This driver has been tested with Omnitek
Ultra4K HD, Phabrix Qx and Blackmagic SDI-HDMI convertors.

This patch set is being sent on top of v8 of Xilinx MIPI CSI2-Rx Subsystem
driver patches.

Vishal Sagar (2):
  media: dt-bindings: media: xilinx: Add Xilinx UHD-SDI Receiver
    Subsystem
  media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem driver

 .../bindings/media/xilinx/xlnx,sdirxss.txt         |   80 +
 drivers/media/platform/xilinx/Kconfig              |   11 +
 drivers/media/platform/xilinx/Makefile             |    1 +
 drivers/media/platform/xilinx/xilinx-sdirxss.c     | 1846 ++++++++++++++++++++
 include/uapi/linux/xilinx-sdirxss.h                |   63 +
 include/uapi/linux/xilinx-v4l2-controls.h          |   30 +
 include/uapi/linux/xilinx-v4l2-events.h            |    9 +
 7 files changed, 2040 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
 create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
 create mode 100644 include/uapi/linux/xilinx-sdirxss.h

-- 
1.8.3.1

