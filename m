Return-Path: <linux-media+bounces-51264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLlcFCbhcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:22:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A60258576
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 593C0A61144
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62ED94A5AE6;
	Wed, 21 Jan 2026 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QjB6eg6B"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FDF4A3401;
	Wed, 21 Jan 2026 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003794; cv=fail; b=lLlGvqnledjQOXOy7hNLxAlKezzop06/xx497N7MNV2u/swqdEU6dtTqkN/NU98ZlHamcdSiGUFUpj22Rk2joCd0qZps6a1M7Og8mSiUzySgn557WQg5XPkvyaMxuTqJaRr2sio0EtmeU3rOOw71CzXz17JXEq7SnT93VCchT+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003794; c=relaxed/simple;
	bh=Emrsvc2fQrq9w3u3/wua3InwnKbMSxntVTEA2sz8JQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbXWr1sHHGioRGOUDkNVkdh2DJvdvjPC+0XSZZjr/YOc/WlV5tUuUJ+YZ4ap7AJPPK9MrG7oTWuLWfdrvP6Gjz2ZzgCbgIjOoVfKO3HJQhWw3srQV6GK7JfCulljWgpvU8ja+fPeFjHX3tCckCbjBB1PKP8BbDQn8urw1ENYWJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QjB6eg6B; arc=fail smtp.client-ip=52.101.52.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ogjt5+N11mxTw72DR+oELY5GMYpKToGLEdxQK8jo73uTmlvAnairoJYsGdDm7XbhF3rPpYcp6g6gnevnEwQvGwtEmOPk4Y6lFvynFyqxGx6QVqH32sAxlGArowDiKFDedjtuPiNtLpuQmXuxpNnCXyCoY6MhiEMSVwrXBFdyigkIxCs5zKkrn2lSMd366oSOrBhMS7fDWO3SdomCscHC3yFov7FaS8z+7W1jopfyMvQ90Qo6xnjNVYQKWnUU9UlDJce16V79e67NxO2XF7JsJPM9xLIBAEuxfUf4xfbfbENkYnkvN/yCpuwQTsEEnWABKwNyY5tBSGl4VaQwumVy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVUHTzGSq+DUecXAoKien2prvgKA84n0KTS5YvenEmY=;
 b=vL23I6krJS1z2yNx/Jv/dlU7OsMIM/BX3nlU2ddDCpF2aBm2vLu7tzvs9SuhUdt4P+UiJUoJmb+X3lcHPTD9tfuEBHm+t3MVW3Nvv+xGPMwYhL9Z0vrvQ1cCJtNB/BtJjc8Y1/kd1ZRY+sSJgSc5KIhFAdezvoXXOWbLMJKhvQeOvJqqfUZ8dfJEc5gwho0NioJZogRSKccHib20sBJDdmmcmuYCWFgZE1a3X+7jXFC/ny1wWtpQdUCJ1Dd/4nIdhnGgXTEQSJYtdIZ8CLLQ0Jer12CEd6xQI0DRFsnaDiMZ8iMdT+RrlyKmtJfBELT0KrQp1nQYkshTH0WAC+N8KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVUHTzGSq+DUecXAoKien2prvgKA84n0KTS5YvenEmY=;
 b=QjB6eg6ByztDd1+a0hyfUvBK3u1VY7Asuqt4o9U7kGpWmOk1dhjpwTxcrCm79cLCQfCrDNvF60rYFuytiqZhYmM4kPn7UbRtaEH2iI5cU8bodQ5pdGTihNm8bAa6hkwuW+ka7SW1TdpEZ660/O4ZgudeGI/LOIScSlrhjpDD4n0=
