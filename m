Return-Path: <linux-media+bounces-25482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1EBA240BF
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D2F7168A5A
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522981F4295;
	Fri, 31 Jan 2025 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e2UQkjXj"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468CC1F3FE4;
	Fri, 31 Jan 2025 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341286; cv=fail; b=TIygwwrQyLUOed1kk6CFmk8YHG3XNrJO0URoWpuVrcLlv2kJGpRTx7+Wh49pHUv+EplSS83Ziqx0ERB8/MV865prveXtoC0Sb0p1V2C3F2WRhAlpB8logpW9Zh1erfKCHoFZs2SJU7z+VpQSyZtxnajfx7uKknjV2GBBAMCA8Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341286; c=relaxed/simple;
	bh=xN7mKk0e4D5yI3zux/rvI87HzLOdyYbz1vf7YIlL00Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JOjRMC81NLArbte/Lm+GsZjw37q9gKxnSaYe+38ZzyXm0IZcDzIJ2GaEg7CkHicEwOqc9jqfbSL/gmJ0j0LlZ/5DyokpoZmxcmOIzUwTmyk+/Kf9jzIcQyWGb7rvWq48GLIMWOxKdhkdOHRH98wZPcu/pyKexeb/yrNjhOk+mtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e2UQkjXj; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKPn0wbmq1OeHreTAMkFSy46xu6lLqbkmajoMhn42ncqIM2/TmMdY06E9emcoWjdIl/s8HW1ZI9D6bbu8hHS6B7aa5WFMwoDSUpaQAq6MqzJ/m3TVjZkx8Fw/OFxD92eFVuPu1sKDbptz3sOtSRnpt8TBe1mQcOxFJgahOf6R6V5nv7AF2WvFYlnf/YnDTyGN1eARFrGJYhxWu599mV11o5cUNylIdlhm5+2xujTxJDivI1QEO633FwguNdKfjpesn79QqxHozUrlIYsKp4x2/cVEo/8JYOrxTxSa0S/HyudWHxXXelT3X1MRyfrApYC6n4GhZ44DpD/GDTXppW+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0hgAqAg5QZs4n4zHj3ymCXDESQ2BybMl9OjrA5/qBE=;
 b=sayFWIo8Sc9CIOusBMGcU05/eLnNfXcvXjwOJ1tAsAky+rTHUZD6QKJRnHJX1ySfKqu2R1jnm2oM5jHERp7wWUzUmU4DElXtmkT/n/PWcSE6jJEMRWQ54UCETpJOOTL2p63UlCKa+ROPd1UYfynyr8cv2US+vtx7Yi/jjsdUE3gzRvBoAJ5D/Q2yHAz+7kWRdI3HRb6iynA376NC5vkbYmcmtuK8SGrfd07otiOTa+Lx/AcGK22+J2jvswMv13czW6Cu2tEwK4MGKi5io1bJidCne3XXUhX3ZRPb0MKKk5DKiX/S0HQdNP9ovYbuw32Z37kEGKEBro5tyUvYw3SVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0hgAqAg5QZs4n4zHj3ymCXDESQ2BybMl9OjrA5/qBE=;
 b=e2UQkjXjIPv6Ua2hTOm+GkJULOx+DzGJTJVht2yZGlmN8dWZxW8p6yWivHjRogtJctbiguTcHj2eEtwSvsFa5kR+v86DSyGVyRTLY/aAtD+ZZNf6jWX+sGdIrYXFbHy9/Le2AfTgXxdc0v0TQJNa4X7B0XyMkOqTFNJPK1UanPlhnSST5k0kMfsDSwMQURyxZ4gnIgQS16GKDyaTvIoPK7/KjAvY8XyheFPI8FP4GLuI3nGUJBvfub4zQrQisGO+Eb8gLpR0ssUSAx+2MbSRyjYZiF5yeAK9fWGygUqSKt09uuGDsrpJHoZE4zQoOPk+U4vfmdrTNmCRHiApz7fDzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:38 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:38 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 05/12] staging: media: max96712: add link frequency V4L2 control
