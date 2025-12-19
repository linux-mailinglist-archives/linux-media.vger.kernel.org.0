Return-Path: <linux-media+bounces-49167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F25CCFD14
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2E463060DFF
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D2A33A03D;
	Fri, 19 Dec 2025 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wgc+DMeE"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C7337B9C;
	Fri, 19 Dec 2025 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766147439; cv=fail; b=ACE9E66sr6tfpHQVKhL3EqsHc0vPMq6NP/Jed6Hk3jd5xvDAfJV9RBy77+jmRI84bGiEHevu6BFZGVZabe6cI17RGr6jW8AnGLB88aUC0z/clFhLjKpqC7MYpw/r7bgZEJbR/MWkFqewFbQh0zsP/NmZWaEmW3vSmO+lNuYAt7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766147439; c=relaxed/simple;
	bh=0MdL1RfgvPZtZ8weGjKIy+5KcWipVLduH4XZkD1xgFM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkYdCCkQBIEo/Xp3TvvIVul3GK9Gymxc16ivpgrVuCmyExGWl3MzW1sFtbVYIp2XsoOxXDaFUR5GcPTXn4DJcxpPgUbWeN2o0MTXAMmysqICFP5LwZDMFV5cO8n5dsrQq+bhmkW0gysPpduaO+VqoLEJt1u18HKnhVNuByDbj5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wgc+DMeE; arc=fail smtp.client-ip=52.101.53.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaCvSUICqNFbSm4w/n9lRu/xOu5F3HaubdeYix47PGC63AMLhUtCmIIdlslnIDNRSTTNs0x0vwLhGiTj2oNoDZrZ4WDF2Bqyqm7QpvOLSAWvnIO4aAc6sCOgKAuB4JowwVzigbT+lUMADTh2zaOD/1q+9DS/jPlOiNI/QZYLOdvq9EC7JqjtI6PuXbvmupJpITj+F4x7a4VrP5zQyut4u4vT30BGCAxf42iNgAzBVVNNHYQ9ddOFaZGvPihibBmF4OSYam+T2HBPGydJWrjNppwnynp0tlJT2WBokvufgNLrNBMgFvd9eyjVk80yEc9i08oIPs2EhaIgYBTZohOpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HorchUQ7EX5HGi6Ki123MuqrJ1+XMKjtroelZgmhzuI=;
 b=zFrXJ7mcIhyDRpPKG9ke+MwA33MajVYQHtonQbGXi6dyKVhguCNS5fHuO/H7Z95+j4bJS7Rz7xcdzQouMJ9BctgPKEQoMnwGQQgqMhRdluGJ4Bx/8J4jDKe9cxztQHfFJXKsbw26xYAiWYtZ+KVyRAKtGzyGPYBKRjPv9rErlVv6mHm8c4erbdhgCtEHEWEbY+LbgowvJIUuppw1ZsP9elGAQmDkhlmc4xnwKhAAvSWDm0qiuuJHPHrm8W0quRRjlosLCeA1Lf701K+L3VJA5Hrxm6twY5Ls0Jd0P7YzeqqPUAHAN1VaB5DWeafNEojOjPouII+LplbLU3ANlz7aAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HorchUQ7EX5HGi6Ki123MuqrJ1+XMKjtroelZgmhzuI=;
 b=wgc+DMeEo39LED6Ve9rhz6L/QEUj9RSxu+tcXHIwpmKOVOTpTjUD17c5+3kh41xolWL9leNpkst2GdbdLPK1uLYEHYJeuM0vPR+62GR8mHEfUDnLrH5XexqaB9G4/ieVihtiAU6oI+FxI/tUhzDpPM509gkLf591cABPbqnmLp4=
