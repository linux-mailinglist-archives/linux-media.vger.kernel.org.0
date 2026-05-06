Return-Path: <linux-media+bounces-60566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JLTBk0L+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:35:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F334D8ADD
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E418306CB2A
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F763E9F7D;
	Wed,  6 May 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iUxrq27X"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1AB3DC4CB;
	Wed,  6 May 2026 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060041; cv=fail; b=BP278/yVcsy0ee+/5oYR8FyNb7sXdVvvxE13fzyb1V4JWGF/D3Mm0PSsFjDjSca/Co1KIaO2CqCOSt9lWgdzJj7FThD0cZqyaZuIK0VbF06OC3P2E7rtq6pCA9yBesYomufa6c71wOaZqCm2OeKqrfahZmcb57CVBwjHi2gGYWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060041; c=relaxed/simple;
	bh=P9nOexUXhAyN1jeb5peoijgOHT2vMOohSW0MBqr2Phg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdYBesmF2e4fqc+SK6/6XZjlZtPVeYzvd0cCJ6sCSp7D3q2wKgYaCZE5vDY95qSXRU/a3xzZo9GxLJEKAzVxx7Thv4ZnR0+9porcASS3NfLf2T7mqu+7p9+/Q4SVCBrKdnZkfBASLdxPSYqTPW2vGRR1kO/DwDEB7uRDQT/o5Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iUxrq27X; arc=fail smtp.client-ip=40.107.208.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMj2k3O8XzIBT0T1EiITMs30wwTwHgDZR0q0ZYl3nrBRUY/32n+ABL/96RxH3dokw8RKUA6XTOaIHcgh/b1ZFmiblvKaR9PRkgI5VhNpTFFpG98ELxwwcT+r0n5RNokR9FdeT+JRkdROXGok/OVBnpEyPvTJzdi7iO9Vs17zQ/sXQMq/j75/jcKpP97c66/CHQL8sQkbnD8O/EK3A0sQZsrz0/VwW+lex1RZlmwR4H65Ug1WVhxvRSoEy7oHwcyV8iOYl+qtorVCGLL+UiSFM1IJL4tVmiT60QHSRBx0FosOKYBXMQQzPhoZiw7Ge3ZbXS1HQcnmL8hSDCTOC6uRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvNlsJbZxNdr79WwK1QnKtNdRX1dTdG+KhMD4JSWp+4=;
 b=t/WKWywUwEmPzzdtpGQevGn5dKOuQkqR3Flb+YtjkJgjchPQMEGX0/UXakCEeRRICLO4FS3aXccTOCCIuKXPRoBGlOaRLGp+a8Ez6RNtn85lrFJDIlV6LEtwe1c79uoijXC/HjFwCB8c319lMS6dBh2pMDZ0PABnDySpKzrkUwvY+cTQ2Bm+efSzH5T49hiMULsURMrTRyQG3B6MCoXffwqjvLXIfoyTSTEfitI5XKhidwleElTa4UBqxybj9+SBfiacgndarKQ0ieAl4GSVlPkRrVGpyxn6PvdkuRrnXrbSDqtQk5oVo0+LKzqUBWZ+NgKjjCNWcOx+2Y6ioF6YRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvNlsJbZxNdr79WwK1QnKtNdRX1dTdG+KhMD4JSWp+4=;
 b=iUxrq27XHyZRZ8vHhjOeT8dM8Swj+WY+Z3qdiu4Dqg5kjqytP+0VNaCIMvaD8l1YJouOZ9O3QjedzaUkwVg3wcZX1DSuPtNFKsXE8CPWmTTZARa2EPSOLmN39rp99RXF+/dEBD6MkyhQUClK97AQn3w7m9lVjc8k+42ywp7dnr8=
