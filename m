Return-Path: <linux-media+bounces-54044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PP3Cs08pWne6QUAu9opvQ
	(envelope-from <linux-media+bounces-54044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:31:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B70821D3F01
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 08:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3030C300AD43
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 07:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8216377031;
	Mon,  2 Mar 2026 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uwlg0b23"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B3F383C6A;
	Mon,  2 Mar 2026 07:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436672; cv=fail; b=aOrPA1mmS/aLQh3feICglYaIafcOKLwo/EiM7Rd0va9DM+blYL3nvlz+tHpqMDSVe65PvCXVTPdupM6aNNfaUbAE70jZH2dgG/EJejVtfKpmN9EUbq0ifK+Xkh95MUykYWRO2J+Z11LzyOI5F4U4aOuhqsjHpfUm39+xJWAT6b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436672; c=relaxed/simple;
	bh=c7tJRMRXC73aIz6nvlLtJgeg14WUBgFHvpw+r2h3ikw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTEUHT1meB6X4KcxzcMantBB+B4fgd2YhP+DdHomVwbXUTr6orNg8sHCazZ7lMBagivqp0/3LBsL+4RBwBTYWy7XePq7CcC6CcoEr/rOhafR/FGPvN+m9Zj1DOA9Le4/gl4j/rCa3ENnZQ4YKZvSYv9lnY85Pf9cKiVn7kaK0Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uwlg0b23; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLeRLrlFgQychNLrhpeWUjI5wLDsM2j1fnK7dmuKkN0LhChdUJk5Sfo7suktXyJs8+qcp68HmtT0c5gnGCBGhSr99rnysEX0VtE00WGsX0UrvlnhglVwG11UxxV0b8NM59ecadigp6POHQqZLIoggLeiTVpI7CYuNeAagFx5lAsRMAiboe6ZiDrz3YQU2dgFsKn74oLWhYJ1Y97xUFOnhd00LHtZxzKOKJ11MENus6pN8ljXIEgZ+ibClC0IojQcdVBkoG3qJBr0nJAGsm1WFlL0rVPjEzVAZOXbhRk6BdLH+xgIVRlSy69ZD08UkYWwuysFyes3tQWAwBcaWtdgqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7Q97rkOhaXeeYeecC7yfEtgwnJqSqMW0PyprIUX6Ro=;
 b=L6etZ2BBRu4+FoIA8f1fmvuITL0g/0Edhe7hHS1ylay5wN8KgcWiadBNwtM6QkwE2/z1u/oF+yUxK/0gfTbYxCW1X7osBuke+m+QrPYGTZ5NE1kWmQe0qklPzwTz+4msJHgF8OMR84SYVDuwM7Cyk0zGcieGmmYdleOdwC+Ep34GMS5gsIsTSjaTdQ5V+X7JVdwRGcXU3iVDbztlqLNl64aORkRAGMsC9hN9Ef0pKeozZ4Nvf34LjA0tZo7Pwpq/Alb5jHLJxIeF9Tr5ZN/Dzpb8RSnCdFQzh0QlCDAQscecaRu7NOxlQTlYKiygWF/EZh6tqwtN7gkFQs86OxASEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7Q97rkOhaXeeYeecC7yfEtgwnJqSqMW0PyprIUX6Ro=;
 b=uwlg0b23JBI/NOhX7EROKeEydNckqO2ji9LoV8NGVQpRS7bCmsCXJkpQJcwACN0vcu5ApMmFVHrDZ5P3NfVSa7SJatJT0xtmM9MwtlvVBgqrNFMW8YAjP1j8BQaHMDonpKV4SnLpbCqPFi/9MBax/1hZQCTe901WJqG7uBbtbsM=
Received: from SJ2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:a03:505::8)
 by LV0PR12MB999092.namprd12.prod.outlook.com (2603:10b6:408:32e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Mon, 2 Mar
 2026 07:31:04 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::91) by SJ2PR07CA0008.outlook.office365.com
 (2603:10b6:a03:505::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 07:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 07:31:03 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 01:30:56 -0600
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sultan@kerneltoast.com>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <mario.limonciello@amd.com>,
	<richard.gong@amd.com>, <anson.tsao@amd.com>, <bin.du@amd.com>, Bin Du
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Alexey
 Zagorodnikov" <xglooom@gmail.com>, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v9 4/7] media: platform: amd: isp4 subdev and firmware loading handling added
Date: Mon, 2 Mar 2026 15:30:17 +0800
Message-ID: <20260302073020.148277-5-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302073020.148277-1-Bin.Du@amd.com>
References: <20260302073020.148277-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|LV0PR12MB999092:EE_
X-MS-Office365-Filtering-Correlation-Id: a984aa3f-e1a4-4f49-adf7-08de782da927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	oCw5AvB+bYhWr3RrQkAuoIKqixtrDsozwUviVhZyMA6gMbjmwF1JnB4zNuO7vyQIqjMKkO/jWIGSoy7XKlBBeZNFXlXi9Hn3RsqugdOQf3y5XaqdB69dIEjihwr805AVBxPgN38pWS3r4keURdyl5Ir4qGQwSENdyaqlBPKYaVcFLcsr5DKdYea0Oqxi6ErPAtmZ0aEdL5rQ4PqTte5RKXXQAohqTfdb/FZ3bmRtMqmwnI2v8I1EWdedoC2JyjMYF4zrnPFGW046xn03CrnEdzlyAWefNuZzALNz+GvezK9CSmxO5VTFxc7rqgC6UxOW0Wep95tHKFwNnpb9GUUYzJ8CSauyecqIx30CMl9qXxI17zSxvKENfhZVyJZUOH5tt8KPEvb9YZJmesc9Aq2AANBMSDFb25NRXNxp+KO/X6ByurSON6duc1eRgogE2quXi05Wapco5YgCvx9VqrSzfHRpHXkihe19ODftpkCkeRhVDKiEJL9utiEzwlBz5ZrHE59NSwsnpzC+UNdmTDFxIOOwKqhY17SgEAKVbS8kNoHW/EuNx4hlynLAAoq7b7nWmY7XfV3P/rUWkkmVmpO+a7onEa7CmoRzrt7bnBmuc7M5GDc85ZgNq5DuHK6roZuuHtkyZwTvrFmGvfjEvgbYUEdeftSHjTV/L4Qz0TMOXpAobwq+Ka3q4erLX6OR0M+riuiXRrChZ0A5/Md2hO46Digr6uplIGDpELuBf6V+J/Y3v03MTH24RQoxAb7pEip1dMQvrWtoIlA2khy43gCkNQg+DYO9RvjwPaVILQvNeblltWngUM15tVnfWDzrLO7ZlWbGFZ6m3Jzm/7PFisSeuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ScTBIuukpMvUVKicZ4J4/ObB85kYu3U/bOGgrLR+BuFrVDNL+UaYAFwNgfZWPNDZ1ie/po2m1zkOBEphcEDvC4pi8IvwpWIXZ8e/ij8sD7Z0oaHfpt5ZxBz8zs53c4k/O+okxPVF5jbKJYiz4csP/0hji3i0uCv7vs6lE/s5OGblRUL9cuMUjzs2ZygwIsoMnbwRaMR6Y5T309j/nLrbPdEaQaZtTpWkxjbz9QKqMCo93srAOpnmenQjHNj75lhNlv6v8BzAItwUZ1YrpX5PoX61JEtslktJxeXoXJrx8NAqZredYQ0RauJ5fs9W0jafpv7OgNh0rHl4lvHzpBUq93BSRwd30vbHtb347ND7Nqi0W22ILU4rv6CNfoLyKTyQPCn/RQGNNcojd0C71Yk6+02wEoSY4fhgYAdbOIMQVLUhRRmVm4Muo5HKLEkTWlj7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 07:31:03.8670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a984aa3f-e1a4-4f49-adf7-08de782da927
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54044-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bit.space:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,cmd_ch_en.ch:url,cmd_ch_disable.ch:url];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B70821D3F01
X-Rspamd-Action: no action

