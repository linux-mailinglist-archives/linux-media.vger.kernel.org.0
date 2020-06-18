Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EF31FEAF6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 07:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgFRFd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 01:33:28 -0400
Received: from mail-eopbgr680058.outbound.protection.outlook.com ([40.107.68.58]:26382
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgFRFd1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 01:33:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsNKslWv9U45p6ljNG8U3a+Pe4xWXTFG3jl89qoNhajClpvFqEh8FQEWcMbazCHeWlo4bG5MkKzgOK2TNUKA1rx9uNhjsjGbpuRmR+wBcoYtZYF2ai0kWmJu9D5w+bWNZ98E2zk90m5rMHh8NsNVbzHzTsFskmaMWIRIpcMKHqQePiXw7TViIKBrvmNep16wAdbW/uXEllajT3hyCRdEK7T5pwc3ZQbgO/U7y8szbdnQIfH2TusqlbMdHtzEr1z+Nf47msJdWkRftlLGabLyBAal+feY+ZIPgf7KNMHknArILWcckYzNyn3LjRaDsfPAaonaxX3iKawneNoLoXmB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di/y+TR4fQ58FL6K53Ajp8ljwMwKDiwkPfzFDiDUQak=;
 b=devzsOEvULhXJX7b19rQIWIaYsLEx+v0zDYQp+t9NSk/rcjSKJwNchGS5nNItxhNPRk0d/it90x+gusDV9AHVaQLTdcBvLOcHIRksob4KVlvQFUw3syVFbf1p30QJKQsFTqtkYR5/U1uxuEWv3NMBQ9do2mLlhGL/OHAO+C3Yb4ChdwJc5QUdLduE3cctInpU+BITh5v4VPHqWn9GEjw1RAHKsbdZwyBmAJ6xpx9hv0q116KpiIRr9FnB5vhrNGQV8YT21OgrePNRtsNczibZltWCfDglTlNGBOcla2/gzppPcHHL8A13GxJTt2qh6HQ3qwyW+T4gOJhGbuNWFQaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di/y+TR4fQ58FL6K53Ajp8ljwMwKDiwkPfzFDiDUQak=;
 b=EEMSb4/srdz5+yug4xWKZC43v8DWhtdWxyQBHk016fWMcjyHoUADIYgkvyhuwy55lk0YoDITAM1d+K5zS10Yk07IBBtLt4u/SVqSixQHHOQp8b6sZyP5sXl8DSshquqPvH/I5hP5mg67z+nEvhknlW8rDipcZ90y4c1S4rL2mQE=
Received: from SN1PR12CA0099.namprd12.prod.outlook.com (2603:10b6:802:21::34)
 by BN6PR02MB2179.namprd02.prod.outlook.com (2603:10b6:404:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 05:33:23 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::32) by SN1PR12CA0099.outlook.office365.com
 (2603:10b6:802:21::34) with Microsoft SMTP Server (version=TLS1_2,
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
 SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with Microsoft SMTP
 Server id 15.20.3088.18 via Frontend Transport; Thu, 18 Jun 2020 05:33:22
 +0000
Received: from [149.199.38.66] (port=58928 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jln9s-0006yp-GM; Wed, 17 Jun 2020 22:32:16 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jlnAv-0003RZ-Qn; Wed, 17 Jun 2020 22:33:21 -0700
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <vishal.sagar@xilinx.com>)
        id 1jlnAp-0003Ok-4g; Wed, 17 Jun 2020 22:33:15 -0700
From:   Vishal Sagar <vishal.sagar@xilinx.com>
To:     hyunk@xilinx.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, michals@xilinx.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        joe@perches.com
Cc:     sandipk@xilinx.com, dineshk@xilinx.com,
        Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH v3 1/3] v4l2-dv-timings: Add timings for 1920x1080P48 and 4KP48
Date:   Thu, 18 Jun 2020 11:03:02 +0530
Message-Id: <20200618053304.14551-2-vishal.sagar@xilinx.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200618053304.14551-1-vishal.sagar@xilinx.com>
References: <20200618053304.14551-1-vishal.sagar@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(396003)(376002)(136003)(46966005)(83380400001)(478600001)(7696005)(426003)(81166007)(5660300002)(336012)(6666004)(356005)(47076004)(316002)(7416002)(70586007)(107886003)(70206006)(9786002)(82310400002)(186003)(26005)(4326008)(8676002)(2906002)(82740400003)(2616005)(8936002)(44832011)(1076003)(36756003)(921003);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e5982b77-bd07-4e7c-a0a2-08d813491d84
X-MS-TrafficTypeDiagnostic: BN6PR02MB2179:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2179F938B00DC82227CD72A6A79B0@BN6PR02MB2179.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9HA6V2IF/tKY4unC2RNXCak5vfHm6aXa9eo52e4XEiC6IOPpxrlXPu1LROJ25cKjwyPhMG+HUYbaUPRUyXFRtSD1qwiRXe7hMKlZAiNuag8zwhVJKdDK0a1VYRUcHXBMWngfMVqiFKysHWiycDvC8vcJWQAl593X34abwso2Nf7cHPIqmzGjTfK/IeITY/MS5R4JfR+rbIjNU2zcu0m81FoUznJauSxY97RGdoYXKyddTtI2Qxe2w/GxCKIY2jZAc6mWYbealMoudv7mSFSNcOhs2i2k7bB1G/pJ8+r6Fxk9GlEcwqyTygZuqvGGxe+KmyeWe0Vcy42FldR/Uhp/CVyEAzzwbfPyT+lOc367QgUWWzHK7UWdl9fM9IuCBF78coKnxH27XTu6oKHDWh8/2bYL61T5Bp9MDT5O+/0Voo=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 05:33:22.1556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5982b77-bd07-4e7c-a0a2-08d813491d84
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2179
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the timing entry for 1920x1080p48, 3840x2160p48 and 4096x2160p48
from CTA-861-G.
1920x1080p48 is VIC 111.
3840x2160P48 is VIC 114.
4096x2160P48 is VIC 115.

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
---
v3
- Added for first time

 include/uapi/linux/v4l2-dv-timings.h | 31 +++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-dv-timings.h b/include/uapi/linux/v4l2-dv-timings.h
index b52b67c62562..6ceaa7841923 100644
--- a/include/uapi/linux/v4l2-dv-timings.h
+++ b/include/uapi/linux/v4l2-dv-timings.h
@@ -167,6 +167,16 @@
 		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 20) \
 }
 
