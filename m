Return-Path: <linux-media+bounces-55619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN/1MU7Us2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:09:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA753280394
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9667D3038FE9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95873389101;
	Fri, 13 Mar 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bz2JHk8j"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010047.outbound.protection.outlook.com [40.93.198.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF4337701D;
	Fri, 13 Mar 2026 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392939; cv=fail; b=gOZAliAFayxa5z9UU0hR2qE+Ba81RyV9uYvCT0P7z9IfmqlcuIhZ8mJGoc1dt0ApxddxqUqoRzR0Hix1YA7MmJ1NsDt9rUFf3Owh6s+VFhHkW5P7L/zxeeClPrDmHbxRQI7r6bqfNAyNIZgCTJVJIQEbCnMeWJhcjNFg1kSm3vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392939; c=relaxed/simple;
	bh=z+dYX9+28EHfvmEjRZRQWHZn7y4ZEc30tifHgwkM+ZQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvBDJ3YhYEAmo2IG9VVNsjuQMqgmfOQ5X2F2tQkedLNXhWFIDFeZ/p+kPt2Pye+qcFdjXBDOyRkkHIlXIN4/08coSLM77KQR/HTno+g2pDjr/58SqBCgnh9aLG0Na6hZAME1aPObTWKgzlR9/d0JzRz9KEgI8sYy+xGtvxTk71U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bz2JHk8j; arc=fail smtp.client-ip=40.93.198.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwL3lQ3oM3Cdt0iGWwV6Xv32wuzretf7FB/w/NlHBrZbAuyMECE6e7XR1sMntBF+RwuB6nuaYHAVkTCmhQ8UtgBzGp7quWlEq1lQGG4tQ/TRAruhHrYmQWtyXTnjbcjLWzUQJF0tp+pN7tDxcWGs0FOHQFFIx7zsPiUWhhBWmBMx17jzGm8TmyoSzSwz/VVHNPyOX7M/t8pUYMyDwyOuutdNT08NewGiBroU2CfEK2pDUwQAnLs5YBNBbAKCUawuvPfCQj1mxE3GuupwutAPZ3sLomf26vd+1vKvrK0ln+D23FwP6Z6nv33SI01JRNAb4yZ0FKL1q35zblBTzROLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0KBzzVLh2Bl8mRajcWZj3dgylMtkjnl+LS1nqqp9lE=;
 b=DCZmiXhpgBoXrmPAKi3cPEUX/ocptII3p31uNbAoVbOaZsaIhOcxI1bWNU2ZVwGXKMVlT34slgVLJo1TEJhzowQhj+hZgS9yMSZnpxeYz4joqlv2VhVYrD825TSvBdC705lLO67uYaBcjR1l2T0FoekmWiBF5okfA7xUP11BS2Fyj8UC4t29ZVwfNqtG5IDTfqDelRxOwmnLFg1vUWP7kCe8iW99r/8VzwU6+wEDZJ4+w7oymOV78nbBJ1+db+OQJaTdxGFBn8S+VylxKZMzQahsTtdDw0fC1XAig7Gj07m0qyvPMWg2TwlxAk5sZMYyTM2D/ubbTPta/aEU83G+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0KBzzVLh2Bl8mRajcWZj3dgylMtkjnl+LS1nqqp9lE=;
 b=Bz2JHk8j1OdVmlr08m2EAzM5v5xuwajmHPwKq39GdObx/JYVD203enT3B/nS4f0koPL3mgOXnFIOZ2MkQDfWy0t8HEPRPtF4DV0vDSkNMGZ5z1dEZtkW5HlFkus3eo6qND1Jd65fImbFDD6hUDc3JwskDdyeXe0bwuZf2p9VDnQ=
Received: from DM6PR10CA0018.namprd10.prod.outlook.com (2603:10b6:5:60::31) by
 MW6PR10MB7614.namprd10.prod.outlook.com (2603:10b6:303:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 09:08:55 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:5:60:cafe::bc) by DM6PR10CA0018.outlook.office365.com
 (2603:10b6:5:60::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 09:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Fri, 13 Mar 2026 09:08:55 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:54 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:08:54 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bk274611;
	Fri, 13 Mar 2026 04:08:48 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v12 16/17] media: ti: j721e-csi2rx: Support runtime suspend
