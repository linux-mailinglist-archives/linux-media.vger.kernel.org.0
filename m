Return-Path: <linux-media+bounces-48081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A25BC9B1DD
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 11:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CFC03466A2
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 10:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E27311C07;
	Tue,  2 Dec 2025 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="azMYPUdE"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992FA3115A5;
	Tue,  2 Dec 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764670976; cv=fail; b=RePQki5EtpeF+1YWQtZhhcn0h7d3d2r26meq9bnmIORPJIKnjLuU3iLghqbcWAi9wkLbdrFCnfVyeO+3x01S0RZphb5ukYLdibcDdMrevRU9bzoZReiO3UMSl+AUkEODWBxTZomgtv3nEx7DXpK5o06G0aYGflj6YpUIOgf9eRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764670976; c=relaxed/simple;
	bh=i2nZKl3m/ZX5OVaMkFWbJHGkco+AMG1+YV4UzeVipdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZqi8D7cLpfyQ1gFFDfOxULzrqrrxTbIVDz0QZl23z36TQPPG/okyKkXmuGpjoQWbqe8Vk7RKFqZBS+JxLPZTN+Wdrj107BfUzx5uyN9Yp6QWNK0Gkgw96ELCaI6QIBKtLVaWOB0FLDDvVEmQP/C8lHDeJwG5hX9dYVHbwSOdds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=azMYPUdE; arc=fail smtp.client-ip=52.101.62.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgI1C7Y9IE0x91ib8srh12oP1NQyKv2zISwqo72EhMBfxhVMA2r9DNvjyxuWnTxs0ch0qcLUh9qrJ7we5kNlfioqf7DBrMugQt0Y/00wqPXleTYwSz7UwXX3r9aSxZnkQ1bYd1hRk4kjsfSZc6ObxNk7J3XYxcglZYdDZPqkpCkOT5aVIvtwNd1LFqa03s2ogZmQC6PoqbALIC/U+m1krYpX2KCZ+5twQAwZW5R5B7Wr0u8Oj3D21RJ0bTRB6DuAO6m31aXzej8/4cElPD9IiO9YjZAKiFNPqI9MjGXsiCVq5BH1rzboN+nM7839c7zG9XEVzeA14VgqsdJjmLroCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbEW61FbmCEwv2JsQtz3THp0ZOs+jClWwvDf9FIRpfk=;
 b=k+zjpSNZdZcommPuJfmpBeImeI1WTL9I52V/tx2HyMcGWyGAcCWXPVltYiTxUaNH5c0ylD/J9RqASCiF8GueDip2YkifDiiXzZuVIFBekBdGmFJHn061mLwLdb+9OaG9oYovJZ9FwX1TTk0ZeErBiVDW8o1mi0imsloHXOrg8g8Ps40pjWPHGJ8pKfedH0X13Pd/xSNBfSzl+85uUqAeE0mkSpJyPIFfLLuS+6Yb9y7Z0FJvoOpVKf2e9NiXp5C3rAuKo5wnhlQ0v9JctoDpkHWCVc4aE1rUzeVjLUTqEn/AafH8QrsQ5iHWqzQHyFhzW7MqyakJC8SzCaynkK55TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbEW61FbmCEwv2JsQtz3THp0ZOs+jClWwvDf9FIRpfk=;
 b=azMYPUdElpPr2ZNY63GSRArnqsCUOn/fGu1zfinvbvD1LtclC4n47EoWlIOdttXBdPjOixPjmkvXnhCbhMgc/G/4bxSB8QdT918x6Ny6PhCJfaDNtsSSpkoE7f+cYY3B9hVZElNfU/sQ8bYxUrQI3bjUAmoLBwSFK3Cr4a6HAbk=
