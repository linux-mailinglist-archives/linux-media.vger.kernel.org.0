Return-Path: <linux-media+bounces-51257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EChsKSHmcGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:43:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4177458945
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78DA6A4BF46
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D743348BD5B;
	Wed, 21 Jan 2026 13:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QS4aO91o"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642CB49690A;
	Wed, 21 Jan 2026 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003741; cv=fail; b=EH3980gnSz9KcZRqZIC7xaxJsuSblLQ+XpUdJcztskvqWDcZyX9i4zmQtfwAj2hlI9mgkvfuDkcWs2wV4L5K/xj8CJrwlkHVqzwsx+rdxKe02a27Oo3si8Q8HhgOE4nfamSNR+YRb8BJ7AqIEsufqMcUt65cNPmXyOajsyUN0bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003741; c=relaxed/simple;
	bh=IH3F7G+w5fetQiIALjKxf847cLClmOHyl7UDjNgl4Ss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XrX1Teuso+38wog7tc6fvxwM4FM5hII58XGWQOQQq9Djb84r1zcyDvCqbHEnacFpla8EW+TrYYBpVvrdMk8PX3kxCjM5TPkDfRY4EJ9BHt+Sxky/nW+k6YtSvhSUxPRt35B84uVsLPeurKwfNKfFT40akXV+tcGKZCf2ZtnnlHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QS4aO91o; arc=fail smtp.client-ip=52.101.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnvVOZtxukpmUJ9OTUM8vIav1k/3tLkSa3afev8nPNeXgkaKfgAQZX+8IHZpLF4BwwJlnvR3nolPKKB6ncjxouS90f8peKDlQUSI0n8w/HSpjrF9MwWrXyqCyoKboQzN7uIhYxHZb7+lFftFHuXIO2MP8rapbZn/bHiZXD9U6M/cE6nhBelmzT2mmQEaQJ3KFiZAcm9ytw1+i28HDijiQ55N7dvKYf4/rkiVyvu3uQdF5HP9qR9k87AlHKhuUp/3j573bMy588merkjltoQq1ne1GcIwElWrccUm4ODBFK9s+kamlc+CRU2mLDnejtLmqvS+qVRM7R42MQKnAofJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ9vYNcNXMmrBjisIAL1F3J5QBDB51ZpGQQJNhw5C3M=;
 b=Ncgs1ivtKw2fIUngSWOqb4Tz+932SuiT10IY3tKYnbtjwO/INpv8f/5GG/e6bcRegwMUtR2rMsQCowD6rxVn9Sj29sZbzSpF5k4xA3MR0MkY5k/LCl3VALwUUC1ZBty9jEHqdPGs+KPLhOiyKe0vFWjhY7Th2kDAbuOMHCCLjVBYtmxTbmjTFj8Lz6mna4WiWceL88hMj1xicpvABSMW0TkGMsxc7p83A15UVCNgLCZp++J2cjU7nkkoyAqSiA1VnaqwCypJ84mHjx2XTV9nCzLdOXAbxORLUZXCLkTDXrNiyrZ4yCd2XVRohf/LGyGUuuu2D9zMB9kUufu6TqrGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ9vYNcNXMmrBjisIAL1F3J5QBDB51ZpGQQJNhw5C3M=;
 b=QS4aO91oV7QPF7iYRa5dF2WfeHijrOpsqjXiBPE4sYcT6jGQghASDLDbuWNPDj+blGhK+LTDDXDl/WDMMhBd5vodQErCA1iH+Hu0VLkpyes6o9GA0kxcYrkXp3KRE2wCTscm94V7jFRonT3hfFkzFOsKYgdxmqTP8Wz5s4n4Qu8=