Date: Fri, 31 Jan 2025 18:33:59 +0200
Message-Id: <20250131163408.2019144-6-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::20) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea9961e-8e01-4df2-016e-08dd42152756
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CfopW1DAwhret72PqjFmIkKuLBN/OJSClEOF65YDokuJBvpJ7K6JtQ4DkcrS?=
 =?us-ascii?Q?g1OQadrOZcY7ApIOVOjnhcKuIZWBl3gRZwiqlxj8tMoimNsdwW7S7/jOdtOL?=
 =?us-ascii?Q?kUXMJavdhiBBZ6JrkUAEH32N/l+yXRZo/ln11YllFy8ub3DV+Me+baYPj2NZ?=
 =?us-ascii?Q?bvgkj7jEVdXGvt3fUY80Xv1+8QzCOwOsQlg4RMeREXTY54MdL1x65tTbgwmZ?=
 =?us-ascii?Q?8h6ejMgYWAlfTvWIVLOClYlgLIJ1F4q16GsWMdYzVbeZd2u4Nc+q2cRo/ERf?=
 =?us-ascii?Q?K23tQpIQwnLxfXjdkJRCSeQkJLCFUHRxv+lyaDsNDJkegoYhDrkgtj9M8CHO?=
 =?us-ascii?Q?wVwoQXFX1X3ciNo61Zca4Z1tcMlGrSY4VAHGkR6D+Rhyynq+fNrPVL/VXLth?=
 =?us-ascii?Q?FDqPcG2ONz2VjSuJoAYPzUcrZR91BgaCujmRkbHUazICO15uAtwkXpH/f0KY?=
 =?us-ascii?Q?RkYSJ0Y1uyvCV1gDLiOf2eWYGrRQiyCMp2GguT+d0EzapXz+Xdsjzg+Yi8l7?=
 =?us-ascii?Q?mUV3ss/nFbJedYsRIwuplx9mOIrospYQUgKGGFIF3FX2gua3C4TxouIRVV0m?=
 =?us-ascii?Q?9e0UaYbSdx9p77dDRYh3l9iH2tskOVwP2tDVXzWxsAEYKV5hI/v1cASYHioq?=
 =?us-ascii?Q?T1J5mDmDWqmSPe18B9yPoCrbQSOzvi4Pyf+0fgmfmjy6vPTUFXzSqBEX3sR+?=
 =?us-ascii?Q?GSdTve/AeIjqMhbSNGS5rmQ3mNG8xc5Je+RTxOpJo+OOLsdVRGMBwADTtrmL?=
 =?us-ascii?Q?1m5VhuZrNLx/iovhvhYeYm0GXKoRmiYjSSmIQOiSXgdHIk3h0t5FPsyTOyUK?=
 =?us-ascii?Q?yaNbp+HZhLvT6F2b8KW8BXoHA4bjWsKAVxy1Xqfq1gv9XunN+9UyxBJuelBy?=
 =?us-ascii?Q?/3324mF4Q2NjicfXZonZh4qqa7hSQ8rCkGZYgNIYoMivluip4y3TUlTNeJPY?=
 =?us-ascii?Q?uSFnUWRaC/5t6gOd5iRhKjgKJrueNBrmGqKmtI6GYhfdr28/6Iqd7X/YO39j?=
 =?us-ascii?Q?3ld9raxP6shj5gAsz605Miy9ubOi6UQCnS7HTLFiDAJNkrwVAJ1mToOw1wkh?=
 =?us-ascii?Q?nP0VoKxIFUz0TF7QM5xQQxRmLChirtxX/fU3/vxqKkI8RnwmXdpuODhSLn7T?=
 =?us-ascii?Q?mlbQGeOjtlX5yEYfjxG5zDxBieHvC2aWlDo1iZEXRA5yRTWHUp6Bg4M8WU+v?=
 =?us-ascii?Q?VEkAisXclqeUV66p5uhVQ2xMaEf6UHiwB8xSN8deTDXPMpM6a9sZs9rENW1K?=
 =?us-ascii?Q?V5sOTurIo2XMdbRtZHaG7+l4yNi3o5lI+JZKN+nE5pT1dD8JsCqYaamtbwhs?=
 =?us-ascii?Q?CI+CUpVvJwxTW+aDMxsI4bZYEs5VE4AyXeB67b7n2BudAGAIbmfuHftjiZHO?=
 =?us-ascii?Q?GBHOlGW2zqqBPz0DHUvBonJ2CJrq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TDOZkFJUgFYyNhqkoZxk+arIAPbA/5y1TZLCiVANMIlYfrekzYlKRQaRzW0I?=
 =?us-ascii?Q?O88iUBiRVB4lT1/LH2aFzvtFhPLy3cCZTImNUbfU+nzLREyWyN74tfRorTvW?=
 =?us-ascii?Q?+xVrHzUW4ZZP0BQFcjBy6MNfO2Ds45FOrh1VvN1REF3FJk2VUMwiE6IAP7hJ?=
 =?us-ascii?Q?FD0an3YyuEEdehwCBE38rl3dSFIvuNWhv4h2S/r46XpHIb+lrzkMZ97syY0z?=
 =?us-ascii?Q?AxYOjuNfWopBhowmKwYGKRGqXCD++5qdrX1nQvbhrW0M+OAqtJUxSA4hquFx?=
 =?us-ascii?Q?3MR5n5DVwyJHMbiDAUbMSC77D4noUP9Uy+lJ6IaI5jFJ4/OjrzeFcgP1ZHZL?=
 =?us-ascii?Q?j97EZKV2cs+xnHTo5FWd1RcmDQiHD3Vb/wthUqji3+lgeSGsf5zMO5rIk/d3?=
 =?us-ascii?Q?FyaQk8Hbwa9N6wBz6oN/uQyDt66ZrcWQp6ZQh7CXL2PTm3izEWbUkXvBr6r6?=
 =?us-ascii?Q?HSKYDEHlpC14LciEh/BQ51RPrPIx2+KBKIAsboV6f8lg2ZiZbDr4T8G/IBxR?=
 =?us-ascii?Q?qkJzkjeH3VdwpOn/WVHnYwodO4Te8zJB+o2EVteawugNCvtpgF/UENSX4/sS?=
 =?us-ascii?Q?Tlf740moXGrHnT4abYu9yefxYBltj1n1THkiwli4h1CcqaqZIYqs3ToOoXei?=
 =?us-ascii?Q?UdgaerjYY7dDfR03YS66qthIetrWnE20qa54GbTXGhvJHXgNoEfXyzT2VBgL?=
 =?us-ascii?Q?PigDb+eWm9RLv+ZiCga5Bu6Fh1pwJGcYcCOG9A1xgYeOypuSCDj8meh0gQcr?=
 =?us-ascii?Q?62jxxxgXBBTOOBB05k5JAnC1KD2KtIX73C5q6jaPVwLTuYZu1kUT8HhBnaGQ?=
 =?us-ascii?Q?wa/adRPe81xwnTE/EXa0BLWmdSBdVa6h41CfPSVZS17/P9NEWhJ6IIz3U34M?=
 =?us-ascii?Q?/0QrzXi8jwnTuUqjS31yn74dd0DPlF1jE7QwnIwl9a2atYhFKQDy8rR1F1w+?=
 =?us-ascii?Q?MnJtZ0jjOOWH05wvH6wGLTKqzFDSx7/yIE6d7xb5cdw6byz4gNCJeZz8gDMQ?=
 =?us-ascii?Q?U3x2SqoOppucdiLn+rl5GLcAFRxuBO7LCyzKcBQP53dVr8tkRaaS53AV8aCc?=
 =?us-ascii?Q?b9/upu4fqYvT2GXutG1LGX0scAP66xcRbnT05LjSTyUgSYZ9TbA3qS68dR+2?=
 =?us-ascii?Q?oYA/U4y6xBFCYPuqyhhAyI+eAx/ms/T62WL9ohRXE3g7CAiYXa6/BodSA8S3?=
 =?us-ascii?Q?3Z0R9fZC+XANIvz4wgDHhPMEJexpH96JmUfvNLQfxE4xnTMinmVfCetJRCh4?=
 =?us-ascii?Q?QOM9XEDqiKcDb9zPugNna2zmAzOPoaWCaLJsNdzhOR9uQNxgZySUY8kv05kC?=
 =?us-ascii?Q?fyUqxGrKU9S5HFmyFcIe7nHR9WIGmHdAvhgUk4GOHkOwqquJh8u1ubCNy2Q/?=
 =?us-ascii?Q?HpD2ltXH57Oi/L46yvy2L+NUeTrmmb8d497gxPMORcZWB1okMyfHzUf9FhtV?=
 =?us-ascii?Q?08+2y5xlynfaZfJqNw2bGQDw6ow0YawlRCPkoVBErT55iI+jp9+xEbMVSUNN?=
 =?us-ascii?Q?6s4Gf0sioel7exmG6POJEN90Am0tsrw7bJknk/398SaUvbsLGnqC5plTFHei?=
 =?us-ascii?Q?J0Hr4wTYsLUzToYahuHdWkQS37T26xt7hNdAb10G8egDhoQPE+yjMHHPqAN4?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea9961e-8e01-4df2-016e-08dd42152756
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:37.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P87Vfl43a9rHjGyAImeA9mYpRM0yiubYmDbZXPFja/XxW6DZYp+5Uu0vuqWI+b2VnXxh2hFfwmtmbEU5MgDQsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