+#define V4L2_DV_BT_CEA_1920X1080P48 { \
+	.type = V4L2_DV_BT_656_1120, \
+	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
+		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
+		148500000, 638, 44, 148, 4, 5, 36, 0, 0, 0, \
+		V4L2_DV_BT_STD_CEA861, \
+		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
+		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 111) \
+}
+
 #define V4L2_DV_BT_CEA_1920X1080P50 { \
 	.type = V4L2_DV_BT_656_1120, \
 	V4L2_INIT_BT_TIMINGS(1920, 1080, 0, \
@@ -229,6 +239,16 @@
 		{ 0, 0 }, 95, 1) \
 }
 
+#define V4L2_DV_BT_CEA_3840X2160P48 { \
+	.type = V4L2_DV_BT_656_1120, \
+	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
+		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
+		594000000, 1276, 88, 296, 8, 10, 72, 0, 0, 0, \
+		V4L2_DV_BT_STD_CEA861, \
+		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
+		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 114) \
+}
+
 #define V4L2_DV_BT_CEA_3840X2160P50 { \
 	.type = V4L2_DV_BT_656_1120, \
 	V4L2_INIT_BT_TIMINGS(3840, 2160, 0, \
@@ -278,6 +298,16 @@
 		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 100) \
 }
 
+#define V4L2_DV_BT_CEA_4096X2160P48 { \
+	.type = V4L2_DV_BT_656_1120, \
+	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
+		V4L2_DV_HSYNC_POS_POL | V4L2_DV_VSYNC_POS_POL, \
+		594000000, 1020, 88, 296, 8, 10, 72, 0, 0, 0, \
+		V4L2_DV_BT_STD_CEA861, \
+		V4L2_DV_FL_CAN_REDUCE_FPS | V4L2_DV_FL_IS_CE_VIDEO | \
+		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 115) \
+}
+
 #define V4L2_DV_BT_CEA_4096X2160P50 { \
 	.type = V4L2_DV_BT_656_1120, \
 	V4L2_INIT_BT_TIMINGS(4096, 2160, 0, \
@@ -297,7 +327,6 @@
 		V4L2_DV_FL_HAS_CEA861_VIC, { 0, 0 }, 102) \
 }
 
-
 /* VESA Discrete Monitor Timings as per version 1.0, revision 12 */
 
 #define V4L2_DV_BT_DMT_640X350P85 { \
-- 
2.21.0