Received: from PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::19)
 by DS7PR10MB5950.namprd10.prod.outlook.com (2603:10b6:8:85::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:56:28 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:510:33b:cafe::69) by PH7P220CA0168.outlook.office365.com
 (2603:10b6:510:33b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:56:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 13:56:27 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:26 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:25 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:56:25 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIM3104105;
	Wed, 21 Jan 2026 07:56:19 -0600
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
Subject: [PATCH v10 16/18] media: cadence: csi2rx: Support runtime PM
Date: Wed, 21 Jan 2026 19:24:22 +0530
Message-ID: <20260121135424.1185710-17-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|DS7PR10MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 07817f65-29ca-47a8-eeba-08de58f4df6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NtmjAs4XJaALVqT3MqjVvXKHvqV2BsNUZJ+10Yd2sPokhKrnA9Rbt8YPeuFg?=
 =?us-ascii?Q?Y36XyaWx8RWsuSLxGiaFSabp3iOQzaCsxz67NvBDWnDQ+L69Iu7vTGtUy5Oe?=
 =?us-ascii?Q?9TxN7gEkvJjGEMoYGds09A+we30CSLfXhDQx+7Cg4ckvMI3uGD7VpKh4dV7B?=
 =?us-ascii?Q?BzV5Rl5zhpCyd9V+U2ofDs88D8iiYbXYJreSwfR2Mb0vD/VDzAuUXbzsY9/Z?=
 =?us-ascii?Q?sXcawhGpFlV45jDcrIrAjhWXkFxk4W8tE4TFGvOq3VY9tEZZ8yzNEr+pXfk9?=
 =?us-ascii?Q?VaIkeg7tb4w+QqrEpvz4zajAZ94r8pPW8in6QCftjsofQnAbRbihupLYVSom?=
 =?us-ascii?Q?56R/5aljq09ynHP0eCCiJGmTPqrZ34Jf/DOENQYYrzEvS3PIeg2mv3BZzrSz?=
 =?us-ascii?Q?uU2s7EnlRmjTThFE7p5TmiofRrOoz6daTevRZYzZo+a4MQ8o3IJxjMSD0dFJ?=
 =?us-ascii?Q?LfbXP+UbP9vty383O2bWemgteZbGG0Smq9+u4jWn4C1et78XPnmQ/P3Bxk5O?=
 =?us-ascii?Q?OSXRkbna6ofYip1GAzrrOLdFCFmK7iD1swgwlhJIoSVLqsvWI332ZA3oOfiT?=
 =?us-ascii?Q?hQOuq9p670++VRjZhxpKYWZYoIqkdLbDGvQoBHTbk4MfDWwpmREJGfGChFrW?=
 =?us-ascii?Q?qOFBSL7WuYMsJpDKA41AYA3s1Td1HI2xdEV5gflT9ul/7DRRBmuaGpPmaCeP?=
 =?us-ascii?Q?MhTkUw0phQblL7XKzz5fERZ30G+VjPxzkum22duxdUWWtz0AHLxelJqwXpjz?=
 =?us-ascii?Q?DS5LI0puk6YhRPF81gaa0Wlopm4IjdTLtN3kKMhR+xnTrNcYASKRBjwoXCa0?=
 =?us-ascii?Q?TnPp/9FQmuAyjUQQMW4PuzKLxkk1MfrA3pm9xS+a9WDPU3kfkpE5dKu2LnMR?=
 =?us-ascii?Q?HTjzU2FFWkCakzGHV2q8azudQFD21TD76xr8KhxCyS8hvWFvEIbvYGHPT+0/?=
 =?us-ascii?Q?7LwQdTzTec5A9f8OQ+v0dTdKByGgevlyy22Hq0ucpq9AiUQFEQMfifiKmjU2?=
 =?us-ascii?Q?Lz//1EENFQDqv2eYT1sebxKp88w1brqo/+Nfjn9d21E0ZAkDCLHI0EsARFID?=
 =?us-ascii?Q?Mb5EIkmmxvwMYQyRVad7Ley3/lenivTYVzQBeRY/qkCaGJgTKs90GnvpkvLs?=
 =?us-ascii?Q?Q6Q1ceVfNiE7zd1xutulHGjNJZcmKSeuupC8cFEW/sALlmToF2PBkfSnUZyf?=
 =?us-ascii?Q?dRVME1SI2cRaObx97INBOIEam137LHnofaFWHNNXpTPiLSEVDOXNqdhW1VAG?=
 =?us-ascii?Q?ge33YkqCfiURhR93KEe3HEF/s3W0MvTVB2ja5AmQGa7VCVTiBGoa52GgsGVv?=
 =?us-ascii?Q?2/BoCNKrkX5zN3GLDd17EwOmiobuOaEncXMOnCxr93b5QHy6eWfobXRn60zX?=
 =?us-ascii?Q?JglT0zXeVNzoydW1bV9xNzKbCKM4HpIaZYpDFhbGTsjeptIU9M7GDU+mdnQf?=
 =?us-ascii?Q?kvScPwbsq/ofn8GGrJ/QdwHdhto+oBC3MrTAx7aoQRMNa8iUShpdMrYo6UBC?=
 =?us-ascii?Q?W9W2DHqRdgrcrtSF5bQyYObWxNo8OBwFVSIMyD1c3/e2iwrAdmsdtKLUWUQT?=
 =?us-ascii?Q?8wkFUCICRm44f+ZokC3rsePLNzbFasZnEKgQf6slfVCs+UCtKb1cicRVStZA?=
 =?us-ascii?Q?ir6t6t1Vs/o0Tj8OacxJUIu79zLMjbQO4Sf7oLA8OSv/ghwVhk1UgWHtHHf4?=
 =?us-ascii?Q?9ZPsuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:56:27.5574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07817f65-29ca-47a8-eeba-08de58f4df6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5950
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
	TAGGED_FROM(0.00)[bounces-51264-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,ti.com:email,ti.com:dkim,ti.com:mid,ideasonboard.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A60258576
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Use runtime power management hooks to save power when CSI-RX is not in
use. Also, shift to goto based error handling in
csi2rx_enable_streams() function

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/Kconfig       |   1 +
 drivers/media/platform/cadence/cdns-csi2rx.c | 136 ++++++++++++-------
 2 files changed, 88 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 1aa608c00dbce..ea85ef82760e6 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
 	depends on VIDEO_DEV
+	depends on PM
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index db9871fdbe3a4..041d9288af3ba 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -340,11 +340,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	u32 reg;
 	int ret;
 
-	ret = clk_prepare_enable(csi2rx->p_clk);
-	if (ret)
-		return ret;
-
-	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
 	if (csi2rx->error_irq >= 0)
@@ -385,7 +380,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		if (ret) {
 			dev_err(csi2rx->dev,
 				"Failed to configure external DPHY: %d\n", ret);
-			goto err_disable_pclk;
+			return ret;
 		}
 	}
 
@@ -400,12 +395,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	 * hence the reference counting.
 	 */
 	for (i = 0; i < csi2rx->max_streams; i++) {
-		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
-		if (ret)
-			goto err_disable_pixclk;
-
-		reset_control_deassert(csi2rx->pixel_rst[i]);
-
 		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
 			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
 					  csi2rx->num_pixels[i]),
@@ -418,30 +407,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
 	}
 
