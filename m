Return-Path: <linux-media+bounces-55625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEVhK1bVs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:13:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3342804B7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C02413060DED
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EF538D014;
	Fri, 13 Mar 2026 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fIbMGyOc"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839D38C437;
	Fri, 13 Mar 2026 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392982; cv=fail; b=sRWrS9uB3iJ8CfXu/zOWafevgwIVKJPvQFPOdf6yXYDE12tZKGWzUehC2JQYXAyCihGd/e4g7l2RRL5q8RUB7Y9cPLQzfB18WTxGv2RkQDDxf9I/y77V1T2ceDwPQrD58jKcBkvAsQaHE/uOirze431jHoZ8yLafXk0Yb6hQoAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392982; c=relaxed/simple;
	bh=HqOtvISPjjPZeGCyW3YW3wJDpTZmlV72eaQCDJpqLkA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k85X7ibfkVTZXa5hNoHWy7yG3A0RyBP8xQJfDRivOPBzKVVx42NAZVqhhLJJvNpYdOSO1ixJlB3ywYy/1YhM2ZjM3boZhRhkdgZT3b0nY8+e2atbG7vZj9YPmiM5lcGUeOnS7aCHzUbTuc3AVoVehw2U6BsBXHdQwMIZ9k2qDT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fIbMGyOc; arc=fail smtp.client-ip=52.101.52.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwI6gDpxWsmrP04f+w6o4uhDMJ2aLpJDNaIcuFrw5RwfObOXhM2ptLBAXeSmeivNPIBqMUHK53dRWT3SHhqSyNciCs/LeDS9pn8UkT02g7ps9GC7lQwdnB/8UTRiO/lAYDBx6PvXJO7qwLV/HxHir3vCQwlvX5aEAKy4VoiAQhW3L8KrT0SAlH9LY3ooPj6JZ1gYy8dRbUpH2KIM9ur0kE51PlYmevri99JbepR5Hv6+oFYn6+gbg1l049BQR2L8uXg0Ex1mztLDD6KloZUyDT43nGacFBDk2t409yNtxGh/YZ1CMxDNhajUsJeKRpjSCqUMPqbP8PZcROnoya98eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUENghndurma7+0AinMGkZz/d8Sj3wnfqEWrbFC75Po=;
 b=Zx2vaBH4e357ehnyVEyh7cdMYmxZrVRf13OyNrDbDjBdZebz+rT7kk5y36n8MumguRLxNIYneCDiYNro8kgxn+cHjMa49INIDarwC0iqvddXjEcVHN5hP57VA6Czht/qjeOc5OTfKEs8kNKdst415ahuS3FG3HD5doFesKwxYzVxfhxjZ4jfDrY8u4THTBMfZS0u/fjlUAuTmrUiqXuWm0zUj8jwo+sJRfUiDM+uo8iZzupcTZbbzCA1Mx7JezT3BsuLT0YSTT8gTEwOJBR/861Z2yYoN1UFr4USdWme1m6vbZZHBqgjiFOQWQYn1ZePVO+i6hxKCgGtmtSdzORSIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUENghndurma7+0AinMGkZz/d8Sj3wnfqEWrbFC75Po=;
 b=fIbMGyOcWL33DC7Kjtf/sYy2NGHW3YQ4Ng310TpowkeYNbZ848548bWgzmAdMr9FwXTjgMKcV6JLTBI1wX4E+Wzc0Dyc7eEC9j/ulixVrLowifVj8DxQrPMvkH+ENbs5AOdcvgoAv67pO/1Lc//zYXdul8JJ2cVjB2K37RhRXYA=