Received: from CH0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:610:b3::22)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 09:33:48 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::29) by CH0PR03CA0047.outlook.office365.com
 (2603:10b6:610:b3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:33:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 09:33:47 +0000
Received: from ff1c6181612b.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 04:33:42 -0500
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
Subject: [PATCH v11 6/7] media: platform: amd: isp4 debug fs logging and more descriptive errors
Date: Wed, 6 May 2026 17:32:48 +0800
Message-ID: <20260506093250.93460-7-Bin.Du@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506093250.93460-1-Bin.Du@amd.com>
References: <20260506093250.93460-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: cba8514c-9fae-4469-a024-08deab5292f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DlC+owoT7S1G+KeOR86UiNGqY6bnT13D5lI1+dDpZmhSl4aZVTQLxK2SI59H1+yxcysk3J5anf9rhei/Bx7EVRFzWX1KUaTzV7GPc3377we/MgrK56Y77UTgbNvgINsWm+3W11OObgzWor3vdLQFXA1noz7RX9tvi7TCXkyswgNv+h5IvhOBVLHxHBXRTsf8HTk/qDlNLHmUIzs1XDL5BB0N9rCeiob06eMhf+87tqgfU6jWzvecOgcjGw0/FvDP91vrSM2u3KGHUc4p8oe1sTfmnQCKx4GJmjKlpNcQoPMzrzD/5l2opAMuULkVgqx8dpWKan6EbOqx6LPf4nRNmVZpMs4n3r7bntQyH00zwx2g/CH/D9g5UIFTZbB4c3W9kA2w9YQdWraZiBSmSID9BinPwRnwNxDamRq39v1SVJHhPnOqolgtp1MvgEBO/yYIHkg4su0uiAJPPr7rCblIgnlSZ9M/voYv0wi/1WotnajoI8BOZ7OcoUDflb+ifDmPgupD/bOvg/yVpfR2rOhFJyXJrjSB5kCqOZUd8JFTQaR1FeC7ZpmoOnG5SnziLcewYTLGcJPYPzyLmxN+Ej/joTfMg+elYyiLi368diSxeXIhyYw+NuFCyd/+ERSRJl39UIBDhTLgx0zqN8IJ1PmrPBOJv0vdTZnNAL8ER0FEY0IdXCbVMiBWwND1gWaqObLjBorHNMiJsDrJ+tAciC3oZzd/zUOfgvY1tN4jY9HmhLo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LVWSmPeOgrl2UbyO0Q8XZ0dxzn8aLDmkm6OnJUb1op6CPWEItMJKHlmSURZEkGNjL0m9aXlcKUTdOfDeDU1DpjFvp998TA9ahq/v0HY/B69TiGeVlzTOk0ib53fVp0dM8TzzRdJTc5nEM3cZwX95ulBqqmMN6GTutQ6s42ZRibsLWYRIN48taYnz/g3z6uDVFLQ+1NZLaNVkkhohXaGP2U7GZy4CP7+ZxgzSeNpT8l2mwg3BBHPZin9pQRnXMNswRIQppewAKpgXVinhyBme5VOh4pft0g+tkPnvnppYt6ZW4/ljN4654tlFecF+HpwbZrUGdGKiNpptZUgFKDXwgCePRjILHRsgn6eRbt+usHMm/ohhfEa2bJP2MXYgP66jrLsXcZjIo/FND5CYss/UEVUDhsvEcg9Tlg+sskKUrcHHYQKajC+r2mcOSKxCYPfK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:33:47.4142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cba8514c-9fae-4469-a024-08deab5292f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110
X-Rspamd-Queue-Id: 38F334D8ADD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60566-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cmd_ch_en.ch:url,kerneltoast.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid,cmd_ch_prop.ch:url];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Add debug fs for isp4 driver and add more detailed descriptive error info
to some of the log message

Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                                   |   2 +
 drivers/media/platform/amd/isp4/Makefile      |   3 +-
 drivers/media/platform/amd/isp4/isp4.c        |   4 +
 drivers/media/platform/amd/isp4/isp4_debug.c  | 271 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |  41 +++
 .../media/platform/amd/isp4/isp4_interface.c  |  25 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c |  29 +-
 drivers/media/platform/amd/isp4/isp4_subdev.h |   5 +
 8 files changed, 360 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a67dfb050df9..ec0a4d49f4d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1174,6 +1174,8 @@ F:	drivers/media/platform/amd/isp4/Kconfig
 F:	drivers/media/platform/amd/isp4/Makefile
 F:	drivers/media/platform/amd/isp4/isp4.c
 F:	drivers/media/platform/amd/isp4/isp4.h