Isp4 sub-device is implementing v4l2 sub-device interface. It has one
capture video node, and supports only preview stream. It manages firmware
states, stream configuration. Add interrupt handling and notification for
isp firmware to isp-subdevice.

Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                                   |    2 +
 drivers/media/platform/amd/isp4/Makefile      |    3 +-
 drivers/media/platform/amd/isp4/isp4.c        |  104 +-
 drivers/media/platform/amd/isp4/isp4.h        |    7 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1029 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  120 ++
 6 files changed, 1259 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cccae369c876..48ffc8bbdcee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1149,6 +1149,8 @@ F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 F:	drivers/media/platform/amd/isp4/isp4_interface.c
 F:	drivers/media/platform/amd/isp4/isp4_interface.h
+F:	drivers/media/platform/amd/isp4/isp4_subdev.c
+F:	drivers/media/platform/amd/isp4/isp4_subdev.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index c7eadd33fc97..7e4854b6a4cd 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,4 +4,5 @@
 
 obj-$(CONFIG_VIDEO_AMD_ISP4_CAPTURE) += amd_isp4_capture.o
 amd_isp4_capture-objs := isp4.o \
-                         isp4_interface.o
+                         isp4_interface.o \
+                         isp4_subdev.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index 58b21258b6d3..e62f5d652d81 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -3,13 +3,18 @@
  * Copyright (C) 2025 Advanced Micro Devices, Inc.
  */
 
+#include <linux/irq.h>
 #include <linux/pm_runtime.h>
 #include <linux/vmalloc.h>
 #include <media/v4l2-ioctl.h>
 
 #include "isp4.h"
+#include "isp4_hw_reg.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
+#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
+	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
+	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
 
 static const struct {
 	const char *name;
@@ -17,27 +22,103 @@ static const struct {
 	u32 en_mask;
 	u32 ack_mask;
 	u32 rb_int_num;
-} isp4_irq[] = {
+} isp4_irq[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
 	/* The IRQ order is aligned with the isp4_subdev.fw_resp_thread order */
 	{
 		.name = "isp_irq_global",
+		.status_mask =
+		ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK,
+		.en_mask = ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK,
+		.ack_mask = ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK,
 		.rb_int_num = 4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
 	},
 	{
 		.name = "isp_irq_stream1",
+		.status_mask =
+		ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK,
+		.en_mask = ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK,
+		.ack_mask = ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK,
 		.rb_int_num = 0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
 	},
 };
 
+void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable)
+{
+	u32 intr_en;
+
+	/* Synchronize ISP_SYS_INT0_EN writes with the IRQ handler's writes */
+	spin_lock_irq(&isp_subdev->irq_lock);
+	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN);
+	if (enable)
+		intr_en |= isp4_irq[index].en_mask;
+	else
+		intr_en &= ~isp4_irq[index].en_mask;
+
+	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
+	spin_unlock_irq(&isp_subdev->irq_lock);
+}
+
+static void isp4_wake_up_resp_thread(struct isp4_subdev *isp_subdev, u32 index)
+{
+	struct isp4sd_thread_handler *thread_ctx =
+			&isp_subdev->fw_resp_thread[index];
+
+	thread_ctx->resp_ready = true;
+	wake_up_interruptible(&thread_ctx->waitq);
+}
+
 static irqreturn_t isp4_irq_handler(int irq, void *arg)
 {
+	struct isp4_subdev *isp_subdev = arg;
+	u32 intr_ack = 0, intr_en = 0, intr_status;
+	int seen = 0;
+
+	/* Get the ISP_SYS interrupt status */
+	intr_status = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_STATUS);
+	intr_status &= ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
+
+	/* Find which ISP_SYS interrupts fired */
+	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
+		if (intr_status & isp4_irq[i].status_mask) {
+			intr_ack |= isp4_irq[i].ack_mask;
+			intr_en |= isp4_irq[i].en_mask;
+			seen |= BIT(i);
+		}
+	}
+
+	/*
+	 * Disable the ISP_SYS interrupts that fired. Must be done before waking
+	 * the response threads, since they re-enable interrupts when finished.
+	 * The lock synchronizes RMW of INT0_EN with isp4_enable_interrupt().
+	 */
+	spin_lock(&isp_subdev->irq_lock);
+	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN) & ~intr_en;
+	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
+	spin_unlock(&isp_subdev->irq_lock);
+
+	/*
+	 * Clear the ISP_SYS interrupts. This must be done after the interrupts
+	 * are disabled, so that ISP FW won't flag any new interrupts on these
+	 * streams, and thus we don't need to clear interrupts again before
+	 * re-enabling them in the response thread.
+	 */
+	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_ACK, intr_ack);
+
+	/*
+	 * The operation `(seen >> i) << i` is logically equivalent to
+	 * `seen &= ~BIT(i)`, with fewer instructions after compilation.
+	 */
+	for (int i; (i = ffs(seen)); seen = (seen >> i) << i)
+		isp4_wake_up_resp_thread(isp_subdev, i - 1);
+
 	return IRQ_HANDLED;
 }
 
 static int isp4_capture_probe(struct platform_device *pdev)
 {
+	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
 	struct device *dev = &pdev->dev;
-	int irq[ARRAY_SIZE(isp4_irq)];
+	struct isp4_subdev *isp_subdev;
 	struct isp4_device *isp_dev;
 	int ret;
 
@@ -47,6 +128,12 @@ static int isp4_capture_probe(struct platform_device *pdev)
 
 	dev->init_name = ISP4_DRV_NAME;
 
+	isp_subdev = &isp_dev->isp_subdev;
+	isp_subdev->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(isp_subdev->mmio))
+		return dev_err_probe(dev, PTR_ERR(isp_subdev->mmio),
+				     "isp ioremap fail\n");
+
 	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
 		irq[i] = platform_get_irq(pdev, isp4_irq[i].rb_int_num);
 		if (irq[i] < 0)