Received: from BY3PR05CA0010.namprd05.prod.outlook.com (2603:10b6:a03:254::15)
 by SA1PR10MB7684.namprd10.prod.outlook.com (2603:10b6:806:38e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 09:09:38 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::b) by BY3PR05CA0010.outlook.office365.com
 (2603:10b6:a03:254::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 09:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 09:09:36 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:09:01 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:09:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:09:00 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bl274611;
	Fri, 13 Mar 2026 04:08:54 -0500
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
Subject: [PATCH v12 17/17] media: ti: j721e-csi2rx: Support system suspend using pm_notifier
Date: Fri, 13 Mar 2026 14:37:01 +0530
Message-ID: <20260313090701.646534-18-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SA1PR10MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcafcf8-1319-4ce1-6d84-08de80e04019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zPUMfQNtIz+q+ZmPpuV1DZCmMVE0jb8Z6wPkUXdJ0vFAfN5I3hvK51cek1HpBJ7z/ahSoykgjH+Z9p2v74XND7wWEOix4/78bYJMIiVKGZYe+z7CRxzbFpPPVrAX+zutnuxKoMtnOOwKVt9nGrHmOpjYzhH/+F4X9YPuXBuyy8J9BcQMa54AqQ7FfzBbVVQ+thDN8MpEnGDogLqzCoOoD1gajZepYYKJX7gf4jrWoIw9uJB2Ba6MQENSe5NwEUhhJJGq+uz2IGZl9vY8ceAWUJ3/UEfmIH+Aorp0tkuKFNtSETAyaD3QZRtQ3tz9seOxkpFplziLaySw2B6UXJcsO27SuAym/Y6QX7dgaUMZ8atC/Gp6jwXrfrbTWUtN88X54fsulnLNHe9vli1Nq+ri7Tgr84cHr6BAnQvLiIbPDwgeTOVz5zXdWMKvjNqItpA/PQfHhvvleNMPZqt9aoN18OzRARsdEMqzKOdvTkQCXfOBjKlx3KXakwS9e+NLPigsCWmz7+yNynSeHzB3XA7tnWR/SI68LTJa4ch/BprC4J3KZZuSxVayexIEDLv4fDbcGSkjx38ilsP1ApdZLsrOkr49qM90CJuQY/9ZKwg50GS2PSJsZumVVKULSQUTuoeDFR0kODoG/F0uIy2rDQSTqfi1rlf2TcSJlFwfq2xIaCD3J3Jz/1K48u7k0zdbMLlkJkYCbUKkJ+C1ppTFPOHT4S0JX5HPncsGObBQvrTAvJAJsfs4AhXUo6jIOHV0ZccXN3hvaST7vlB05kdGkE3yeg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Em8Cls3jfcp5SJokz/PXefrNPeFimEgKuowDZ2SOr6ym5Vm04aD8a1TQZrIe9Hp9dX93jq3DnPKZQv6+yLI3ZFCzyyknOKrRAuea/ouYTmV5SBsEYxBz8fyO3GBBOY+3gU4cLaDJO4bew/WDSOVQp+aKk51PTJuU65av+f2WloE631XlQdER9KoIniTPzLPpvs28pb88cEsXMYzU6u3lvbOWoU2k5p8CfSse8JnLgRA3d09zX+MJNAYiQRyIyYB8wuHTpbfnoJ7ymtemVqpkPajCvSz2G8QzGiBpWQr8eqjL10UTK+OgpogF5s+qll7LQTa+SS52T4EiUh0FBSNfeT2qcqllseW4d5rFceb++7VNPovOmXDKqvhfZgSgpwIRBScorIDifO0BfEQt4vV2XNPiIhfJtbg/yuoeFsjcVsLVpr7fP2khElAN77fVUNtz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:09:36.8331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcafcf8-1319-4ce1-6d84-08de80e04019
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7684
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55625-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid,ideasonboard.com:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF3342804B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 52c93a11ce8b7..722c3fa22031e 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -131,6 +131,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
+	struct notifier_block		pm_notifier;
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -1545,6 +1546,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
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
@@ -1618,6 +1737,20 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_notifier;
 	}
 
+	/*
+	 * Use PM notifier instead of .suspend/.resume callbacks because the
+	 * ordering of callbacks among camera pipeline devices (sensor, serdes,
+	 * CSI bridge) cannot be enforced even with device links. The notifier
+	 * is called when the system is fully functional, ensuring all
+	 * dependencies are available when stopping/starting streams.
+	 */
+	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
+	ret = register_pm_notifier(&csi->pm_notifier);
+	if (ret) {
+		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
+		goto err_notifier;
+	}
+
 	return 0;
 
 err_notifier:
@@ -1645,6 +1778,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
+	unregister_pm_notifier(&csi->pm_notifier);
+
 	ti_csi2rx_cleanup_v4l2(csi);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
-- 
2.34.1


