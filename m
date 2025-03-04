Return-Path: <linux-media+bounces-27453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D73A4DB06
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3EA6188D130
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3677B200BA3;
	Tue,  4 Mar 2025 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="qBkaOxmO"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E401FE479;
	Tue,  4 Mar 2025 10:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084678; cv=fail; b=J/bS1pr7IXN7W8033dBdG1Zm+LIggU/wlNkJT45tGLpbN5i2Y2940xdnEyfFZgKxwizGvuGh7JyTzPn9GJFI2pVkRv/dZc0lO6//A0JixJwBL9EGYFuV6EoNnmMwm6X0n9MbrTZmSv88BrVFM+6EWsf0d+jwriqTeiWY0P5YCBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084678; c=relaxed/simple;
	bh=JDyjTuUtmBrknHl67BapgfVeza/o7HEhSsMyml9s780=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LjkR6f8j8KNg/XKWTKG10HHSnvEWixYUW1dZFZAcO8WooJ9Sbk1HVOLA+0VtsZNq0z3QEglhNkYMfN0UUrb08GehsK2nhlYh6+AVEcPRgD8U18KpNkXrHZopjyAxOH7NSco3C8QdScZYGTXadxt5t2o8ImMU8xE1df7MQgo/Ou0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=qBkaOxmO; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc051Xi2sr95imNnAwFZBA5AfgvabfyZPipxWBVvzydWcCvzigv99LGdP802wh+0WyFvp3RbkOZHjtqlVGWbzNTMszX0IA/rTJ51klykWAhhCMdvbjqK5pfUv3/gvLmMCiIVhi8/sg3eOnTscu2pAGfIV2io+90J2HBiLyW6GX2QopL97crBV/weqVwc5PJLlJBbGC3BwsUgRh3kyDJkkqA1InpuTrRoy3IfsMn3+x66D7FsYLH4qLzFaBOXSfuDAYC1VdGElzu8K9EJnEzWEYVvbdF0pX/BQhKYGh2xgDZkWnqgCNk7Ka00bvvNhWmN73X4xXr9gNkjB8Z+zqWEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1IXGsz+W3YQlgdefjKpJElb9gHzoOTFEwPIJflJ51Y=;
 b=HhLBjT1JgqBh4YYHJYHT0MWnm0fCFX2oj7NAL+gP8/81MVI76BzQu6uzGSPxs7KHC5Msh0tvQGf6NZgm/BbEioFb+mq058Nm9TH/6H3REn572dNQpe1N0iexWV+17h0J1dqPpJPznLAEA/4Ne1z56XXsDIMeu4U3Mkkt8MtH3l+4sr8tCNHPENQKouk7LDC/hK+uUAXdURdO+sh34+wMc70O6lXbo1K58CC3dUc7+v1s9Ibv5OGcJ89Li7U5Bxp/MDw6f4cYSSfNMtpu6f1dpUjeRL4/Cqs7ib0kfal2StqittZER+4I7lUsuTOY08yty2E0IizQ8Lsdfz0v7kKk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1IXGsz+W3YQlgdefjKpJElb9gHzoOTFEwPIJflJ51Y=;
 b=qBkaOxmOpAJYUhwExC5RVRlqNCujwtzq8HcD/KbCGuKj7NE1Sls1e+AseVFp44d86+QOyVOX/BcmhJH+HQr/OKcNzqHIO/2bEY536CiM4Px7dUY08m65ZL5xLQbl40UkQ5EC+GM8gyM5Ht9tz4IHcCztT9Z7iZguTJP8J9WHyh6UNahMToj/bjyslKiU9vD13o2CScv1iOGXPVPy4xVJm4uHq/Aeh/dLqVsB6+4EOIFdUBb8n92xdkmROa/QeGquhfqAtDwtWIvQLcsMJomrTAAavVduJBIiEKCu5o7WlSepTmdUR8M61Exr/rG2NTq3lF2+wkaWNZ9ANTNSl+qSlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by GV1PR03MB10575.eurprd03.prod.outlook.com
 (2603:10a6:150:16e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:37:53 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:37:53 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v2 2/7] media: mt9m114: Add get_mbus_config