+F:	drivers/media/platform/amd/isp4/isp4_debug.c
+F:	drivers/media/platform/amd/isp4/isp4_debug.h
 F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 F:	drivers/media/platform/amd/isp4/isp4_interface.c
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 3fa0ee6d8a96..3849062e17f3 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_VIDEO_AMD_ISP4_CAPTURE) += amd_isp4_capture.o
 amd_isp4_capture-objs := isp4.o \
+                         isp4_debug.o \
                          isp4_interface.o \
                          isp4_subdev.o \
-                         isp4_video.o
\ No newline at end of file
+                         isp4_video.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index 9480dfffbcb2..bf6b8e26c2c0 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-ioctl.h>
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_hw_reg.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
@@ -191,6 +192,7 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, isp_dev);
+	isp_debugfs_create(isp_dev);
 
 	return 0;
 
@@ -210,6 +212,8 @@ static void isp4_capture_remove(struct platform_device *pdev)
 	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	isp_debugfs_remove(isp_dev);
+
 	media_device_unregister(&isp_dev->mdev);
 	isp4sd_deinit(&isp_dev->isp_subdev);
 	pm_runtime_disable(dev);
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
new file mode 100644
index 000000000000..2fc00fc9a194
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_debug.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include "isp4.h"
+#include "isp4_debug.h"
+#include "isp4_hw_reg.h"
+#include "isp4_interface.h"
+
+#define ISP4DBG_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
+#define ISP4DBG_MACRO_2_STR(X) #X
+#define ISP4DBG_ONE_TIME_LOG_LEN 510
+
+#ifdef CONFIG_DEBUG_FS
+
+void isp_debugfs_create(struct isp4_device *isp_dev)
+{
+	isp_dev->isp_subdev.debugfs_dir = debugfs_create_dir("amd_isp4", NULL);
+	debugfs_create_bool("fw_log_enable", 0644,
+			    isp_dev->isp_subdev.debugfs_dir,
+			    &isp_dev->isp_subdev.enable_fw_log);
+	isp_dev->isp_subdev.fw_log_output =
+		devm_kzalloc(isp_dev->isp_subdev.dev,
+			     ISP4DBG_FW_LOG_RINGBUF_SIZE + 32,
+			     GFP_KERNEL);
+}
+
+void isp_debugfs_remove(struct isp4_device *isp_dev)
+{
+	debugfs_remove_recursive(isp_dev->isp_subdev.debugfs_dir);
+	isp_dev->isp_subdev.debugfs_dir = NULL;
+}
+
+static u32 isp_fw_fill_rb_log(struct isp4_subdev *isp, void *sys, u32 rb_size)
+{
+	struct isp4_interface *ispif = &isp->ispif;
+	char *buf = isp->fw_log_output;
+	struct device *dev = isp->dev;
+	u32 rd_ptr, wr_ptr;
+	u32 total_cnt = 0;
+	u32 offset = 0;
+	u32 cnt;
+
+	if (!sys || !rb_size)
+		return 0;
+
+	guard(mutex)(&ispif->isp4if_mutex);
+
+	rd_ptr = isp4hw_rreg(isp->mmio, ISP_LOG_RB_RPTR0);
+	wr_ptr = isp4hw_rreg(isp->mmio, ISP_LOG_RB_WPTR0);
+
+	do {
+		if (wr_ptr > rd_ptr)
+			cnt = wr_ptr - rd_ptr;
+		else if (wr_ptr < rd_ptr)
+			cnt = rb_size - rd_ptr;
+		else
+			goto quit;
+
+		if (cnt > rb_size) {
+			dev_err(dev, "fail bad fw log size %u\n", cnt);
+			goto quit;
+		}
+
+		memcpy(buf + offset, sys + rd_ptr, cnt);
+
+		offset += cnt;
+		total_cnt += cnt;
+		rd_ptr = (rd_ptr + cnt) % rb_size;
+	} while (rd_ptr < wr_ptr);
+
+	isp4hw_wreg(isp->mmio, ISP_LOG_RB_RPTR0, rd_ptr);
+
+quit:
+	return total_cnt;
+}
+
+void isp_fw_log_print(struct isp4_subdev *isp)
+{
+	struct isp4_interface *ispif = &isp->ispif;
+	char *fw_log_buf = isp->fw_log_output;
+	u32 cnt;
+
+	if (!isp->enable_fw_log || !fw_log_buf)
+		return;
+
+	cnt = isp_fw_fill_rb_log(isp, ispif->fw_log_buf->sys_addr,
+				 ispif->fw_log_buf->mem_size);
+
+	if (cnt) {
+		char temp_ch;
+		char *str;
+		char *end;
+		/* line end */
+		char *le;
+
+		str = (char *)fw_log_buf;
+		end = ((char *)fw_log_buf + cnt);
+		fw_log_buf[cnt] = 0;
+
+		while (str < end) {
+			le = strchr(str, 0x0A);
+			if ((le && str + ISP4DBG_ONE_TIME_LOG_LEN >= le) ||
+			    (!le && str + ISP4DBG_ONE_TIME_LOG_LEN >= end)) {
+				if (le)
+					*le = 0;
+
+				if (*str != '\0')
+					dev_dbg(isp->dev, "%s", str);
+
+				if (le) {
+					*le = 0x0A;
+					str = le + 1;
+				} else {
+					break;
+				}
+			} else {
+				u32 tmp_len = ISP4DBG_ONE_TIME_LOG_LEN;
+
+				temp_ch = str[tmp_len];
+				str[tmp_len] = 0;
+				dev_dbg(isp->dev, "%s", str);
+				str[tmp_len] = temp_ch;
+				str = &str[tmp_len];
+			}
+		}
+	}
+}
+#endif
+
+char *isp4dbg_get_buf_src_str(u32 src)
+{
+	switch (src) {
+	case ISP4FW_BUFFER_SOURCE_STREAM:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_SOURCE_STREAM);
+	default:
+		return "Unknown buf source";
+	}
+}
+
+char *isp4dbg_get_buf_done_str(u32 status)
+{
+	switch (status) {
+	case ISP4FW_BUFFER_STATUS_INVALID:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_INVALID);
+	case ISP4FW_BUFFER_STATUS_SKIPPED:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_SKIPPED);
+	case ISP4FW_BUFFER_STATUS_EXIST:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_EXIST);
+	case ISP4FW_BUFFER_STATUS_DONE:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_DONE);
+	case ISP4FW_BUFFER_STATUS_LACK:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_LACK);
+	case ISP4FW_BUFFER_STATUS_DIRTY:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_DIRTY);
+	case ISP4FW_BUFFER_STATUS_MAX:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_MAX);
+	default:
+		return "Unknown Buf Done Status";
+	}
+}
+
+char *isp4dbg_get_img_fmt_str(int fmt /* enum isp4fw_image_format * */)
+{
+	switch (fmt) {
+	case ISP4FW_IMAGE_FORMAT_NV12:
+		return "NV12";
+	case ISP4FW_IMAGE_FORMAT_YUV422INTERLEAVED:
+		return "YUV422INTERLEAVED";
+	default:
+		return "unknown fmt";
+	}
+}
+
+void isp4dbg_show_bufmeta_info(struct device *dev, char *pre,
+			       void *in, void *orig_buf)
+{
+	struct isp4fw_buffer_meta_info *p;
+	struct isp4if_img_buf_info *orig;
+
+	if (!in)
+		return;
+
+	if (!pre)
+		pre = "";
+
+	p = in;
+	orig = orig_buf;
+
+	dev_dbg(dev, "%s(%s) en:%d,stat:%s(%u),src:%s\n", pre,
+		isp4dbg_get_img_fmt_str(p->image_prop.image_format),
+		p->enabled, isp4dbg_get_buf_done_str(p->status), p->status,
+		isp4dbg_get_buf_src_str(p->source));
+
+	dev_dbg(dev, "%p,0x%llx(%u) %p,0x%llx(%u) %p,0x%llx(%u)\n",
+		orig->planes[0].sys_addr, orig->planes[0].mc_addr,
+		orig->planes[0].len, orig->planes[1].sys_addr,
+		orig->planes[1].mc_addr, orig->planes[1].len,
+		orig->planes[2].sys_addr, orig->planes[2].mc_addr,
+		orig->planes[2].len);
+}
+
+char *isp4dbg_get_buf_type(u32 type)
+{
+	/* enum isp4fw_buffer_type */
+	switch (type) {
+	case ISP4FW_BUFFER_TYPE_PREVIEW:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_TYPE_PREVIEW);
+	case ISP4FW_BUFFER_TYPE_META_INFO:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_TYPE_META_INFO);
+	case ISP4FW_BUFFER_TYPE_MEM_POOL:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_TYPE_MEM_POOL);
+	default:
+		return "unknown type";
+	}
+}
+
+char *isp4dbg_get_cmd_str(u32 cmd)
+{
+	switch (cmd) {
+	case ISP4FW_CMD_ID_START_STREAM:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_START_STREAM);
+	case ISP4FW_CMD_ID_STOP_STREAM:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_STOP_STREAM);
+	case ISP4FW_CMD_ID_SEND_BUFFER:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_SEND_BUFFER);
+	case ISP4FW_CMD_ID_SET_STREAM_CONFIG:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_SET_STREAM_CONFIG);
+	case ISP4FW_CMD_ID_SET_OUT_CHAN_PROP:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_SET_OUT_CHAN_PROP);
+	case ISP4FW_CMD_ID_ENABLE_OUT_CHAN:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_ENABLE_OUT_CHAN);
+	default:
+		return "unknown cmd";
+	}
+}
+
+char *isp4dbg_get_resp_str(u32 cmd)
+{
+	switch (cmd) {
+	case ISP4FW_RESP_ID_CMD_DONE:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_RESP_ID_CMD_DONE);
+	case ISP4FW_RESP_ID_NOTI_FRAME_DONE:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_RESP_ID_NOTI_FRAME_DONE);
+	default:
+		return "unknown respid";
+	}
+}
+
+char *isp4dbg_get_if_stream_str(u32 stream /* enum fw_cmd_resp_stream_id */)
+{
+	switch (stream) {
+	case ISP4IF_STREAM_ID_GLOBAL:
+		return "STREAM_GLOBAL";
+	case ISP4IF_STREAM_ID_1:
+		return "STREAM1";
+	default:
+		return "unknown streamID";
+	}
+}
+
+char *isp4dbg_get_out_ch_str(int ch /* enum isp4fw_pipe_out_ch */)
+{
+	switch ((enum isp4fw_pipe_out_ch)ch) {
+	case ISP4FW_ISP_PIPE_OUT_CH_PREVIEW:
+		return "prev";
+	default:
+		return "unknown channel";
+	}
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.h b/drivers/media/platform/amd/isp4/isp4_debug.h
new file mode 100644
index 000000000000..d1262e03ae64
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_debug.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_DEBUG_H_
+#define _ISP4_DEBUG_H_
+
+#include <linux/dev_printk.h>
+#include <linux/printk.h>
+
+#include "isp4_subdev.h"
+
+#ifdef CONFIG_DEBUG_FS
+struct isp4_device;
+
+void isp_debugfs_create(struct isp4_device *isp_dev);
+void isp_debugfs_remove(struct isp4_device *isp_dev);
+void isp_fw_log_print(struct isp4_subdev *isp);
+
+#else
+
+/* to avoid checkpatch warning */
+#define isp_debugfs_create(cam) ((void)(cam))
+#define isp_debugfs_remove(cam) ((void)(cam))
+#define isp_fw_log_print(isp) ((void)(isp))
+
+#endif /* CONFIG_DEBUG_FS */
+
+void isp4dbg_show_bufmeta_info(struct device *dev, char *pre, void *p,
+			       void *orig_buf /* struct sys_img_buf_handle */);
+char *isp4dbg_get_img_fmt_str(int fmt /* enum _image_format_t */);
+char *isp4dbg_get_out_ch_str(int ch /* enum _isp_pipe_out_ch_t */);
+char *isp4dbg_get_cmd_str(u32 cmd);
+char *isp4dbg_get_buf_type(u32 type);/* enum _buffer_type_t */
+char *isp4dbg_get_resp_str(u32 resp);
+char *isp4dbg_get_buf_src_str(u32 src);
+char *isp4dbg_get_buf_done_str(u32 status);
+char *isp4dbg_get_if_stream_str(u32 stream);
+
+#endif /* _ISP4_DEBUG_H_ */
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index fc9ad7d91a7e..15f14eddd683 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -5,6 +5,7 @@
 
 #include <linux/iopoll.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw_reg.h"
 #include "isp4_interface.h"
@@ -302,8 +303,9 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif,
 	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 	if (rd_ptr >= len || wr_ptr >= len) {
 		dev_err(dev,
-			"rb invalid: stream=%u, rd=%u, wr=%u, len=%u, cmd_sz=%u\n",
-			stream, rd_ptr, wr_ptr, len, cmd_sz);
+			"rb invalid: stream=%u(%s), rd=%u, wr=%u, len=%u, cmd_sz=%u\n",
+			stream, isp4dbg_get_if_stream_str(stream), rd_ptr,
+			wr_ptr, len, cmd_sz);
 		return -EINVAL;
 	}
 