-	ret = clk_prepare_enable(csi2rx->sys_clk);
-	if (ret)
-		goto err_disable_pixclk;
-
-	reset_control_deassert(csi2rx->sys_rst);
-
-	clk_disable_unprepare(csi2rx->p_clk);
 
 	return 0;
-
-err_disable_pixclk:
-	for (; i > 0; i--) {
-		reset_control_assert(csi2rx->pixel_rst[i - 1]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
-	}
-
-	if (csi2rx->dphy) {
-		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
-		phy_power_off(csi2rx->dphy);
-	}
-err_disable_pclk:
-	clk_disable_unprepare(csi2rx->p_clk);
-
-	return ret;
 }
 
 static void csi2rx_stop(struct csi2rx_priv *csi2rx)
@@ -450,10 +417,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	u32 val;
 	int ret;
 
-	clk_prepare_enable(csi2rx->p_clk);
-	reset_control_assert(csi2rx->sys_rst);
-	clk_disable_unprepare(csi2rx->sys_clk);
-
 	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
 
 	for (i = 0; i < csi2rx->max_streams; i++) {
@@ -468,14 +431,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 		if (ret)
 			dev_warn(csi2rx->dev,
 				 "Failed to stop streaming on pad%u\n", i);
-
-		reset_control_assert(csi2rx->pixel_rst[i]);
-		clk_disable_unprepare(csi2rx->pixel_clk[i]);
 	}
 
