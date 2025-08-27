Return-Path: <linux-media+bounces-41204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5DB38A6A
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 21:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AA687A5409
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 19:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20702D24B2;
	Wed, 27 Aug 2025 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UQzY4SqT"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE24430CDA1
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323994; cv=fail; b=DkIf91BlYUyyeuqqi7pO1/FP5JnsLTCc5/Zcx5ASChLhWKDPT/92lqMKMgNXJx8q2mmSNmaeibi4o4l6xuQQNo+ZRGAhxmgCnieCi5LlRwcW3EmOWxI5Wsq0x5rj+Z0rEpQvB+P1M/jFv+ZHt957LGoaNHxE4X/SbCOYl2P/Svg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323994; c=relaxed/simple;
	bh=D727STvPDagmeJtyVGhcZV/UGuFdnJZv99HvtDKdFyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=poPGfCoTAuVqpJDgEcPpey8PBdrFug0INQ9MgDFfepeayAji8HdrF3N1wVkGC1gexG6eD71LsIA3Rq3i3EzczNqTEi0ZkztA7pTW8a1h6twf3GAfefkLrFnJPlAn9h1uakUFehwAppyYjPBVrXtJj1yo0YDDjjUm5qNYMk+7XNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UQzY4SqT; arc=fail smtp.client-ip=40.107.96.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbxcbjFSTwC+pq/BmznI6mLbVrtKgsNxiKrk0nEwcD7um6dBNuF1GmuO2wiRdvS64A6e8qpLVteB3xxh7yCfP74ev6ApbZu4iMADKD7D3aiUViqTK+pkzFJu/Mo3ozhBoocXa0zyunOFi/F5UGeXkSogGv74XjA2SQYyl6jMMkOGy2yBCs9OVxed+X1DFnHUyAB8PoYO2FcJF8SEvr0juiPY8LREqQPNvpBZUdYDOcBNdGwD7K0Vyq55+8LAWiLaT71R3KGRbPuE7QOOeGZrsx4xH+DCl/dU6qjC68LDYeGcMzGeQdg2BDMTltLyAKVwcTHTaKO2E0ACLoYTkU4tTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfxPr1iO8FX+PuF/ULZXOIdbVHh+pxOTE/38vxL3nG8=;
 b=t7ETIZH8dZ00yp8yI4XPQuAX4D5VXubOEfr0X2Rg4XRAewBQnfpRmF1ij5Gr/yDmKd3AndO2nC58ypn+0eXuLQyailhqR13uY1McVOd1Ct6rBUsfcAJ1lgIalWXirIOdSgMgzv/4c6nDyVsUPsb+Is5Z6K9HLATD1WSGGD70xaQ/zlSSPv6rq9Ps0e7HcaMlrLVQ/Ss6hPxE+8cQpqnf1MLp4nUf8hugJmAVG8S229f5dtXk81Z0qGDjkTDUy9eskqo2ezLRorZmjYhjV0q1KlFV96Ca9ewGTH3SCtf4gehxFThZ+QRR011OYJPmfBOBL2ELrLI6LX1T6AWr+ilvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfxPr1iO8FX+PuF/ULZXOIdbVHh+pxOTE/38vxL3nG8=;
 b=UQzY4SqTD86r/Xn6PVTuHaf/J7syVz6YgwYF/bxIMW70n6D/qDakY5D3YErApV5UFVB14pzopXcftBSaH5OIXAboph3S8DMb5oVMeZqhN2YMtvxOoQilfe+xCIpUXyKbT9MM21c2M/28ytcraBk3eAKKsFdJaNBQNFnfgFFjLxE=
Received: from BY5PR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:1d0::38)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 19:46:30 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::f1) by BY5PR04CA0028.outlook.office365.com
 (2603:10b6:a03:1d0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 19:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 19:46:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 14:46:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 14:46:28 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 14:46:28 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <linux-media@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vishal Sagar
	<vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH 3/3] media: xilinx: vip: Fix alignment to match open parenthesis