The downstream nodes can use the V4L2_CID_PIXEL_RATE control to estimate
the link frequency but this can result in innacurate rates. Instead,
implement the V4L2_CID_LINK_FREQ control and pass the link frequency
from DT. If link-frequency DT property is missing fallback to using the
platform info DPLL value to compute the link frequency. Also, remove the
pixel rate control since it's not needed anymore.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 79 +++++++++++++++++------
 1 file changed, 60 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 9c255979932d6..546660e4b3d1e 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -83,7 +83,11 @@
 #define   T_T3_POST_SHIFT				2
 
 /* MIPI_TX: 0 <= phy < 4 */
-#define MAX96712_MIPI_TX_10(phy)			CCI_REG8(0x090a + (phy) * 0x40)
+#define MAX96712_MIPI_TX_DESKEW_INIT(phy)		CCI_REG8(0x0903 + (phy) * 0x40)
+#define   DPHY_DESKEW_AUTO_INIT_EN			BIT(7)
+#define MAX96712_MIPI_TX_DESKEW_PER(phy)		CCI_REG8(0x0904 + (phy) * 0x40)
+#define   PERIODIC_DESKEW_CALIBRATION_EN		BIT(7)
+#define MAX96712_MIPI_TX_10(phy)			(0x090a + (phy) * 0x40)
 #define   CSI2_TWAKEUP_H_MASK				GENMASK(2, 0)
 #define   CSI2_TWAKEUP_H_SHIFT				0
 #define   CSI2_VCX_EN					BIT(4)
