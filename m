Return-Path: <linux-media+bounces-56489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAkEJ7AJvWkO5gIAu9opvQ
	(envelope-from <linux-media+bounces-56489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:47:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA842D770F
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 09:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 087E131B4E48
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 08:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9348C37474C;
	Fri, 20 Mar 2026 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qbJ8Mv0t"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9B37417F;
	Fri, 20 Mar 2026 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996164; cv=fail; b=YRNsGIBW1YP1E4kvD9zLAXmNmtBV7v9w0QjPlRKbBkEdnlmbFOagNRrAIhSyXWG555vPH2Wn5nK8gecj63qLlb9DHIos3hALNdA8Vz3fQyTx37H5HlEOP8WcXBGg+m4kSQZhqC7x0FZdL/2RhnDcsD3dRoh63Xaw+aob0axMOE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996164; c=relaxed/simple;
	bh=gXoK8tUjwTgK7mLybTBPT+L9rcBaI7jCvsmCh2tm/58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbPj4YaadWU0yeGx6XLmBSvUySsBY9z30WNFHaILfbt5vM+V3sC6hrXnkPHks6eqA4As8y3B9OQidR90hWLugp5McsXdj1MhF3kwZAwAmBalLFb21/Cu0uowS2v2M7cP9gZlFrav7mu0SHIqNE01s3w7YYh76o7T3WDYY0O6CHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qbJ8Mv0t; arc=fail smtp.client-ip=40.93.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKXeS8A9krC6PHIFtXZL/B1tpmlW3E2rP4eECzodGHBeQVLQCyZFBmtsRTz9OkpXv2x7tBb1cZf9zlDHNU+ChsY1h15eyqiSMxcWzPjuOcd0QT3fKF1j/IB8I8A5W2v07AobVevbSjB8i99Ih5LBo1XIO8bGWWWHmiKyJLkYirXVgvjCn4+dv6tYJIu94d0jzSE60XIZmVklH2qXtRfh7RATNwmuOeOT51wdbgy1m9HvUoI2LcgSGbpLev9UDIpGCW+Gd3CUJUwaHq8enpJUmDkwhmKbY3Wf6bnMd9vUwMyeuJEa1xSld9muFbQ+ePPPMlB7doa3pgcIED6KD1N/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97lh/reIcj5A+PYfcq96+bwujoikhgg5ifO1wfVzu6Y=;
 b=OSrFI2RruV4ixFwTOQ5o51oeS+U+mr3GwfrXljEQX/PBfy8WqLsBDCyaG1Nq4tgQIN0MgJ2ayjk6bIEWthJLHe+yE9e+4oj6IZu+H4O9h7gmodvHU85D+uiPQenBisrvXEYsQeQuyvWDk7aDBWpevXQ7smTiCTYQkhqSlIouAEubyL5cYmKyZXIYzZNNkH9G7cvAmkOm+Ev1zEoXzecnahKFvYLnXAvHcf1NgFW3qJqKLPz1InRSVq2IlFTyq0WpsAXCL/HKLwCR3E72RfeTO/PbnHs7CgW5ItTA6qt6V01DHjPcjNGrJYr8dU6AYRI/oAlK9HE/0Lb51BNGRywc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97lh/reIcj5A+PYfcq96+bwujoikhgg5ifO1wfVzu6Y=;
 b=qbJ8Mv0tJG2It0muvSaE2j85fKxSVkFhHW/JF++Foy2PsvzdWpHilAKdTM2lGWfJLLwoujNj/F+Y5M+PMWp9+E6QkgtR5Pq+iBuNtPglN2uDt2nFsH4c6ZQZVxtB7CLtN6EeADYXHHTy4z6cZxWXjr7Wg4DHQlOkyUNL4Rin/fU=
Received: from BY5PR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:1d0::26)
 by SJ5PPFCB5E1B8F5.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Fri, 20 Mar
 2026 08:42:35 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::8f) by BY5PR04CA0016.outlook.office365.com
 (2603:10b6:a03:1d0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Fri,
 20 Mar 2026 08:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 08:42:35 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 03:42:29 -0500
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
Subject: [PATCH v10 5/7] media: platform: amd: isp4 video node and buffers handling added
Date: Fri, 20 Mar 2026 16:41:44 +0800
Message-ID: <20260320084146.200988-6-Bin.Du@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320084146.200988-1-Bin.Du@amd.com>
References: <20260320084146.200988-1-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|SJ5PPFCB5E1B8F5:EE_
X-MS-Office365-Filtering-Correlation-Id: b47fd69c-3c31-4ebc-f9c2-08de865ca249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	qnKlWRta2UXUoGFFHMWA8/bcbX1Ul0FUcmlbSspgRBEWNB8FFjRF54ZIrdU41w795Z7cWSbjaWbucf96ZAu0/X6gvfZMjOAXJ/RJJW2gc1sFwhGFhMrMUTssqr+rBd7D4qUyek/NPSRtpNBrE1nPyloT3UFGKSmlBH/EeyU2xvhntoy1RCz1ym+XYbnx3Jy4T3G8xO1W+iHrlfWHaXWo0vaz5RIkC9EuVnnjCLdZ403EHxOGw5edx3JjHz+6NRU0hlOEs+l2x8pi8QbHzXRM3Wq5FkTHu08nTrLKngtzVlOzYMeVm7axokW/2oTuh0vKATSQ7w2ygWb035iK3MgoHkH+rWF2nT4N665NseFzmmWnAsVtJVVjS0qwArQ7JJHSYQUMfB2xpZjm/SxPOAwwiLF1iHSAiO3/NDL+RtRE/NQ+ahkJ3dirawX4Sc7MJNS6O4rJHIvizS0RMOc2STOWXcjnRAsEPeWkEz4/N5erw6TBso9unpunVSFOv7BTtdOvy5Y+689q2hjxFqA2PDrYVNmnJq0MQ44yuI9UfsqSzjlJA+rgdI35nXzhq9g6Z8zxdydOWWMaZdYEf9IdA5pcRzab7IltUWGvREj5IaCHPrncygzbF0G6wjNYTiDl0bsex7AkACvYQG6Pj0PsxoZiGAYpTicTf1xWZ/YC8v9Orbv5SsBIP5zwx8SwN9F8/2g9Y4KsDHOAzSt88BoVN4M4OhNeV7NYSZN8mww43zsDBIE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ynsOTrwnHBazuvKs6StuO4vvciolVjn5vO8Ohop7wFch+x0qasuQHTsWglG3X5DHv8PlF+Fvxcq2rcIq37+O9G0NvLEwfb7PtFMHUoxCb5ODOrsQ246ZXxBHinNEPHOnGPPaajBPWHk84/WpcnhbVK12r6mWMPtGSnCsCVvR8MnRo0q39UZkl6Lg6F3nHa+1kzmuGQJVr9vproYvTdSuo0/5E8q5y9Jtjz0wlvrU3zfPX/ULb1VQOt4MEHg9DlQhaNXl6dtm4pnFkgKD9XD1rElpKs6DUxj5AtryERQ4E3lL3FXGEgBO3I12NpViPc6qHXtzyuW96Ics/Ha5iYKQtj+6Ielc4ZEJtFeArPEwjXqlfY0p6TqNqujDQNJtkXtk89GvSJYQDL/z/30LDBpsVeCFPit7cD+wRIeRz0KN6xx5TUdVv34F8d06CmQmn2d9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 08:42:35.0238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b47fd69c-3c31-4ebc-f9c2-08de865ca249
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCB5E1B8F5
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56489-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.899];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CA842D770F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Isp video implements v4l2 video interface and supports NV12 and YUYV. It
manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
buffer related fix from branch v6.16-drm-tip-isp4-for-amd on
https://github.com/kerneltoast/kernel_x86_laptop.git

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
 drivers/media/platform/amd/isp4/isp4.c        |  11 +
 drivers/media/platform/amd/isp4/isp4_subdev.c |  13 +-
 drivers/media/platform/amd/isp4/isp4_subdev.h |   2 +
 drivers/media/platform/amd/isp4/isp4_video.c  | 797 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |  57 ++
 7 files changed, 881 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dfc9f894764..a67dfb050df9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1180,6 +1180,8 @@ F:	drivers/media/platform/amd/isp4/isp4_interface.c
 F:	drivers/media/platform/amd/isp4/isp4_interface.h
 F:	drivers/media/platform/amd/isp4/isp4_subdev.c
 F:	drivers/media/platform/amd/isp4/isp4_subdev.h