Received: from BY5PR16CA0002.namprd16.prod.outlook.com (2603:10b6:a03:1a0::15)
 by IA1PR10MB6049.namprd10.prod.outlook.com (2603:10b6:208:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:30:34 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::10) by BY5PR16CA0002.outlook.office365.com
 (2603:10b6:a03:1a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 12:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 12:30:33 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:30 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 06:30:30 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 06:30:30 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJCTuJn918224;
	Fri, 19 Dec 2025 06:30:25 -0600
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
Subject: [PATCH V3 4/4] media: i2c: ds90ub960: Add support for DS90UB954-Q1
Date: Fri, 19 Dec 2025 17:59:55 +0530
Message-ID: <20251219122955.2078270-5-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|IA1PR10MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: f324dd02-3fbf-4f2a-7900-08de3efa6776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y3WZGw+Qyepp2Pum9+VENOQpwUE0wxxL7eH3RrfNt16bDJxNEpZuLYt5YjGF?=
 =?us-ascii?Q?ukNVnvZM/y01cV1skwpgSb7oDDlICybrQ5Kx9Cnh4XQHeXcLQfzpZUaxqoBp?=
 =?us-ascii?Q?9Crwp/rm8Gwy4GVwLJpzL5zOzn8dNJjl6F2Gq1DAi3A7I1Bne7+SaCMi0TG5?=
 =?us-ascii?Q?qGYW4l0nADC3h/j5YI+mYAROO2DiyUUcfA9ppAOkL/OtGQezOfuUXxYyL6PS?=
 =?us-ascii?Q?kTONncGYIhA4Dc/zjDwbjLdZuOHdpkMAuUXDMJn00gqR7FOpOQCqcnDDjn1G?=
 =?us-ascii?Q?4/bTxbl+f7xydh/gHYIV9CHLyvfPZk71/xl48ihcP+1iWYnQ+Vqssjo2eftQ?=
 =?us-ascii?Q?QLUX5rIXbtmYuiKXFHWtXO28Ga6dUZf2+N74cr3jWxN5jLNT3DufR7AInDM9?=
 =?us-ascii?Q?57pwa4i4cSswzhkDardpkOPEZxDTnibXggEIPCDpq6ZzkVwhTprmQETaYN5C?=
 =?us-ascii?Q?+IHJZM9Pu/ByFQUJk57lgiXAsULe227POIm4Z12OdDRW43OZooOR8FnnNP5W?=
 =?us-ascii?Q?FZ+bi3T5pKrEnnV9WwNQcZBii51R/VTGrX9NB8cRJdeLd81aIQFqyiVLSYzR?=
 =?us-ascii?Q?VpO/jcouBQCLzBqc7lutDHn8fD/Dwwgjwk/OIqTGCNFOanDJZIdbuC4PCSHY?=
 =?us-ascii?Q?w1wgtBwLtn30IdvD74h34bXzwfe++DF/zs9cePsZgjfXISJ6jt7kdKH01f20?=
 =?us-ascii?Q?0j7AkJE3ayGS7D4/aCBDGbxC9/bh2NsM0EYdhlQVm7TEjrPBeyIjfXQzh405?=
 =?us-ascii?Q?Nro6mbqoz691OETx6S7BN/KryUXFAsv3CMJG/gotMM9+/4b36XsKVL0YUb17?=
 =?us-ascii?Q?1RVTnVW27GMknk25qUFcE+RtGB4fkLR8IMig3Xpsp8zUSjgEfettlCLQFAG9?=
 =?us-ascii?Q?Evstn2Mx8MMZtEXMrdV0jN0YQEQytmeaeuTObm4WxeRckG4vYFJV3rvANTTe?=
 =?us-ascii?Q?fzGShPPcVuYiADUtXetZsi3IK0Ck9bKLueXl6Zo3n2z01wyWIpMyYtgd4+Pj?=
 =?us-ascii?Q?yaouVgzImyS3eB1ATV9atJJfGfNtsgkGLPKhWCy9uc/iq0vWZvOcc4AF89uc?=
 =?us-ascii?Q?u7LM6SK1muGWDgeFmS3NR9xp4NidA530diezhgWrIy7omHj+wxeHXG+aqvQY?=
 =?us-ascii?Q?TXJuYJ6A1UPDAzfoWKmkbC+v6P4s8ES9BzBUCRSF3m0vLRnQatkXG1fG55II?=
 =?us-ascii?Q?YDcHBLCG35dLK3Ju1xaiEyVgi86QZelAljD3V6V6/knyzmNr5X/JM2vg9el9?=
 =?us-ascii?Q?6soB/cmzAmWXXIsBKdGbAATOCLkKMgegNk3ZRqjMzxt3sC3uDlDbBcCMuio4?=
 =?us-ascii?Q?CZj1LzK6NJEcsmHE/ngga2/pxFKZHIGKHF5MICBqMQFHVWU5tJUESJZJ6k6x?=
 =?us-ascii?Q?7YynBcQpxNkJVqnJ2qQJ87Il8Rseq3fM1I8sdTTp0JF8V+VCv26EQZ6/ph2S?=
 =?us-ascii?Q?6ezgLkuG6VinEhgyfV5Slxj5/SfGkY1vC1ZG40YOu+/IUP68BE9dK9V0H+2H?=
 =?us-ascii?Q?soYJ+wIFjS5yFtN2waCnZ2s/xoOh1aR68yDkfaySsS8F1dlY2igTBJoNDEii?=
 =?us-ascii?Q?MBDjKyR3yttNoPPs0BM=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:30:33.0410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f324dd02-3fbf-4f2a-7900-08de3efa6776
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6049

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports half
of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX port.

A couple of differences are between the status registers and the
strobe setting registers. Hence accommodate these differences in
the UB960 driver so that we can reuse a large part of the existing code.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Remove redundant reads and writes to the same register. (Tomi)
- Correct the bit positions for data delay in set_strobe_pos for UB954. (Tomi)
- Address a few minor nitpicks in code comments. (Tomi)

 drivers/media/i2c/Kconfig     |   4 +-
 drivers/media/i2c/ds90ub960.c | 182 ++++++++++++++++++++++++----------
 2 files changed, 129 insertions(+), 57 deletions(-)

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
index bb453d39e0c1..0b8280e88bd8 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -396,6 +396,13 @@
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
 #define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
 
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_DATA		0x08
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(7)
+#define UB954_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(4, 6)
+#define UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_SHIFT	4
+
 /* UB9702 Registers */
 
 #define UB9702_SR_CSI_EXCLUSIVE_FWD2		0x3c
@@ -455,6 +462,7 @@
 #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
 
 enum chip_type {
+	UB954,
 	UB960,
 	UB9702,
 };
@@ -1001,6 +1009,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
 
 	lockdep_assert_held(&priv->reg_lock);
 
+	/* UB954 has only 1 CSI TX. Hence, no need to select */
+	if (priv->hw_data->chip_type == UB954)
+		return 0;
+
 	if (priv->reg_current.txport == nport)
 		return 0;
 
@@ -1425,10 +1437,11 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
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
@@ -1552,22 +1565,35 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 	u8 clk_delay, data_delay;
 	int ret;
 
-	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
-	if (ret)
-		return ret;
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
@@ -1588,26 +1614,49 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
 static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
 				       unsigned int nport, s8 strobe_pos)
 {
-	u8 clk_delay, data_delay;
 	int ret = 0;
 
-	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
-	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
-
-	if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
-		clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
-	else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
-		data_delay = strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY;
-	else if (strobe_pos < 0)
-		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
-	else if (strobe_pos > 0)
-		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
-
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
-
-	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
-			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
+	if (priv->hw_data->chip_type == UB954) {
+		u8 clk_data_delay;
+
+		clk_data_delay = UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY |
+				 UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+
+		if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
+			clk_data_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
+		else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
+			clk_data_delay = (strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY) <<
+					  UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_SHIFT;
+		else if (strobe_pos < 0)
+			clk_data_delay = abs(strobe_pos) |
+					 UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		else if (strobe_pos > 0)
+			clk_data_delay = (strobe_pos |
+					  UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) <<
+					  UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_SHIFT;
+
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, clk_data_delay, &ret);
+	} else {
+		u8 clk_delay, data_delay;
+
+		clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+
+		if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
+			clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
+		else if (strobe_pos > UB960_MAX_AEQ_STROBE_POS)
+			data_delay = strobe_pos - UB960_MANUAL_STROBE_EXTRA_DELAY;
+		else if (strobe_pos < 0)
+			clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
+		else if (strobe_pos > 0)
+			data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
+
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
+		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
+				UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
+	}
 
 	return ret;
 }
