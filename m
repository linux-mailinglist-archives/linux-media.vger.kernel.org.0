Return-Path: <linux-media+bounces-51263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JOKCr/icGkhawAAu9opvQ
	(envelope-from <linux-media+bounces-51263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:29:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FBB586FA
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC0D7706C2F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86354A3415;
	Wed, 21 Jan 2026 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gctrK7rm"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37B2D2481;
	Wed, 21 Jan 2026 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003792; cv=fail; b=rPcPsHl30goerklqF/qNiysbLxofi5EqFmKDOKzr9xjUuuaBcna32fndE4KtM8DBi+BrnZ3nE+KtJP+422Vx76L2oehN8nrx4fAUf+Xa4hgsm5NNwm9iWzEqIttxpX9m6CUVezOgW9OKtIyrlSpqy0qADzP5omg46mwYUqeLew8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003792; c=relaxed/simple;
	bh=1Y56v1FTIjQf0EbfLr0xCH86rdIcYZhoMwfTPL5Zwc4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2/TY7I98V+QHxgqJ0D0hnR0WDDMUVFcnEkEOTnkNcvhMKYIHj40FniA1974WEK8NfWECSuGQk0N9ywFGQQZMrMP6xrcKs7dOxxDPjKA2laSepntvD0jt3xMeHK5DsOGhYIk/X3DG1+oj1KDdnkJnL/jr8csO93sUj9qd6RhlTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gctrK7rm; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhlsyMFQD525kOINPqJyzmshcDvt7bTrMr8KCXcKbtNNefTBJNgSO4M7QAPJWLrXNGasod6a21AckYkkHWqLVlS+Zp+hP9uOQRI2Hkjip9EIRbZqHUhZmig8MtyuxgwdeNXYTKg1mp3uBbkTgfEoza1TJm/4JTlV6PHACqNMS4Rk7aNBaevTJcSYjQKi3u7oGptTmVtW/fG1zqTYrPfqS2v/PGNBNSN1R/DF9K6YkkAsvtRPBLN4eqLDBfiFUWD5IfYy/vIU8qu5QQheSITlxe8HxU9kSuaAfOquR4zijyzUBikgGb/rDLQ7FM+e0HOBPb/VZhJ2Y2EULYimUU1ADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWDZzGItCZn9s3zCdhs1+A3P/gnHd7ghEJPnlgIDkFk=;
 b=eWO8tDFrh15nYT0NBKV78PMgz5L5OYdoewawo/JvzNEEpj9FMoydqeW+uFGa6BGzJSWgF+dZSiCO/8+tA6XmRzp4q9m3CderylRJRRqVS+M1u8b3JAY+mKyigb/sX/fKyE1cwTo+RUGBzsfDOJvseVyEWlbptMOcQdpVhLX0Chh77JspoyOSqZJeB0hvUk0DcfeHHnmpbgxBA9PucCPU5xGYsgKJ9Zk2/xuFkKwLiIjhuFVF0DkVvdNZ6gfoUsctPwpi0e2uzOFMfWBZxhdu3j4yvVLjz2u9SHxcRwOVj7beVdB+aEJiZ7Df3ILWwrupEmHUmeQ2vx1r/qZ2WHieyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWDZzGItCZn9s3zCdhs1+A3P/gnHd7ghEJPnlgIDkFk=;
 b=gctrK7rmaZfqGmg+9oRV7FYFskMpUi4QlO7VMG5Gmg6tQdt20WboyBlf8ooXoAOSBL9JBm4XCLbAnfjKfuS95xOeNvM3/mESrvaqfMJ67JKWCGQU/mNFi7KD8QRB7jllPpT4+M89aTwvWhtqwk71gshabb6Y+Yhyt1Vso6qQpg8=
Received: from PH7PR17CA0018.namprd17.prod.outlook.com (2603:10b6:510:324::9)
 by PH8PR10MB6621.namprd10.prod.outlook.com (2603:10b6:510:223::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:56:27 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::23) by PH7PR17CA0018.outlook.office365.com
 (2603:10b6:510:324::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:56:25 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:19 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:56:18 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIL3104105;
	Wed, 21 Jan 2026 07:56:12 -0600
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
Subject: [PATCH v10 15/18] media: ti: j721e-csi2rx: Change the drain architecture for multistream
Date: Wed, 21 Jan 2026 19:24:21 +0530
Message-ID: <20260121135424.1185710-16-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121135424.1185710-1-r-donadkar@ti.com>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|PH8PR10MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: c33a73c4-d5fb-4305-5104-08de58f4de69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PLuPMXCswWb+8xcbH2uxPdqweus6z0meyCikV9Mp0DLpnl0Z54KVspju7LFU?=
 =?us-ascii?Q?1ff11hwUSYPgl8Jt+9pVzEpTtX5qt0xveh+TKHSMJ6lodE8/vRcrIFtBW/G1?=
 =?us-ascii?Q?zLfCara2Uuw86D7SolXz7n+L8e1RH8UtdcB6qD4ebIIfDxg9xn8HHkoKXa+l?=
 =?us-ascii?Q?qXhXrkMTDzEa6kNJEEmT3qaKr3SxZsKoZZW01oarvjhyUQPcznp455cHX3Mf?=
 =?us-ascii?Q?C+95K0LCKFBqtbJddIU//HWuH05mYafCosYtuMVD25DUZ+sa1j9YGml5Yti+?=
 =?us-ascii?Q?d9YL3YvdoKCevqzWsn376JXLbWX3AB44n4n0wQlc8cvpktOWXznBAdK19kw9?=
 =?us-ascii?Q?i7exNfPB9Y5am4+3dNlIQ/4xQwBv+Hb3cDmtN2slzvJLsDxsSNyp1MzfNuoE?=
 =?us-ascii?Q?FLDe5ePw3z9UB1P7pbQvAq+EheJD0ux6CJa0SXX8fQRKKCeTov5+dxPewAeP?=
 =?us-ascii?Q?BOEokIVL96Y5/zfAQEgu30+KOHgxrAGFd3za+fyRIrkEwVf22+8z0hQvr5ij?=
 =?us-ascii?Q?f8Iq5OZawuP/mj1YBLoHGDLkdahlCIRlFH0WgjL99oX9LrfWY4KcI3zcucvf?=
 =?us-ascii?Q?qBnF/9464SsYtnvZzrTBUE9XyCrTlCBRPBrCFdEwvm+8K6f876JiPfS0D7Dn?=
 =?us-ascii?Q?XYY8XBN9hzzt64K8wKcgIEs6PHYDXF2dXQgxICRPMhMrynayXouqrkPCQouL?=
 =?us-ascii?Q?e0KBwZFSVnQbkRQD3/5dbIeMTcBRxIZZTT7oS47AyIse1gL/IG4kim4SBos6?=
 =?us-ascii?Q?RsYXe7GOyz5/t9D6gm2JIdf7usMEsWFNPlczHt2MEdNyCCWQgZZ5eK2JsuST?=
 =?us-ascii?Q?WysIqajy7Npo1PKqZNkF9FuVpbX4Sjewn6DnE1e9IRl7Nv6yt3HITpDSvRws?=
 =?us-ascii?Q?0Oh5W8l9qcEq2gUARvyXKweId6dYjTNYTfVg7+rIl9v8dXqHGYFynIvUtM0b?=
 =?us-ascii?Q?nQZL3dJooQmwwFSbJU8WOzd+oiOliscwa+CgE0lULH0PD6/wR4PqikDhrvFb?=
 =?us-ascii?Q?3N37HTW9bbOv2l3KsOHzvBCornBEJnuzif7J2C/Vkd+wwjoCiBiyAHtUrmEd?=
 =?us-ascii?Q?i4dAu+m4CljerxPjE2pu+VaktdREAEqy/gT2+vr9A/4nFWQTI3Fan3gY+MR8?=
 =?us-ascii?Q?NU0Se2erKBFZyqjrpy2MPbtqCSfYAEWj8LPegVrP7pzCux7ssjNfo8zAoX5P?=
 =?us-ascii?Q?bjp6i2yHXpaAsQ65/Kz3GOi/pSZRrRqkc1rkfXD4lLLcX3603JEll4DtNtgQ?=
 =?us-ascii?Q?TMvJ6C3RcgvcYarrh0043gZsBkXpXYlRI0Ae4St7vETGQrUZciZPjF5YbzWQ?=
 =?us-ascii?Q?Ot2NBQnORXE6wdWMEoPjwaAP2JntwFi5H9+YZZD8KbNZfRVXSJfrFopOWeVz?=
 =?us-ascii?Q?BIFImgEfNKQHXH03yRScr/nF/iq+Ku1UW2IrN662u73gorYZe5K5idoqNsKu?=
 =?us-ascii?Q?a4ocWOCR2bjjtvYSXlBtQX9PhrU3bBcc2QmkX6uVuAfu7Bwcvcgg7LfXMNtu?=
 =?us-ascii?Q?4yr6ToqdufnlQXpQmSgoABkOe31KdMgtpa8rMVTKSfeL6fGkBEdxeqCP4v9r?=
 =?us-ascii?Q?EPR1yGVvczmnvYAggwOa8xC/898hsTMECBidu/Oh+1ffk4briKC861wk4HgQ?=
 =?us-ascii?Q?MoYDcsneB8dPuHnKUvbjkZtcQqLpBFb3Sr/Im4Qsh7mwL7lXHx5ADOlzkV/F?=
 =?us-ascii?Q?Zx/Ljg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:56:25.9533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c33a73c4-d5fb-4305-5104-08de58f4de69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6621
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51263-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ti.com:email,ti.com:dkim,ti.com:mid,ideasonboard.com:email];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B7FBB586FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On buffer starvation the DMA is marked IDLE, and the stale data in the
internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
userspace. This approach works fine for a single stream case.

But in multistream scenarios, buffer starvation for one stream can
block the shared HW FIFO of the CSI2RX IP. This can stall the pipeline
for all other streams, even if buffers are available for  them.

This patch introduces a new architecture, that continuously drains data
from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
available to the driver from the userspace. This ensures independence
between different streams, where a slower downstream element for one
camera does not block streaming for other cameras.

Additionally, after we drain for a stream, the next frame will be a
partial frame, as a portion of its data will have already been drained
before a valid buffer is queued by user space to the driver.
Return the partial frame to user space with VB2_BUF_STATE_ERROR.

Use wait for completion barrier to make sure the shared hardware FIFO
is cleared of the data at the end of stream after the source has stopped
sending data.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 123 +++++++++---------
 1 file changed, 60 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 5bb726f7d4f44..42ef8c553883f 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -82,8 +82,8 @@ struct ti_csi2rx_buffer {
 
 enum ti_csi2rx_dma_state {
 	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
-	TI_CSI2RX_DMA_IDLE,	/* Streaming but no pending DMA operation. */
 	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
+	TI_CSI2RX_DMA_DRAINING, /* Dumping all the data in drain buffer */
 };
 
 struct ti_csi2rx_dma {
@@ -109,6 +109,7 @@ struct ti_csi2rx_ctx {
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
 	struct media_pad		pad;
+	struct completion		drain_complete;
 	u32				sequence;
 	u32				idx;
 	u32				vc;
@@ -249,6 +250,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 			       struct ti_csi2rx_buffer *buf);
 
+/* Forward declarations needed by ti_csi2rx_drain_callback. */
+static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
+
 static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
 {
 	unsigned int i;
@@ -609,9 +614,32 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 static void ti_csi2rx_drain_callback(void *param)
 {
-	struct completion *drain_complete = param;
+	struct ti_csi2rx_ctx *ctx = param;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dma->lock, flags);
+
+	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
+		complete(&ctx->drain_complete);
+		spin_unlock_irqrestore(&dma->lock, flags);
+		return;
+	}
 
-	complete(drain_complete);
+	/*
+	 * If dma->queue is empty, it indicates that no buffer has been
+	 * provided by user space. In this case, initiate a transactions
+	 * to drain the DMA. Since one drain of size DRAIN_BUFFER_SIZE
+	 * will be done here, the subsequent frame will be a
+	 * partial frame, with a size of frame_size - DRAIN_BUFFER_SIZE
+	 */
+	if (list_empty(&dma->queue)) {
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev, "DMA drain failed\n");
+	} else {
+		ti_csi2rx_dma_submit_pending(ctx);
+	}
+	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
 /*
@@ -629,12 +657,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct dma_async_tx_descriptor *desc;
-	struct completion drain_complete;
 	dma_cookie_t cookie;
 	int ret;
 
-	init_completion(&drain_complete);
-
 	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
 					   csi->drain.len, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -644,7 +669,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	}
 
 	desc->callback = ti_csi2rx_drain_callback;
-	desc->callback_param = &drain_complete;
+	desc->callback_param = ctx;
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
@@ -653,13 +678,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 
 	dma_async_issue_pending(ctx->dma.chan);
 
-	if (!wait_for_completion_timeout(&drain_complete,
-					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
-		dmaengine_terminate_sync(ctx->dma.chan);
-		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
-		ret = -ETIMEDOUT;
-		goto out;
-	}
 out:
 	return ret;
 }
@@ -703,14 +721,24 @@ static void ti_csi2rx_dma_callback(void *param)
 	spin_lock_irqsave(&dma->lock, flags);
 
 	WARN_ON(!list_is_first(&buf->list, &dma->submitted));
-	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	if (dma->state == TI_CSI2RX_DMA_DRAINING) {
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		dma->state = TI_CSI2RX_DMA_ACTIVE;
+	} else {
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
 	list_del(&buf->list);
 
 	ti_csi2rx_dma_submit_pending(ctx);
 
-	if (list_empty(&dma->submitted))
-		dma->state = TI_CSI2RX_DMA_IDLE;
-
+	if (list_empty(&dma->submitted)) {
+		dma->state = TI_CSI2RX_DMA_DRAINING;
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev,
+				 "DMA drain failed on one of the transactions\n");
+	}
 	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
@@ -746,6 +774,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	enum ti_csi2rx_dma_state state;
 	unsigned long flags;
 	int ret;
@@ -755,6 +784,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 	dma->state = TI_CSI2RX_DMA_STOPPED;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
+	init_completion(&ctx->drain_complete);
+
 	if (state != TI_CSI2RX_DMA_STOPPED) {
 		/*
 		 * Normal DMA termination does not clean up pending data on
@@ -763,11 +794,20 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 		 * enforced before terminating DMA.
 		 */
 		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
+		if (ret)
 			dev_warn(ctx->csi->dev,
 				 "Failed to drain DMA. Next frame might be bogus\n");
 	}
 
+	/* We wait for the drain to complete so that the stream stops
+	 * cleanly, making sure the shared hardware FIFO is cleared of
+	 * data from the current stream. No more data will be coming from
+	 * the source after this.
+	 */
+	if (!wait_for_completion_timeout(&ctx->drain_complete,
+					 msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
+		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
+
 	ret = dmaengine_terminate_sync(ctx->dma.chan);
 	if (ret)
 		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
@@ -830,57 +870,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct ti_csi2rx_buffer *buf;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	bool restart_dma = false;
 	unsigned long flags = 0;
-	int ret;
 
 	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
 	buf->ctx = ctx;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	/*
-	 * Usually the DMA callback takes care of queueing the pending buffers.
-	 * But if DMA has stalled due to lack of buffers, restart it now.
-	 */
-	if (dma->state == TI_CSI2RX_DMA_IDLE) {
-		/*
-		 * Do not restart DMA with the lock held because
-		 * ti_csi2rx_drain_dma() might block for completion.
-		 * There won't be a race on queueing DMA anyway since the
-		 * callback is not being fired.
-		 */
-		restart_dma = true;
-		dma->state = TI_CSI2RX_DMA_ACTIVE;
-	} else {
-		list_add_tail(&buf->list, &dma->queue);
-	}
+	list_add_tail(&buf->list, &dma->queue);
 	spin_unlock_irqrestore(&dma->lock, flags);
-
-	if (restart_dma) {
-		/*
-		 * Once frames start dropping, some data gets stuck in the DMA
-		 * pipeline somewhere. So the first DMA transfer after frame
-		 * drops gives a partial frame. This is obviously not useful to
-		 * the application and will only confuse it. Issue a DMA
-		 * transaction to drain that up.
-		 */
-		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
-			dev_warn(ctx->csi->dev,
-				 "Failed to drain DMA. Next frame might be bogus\n");
-
-		spin_lock_irqsave(&dma->lock, flags);
-		ret = ti_csi2rx_start_dma(ctx, buf);
-		if (ret) {
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-			dma->state = TI_CSI2RX_DMA_IDLE;
-			spin_unlock_irqrestore(&dma->lock, flags);
-			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
-		} else {
-			list_add_tail(&buf->list, &dma->submitted);
-			spin_unlock_irqrestore(&dma->lock, flags);
-		}
-	}
 }
 
 static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
-- 
2.34.1


