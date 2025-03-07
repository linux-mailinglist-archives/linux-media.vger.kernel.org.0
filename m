Return-Path: <linux-media+bounces-27814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A2A563FC
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9EF16B1FF
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2373321420D;
	Fri,  7 Mar 2025 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="aEpVqlaF"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1592135D6;
	Fri,  7 Mar 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339930; cv=fail; b=JNRkagUfj167zvkL85mgb/NVX8md97oDHoI0Hx7i8UrNiuAdaLcA1DWQsXjiWNktOSvQj5gPQAbZctPont6mJO6f3EPWoFlPiH8ffgvo1yrOeKKGhKqbm0A7MfSUwqKkyndlAeIQQI58P4z1ExmRNUsGlBhLNi8SBOgv+D9+WDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339930; c=relaxed/simple;
	bh=nXLpGVkylDbxRDTunOTVUgn9ZrKe2PTwYwYSZwHRx48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JcIGYpWyifV8CbswLNytTllYSxXonYJhyuamzlxNJa5mZ4zL5VNIHEBgoPvBe8gG66aJd0lPIOGFlfPRHwiI1rNGU2jADjp4NJ4c9ZJ54iO8VwvMMcslXxxAJXdMGsyTnZIC+2zX67YgEIqM/k/ROA0e9nqGc2+fpYJv8XbdqfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=aEpVqlaF; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvEQ4+Cq+AozrbHz4h/mZX6Ez0q3cfItjFqhRE+5D+H+pSuy2dc/zUwgfZfhSY8hC65IhY5EwSmxE9r+PLyNwKxbHO1LP1lVuyxXDWY5P8BZEI+8NnyReoZeC/05DYSBVeWRaUW2Wjjzo17fD9Q61wBfCOWDbowrnh5JWWJvPYNtD7m9bAA0UA8CjfdlcQzCd5ofTXeQAnXoNngYsnM0AIu7+RBqjV58n/lu/lF3PU0ccqNHHMaRovB3NfgGCOP1X2qNjQpfexVnlWWfA13KdtoGPVnBwsGHxdtFkQDb+1E3pOkaiVAussgVXMT5Uv4xVJapDetfp6ryNwsXpj3WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKUset5VhFW1hUodJryuhhMaFXFMUoStCuKiNsrjhwc=;
 b=ECNVZ1f6jVsxa/0Fm35CcXb6iQfhy7iKfJWCEbNl1bSibaLPKB6HUmX679HmXgUbROvuiYLFcK8CiB1FS8oYFMWncuar32M2QneaPawqLbBagpiZV+pKyZMwCl9aRun2y46nZxXXm9yMxamQqRPcPOdazzxcx3aM3HApOw+IV1aGc5T9F+VOyN3Zs+nRZ32QELqf5yu21FYr4Nvpde2yAHe18uZouSS8cqtjqsa3dy7lqEb9Ye5jTTRuT/SZUzEjFcAn8zepdanU362CaIj96Sst3PSyLll+Gl9X2MDxJI2nmUMDwfso62FjTkQAJtYYYGsDvn4xg4r+w3Vck51NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKUset5VhFW1hUodJryuhhMaFXFMUoStCuKiNsrjhwc=;
 b=aEpVqlaFuus5LxZumAoTJNekpVY/kF8gzDwWS0edMEBO2VCYOPooeVFtXXw0fgAota/+tU1IeCZQv7JGq2LesZ03CMDETRFLJP17Myx1PxOGElJuJfFnMtBBq1NmJXiREEQ4oVieRGw3dHLcZUKCDnGMuG6TqfEuSMYoGiXzrC76PTREPZ94SHr6fBl3NnpRBDzIkXLdfGmqBpmy8Mnsty9q+YMvQStRhORbiKVrtPTtpKBsHg+su+OD9OlU7YG6zvpbdlRnhqUfRRa0+e+WAzv6JyOHQeaxuLGgwPbE4B2d8nCydpawzKGMztQB+7MW5f9a6eXzEJ/uK7OJQVWgMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU5PR03MB10443.eurprd03.prod.outlook.com (2603:10a6:10:529::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 09:31:59 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:31:58 +0000
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
Subject: [PATCH v4 6/6] media: mt9m114: Set pad-slew-rate
Date: Fri,  7 Mar 2025 10:31:40 +0100
Message-Id: <20250307093140.370061-7-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093140.370061-1-mathis.foerst@mt.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0220.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::22) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU5PR03MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c53028-03df-4fbb-3910-08dd5d5ae824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cOwB7QRP56aUSWS1ixdAs+I0j0Oi31q5cj/HO9tm2MOn2cg6GBmYtBzh1Mfu?=
 =?us-ascii?Q?966vMq1oK8ZERRST2hZgaEJbZZ/uRmGQD2OK1onwE/Q3Lf00/fKY9hvWHlj/?=
 =?us-ascii?Q?3km2wMQjtsnclK2HvQ6exUkI+5dX6qR+hZmvGiHEFvJwRAap3zPrpxsumvw+?=
 =?us-ascii?Q?CS07AIw3R6hjSqDFzZGnJFRgfwmW+S6Ci104DjVzVVG0x36zw2AImLS2Yu4M?=
 =?us-ascii?Q?yG1f7RY7BEiGYlaC6W4xQY+XyPlKieMvvFTs6r+pB/hQ8FOpKw48BLz7/hYo?=
 =?us-ascii?Q?8eVBnGrxg5ffc28YZjfHrUSXK8LV884Q4YWhKlVsLZYL+6VcvZD/Czvh2Gl+?=
 =?us-ascii?Q?OZotifVUMmo2yoYhmxszQixzqaY/R1oLlRw7k63amVfV2eAF1N1q0H0pWkWi?=
 =?us-ascii?Q?ZFlYzMQoFEidvfKSNN5bvMZFensEA+b3J5R55CJ93PPECWvhZldTkgdNSDPg?=
 =?us-ascii?Q?Auk8fOIz6ZJx6h1JTH7O1s9RhKPD/l8k/0YSzW9mHKg36aHigWBUha0YvD0R?=
 =?us-ascii?Q?TcmdxZX7P1CWxDPyTjmFt+Jvu3MdarT1mkJKY0EOpJcw/2STUyVfO58Bfhz/?=
 =?us-ascii?Q?ewUiDiyV82KSnsFTF5DPnSRSEe9x7xNZ46BEZom4mOIXqdHBEJClrDfO7TaN?=
 =?us-ascii?Q?Dmw+kDbo4H4UwMu+OgYnIAZR6/wu5eL32zYK2caV54EcfhiIzAkHNXqDcuk0?=
 =?us-ascii?Q?ya1ikfQ8dLlQgVVRHRibefffkSH5u8GKL41NQuIgMrNem7t2HfxHCyO0PXCe?=
 =?us-ascii?Q?cdDdZ2VgIsKki83sV1m4WqiBe03DUwFvqf/jVUl9KlHtRdTqaS++rZvbWYPB?=
 =?us-ascii?Q?mTas+n+lP29u+tu/pjoxkBehaAlS6d38LrmjPSqXqpP+htGav9GiHV3qP3Y7?=
 =?us-ascii?Q?r9AHF0Cd+/TheWieBKuoanbaQCmabB3vnm7tPM4xemLjUWfiRj22ydb9OP2l?=
 =?us-ascii?Q?/p9XnoHlxBDKuAHBo/5eZYHk0f7aYKqt1sWc1n3gH8EdesvQ0doOxNZ5p6Mt?=
 =?us-ascii?Q?T0FQYHPVxdPRKr/BNJ479kKvIAi+W+Zii2+BA/zVm+lC/6qbLKLkrYeCg1Ml?=
 =?us-ascii?Q?w3DQsoXqYy2cNIWqRV79uFGBv2OD8KOasHKtO8AI9HEA36Dqw8HyGbLhpRHN?=
 =?us-ascii?Q?8Srd+DXYnGrT90Gpi3YYe51M2mHySwE/lxPUkdaEwq/QsbpLzQ7Owj3am35O?=
 =?us-ascii?Q?+mCcPIopXOQvH3esYC6V5cIfJp1HlSOgBcmDnKq0+Ev3tYTWEDF4Dzbz2W4H?=
 =?us-ascii?Q?s87k/hTvVM1+ATBoERk4MQMz70ZEUDJ93N6IuufvjovfYsY0uuIbaO3patJy?=
 =?us-ascii?Q?rSLaANwCYZ9Lmaqnrnl/27Dje71CmKhzIparRLb4p8xz96D3CUBbLUk8BAkO?=
 =?us-ascii?Q?Jcjtz6wtIHx2DzXmG5BgigbjIWWj0Zj1fU2pRGxyT6B8Ai4Pj4qrGxjON2W1?=
 =?us-ascii?Q?XUG2/4KgUsHB71EX/VxpnTWBx2IbKEEO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8KPkCh8eYRQ6/lU836nKbt2rgijI67zUhosJ3oDCbZQudlHUQmIHwK3op/8u?=
 =?us-ascii?Q?2oIYU45QPZZ/i4bV2hMn0gkBGVEzM3fl6KoCLp+6MYWRlyMs0iy3LU70BWfH?=
 =?us-ascii?Q?mfR7wdAOndkWVGF2ZJ8LGwvM1LG2MTOUAglM/ERH+LyG2Ge4twT5IvjyrW6p?=
 =?us-ascii?Q?hBKAC5yISn8ShnqI3X7jrmyM62Knd9aO4cSJX+9Rn3FrSSjJbQggwz3I8Af2?=
 =?us-ascii?Q?8vEe68ax932M/bZk3BqmCZOMCa62/q8HBoTztv/QjJw/8LnFh7BlLepLJScx?=
 =?us-ascii?Q?teTOm6SEEFBhWoPbdUGB8pt5XzSmQhdFt8PbTp5tN5052Hy6j3/x57p0g/KZ?=
 =?us-ascii?Q?dNWg5ByCaqdIKKDwWr1WrUJrZNh8oJCCX+cYcVs5FB232TeqLOt3wHuiJmlu?=
 =?us-ascii?Q?pJaDdXwK+9uHOa6qpZ9kjEGjEoakFnSwiMZhb/ZXKRIcHg2BtlYlDF7dPO6T?=
 =?us-ascii?Q?OUQJvFOtWIFU4knqd4VFdg1OEtlOmCtuhz8v+R9MJAgVwnSHCJfDv303gOp+?=
 =?us-ascii?Q?xKPpLYas7GdiJChxnKlJnqq0eea81BTM7/rHsaGu1Y1pxlyupItpUyHSBI6e?=
 =?us-ascii?Q?zc+RCxAvlZ3gBQNohU66ca2Vzd1fBGTpuacgjNrhk1+aHYYC3BHsPf/Xp4dH?=
 =?us-ascii?Q?2MN3sUCuFPn0CUX/1VxIQog+OgCvIFsGvjnfLWLw8ciHIK1VqdyEsv3j+xwR?=
 =?us-ascii?Q?nkw/YhW5F/KuDA7vRXvjF4nxako+Fud2mZAiufEuZAeT992SlHQVmw9sF8jZ?=
 =?us-ascii?Q?ODU12CzMWajfwnALV5H2EgxcB79zL0B9P0ijMNUvE9c8FiJiBI6nvtXTDG0T?=
 =?us-ascii?Q?GsmCEDe7ibZb3MTYN2CkZY4Gw62mUqYBQeV8c7EpK9NRLHknJMJVS4SLuBVS?=
 =?us-ascii?Q?UnhVt93T7Y6V7gW8VUyMNXMhsBK0kDaCMKOsZADBM9Dp4RAYnSexZjNXMU78?=
 =?us-ascii?Q?Cf+n2qYezqjJp1qILCx0TwAnS1vNarAruPKi/m7JJSRRvfhG2W7OGiGnLPwc?=
 =?us-ascii?Q?0QW39qBk1h05FmGmjPMd6yvV5T2v9Q6pqGxWvIhi6X3uPbsuEnsM/LHYG9u0?=
 =?us-ascii?Q?YsiP8Hua0KM2hMzSDbLX0quPMsWfFdv4Zy9hJoxNIrE4QXAUd8WROw+WqySy?=
 =?us-ascii?Q?YcF+zSvvfLfH23fy0XTylcQ6oUCbtr/hH3eCKnfnTm5P5hJxKOJWxyvENlMY?=
 =?us-ascii?Q?zkFyEopCDIlg5A5UytbSbIk4313MTmwC+LCLvPm/E2BXIdknR2bjTx9OjZc4?=
 =?us-ascii?Q?Fda9NCuo8E4FYMq4FDaz0VlPwlGLb4wr7DW2vlMUw7syAzSfQ2947S+o/6g8?=
 =?us-ascii?Q?h/pDTfLBkKfzXK808r+p0pBjTRXvwSEC+SlbnWTq4kpA9/oHBoXKbrt7i1BC?=
 =?us-ascii?Q?ljDgrzxD8AjWQmoDNK1nBweGp1hEDIRWC9ygoJZyMT8jXsVmsU0G28/bCLdQ?=
 =?us-ascii?Q?jyzF0j9Z0j6MGVTGpnlXg4sbK37uPjqJjgmRfSVtFSd9CT9gdH/tFSXXbtE4?=
 =?us-ascii?Q?dqNvpqvMqtbt5HHD+H4mpdWgQIDO//PzTamg8RnsFKp2pyKn1R9e31RQvmj9?=
 =?us-ascii?Q?lDwct5Z2Qso17MujTiJJPnS5N0U2b1cxuV4G+mY3?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c53028-03df-4fbb-3910-08dd5d5ae824
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:31:58.3205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAMtTMzjMQIj0tVsFQhzQwG11MJ+qSsqrtRcHX4kVA1fLyRfkiCAT4ES7NlBl5qiVimvt0sCmz7qZTjNLcVBlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10443

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 79c97ab19be9..fce24c587782 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -42,6 +42,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0x00
+#define MT9M114_PAD_SLEW_MAX					0x07
+#define MT9M114_PAD_SLEW_DEFAULT				0x07
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +391,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -645,9 +649,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -778,6 +779,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = (sensor->pad_slew_rate & 0xF)
+	      | (sensor->pad_slew_rate & 0xF) << 4
+	      |	(sensor->pad_slew_rate & 0xF) << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2357,6 +2365,8 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
 	struct fwnode_handle *ep;
+	struct device_node *dev_node = sensor->client->dev.of_node;
+	u32 slew_rate;
 	int ret;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -2385,6 +2395,11 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	ret = of_property_read_u32(dev_node, "slew-rate", &slew_rate);
+	if (ret || slew_rate < MT9M114_PAD_SLEW_MIN || slew_rate > MT9M114_PAD_SLEW_MAX)
+		slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	sensor->pad_slew_rate = slew_rate;
+
 	return 0;
 
 error:
-- 
2.34.1