@@ -394,8 +396,9 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
 						 rb_config->reg_wptr);
 
 			dev_err(dev,
-				"fail to get free cmdq slot, stream (%d),rd %u, wr %u\n",
-				stream, rd_ptr, wr_ptr);
+				"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
+				isp4dbg_get_if_stream_str(stream), stream,
+				rd_ptr, wr_ptr);
 			ret = -ETIMEDOUT;
 			goto free_ele;
 		}
@@ -421,8 +424,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
 		ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
 		if (ret) {
 			dev_err(dev,
-				"fail for insert_isp_fw_cmd cmd_id (0x%08x)\n",
-				cmd_id);
+				"fail for insert_isp_fw_cmd cmd_id %s(0x%08x)\n",
+				isp4dbg_get_cmd_str(cmd_id), cmd_id);
 			goto err_dequeue_ele;
 		}
 	}
@@ -692,8 +695,9 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 	if (checksum != resp->resp_check_sum) {
 		dev_err(dev, "resp checksum 0x%x,should 0x%x,rptr %u,wptr %u\n",
 			checksum, resp->resp_check_sum, rd_ptr, wr_ptr);
-		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n",
-			stream, resp->resp_seq_num,
+		dev_err(dev, "%s(%u), seqNo %u, resp_id %s(0x%x)\n",
+			isp4dbg_get_if_stream_str(stream), stream,
+			resp->resp_seq_num, isp4dbg_get_resp_str(resp->resp_id),
 			resp->resp_id);
 		return -EINVAL;
 	}