+F:	drivers/media/platform/amd/isp4/isp4_video.c
+F:	drivers/media/platform/amd/isp4/isp4_video.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 7e4854b6a4cd..3fa0ee6d8a96 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -5,4 +5,5 @@
 obj-$(CONFIG_VIDEO_AMD_ISP4_CAPTURE) += amd_isp4_capture.o
 amd_isp4_capture-objs := isp4.o \
                          isp4_interface.o \
-                         isp4_subdev.o
+                         isp4_subdev.o \
+                         isp4_video.o
\ No newline at end of file
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index e62f5d652d81..9480dfffbcb2 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -173,6 +173,17 @@ static int isp4_capture_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	ret = media_create_pad_link(&isp_dev->isp_subdev.sdev.entity,
+				    0,
+				    &isp_dev->isp_subdev.isp_vdev.vdev.entity,
+				    0,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err_probe(dev, ret, "fail to create pad link\n");
+		goto err_isp4_deinit;
+	}
+
 	ret = media_device_register(&isp_dev->mdev);
 	if (ret) {
 		dev_err_probe(dev, ret, "fail to register media device\n");
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 6d571b7f8840..5202232d50c5 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -467,11 +467,13 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 	     meta->preview.status == ISP4FW_BUFFER_STATUS_DONE ||
 	     meta->preview.status == ISP4FW_BUFFER_STATUS_DIRTY)) {
 		prev = isp4if_dequeue_buffer(ispif);
-		if (prev)
+		if (prev) {
+			isp4vid_handle_frame_done(&isp_subdev->isp_vdev,
+						  &prev->buf_info);
 			isp4if_dealloc_buffer_node(prev);
-		else
+		} else {
 			dev_err(dev, "fail null prev buf\n");
-
+		}
 	} else if (meta->preview.enabled) {
 		dev_err(dev, "fail bad preview status %u\n",
 			meta->preview.status);
@@ -1006,6 +1008,10 @@ int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
 	isp_subdev->host2fw_seq_num = 1;
 	ispif->status = ISP4IF_STATUS_PWR_OFF;
 
+	ret = isp4vid_dev_init(&isp_subdev->isp_vdev, &isp_subdev->sdev);
+	if (ret)
+		goto err_subdev_unreg;
+
 	return 0;
 
 err_subdev_unreg:
@@ -1020,6 +1026,7 @@ void isp4sd_deinit(struct isp4_subdev *isp_subdev)
 {
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 
+	isp4vid_dev_deinit(&isp_subdev->isp_vdev);
 	v4l2_device_unregister_subdev(&isp_subdev->sdev);
 	media_entity_cleanup(&isp_subdev->sdev.entity);
 	isp4if_deinit(ispif);
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
index ceade9fec5d9..ddf6bdf4a62a 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.h
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -17,6 +17,7 @@
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw_reg.h"
 #include "isp4_interface.h"
+#include "isp4_video.h"
 
 /*
  * One is for none sensor specific response which is not used now.
@@ -83,6 +84,7 @@ struct isp4_subdev_thread_param {
 struct isp4_subdev {
 	struct v4l2_subdev sdev;
 	struct isp4_interface ispif;
+	struct isp4vid_dev isp_vdev;
 
 	struct media_pad sdev_pad;
 
diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
new file mode 100644
index 000000000000..0cebb39f98e1
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -0,0 +1,797 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "isp4_interface.h"
+#include "isp4_subdev.h"
+#include "isp4_video.h"
+
+#define ISP4VID_ISP_DRV_NAME "amd_isp_capture"
+#define ISP4VID_MAX_PREVIEW_FPS 30
+#define ISP4VID_DEFAULT_FMT V4L2_PIX_FMT_NV12
+
+#define ISP4VID_PAD_VIDEO_OUTPUT 0
+
+/* time perframe default */
+#define ISP4VID_ISP_TPF_DEFAULT isp4vid_tpfs[0]
+
+static const char *const isp4vid_video_dev_name = "Preview";
+
+/* Sizes must be in increasing order */
+static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
+	{640, 360},
+	{640, 480},
+	{1280, 720},
+	{1280, 960},
+	{1920, 1080},
+	{1920, 1440},
+	{2560, 1440},
+	{2880, 1620},
+	{2880, 1624},
+	{2888, 1808},
+};
+
+static const u32 isp4vid_formats[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_YUYV
+};
+
+/* time perframe list */
+static const struct v4l2_fract isp4vid_tpfs[] = {
+	{ 1, ISP4VID_MAX_PREVIEW_FPS }
+};
+
+void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
+			       const struct isp4if_img_buf_info *img_buf)
+{
+	struct isp4vid_capture_buffer *isp4vid_buf;
+	void *vbuf;
+
+	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
+		isp4vid_buf = list_first_entry_or_null(&isp_vdev->buf_list,
+						       typeof(*isp4vid_buf),
+						       list);
+		if (!isp4vid_buf)
+			return;
+
+		vbuf = vb2_plane_vaddr(&isp4vid_buf->vb2.vb2_buf, 0);
+
+		if (vbuf != img_buf->planes[0].sys_addr) {
+			dev_err(isp_vdev->dev, "Invalid vbuf\n");
+			return;
+		}
+
+		list_del(&isp4vid_buf->list);
+	}
+
+	/* Fill the buffer */
+	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
+	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
+	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
+
+	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
+			      0, isp_vdev->format.sizeimage);
+
+	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
+
+	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(size=%u)\n",
+		isp_vdev->format.sizeimage);
+}
+
+static const struct v4l2_pix_format isp4vid_fmt_default = {
+	.width = 1920,
+	.height = 1080,
+	.pixelformat = ISP4VID_DEFAULT_FMT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+};
+
+static void isp4vid_capture_return_all_buffers(struct isp4vid_dev *isp_vdev,
+					       enum vb2_buffer_state state)
+{
+	struct isp4vid_capture_buffer *vbuf, *node;
+
+	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
+		list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list)
+			vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
+		INIT_LIST_HEAD(&isp_vdev->buf_list);
+	}
+
+	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(%d)\n", state);
+}
+
+static int isp4vid_vdev_link_validate(struct media_link *link)
+{
+	return 0;
+}
+
+static const struct media_entity_operations isp4vid_vdev_ent_ops = {
+	.link_validate = isp4vid_vdev_link_validate,
+};
+
+static const struct v4l2_file_operations isp4vid_vdev_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.read = vb2_fop_read,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+static int isp4vid_ioctl_querycap(struct file *file, void *fh,
+				  struct v4l2_capability *cap)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
+	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
+	cap->capabilities |= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
+
+	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X\n", isp_vdev->vdev.name,
+		cap->capabilities);
+
+	return 0;
+}
+
+static int isp4vid_g_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	f->fmt.pix = isp_vdev->format;
+
+	return 0;
+}
+
+static int isp4vid_fill_buffer_size(struct v4l2_pix_format *fmt)
+{
+	int ret = 0;
+
+	switch (fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		fmt->bytesperline = fmt->width;
+		fmt->sizeimage = fmt->bytesperline * fmt->height * 3 / 2;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		fmt->bytesperline = fmt->width * 2;
+		fmt->sizeimage = fmt->bytesperline * fmt->height;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int isp4vid_try_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	struct v4l2_pix_format *format = &f->fmt.pix;
+	const struct v4l2_frmsize_discrete *fsz;
+	size_t i;
+
+	/*
+	 * Check if the hardware supports the requested format, use the default
+	 * format otherwise.
+	 */
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
+		if (isp4vid_formats[i] == format->pixelformat)
+			break;
+
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		format->pixelformat = ISP4VID_DEFAULT_FMT;
+
+	switch (format->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_YUYV:
+		fsz = v4l2_find_nearest_size(isp4vid_frmsize,
+					     ARRAY_SIZE(isp4vid_frmsize),
+					     width, height, format->width,
+					     format->height);
+		format->width = fsz->width;
+		format->height = fsz->height;
+		break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
+			isp_vdev->vdev.name,
+			format->pixelformat);
+		return -EINVAL;
+	}
+
+	/*
+	 * There is no need to check the return value, as failure will never
+	 * happen here
+	 */
+	isp4vid_fill_buffer_size(format);
+
+	if (format->field == V4L2_FIELD_ANY)
+		format->field = isp4vid_fmt_default.field;
+
+	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
+		format->colorspace = isp4vid_fmt_default.colorspace;
+
+	return 0;
+}
+
+static int isp4vid_set_fmt_2_isp(struct v4l2_subdev *sdev,
+				 struct v4l2_pix_format *pix_fmt)
+{
+	struct v4l2_subdev_format fmt = {};
+
+	switch (pix_fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1_5X8;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		fmt.format.code = MEDIA_BUS_FMT_YUYV8_1X16;
+		break;
+	default:
+		return -EINVAL;
+	}
+	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.pad = ISP4VID_PAD_VIDEO_OUTPUT;
+	fmt.format.width = pix_fmt->width;
+	fmt.format.height = pix_fmt->height;
+	return v4l2_subdev_call(sdev, pad, set_fmt, NULL, &fmt);
+}
+
+static int isp4vid_s_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	int ret;
+
+	/* Do not change the format while stream is on */
+	if (vb2_is_busy(&isp_vdev->vbq))
+		return -EBUSY;
+
+	ret = isp4vid_try_fmt_vid_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	dev_dbg(isp_vdev->dev, "%s|width height:%ux%u->%ux%u\n",
+		isp_vdev->vdev.name,
+		isp_vdev->format.width, isp_vdev->format.height,
+		f->fmt.pix.width, f->fmt.pix.height);
+	dev_dbg(isp_vdev->dev, "%s|pixelformat:0x%x-0x%x\n",
+		isp_vdev->vdev.name, isp_vdev->format.pixelformat,
+		f->fmt.pix.pixelformat);
+	dev_dbg(isp_vdev->dev, "%s|bytesperline:%u->%u\n",
+		isp_vdev->vdev.name, isp_vdev->format.bytesperline,
+		f->fmt.pix.bytesperline);
+	dev_dbg(isp_vdev->dev, "%s|sizeimage:%u->%u\n",
+		isp_vdev->vdev.name, isp_vdev->format.sizeimage,
+		f->fmt.pix.sizeimage);
+
+	isp_vdev->format = f->fmt.pix;
+	ret = isp4vid_set_fmt_2_isp(isp_vdev->isp_sdev, &isp_vdev->format);
+
+	return ret;
+}
+
+static int isp4vid_enum_fmt_vid_cap(struct file *file, void *priv,
+				    struct v4l2_fmtdesc *f)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	switch (f->index) {
+	case 0:
+		f->pixelformat = V4L2_PIX_FMT_NV12;
+		break;
+	case 1:
+		f->pixelformat = V4L2_PIX_FMT_YUYV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(isp_vdev->dev, "%s|index=%d, pixelformat=0x%X\n",
+		isp_vdev->vdev.name, f->index, f->pixelformat);
+
+	return 0;
+}
+
+static int isp4vid_enum_framesizes(struct file *file, void *fh,
+				   struct v4l2_frmsizeenum *fsize)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++) {
+		if (isp4vid_formats[i] == fsize->pixel_format)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		return -EINVAL;
+
+	if (fsize->index < ARRAY_SIZE(isp4vid_frmsize)) {
+		fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+		fsize->discrete = isp4vid_frmsize[fsize->index];
+		dev_dbg(isp_vdev->dev, "%s|size[%d]=%dx%d\n",
+			isp_vdev->vdev.name, fsize->index,
+			fsize->discrete.width, fsize->discrete.height);
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int isp4vid_ioctl_enum_frameintervals(struct file *file, void *priv,
+					     struct v4l2_frmivalenum *fival)
+{
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+	size_t i;
+
+	if (fival->index >= ARRAY_SIZE(isp4vid_tpfs))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
+		if (isp4vid_formats[i] == fival->pixel_format)
+			break;
+
+	if (i == ARRAY_SIZE(isp4vid_formats))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(isp4vid_frmsize); i++)
+		if (isp4vid_frmsize[i].width == fival->width &&
+		    isp4vid_frmsize[i].height == fival->height)
+			break;
+
+	if (i == ARRAY_SIZE(isp4vid_frmsize))
+		return -EINVAL;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fival->discrete = isp4vid_tpfs[fival->index];
+	v4l2_simplify_fraction(&fival->discrete.numerator,
+			       &fival->discrete.denominator, 8, 333);
+
+	dev_dbg(isp_vdev->dev, "%s|interval[%d]=%d/%d\n",
+		isp_vdev->vdev.name, fival->index,
+		fival->discrete.numerator,
+		fival->discrete.denominator);
+
+	return 0;
+}
+
+static int isp4vid_ioctl_g_param(struct file *file, void *priv,
+				 struct v4l2_streamparm *param)
+{
+	struct v4l2_captureparm *capture = &param->parm.capture;
+	struct isp4vid_dev *isp_vdev = video_drvdata(file);
+
+	if (param->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	capture->capability   = V4L2_CAP_TIMEPERFRAME;
+	capture->timeperframe = isp_vdev->timeperframe;
+	capture->readbuffers  = 0;
+
+	dev_dbg(isp_vdev->dev, "%s|timeperframe=%d/%d\n", isp_vdev->vdev.name,
+		capture->timeperframe.numerator,
+		capture->timeperframe.denominator);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops isp4vid_vdev_ioctl_ops = {
+	.vidioc_querycap            = isp4vid_ioctl_querycap,
+	.vidioc_enum_fmt_vid_cap    = isp4vid_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap       = isp4vid_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap       = isp4vid_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap     = isp4vid_try_fmt_vid_cap,
+	.vidioc_reqbufs             = vb2_ioctl_reqbufs,
+	.vidioc_querybuf            = vb2_ioctl_querybuf,
+	.vidioc_qbuf                = vb2_ioctl_qbuf,
+	.vidioc_expbuf              = vb2_ioctl_expbuf,
+	.vidioc_dqbuf               = vb2_ioctl_dqbuf,
+	.vidioc_create_bufs         = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf         = vb2_ioctl_prepare_buf,
+	.vidioc_streamon            = vb2_ioctl_streamon,
+	.vidioc_streamoff           = vb2_ioctl_streamoff,
+	.vidioc_g_parm              = isp4vid_ioctl_g_param,
+	.vidioc_s_parm              = isp4vid_ioctl_g_param,
+	.vidioc_enum_framesizes     = isp4vid_enum_framesizes,
+	.vidioc_enum_frameintervals = isp4vid_ioctl_enum_frameintervals,
+};
+
+static unsigned int isp4vid_get_image_size(struct v4l2_pix_format *fmt)
+{
+	switch (fmt->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+		return fmt->width * fmt->height * 3 / 2;
+	case V4L2_PIX_FMT_YUYV:
+		return fmt->width * fmt->height * 2;
+	default:
+		return 0;
+	}
+}
+
+static int isp4vid_qops_queue_setup(struct vb2_queue *vq,
+				    unsigned int *nbuffers,
+				    unsigned int *nplanes, unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
+
+	if (*nplanes > 1) {
+		dev_err(isp_vdev->dev,
+			"fail to setup queue, no mplane supported %u\n",
+			*nplanes);
+		return -EINVAL;
+	}
+
+	if (*nplanes == 1) {
+		unsigned int size;
+
+		size = isp4vid_get_image_size(&isp_vdev->format);
+		if (sizes[0] < size) {
+			dev_err(isp_vdev->dev,
+				"fail for small plane size %u, %u expected\n",
+				sizes[0], size);
+			return -EINVAL;
+		}
+	}
+
+	if (q_num_bufs + *nbuffers < ISP4IF_MAX_STREAM_BUF_COUNT)
+		*nbuffers = ISP4IF_MAX_STREAM_BUF_COUNT - q_num_bufs;
+
+	switch (isp_vdev->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_YUYV: {
+		*nplanes = 1;
+		sizes[0] = max(sizes[0], isp_vdev->format.sizeimage);
+		isp_vdev->format.sizeimage = sizes[0];
+	}
+	break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
+			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
+		return -EINVAL;
+	}
+
+	dev_dbg(isp_vdev->dev, "%s|*nbuffers=%u *nplanes=%u sizes[0]=%u\n",
+		isp_vdev->vdev.name,
+		*nbuffers, *nplanes, sizes[0]);
+
+	return 0;
+}
+
+static void isp4vid_qops_buffer_queue(struct vb2_buffer *vb)
+{
+	struct isp4vid_capture_buffer *buf =
+		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
+	struct isp4if_img_buf_info *img_buf = &buf->img_buf;
+	void *vaddr = vb2_plane_vaddr(vb, 0);
+
+	dev_dbg(isp_vdev->dev, "queue buf, vaddr %p, gpuva 0x%llx, size %u\n",
+		vaddr, buf->gpu_addr, vb->planes[0].length);
+
+	switch (isp_vdev->format.pixelformat) {
+	case V4L2_PIX_FMT_NV12: {
+		u32 y_size = isp_vdev->format.sizeimage / 3 * 2;
+		u32 uv_size = isp_vdev->format.sizeimage / 3;
+
+		img_buf->planes[0].len = y_size;
+		img_buf->planes[0].sys_addr = vaddr;
+		img_buf->planes[0].mc_addr = buf->gpu_addr;
+
+		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u\n",
+			img_buf->planes[0].mc_addr,
+			img_buf->planes[0].len);
+
+		img_buf->planes[1].len = uv_size;
+		img_buf->planes[1].sys_addr = vaddr + y_size;
+		img_buf->planes[1].mc_addr = buf->gpu_addr + y_size;
+
+		dev_dbg(isp_vdev->dev, "img_buf[1]: mc=0x%llx size=%u\n",
+			img_buf->planes[1].mc_addr,
+			img_buf->planes[1].len);
+
+		img_buf->planes[2].len = 0;
+	}
+	break;
+	case V4L2_PIX_FMT_YUYV: {
+		img_buf->planes[0].len = isp_vdev->format.sizeimage;
+		img_buf->planes[0].sys_addr = vaddr;
+		img_buf->planes[0].mc_addr = buf->gpu_addr;
+
+		dev_dbg(isp_vdev->dev, "img_buf[0]: mc=0x%llx size=%u\n",
+			img_buf->planes[0].mc_addr,
+			img_buf->planes[0].len);
+
+		img_buf->planes[1].len = 0;
+		img_buf->planes[2].len = 0;
+	}
+	break;
+	default:
+		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u\n",
+			isp_vdev->vdev.name, isp_vdev->format.pixelformat);
+		return;
+	}
+
+	if (isp_vdev->stream_started)
+		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev, img_buf);
+
+	scoped_guard(mutex, &isp_vdev->buf_list_lock)
+		list_add_tail(&buf->list, &isp_vdev->buf_list);
+}
+
+static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
+					unsigned int count)
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	struct isp4vid_capture_buffer *isp4vid_buf;
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret = 0;
+
+	isp_vdev->sequence = 0;
+
+	ret = isp4sd_pwron_and_init(isp_vdev->isp_sdev);
+	if (ret) {
+		dev_err(isp_vdev->dev, "power up isp fail %d\n", ret);
+		goto release_buffers;
+	}
+
+	entity = &isp_vdev->vdev.entity;
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
+		if (ret < 0 && ret != -ENOIOCTLCMD) {
+			dev_dbg(isp_vdev->dev, "fail start streaming: %s %d\n",
+				subdev->name, ret);
+			goto release_buffers;
+		}
+	}
+
+	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
+		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
+					&isp4vid_buf->img_buf);
+
+	isp_vdev->stream_started = true;
+
+	return 0;
+
+release_buffers:
+	isp4vid_capture_return_all_buffers(isp_vdev, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void isp4vid_qops_stop_streaming(struct vb2_queue *vq)
+{
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vq);
+	struct media_entity *entity;
+	struct v4l2_subdev *subdev;
+	struct media_pad *pad;
+	int ret;
+
+	entity = &isp_vdev->vdev.entity;
+	while (1) {
+		pad = &entity->pads[0];
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			break;
+
+		pad = media_pad_remote_pad_first(pad);
+		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
+			break;
+
+		entity = pad->entity;
+		subdev = media_entity_to_v4l2_subdev(entity);
+
+		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
+
+		if (ret < 0 && ret != -ENOIOCTLCMD)
+			dev_dbg(isp_vdev->dev, "fail stop streaming: %s %d\n",
+				subdev->name, ret);
+	}
+
+	isp_vdev->stream_started = false;
+	isp4sd_pwroff_and_deinit(isp_vdev->isp_sdev);
+
+	/* Release all active buffers */
+	isp4vid_capture_return_all_buffers(isp_vdev, VB2_BUF_STATE_ERROR);
+}
+
+static int isp4vid_qops_buf_init(struct vb2_buffer *vb)
+{
+	struct isp4vid_capture_buffer *buf =
+		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
+	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
+	void *mem_priv = vb->planes[0].mem_priv;
+	struct device *dev = isp_vdev->dev;
+	u64 gpu_addr;
+	void *bo;
+	int ret;
+
+	if (vb->planes[0].dbuf) {
+		buf->dbuf = vb->planes[0].dbuf;
+	} else {
+		/*
+		 * HAS_DMA is a Kconfig dependency so CONFIG_HAS_DMA is always
+		 * defined when this driver is compiled. The #else branch is
+		 * kept as a safeguard in case the dependency is ever removed.
+		 */
+#ifdef CONFIG_HAS_DMA
+		buf->dbuf = vb2_vmalloc_memops.get_dmabuf(vb, mem_priv, 0);
+		if (IS_ERR_OR_NULL(buf->dbuf)) {
+			dev_err(dev, "fail to get dma buf\n");
+			return -EINVAL;
+		}
+#else
+		dev_err(dev, "get dmabuf fail -- CONFIG_HAS_DMA not defined\n");
+		buf->dbuf = NULL;
+		return -EINVAL;
+#endif
+	}
+
+	/* create isp user BO and obtain gpu_addr */
+	ret = isp_user_buffer_alloc(dev, buf->dbuf, &bo, &gpu_addr);
+	if (ret) {
+		dev_err(dev, "fail to create isp user BO\n");
+		if (!vb->planes[0].dbuf) {
+			dma_buf_put(buf->dbuf);
+			buf->dbuf = NULL;
+		}
+
+		return ret;
+	}
+
+	buf->bo = bo;
+	buf->gpu_addr = gpu_addr;
+	return 0;
+}
+
+static void isp4vid_qops_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct isp4vid_capture_buffer *buf =
+		container_of(vb, struct isp4vid_capture_buffer, vb2.vb2_buf);
+
+	if (buf->bo) {
+		isp_user_buffer_free(buf->bo);
+		buf->bo = NULL;
+	}
+
+	/*
+	 * Only put dmabufs we obtained ourselves via get_dmabuf, not ones
+	 * provided by the framework for DMABUF import
+	 */
+	if (buf->dbuf && buf->dbuf != vb->planes[0].dbuf)
+		dma_buf_put(buf->dbuf);
+
+	buf->dbuf = NULL;
+}
+
+static const struct vb2_ops isp4vid_qops = {
+	.queue_setup = isp4vid_qops_queue_setup,
+	.buf_init = isp4vid_qops_buf_init,
+	.buf_cleanup = isp4vid_qops_buf_cleanup,
+	.start_streaming = isp4vid_qops_start_streaming,
+	.stop_streaming = isp4vid_qops_stop_streaming,
+	.buf_queue = isp4vid_qops_buffer_queue,
+};
+
+int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd)
+{
+	const char *vdev_name = isp4vid_video_dev_name;
+	struct v4l2_device *v4l2_dev;
+	struct video_device *vdev;
+	struct vb2_queue *q;
+	int ret;
+
+	if (!isp_vdev || !isp_sd || !isp_sd->v4l2_dev)
+		return -EINVAL;
+
+	v4l2_dev = isp_sd->v4l2_dev;
+	vdev = &isp_vdev->vdev;
+
+	isp_vdev->isp_sdev = isp_sd;
+	isp_vdev->dev = v4l2_dev->dev;
+
+	/* Initialize the vb2_queue struct */
+	mutex_init(&isp_vdev->vbq_lock);
+	q = &isp_vdev->vbq;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->buf_struct_size = sizeof(struct isp4vid_capture_buffer);
+	q->min_queued_buffers = 2;
+	q->ops = &isp4vid_qops;
+	q->drv_priv = isp_vdev;
+	q->mem_ops = &vb2_vmalloc_memops;
+	q->lock = &isp_vdev->vbq_lock;
+	q->dev = v4l2_dev->dev;
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "vb2_queue_init error:%d\n", ret);
+		return ret;
+	}
+
+	/* Initialize buffer list and its lock */
+	mutex_init(&isp_vdev->buf_list_lock);
+	INIT_LIST_HEAD(&isp_vdev->buf_list);
+
+	/* Set default frame format */
+	isp_vdev->format = isp4vid_fmt_default;
+	isp_vdev->timeperframe = ISP4VID_ISP_TPF_DEFAULT;
+	v4l2_simplify_fraction(&isp_vdev->timeperframe.numerator,
+			       &isp_vdev->timeperframe.denominator, 8, 333);
+
+	ret = isp4vid_fill_buffer_size(&isp_vdev->format);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
+		goto err_release_vb2_queue;
+	}
+
+	ret = isp4vid_set_fmt_2_isp(isp_sd, &isp_vdev->format);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
+		goto err_release_vb2_queue;
+	}
+
+	/* Initialize the video_device struct */
+	isp_vdev->vdev.entity.name = vdev_name;
+	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
+	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
+				     &isp_vdev->vdev_pad);
+
+	if (ret) {
+		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
+		goto err_release_vb2_queue;
+	}
+
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
+			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->entity.ops = &isp4vid_vdev_ent_ops;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &isp4vid_vdev_fops;
+	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
+	vdev->lock = NULL;
+	vdev->queue = q;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_RX;
+	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
+	video_set_drvdata(vdev, isp_vdev);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
+		goto err_entity_cleanup;
+	}
+
+	return 0;
+
+err_entity_cleanup:
+	media_entity_cleanup(&isp_vdev->vdev.entity);
+err_release_vb2_queue:
+	vb2_queue_release(q);
+	return ret;
+}
+
+void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
+{
+	vb2_video_unregister_device(&isp_vdev->vdev);
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_video.h b/drivers/media/platform/amd/isp4/isp4_video.h
new file mode 100644
index 000000000000..c66451e26166
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_video.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_VIDEO_H_
+#define _ISP4_VIDEO_H_
+
+#include <media/v4l2-dev.h>
+#include <media/videobuf2-memops.h>
+
+#include "isp4_interface.h"
+
+struct isp4vid_capture_buffer {
+	/*
+	 * struct vb2_v4l2_buffer must be the first element
+	 * the videobuf2 framework will allocate this struct based on
+	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
+	 * memory as a vb2_buffer
+	 */
+	struct vb2_v4l2_buffer vb2;
+	struct isp4if_img_buf_info img_buf;
+	struct list_head list;
+	struct dma_buf *dbuf;
+	void *bo;
+	u64 gpu_addr;
+};
+
+struct isp4vid_dev {
+	struct video_device vdev;
+	struct media_pad vdev_pad;
+	struct v4l2_pix_format format;
+
+	/* mutex that protects vbq */
+	struct mutex vbq_lock;
+	struct vb2_queue vbq;
+
+	/* mutex that protects buf_list */
+	struct mutex buf_list_lock;
+	struct list_head buf_list;
+
+	u32 sequence;
+	bool stream_started;
+
+	struct device *dev;
+	struct v4l2_subdev *isp_sdev;
+	struct v4l2_fract timeperframe;
+};
+
+int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sd);
+
+void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
+
+void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
+			       const struct isp4if_img_buf_info *img_buf);
+
+#endif /* _ISP4_VIDEO_H_ */
-- 
2.53.0