Date: Wed, 27 Aug 2025 12:46:26 -0700
Message-ID: <20250827194626.3194465-4-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827194626.3194465-1-anatoliy.klymenko@amd.com>
References: <20250827194626.3194465-1-anatoliy.klymenko@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: df1d2cb8-b8cd-478f-85f3-08dde5a26b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mi7tauIEQ3H4YeuUPOFpL66YbHCpkm9aV7S4Gn6G4duWUUAIpkkHBxoVdKv8?=
 =?us-ascii?Q?OiU9wj5QR2dmcsnrDb2STRIXqysTfZKydBdaOXTV8ed1lwLfbPjJNvJf68Cr?=
 =?us-ascii?Q?z95zrG0bx2gQO3Dj0anifcFWqcGYB1vWxYHgpdzg8XrmgH5B6crUlKHlLxuj?=
 =?us-ascii?Q?gWDA4lEql5ov/rbYwqmo+iYJboEz/WJ2BPb6Aq2uz36n5rOcEzf4jPk7pzQz?=
 =?us-ascii?Q?wk652NVosuRzpRBDq47cNS4pm5TtXtb5BCbcq71iZzAXnHodtI2G93D7Yn7h?=
 =?us-ascii?Q?up/7MJY8hiPA33XBFzhoA2Z6VVaom9NaG6RQilJuEsFafyEl/f9uKk62e5vQ?=
 =?us-ascii?Q?22FMavtWUElaDQP0qWZOVIurazbWbnP73qo0b6wdfgmH4P9Bfy6VTv7rLPRb?=
 =?us-ascii?Q?B0RURx1rfvph1ARvDtkoSZYiBsKZXDUxMWsrLnYsmrit5o8zQg7qwTlW9mOf?=
 =?us-ascii?Q?NUKTTH2y6Ng2dLOQHLEdtmHHTmQXgulfeod5sc7iovuqITfLJfANzLCN+tZl?=
 =?us-ascii?Q?hztHs+vN6m9u57L02wG2M8AI9IDxryEYBXm3lXn7GQqPM3Sdznek27NP9XEu?=
 =?us-ascii?Q?n5TTSS8Le2LA4iRsQeff32ita9+wjTYP1PyS8QDzRCsa72cbKbFvTDoZ04Xg?=
 =?us-ascii?Q?a6yD5jkTnS/fvLAC/+UxKfnKTb0Qm0d9wo9eH0QSAjaK61GOoP2qp38l+YXF?=
 =?us-ascii?Q?QR4iqEpH30lwApmEEmzDh04zbPayx+bFOwZIgo6nqnwtteRMPkuoJcR/5wbA?=
 =?us-ascii?Q?vhoMO6k9RmS58gNfYl3wteJ1rD50fe2eID03vj1qkU3Mrl5BsXjtyqXSkTKZ?=
 =?us-ascii?Q?PvCtxCakTpiuLEYTccSXfDvroXrfEF2pCo5to8E2amklt4xjKS1PTHV2HCzn?=
 =?us-ascii?Q?gRkHSm0a7Gb1OppTUF4VxpQ10419m9Wt+WsGNETaZuOdfvUoW7v52vOsxeps?=
 =?us-ascii?Q?mO7AJfXORuxEQLh3WygyDZWHS7BztcETdD4lDWQScicUYpLBE8HjIZJ04V6x?=
 =?us-ascii?Q?jgnksyoKB/Z25F0fUm0AB4WC6B/zBa6dN2HQIgvF4lDlbj9MAbG9VWrvMl6C?=
 =?us-ascii?Q?wqaBbCtgHy9A/jLTh/Apcam4REgvO9Hy5TYdXeqVQAYuZRSnxH4117bhdHZi?=
 =?us-ascii?Q?lOGZre6OkKYfIo2SPbhoKCB+qGfOYmzNAJqxt7PbZW6ua0abdosYexSJLqkt?=
 =?us-ascii?Q?vMyFNO+Xt8En8Yxr1fjqttzmNf9RAH7QRmM2IHlPfKXfQvwwPGJZoHE26U1q?=
 =?us-ascii?Q?Cs1oH9hXNqy6Iqt1X75v+2HsVvyOBfQKDLSsBpm3NbNk97Zhm9e0cH+TlW3U?=
 =?us-ascii?Q?b1Ic4LAHVM5pdUsEFSHerdPmhehQYzJ6LjryrpiO0eVb40XQnMJfw9skTQQv?=
 =?us-ascii?Q?Iq7bF8Dq5iN88UXKnhf5TOqnG2Pe3P1PnopeN3FXGibcVVTB8hipiC5nO/bF?=
 =?us-ascii?Q?mJ0cDaVsOCMzkAeIIP0a98MVTbN8s2eYZy1qhxJqqYvtN0ZM8ratuG0oD9Aw?=
 =?us-ascii?Q?WE1KOg9hmb1d2qyszSvlnINLv9oCKX5DOhdh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:46:29.8847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df1d2cb8-b8cd-478f-85f3-08dde5a26b09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084

From: Vishal Sagar <vishal.sagar@xilinx.com>

This patch fixes the checkpatch message:

CHECK: Alignment should match open parenthesis
+	format->height = clamp_t(unsigned int, fmt->format.height,
+			 XVIP_MIN_HEIGHT, XVIP_MAX_HEIGHT);

Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
Reviewed-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/media/platform/xilinx/xilinx-vip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index fa637a625126..769f29dc7c5c 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -157,7 +157,7 @@ void xvip_set_format_size(struct v4l2_mbus_framefmt *format,
 	format->width = clamp_t(unsigned int, fmt->format.width,
 				XVIP_MIN_WIDTH, XVIP_MAX_WIDTH);
 	format->height = clamp_t(unsigned int, fmt->format.height,
-			 XVIP_MIN_HEIGHT, XVIP_MAX_HEIGHT);
+				 XVIP_MIN_HEIGHT, XVIP_MAX_HEIGHT);
 }
 EXPORT_SYMBOL_GPL(xvip_set_format_size);
 
-- 
2.25.1


