Return-Path: <linux-media+bounces-49686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B6CE90ED
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15B51301D622
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B062531A54A;
	Tue, 30 Dec 2025 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="soVgEcMV"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBA319616;
	Tue, 30 Dec 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083685; cv=fail; b=iv4t17TlDNHbiQi8FoUaZX1XeCz9toGG1BDiAo3gpqUZYKna4n/6miai0NS1bd3U7gx6F4tdJDxRIBmDl7zjaho/heKMXeSWGATK9aqRLRufh5CN98i0fRpEEiyd83H5qvn2eMlQgEsWyqnC9+lYPmKC99G9z8JsBUYPnLOX+rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083685; c=relaxed/simple;
	bh=c0Zq5TWjrgBTdtILy0uUwOhuAIk6Xko0eENqtSlm42Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abQ3FNLqncHqDOSPFXoNZNSSxk9ubMAAC/2ZqyOp6SyFSy8NyA3AYIOBp/f4mopxtR11N8+6M7nWFH2vmk48twd51sglQ/OIBamC2V/EE/8XgoKL50aBcbdpbGjIYAsQKWBp3ptlVumYD3O6xqt8pI1rUpF8B0M6RvBpktNNmBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=soVgEcMV; arc=fail smtp.client-ip=52.101.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcneB8BFwQ9ZE41u3hH57RR7G/UC6nBxCnqK+ZQQ50ZBviUQYfHE9rpIhecZAfeycHS8p/S3P9fb7fyNwa0i8oYKvqjQQ5ZWtiTkGogujbrOWKE5ii8QbfVILkQvIkXcN/jfQDPvdT7y98CLxdL9EnmplFzqvZ32zwU+j0kP9fvB7iUKV7HMs1cXaHl+BHRF4S5C4Z+kpuvQL/ZjT2OX4MO0jLBmajao4MIz9JvgZeozRa41OXGpP+Vp8UX5u5BSyfrGSEumCrXg/pQjN/GQTZSzZkjeiPo9nKO3/OT7J/NMMC4DJ/J85ALQHaLJFt9+wcvOfdKFcVaP0DejqNd7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQoqDenSCp7uy5O3+90wy48yedFAgkb9sBIidhy1Jgk=;
 b=sKU62JHuRXaElPxCUAm9tMZUxqejMcrqU1dLtXb5fVaiFedM7hz5MbeVlRKEcUZMLld8vwMW8hmSP3LraqmO0EzKnjWNPuMDhgwrYRoCNWS7SlCPZDRLihJS1dauu2rTIwEj8G88jSDgldI/3HxGXQkBgCeh8kVQ8V8H6QuVkSbJkOlzlWZcDfu7k/T7wRInn6ci6tmAMomzwV9mA6pBKHIwcYU+EgEpClFrjhZgvFF4SLG/GBWSgqkADWAVA20xeJk/p0mDfX7i4p6al+82o6580cwB2QmnAO3i0nXKIOtfQn5pnLuCeV0HK5iiG6GtyGhejSOubJEO85kjQTalGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQoqDenSCp7uy5O3+90wy48yedFAgkb9sBIidhy1Jgk=;
 b=soVgEcMVbBfF/avAJY52g6czoh67Fo+wevoNmEhXaecJV5KTz5+tfcorzat5lWKFvCw18+etddJ9ePpksqJJ1sZuYHLI8vB7/tXJZHxlFcdpIuGlcKvtCxt5vutS3jVEW996yRYjeLWFqNnaCX3erDFuOR+cWMMRfyhC/eE/fBM=
