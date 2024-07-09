Return-Path: <linux-media+bounces-14737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A092B25E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 10:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3466A28335C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 08:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08629156678;
	Tue,  9 Jul 2024 08:40:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3607155C83;
	Tue,  9 Jul 2024 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514411; cv=fail; b=YRGubH6qNKd6Mik/soQPjNho4Xo89yX3joWXK+YRuDXia31SVdgxLybq0f1cWlZMpwIWwmKgA0dd+ABmj5Syg9C1ro5OmOQkBLpfdo9+cvWFN/p6r1vA3Cc6CxdG39YlICejTBAumnwmsvie5K0gYaEz9XEebVne8GIHvNAYMDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514411; c=relaxed/simple;
	bh=8vy9iC4xZobNonXX5You5QxmsSOWhQLEJArk/ruFFtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iS+6YSFtiQBKxvnarnocGC4HBz8t+hoRzDwpeUOZCTpNUWaht2Pqj8ME1Y+cuYAzL6OZVNLQEDW8ipm+QhBOzuEdFrhOsRpjCU761zxghAydaNeMKhdHkAuE+5NGSvrDrI2aX27pucg6ps3KssQxAGvRDTHcuKlj5P2spu3ZsKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZmOfixV5RPirvnRvh7DCTIPCmZzM6Fro4PWEXG9Ao3hWcdFT4qMsxk3M0F29kEO1qhrXXV9EKC0BmfJrGKKHDfN/BV4vaAq8tRxXtmMfrqeiRVXSxyxhhaCCD1N+jEcO8F8v7Bp/hwisa6UMN69clvxsWIeFdUm2vJTtPqu4Y3zS4VbDFlKGEPCfZfuWqhJP7/4OCMSMG8jM59adG/PWx4OdjM+mgDvCqMXRuXyR4sHv+2Dc22kBYgjqAgVXq+sBtMZlJA230nud3nFn/nwx8bzLAH9Q6FIx6rFchaKzO3eoGYHXnYE1YAqDpwafvhdLyV9kYaSuN21mdxi2ZWVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpOFUQrZW8GSQTbW3FIMAhf3C7AGEcEZyiE+jejurPc=;
 b=Ra8KFRhxeEeVpZObHwr3V7rKl7nMkauW85u02SRPXm869NvRPNK69hYsBCv7KEJuHJX7r8lPW1J/rnybjpQP36gJiwGTRwxB/2BdnZMt5GslqEe4NCIL3+fzCxp4iVnCeY2Lauj7ZJrinUYAQ2QdDoWBSCMJMFZbXvUXAtKJeUzh9I1SKPjGCfKUz7tnB3cvE+7d00xC4g1GsiVfl0Omjsg3ft88Fbuo23fFKQHKHY9Gciz/xsQPJt4ySBBxsJRIDpQmitOWn5is9QOJmPDe6IGBQrfXaR5SnVNQPSTl5wD8bthxkX3aw0lGYPTXSW0BcZeG+n+n4Qyqg7ii9EUnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:48 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:48 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 14/14] admin-guide: media: Update documents for StarFive Camera Subsystem