@@ -137,6 +141,8 @@
 							 MAX96712_MAX_TX_PORTS + \
 							 MAX96712_MAX_VPG_PORTS)
 
+#define MHZ(f)						((f) * 1000000U)
+
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
 	MAX96712_PATTERN_GRADIENT,
@@ -160,6 +166,7 @@ struct max96712_priv {
 
 	bool cphy;
 	struct v4l2_mbus_config_mipi_csi2 mipi;
+	s64 link_freq;
 
 	struct v4l2_subdev sd;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -252,12 +259,28 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
 			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
 			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
-			     ((priv->info->dpllfreq / 100) & 0x1f));
+			     (((priv->link_freq * 2) / MHZ(100)) & 0x1f));
 	max96712_update_bits(priv, MAX96712_BACKTOP0_25,
 			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
 			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
 			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
-			     ((priv->info->dpllfreq / 100) & 0x1f));
+			     (((priv->link_freq * 2) / MHZ(100)) & 0x1f));
+
+	/* disable deskew on PHY0 and PHY1 if D-PHY is used and DPLL <= 1500MHz */
+	if (!priv->cphy) {
+		u32 dpll = priv->link_freq * 2;
+		u8 auto_deskew_en = dpll > MHZ(1500) ? DPHY_DESKEW_AUTO_INIT_EN : 0;
+		u8 auto_deskew_calib_en = dpll > MHZ(1500) ? PERIODIC_DESKEW_CALIBRATION_EN : 0;
+
+		max96712_update_bits(priv, MAX96712_MIPI_TX_DESKEW_INIT(0),
+				     DPHY_DESKEW_AUTO_INIT_EN, auto_deskew_en);
+		max96712_update_bits(priv, MAX96712_MIPI_TX_DESKEW_PER(0),
+				     PERIODIC_DESKEW_CALIBRATION_EN, auto_deskew_calib_en);
+		max96712_update_bits(priv, MAX96712_MIPI_TX_DESKEW_INIT(1),
+				     DPHY_DESKEW_AUTO_INIT_EN, auto_deskew_en);
+		max96712_update_bits(priv, MAX96712_MIPI_TX_DESKEW_PER(1),
+				     PERIODIC_DESKEW_CALIBRATION_EN, auto_deskew_calib_en);
+	}
 
 	/* Enable PHY0 and PHY1 */
 	max96712_update_bits(priv, MAX96712_MIPI_PHY_2, PHY_STDBY_N_MASK, PHY0_EN | PHY1_EN);