Received: from SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::26)
 by SA2PR10MB4618.namprd10.prod.outlook.com (2603:10b6:806:11f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 08:34:40 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::c1) by SJ0P220CA0020.outlook.office365.com
 (2603:10b6:a03:41b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:34:39 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:33 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:34:33 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9m579464;
	Tue, 30 Dec 2025 02:34:27 -0600
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
Subject: [PATCH v9 19/19] media: ti: j721e-csi2rx: Support system suspend using pm_notifier
Date: Tue, 30 Dec 2025 14:02:20 +0530
Message-ID: <20251230083220.2405247-20-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230083220.2405247-1-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|SA2PR10MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc9ee0c-6a0e-4684-d1c7-08de477e4586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pa3Z92ZZfQQoBc0OyAYOR/Hag+RjTYSgte/tgIchYa2nQOob2lE8bNRN1L+6?=
 =?us-ascii?Q?5ZvGhiDfpG3wwBz1DQfB4zM6sZrfk0L+4/edLEfFRlJ4GOQ7PfE3HnKIQIMr?=
 =?us-ascii?Q?RMLjaciGxm3RhoCCmQTb/i31dUvoEUD3oyk46Ck1jKMPLsj9T/sMdH5aJTe9?=
 =?us-ascii?Q?Zt7Sfjmwj771wFXDIXQqfTlw408dD4qoAqb/yR7UB753ln6kXd7N97t90fUr?=
 =?us-ascii?Q?CEpPLos5/PhqussmEcRGbV7Ow7V/tsxzt6HME+1TJDfsilUXAXq+lh8RosFE?=
 =?us-ascii?Q?BEOR6v24384fRztERr0I05UszjjkG1bbdeGrZUdB410axpR7BYr0sVEmv0VM?=
 =?us-ascii?Q?LEKKWKGaFh+e824UyIis/7LOS7Dsoknz4dLrY9h0IwVXRzoQmsZ0vnFONppS?=
 =?us-ascii?Q?okqiCO3aoSrd3nT5tUytA7X7r44mDRBThazTZ1DcW3bUi2Y7tQ+bv84HKoeS?=
 =?us-ascii?Q?D1zpTqiA0zD1A5LEjpXt+FvdlGkJ2UjAsOY4GM63OEB9AKc2L6GNX/1JKq0b?=
 =?us-ascii?Q?WhIb+9YIA6qG6Z/77se8qWmiL6Upkr4NVY59ac38AbEi3bVhaNFJFcsclOxS?=
 =?us-ascii?Q?lxIfEAnFkXSzorUz53MC0k3Ec6gSmKj2jFTLc4DPYGps+4iujAld6Hotkhoh?=
 =?us-ascii?Q?p9UvTDX8Xl/S08ztQyKYrM0JU4Q5lcFz8cKxi4s3hjKKSKUgdBuo69fnzbCa?=
 =?us-ascii?Q?7uwyP2sULrD2RIuMR4KniKn3dBgj+L03kTXCTyQ/aUu0khKDlKOdUN37YsjD?=
 =?us-ascii?Q?GEPIDD2XPtt3U/TROq5tUpUhnC5qP5ON+zgZ1si3ZOojdiwmi1jrmtmgXnOW?=
 =?us-ascii?Q?K6IV907n9X1cp65OpLJx80hf+bcwwgk7uP8qbzCfMc5IcSxybp2PJdH2b3D+?=
 =?us-ascii?Q?xNHz8bNUnp6GZtwutm4/NxozU0qM6K++Ssn/7es58Ko3zl2y6G+ZA524rLMT?=
 =?us-ascii?Q?5KlloUDbOr/uufql6wFWMNQonoc3sEXGCHI9rekgpobceDOD4TDcJONcmpDM?=
 =?us-ascii?Q?+rNB2+5g/uXnVn8L3PL/g520Y4zn2HGOp+TmuY23/mqm1PRVah5y2eeg498D?=
 =?us-ascii?Q?oDCK9fc8ummy5jcTpMV+TwhM5tBolmtPt3CK79jlwRyiaYeDVQxyP7Iszb75?=
 =?us-ascii?Q?Sp1+sxBzpZ+EXwS17zDGstmtD2/yUOPJ1pKCZ11ZwpaBf9xqQgfiRGVNcpro?=
 =?us-ascii?Q?gwIKWUT+s9qr1VU0aoM5tCxfKhsRBQbBirqoZi4BpXUlTxxyB072i4SWW7O2?=
 =?us-ascii?Q?Rwl6YAna/FeloOZFyl2Nth4IefHxwxV2w3ToweTkejQzOVQwEfxTeXckJIri?=
 =?us-ascii?Q?SecK9AyWsoO0/DZziJKcwyCfWTGlyB0Tj7kmvn3q7NubWbUznsyNb5ei8LXF?=
 =?us-ascii?Q?uB7p6XrXt4ws5k7RIAa1M2O1GIxz6+iFrOPkKsAyiIyDSZR4tsoiB+JviihO?=
 =?us-ascii?Q?B/gNc2rPz7RUFmlgiWXPWoGWbgMrN5LPXSHLrNi0fSoyg0Jy5FBT/WfSr3Kj?=
 =?us-ascii?Q?D611/r5oFuSL5HMBhp62X3BL7zpM56KElqj1jIj4rsJALn4nvAdzeWR0H6sz?=
 =?us-ascii?Q?TEspy2lMQ6VWnJKt710=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:34:39.0374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc9ee0c-6a0e-4684-d1c7-08de477e4586
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4618

From: Jai Luthra <jai.luthra@ideasonboard.com>

As this device is the "orchestrator" for the rest of the media
pipeline, we need to stop all on-going streams before system suspend and
enable them back when the system wakes up from sleep.

Using .suspend/.resume callbacks does not work, as the order of those
callbacks amongst various devices in the camera pipeline like the sensor,
FPD serdes, CSI bridge etc. is impossible to enforce, even with
device links. For example, the Cadence CSI bridge is a child device of
this device, thus we cannot create a device link with the CSI bridge as
a provider and this device as consumer. This can lead to situations
where all the dependencies for the bridge have not yet resumed when we
request the subdev to start streaming again through the .resume callback
defined in this device.

Instead here we register a notifier callback with the PM framework
which is triggered when the system is fully functional. At this point we
can cleanly stop or start the streams, because we know all other devices
and their dependencies are functional. A downside of this approach is
that the userspace is also alive (not frozen yet, or just thawed), so
the suspend notifier might complete before the userspace has completed
all ioctls, like QBUF/DQBUF/STREAMON/STREAMOFF.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 72da58738e16e..f8e55aa402e0b 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -132,6 +132,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
+	struct notifier_block		pm_notifier;
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -1539,6 +1540,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int ti_csi2rx_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	enum ti_csi2rx_dma_state state;
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	unsigned long flags = 0;
+	int i, ret = 0;
+
+	/* If device was not in use we can simply suspend */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/*
+	 * If device is running, assert the pixel reset to cleanly stop any
+	 * on-going streams before we suspend.
+	 */
+	writel(0, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+
+		spin_lock_irqsave(&dma->lock, flags);
+		state = dma->state;
+		spin_unlock_irqrestore(&dma->lock, flags);
+
+		if (state != TI_CSI2RX_DMA_STOPPED) {
+			/* Disable source */
+			ret = v4l2_subdev_disable_streams(&csi->subdev,
+							  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							  BIT(0));
+			if (ret)
+				dev_err(csi->dev, "Failed to stop subdev stream\n");
+		}
+
+		/* Stop any on-going streams */
+		writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+
+		/* Drain DMA */
+		ti_csi2rx_drain_dma(ctx);
+
+		/* Terminate DMA */
+		ret = dmaengine_terminate_sync(ctx->dma.chan);
+		if (ret)
+			dev_err(csi->dev, "Failed to stop DMA\n");
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	struct ti_csi2rx_buffer *buf;
+	unsigned long flags = 0;
+	unsigned int reg;
+	int i, ret = 0;
+
+	/* If device was not in use, we can simply wakeup */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/* If device was in use before, restore all the running streams */
+	reg = SHIM_CNTL_PIX_RST;
+	writel(reg, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+		spin_lock_irqsave(&dma->lock, flags);
+		if (dma->state != TI_CSI2RX_DMA_STOPPED) {
+			/* Re-submit all previously submitted buffers to DMA */
+			list_for_each_entry(buf, &ctx->dma.submitted, list) {
+				ti_csi2rx_start_dma(ctx, buf);
+			}
+			spin_unlock_irqrestore(&dma->lock, flags);
+
+			/* Restore stream config */
+			ti_csi2rx_setup_shim(ctx);
+
+			ret = v4l2_subdev_enable_streams(&csi->subdev,
+							 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							 BIT(0));
+			if (ret)
+				dev_err(ctx->csi->dev, "Failed to start subdev\n");
+		} else {
+			spin_unlock_irqrestore(&dma->lock, flags);
+		}
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct ti_csi2rx_dev *csi =
+		container_of(nb, struct ti_csi2rx_dev, pm_notifier);
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+	case PM_RESTORE_PREPARE:
+		ti_csi2rx_suspend(csi->dev);
+		break;
+	case PM_POST_SUSPEND:
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		ti_csi2rx_resume(csi->dev);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static const struct dev_pm_ops ti_csi2rx_pm_ops = {
 	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
 		       NULL)
@@ -1613,6 +1732,13 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_notifier;
 	}
 
+	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
+	ret = register_pm_notifier(&csi->pm_notifier);
+	if (ret) {
+		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
+		goto err_notifier;
+	}
+
 	return 0;
 
 err_notifier:
@@ -1642,6 +1768,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
+	unregister_pm_notifier(&csi->pm_notifier);
+
 	ti_csi2rx_cleanup_v4l2(csi);
 	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
-- 
2.34.1


