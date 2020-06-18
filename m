Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD921FEAFB
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 07:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgFRFdc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 01:33:32 -0400
Received: from mail-bn7nam10on2066.outbound.protection.outlook.com ([40.107.92.66]:6045
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726976AbgFRFd1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 01:33:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdGUY19cAGjNJx1Gv1r8nDP/W9dBhHkQ72537DtKyTVLV6FG4R3Wz2DYjJz257xw/7vL4vmDNeououXNW9aP2ftqMjaUTWGm0qiC7nacLmribDZITqZJxpu8tRvSBOcMBKSwSX5D8JbW5/CkBSGZq7gerIAJqdsPfGNUFmwwV43OUT56dY3BdNED2Np4qLi+5MLEQvgawSS5n3gqANzvq2QwVRKYzPUdBYt1j7frQoAbhFYULXY53VuxtK3GcZqRFqzVgTguQWXNyH8RU80g1B5yU0TDqsLVzF8dMjl+HVJIxeLnvzx124HTZCPN6vLNx5LcEX8mNbPKI/s8Ti7O4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1JKdLvuFWGbWcDnaSblc3TL3E/EtBWWBWxcYWgYBow=;
 b=OzL63MDzIM6Si0covgFoFYT/x1Ih1x4DkGXxq2NiRrDhiCZsFjzqsvYJm0C2nP7FQ4NzHBxj+DCba0ec7HDVjFevnGpYIdk8bdB3wJUdXa9gnZOne6Jk7imeeXGqVSQJj3C+4M2kyjP1z26cLl+3i/2br9ZHBLQEfFR+PMw5+v3bzp8Ie+wbSDwEn5Ij3iQj422fnWqcEwxXUa1QGdscUzKTpCUdjFEK5aZLYo8nIr5C5Hzc9jhAC9yKDUJxWcM7VdpFV7SzfcjdVgG7RVQyff0aDSmxuwVP3QL3QkT+gp/qk6WCgiEZRhNWWoG46En2vstGqNdLLH5ZtXGdiANJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1JKdLvuFWGbWcDnaSblc3TL3E/EtBWWBWxcYWgYBow=;
 b=MgZvumWWM+lcsshhzy4ZDc6HGKglYc293VzixJkxLPyjCjUzmrNWM8MgmOG3jgaF0HOgaFiYT5dvML2lAvlTXjS5R9I1tXkWVUzWO3TdtQRlrgp5oKOs9oM/h0XSZj9PiKcCOm+u5A7qZBnqjDGrFdpmxUqFoN9Xy2oLJUKv8To=
Received: from SN4PR0801CA0012.namprd08.prod.outlook.com
 (2603:10b6:803:29::22) by BN6PR02MB3153.namprd02.prod.outlook.com
 (2603:10b6:405:67::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.29; Thu, 18 Jun
 2020 05:33:22 +0000
Received: from SN1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:29:cafe::ad) by SN4PR0801CA0012.outlook.office365.com
 (2603:10b6:803:29::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Thu, 18 Jun 2020 05:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT037.mail.protection.outlook.com (10.152.72.89) with Microsoft SMTP
 Server id 15.20.3088.18 via Frontend Transport; Thu, 18 Jun 2020 05:33:22
 +0000
Received: from [149.199.38.66] (port=58918 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jln9s-0006yk-DD; Wed, 17 Jun 2020 22:32:16 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jlnAv-0003RZ-Na; Wed, 17 Jun 2020 22:33:21 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jlnAl-0003Ok-27; Wed, 17 Jun 2020 22:33:11 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     hyunk@xilinx.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, michals@xilinx.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        joe@perches.com
Cc:     sandipk@xilinx.com, dineshk@xilinx.com,
        Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH v3 0/3] Add support for Xilinx UHD-SDI Receiver subsystem
Date:   Thu, 18 Jun 2020 11:03:01 +0530
Message-Id: <20200618053304.14551-1-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(376002)(136003)(346002)(396003)(39860400002)(46966005)(426003)(2616005)(36756003)(1076003)(336012)(478600001)(44832011)(7696005)(186003)(2906002)(7416002)(26005)(9786002)(5660300002)(8676002)(8936002)(107886003)(70586007)(70206006)(83380400001)(81166007)(4326008)(82310400002)(316002)(47076004)(6666004)(82740400003)(356005)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea3f7d86-1fba-40aa-0293-08d813491d76
X-MS-TrafficTypeDiagnostic: BN6PR02MB3153:
X-Microsoft-Antispam-PRVS: <BN6PR02MB3153309548A334287D7EB260A79B0@BN6PR02MB3153.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cK8SOUrB0laenpSfnMLesAVf+BMxp9QDTTPBBnh1HK1TAv+NBrI6BQi3vd/5fmss1cwrUPB4AFYHxfuX1s2aIndOIAzwU7cATlDqE3biJXGQCwJRXhJkEO3CADf/9aI4B5xwgXZGHaLjK++ajoiAxCt3HZhNvupAoLOGILQT15hzsPpctzQ0pob5EjpqLsgEF0SoA1E64hSk6SVmc32o3e5KG3OcmFR+qC1m3A3Acmtstr+EHJwSsq7WlTRqLlsJ2Qc4h5pakSqd01HjqZCHBg1g0rOkiy5N0zVs/9b/8/sUbXwQKPBX1+wCtnejO82HfpRZ9KKtkpA2M/WWkhi/W867BiKyEr3qdOh4K43IS4z6AtokVAvSf+8PzC5tnFxHePWjiRB/vGp9Coe08kAT6ohSl88k73XS4X5WPmzAFf0=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 05:33:22.0588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3f7d86-1fba-40aa-0293-08d813491d76
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3153
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
corresponding media bus format for YUV 422 10/12 bits per component.

Though the core also supports RBG/YUV444/YUV420 10/12 bits per component,
these are not supported in driver due to lack of corresponding media bus
format currently.

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

v2
1/2
- Converted to yaml format
- Removed references to xlnx,video*
- Fixed as per Sakari Ailus and Rob Herring's comments

2/2
- Added DV timing support based on Hans Verkuilś feedback
- More documentation to custom v4l controls and events
- Fixed Hyunś comments
- Added macro for masking and shifting as per Joe Perches comments
- Updated to latest as per Xilinx github repo driver like
  adding new DV timings not in mainline yet uptill 03/21/20

Vishal Sagar (3):
  v4l2-dv-timings: Add timings for 1920x1080P48 and 4KP48
  media: dt-bindings: media: xilinx: Add Xilinx UHD-SDI Receiver
    Subsystem
  media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem driver

 .../bindings/media/xilinx/xlnx,sdirxss.yaml   |  132 +
 drivers/media/platform/xilinx/Kconfig         |   11 +
 drivers/media/platform/xilinx/Makefile        |    1 +
 .../media/platform/xilinx/xilinx-sdirxss.c    | 2121 +++++++++++++++++
 include/dt-bindings/media/xilinx-sdi.h        |   20 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/v4l2-dv-timings.h          |   31 +-
 include/uapi/linux/xilinx-sdirxss.h           |  283 +++
 8 files changed, 2604 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
 create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
 create mode 100644 include/dt-bindings/media/xilinx-sdi.h
 create mode 100644 include/uapi/linux/xilinx-sdirxss.h

-- 
2.21.0