@@ -702,8 +706,9 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 
 err_rb_invalid:
 	dev_err(dev,
-		"rb invalid: stream=%u, rd=%u, wr=%u, len=%u, resp_sz=%u\n",
-		stream, rd_ptr, wr_ptr, len, resp_sz);
+		"rb invalid: stream=%u(%s), rd=%u, wr=%u, len=%u, resp_sz=%u\n",
+		stream, isp4dbg_get_if_stream_str(stream), rd_ptr, wr_ptr, len,
+		resp_sz);
 	return -EINVAL;
 }
 
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 5202232d50c5..48deea79ce6c 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -7,6 +7,7 @@
 #include <linux/units.h>
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_interface.h"
 
@@ -263,9 +264,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
-		cmd_ch_prop.ch,
-		cmd_ch_prop.image_prop.image_format,
+	dev_dbg(dev, "channel:%s,fmt %s,w:h=%u:%u,lp:%u,cp%u\n",
+		isp4dbg_get_out_ch_str(cmd_ch_prop.ch),
+		isp4dbg_get_img_fmt_str(cmd_ch_prop.image_prop.image_format),
 		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
 		cmd_ch_prop.image_prop.luma_pitch,
 		cmd_ch_prop.image_prop.chroma_pitch);
@@ -294,7 +295,8 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return ret;
 	}
 