Date: Tue,  9 Jul 2024 01:38:24 -0700
Message-Id: <20240709083824.430473-15-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: c589b351-b6bb-40b6-c742-08dc9ff28d90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	b+TXySufOLaOvpOAwALdHtem7kUn9AV8pohYvrAnU5YKwbx06ph+N43SC+eYKX/XJwmye5E8s9ggPM1z1hzG6yX5RxMYtXocWbownfWAEjovHbadyyCSM22V5LvoMALpRV5XCp6XiMEniymwUCA40Mo6zKzoVexFxcJ18F4DgyH9A8m5za/DNeyB9CBgOaXl8KlpDR5qQXub+f9S0kPmtoTldjHYy4Ig98H3k+ShK8vs7HaB+lIk1vFWfmQsqQWN2OAz6vzhcVy9s3OgauJM5lpiEl62Sin5pV1XLmKPLbO/jXqES4DONOIacO5lTAuStKk2Av7uLVugTxp+LB3DOKZXfPxwm1/oHbdkAYSP26rLeAEq1mQ3Scp6vkNXmFuglgcz6pASg3WTVfnh/1bm30pPq556DhjADC5Tum1BL/rZ+whcyJVD0uhA0CRMHrtlpCoNiJwbj2r6cHdE8xW4CfA3IVTTEY3iVD5Bm/nsmjMpGxBAVBDvQfuYhx1xh3F1TpY2N1srrZpP+8HPMoI3tC6wXimqftV6vkLFMVYbinwczpZ1J76tmufxy7ONxMmMm24lkp6OR6cuoMiU/tsnXgpvrhQFyq4cGLcO/mNBQ51d11u69GEMOiIGqrjqtS57
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MFCJt+euPsCHxcsSZ1Nyk26aS2E6s3mA3rAJAqAl2f8NKlQOW1eLhx5lPddx?=
 =?us-ascii?Q?hWmHuR7Q2B/9sSyVr0U6VzGWg/z3mrBUYW6VJ/Wbw/Q2ME9aXsVBTj8Yj51J?=
 =?us-ascii?Q?DHiBSDVqKqPmRWQFGhidv2zb0ACATpZqGjlQwh2oUkdDARHwMV04ZXM813Oh?=
 =?us-ascii?Q?ikWB1z4OWXngLxHg0ktPdvUoYqnbbif90ZjekHI66TOziZtUlZ63NaFkVkuC?=
 =?us-ascii?Q?AroH9ari7xnCW964SnQh14j302QEOD4mIBBNtoCMsmc4dqWZe+3HaGBcJRdI?=
 =?us-ascii?Q?qx5om0bet7lkotRikgK2ypZii8zfE7ZISe6MpUy8qtZsvDzdO7VTU85DyMBt?=
 =?us-ascii?Q?ZR1+Gx64OfdpgtCZm5WMbwRhpy0HVZ1p60lDZLoEr4JZIhGdnl7R5fDIaS72?=
 =?us-ascii?Q?/Q4CYalOA30r00+7Jmac7bgfAE6FuXuZQ791eSgKCDeFxqN2Oih+6X4UcdkL?=
 =?us-ascii?Q?4cl2dMtGuicClDCZ82D0odL58hO7LOWXkGEBri61ffPHOVkIDz+4LlMXybPc?=
 =?us-ascii?Q?uDS80La4Wtrin1LWA0gp2OAFDhBg2RLGFfxJI0CdLmFSBInh2+mX/sfcUvJ/?=
 =?us-ascii?Q?O9bKemj//ho7PYNCABvapwc0dQvqUUr4H7pGesQHTFtTm9/8OrnA5JJF61ba?=
 =?us-ascii?Q?kOcZCiZ8f7ZsfRD2vQCWQ/tstKGdDKGPE1XubciY0I6FxIJfxqXPSUWH9wod?=
 =?us-ascii?Q?dR/VMNQnw1U9LsH3BjooENdgoN7OybnsJUucjZRG360BTyvBmBENrCGlHB8b?=
 =?us-ascii?Q?Ae4lDT69hIhSmJ3/hVbFGEu3PkCJeTm0PVl0huImwuwtxFHmOYd4hs1Czjv0?=
 =?us-ascii?Q?JdbtDe+oK3RAF9d1/LL6bejo+GDsTyFYXP+JGnZJfjhZIjwOXwSgAKlm3qaZ?=
 =?us-ascii?Q?exTe9bTaJVmNYZMMLhY6PL4YcRbx+rJKk+/lj2UEQ0XZ6sNgCSxfl2TUYkc+?=
 =?us-ascii?Q?IDf8gORj4hByQ7oJ1TOsgrw1QqERlHoKhXmK4xIybTR+Tkglu1JYlLNdvBc4?=
 =?us-ascii?Q?lr6+Y3DCQpdj2yjfvQM++7oOQHFQZNZ4WOButx3w8YRgyCkxtuBPWi5WQ7ua?=
 =?us-ascii?Q?Z3FoPf8ykCkqX/IS2gqkKvhOvDaOd+Vegz7XMLoEmqpUzZauvDR0nXXBZ6oF?=
 =?us-ascii?Q?s2s/zXC+cz95wddgbwsIB4V9yKrzxsfJjM5WQ61LOglc427L8Q+hGGmzP/9T?=
 =?us-ascii?Q?PMg6XsojvyPxMtrTg+8bhLChiIhU0IwPQ5rxXtbcZ59PvyvqbA+a3mw9EMBR?=
 =?us-ascii?Q?nn87XT14v2u0qUWrWFE2rV8dWd/9DuMvMD9YpfCgi2nll2gajoVGauZqJGlF?=
 =?us-ascii?Q?bYsQlsDB9TiX6C5nHh3IgNtCtOekLFjPOhZ7a5LoOjfADyUqagPWYiRVHzl2?=
 =?us-ascii?Q?/+UQhIUyXQxO+ey5s9WO3SktGQagZKArd+MfMELHtZEk8NnOpXc5suf1hN8H?=
 =?us-ascii?Q?QpL5r5DmjAYKoTyMxKy7IAUnqSxmhmA3IAbcFram/5UT7CXEJqhn/YJMt1r0?=
 =?us-ascii?Q?pML57QXLN+73tgS1pJknMkKQ5sucqcjE20pUcpWYWFPKuvEC7n3iihcEL+nI?=
 =?us-ascii?Q?poHzSvaxknPqry5SriVytO2iby8Gpj6KT7y29RxBlnBXutI/iaE/U4/pjjwI?=
 =?us-ascii?Q?gcRkhtI/bdC/wXZg5tQCJLA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c589b351-b6bb-40b6-c742-08dc9ff28d90
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:48.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzbJSkSeYqz76h0EZ6OFv/57yRQb5cNqOoRqi0FhvaifPSLikin1YC6A1iTLF6DBovZI7IGgSO1ZUBWZ/AIyNWlINBHxXApRUYZFma9aDGaiQeByRlqgehXfd/CcRc6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

