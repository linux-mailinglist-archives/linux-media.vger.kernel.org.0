Return-Path: <linux-media+bounces-48079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB98C9B1F4
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 11:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0C43A7911
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 10:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1855E30FC29;
	Tue,  2 Dec 2025 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gQVdPqvP"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010068.outbound.protection.outlook.com [52.101.193.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D921E9B3D;
	Tue,  2 Dec 2025 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670958; cv=fail; b=MalLj+e5MUxiPe5oaCVYMSeSk5GzcLh8KioNIu1AHryVgWuo7aZf58rndf461vBajhpCkgoAv9ZHukVUOuj//5BS+WWCPYJWqDUi+KNoGS/jmuVBTRxQUx86T5kl3AvCVe31cUm0cYHvj4hK4K5TslsRQy8B7botzfMbn1thvAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670958; c=relaxed/simple;
	bh=THcEYAmAG/drnieimkgK7u1QyZSu2e5E4YBbcW9uRXg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LprrkbjgZZJ1L3MJjbFzy8m2fP+p70I7YXUu/wrj9p9bw96Jt79N7ETKSG43pPxD/17kdWY0wYgMWE9nQaLbCoHno/2q0wZvmZHotrlbuqpG7n/0rhKF43vzq5AFYwJJIePV5thhN57eesgypNgGX98h2U6l+jITX7ZbfizBoQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gQVdPqvP; arc=fail smtp.client-ip=52.101.193.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNLp7k+Rs+pcwLFjfYudOenMOhYKNEElZis9WenOBkVF0V8IIBHgep3fzLoURpW6llj0VkG25qwpY2SlgPT2RNZUuFWVp+30Ckh8PohT3xYJ+/4gQ11g8WoBT5/dZgEie38nW1b61jQNQD5E91tzURRYWRyWO6wCkMiAovp+XPm0umMsZBet20x1KtInSI8KZh3DG2tcGSF6Zge4cR8i9A6iL2451KcW8QjDeMie8e7Bf+k2JX10GRk546TLJl7HR+dDSbRw0fUcq1qT4ZY0D2NccT0sLfOV/tqpkZaeKbaIwKfXeCABJBscMsrW/ZIzCpnPAlmpR9CAF7XrhEwTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtjVXxuR4bKM+KO6lYItSXrXKDiFZ/AoeZIeI0XJt08=;
 b=mkk8375d7+tHZl3o+xPeRsIIc6crCXNN9rvBgcsvikeH74dO7SO8cPeKW9cAAtcO1MTrqPREj/fIZufWoBlApTI6bTMDGQkLXjIJU4NgZ3ya1pAcelkqWYSMmvfYJwu8jE3xBm5TcdR11gncEjsN21GkdH7PQOGx6Uh7aisHrhB2HbC4nIA86KkbLy3lNf81ydxNNizf7BcsdtNd0NrBFCTOiP969jv8ZSUSXK8XW2VtkPRv1hBfeMSyPuA3hpM+NMAYcR3vjoX1YyxSS2YR+NTG05WpvJzcmG2l/0z9WbObKtv3SQdYGEIt+cYOJv+Pioc2hSjLKokUYFpZu2JOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtjVXxuR4bKM+KO6lYItSXrXKDiFZ/AoeZIeI0XJt08=;
 b=gQVdPqvPRF4yDrcFGd06cFCLVnj7kJBcwz7xQyNdNvL+1C0vxYwzhVlt+gCC26ltLwRSjmWYirjw2j+rpGlZ4S21r1v5ebQaVQJamWUqjWcADD5A90zA3pCPqsSGSMJUJPGV1kpIgJQY/J2bC8ve1LNee2xJJUfE2MMty8AgiKA=