Date: Tue,  4 Mar 2025 11:36:42 +0100
Message-Id: <20250304103647.34235-3-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304103647.34235-1-mathis.foerst@mt.com>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::9) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|GV1PR03MB10575:EE_
X-MS-Office365-Filtering-Correlation-Id: 09439845-908a-4d4e-2d42-08dd5b089e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VctVUFkzDNNLI0ES72IIa1fX0q2a1qyFaBnmZ9SLM42zXwGlJW1+WiCIlpdU?=
 =?us-ascii?Q?rxR8vRIewJadRHZkf9ecDt8D1eHc9gD5m3xNwXfNrnYq5uslnHOhwCdIKPuk?=
 =?us-ascii?Q?0MSFgCsBKaY8EtkXiqCZg2MNcyx2u2bqGq0zT9e7sYdcNZhmaXB+u07//ur9?=
 =?us-ascii?Q?73yO5wkCNMCDhalyTr8EOMGaPjFeXt1tdyG/PhXXj7wJy8bZiSTsZOw2tlzd?=
 =?us-ascii?Q?L5aPs5VytoWQGBL1165LBfMvzLdpkr9jJnaIaOKWvdQWEFCq3p0acu9ESFfZ?=
 =?us-ascii?Q?qWeUrRbhW+IXdiXHeO3nzRBtkCeGCqelDrMecY1TUFm/K6zco3zqi/sI0CQc?=
 =?us-ascii?Q?tO+nDovO83hn4nIz/6OxevPDfGZQQytcYXf+9Hsx5ymHHc0riCZEjO2nXUR6?=
 =?us-ascii?Q?23RkbVCHMbTatEDhyBPvvxsYrzpgLx8FNzX5/PmbbsvN+Zc7dpFdk5zByU7V?=
 =?us-ascii?Q?5kvEtXJhtFH3skiOIg1qlvoyA9Sd8QPmmq5wE3Pa7VbgGTCXH/5f/Vts2B/7?=
 =?us-ascii?Q?TiK0vK4o7xSNly6Ex2nVA7w0TduJZAe8gVQoChViQU3J37MH1QMRCBVrEAQg?=
 =?us-ascii?Q?JPtb5z+pKkC76iDzINEG2scXrNJL3bMPmtILg/nXmldhAAlurTBU81nkNyrX?=
 =?us-ascii?Q?DLLIRV+DQoFtMWKkvnSnkjxSSKEhSUSMgAA/JFbymAby8nXQGY6BFZUWGOtm?=
 =?us-ascii?Q?RDJMrd+JxDPkv4s3OHDWdjkRNyRMFN7VhlejlQSUNEeBUR+tMaCeBTnsL3w/?=
 =?us-ascii?Q?Lkw5Cn/i1o57Xem7wtU3GrbcDxSKkK0F9TXpAIxi86LtXG/sKqSTucV7W9zK?=
 =?us-ascii?Q?/hjM7Pp9YAUciuqAiJIP6rK97IP/1pkFIIUBDrenrotKUXBhm8FUChu/u4Y1?=
 =?us-ascii?Q?qESVeze4tKnD+8cnn9QvRs09yjfacmBqPY7j80IEo8j05QtWW+GI7y8iQzzd?=
 =?us-ascii?Q?IjFvPs8dxMDlaT/M0p+YBbfu2YApm2hn6qAYvGZAo31MQSxyUXTVpLqJTwOK?=
 =?us-ascii?Q?gZ2cZqjQ2Y+G7c9RKIq/R4oN3vUwVxgT0q2VBmqH16qdIOPfqQmTkapUaDx9?=
 =?us-ascii?Q?88hZQ/higAMgTbQOaHwm1ZA7IEtzE9zvCo0VYWQyne/R/t+6UGYcUpKwHH4J?=
 =?us-ascii?Q?Bxbqqr+9ENxtHf1cibwHobbvQrXP9Xz43oK7X3BIeJXY90r4uDkxrhwbowPY?=
 =?us-ascii?Q?vwSEVRYt9AE7UMWsIn2xLZQjv1QSOz1eT1nXq0HsqpMJuj1Vkc+mSNy3c+h2?=
 =?us-ascii?Q?mpftsveMHDDzExYztRTQB2k63x7NXtE5sFR5QuLDn286Hh371r1hFKhHJYaW?=
 =?us-ascii?Q?7P1VnWEJWxxOMv8quxJ1IA50cXQ0smR0h3IBwwddvvdQiocquTwd38fpiUsi?=
 =?us-ascii?Q?lLpqWqDVFeI8UF2hPkn+tnGQhgDfwGcwd4AY4mL5I/erv8WuSg7o7ZvzJdQM?=
 =?us-ascii?Q?0nyb6SPpGqcFM3NOaF8bnZ5IFGXCgAOO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?06msJfY22O4ATIn9Bnqb3UcpQmKvj3Q9vpy/kCOEK8wGogTVXsjNvzoDoAJs?=
 =?us-ascii?Q?QJJXArwlSw+XQ0dKRCIOHM/pR+V5L3oMZsDilCvtx6vTHW9wB5VZncFfmAN5?=
 =?us-ascii?Q?QF+gdoXGxzYc4lEbV6oipeqrkyHjaHauM7nt/D9dT91almlAiE2C70Wcjjw1?=
 =?us-ascii?Q?QzFJOb/EQxdAzBOV49z4BFrtsev7xRZ63VBaSk1fK2V/wlu5bvDq7l0I23k/?=
 =?us-ascii?Q?qYWH2sNFCGswudEw+hIN1ViIyhGzTsS+9y9UIWimDZDgKGaddxenjQTKqp6c?=
 =?us-ascii?Q?NBE86yivz8aFOcKLv5oU3t77BtjvQqO4T4LVivN/U756odSjufFwiDDsR4R+?=
 =?us-ascii?Q?72vwZxLPkL1A3q0EU6XWMhkvdI0rR4JQHhiOYRcOwvBjdlRU4NCleGOfTbMI?=
 =?us-ascii?Q?IpcSCjk6+hT3nFwJ4Rl68YDcqh/9dqPDAraH3QmukqzsM5takrP+u4eR1Jlr?=
 =?us-ascii?Q?igaU3BzM7WbCDYahWIMHjUESJClKUyGOHPVKSBpGRUOMsianc9xLn8XOQALX?=
 =?us-ascii?Q?TDCTHFwBZjQFSYXSjIIOUgTz8YI72PEbkLQi3QDJOKB7OsWTeSKuUMAGnqaQ?=
 =?us-ascii?Q?XwZLg03dKvtJ8dGMIYixTjNLxTCZ3PgLHnGfzL5M27fiRF3bd0xbiF6i4wYy?=
 =?us-ascii?Q?tkpan1XK47k1+QRyZzbJ2J4wwnjM2vKWsM3YzZ1O4XbSbqcuMc9Rb1mQOiMO?=
 =?us-ascii?Q?Y1BNQQ0gsmwxjZG0btgBuMqGoQhQqxiSGs/a1wZUTr7o4S16SI7lpfv6Dq6h?=
 =?us-ascii?Q?KY7lPJ23Nap7rAWARRxLc8N8QJ1cuxgquspZQcL12C3x/5rTJ2PuGnaqEC8Y?=
 =?us-ascii?Q?fBiizSUrlE0YCaHS/cizehsx3xpioCc5R4ktGpKlUu1nD7TsemSp/WDsu+7R?=
 =?us-ascii?Q?3K6wOmcii5+X/OXk4XP50llv9U/DzNcKdDC41gfDUfkz98W5F6BFsIjaByY5?=
 =?us-ascii?Q?a2ms7CjD/iTmV3+41B0yvCzqaRHeqrmYwAPYBDGm4tm83OjFtARisIiRpL5P?=
 =?us-ascii?Q?mFH1znNLYJqInIfhb9GnLVHt8WcKx03Kx9lf6QOo9J3yvuucZxiWeOhWmU0R?=
 =?us-ascii?Q?lLUUitKWRE4pY6WOCgRA58lrHPV8povAL8CVy5b4kS+1fIk1DWK2yUL5YZBC?=
 =?us-ascii?Q?Ck/l96JNtijMd6nkAhRnJ4e2PGlVg2baR8lAhYrrg9yZI/Q7c2PjKzPrTyfe?=
 =?us-ascii?Q?2fSCL4Jf1YcXhy++dqvIR/ARDkkkZ20yUyNhd38jXtTHYFR6h0hMBJxOtdT+?=
 =?us-ascii?Q?cIOZfWSYS3Qwb0DqezZyE/5kLagOgHbV9WGp9oW9ktLI6WM9DgKLnBMXLvP/?=
 =?us-ascii?Q?/dlDSpNN8Und1w8cPmd7RZSoVZ8891hXtSAjlU9+xkGtYoRzb0hy3xZ78fet?=
 =?us-ascii?Q?RsOr3Hr9GUxRoB01KBxMO6/Nq4dmmjaJyOHHcdUjKmrn9CiEGrkPBKwO9SWO?=
 =?us-ascii?Q?VTzXJZWkqIVAWJnOTnXF3CfsrubuDQwlEiMBZNKML4B71m7cxhGAQ4upwlqZ?=
 =?us-ascii?Q?dxsOcT03Fv83Y0R2FcMEQ3BFPkBZT7mBwAL0rLTPqffAoO8IeJqRzBbPAKB3?=
 =?us-ascii?Q?YUVaBK8cMlVz5LTEK+XjEr0UfQVfvAapdglBW0ee?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09439845-908a-4d4e-2d42-08dd5b089e31
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:37:53.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QweVA5SUDmr7ZDsf+Dma18zSb8thlysRs4bY0Ye8mk/DWRbusEd2h4/uGbI7MiX8Wgkx/3irqNV/QuODDi71Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10575

