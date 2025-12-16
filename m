Return-Path: <linux-media+bounces-48929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACCCC538B
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F29A3001E34
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 21:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB3333D6E4;
	Tue, 16 Dec 2025 21:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cWusGtWK"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CD33CE8F;
	Tue, 16 Dec 2025 21:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765920895; cv=fail; b=ZQnQi/HkIdqI/fTnaWTax7Qm/HVFPsFbqbt2rJbMP6zXucEBdJENl1ilFWBaaMdy0m3Y7+TYhZufQtV9SszJe6OMyg6MCKEPe6dTn3oOKuW8pPFAAnCj7BEmAokfOegStcam96pd5ABzEktvf2yV2WRB9I4RCljZsr5j4ZMGiG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765920895; c=relaxed/simple;
	bh=ZXqkgIf29BneI3kWxWpFoxoMCuJN2r6fn9/jikzbDcc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QD79FU5K79HlNEg2CuyrF4p1NgMRAi12BtaTSq1TIzQFSyRzPgVvfeAEOJkG0OYIlJDTo0DxKqYSJh1RceFQOObyHXhRi7n9K+A5PvEQQShnIQN7ed4SFeOCaMm4zODUd3AatDi5nsdKg9dPSo3aL93bESHWXAgQQogiyag5tQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cWusGtWK; arc=fail smtp.client-ip=52.101.52.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNC6cunT+LNu6NfYTIstrIzydFoCz/kHtyZ9xQ/ObwRizFPQG0MXGcKVJbHlaFs6j6mgi3BWaH7SRDJluUI6Ie6cNAyS0M4Kuz9G+upKWpaeOBnn7c7bu2JRCvE9VEx5DqnUG+4kALecgnxLEiBYCCUDgJj5yQ4A7fLK2GOzGQKhh/aV1C5cYS/oZWIgpX1y1uBpCPR1LG3vs8JtQKzBizFN9LEv/k0YjPNAub5kXpi1LQcI58G2S/oXxLyZijI/EBF/mxmBNVkfeu1J1qAXrHKW8wSL32YzswTp3178by3qKGTSFm2yqgLzZpHMjD6T07sFkOhHOoBUdpa5rzRqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bx/+DYqZuuxJBg2aq1bdgNBTaTGCJ2dTrK1CnnvgM7c=;
 b=O+asj3VIhEFhSLa27DUj/iff0sMSS/uN92zfVvC5rbfERIaV+L6UKfv9V2upGaJy4hT3o+a6gLYCKoaO8rJRIj/PekY8WGbR+qxom7SwMu7B7UtTc9uzMPrQ8ZuGT+/P1wx6JXPbafwOsjqMHbzT/HLvXjCrurIEYAewL6PampdsZX42nLs9wWY0qN/tZ+X7XceotV3TrnBmhqfqe/y6BctmGfuWQcmjNjICsC15iO+npdztQ1xHGB2ekoAmxEhgVp4pAGXsrVGyZyOT7VuAjMX+uT6BwUvtg0yJPVqATsFIL6296OQvsBSr70z9OAp99k4i+01DWbEMTA5BlLWbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx/+DYqZuuxJBg2aq1bdgNBTaTGCJ2dTrK1CnnvgM7c=;
 b=cWusGtWKguo0rD33QwAm4vJbnTB21Rm8V8V3Wer0Y5D3CGyFkkiMFZDgkrwhU+PnvihFT+3H/szvFR55RL+deBBLejK/KqOiMyILB2ZFLg6D1K27ApHPaTl4sd5K9Xrvg4wAsiVjCjHzX2S0oTAzzNs7z///r23A+rAbnNRoaVE=