Received: from CH2PR20CA0006.namprd20.prod.outlook.com (2603:10b6:610:58::16)
 by BN0PR10MB5062.namprd10.prod.outlook.com (2603:10b6:408:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 10:22:34 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::2b) by CH2PR20CA0006.outlook.office365.com
 (2603:10b6:610:58::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 10:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:22:34 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:33 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 04:22:32 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2AMDKR2072084;
	Tue, 2 Dec 2025 04:22:27 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<y-abhilashchandra@ti.com>
Subject: [PATCH V2 2/4] media: i2c: ds90ub960: Use enums for chip type and chip family
Date: Tue, 2 Dec 2025 15:52:06 +0530
Message-ID: <20251202102208.80713-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202102208.80713-1-y-abhilashchandra@ti.com>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|BN0PR10MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbb52ae-195c-4c60-d997-08de318cb577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FnhF1Ux7P81gUQZqWTy22rTY7bBgAxBtZe6dxhYT7qorAE1llgf54APPXIrI?=
 =?us-ascii?Q?KUgxZIxT+gPEuDrK6JzqHGPLmlepOWFnfO3lL+mnahLMlWY/z0biD8eSD85A?=
 =?us-ascii?Q?xx7+t4g6fQjCKbNIAsGesF2BhXgq9yCyRbSwWgjB0Hd0UsuWjveNaZ2AgJzG?=
 =?us-ascii?Q?2gmwS+fWW2CF/7tJHKM8LpR2I5K3ZoW7jtY4xxYxlTj2FPMu8kaKSCi+6EN/?=
 =?us-ascii?Q?tR8TAUNWpxrEmJeOYoYts4xWP+Z/UzMQKyEwkdvb2qmGrct0k8mdZAQW1upr?=
 =?us-ascii?Q?+8q6GbWOORh8cZ3n3DEtTobrZMFOOzLTU4sow294wZrUk90ucs6AAM6y3xRI?=
 =?us-ascii?Q?r5JI8bLlNzUZU8oqcpx+5kdjQKFO3rKl1YS7ly8egmDruCuYhK/DM+Fas+iM?=
 =?us-ascii?Q?7928zGH4xBpbbf9R/0YaF494EHOGqPyxyw6/jhBrPTs+z6x1NpfHlG/YuSnB?=
 =?us-ascii?Q?f91zzTcRh0J7hWuTXugYmrpKpmcM6mQJWz74mLQU/DrbNv4mA70O4YCXKhs3?=
 =?us-ascii?Q?12agcYTCNzuoQJC3bZDNenP/HpiX/L2n7pIDbGBhLpdk0Rqrjw3Q9kC3JLC3?=
 =?us-ascii?Q?7yWIfKYtixt2N9atVwzki4/dJrFoeEspGzKz4HerAV1iMLto9pq6Q+VAkrKm?=
 =?us-ascii?Q?wFrfLgR8Yy91EwiVTzXYGJNabQhkckMdLdQXRnHTldAMI5qHALWWT7bhTTMu?=
 =?us-ascii?Q?2I5XtXCDHBOjIwa6u3ga/Njbd8zmn3o5w39k0ClRbW8ReH7HXEWRkjzDGxeT?=
 =?us-ascii?Q?rNFr7io/5ieIfDMDu5cJX+RNf9xp7CtjgI7LNtI5x4Tl3mOdiM8lexnjoxOn?=
 =?us-ascii?Q?1TfUtlOYi/AEmD817XauCyghAu1uiaRv8c9phxQNjiOQqkE8hxJuz15WIXIJ?=
 =?us-ascii?Q?2T5w3uuWhKKgsH9wNmpK8mITLSyBdLnv6IgDciQ25BspmQ9MJBrmgxEB1pTY?=
 =?us-ascii?Q?QGWQFLB2gljMSQRAbwM8Gp9km4msl6G3jAY3c3wfJXr5W/X3oK51pXzdiwEE?=
 =?us-ascii?Q?GzhG/WXEIE4vpMpU2952Xxxjl2tnv+PSigvnx8wsj7Ad4iIJxLSJK2sER9P+?=
 =?us-ascii?Q?A/bUj8obeaw19uPWTUnT0UsMlBdGOp6m2Cn+f2VoJuVhzswrrW5N3OBB5tcB?=
 =?us-ascii?Q?x7EgDxQdekDn0e44skjuCCnb/GNM1hF8a2MfR5/hQ7dhXM1T7L/LNqyMaOPU?=
 =?us-ascii?Q?Ycc+tz53FSo0Ns3ZfASIfOgQnBUjz/7kaY8LPriEKBBiWNnjY+IvL2PpmLOS?=
 =?us-ascii?Q?FG7Xxu2fhUTv5DzyPTwqPBQQZh6nZwA8jDjJmGt1IvXr7K65h6mMRYbgwhCT?=
 =?us-ascii?Q?ZOr4YpwGTW4iFoYSvWTjGQqz+zpTdrBTQeNQEvfoDmgfc1Yu3gSwvmtg4dhV?=
 =?us-ascii?Q?rFroe6WAwLMDR6RVCnWmQze/9iE7GLEnMwZxdmlANn3hz10DcXwvRzu8lQFu?=
 =?us-ascii?Q?Bagw9pM+EVPziuK4I4ZGp+EY+TFlhKcyb8rBhxEltpGGNMlA5Pcb1d5InFJe?=
 =?us-ascii?Q?DIBZC11b0C/NkEo0MfvU96larzhGfxS3zKl79FC9IxUf7PYJs6xmkahPv8Jd?=
 =?us-ascii?Q?plDPwTIrdh//23CRMoE=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:22:34.2436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbb52ae-195c-4c60-d997-08de318cb577
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5062

Replace chip-specific boolean flags with chip_type and chip_family enums.
This simplifies the process of adding support for newer devices and also
improves code readability.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/i2c/ds90ub960.c | 56 ++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 5a83218e64ab..45494fcaf095 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -454,12 +454,21 @@
 #define UB960_MAX_EQ_LEVEL  14
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
+enum chip_type {
+	UB960,
+	UB9702,
+};
+
+enum chip_family {
+	FAMILY_FPD3,
+	FAMILY_FPD4,
+};
+
 struct ub960_hw_data {
-	const char *model;
+	enum chip_type chip_type;
+	enum chip_family chip_family;
 	u8 num_rxports;
 	u8 num_txports;
-	bool is_ub9702;
-	bool is_fpdlink4;
 };
 
 enum ub960_rxport_mode {
@@ -1933,7 +1942,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (ret)
 			return ret;
 
-		if (priv->hw_data->is_ub9702) {
+		if (priv->hw_data->chip_type == UB9702) {
 			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
 				nport, ((u64)v * HZ_PER_MHZ) >> 8);
 		} else {
@@ -2195,7 +2204,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
 
 	ser_pdata->port = nport;
 	ser_pdata->atr = priv->atr;
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
 	else
 		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
@@ -2361,7 +2370,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
 {
 	int ret;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_init_tx_ports_ub9702(priv);
 	else
 		ret = ub960_init_tx_ports_ub960(priv);
@@ -3633,7 +3642,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (!priv->hw_data->is_ub9702) {
+			if (priv->hw_data->chip_type != UB9702) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
@@ -4259,7 +4268,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
-		if (!priv->hw_data->is_ub9702) {
+		if (priv->hw_data->chip_type != UB9702) {
 			ret = ub960_log_status_ub960_sp_eq(priv, nport);
 			if (ret)
 				return ret;
@@ -4417,7 +4426,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
 		return -EINVAL;
 	}
 
-	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
+	if (priv->hw_data->chip_family != FAMILY_FPD4 && cdr_mode == RXPORT_CDR_FPD4) {
 		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
 		return -EINVAL;
 	}
@@ -4976,6 +4985,7 @@ static int ub960_get_hw_resources(struct ub960_data *priv)
 static int ub960_enable_core_hw(struct ub960_data *priv)
 {
 	struct device *dev = &priv->client->dev;
+	const char *model;
 	u8 rev_mask;
 	int ret;
 	u8 dev_sts;
@@ -5012,14 +5022,24 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		goto err_pd_gpio;
 	}
 
-	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
-		rev_mask);
+	switch (priv->hw_data->chip_type) {
+	case UB960:
+		model = "UB960";
+		break;
+	case UB9702:
+		model = "Ub9702";
+		break;
+	default:
+		model = "Unknown";
+		break;
+	}
+	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", model, rev_mask);
 
 	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts, NULL);
 	if (ret)
 		goto err_pd_gpio;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
 	else
@@ -5038,7 +5058,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 		goto err_pd_gpio;
 
 	/* release GPIO lock */
-	if (priv->hw_data->is_ub9702) {
+	if (priv->hw_data->chip_type == UB9702) {
 		ret = ub960_update_bits(priv, UB960_SR_RESET,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
 					UB960_SR_RESET_GPIO_LOCK_RELEASE,
@@ -5111,7 +5131,7 @@ static int ub960_probe(struct i2c_client *client)
 	if (ret)
 		goto err_free_ports;
 
-	if (priv->hw_data->is_ub9702)
+	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_init_rx_ports_ub9702(priv);
 	else
 		ret = ub960_init_rx_ports_ub960(priv);
@@ -5179,17 +5199,17 @@ static void ub960_remove(struct i2c_client *client)
 }
 
 static const struct ub960_hw_data ds90ub960_hw = {
-	.model = "ub960",
+	.chip_type = UB960,
+	.chip_family = FAMILY_FPD3,
 	.num_rxports = 4,
 	.num_txports = 2,
 };
 
 static const struct ub960_hw_data ds90ub9702_hw = {
-	.model = "ub9702",
+	.chip_type = UB9702,
+	.chip_family = FAMILY_FPD4,
 	.num_rxports = 4,
 	.num_txports = 2,
-	.is_ub9702 = true,
-	.is_fpdlink4 = true,
 };
 
 static const struct i2c_device_id ub960_id[] = {
-- 
2.34.1