Received: from BY5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:180::36)
 by CO1PR10MB4484.namprd10.prod.outlook.com (2603:10b6:303:90::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 13:55:37 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:180:cafe::8) by BY5PR13CA0023.outlook.office365.com
 (2603:10b6:a03:180::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 13:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 13:55:37 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:36 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:55:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:55:36 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIF3104105;
	Wed, 21 Jan 2026 07:55:29 -0600
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
Subject: [PATCH v10 09/18] media: cadence: csi2rx: add get_frame_desc wrapper
Date: Wed, 21 Jan 2026 19:24:15 +0530
Message-ID: <20260121135424.1185710-10-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|CO1PR10MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: d5eb5419-f3d3-4a53-2e8c-08de58f4c161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0kKy3uOjQaaf/RAQZsmZUFIiMu6xT8XjL8Cpv7HK2ZtR16RsmdsT5oS359pN?=
 =?us-ascii?Q?D1Nbvd6p6hGLXNQ+lFVfmmsvJRBzIUcAVMLySE2jtMsytc4SYCHpYgiNY/x7?=
 =?us-ascii?Q?60VSNn6jRcP/wabGULdcEImDpubiPzHNqcynLKkhV3KDjQY4kmwNlACJfLK3?=
 =?us-ascii?Q?CBOf8H9UTkBg5JmhveIaoPEvKRI6Ex3htGB3P7MFhNJ3j8dIHbNKfLdt7FRS?=
 =?us-ascii?Q?2Qqca6iseTgHmwOye6HhrGhfzzXWEHnejevNnkxalL06HbXpxa+hV/78uJIn?=
 =?us-ascii?Q?IIQ2YOAjIqBfKf3cvy5QtWEhMxZFahdo+Nt91kqrQPbQXblmn5AjGB7kY3ej?=
 =?us-ascii?Q?qjTf5viPaYrksiiv2rbZxJ4LugRNSkw+HFXs/O544MXrg7IixIlgojFV8eHX?=
 =?us-ascii?Q?D47wROmfTbtD1h9Ih28Ke65BIBhhZ7v7TsnL1foa0MFb4uhIgt4BZV4drSkP?=
 =?us-ascii?Q?qACukSNk4lfZgvSHaD1EQSh5liy1j6UY5asujGeOMid6k1IhzXD8jpwHU4V9?=
 =?us-ascii?Q?6USHrTfjdy7PJnOb5AikTc8UJTMBQ+trrjYmWgx5jbfZIuF+g7o/tnwff71+?=
 =?us-ascii?Q?ZdT6EispfktLBNJaZjk86XHzIv9w7ZPKbja2lN23NZV70upA473k7SGOSgtU?=
 =?us-ascii?Q?P2VnwzHM9EEF9BJt0c0CedXJOAHvX0eeL8dawD51eAzaQfPz0+ERyXbQmuGH?=
 =?us-ascii?Q?nHhYFSrQQ0CQaxaZ0v3BlGCZ9nZpypIZCWECF9fJKXSxOjF21qCkNGV7VcVj?=
 =?us-ascii?Q?oAprMyrhdQOdf0kSF/TRV3UumKpANr/DpgC05Y/M7Y/HJKMCD0Lz1ER6Swmh?=
 =?us-ascii?Q?elxX/ss5xhaDTU4QyMV22KG47iu2WWMU2HIYK6YJdV6W9c02q9gi7rBScgjT?=
 =?us-ascii?Q?bokRLgfE9PxE0dl7DGHIhcJCVRFj76H2XJ8CclC+gAipj1eEaD/t1nYs16+d?=
 =?us-ascii?Q?GtgGavPE1VUnGNHoPK5E0uvTcG/3d1p46uZblFq39vDfnccd5X49Rx1tEdnZ?=
 =?us-ascii?Q?EHN8+kNcywU+geY15Y7HEbPTWVkk8rDjn9X3sW/4LAim0D72yCM7z/O9S0vY?=
 =?us-ascii?Q?kkuQfgL+SPsK1zdv7O4QLYo4Ra0S8pAxKRWIBOWSPsYJU+R8xNIzR31V6LOp?=
 =?us-ascii?Q?L5IPgKPumn52cS2tZFjlDimXyL+SXNlcD5lXL5/gJSaQ9DRtDWb+7pKx8A48?=
 =?us-ascii?Q?SAFp9401DLgydgW/9eGHS7TGN1dRaGNWwbZzLZILPlkiWB5f24K0pQb8xO3Q?=
 =?us-ascii?Q?yym1Rg+UWHoXqLWZErCsbK3Q11BQ7kDrEb6VZoZIZj34E4UwGC4cagshWtrz?=
 =?us-ascii?Q?Htb0AOTR08gW8F3uQIpdB+4H5vNcb+l9+L8KiM1M/fJifNOndnUbgfFVOYOT?=
 =?us-ascii?Q?OrE9UBbui4HoTIF6lRgw1tfJL3xglVt5XYZovJMzX7GDJhpG9l3rpwPgCr73?=
 =?us-ascii?Q?Dk3tINELIIUZnwuqkFWuJjr0sMrXGPBgCmlfq9JUTRqQNRNSmfHwH2HKxFtQ?=
 =?us-ascii?Q?mEcxpGWCiy1UM5gUsU53jvepcweN8etk2l8yccqU3MeE2DY4B5w6eEoUWODt?=
 =?us-ascii?Q?X4GsydqmE+WvBgwQgY7X8V04q5DEnMVeKFsGNWuA0hHBEmLIkrNfylftUUw0?=
 =?us-ascii?Q?valb//aeuTt1cEF5nH7tZQn7yMPpdR6bSyjPM36lX7h9?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:55:37.1541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5eb5419-f3d3-4a53-2e8c-08de58f4c161
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4484
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
	TAGGED_FROM(0.00)[bounces-51257-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,ti.com:email,ti.com:dkim,ti.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,ideasonboard.com:email];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4177458945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

J721E wrapper CSI2RX driver needs to get the frame descriptor from the
source to find out info about virtual channel. This driver itself does
not touch the routing or virtual channels in any way. So simply pass the
descriptor through from the source.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 8e7af2da62262..65c6acb02f85b 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 	return NULL;
 }
 
+static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
+					     struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
+	if (!remote_pad) {
+		dev_err(csi2rx->dev, "No remote pad found for sink\n");
+		return -ENODEV;
+	}
+
+	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static inline
 struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 {
@@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
 }
 EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
 
+static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+
+	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+}
+
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
 	.enable_streams         = csi2rx_enable_streams,
 	.disable_streams        = csi2rx_disable_streams,
+	.get_frame_desc	= csi2rx_get_frame_desc,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
-- 
2.34.1