Received: from SJ0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:a03:33e::14)
 by BN0PR10MB5189.namprd10.prod.outlook.com (2603:10b6:408:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 10:22:52 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::4) by SJ0PR03CA0039.outlook.office365.com
 (2603:10b6:a03:33e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Tue, 2
 Dec 2025 10:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 10:22:50 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:46 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 04:22:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 04:22:45 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B2AMDKT2072084;
	Tue, 2 Dec 2025 04:22:40 -0600
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
Subject: [PATCH V2 4/4] media: i2c: ds90ub960: Add support for DS90UB954-Q1
Date: Tue, 2 Dec 2025 15:52:08 +0530
Message-ID: <20251202102208.80713-5-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|BN0PR10MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: 164b6365-1b57-4d55-aa71-08de318cbf0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7xgrkiElLnw+VLhBROezTV2dRTpEk88wi9JC1Xz9PxcjCdGs/Hcob7WkSWTZ?=
 =?us-ascii?Q?E5H2Rm/qJgp5vlcEXUt5un11bHo3j6ExRX65meQY6u3GhzkTxO6tLJ31RCnc?=
 =?us-ascii?Q?63JrZ35p25pp0NoHcWmM/p9ZyJc6PFDGi7dllWZvHuic8DA4cgQ4lSuDcxmO?=
 =?us-ascii?Q?La/OdA1Nkoza9TQDHRs2R/7hJhfn+XCarbinQpaeHqSVFRc0pfNf04ZU0Qq7?=
 =?us-ascii?Q?7ivFcL93LlLUhuUA66bBX7hZb3y12X/irGpaaol195qGyV5UfZcWf3bJnCkL?=
 =?us-ascii?Q?ehF7Am9AjyRAfQ1X1JVESVwMcYfz8U/BY6LeEx9kZJw/1PytkEoRm6wrFMHq?=
 =?us-ascii?Q?InzU3H12mXPedT2iEKLiMHqo+sPshxyarR4eQmUkBXHboAOpk6VLTiFxSEu5?=
 =?us-ascii?Q?gnyiGV/1/vwAEMmBfuMDSt3mJ0TcNWEkFVRdqhOPPVkyaQux+CJLk9iQDIEQ?=
 =?us-ascii?Q?J2m1wRWjNSsIWwDpz9ZrsO1zyBFABU+2Jf0flL67HCCyLBU6ywlvlzdosnnD?=
 =?us-ascii?Q?hOYErczZSmbq3Oa/w+K7AgT1amvRRhqstyJ9fZ+xI6SBcNuFg+jtdnvTel87?=
 =?us-ascii?Q?uyNpgkoj6iLWlRbAWpnkZ8n0lGNbVj+hhVRKqU6aSTzqB8JqKe6GK0Xe61UH?=
 =?us-ascii?Q?7blj07JI7S9ypj1HfGuXcer4aabPBkTvV6qUZjBp+0QWTuNdl6VZez4bLnFU?=
 =?us-ascii?Q?mZiV8JN8X0TbXsubYfIBXIL5JOnZugX2aQkwmIlaz89XoDU04ObRUStvVLQP?=
 =?us-ascii?Q?WlH0yRUFYeMMGBfAzQmuRN2FJnGefhy+Xr5U/zdzTrhqqYe/zV5WHDkqng8C?=
 =?us-ascii?Q?o41WCtMjFlZEavs/ChwffJfRRv+jXj/j4QbC074SsJwl9orn79KixZ4w/UaX?=
 =?us-ascii?Q?abNGCoBp+1VFdkYdg6H8INWHMGTEE7vH1MhhuaiDgLyE/qF5kjrMookWwZnL?=
 =?us-ascii?Q?k5feW0477X2k1gLQpK8moT6TLKvQYVaT7QfxdHL2dIXmdV+k8mSjrXUjzxjJ?=
 =?us-ascii?Q?9cBp2ksAXi8ibMMuHonxlvgZPr/vuYSouOe0nthgy4xzbD3fDUfwRuOKXFW2?=
 =?us-ascii?Q?rN0un/H1BY8NioT+XEKB6bEtccxkfRHySFsk1Po1KL2A3kLF+Nk7pKvm6oAe?=
 =?us-ascii?Q?nDtgcGAgvhJZLM/WlcmvHw6uU7nfOOk/LVtIlLhm+aZWq7KiEA9h5DoTZXLD?=
 =?us-ascii?Q?0/ox+DHkVhvh5SrUI6upzlxQ1OaGCIbUr6ihy+IVT8tVYY/KyWq6EcJVxJcO?=
 =?us-ascii?Q?mNS9R1lrKvjwQU3S/RTpDxdJepSlmEytXUnMV9nmlGJ7gZXdgWH1CWZrldzO?=
 =?us-ascii?Q?SnbplYBPmsVejHr1/q8V51V/lW9JSzlfuSieHHkdUu3tLNgVU42fzhVqw054?=
 =?us-ascii?Q?OWOUrl208OoQRmcSjeAfCY23IRGCaIW/JQqjp02qOPIbXfDyPNAEoybbyVQl?=
 =?us-ascii?Q?q9rA0IG6WGvwJNoSeqpD1T1m88S1XPYmItsBu4oilnKzLMyFWK4JdCd2mLJp?=
 =?us-ascii?Q?A4Auiz/En5qaMYH7supbXjAMXd3ZACKcdPWlE6Ko4e6KZh+vexDiXZhiSqU4?=
 =?us-ascii?Q?/ZwmE3fYRvsxjo3Pf5T1Kq7S9UmQX3q1Z9x+qLzm?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 10:22:50.2292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 164b6365-1b57-4d55-aa71-08de318cbf0a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5189

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports half
of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX port.

A couple of differences are between the status registers and the
strobe setting registers. Hence accommodate these differences in
the UB960 driver so that we can reuse a large part of the existing code.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Refer table 5.2.1 STROBE_SET Register in [1] for DS90UB954 strobe
setting register.

[1]: https://www.ti.com/lit/an/snla301/snla301.pdf

 drivers/media/i2c/Kconfig     |   4 +-
 drivers/media/i2c/ds90ub960.c | 165 +++++++++++++++++++++++++---------
 2 files changed, 125 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 745819c625d6..52104f76e371 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1703,8 +1703,8 @@ config VIDEO_DS90UB960
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	help
-	  Device driver for the Texas Instruments DS90UB960
-	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
+	  Device driver for the Texas Instruments DS90UB954, DS90UB960
+	  FPD-Link III Deserializers and DS90UB9702 FPD-Link IV Deserializer.
 
 config VIDEO_MAX96714
 	tristate "Maxim MAX96714 GMSL2 deserializer"
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 45494fcaf095..7d3e5a87bb17 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -396,6 +396,12 @@
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
 
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_DATA		0x08
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(7)
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(4, 6)
+
 /* UB9702 Registers */
 
 #define UB9702_SR_CSI_EXCLUSIVE_FWD2		0x3c
@@ -455,6 +461,7 @@
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
 enum chip_type {
+	UB954,
 	UB960,
 	UB9702,
 };
@@ -1000,6 +1007,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
 
 	lockdep_assert_held(&priv->reg_lock);
 
+	/* UB954 has only 1 CSI TX. Hence, no need to select */
+	if (priv->hw_data->chip_type == UB954)
+		return 0;
+
 	if (priv->reg_current.txport == nport)
 		return 0;
 
@@ -1424,10 +1435,11 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 	priv->tx_link_freq[0] = vep.link_frequencies[0];
 	priv->tx_data_rate = priv->tx_link_freq[0] * 2;
 
-	if (priv->tx_data_rate != MHZ(1600) &&
-	    priv->tx_data_rate != MHZ(1200) &&
-	    priv->tx_data_rate != MHZ(800) &&
-	    priv->tx_data_rate != MHZ(400)) {
+	if ((priv->tx_data_rate != MHZ(1600) &&
+	     priv->tx_data_rate != MHZ(1200) &&
+	     priv->tx_data_rate != MHZ(800) &&
+	     priv->tx_data_rate != MHZ(400)) ||
+	     (priv->hw_data->chip_type == UB954 && priv->tx_data_rate == MHZ(1200))) {
 		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
 		ret = -EINVAL;
 		goto err_free_vep;
@@ -1551,22 +1563,44 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 	u8 clk_delay, data_delay;
 	int ret;
 
-	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
-	if (ret)
-		return ret;
+	/*
+	 * DS90UB960 has two separate registers for clk and data delay whereas
+	 * DS90UB954 has a single combined register. Hence read accordingly
+	 */
+	if (priv->hw_data->chip_type == UB954) {
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, &v, NULL);
+		if (ret)
+			return ret;
 
-	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
-			    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
+		clk_delay = (v & UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
+			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
-	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
-	if (ret)
-		return ret;
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, &v, NULL);
+		if (ret)
+			return ret;
+
+		data_delay = (v & UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
+			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
+	} else {
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
+		if (ret)
+			return ret;
 
-	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
+		clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
 			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
 
+		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
+		if (ret)
+			return ret;
+
+		data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
+			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
+	}
+
 	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v, NULL);
 	if (ret)
 		return ret;
@@ -1590,8 +1624,17 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 	u8 clk_delay, data_delay;
 	int ret = 0;
 
-	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
-	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+	/*
+	 * DS90UB960 has two separate registers for clk and data delay whereas
+	 * DS90UB954 has a single combined register. Hence assign accordingly.
+	 */
+	if (priv->hw_data->chip_type == UB954) {
+		clk_delay = UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		data_delay = UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+	} else {
+		clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+	}
 
 	if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
 		clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
@@ -1602,11 +1645,25 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 	else if (strobe_pos > 0)
 		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
 
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
-
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
+	/*
+	 * DS90UB960 has two separate registers for clk and data delay whereas
+	 * DS90UB954 has a single combined register. Hence write the registers accordingly.
+	 */
+	if (priv->hw_data->chip_type == UB954) {
+		ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
+				      UB954_IR_RX_ANA_STROBE_SET_CLK_DATA,
+				      UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY,
+				      clk_delay, &ret);
+		ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
+				      UB954_IR_RX_ANA_STROBE_SET_CLK_DATA,
+				      UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY,
+				      data_delay, &ret);
+	} else {
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
+	}
 
 	return ret;
 }