@@ -55,7 +142,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
 					     isp4_irq[i].rb_int_num);
 
 		ret = devm_request_irq(dev, irq[i], isp4_irq_handler,
-				       IRQF_NO_AUTOEN, isp4_irq[i].name, dev);
+				       IRQF_NO_AUTOEN, isp4_irq[i].name,
+				       isp_subdev);
 		if (ret)
 			return dev_err_probe(dev, ret, "fail to req irq %d\n",
 					     irq[i]);
@@ -78,6 +166,13 @@ static int isp4_capture_probe(struct platform_device *pdev)
 
 	pm_runtime_set_suspended(dev);
 	pm_runtime_enable(dev);
+	spin_lock_init(&isp_subdev->irq_lock);
+	ret = isp4sd_init(&isp_dev->isp_subdev, &isp_dev->v4l2_dev, irq);
+	if (ret) {
+		dev_err_probe(dev, ret, "fail init isp4 sub dev\n");
+		goto err_pm_disable;
+	}
+
 	ret = media_device_register(&isp_dev->mdev);
 	if (ret) {
 		dev_err_probe(dev, ret, "fail to register media device\n");
@@ -89,6 +184,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	return 0;
 
 err_isp4_deinit:
+	isp4sd_deinit(&isp_dev->isp_subdev);
+err_pm_disable:
 	pm_runtime_disable(dev);
 	v4l2_device_unregister(&isp_dev->v4l2_dev);
 err_clean_media:
@@ -103,6 +200,7 @@ static void isp4_capture_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	media_device_unregister(&isp_dev->mdev);
+	isp4sd_deinit(&isp_dev->isp_subdev);
 	pm_runtime_disable(dev);
 	v4l2_device_unregister(&isp_dev->v4l2_dev);
 	media_device_cleanup(&isp_dev->mdev);
diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
index 7f2db0dfa2d9..2db6683d6d8b 100644
--- a/drivers/media/platform/amd/isp4/isp4.h
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -6,12 +6,15 @@
 #ifndef _ISP4_H_
 #define _ISP4_H_
 
-#include <media/v4l2-device.h>
-#include <media/videobuf2-memops.h>
+#include <drm/amd/isp.h>
+#include "isp4_subdev.h"
 
 struct isp4_device {
 	struct v4l2_device v4l2_dev;
+	struct isp4_subdev isp_subdev;
 	struct media_device mdev;
 };
 
+void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable);
+
 #endif /* _ISP4_H_ */
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
new file mode 100644
index 000000000000..6d571b7f8840
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -0,0 +1,1029 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/pm_domain.h>
+#include <linux/units.h>
+
+#include "isp4.h"
+#include "isp4_fw_cmd_resp.h"
+#include "isp4_interface.h"
+
+#define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
+
+#define ISP4SD_PERFORMANCE_STATE_LOW 0
+#define ISP4SD_PERFORMANCE_STATE_HIGH 1
+
+/* align 32KB */
+#define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
+
+#define to_isp4_subdev(sd) container_of(sd, struct isp4_subdev, sdev)
+
+static const char *isp4sd_entity_name = "amd isp4";
+
+static const char *isp4sd_thread_name[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
+	"amd_isp4_thread_global",
+	"amd_isp4_thread_stream1",
+};
+
+static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
+{
+	if (isp_subdev->enable_gpio) {
+		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
+		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
+			enable ? "enable" : "disable");
+	}
+}
+
+static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_send_buffer buf_type;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	if (!ispif->fw_mem_pool) {
+		dev_err(dev, "fail to alloc mem pool\n");
+		return -ENOMEM;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee
+	 * padding bits are zeroed, since this is not guaranteed on all
+	 * compilers.
+	 */
+	memset(&buf_type, 0, sizeof(buf_type));
+	buf_type.buffer_type = ISP4FW_BUFFER_TYPE_MEM_POOL;
+	buf_type.buffer.vmid_space.bit.space = ISP4FW_ADDR_SPACE_TYPE_GPU_VA;
+	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
+			    &buf_type.buffer.buf_base_a_lo,
+			    &buf_type.buffer.buf_base_a_hi);
+	buf_type.buffer.buf_size_a = ispif->fw_mem_pool->mem_size;
+
+	ret = isp4if_send_command(ispif, ISP4FW_CMD_ID_SEND_BUFFER,
+				  &buf_type, sizeof(buf_type));
+	if (ret) {
+		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
+			ispif->fw_mem_pool->gpu_mc_addr,
+			buf_type.buffer.buf_size_a, ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
+		ispif->fw_mem_pool->gpu_mc_addr, buf_type.buffer.buf_size_a);
+
+	return 0;
+}
+
+static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_set_stream_cfg cmd;
+	struct device *dev = isp_subdev->dev;
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee
+	 * padding bits are zeroed, since this is not guaranteed on all
+	 * compilers.
+	 */
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id =
+		ISP4FW_SENSOR_ID_ON_MIPI0;
+	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
+	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id =
+		ISP4FW_MIPI0_ISP_PIPELINE_ID;
+
+	cmd.stream_cfg.b_enable_tnr = true;
+	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
+		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
+		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
+		cmd.stream_cfg.b_enable_tnr);
+
+	return isp4if_send_command(ispif, ISP4FW_CMD_ID_SET_STREAM_CONFIG,
+				   &cmd, sizeof(cmd));
+}
+
+static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_send_buffer buf_type;
+	struct device *dev = isp_subdev->dev;
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee
+	 * padding bits are zeroed, since this is not guaranteed on all
+	 * compilers.
+	 */
+	memset(&buf_type, 0, sizeof(buf_type));
+	for (unsigned int i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
+		struct isp4if_gpu_mem_info *meta_info_buf =
+				isp_subdev->ispif.meta_info_buf[i];
+		int ret;
+
+		if (!meta_info_buf) {
+			dev_err(dev, "fail for no meta info buf(%u)\n", i);
+			return -ENOMEM;
+		}
+
+		buf_type.buffer_type = ISP4FW_BUFFER_TYPE_META_INFO;
+		buf_type.buffer.vmid_space.bit.space =
+			ISP4FW_ADDR_SPACE_TYPE_GPU_VA;
+		isp4if_split_addr64(meta_info_buf->gpu_mc_addr,
+				    &buf_type.buffer.buf_base_a_lo,
+				    &buf_type.buffer.buf_base_a_hi);
+		buf_type.buffer.buf_size_a = meta_info_buf->mem_size;
+		ret = isp4if_send_command(ispif, ISP4FW_CMD_ID_SEND_BUFFER,
+					  &buf_type, sizeof(buf_type));
+		if (ret) {
+			dev_err(dev, "send meta info(%u) fail\n", i);
+			return ret;
+		}
+	}
+
+	dev_dbg(dev, "send meta info suc\n");
+	return 0;
+}
+
+static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
+				    struct isp4fw_image_prop *out_prop,
+				    struct v4l2_subdev_state *state, u32 pad)
+{
+	struct device *dev = isp_subdev->dev;
+	struct v4l2_mbus_framefmt *format;
+
+	format = v4l2_subdev_state_get_format(state, pad, 0);
+	if (!format) {
+		dev_err(dev, "fail get subdev state format\n");
+		return false;
+	}
+
+	switch (format->code) {
+	case MEDIA_BUS_FMT_YUYV8_1_5X8:
+		out_prop->image_format = ISP4FW_IMAGE_FORMAT_NV12;
+		out_prop->width = format->width;
+		out_prop->height = format->height;
+		out_prop->luma_pitch = format->width;
+		out_prop->chroma_pitch = out_prop->width;
+		break;
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		out_prop->image_format = ISP4FW_IMAGE_FORMAT_YUV422INTERLEAVED;
+		out_prop->width = format->width;
+		out_prop->height = format->height;
+		out_prop->luma_pitch = format->width * 2;
+		out_prop->chroma_pitch = 0;
+		break;
+	default:
+		dev_err(dev, "fail for bad image format:0x%x\n",
+			format->code);
+		return false;
+	}
+
+	if (!out_prop->width || !out_prop->height)
+		return false;
+
+	return true;
+}
+
+static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
+{
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+
+	if (sensor_info->status == ISP4SD_START_STATUS_STARTED)
+		return 0;
+
+	if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
+		dev_err(dev, "fail for previous start fail\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "w:%u,h:%u\n", w, h);
+
+	if (isp4sd_send_meta_buf(isp_subdev)) {
+		dev_err(dev, "fail to send meta buf\n");
+		sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
+		return -EINVAL;
+	}
+
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
+
+	if (!sensor_info->start_stream_cmd_sent &&
+	    sensor_info->buf_sent_cnt >= ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
+		int ret = isp4if_send_command(ispif, ISP4FW_CMD_ID_START_STREAM,
+					      NULL, 0);
+		if (ret) {
+			dev_err(dev, "fail to start stream\n");
+			return ret;
+		}
+
+		sensor_info->start_stream_cmd_sent = true;
+	} else {
+		dev_dbg(dev,
+			"no send START_STREAM, start_sent %u, buf_sent %u\n",
+			sensor_info->start_stream_cmd_sent,
+			sensor_info->buf_sent_cnt);
+	}
+
+	return 0;
+}
+
+static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
+			       struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_output_info *output_info =
+			&isp_subdev->sensor_info.output_info;
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
+	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
+		return 0;
+
+	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
+		dev_err(dev, "fail for previous start fail\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee
+	 * padding bits are zeroed, since this is not guaranteed on all
+	 * compilers.
+	 */
+	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
+	cmd_ch_prop.ch = ISP4FW_ISP_PIPE_OUT_CH_PREVIEW;
+
+	if (!isp4sd_get_str_out_prop(isp_subdev,
+				     &cmd_ch_prop.image_prop, state, pad)) {
+		dev_err(dev, "fail to get out prop\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
+		cmd_ch_prop.ch,
+		cmd_ch_prop.image_prop.image_format,
+		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
+		cmd_ch_prop.image_prop.luma_pitch,
+		cmd_ch_prop.image_prop.chroma_pitch);
+
+	ret = isp4if_send_command(ispif, ISP4FW_CMD_ID_SET_OUT_CHAN_PROP,
+				  &cmd_ch_prop, sizeof(cmd_ch_prop));
+	if (ret) {
+		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
+		dev_err(dev, "fail to set out prop\n");
+		return ret;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee
+	 * padding bits are zeroed, since this is not guaranteed on all
+	 * compilers.
+	 */
+	memset(&cmd_ch_en, 0, sizeof(cmd_ch_en));
+	cmd_ch_en.ch = ISP4FW_ISP_PIPE_OUT_CH_PREVIEW;
+	cmd_ch_en.is_enable = true;
+	ret = isp4if_send_command(ispif, ISP4FW_CMD_ID_ENABLE_OUT_CHAN,
+				  &cmd_ch_en, sizeof(cmd_ch_en));
+	if (ret) {
+		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
+		dev_err(dev, "fail to enable channel\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "enable channel %d\n", cmd_ch_en.ch);
+
+	if (!sensor_info->start_stream_cmd_sent) {
+		ret = isp4sd_kickoff_stream(isp_subdev,
+					    cmd_ch_prop.image_prop.width,
+					    cmd_ch_prop.image_prop.height);
+		if (ret) {
+			dev_err(dev, "kickoff stream fail %d\n", ret);
+			return ret;
+		}
+		/*
+		 * sensor_info->start_stream_cmd_sent will be set to true
+		 * 1. in isp4sd_kickoff_stream, if app first send buffer then
+		 * start stream
+		 * 2. in isp_set_stream_buf, if app first start stream, then
+		 * send buffer because ISP FW has the requirement, host needs
+		 * to send buffer before send start stream cmd
+		 */
+		if (sensor_info->start_stream_cmd_sent) {
+			sensor_info->status = ISP4SD_START_STATUS_STARTED;
+			output_info->start_status = ISP4SD_START_STATUS_STARTED;
+			dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
+		}
+	} else {
+		dev_dbg(dev, "stream running, no need kickoff\n");
+		output_info->start_status = ISP4SD_START_STATUS_STARTED;
+	}
+
+	dev_dbg(dev, "setup output suc\n");
+	return 0;
+}
+
+static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
+{
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	ret = isp4sd_setup_fw_mem_pool(isp_subdev);
+	if (ret) {
+		dev_err(dev, "fail to setup fw mem pool\n");
+		return ret;
+	}
+
+	ret = isp4sd_set_stream_path(isp_subdev);
+	if (ret) {
+		dev_err(dev, "fail to setup stream path\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
+				 struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4sd_output_info *output_info = &sensor_info->output_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct v4l2_mbus_framefmt *format;
+
+	format = v4l2_subdev_state_get_format(state, pad, 0);
+	if (!format) {
+		dev_err(isp_subdev->dev, "fail to get v4l2 format\n");
+	} else {
+		memset(format, 0, sizeof(*format));
+		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
+	}
+
+	isp4if_clear_bufq(ispif);
+	isp4if_clear_cmdq(ispif);
+
+	sensor_info->start_stream_cmd_sent = false;
+	sensor_info->buf_sent_cnt = 0;
+
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
+	output_info->start_status = ISP4SD_START_STATUS_OFF;
+}
+
+static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
+				    enum isp4if_stream_id stream_id,
+				    struct isp4fw_resp_cmd_done *para)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4if_cmd_element *ele =
+		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
+	struct device *dev = isp_subdev->dev;
+
+	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+		stream_id,
+		para->cmd_id, para->cmd_status, para->cmd_seq_num,
+		ele);
+
+	if (ele) {
+		complete(&ele->cmd_done);
+		if (atomic_dec_and_test(&ele->refcnt))
+			kfree(ele);
+	}
+}
+
+static struct isp4fw_meta_info *
+isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev, u64 mc)
+{
+	for (unsigned int i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
+		struct isp4if_gpu_mem_info *meta_info_buf =
+				isp_subdev->ispif.meta_info_buf[i];
+
+		if (meta_info_buf->gpu_mc_addr == mc)
+			return meta_info_buf->sys_addr;
+	}
+
+	return NULL;
+}
+
+static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
+				  u64 meta_info_mc)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4fw_cmd_send_buffer buf_type;
+	struct device *dev = isp_subdev->dev;
+
+	if (isp_subdev->sensor_info.status != ISP4SD_START_STATUS_STARTED) {
+		dev_warn(dev, "not working status %i, meta_info 0x%llx\n",
+			 isp_subdev->sensor_info.status, meta_info_mc);
+		return;
+	}
+
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee
+	 * padding bits are zeroed, since this is not guaranteed on all
+	 * compilers.
+	 */
+	memset(&buf_type, 0, sizeof(buf_type));
+	buf_type.buffer_type = ISP4FW_BUFFER_TYPE_META_INFO;
+	buf_type.buffer.vmid_space.bit.space = ISP4FW_ADDR_SPACE_TYPE_GPU_VA;
+	isp4if_split_addr64(meta_info_mc,
+			    &buf_type.buffer.buf_base_a_lo,
+			    &buf_type.buffer.buf_base_a_hi);
+	buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
+
+	if (isp4if_send_command(ispif, ISP4FW_CMD_ID_SEND_BUFFER,
+				&buf_type, sizeof(buf_type)))
+		dev_err(dev, "fail send meta_info 0x%llx\n",
+			meta_info_mc);
+	else
+		dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
+}
+
+static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
+				      enum isp4if_stream_id stream_id,
+				      struct isp4fw_resp_param_package *para)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	struct isp4if_img_buf_node *prev;
+	struct isp4fw_meta_info *meta;
+	u64 mc;
+
+	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
+	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
+	if (!meta) {
+		dev_err(dev, "fail to get meta from mc %llx\n", mc);
+		return;
+	}
+
+	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,status:%i\n",
+		ktime_get_ns(), stream_id, meta->poc, meta->preview.enabled,
+		meta->preview.status);
+
+	if (meta->preview.enabled &&
+	    (meta->preview.status == ISP4FW_BUFFER_STATUS_SKIPPED ||
+	     meta->preview.status == ISP4FW_BUFFER_STATUS_DONE ||
+	     meta->preview.status == ISP4FW_BUFFER_STATUS_DIRTY)) {
+		prev = isp4if_dequeue_buffer(ispif);
+		if (prev)
+			isp4if_dealloc_buffer_node(prev);
+		else
+			dev_err(dev, "fail null prev buf\n");
+
+	} else if (meta->preview.enabled) {
+		dev_err(dev, "fail bad preview status %u\n",
+			meta->preview.status);
+	}
+
+	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
+		isp4sd_send_meta_info(isp_subdev, mc);
+
+	dev_dbg(dev, "stream_id:%d, status:%d\n", stream_id,
+		isp_subdev->sensor_info.status);
+}
+
+static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
+				enum isp4if_stream_id stream_id)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	struct isp4fw_resp resp;
+
+	while (true) {
+		if (isp4if_f2h_resp(ispif, stream_id, &resp)) {
+			/* Re-enable the interrupt */
+			isp4_intr_enable(isp_subdev, stream_id, true);
+			/*
+			 * Recheck to see if there is a new response.
+			 * To ensure that an in-flight interrupt is not lost,
+			 * enabling the interrupt must occur _before_ checking
+			 * for a new response, hence a memory barrier is needed.
+			 * Disable the interrupt again if there was a new
+			 * response.
+			 */
+			mb();
+			if (likely(isp4if_f2h_resp(ispif, stream_id, &resp)))
+				break;
+
+			isp4_intr_enable(isp_subdev, stream_id, false);
+		}
+
+		switch (resp.resp_id) {
+		case ISP4FW_RESP_ID_CMD_DONE:
+			isp4sd_fw_resp_cmd_done(isp_subdev, stream_id,
+						&resp.param.cmd_done);
+			break;
+		case ISP4FW_RESP_ID_NOTI_FRAME_DONE:
+			isp4sd_fw_resp_frame_done(isp_subdev, stream_id,
+						  &resp.param.frame_done);
+			break;
+		default:
+			dev_err(dev, "-><- fail respid (0x%x)\n",
+				resp.resp_id);
+			break;
+		}
+	}
+}
+
+static s32 isp4sd_fw_resp_thread(void *context)
+{
+	struct isp4_subdev_thread_param *para = context;
+	struct isp4_subdev *isp_subdev = para->isp_subdev;
+	struct isp4sd_thread_handler *thread_ctx =
+			&isp_subdev->fw_resp_thread[para->idx];
+	struct device *dev = isp_subdev->dev;
+
+	dev_dbg(dev, "[%u] fw resp thread started\n", para->idx);
+	while (true) {
+		wait_event_interruptible(thread_ctx->waitq,
+					 thread_ctx->resp_ready);
+		thread_ctx->resp_ready = false;
+
+		if (kthread_should_stop()) {
+			dev_dbg(dev, "[%u] fw resp thread quit\n", para->idx);
+			break;
+		}
+
+		isp4sd_fw_resp_func(isp_subdev, para->idx);
+	}
+
+	return 0;
+}
+
+static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
+{
+	for (unsigned int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
+		struct isp4sd_thread_handler *thread_ctx =
+				&isp_subdev->fw_resp_thread[i];
+
+		if (thread_ctx->thread) {
+			kthread_stop(thread_ctx->thread);
+			thread_ctx->thread = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
+{
+	struct device *dev = isp_subdev->dev;
+
+	for (unsigned int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
+		struct isp4sd_thread_handler *thread_ctx =
+				&isp_subdev->fw_resp_thread[i];
+
+		isp_subdev->isp_resp_para[i].idx = i;
+		isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
+		init_waitqueue_head(&thread_ctx->waitq);
+		thread_ctx->resp_ready = false;
+
+		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
+						 &isp_subdev->isp_resp_para[i],
+						 isp4sd_thread_name[i]);
+		if (IS_ERR(thread_ctx->thread)) {
+			dev_err(dev, "create thread [%d] fail\n", i);
+			thread_ctx->thread = NULL;
+			isp4sd_stop_resp_proc_threads(isp_subdev);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
+		dev_err(dev, "fail for stream still running\n");
+		return -EINVAL;
+	}
+
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
+
+	if (isp_subdev->irq_enabled) {
+		for (unsigned int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
+			disable_irq(isp_subdev->irq[i]);
+		isp_subdev->irq_enabled = false;
+	}
+
+	isp4sd_stop_resp_proc_threads(isp_subdev);
+	dev_dbg(dev, "isp_subdev stop resp proc threads suc\n");
+
+	isp4if_stop(ispif);
+
+	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
+	if (ret)
+		dev_err(dev,
+			"fail to set isp_subdev performance state %u,ret %d\n",
+			perf_state, ret);
+
+	/* hold ccpu reset */
+	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
+	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		dev_err(dev, "power off isp_subdev fail %d\n", ret);
+	else
+		dev_dbg(dev, "power off isp_subdev suc\n");
+
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+	isp4if_clear_cmdq(ispif);
+	isp4sd_module_enable(isp_subdev, false);
+
+	/*
+	 * When opening the camera, isp4sd_module_enable(isp_subdev, true) is
+	 * called. Hardware requires at least a 20ms delay between disabling
+	 * and enabling the module, so a sleep is added to ensure ISP stability
+	 * during quick reopen scenarios.
+	 */
+	msleep(20);
+
+	return 0;
+}
+
+int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+	if (ispif->status == ISP4IF_STATUS_FW_RUNNING) {
+		dev_dbg(dev, "camera already opened, do nothing\n");
+		return 0;
+	}
+
+	isp4sd_module_enable(isp_subdev, true);
+
+	if (ispif->status < ISP4IF_STATUS_PWR_ON) {
+		unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret) {
+			dev_err(dev, "fail to power on isp_subdev ret %d\n",
+				ret);
+			goto err_deinit;
+		}
+
+		/* ISPPG ISP Power Status */
+		isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0x7FF);
+		ret = dev_pm_genpd_set_performance_state(dev, perf_state);
+		if (ret) {
+			dev_err(dev,
+				"fail to set performance state %u, ret %d\n",
+				perf_state, ret);
+			goto err_deinit;
+		}
+
+		ispif->status = ISP4IF_STATUS_PWR_ON;
+	}
+
+	isp_subdev->sensor_info.start_stream_cmd_sent = false;
+	isp_subdev->sensor_info.buf_sent_cnt = 0;
+
+	ret = isp4if_start(ispif);
+	if (ret) {
+		dev_err(dev, "fail to start isp_subdev interface\n");
+		goto err_deinit;
+	}
+
+	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
+		dev_err(dev, "isp_start_resp_proc_threads fail\n");
+		goto err_deinit;
+	}
+
+	dev_dbg(dev, "create resp threads ok\n");
+
+	for (unsigned int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
+		enable_irq(isp_subdev->irq[i]);
+	isp_subdev->irq_enabled = true;
+
+	return 0;
+err_deinit:
+	isp4sd_pwroff_and_deinit(sd);
+	return -EINVAL;
+}
+
+static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
+			      struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4sd_output_info *output_info = &sensor_info->output_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+	dev_dbg(dev, "status %i\n", output_info->start_status);
+
+	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
+		struct isp4fw_cmd_enable_out_ch cmd_ch_disable;
+		int ret;
+
+		/*
+		 * The struct will be shared with ISP FW, use memset() to
+		 * guarantee padding bits are zeroed, since this is not
+		 * guaranteed on all compilers.
+		 */
+		memset(&cmd_ch_disable, 0, sizeof(cmd_ch_disable));
+		cmd_ch_disable.ch = ISP4FW_ISP_PIPE_OUT_CH_PREVIEW;
+		/* `cmd_ch_disable.is_enable` is already false */
+		ret = isp4if_send_command_sync(ispif,
+					       ISP4FW_CMD_ID_ENABLE_OUT_CHAN,
+					       &cmd_ch_disable,
+					       sizeof(cmd_ch_disable));
+		if (ret)
+			dev_err(dev, "fail to disable stream\n");
+		else
+			dev_dbg(dev, "wait disable stream suc\n");
+
+		ret = isp4if_send_command_sync(ispif, ISP4FW_CMD_ID_STOP_STREAM,
+					       NULL, 0);
+		if (ret)
+			dev_err(dev, "fail to stop stream\n");
+		else
+			dev_dbg(dev, "wait stop stream suc\n");
+	}
+
+	isp4sd_uninit_stream(isp_subdev, state, pad);
+
+	/*
+	 * Return success to ensure the stop process proceeds,
+	 * and disregard any errors since they are not fatal.
+	 */
+	return 0;
+}
+
+static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
+			       struct v4l2_subdev_state *state, u32 pad)
+{
+	struct isp4sd_output_info *output_info =
+			&isp_subdev->sensor_info.output_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+
+	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
+		dev_err(dev, "fail, bad fsm %d\n", ispif->status);
+		return -EINVAL;
+	}
+
+	switch (output_info->start_status) {
+	case ISP4SD_START_STATUS_OFF:
+		break;
+	case ISP4SD_START_STATUS_STARTED:
+		dev_dbg(dev, "stream already started, do nothing\n");
+		return 0;
+	case ISP4SD_START_STATUS_START_FAIL:
+		dev_err(dev, "stream previously failed to start\n");
+		return -EINVAL;
+	}
+
+	ret = isp4sd_init_stream(isp_subdev);
+	if (ret) {
+		dev_err(dev, "fail to init isp_subdev stream\n");
+		goto err_stop_stream;
+	}
+
+	ret = isp4sd_setup_output(isp_subdev, state, pad);
+	if (ret) {
+		dev_err(dev, "fail to setup output\n");
+		goto err_stop_stream;
+	}
+
+	return 0;
+
+err_stop_stream:
+	isp4sd_stop_stream(isp_subdev, state, pad);
+	return ret;
+}
+
+int isp4sd_ioc_send_img_buf(struct v4l2_subdev *sd,
+			    struct isp4if_img_buf_info *buf_info)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct isp4if_img_buf_node *buf_node;
+	struct device *dev = isp_subdev->dev;
+	int ret;
+
+	guard(mutex)(&isp_subdev->ops_mutex);
+
+	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
+		dev_err(dev, "fail send img buf for bad fsm %d\n",
+			ispif->status);
+		return -EINVAL;
+	}
+
+	buf_node = isp4if_alloc_buffer_node(buf_info);
+	if (!buf_node) {
+		dev_err(dev, "fail alloc sys img buf info node\n");
+		return -ENOMEM;
+	}
+
+	ret = isp4if_queue_buffer(ispif, buf_node);
+	if (ret) {
+		dev_err(dev, "fail to queue image buf, %d\n", ret);
+		goto error_release_buf_node;
+	}
+
+	if (!isp_subdev->sensor_info.start_stream_cmd_sent) {
+		isp_subdev->sensor_info.buf_sent_cnt++;
+
+		if (isp_subdev->sensor_info.buf_sent_cnt >=
+		    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
+			ret = isp4if_send_command(ispif,
+						  ISP4FW_CMD_ID_START_STREAM,
+						  NULL, 0);
+			if (ret) {
+				dev_err(dev, "fail to START_STREAM");
+				goto error_release_buf_node;
+			}
+			isp_subdev->sensor_info.start_stream_cmd_sent = true;
+			isp_subdev->sensor_info.output_info.start_status =
+				ISP4SD_START_STATUS_STARTED;
+			isp_subdev->sensor_info.status =
+				ISP4SD_START_STATUS_STARTED;
+		} else {
+			dev_dbg(dev,
+				"no send start, required %u, buf sent %u\n",
+				ISP4SD_MIN_BUF_CNT_BEF_START_STREAM,
+				isp_subdev->sensor_info.buf_sent_cnt);
+		}
+	}
+
+	return 0;
+
+error_release_buf_node:
+	isp4if_dealloc_buffer_node(buf_node);
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops isp4sd_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static int isp4sd_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *format)
+{
+	struct isp4sd_output_info *stream_info =
+		&(to_isp4_subdev(sd)->sensor_info.output_info);
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
+
+	if (!fmt) {
+		dev_err(sd->dev, "fail to get state format\n");
+		return -EINVAL;
+	}
+
+	*fmt = format->format;
+	switch (fmt->code) {
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+		stream_info->image_size = fmt->width * fmt->height * 2;
+		break;
+	case MEDIA_BUS_FMT_YUYV8_1_5X8:
+	default:
+		stream_info->image_size = fmt->width * fmt->height * 3 / 2;
+		break;
+	}
+
+	if (!stream_info->image_size) {
+		dev_err(sd->dev,
+			"fail set pad format,code 0x%x,width %u, height %u\n",
+			fmt->code, fmt->width, fmt->height);
+		return -EINVAL;
+	}
+
+	dev_dbg(sd->dev, "set pad format suc, code:%x w:%u h:%u size:%u\n",
+		fmt->code, fmt->width, fmt->height,
+		stream_info->image_size);
+
+	return 0;
+}
+
+static int isp4sd_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+
+	return isp4sd_start_stream(isp_subdev, state, pad);
+}
+
+static int isp4sd_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
+
+	return isp4sd_stop_stream(isp_subdev, state, pad);
+}
+
+static const struct v4l2_subdev_pad_ops isp4sd_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = isp4sd_set_pad_format,
+	.enable_streams = isp4sd_enable_streams,
+	.disable_streams = isp4sd_disable_streams,
+};
+
+static const struct v4l2_subdev_ops isp4sd_subdev_ops = {
+	.video = &isp4sd_video_ops,
+	.pad = &isp4sd_pad_ops,
+};
+
+int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
+		int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM])
+{
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+	struct device *dev = v4l2_dev->dev;
+	int ret;
+
+	isp_subdev->dev = dev;
+	v4l2_subdev_init(&isp_subdev->sdev, &isp4sd_subdev_ops);
+	isp_subdev->sdev.owner = THIS_MODULE;
+	isp_subdev->sdev.dev = dev;
+	snprintf(isp_subdev->sdev.name, sizeof(isp_subdev->sdev.name), "%s",
+		 dev_name(dev));
+
+	isp_subdev->sdev.entity.name = isp4sd_entity_name;
+	isp_subdev->sdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	isp_subdev->sdev_pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&isp_subdev->sdev.entity, 1,
+				     &isp_subdev->sdev_pad);
+	if (ret) {
+		dev_err(dev, "fail to init isp4 subdev entity pad %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(&isp_subdev->sdev);
+	if (ret < 0) {
+		dev_err(dev, "fail to init finalize isp4 subdev %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register_subdev(v4l2_dev, &isp_subdev->sdev);
+	if (ret) {
+		dev_err(dev, "fail to register isp4 subdev to V4L2 device %d\n",
+			ret);
+		goto err_media_clean_up;
+	}
+
+	isp4if_init(ispif, dev, isp_subdev->mmio);
+
+	mutex_init(&isp_subdev->ops_mutex);
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
+
+	/* create ISP enable gpio control */
+	isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
+						 "enable_isp",
+						 GPIOD_OUT_LOW);
+	if (IS_ERR(isp_subdev->enable_gpio)) {
+		ret = PTR_ERR(isp_subdev->enable_gpio);
+		dev_err(dev, "fail to get gpiod %d\n", ret);
+		goto err_subdev_unreg;
+	}
+
+	for (unsigned int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
+		isp_subdev->irq[i] = irq[i];
+
+	isp_subdev->host2fw_seq_num = 1;
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+
+	return 0;
+
+err_subdev_unreg:
+	v4l2_device_unregister_subdev(&isp_subdev->sdev);
+err_media_clean_up:
+	v4l2_subdev_cleanup(&isp_subdev->sdev);
+	media_entity_cleanup(&isp_subdev->sdev.entity);
+	return ret;
+}
+
+void isp4sd_deinit(struct isp4_subdev *isp_subdev)
+{
+	struct isp4_interface *ispif = &isp_subdev->ispif;
+
+	v4l2_device_unregister_subdev(&isp_subdev->sdev);
+	media_entity_cleanup(&isp_subdev->sdev.entity);
+	isp4if_deinit(ispif);
+	isp4sd_module_enable(isp_subdev, false);
+
+	ispif->status = ISP4IF_STATUS_PWR_OFF;
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
new file mode 100644
index 000000000000..ceade9fec5d9
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_SUBDEV_H_
+#define _ISP4_SUBDEV_H_
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/pm_runtime.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+#include <media/v4l2-device.h>
+
+#include "isp4_fw_cmd_resp.h"
+#include "isp4_hw_reg.h"
+#include "isp4_interface.h"
+
+/*
+ * One is for none sensor specific response which is not used now.
+ * Another is for sensor specific response
+ */
+#define ISP4SD_MAX_FW_RESP_STREAM_NUM 2
+
+/* Indicates the ISP status */
+enum isp4sd_status {
+	ISP4SD_STATUS_PWR_OFF,
+	ISP4SD_STATUS_PWR_ON,
+	ISP4SD_STATUS_FW_RUNNING,
+	ISP4SD_STATUS_MAX
+};
+
+/* Indicates sensor and output stream status */
+enum isp4sd_start_status {
+	ISP4SD_START_STATUS_OFF,
+	ISP4SD_START_STATUS_STARTED,
+	ISP4SD_START_STATUS_START_FAIL,
+};
+
+struct isp4sd_img_buf_node {
+	struct list_head node;
+	struct isp4if_img_buf_info buf_info;
+};
+
+/* This is ISP output after processing Bayer raw sensor input */
+struct isp4sd_output_info {
+	enum isp4sd_start_status start_status;
+	u32 image_size;
+};
+
+/*
+ * Struct for sensor info used as ISP input or source.
+ * status: sensor status.
+ * output_info: ISP output after processing the sensor input.
+ * start_stream_cmd_sent: indicates if ISP4FW_CMD_ID_START_STREAM was sent
+ * to firmware.
+ * buf_sent_cnt: number of buffers sent to receive images.
+ */
+struct isp4sd_sensor_info {
+	struct isp4sd_output_info output_info;
+	enum isp4sd_start_status status;
+	bool start_stream_cmd_sent;
+	u32 buf_sent_cnt;
+};
+
+/*
+ * The thread is created by the driver to handle firmware responses which will
+ * be waken up when a firmware-to-driver response interrupt occurs.
+ */
+struct isp4sd_thread_handler {
+	struct task_struct *thread;
+	wait_queue_head_t waitq;
+	bool resp_ready;
+};
+
+struct isp4_subdev_thread_param {
+	u32 idx;
+	struct isp4_subdev *isp_subdev;
+};
+
+struct isp4_subdev {
+	struct v4l2_subdev sdev;
+	struct isp4_interface ispif;
+
+	struct media_pad sdev_pad;
+
+	enum isp4sd_status isp_status;
+	/* mutex used to synchronize the operation with firmware */
+	struct mutex ops_mutex;
+
+	struct isp4sd_thread_handler
+		fw_resp_thread[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+
+	u32 host2fw_seq_num;
+
+	struct isp4sd_sensor_info sensor_info;
+
+	/* gpio descriptor */
+	struct gpio_desc *enable_gpio;
+	struct device *dev;
+	void __iomem *mmio;
+	struct isp4_subdev_thread_param
+		isp_resp_para[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+	bool irq_enabled;
+	/* spin lock to access ISP_SYS_INT0_EN exclusively */
+	spinlock_t irq_lock;
+};
+
+int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
+		int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM]);
+void isp4sd_deinit(struct isp4_subdev *isp_subdev);
+int isp4sd_ioc_send_img_buf(struct v4l2_subdev *sd,
+			    struct isp4if_img_buf_info *buf_info);
+int isp4sd_pwron_and_init(struct v4l2_subdev *sd);
+int isp4sd_pwroff_and_deinit(struct v4l2_subdev *sd);
+
+#endif /* _ISP4_SUBDEV_H_ */
-- 
2.34.1