@@ -409,7 +432,7 @@ static const struct v4l2_ctrl_ops max96712_ctrl_ops = {
 
 static int max96712_v4l2_register(struct max96712_priv *priv)
 {
-	long pixel_rate;
+	struct v4l2_ctrl *link_freq_ctrl;
 	int ret;
 	int i;
 
@@ -420,18 +443,15 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 
 	v4l2_ctrl_handler_init(&priv->ctrl_handler, 2);
 
-	/*
-	 * TODO: Once V4L2_CID_LINK_FREQ is changed from a menu control to an
-	 * INT64 control it should be used here instead of V4L2_CID_PIXEL_RATE.
-	 */
-	pixel_rate = priv->info->dpllfreq / priv->mipi.num_data_lanes * 1000000;
-	v4l2_ctrl_new_std(&priv->ctrl_handler, NULL, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
+			       0, 0, &priv->link_freq);
 
-	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(max96712_test_pattern) - 1,
-				     0, 0, max96712_test_pattern);
+	link_freq_ctrl = v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &max96712_ctrl_ops,
+						      V4L2_CID_TEST_PATTERN,
+						      ARRAY_SIZE(max96712_test_pattern) - 1,
+						      0, 0, max96712_test_pattern);
+	if (link_freq_ctrl)
+		link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	priv->sd.ctrl_handler = &priv->ctrl_handler;
 	ret = priv->ctrl_handler.error;
@@ -515,7 +535,7 @@ static int max96712_parse_tx_ports(struct max96712_priv *priv, struct device_nod
 	unsigned int supported_lanes;
 	int ret;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_alloc_parse(of_fwnode_handle(node), &v4l2_ep);
 	if (ret) {
 		dev_err(&priv->client->dev, "Could not parse v4l2 endpoint\n");
 		return -EINVAL;
@@ -533,18 +553,39 @@ static int max96712_parse_tx_ports(struct max96712_priv *priv, struct device_nod
 	default:
 		dev_err(&priv->client->dev, "Unsupported bus-type %u\n",
 			v4l2_ep.bus_type);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_v4l2_ep;
 	}
 
 	if (v4l2_ep.bus.mipi_csi2.num_data_lanes != supported_lanes) {
 		dev_err(&priv->client->dev, "Only %u data lanes supported\n",
 			supported_lanes);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_v4l2_ep;
+	}
+
+	if (v4l2_ep.nr_of_link_frequencies != 1) {
+		dev_info(&priv->client->dev,
+			 "No link frequencies provided in DT, use platform info.\n");
+		priv->link_freq = MHZ(priv->info->dpllfreq) / 2;
+	} else {
+		priv->link_freq = v4l2_ep.link_frequencies[0];
+
+		if (priv->link_freq < MHZ(100) || priv->link_freq > MHZ(1250) ||
+		    priv->link_freq % MHZ(50)) {
+			dev_err(&priv->client->dev,
+				"Link frequency must be a multiple of 50MHz.\n");
+			ret = -EINVAL;
+			goto free_v4l2_ep;
+		}
 	}
 
 	priv->mipi = v4l2_ep.bus.mipi_csi2;
 
-	return 0;
+free_v4l2_ep:
+	v4l2_fwnode_endpoint_free(&v4l2_ep);
+
+	return ret;
 }
 
 static int max96712_parse_dt(struct max96712_priv *priv)
-- 
2.44.1