Add ISP output parameters and 3A statistisc collection data video
device for documents.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../admin-guide/media/starfive_camss.rst      | 11 +++++++---
 .../media/starfive_camss_graph.dot            | 22 +++++++++++--------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/media/starfive_camss.rst b/Documentation/admin-guide/media/starfive_camss.rst
index ca42e9447c47..020f1969e67f 100644
--- a/Documentation/admin-guide/media/starfive_camss.rst
+++ b/Documentation/admin-guide/media/starfive_camss.rst
@@ -58,15 +58,20 @@ The media controller pipeline graph is as follows:
     :alt:   starfive_camss_graph.dot
     :align: center
 
-The driver has 2 video devices:
+The driver has 4 video devices:
 
+- output_params: The meta output device, transmitting the parameters to ISP
+  module.
 - capture_raw: The capture device, capturing image data directly from a sensor.
 - capture_yuv: The capture device, capturing YUV frame data processed by the
-  ISP module
+  ISP module.
+- capture_scd: The meta capture device, capturing 3A statistics collection data
+  processed by the ISP module.
 
 The driver has 3 subdevices:
 
-- stf_isp: is responsible for all the isp operations, outputs YUV frames.
+- stf_isp: is responsible for all the isp operations, outputs YUV frames
+  and 3A statistics collection data.
 - cdns_csi2rx: a CSI-2 bridge supporting up to 4 CSI lanes in input, and 4
   different pixel streams in output.
 - imx219: an image sensor, image data is sent through MIPI CSI-2.
diff --git a/Documentation/admin-guide/media/starfive_camss_graph.dot b/Documentation/admin-guide/media/starfive_camss_graph.dot
index 8eff1f161ac7..7961255d3ad6 100644
--- a/Documentation/admin-guide/media/starfive_camss_graph.dot
+++ b/Documentation/admin-guide/media/starfive_camss_graph.dot
@@ -1,12 +1,16 @@
 digraph board {
 	rankdir=TB
-	n00000001 [label="{{<port0> 0} | stf_isp\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000001:port1 -> n00000008 [style=dashed]
-	n00000004 [label="capture_raw\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
-	n00000008 [label="capture_yuv\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
-	n0000000e [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
-	n0000000e:port1 -> n00000001:port0 [style=dashed]
-	n0000000e:port1 -> n00000004 [style=dashed]
-	n00000018 [label="{{} | imx219 6-0010\n/dev/v4l-subdev1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
-	n00000018:port0 -> n0000000e:port0 [style=bold]
+	n00000001 [label="{{<port0> 0 | <port1> 1} | stf_isp\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port2 -> n0000000e
+	n00000001:port3 -> n00000012 [style=dashed]
+	n00000006 [label="output_params\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n00000006 -> n00000001:port1 [style=dashed]
+	n0000000a [label="capture_raw\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n0000000e [label="capture_yuv\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000012 [label="capture_scd\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n0000001c [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n/dev/v4l-subdev1 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
+	n0000001c:port1 -> n00000001:port0 [style=dashed]
+	n0000001c:port1 -> n0000000a [style=dashed]
+	n00000026 [label="{{} | imx219 6-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000026:port0 -> n0000001c:port0 [style=bold]
 }
-- 
2.25.1