@@ -3643,7 +3692,8 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 		case RXPORT_MODE_CSI2_SYNC:
 		case RXPORT_MODE_CSI2_NONSYNC:
-			if (priv->hw_data->chip_type == UB960) {
+			if (priv->hw_data->chip_type == UB960 ||
+			    priv->hw_data->chip_type == UB954) {
 				/* Map all VCs from this port to the same VC */
 				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
 						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
@@ -4177,33 +4227,40 @@ static int ub960_log_status(struct v4l2_subdev *sd)
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
+		if (priv->hw_data->chip_type == UB960 || priv->hw_data->chip_type == UB9702) {
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
@@ -4269,7 +4326,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
 
 		dev_info(dev, "\tcsi_err_counter %u\n", v);
 
-		if (priv->hw_data->chip_type == UB960) {
+		if (priv->hw_data->chip_type == UB960 || priv->hw_data->chip_type == UB954) {
 			ret = ub960_log_status_ub960_sp_eq(priv, nport);
 			if (ret)
 				return ret;
@@ -5029,6 +5086,11 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
 	if (ret)
 		goto err_pd_gpio;
 
+	/*
+	 * UB954 REFCLK_FREQ is not synchronized, so multiple reads are recommended
+	 * by the datasheet. However, a single read is practically seen to be
+	 * sufficient and moreover it is only used for a debug print.
+	 */
 	if (priv->hw_data->chip_type == UB9702)
 		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
 				 NULL);
@@ -5188,6 +5250,14 @@ static void ub960_remove(struct i2c_client *client)
 	mutex_destroy(&priv->reg_lock);
 }
 
+static const struct ub960_hw_data ds90ub954_hw = {
+	.model = "ub954",
+	.chip_type = UB954,
+	.chip_family = FAMILY_FPD3,
+	.num_rxports = 2,
+	.num_txports = 1,
+};
+
 static const struct ub960_hw_data ds90ub960_hw = {
 	.model = "ub960",
 	.chip_type = UB960,
@@ -5205,6 +5275,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
 };
 
 static const struct i2c_device_id ub960_id[] = {
+	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
 	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
 	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
 	{}
@@ -5212,6 +5283,7 @@ static const struct i2c_device_id ub960_id[] = {
 MODULE_DEVICE_TABLE(i2c, ub960_id);
 
 static const struct of_device_id ub960_dt_ids[] = {
+	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
 	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
 	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
 	{}
-- 
2.34.1


