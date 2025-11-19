Return-Path: <linux-media+bounces-47415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8AC71278
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E47FB4E2424
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E232F3C03;
	Wed, 19 Nov 2025 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Qi3Q63V0"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013057.outbound.protection.outlook.com [40.107.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD942652A2;
	Wed, 19 Nov 2025 21:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587933; cv=fail; b=JrSQMB5DLME9D1d6fPP2hYzBOKWOHrD1ebgENS46hon6aFCnNtY/Y231vs8AvR8dptvW1eFZbkfCnocEE5kEXrk6YozarqQQKzsJHANR9WNSeTWK758ISrPYP9cEnyR3djwSrJxpjpRN5S1N/WP5T5TsIZIxu3MGNFV4tEMM4qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587933; c=relaxed/simple;
	bh=J+kS/87fhgJkxO5hPKxFhIkUboCq3OgOE2x1Xoj0rKk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EninKwWUUfNLY+LyI9HeTuSs2Kwt072w9917ey8Umqy1gTlgu3E+WQXcKgj9wYQmf//BgCxTWNI6m95YS49+lpmRkU4PWtMwlkTGHtU8t7Pnt7PzC6qUMxYI1mILI9WKn7xXfjJG2WRgThCtJ/NMMIp/y7PWJjv1dmtQ3YKYUwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Qi3Q63V0; arc=fail smtp.client-ip=40.107.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IClNUbs8ZaNu3ZOrnboOFJDEkFi6c+JT8Z19kIjlpFbs0Kq7A4WggQ7OwDbHVc27iDylX6qrTIIbyBmM9l0VX/GTFht0mUaBskBNQ5wbdoexMt6ifyrm54/dYQxkXR9bTvqs9TSBAue4lLsGwYsM7wUIjEtMUlNToYhOTAAOeEMRxlnSi9RDKLbnrHgvBHpjEfUyEk6BeiJk2ZrB1yOpj5O4H3rYj7ozg915TgTCZFidt29C4ZHGmJH+y++Q81V4dKyS766mBO1hRiKUnhBB0OupXd8c4Eatm+z4/oRhzH+tIMmnzZR/kyfurhOMuTMW5413pg+RnY8aCb2574QnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfGnwmlSIUpUQvA+fzVwmRx1BrHpd2uJO4sUeFQGo1Y=;
 b=bpiFskYR2/cZAu7fkKLFhAuNrWez7Np5S+5XvM2aDBY8k8Y8Sx5gPhyLXqGSeC3vxVsjkR/bNZvDHPE064SZHs0VTwbOZ1mZf/j9t3uH8wHZk2UL1tx5FhkBI3Ql56WFC9ITMdwRTuqsJ7wrF4soCOLGwdb13dBpUn5SaDFKfa5KsXtHuYY5if3WgQoo1sZwvhYJxaqmAsEHltcC3xcHfNPheaCUs3eJ+mxo/7oRyOajoi++HXLzuFMTGP6XicvGUSYK7XDZBzp+5R0CCnzWR4PfZ30b6zqO+S1MLfEyXAJEohDxeGukXGotl22eJxiZI9ceZtdy83CUipb8RoGpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfGnwmlSIUpUQvA+fzVwmRx1BrHpd2uJO4sUeFQGo1Y=;
 b=Qi3Q63V0ql6EaFXhVIRHVGjS9VgaIGovAlTnExsZsieCG/u6mEp2TBKk8CuALz2eVVAgKfRjVmtCM3ltsIClumlFQ3HY2cMttsOII2T//mdH+Wiys/rX3FZJ8nybGrsxmDUOspzTMEAE1AH6mmwtlziPV64fm5DnRgYRCmG5fTo=