@@ -4176,33 +4233,40 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
 			 v & (u8)BIT(0));
 
-		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+		/*
+		 * Frame counter, frame error counter, line counter and line error counter
+		 * registers are marked as reserved in the UB954 datasheet. Hence restrict
+		 * the following register reads only for UB960 and UB9702.
+		 */
+		if (priv->hw_data->chip_type != UB954) {
+			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tframe counter %u\n", v16);
+			dev_info(dev, "\tframe counter %u\n", v16);
 
-		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tframe error counter %u\n", v16);
+			dev_info(dev, "\tframe error counter %u\n", v16);
 
-		ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+			ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tline counter %u\n", v16);
+			dev_info(dev, "\tline counter %u\n", v16);
 
-		ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
-				   &v16, NULL);
-		if (ret)
-			return ret;
+			ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
+					   &v16, NULL);
+			if (ret)
+				return ret;
 
-		dev_info(dev, "\tline error counter %u\n", v16);
+			dev_info(dev, "\tline error counter %u\n", v16);
+		}
 	}
 
 	for_each_rxport(priv, it) {
@@ -5023,6 +5087,9 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	}
 
 	switch (priv->hw_data->chip_type) {
+	case UB954:
+		model = "UB954";
+		break;
 	case UB960:
 		model = "UB960";
 		break;
@@ -5039,6 +5106,11 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
+	/*
+	 * UB954 REFCLK_FREQ is not synchronized, so multiple reads are recommended
+	 * by the datasheet. However, we use the same logic as UB960 (single read),
+	 * as practical testing showed this is sufficient and stable for UB954 as well.
+	 */
 	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
@@ -5198,6 +5270,13 @@ static void ub960_remove(struct i2c_client *client)
 	mutex_destroy(&priv->reg_lock);
 }
 
+static const struct ub960_hw_data ds90ub954_hw = {
+	.chip_type = UB954,
+	.chip_family = FAMILY_FPD3,
+	.num_rxports = 2,
+	.num_txports = 1,
+};
+
 static const struct ub960_hw_data ds90ub960_hw = {
 	.chip_type = UB960,
 	.chip_family = FAMILY_FPD3,
@@ -5213,6 +5292,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
+	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
 	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
 	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
 	{}
@@ -5220,6 +5300,7 @@ static const struct i2c_device_id ub960_id[] = {
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
 static const struct of_device_id ub960_dt_ids[] = {
+	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
 	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
 	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
 	{}
-- 
2.34.1