-	reset_control_assert(csi2rx->p_rst);
-	clk_disable_unprepare(csi2rx->p_clk);
-
 	if (csi2rx->dphy) {
 		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
 
@@ -549,10 +506,15 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 	 * enable the whole controller.
 	 */
 	if (!csi2rx->count) {
+		ret = pm_runtime_resume_and_get(csi2rx->dev);
+		if (ret < 0)
+			goto err;
+
 		csi2rx_update_vc_select(csi2rx, state);
+
 		ret = csi2rx_start(csi2rx);
 		if (ret)
-			return ret;
+			goto err_put_pm;
 	}
 
 	/* Start streaming on the source */
@@ -562,13 +524,20 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 		dev_err(csi2rx->dev,
 			"Failed to start streams %#llx on subdev\n",
 			sink_streams);
-		if (!csi2rx->count)
-			csi2rx_stop(csi2rx);
-		return ret;
+		goto err_stop_csi;
 	}
 
 	csi2rx->count++;
 	return 0;
+
+err_stop_csi:
+	if (!csi2rx->count)
+		csi2rx_stop(csi2rx);
+err_put_pm:
+	if (!csi2rx->count)
+		pm_runtime_put(csi2rx->dev);
+err:
+	return ret;
 }
 
 static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
@@ -590,8 +559,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
 	csi2rx->count--;
 
 	/* Let the last user turn off the lights. */
-	if (!csi2rx->count)
+	if (!csi2rx->count) {
 		csi2rx_stop(csi2rx);
+		pm_runtime_put(csi2rx->dev);
+	}
 
 	return 0;
 }
@@ -1077,6 +1048,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	pm_runtime_enable(csi2rx->dev);
 	ret = v4l2_async_register_subdev(&csi2rx->subdev);
 	if (ret < 0)
 		goto err_free_state;
@@ -1091,6 +1063,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 err_free_state:
 	v4l2_subdev_cleanup(&csi2rx->subdev);
+	pm_runtime_disable(csi2rx->dev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
@@ -1109,9 +1082,73 @@ static void csi2rx_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2rx->subdev);
 	v4l2_subdev_cleanup(&csi2rx->subdev);
 	media_entity_cleanup(&csi2rx->subdev.entity);
+	pm_runtime_disable(csi2rx->dev);
 	kfree(csi2rx);
 }
 
+static int csi2rx_runtime_suspend(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+
+	reset_control_assert(csi2rx->sys_rst);
+	clk_disable_unprepare(csi2rx->sys_clk);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		reset_control_assert(csi2rx->pixel_rst[i]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return 0;
+}
+
+static int csi2rx_runtime_resume(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	unsigned int i;
+	int ret;
+
+	ret = clk_prepare_enable(csi2rx->p_clk);
+	if (ret)
+		return ret;
+
+	reset_control_deassert(csi2rx->p_rst);
+
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
+		if (ret)
+			goto err_disable_pixclk;
+
+		reset_control_deassert(csi2rx->pixel_rst[i]);
+	}
+
+	ret = clk_prepare_enable(csi2rx->sys_clk);
+	if (ret)
+		goto err_disable_pixclk;
+
+	reset_control_deassert(csi2rx->sys_rst);
+
+	return 0;
+
+err_disable_pixclk:
+	for (; i > 0; i--) {
+		reset_control_assert(csi2rx->pixel_rst[i - 1]);
+		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
+	}
+
+	reset_control_assert(csi2rx->p_rst);
+	clk_disable_unprepare(csi2rx->p_clk);
+
+	return ret;
+}
+
+static const struct dev_pm_ops csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
+};
+
 static const struct of_device_id csi2rx_of_table[] = {
 	{ .compatible = "starfive,jh7110-csi2rx" },
 	{ .compatible = "cdns,csi2rx" },
@@ -1126,6 +1163,7 @@ static struct platform_driver csi2rx_driver = {
 	.driver	= {
 		.name		= "cdns-csi2rx",
 		.of_match_table	= csi2rx_of_table,
+		.pm		= &csi2rx_pm_ops,
 	},
 };
 module_platform_driver(csi2rx_driver);
-- 
2.34.1


