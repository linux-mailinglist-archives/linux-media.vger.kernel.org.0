Return-Path: <linux-media+bounces-33142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F7AC0DBD
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52B181C00BCD
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E472770B;
	Thu, 22 May 2025 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="eaDYFw6d"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE1228D8E5;
	Thu, 22 May 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922851; cv=fail; b=lIK8tNH2QvczQo3p+MJAJXJdzPsnH8jPidmpjCQlLTivrybU2/fkzBUyfJl5CU5+ScElgSQdDCvYnN6hgUhFBcO45AKTQFunlPANpRT1wzPWNRRsXsuHx0kcd8oVXa63x0sb5xFiwwT31xEj0xYjyCSzyFS0+Mxq4lkavwfSGG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922851; c=relaxed/simple;
	bh=3zuRUliHvoXr01rKzylSMespC+7EGGTBPHW+yvwwRCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ASEn3xkhiXXCxbTLyKVsfdxTZlQhExU42qDp4UWUz6bVAHY0wj/9/jCtjVrfVrcVn9P2egD5Jg4bWCsiefpnCFvLhOQECpzgpp7pObR0Vlmp1YOOwMgCo9GDRMV8sJhYHlUz5f8aM5ggXDszD9hvq+1/nBJ1QeQCFw+vYjPsy/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=eaDYFw6d; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtdwjhY8ImDDrKP/D69Bq2EBir8cH9GeBxezf/2QcVZHoqSuAIC0EyEXo+fxndOb41J3BpSmHkxBXT0b+XWbS0AfPpcxWWT2hleF1KFLaZdy5Yl+yA64AvRciatfeAVrqU/b7ljeQ5qaAa8FFS3Lo0jUxP1rOHUs4C7UrfR+qWu8uCiInIJpCWUjUwKaBxDI4cseaB/O/vf7WNw0XHwvemqYjWoI5ZQJliBEb4Rk/ujFf69MzEhHt7p/zGemiRIztGpv60pCgmQuJ8brkZf5VVj74ayxYAtHp326ocp5/aYZ/scolKqut7iXclTHYSodkTDaTniEIwP2HT9fuEmBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkLik41aLAjjaxE2A+wBeRdVpWMyI4Si3Eq0VywtaS0=;
 b=ExVhddK9hbZPayHqNND2gaOpW48MZaHOY5WOdU+5OFc+aNwQ7PF2PLNDkIcwtBXBQW/L/Oi+WDR4579mlHFbAzOvAQoyw/b/8G6BEEtnypM6CRr5UEGpTvlBikMtdJtDSTTEQn3sInMxyJr/uHi5kw3iP6n+SkUWLGKQ7KJem1vujNBMaclJWxt3P1IBCQ5wUSB2YAzg6Vp9vuEdi2rItB83PsonCA3xnF0pQbPYVGpV8I76VJKAQUowfC8q2a6O67iBX01O0L3Jz898yslveWAwNUnL7gQuKRIxoaj0d6yYxdywV9hpfE1gYoMz6YdE6UyozNDGj+g+4Drcy9xbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkLik41aLAjjaxE2A+wBeRdVpWMyI4Si3Eq0VywtaS0=;
 b=eaDYFw6deov1Q0RPxYjmWb7lhNkAWmMIwZzKuA4YF62J7AKOATvHDMjXXxlJX0bM0G/alUSVkujhHlDPu8/GhZJkua96NRo4RCBgflHFdexOaw+hmZBgqtc5P2JKLWW8mHb3j/mECHurqcm+9A611wV3yj2K6fop7Kd0IEyXul1dY2ueP+YOJuiV+uAL8HxIKGuzT1bbLSC4/wN4AILhnOr/CUx1EEFP/K6W/WBVY38Y/HVF0VeAT5fGPrRTLXKe3Y+ETteB4o/s5kFNuHgwWPN2zBTmeGJE3aRmG/CofTYTokNNaIky3Y+ZmhP8KU84hlpmhmGzl58C7rN2mMT0gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:07:26 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:07:26 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v5 7/7] media: mt9m114: Set pad-slew-rate