The i.MX6 camera frameworks requires get_mbus_config to be implemented.
See [0].

[0] drivers/staging/media/imx/imx-media-csi.c - line 211..216

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..fa64d6d315a1 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1977,6 +1977,24 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
 		v4l2_device_unregister_subdev(&sensor->pa.sd);
 		return ret;
 	}
+	return 0;
+}
+
+static int mt9m114_ifp_get_mbus_config(struct v4l2_subdev *sd,
+				   unsigned int pad,
+				   struct v4l2_mbus_config *cfg)
+{
+	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
+
+	if (sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY) {
+		cfg->type = V4L2_MBUS_CSI2_DPHY;
+	} else {
+		cfg->type = V4L2_MBUS_PARALLEL;
+		cfg->bus.parallel.flags = V4L2_MBUS_MASTER |
+					  V4L2_MBUS_PCLK_SAMPLE_RISING |
+					  V4L2_MBUS_DATA_ACTIVE_HIGH;
+		cfg->bus.parallel.bus_width = 8;
+	}
 
 	return 0;
 }
@@ -1993,6 +2011,7 @@ static const struct v4l2_subdev_pad_ops mt9m114_ifp_pad_ops = {
 	.set_fmt = mt9m114_ifp_set_fmt,
 	.get_selection = mt9m114_ifp_get_selection,
 	.set_selection = mt9m114_ifp_set_selection,
+	.get_mbus_config = mt9m114_ifp_get_mbus_config,
 	.get_frame_interval = mt9m114_ifp_get_frame_interval,
 	.set_frame_interval = mt9m114_ifp_set_frame_interval,
 };
-- 
2.34.1