Date: Fri, 13 Mar 2026 14:37:00 +0530
Message-ID: <20260313090701.646534-17-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313090701.646534-1-r-donadkar@ti.com>
References: <20260313090701.646534-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|MW6PR10MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: d49b064c-3d94-4d72-55cc-08de80e0272b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wEEIj6p4G7HXbdi2YX5m0EPCxXPZAAUxjE6cF+n5OC8Wj+JUouy966+x+8ot7Szj/vpA9/EpJxtNB9Z+eXcfp/kJRROLmaTUGIz65wn9J/2sb5xrEThq8F0HRdAXlt7QFl/5qfP7czysbfk6VFaVWUiZULU33OvfUwpZHejPlo8vzhOZNy83F1IaVTUr5i0Y/cEZkI/C9v6Eh6QLpPHzdAfPtwS/vf5sMCcp9oDCAcQq4pmB5U3rnVvmh5w2i6xz60Ze/MYUK16s+23K1y65i3/d88XIUbSi5PbQVf9kVaPazTpjYalyJd3ARME7vq8X9ZMzITQ4o04TUSWv4XT81ZT7W+BUBWh4cGPVJ1ZeNhRjkiCDLodaiAlq86KQ99sFZJ5dn7BXlloTdIALM8W+IcOHeqB0aKsUKhySXz/XhH0Xd1lxsoqL921QBOYPCCAyFXPcxVbKDNTGLuG1NO0C4hxJNzlN9XT12cp3uGvAdreS3Ldus67mjFRfD9unnxQRGFf+CrTUIpvWlUhCkHaxLx8MlTJRNpFbFyeAnyF8kHd9NtNSbHGmmjJcq3qqKGl0+4kfwotf+L3AHBhv90pMx4c9sqypa+uJydyy60iC1Kq8cLWEYDlE3qumXUDuWFvI2iSOxbF5Zz4bCUU0h4R6CAN6Z9X6TUMAUjUGIdC+AFrSfpVxWTEONo6dzlkDa/Q6oklU2rjLlUXZwfw9hLFYZrUhrN8Lissy1Gkx0Sk+i1J258aLzZ0r2oYI13tt0XjTIG78KUrfbc5YflSkO89KQA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S4yDNy8/HLate0u0zctsnlDrZdzti+gVTo2VapxFtAhuO5qh91dHVpbbqMIf7t3GjWX6FPc/VQ8dTnWA9+u3Sq+Lur1PVKyGB3oWKxoGIUO9q6xNijte+t/DMLOiszzof4LQM9q17qq126RFpbmqJ9S+BOfpT03r9odCFlwRYyFuMkY9uxiSQnKJq7AZ1cL/N7zf1oJwKSWUpzQbGaDb1JHpLgrOIgewhXwLAUeBFfj4FEuSw7CHH8AHFGVQvkNE19tSRwgVJW9LxMon2++mcfFMhszpQl8fzM5RcWfubZt4Gc07X2gQsh7bCp9HneCciZG9amSrgAbMruokIp5KkTh9uAVYJlHyd2yHgV3d2GFjZ/VPBA4XyMb8VvCT92ekG+xFh594tYdh/vPsMxzR2lcTJHF1p05kYs5ARo60lBer7uS8SDeQZpYyLVsp1iPH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:55.0430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b064c-3d94-4d72-55cc-08de80e0272b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7614
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55619-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ti.com:dkim,ti.com:email,ti.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AA753280394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <jai.luthra@ideasonboard.com>

Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

When powering off the IP, the PSI-L endpoint loses the paired DMA
channels. Thus we have to release the DMA channels at runtime suspend
and request them again at resume.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/Kconfig             |  1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 55 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index da33facf44678..d0cb05481bd85 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -83,6 +83,7 @@ config VIDEO_TI_J721E_CSI2RX
 	depends on VIDEO_CADENCE_CSI2RX
 	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
 	depends on ARCH_K3 || COMPILE_TEST
+	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index dda8a66babeca..52c93a11ce8b7 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/cadence/cdns-csi2rx.h>
@@ -966,12 +967,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	unsigned long flags;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(csi->dev);
+	if (ret)
+		return ret;
+
 	spin_lock_irqsave(&dma->lock, flags);
 	if (list_empty(&dma->queue))
 		ret = -EIO;
 	spin_unlock_irqrestore(&dma->lock, flags);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
 	if (ret)
@@ -993,6 +998,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -1012,6 +1019,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -1257,7 +1265,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
 
 static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 {
-	dma_release_channel(ctx->dma.chan);
+	if (!pm_runtime_status_suspended(ctx->csi->dev))
+		dma_release_channel(ctx->dma.chan);
+
 	vb2_queue_release(&ctx->vidq);
 
 	video_unregister_device(&ctx->vdev);
@@ -1507,6 +1517,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 	return ret;
 }
 
+static int ti_csi2rx_runtime_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	int i;
+
+	if (csi->enable_count != 0)
+		return -EBUSY;
+
+	for (i = 0; i < csi->num_ctx; i++)
+		dma_release_channel(csi->ctx[i].dma.chan);
+
+	return 0;
+}
+
+static int ti_csi2rx_runtime_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	unsigned int ret, i;
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ret = ti_csi2rx_init_dma(&csi->ctx[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops ti_csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
+		       NULL)
+};
+
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1562,6 +1605,9 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 			goto err_ctx;
 	}
 
+	pm_runtime_set_active(csi->dev);
+	pm_runtime_enable(csi->dev);
+
 	ret = ti_csi2rx_notifier_register(csi);
 	if (ret)
 		goto err_ctx;
@@ -1592,6 +1638,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		pm_runtime_set_suspended(&pdev->dev);
+
 	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
@@ -1599,6 +1648,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	ti_csi2rx_cleanup_v4l2(csi);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1613,6 +1663,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 
-- 
2.34.1