Date: Thu, 22 May 2025 16:06:13 +0200
Message-Id: <20250522140613.104963-8-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0109.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::6) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7bed6f-4a38-437c-1643-08dd9939faee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?viqZ6JFwlwvdYefW2eH3Ofi3LNA690Vc5ee0oQ6Rs+YP8zIs9Y2+xOY4oNMJ?=
 =?us-ascii?Q?RAgpd6o6Hrl1tvGkKQmdaqAeWUMkuDdnGqIPvXF0XbR5H9e0s2unsrPU3CWL?=
 =?us-ascii?Q?QqTPSDpxE+r8Ytf+7SF8oSoF96cBQ7Dms4C1p0+zLkRaIwRxTBQnqaCavQRc?=
 =?us-ascii?Q?9qLna81+yfD7pXWaFYRuRnleM05vmKyTHuI0Ty2XMj+pCVbt3mXXV5MxL7FZ?=
 =?us-ascii?Q?4l2mrESj9yoQsKjpx3Y5gUtgS32wOKVzR0tfWuvn43rX6kk2+smT2Mrl1Pyc?=
 =?us-ascii?Q?0h/H5gyb/pA7A8VCwCEgVAPVB7GWTRlbT4hvVKP40jPzcdGeh5oEYSe1fN6+?=
 =?us-ascii?Q?vSBx3Wg4mWQAPA9OZVuE3RbUHnp024SeOGwlRmxwDXC7v+tGUZBGakBu3DLa?=
 =?us-ascii?Q?MDzAWLjFdYNhET0BX4Z0nX2MLcnmIkKFKjED8h5e3+Waa9oUWCPn1q3/EjlW?=
 =?us-ascii?Q?wYS9AJIrO6Wvn1B/vtA87r5OVrfsksIhPkIXCkv+JSz27AgHW1mVWHwqh3pw?=
 =?us-ascii?Q?vPJPD3yAEGuRuSzgFwayXaLWAiqulTX66d/6AaMOGbpvkZgHyLYoKP4Fv2C2?=
 =?us-ascii?Q?uwnjbEDFxWxflqsjjkSnPaPfrRodJhZFCJcYF7pdp80Np0us2XwBtB5YpBsy?=
 =?us-ascii?Q?bH+62lYMVyK5Md3LDz9yiDVbAZk/mTMOmvXdgq6NjFUFVlXT+gLnIK5Q1LKj?=
 =?us-ascii?Q?GvwA36mdQ3cGNZ5XWg8FrynN+N/DJvkKDhTVP/Rzpo9g+OAcWQOd3Cm3akLx?=
 =?us-ascii?Q?NBfEFt9D+wciIVXr2Wl/fnWpj+RIQFdGkqRh73Pafo4i92e317xiF2RjJEfJ?=
 =?us-ascii?Q?h3p5U/A4GQBpXlTBsQuingMKLmO1BwmTjj70TbMOFQStuaI3SwFkjWlKSyHK?=
 =?us-ascii?Q?42E0TUxj1bwcMcgRLUuu62ld6Dw2yzf+3i0zIjFV7cNaxuMnfx9LpOYuHvTw?=
 =?us-ascii?Q?BdA5YQpK6ezKdkjHhXYy0JvBLQ+NkZ/vsSlRH9AsOjhKqJVGEibVx2L9gxCD?=
 =?us-ascii?Q?KykD8f2Rzj6Zt3omFnLbPvXkyq4Jxj9eqTm5oiCnWTpQZRQkBI54PUCxH7AU?=
 =?us-ascii?Q?nz69gz9ZU2pzR2TuKyCTaWDKANtMQtRhUhGvuXEsP4Jamh5AuMZyj4+W9YFc?=
 =?us-ascii?Q?hq2+55WRZn0NjK6iH6IZyDkGIgvDrcNOV3tis+VEYizxUnCfhsdVzWXi8PPF?=
 =?us-ascii?Q?n8JEG17PrtovQx6cwwE1uVUOlds7/JDDGDyohK6oSalG74U4QvVGM8Oqm1gB?=
 =?us-ascii?Q?X21KjXiaS1Sz7+Jl7TklWcbMcCZhejaXjr4nhi6HXgoBfP3hScMnlr7/Yxj2?=
 =?us-ascii?Q?TbOxP54CssaIGuWRSdGWXTLqsyVeSI432rY/iEqaiMIFAuq7IfYcaWAkkDkh?=
 =?us-ascii?Q?w3dYsxDyqFN2GrOVOlZNFyJQV9hJgAH0hz2Pe21SlJyq+XOBOhKEoAqLjewz?=
 =?us-ascii?Q?aWUD6OYJJwK1sNBW2hDUpnUtMUD4JZzlTPxViSwCqMkD/AXh7Dw4aA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0yXjS+ZDYpxzSGgqN/LQXFH+CaXtG6k0FOcCQDUgcNtXIXwdm86UBburW88t?=
 =?us-ascii?Q?viNFW2F/ZZBQw2/rDOqkLv7cC1hQJb2e3C+5y9EuqaBr3SCucDrtiB9KQ2Hz?=
 =?us-ascii?Q?rYlXC9i3fQiFoLKZocxJ1JoTmKRbEiXiv/VHHeTKcCXMIlmacA1whCwEh/ov?=
 =?us-ascii?Q?T0TQsrXr79ZsrLA6EO1CF0/CtQy6CZ9ztbyYFnzL1C6S4WULDzQuk3pR23CM?=
 =?us-ascii?Q?LfktVXO+VOf2HCpBmMX8Ehu5pFT5DwkzezmIjZElIQuAK5b2nhGHBGpY7gk+?=
 =?us-ascii?Q?HbPaRqwCmZZyXySl2p1bDw5POdosY/4aGdvqt8oQZ5rnLxPzagaox+QjfqDm?=
 =?us-ascii?Q?kTNPcFbI0tS1z9wkX+p3mc7eGWh65nVBQqxvjgt6DfwJ+eGcmTySn21O7pUj?=
 =?us-ascii?Q?MHivQMG5ykE4XRow0jbbVFKllD4A/5ggyXbBhp0TvxAwVMInXUSo2h8Qmy+l?=
 =?us-ascii?Q?YwwzKmMZrXoDQV/G7G91SB+cZSGk8VoVKv9A9dMX85+Z/eO8ZXPKo070lsgK?=
 =?us-ascii?Q?oHudYg9pbN7AmsXgqBbvh/DdQ/Rz60tp8/t3H4eRVkeov56NRdaXMyAw9UpA?=
 =?us-ascii?Q?0mQH4ZrwhUVyTVaWvWnaAKJ0IYlt67jr2ziOmpy3wYTJu+tKw1AF3L0s8bgT?=
 =?us-ascii?Q?j6XS7WNSrwfr6D194BkT2jk9T4drK+uxLo+BMmBt2/IHh98mY/GHNpaL9awq?=
 =?us-ascii?Q?JRdvqOef8ugAQY9ZeAVCshaNf1tpHc3x1LC8nkhUxOsRDV/DYfFx9nvFpt+r?=
 =?us-ascii?Q?HlfGAszvwwN8bd+Cr94Jcrxt7mMY0H3hfoZBB4XhoLgqH0CU2b4GYdxWo6WC?=
 =?us-ascii?Q?3+boAA5H5BJc5NjrdrxleApokwb4stHWRI+pABVqN6q8pI39XRR0xtV/DM7o?=
 =?us-ascii?Q?8W2PgAKnon0nGsBmh9JckE2IONjw7Pe66hhsfi42b6tM/LxexQqLWIlWnMaZ?=
 =?us-ascii?Q?8yTweWiCgU6ZyQReLsi8afp4GsDbJU7Eh4J+GD6Q0DYcJT5RZk5uevs9n125?=
 =?us-ascii?Q?FZopFZMADkAKuBhxVgAA7TKyIex9gp3mgXzicLzP3WV+NY2rqtzdFxRzW5QM?=
 =?us-ascii?Q?9xse4DXg5TtzAiZHIz8Zxeh+ZlKCiEsma76VoJx7wCWW3waNiPTOtYrUk95v?=
 =?us-ascii?Q?M2+6h/eILR2A3hrrxBxzIh/P0TmdFGctlZNW+6Zt+S08Sg+1eZHRSggcsFWR?=
 =?us-ascii?Q?B+4Nz9tXLu4WG+aw9tp7Pg5dwROPSFfzFeRqefErC1NKdgnj481lAU4PzvoB?=
 =?us-ascii?Q?AuBze6TDwwv/FMYU3ARJMI5LCbJHfyAcOUVPF+68K+5JLHnejNR23Rj9sPli?=
 =?us-ascii?Q?rwbfOrqvB4iYD/WD/i0zyMVTl0iaJyGxDyl6oifr1ZkYrnUzPuONQ9zPN1SO?=
 =?us-ascii?Q?Z+OeAk7K4IuU3fZ5C4f0irJLaVdmt91PAPMN61jKz7MB82lydSSgaVXnfyxU?=
 =?us-ascii?Q?fY0pK/7ovbr/LfdKj1qmDKAfBmYd7UaUfKdwis+9ArJOwLai5gFZScqRZxMW?=
 =?us-ascii?Q?+gC/HhKTDGzUbkl2FvNdpopaCWdj2llHkqNwqy3lgjLP+waKnCdaXe+Bbi5B?=
 =?us-ascii?Q?yAKvcGElrmlVegNk8N91cjx0kvrzj4t2eGOPCsCY?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7bed6f-4a38-437c-1643-08dd9939faee
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:07:26.0108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRS8kfiaFTmdhW5ECxcVkSBqBACaVNlOEpG9ezrwbvRlHbR3/EN2zt/NXaj1cs+aLEaIsN887DAt0dBUY50X6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9ff46c72dbc1..f3f9ecc0866c 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
@@ -42,6 +43,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0
+#define MT9M114_PAD_SLEW_MAX					7
+#define MT9M114_PAD_SLEW_DEFAULT				7
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +392,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -650,9 +655,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -784,6 +786,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = (sensor->pad_slew_rate)
+	      | (sensor->pad_slew_rate) << 4
+	      |	(sensor->pad_slew_rate) << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2398,6 +2407,17 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	device_property_read_u32(&sensor->client->dev, "slew-rate",
+				 &sensor->pad_slew_rate);
+
+	if (sensor->pad_slew_rate < MT9M114_PAD_SLEW_MIN ||
+	    sensor->pad_slew_rate > MT9M114_PAD_SLEW_MAX) {
+		dev_err(&sensor->client->dev, "Invalid slew-rate %u\n",
+			sensor->pad_slew_rate);
+		return -EINVAL;
+	}
+
 	return 0;
 
 error:
-- 
2.34.1