Received: from BN0PR02CA0041.namprd02.prod.outlook.com (2603:10b6:408:e5::16)
 by IA4PR10MB8254.namprd10.prod.outlook.com (2603:10b6:208:568::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:32:04 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:e5:cafe::72) by BN0PR02CA0041.outlook.office365.com
 (2603:10b6:408:e5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 21:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:32:02 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:31:57 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:31:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:31:57 -0600
Received: from thinkpad.dhcp.ti.com (thinkpad.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJLVvlR2510045;
	Wed, 19 Nov 2025 15:31:57 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee
	<jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>
CC: Darren Etheridge <detheridge@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource Leak
Date: Wed, 19 Nov 2025 15:31:52 -0600
Message-ID: <20251119213152.1442329-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|IA4PR10MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 736394a6-a26c-4e77-8414-08de27b31420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HzpnGM1fK1y6c5Ud3v22q+mX2p9yR4/lQbr1HXqrLWzmvSGy/vX+79QBPNH+?=
 =?us-ascii?Q?GIYzzW9URUvgNPROIOOn6YOmA7+CDR++gkKx9Nn7Go/RJnp/tCKkhcrsPb7O?=
 =?us-ascii?Q?gElvLtPHn6dCqFB+PhIbBsiCz094KQdFbW8TibObU/FUobDmnvBL8wpxD0Cl?=
 =?us-ascii?Q?oJvJO3BbMl/csI+79IL94D4JH7VhLdHzqnwWNLqu8tpv2uI8Mxb3aNJAOaKM?=
 =?us-ascii?Q?gNUXDeBxiRhRWvy3wiNdKd+gPgyDff9iMGVwJCP0yy9A+ewZnu1A9+mz0CrG?=
 =?us-ascii?Q?QGz4pbnYp4BczVUYjA/kLc/Dv9VKWR7HeowTKkPPiPJboyFu6xddbC30RMGB?=
 =?us-ascii?Q?CjPebBeLrjxE4w2U44NAvuHk9wWHyNIDG7Ak5JuFprxYaqYnRkWusI63DtyK?=
 =?us-ascii?Q?IEFHL7spd0UfcgT+WfheAniBeQOke8L7KUt65zEbicpPluBWF3ZPI+grOs+K?=
 =?us-ascii?Q?3qSALIbjDcobmPG2xKeLinGfBXAOCC0gmBW/E2gj6HQ94zLE1yyuJVf71wIH?=
 =?us-ascii?Q?7y7TkfTfJnFhUNUFyPj7rYoOr9fZcb6ONX4qy0I77QkWrT2iXTZw+j+EoR5R?=
 =?us-ascii?Q?etd/KKfp7fo0iIUsaaVR+p6hBR2ps54OQyw/CQLKUKXaYmcKnhIFwkoeIEPF?=
 =?us-ascii?Q?DhjsRIPRaOZTiyLBDudqB0GoI1ohAEULHkl4/WOTEqFswiTwLulgy+vGY+Yu?=
 =?us-ascii?Q?nio2fJeFm8AeLLmaDisU5dtRvqHngqEJ3LCcvb5Wj7sLVIkJ60zf9acgWD3r?=
 =?us-ascii?Q?iDnl4Ty6hIFqzh3HC1zKPs5fAx5e8822bidwMWn55rSaMvgyGecci8stzq3w?=
 =?us-ascii?Q?Hz20nFcvdElNAmEkIvNRN/KpN9LgBlLldtgrQzZitKj2FBtOD+blGtA75HFH?=
 =?us-ascii?Q?cCLJkOnSroWC8DrkvttbaLNGPsx0BIm5iOV/tSzVwHG0nglZTh5dHM14EZuV?=
 =?us-ascii?Q?3bxWVgrxEZzgruHMO+eouVWaQe5pOvGLJ+4KPIOoXDzJ4ZS7D85f+qXRbkaO?=
 =?us-ascii?Q?iJM0022GcBxtYKDccqMVD31H3d58gL9wmRLTkPrLlQNfan20bpaH73cKXurn?=
 =?us-ascii?Q?jrRPxBzOdS1eZdi95zKkXxNLfBxBxaRJdjSHsZjHWNJsZ48OGplkvkm6q7Kp?=
 =?us-ascii?Q?7t32hWenr0tSZd16O6Fj0fdJph9wh5IvaIEnUiLF0/0SRSQkawbk2Uyp8usm?=
 =?us-ascii?Q?59xdr3LsI+zxx4geEBRUA23JNSkzxALYGWp1VK2m7qElJgGAPpci6tlwpTce?=
 =?us-ascii?Q?pxFcslzRxpQoFwMjONuy2ehWkQye/gvQwGfEmevGdx23lTZjclntvshW1SLl?=
 =?us-ascii?Q?MwqEFYZuM3wYJccEX/Q9bvzeb0jpno+ZrtLFYyUVN8jAFutpVnoqqGbJf5ET?=
 =?us-ascii?Q?QPQmi9LuHIlVKgWYuvD77yKUMpeLp3jKISHA/4oQAytCMRkkYTHZF/R5jtns?=
 =?us-ascii?Q?K2KjWGvqNekpP1KZFBXKx6VS7Ea7YRpg/LwHPQmG3Aj1oT1LkWLrzndEGvEY?=
 =?us-ascii?Q?y+jNHzVOrPJQh88xNGnFfhBZ4WyimzFyXICEs3/rFpBx+y629bJQ78H2WV0J?=
 =?us-ascii?Q?762S6B0nKuEyzsdRlME=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:32:02.2361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736394a6-a26c-4e77-8414-08de27b31420
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8254

After kthread creation during probe sequence, a handful of other
failures could occur. If this were to happen, the kthread is never
explicitly deleted which results in a resource leak. Add explicit cleanup
of this resource.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

I am aware that all the dev attributes would be freed since it is
allocated using the devm_* framework. But I did not believe that this
framework would recursively free the thread and stop the timer. These
would just be dangling resources unable to get killed unless
deliberately removed in the probe function. 

 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index e1715d3f43b0..f027b4ac775a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -339,6 +339,11 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_vdi_release:
 	wave5_vdi_release(&pdev->dev);
+
+	if (dev->irq < 0) {
+		kthread_destroy_worker(dev->worker);
+		hrtimer_cancel(&dev->hrtimer);
+	}
 err_clk_dis:
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 err_reset_assert:
-- 
2.34.1


