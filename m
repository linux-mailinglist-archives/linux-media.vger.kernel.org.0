Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4D41BE08D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 16:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgD2ORT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 10:17:19 -0400
Received: from mail-mw2nam10on2075.outbound.protection.outlook.com ([40.107.94.75]:6058
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727107AbgD2ORT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 10:17:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U16ulv+5ye/yc2P2XTF8U+VN49S7rti43cOFHqLwZazwdFF3vlNrx75mOROeBCev/rccn6Lk4oKYS0+orpBL4/uBCsR6bEJXHB5KiolSDb/63oMFAXm0Jm9/Pcavyk2DIEiMkXw0fkWE4qCB3+UA2IT1Ij2rcn6eVdoPzkXDJ25DzbUpVvPtB2ves0iDPH0m75rRYXjmbEa+M4SG1dAEIRBEow0IzYdApIBfybkLVFOudCifY7giMgL2TgRU+YDKylL71PQPK0+va2pN0V6q0F2LKpRQ0eDWRMDoQTmwEizK6+bZ5mpzDJaqYfGGpecQmcojimK4blocoO2f3kAubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sku445W0YrS6Sc8zsFNH1k9O3pXSjUulEppAwbxqfOU=;
 b=Iyos8SqQKWKyXcc7kWRFSWaaIafnTlYJgSJy3rA4ShYcQRNcZ42C0JrwmLCbk//v8H5JicxXCYBpT+LBY+WeTP/0dd/4dmMhF/7wPFEMcaW/pCOAnaiEVYFlPrlaG79nf0Au5GAZGBWtzLTeKn8XPQCtcDiuEd2SDm3khqs1FGC9DN+hFVHCD6Isgn9peqylE7HpwdzzuAu4ez63BRti6kRSZ97HunD8APZEzcSTmpgVisrWAqoPsDgZQ3x8aUjdpFgalOCGlaLdmydmagZS9diJ4FWzW8oebBnGYc6jgd8vyYmTDg353UvMM3IFU3tR8kr8tRCXkPAsy7KrPEN0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=perches.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sku445W0YrS6Sc8zsFNH1k9O3pXSjUulEppAwbxqfOU=;
 b=QmeJFEQYtYTiUhZMqZSW5ED+ffIpnxbh8W/dcmYf35dYRn6agWJV5qQPGLxWHHfXSv71rsaXxmc7+ARoAhea0l3mKTk2yLeTwLvURXNFDXxnwsFstAxXn0wdqs8ReeeOKDMz1TgAfyjjIBL0q5S+rsIvwy99iZHwwwHUm+ob8z8=
Received: from SN4PR0501CA0098.namprd05.prod.outlook.com
 (2603:10b6:803:42::15) by DM6PR02MB6619.namprd02.prod.outlook.com
 (2603:10b6:5:217::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 29 Apr
 2020 14:17:15 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:42:cafe::c3) by SN4PR0501CA0098.outlook.office365.com
 (2603:10b6:803:42::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.11 via Frontend
 Transport; Wed, 29 Apr 2020 14:17:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with Microsoft SMTP
 Server id 15.20.2937.19 via Frontend Transport; Wed, 29 Apr 2020 14:17:15
 +0000
Received: from [149.199.38.66] (port=41756 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jTnWP-0006IR-Oh; Wed, 29 Apr 2020 07:17:09 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jTnWU-0007rZ-Pr; Wed, 29 Apr 2020 07:17:14 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 03TEHBlj025312;
        Wed, 29 Apr 2020 07:17:11 -0700
Received: from [172.23.82.133] (helo=xhdvsagar40x.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jTnWQ-0007pS-Of; Wed, 29 Apr 2020 07:17:11 -0700
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
Subject: [PATCH v2 0/2] Add support for Xilinx UHD-SDI Receiver subsystem
Date:   Wed, 29 Apr 2020 19:47:02 +0530
Message-Id: <20200429141705.18755-1-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39850400004)(376002)(136003)(46966005)(426003)(316002)(110136005)(7416002)(44832011)(2616005)(82740400003)(8936002)(4326008)(82310400002)(70586007)(47076004)(356005)(107886003)(6666004)(70206006)(81166007)(8676002)(1076003)(9786002)(5660300002)(478600001)(336012)(36756003)(186003)(26005)(7696005)(2906002)(42866002)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c22bf075-ae4c-4557-c2d0-08d7ec48045e
X-MS-TrafficTypeDiagnostic: DM6PR02MB6619:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6619A71528CFD6BF01CF519FA7AD0@DM6PR02MB6619.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03883BD916
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KlCUScb3khPNKTaapv/qXsK+Mf+rSjpc/eO7+qoZ8Rxii00SusYJycwdmOTwH+72F1r8YS6hV7n+YEyauMB3aHGbYIG3m+RCp7I5kXUrqf9K//oAX5EfAwIjkorCqXEvBPZITD0ZaOusdvsCUb6S8WurndIqYGdr26X68aejnig823sE9Z8IXRLSb0FOcRRtF4cPaOQ5eAZ13dMLUEdgQKKQUwnCVGpnAZEhshuk6+NjwgwPSuOqa8ei6LgyaAE+qwrl2ljCQOl+DDBihsng/Z8VfUqIhYrAF44hpPynZZNfX0dR9BBp78KuAKTWBwA/mhm+HUbnDT31Fm1OsJ+QOB/0UiYbk6Jy46LZtK0SWhCF3wQVkoKYggZZABbn/DPVR0MlINBY1mTHAJd9JKXseHwX4vzSqeoE4gTXgYkCuH7seR2LD1cwUU9C9OgowGuXTUDJqZ0Q8W0Mi92fnLRre20vAwe/7IUaFl9uxMrV2z/BRymT5NSRHcD4VtEZAl0vGcNEKzX23Eg8ofG3ap2BeepD0xEEON0YlqTJP9FoR0kdCcrVoP+pYS2bvjq4W9Cj
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 14:17:15.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22bf075-ae4c-4557-c2d0-08d7ec48045e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6619
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

Vishal Sagar (2):
  media: dt-bindings: media: xilinx: Add Xilinx UHD-SDI Receiver
    Subsystem
  media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem driver

 .../bindings/media/xilinx/xlnx,sdirxss.yaml   |  132 +
 drivers/media/platform/xilinx/Kconfig         |   11 +
 drivers/media/platform/xilinx/Makefile        |    1 +
 .../media/platform/xilinx/xilinx-sdirxss.c    | 2162 +++++++++++++++++
 include/uapi/linux/xilinx-sdirxss.h           |  179 ++
 include/uapi/linux/xilinx-v4l2-controls.h     |   67 +
 6 files changed, 2552 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.yaml
 create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
 create mode 100644 include/uapi/linux/xilinx-sdirxss.h

-- 
2.21.0