Received: from PH8PR07CA0036.namprd07.prod.outlook.com (2603:10b6:510:2cf::9)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 21:34:29 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::65) by PH8PR07CA0036.outlook.office365.com
 (2603:10b6:510:2cf::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 21:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 21:34:25 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 15:34:25 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 15:34:24 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 15:34:24 -0600
Received: from thinkpad.dhcp.ti.com (thinkpad.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGLYOPm465911;
	Tue, 16 Dec 2025 15:34:24 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee
	<jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>
CC: Darren Etheridge <detheridge@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH v2] media: chips-media: wave5: Fix Potential Probe Resource Leak
Date: Tue, 16 Dec 2025 15:34:13 -0600
Message-ID: <20251216213413.2799499-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 130aa691-5e58-4f22-fd66-08de3ceae2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Og9TcGsUh6D6jRwg3JR4GHACQu0o9y8PrEePby3TbtD2BIdoQKffr1Lk6zOi?=
 =?us-ascii?Q?xTVr5M8bKF8E4VP2Zu0Gg9Ws0UGNku0QtIr2UFbqYJqzZwcvhKUr2ArsTtLc?=
 =?us-ascii?Q?ZlgLxlWDphyDibZt8TDN/VPNFPbNuIl52UDN4LW5wrMrKjEt7PkXvGVvdLz9?=
 =?us-ascii?Q?6PHAuyUM2qFWWPfwvp94oW87okzJOqC89QCgdKJR8fjBhAH8kvpC9NUbIOCD?=
 =?us-ascii?Q?Y+MhFnet1Uoxr1zKe6TCp5CXwurBMZ8OuiP8CTswoTdtIJD5gghO7ZIW4sSd?=
 =?us-ascii?Q?ObaDOapVE00KzBct8CrfVL8kbGslYy50po0zxbw+e+WWlJdsKXmLxpMW1abf?=
 =?us-ascii?Q?BI+VdxLUxqUDSC/Y23QC8Vm4sdDEJZaN9O+1wPvfYHoE1lghpGPNehRw14KL?=
 =?us-ascii?Q?8GNsrMajf6obmqHPDFGhCsbs1AI25/JQIva6Fpg+3LWlmnSAOc0c668m/WGs?=
 =?us-ascii?Q?PQPDc2MP8juKwYSgtO1IlbyilQrh1JEKNEov1y0vfYDUVUv95BKBxPaEAjpY?=
 =?us-ascii?Q?mbCHtCbLA5LZjceaI0icJkuACO/sTUYAdM98Tnyg8+VM2jj917HTtpT0ile+?=
 =?us-ascii?Q?nMoo8oVPh/tQytCcQwOd4zURw8uqv9rOiirHNN9Kmr1TzQp/gFhbYoLlKkVs?=
 =?us-ascii?Q?sDejrhGSbkCyIbSvwuWbpyfHrmxY/ZNHMoGn9SqMEeFOqp1z9y/suvUx6don?=
 =?us-ascii?Q?qeUT69h75m2GljKxaDl2wLdSlfEQI9cyNTBnwkL4tMxcLzm+5eGvYwv0lBbq?=
 =?us-ascii?Q?RVot+rnt0Zuwdx6jhdPU1/WT/Oi8V3vCcCankOgWy8ubQPUQbez6X9z/YO+U?=
 =?us-ascii?Q?yMATfHEf3Het/2sKXPhzv3UBvuy+50i0KvZCuxd9twyeL1QOgnO0sRW2S3rp?=
 =?us-ascii?Q?s6DyA4DshTRmgHj6DaS09+3dAPb2RWQUv09S8Dygx7y/L1MZWSrqc999fRWg?=
 =?us-ascii?Q?KBL4CR1q8T7Md9a7Ez/6jydbTsorIK9RFj4Zz1uWKE99ik0kO0r0Zk/yyo/y?=
 =?us-ascii?Q?5KmI2bByvzNDlvQNXSpgP7OQ2sN1pDhRkeKFtmXf0kCbhIr3Cfq93TyoGB23?=
 =?us-ascii?Q?tPwix/+ArzTU2Bg0aTsNniAI472VOePybb4SpYySJI2AOL8IzIUYdTPT5t2j?=
 =?us-ascii?Q?B/NigJYzgYGyZexwHkyGGLBQmUlzIHTlXtxKwnvx0sYf9UbvZOtqQ/zwFMeC?=
 =?us-ascii?Q?/H0fTuR5tz+MCOxQHzp445Zj3+tw7orsUE31SdUWZ+1wKvzUqzx72ZDXJ6xQ?=
 =?us-ascii?Q?F8EWWmOlPUkFbqe6M1WpMsa+xqk2Fphg5Z9Iyeyw1k6/xQgBtdpQ/2gmlmJt?=
 =?us-ascii?Q?9oJdmzZjJn/3lkYFGm8VCQCjxgS8wfkTkKCGAmb96sjCXStgIhfPxDOWri/K?=
 =?us-ascii?Q?9BXuINlOFkXIHKT4K0IUz8plGi7OWKhX/rQzFQqL+nJsrDrQk8VG97c87hJY?=
 =?us-ascii?Q?xCmQvinhFZIPfonGFUo+ZmSyEFCw4Vv1kb8MMXxjiaM57YwwpVrVkLyTOuDt?=
 =?us-ascii?Q?FuUSY+wA6aPqVau2SnowxsIHeHQH0A9VbNjXfcvwoYEf5FG6vvP6jKgMq5HO?=
 =?us-ascii?Q?yX6bGVOygFdfp69HIzU=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 21:34:25.5395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 130aa691-5e58-4f22-fd66-08de3ceae2ab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585

After kthread creation during probe sequence, a handful of other
failures could occur. If this were to happen, the kthread is never
explicitly deleted which results in a resource leak. Add explicit cleanup
of this resource.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

V2:
 - Added specific case for irq_release
 - Removed hrtimer_cancel since hrtimer_start isn't called until runtime
   resume
 - Added cleanup of irq_thread in case dev->worker allocation fails
 - Rebase patch based on performance series

 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 3216b4997644..76d57c6b636a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -362,7 +362,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
-		goto err_vdi_release;
+		goto err_irq_release;
 	}
 
 	if (match_data->flags & WAVE5_IS_DEC) {
@@ -407,7 +407,15 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		wave5_vpu_dec_unregister_device(dev);
 err_v4l2_unregister:
 	v4l2_device_unregister(&dev->v4l2_dev);
+err_irq_release:
+	if (dev->irq < 0)
+		kthread_destroy_worker(dev->worker);
 err_vdi_release:
+	if (dev->irq_thread) {
+		kthread_stop(dev->irq_thread);
+		up(&dev->irq_sem);
+		dev->irq_thread = NULL;
+	}
 	wave5_vdi_release(&pdev->dev);
 err_clk_dis:
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
-- 
2.34.1