-	dev_dbg(dev, "enable channel %d\n", cmd_ch_en.ch);
+	dev_dbg(dev, "enable channel %s\n",
+		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
 
 	if (!sensor_info->start_stream_cmd_sent) {
 		ret = isp4sd_kickoff_stream(isp_subdev,
@@ -381,8 +383,9 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
 	struct device *dev = isp_subdev->dev;
 
-	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+	dev_dbg(dev, "stream %d,cmd %s(0x%08x)(%d),seq %u, ele %p\n",
 		stream_id,
+		isp4dbg_get_cmd_str(para->cmd_id),
 		para->cmd_id, para->cmd_status, para->cmd_seq_num,
 		ele);
 
@@ -458,8 +461,9 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 		return;
 	}
 
-	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,status:%i\n",
+	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,status:%s(%i)\n",
 		ktime_get_ns(), stream_id, meta->poc, meta->preview.enabled,
+		isp4dbg_get_buf_done_str(meta->preview.status),
 		meta->preview.status);
 
 	if (meta->preview.enabled &&
@@ -468,6 +472,8 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 	     meta->preview.status == ISP4FW_BUFFER_STATUS_DIRTY)) {
 		prev = isp4if_dequeue_buffer(ispif);
 		if (prev) {
+			isp4dbg_show_bufmeta_info(dev, "prev", &meta->preview,
+						  &prev->buf_info);
 			isp4vid_handle_frame_done(&isp_subdev->isp_vdev,
 						  &prev->buf_info);
 			isp4if_dealloc_buffer_node(prev);
@@ -475,8 +481,9 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 			dev_err(dev, "fail null prev buf\n");
 		}
 	} else if (meta->preview.enabled) {
-		dev_err(dev, "fail bad preview status %u\n",
-			meta->preview.status);
+		dev_err(dev, "fail bad preview status %u(%s)\n",
+			meta->preview.status,
+			isp4dbg_get_buf_done_str(meta->preview.status));
 	}
 
 	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
@@ -493,6 +500,9 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 	struct device *dev = isp_subdev->dev;
 	struct isp4fw_resp resp;
 
+	if (stream_id == ISP4IF_STREAM_ID_1)
+		isp_fw_log_print(isp_subdev);
+
 	while (true) {
 		if (isp4if_f2h_resp(ispif, stream_id, &resp)) {
 			/* Re-enable the interrupt */
@@ -522,7 +532,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 						  &resp.param.frame_done);
 			break;
 		default:
-			dev_err(dev, "-><- fail respid (0x%x)\n",
+			dev_err(dev, "-><- fail respid %s(0x%x)\n",
+				isp4dbg_get_resp_str(resp.resp_id),
 				resp.resp_id);
 			break;
 		}
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
index ddf6bdf4a62a..20ea08a830af 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.h
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -109,6 +109,11 @@ struct isp4_subdev {
 	bool irq_enabled;
 	/* spin lock to access ISP_SYS_INT0_EN exclusively */
 	spinlock_t irq_lock;
+#ifdef CONFIG_DEBUG_FS
+	bool enable_fw_log;
+	struct dentry *debugfs_dir;
+	char *fw_log_output;
+#endif
 };
 
 int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
-- 
2.54.0


