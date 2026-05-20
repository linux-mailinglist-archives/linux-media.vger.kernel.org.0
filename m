Return-Path: <linux-media+bounces-62291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDL9B/i9DWrH2wUAu9opvQ
	(envelope-from <linux-media+bounces-62291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:58:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4558F2EA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7375C30454F2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E173E2764;
	Wed, 20 May 2026 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cAJJKhJX"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F57344DA4;
	Wed, 20 May 2026 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285443; cv=fail; b=j57giOrWk2r1xeaFHTW/mASG+WWkg92popGz6gGlJ42oCgt3H662MNlDayZMhKJgDbAHorsR1s/iOlZB/ZSnqsg2J5bueyihdqy8W6fUOHjcpgzegpi4AyMQuaK6n4JauCmFYYuNEGI7nZTGt+nSipYDAlyFwhtxthwezltApz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285443; c=relaxed/simple;
	bh=oYtPg34OHcptWL0TXzGyplzqAe1Nx8ZIKSvTNahgK8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kDwh7uG/aySeAn49QDJU67t23QihOKV2/60LYyWqFwaUpMWRqVWUZMzUYiyc4J1B90fi/mR0zWO3JYaAdR0HLWVGAaFg4YSE0SBGoeH02gCrXMNIfzEG8jRko9esH+ZfKybIpBtXdpH88FB5/Yo9RjA1XYaF8dWbcHJups3xSL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cAJJKhJX; arc=fail smtp.client-ip=40.93.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKGhsVamlKFhVuJBbCq+nBk93lIlkGiO9v5b+12uG/JkufupKGdrYVNAwVrHfW3iI+5+pNEK2U5nUZD2+sldSHILW/rWvZKqa3jM9N1S7+mGXQwsM8fCvvxF7/eAnYUeZfXKeV+qWMg1e7HXDy7MJQWfPED+T6iu0l3RyeHaPzkPPNEimF5vPQEUE4ibzPTv+wIDlI1zqLxyL8vNnHyMxayG0g5DhXbeNzT1z1t2tVmbhQMUDNNE6Jx5EOWcXu3mcJkqpiD0ybMZchbmtL6za7+ueJdkS+YOESAMcgUv0xQfsLici/LTUDIhiTcxKaepVpe2Krg/47teyMDFdYEfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiIVVNwu1I0UWmkGam6DcPeQB9uT0hN0Ep3xzi4TNTk=;
 b=VCIm9IQ6ynKzbqYL2pI5Mgext0WO1t+U7AQ1wY9rBLPrZVdrRQ2tK8Rk8Jq+jSM2k20a3gRPhKMk+QvFk08mqykuXbolUE4niED+4x86axrHFdAfVqRHUypUxrhLT/DgcNgGr+27fRjRlafrC+ouvns2MklBodYJvZks0ut4ZZWfMZXODogG0I/oT/t4vdXVrRnrhQprCoxQY66f9DhoIYGq7YHqnyPrl9Gl7SGjhX+FUGIM4+wQ+/kpmcXhwFfNJpa559uZ8PCVJA06tflHVAHwuRCbGey/KXFopHlG5VPEcmwOWv5L2TqMeIKbyOj28keFtqIH6SPd+avDYXMT9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiIVVNwu1I0UWmkGam6DcPeQB9uT0hN0Ep3xzi4TNTk=;
 b=cAJJKhJXntT2dcvfEuz77xDBBMsIx5Gv444NhrHXm8uuG82l3TIBBUgfylqXYaSk/lzHVqRrrRQlw6KXT/XVibeB270gJHND68u35k/oyRoYz2qdMU4jxFZJ9YTALj+QZQB6yi5a1bzwTkLdplzg2oBdUlM0OEFKAvK0MitYvVc=
Received: from SJ0PR13CA0125.namprd13.prod.outlook.com (2603:10b6:a03:2c6::10)
 by DM4PR10MB7392.namprd10.prod.outlook.com (2603:10b6:8:10c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 13:57:14 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::98) by SJ0PR13CA0125.outlook.office365.com
 (2603:10b6:a03:2c6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 13:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 13:57:14 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 08:57:13 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 08:57:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 08:57:13 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KDv59u2091153;
	Wed, 20 May 2026 08:57:06 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH] media: ti: j721e-csi2rx: Minor cleanup of loop variables
Date: Wed, 20 May 2026 19:27:05 +0530
Message-ID: <20260520135705.661455-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DM4PR10MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f03454-060a-4005-3863-08deb677b245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	U5UQo7BCpQf7EmgIJFY9Ofk3BN3AIVaRD8mGl7XmkEB9gFZ7nXMoG3mItfFHN5kxBbaoCYdDnFyGj7Eaq8Bi+KLAUUtO6EAEE3cYwS/pwHLZcQB75sH21qw126DPgjqiu5djHtGVYW2I347Mnuft16oR28bCOeq/B7kSvJgym5u7EKvomW4UjJ8swbQswKqLgZl8GtjPXZmWbm+7GDPtiKeRr7+oiZBY9iiBmlxO0sAKPBZr9lOw69X/MG2/t+uZBgL5fLcta5H+v8egvgrqHF5S1HRNTNCOYQYNCOtL4v/iwusg2dfdfgJErXgVnsHtKcz/brYfF0vE6ynqENT05jSLSh5ldt2TwHQwvSObiZaFLHZndV8hdDt3u/ms0cIA6i4tPeCgnCmhdff9oYUB0Oh8SkOfEKEr0IuYlOTGaSPNwc8GQmBBFZCyzA2IAqRpCEncqzedrXrWbLeOtMJejFj4ugo/Xr+uS7u6IhBKcpM4GC98vJDh0d7Iz0JiD7OQpuQ075Dup2986lQ6B+VOof/cEAprawMb0X8GDj5bapcQukBVhKyKJ8tbKYq1/bB8MGkKl8DsDKKiEIgi5bpLPWGP14sxJSf+CCAx7fkYRXXqfMjgO48iVR4nWAKEEStc1oDQY4dDrvdvpGvtbID2yXepTrchvqjijN7dNf9J6QIyG771oLWCOC9P4sCBQq3NiwQ4RGgmSe0tSByvCIulhfS7FP4u6zrlLAbRi9yQ7z4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DMFABFx6bJKeELYSEOQ5g6TbroQfsKZ29MICdkCRUBREzgxYQYDMlak5ahlWQdA2BlnVAaMokyfUyeKXG4Ol/mN+T74rqoppWv4DFf2QDaukYgf+hY5Sq8jOF8MXMbGRj+Hn5AlpaToO/RoawMwq3ksfFZvEbWFQgfbQ4NdE9cwEFqUFksAslA43hBWoEFJcN11B7yL4vti90oIzFwCfiXV2PCUbZQiCjGtv+AH5pCwfULfW32IjPThWw7XWcdXtj2n47lfzyMmVmGTLP+VsKSTlMd4zB1c+FbfP5nHXug3zvdouMkRC75lQtG0X3HuRLrfcacN3qwQBbnff3cs1DSIRiNo54/AOvlqh/EaAnh+2W3hdbbZcejy2uyocEKJTieNsQUBDDMcbNq/+CKCtk7s3QjPZHHkVo69sGAqIP+kXsy+0GCqhOpucxCYDe/Eg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 13:57:14.0114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f03454-060a-4005-3863-08deb677b245
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7392
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62291-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D4F4558F2EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded `i--; for (; i >= 0; i--)` patterns with the
idiomatic `while (i--)` in the error unwind paths of
csi_async_notifier_complete() and ti_csi2rx_probe().

Also scope loop variables directly in the for statement instead of
declaring them at the top of the function in ti_csi2rx_suspend(),
ti_csi2rx_resume() and ti_csi2rx_remove(). Change the type to
unsigned int in the first two to match csi->num_ctx.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
This patch depends on [1]

[1]: https://lore.kernel.org/all/20260520120022.539913-1-r-donadkar@ti.com/

 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c     | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 21388284cbaa..ef74e2da19b6 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -485,8 +485,7 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	return 0;
 
 unregister_dev:
-	i--;
-	for (; i >= 0; i--) {
+	while (i--) {
 		media_entity_remove_links(&csi->ctx[i].vdev.entity);
 		video_unregister_device(&csi->ctx[i].vdev);
 	}
@@ -1552,7 +1551,7 @@ static int ti_csi2rx_suspend(struct device *dev)
 	struct ti_csi2rx_ctx *ctx;
 	struct ti_csi2rx_dma *dma;
 	unsigned long flags = 0;
-	int i, ret = 0;
+	int ret = 0;
 
 	/* If device was not in use we can simply suspend */
 	if (pm_runtime_status_suspended(dev))
@@ -1564,7 +1563,7 @@ static int ti_csi2rx_suspend(struct device *dev)
 	 */
 	writel(0, csi->shim + SHIM_CNTL);
 
-	for (i = 0; i < csi->num_ctx; i++) {
+	for (unsigned int i = 0; i < csi->num_ctx; i++) {
 		ctx = &csi->ctx[i];
 		dma = &ctx->dma;
 
@@ -1604,7 +1603,7 @@ static int ti_csi2rx_resume(struct device *dev)
 	struct ti_csi2rx_buffer *buf;
 	unsigned long flags = 0;
 	unsigned int reg;
-	int i, ret = 0;
+	int ret = 0;
 
 	/* If device was not in use, we can simply wakeup */
 	if (pm_runtime_status_suspended(dev))
@@ -1614,7 +1613,7 @@ static int ti_csi2rx_resume(struct device *dev)
 	reg = SHIM_CNTL_PIX_RST;
 	writel(reg, csi->shim + SHIM_CNTL);
 
-	for (i = 0; i < csi->num_ctx; i++) {
+	for (unsigned int i = 0; i < csi->num_ctx; i++) {
 		ctx = &csi->ctx[i];
 		dma = &ctx->dma;
 		spin_lock_irqsave(&dma->lock, flags);
@@ -1755,8 +1754,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 err_notifier:
 	ti_csi2rx_cleanup_notifier(csi);
 err_ctx:
-	i--;
-	for (; i >= 0; i--)
+	while (i--)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
 err_dma_chan:
@@ -1768,12 +1766,11 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 static void ti_csi2rx_remove(struct platform_device *pdev)
 {
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
-	unsigned int i;
 
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		pm_runtime_set_suspended(&pdev->dev);
 
-	for (i = 0; i < csi->num_ctx; i++)
+	for (unsigned int i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
-- 
2.34.1


