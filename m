Return-Path: <linux-media+bounces-27926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EAA58CB1
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CAA116B941
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4874D1DED59;
	Mon, 10 Mar 2025 07:20:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020077.outbound.protection.outlook.com [52.101.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87F1DA112;
	Mon, 10 Mar 2025 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591230; cv=fail; b=nMPXIRVZPqfZD6ZaclkH0qrvhnV3mR8B0FryrLdTuvEeeUps2bHqksn4GV5lDtpcN5N+lBXgHw5UVnv4uke+5ymET3nOKzy3Cgwr34F3imAPAl4xeP9y+ZYrE8+O6cziibbmfP28b74w87HTxh8nImYsV3RzYEv/km69YS0w5kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591230; c=relaxed/simple;
	bh=6SxpglWcPNuyxX/QFkioG/j9oodFdZhFE69fbxt679Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uDVTwfesaWiLF+JS9z6Gg8lcsCn4by7Su+e+dlrU7Gfms3AXCc5VlObN0Cz6vUZQbD2S2Z8ay6DsZgqDsK+0Azu6E2o3MLZ9pypfOqZJPp1EcVJRaobhVnU3p8QNx/bZhGJnOUz/ITDnAOO/sUbbcEFSr8YbMbBB6sEGAD4uIVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+DeoPPhEBW1FT57DVfJY7jnaBC8sYKgUJFOy3ykCl/JFqbDzDORoc3VTobNYsQmZdy0sVz5g7rY+mRjwQMCX9CGSZwNgfQWNJyNdIRhbHNekgdr2DMXVgis/r0FuLOyZjk582d+JRwu3gYX+vSob76FUvHgLR/1dIySTe4Yz/0/IXS3sc04QzMqZ7PGOmtTN/hDwNw3hhwMAmMjCQLxmoNJb3mhIQl8sakWPG2fXmDDE3Rss6KR6iCvdMwYQhZVh/nnPBFD4mFFAaEnZs+gOeMEVpmI5YVqWP+pPiu8w5mEgVxe7+2oykERP80cYhdvf8iGL5F0SANQoBNUgOG3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrgC84zkxbR5GaiRFxx7YIOSJhBTJKzWkZaCMU4ZlIw=;
 b=ECzDA1I0knzEay5Y2h/gNoJpMhTAoQVeTwVmtjITyH7cvt+fOrteORtVEoK2snAWT/jfKv+FoOH+zZYPJ4y9gX0eM4nLK1OPkzpAKBUzSXMZZtipMnju8y/oC+6E09cuFz8YDEjc1i+YIksPVtzbMqYXtXhnGDYzq9QQdQogtcmqFRHCm9kXXI7dI297kMrU4FRYoCSRT7UEEPk2hnrBTnBqQkwnam6Eo6+fNHNTDmihPHkfE9AYgSg9ZkDUvVnruNq819qru7EfUWJ6X00qy5SU741HXhnBbilSjPmHMQhDnMr48RX98h9I7A0efEwKfDQ5Y56V2lbahAaQhUlIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1221.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:190::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 07:20:25 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:20:24 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Luis Garcia <git@luigi311.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] media: i2c: imx334: Enable runtime PM before sub-device registration
Date: Mon, 10 Mar 2025 12:47:48 +0530
Message-Id: <20250310071751.151382-7-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::50) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1221:EE_
X-MS-Office365-Filtering-Correlation-Id: 17da0f82-6ab0-4ce6-277d-08dd5fa406b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1nez9/KGkfwVjEI9fsex+soA8QMfUW9dX1k2OkvTZSiejNHZ+mV2jgMMCTwl?=
 =?us-ascii?Q?mf4vbZMxRyWoYG1iSw5Rf5NFSssOpuNSD+zwSKYKuJZQHASiugqr1JrgaThQ?=
 =?us-ascii?Q?LG/1JGJuqKPeJAbz8j2qf+PM4h+lJhlSNnTS8HE72KgU71A5JOKqQZNzQxIh?=
 =?us-ascii?Q?5bG8KcSJ2FyjeqcSFV/EKPmj0GrPFO88yh4jdVJrv7XQ+2lA9T97qIkG1ZVH?=
 =?us-ascii?Q?1AFUIgz3zwbprere0m2w4+/fDqhT/vJnZGqW/qAA9kh1YC/vQXq+YjjP+Y6f?=
 =?us-ascii?Q?W5LYg8rhhgG2j2y7j/E/Ruy3kA7+6lT20f7BsNPZQA5j7ewWjBtwjYlgCp3v?=
 =?us-ascii?Q?cid++yYRxWfJmQkE3qDFV/IORB6VkEMRdAL6ejsXJtsMcL7apURzmgz0dUg2?=
 =?us-ascii?Q?tAla93AA3Dgn3JSbZD0eB3q5pR7ybIKBtYEiXAK+OVrOtgYzcKIGqLb8xOpe?=
 =?us-ascii?Q?weYJYD3Sm/K8Vua/xU6uq83N3p6s6uiU10SXYt1VQLKERlQbDT0UrJnSS2MN?=
 =?us-ascii?Q?ExVIUBTtl4Nc5GeYifT24p9U8drG0yStbRUJT0Ogfo7sTcVal1GiHFWkB5Of?=
 =?us-ascii?Q?/iSp9+7d34QhMpxWDin1jV6rnupgRakgP+v2wzr960v/jSB9T7XO0JNLJRE/?=
 =?us-ascii?Q?Zca8Bxtg7Se63D9fBdQoBgdPP1EoBKXI6/Pe6cYWbR9prFboDAInmX8HtxhZ?=
 =?us-ascii?Q?dMKGIUTCigEKKoOBG0vZRHquGTPu2GPXoU89N7DWB3gWMAtEkwfycVBN9Q/X?=
 =?us-ascii?Q?WJbnkf4eOQpXUZHTPbahpd0F9MvDm2tEjlgP4u58yuvBCu5IpQSq6hzviswb?=
 =?us-ascii?Q?xioF577QnPkyZQEop9McJQtNU5fmeGoxgNe5FBMj0sE+4sKZczUSOhVEVnN8?=
 =?us-ascii?Q?eM77H1Qd39D/QGzWqYfjcLJgx9p70S9vfQ91O5CCXOsV0XAzPpgqnbtL0Ws1?=
 =?us-ascii?Q?yOpi28N4WzxyNKit2k0dqXDHcfzEtrsCdAkhg4COngwemfOQQsxv9mchK+gH?=
 =?us-ascii?Q?/43fjPAGhcBPDgPjPijEyChaDsnUn3NiYfDPGKoe9y23EqSCT7SKrDLy9Oh8?=
 =?us-ascii?Q?pLyNk+N/hSfVrR3rBGsBDm2KgBI548P88qA+XMrm6nvXfnPSzq3obR4v6MRy?=
 =?us-ascii?Q?PLj/uLrnS0VpyT7lCoe4O8O3B053rK92l94dcWt0mJSb4ov+Bz175QibnIZv?=
 =?us-ascii?Q?bwIeqF+MMjKNddJt7xP70aErepM5ZVsD6RS1JArh22MOWzCfIw+xDZAoHDDZ?=
 =?us-ascii?Q?4kT7SETfALsDRSj2gzyoAAB5IQtF4tEl4y0gm9DDzgw6IeG/S9kMywWsWo9t?=
 =?us-ascii?Q?HN4fsHCx34RazPxcqeZ1v3GSFr6lzbOtCMqGV+9hjv06OyS5s087YODNyMeW?=
 =?us-ascii?Q?3uPhPH2ePUDAHdohTHVTEkDd0Z1kxSsW6EPOYM18Cx3jW8aBUWJVjIWV7cUg?=
 =?us-ascii?Q?b1eAADcSZbptCHLiur1+lVEpyxrDJpX1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XaFplv488EURpeUmCUbd/AEATjeZEQ3hlwvNAy2aKqkLGQ4/zCROgMLIrWY0?=
 =?us-ascii?Q?FGt4VohQ7/xK+bqFrIe9DCs4XUYi0XWSjUzWNwdTGCdm9bE+W7IOWZJX4CU7?=
 =?us-ascii?Q?rTU8xkkKP2raECHA0TxkUsl8Z+vWwKt3WfrU44QyO72CAZLq3doGebDhxZrl?=
 =?us-ascii?Q?p0unjFKBy9HWwgBQMhupvGLb8JwNN49mUs18QlhfM1oqL6DJWIs04ovpifk0?=
 =?us-ascii?Q?2VbQRjRi3wzEZPe1/a8Mp9bfjpepYvQFD7GqbwjHQX9Z9gkvdNj0BZ73Q5Qp?=
 =?us-ascii?Q?fr0t3xxZbNSWPplSkaQX4wBoS1GjFgddy3+8S2P1/4dGSMphu0xO4OdLVIEX?=
 =?us-ascii?Q?Y/DZ/AXH5N7APBdMaQBjZO7SeCI8nrg1CtO8lwT8Gm6b8vedzvLjZhTmCAZA?=
 =?us-ascii?Q?AMV7Wu9q2mdFvAVtIpZuT3j70nHh3mbS0JWuRzXulLpRFyYXbDGrJlN4+AZM?=
 =?us-ascii?Q?OIfUaEzTxAEy2QaCudP97Q+ziyEPNv22Ot4+LXZViIuTgcYGLAhrwzdmwk8T?=
 =?us-ascii?Q?O4D85KbH1CUemepU0Dq4hCzR/VLR45do90x55HZorJguXy3nQsuwZjDkoAU8?=
 =?us-ascii?Q?1RU0/2rZXtubPkt9GJmP88IxWi3jSX3TEwcjJ2IQ/dW5AXjNj5H2kjUhfNw2?=
 =?us-ascii?Q?AwN7/YDXWeKN+clGBZ1prsYUu8lALN/ChBRkqCFAiLPCjOPq07CbjzVBmt/n?=
 =?us-ascii?Q?WqSZ8NwLHHiBXv0/+LizPP8CQOMF/MtTjqb8bSVcYjTy4HOLJItIo4Zs+IG7?=
 =?us-ascii?Q?kvVFkiBio63dajyximYnlQUJOyh0K01L/nTrz3O2qkaaLlDWr2EMgoLAGv53?=
 =?us-ascii?Q?U1wn+ZJiLzAekZZogDGv2cSUOAPLL/l7aUT+7cutnKGt/NIkCOrfFjGD+Nsz?=
 =?us-ascii?Q?BbSeEpIS0r7j1wezHdqNektdhmeW9If4S1SQkmWUP4ivW4kn2gBZRzF2trMC?=
 =?us-ascii?Q?3FYT+5Bl3yQ+fjTG0OElBNedcHlRLOgapINNymTT30ysloX0GDRyUD84xj0K?=
 =?us-ascii?Q?5ZbMtbOoXjDbgaeoQzBzHuaMcurygmh89vQcyk+6xhsOVM7gF2BuhRRfBDil?=
 =?us-ascii?Q?B7UBfKzsma7WPic+1tf+F7pyPtjjLVKN9QQI6WY8wDytZ3SW4lfNSjcbeShz?=
 =?us-ascii?Q?k5Tzzeo5Bn0rMuFjxHPE+C7oA0ywD8zp0xeFu78iOUn4v9OOC+z8E5mHLwAK?=
 =?us-ascii?Q?aqli7UpUfHb8/nnTqPtLBMGGpupyXEUtb/oBzzxskGTupgrl/hQNA4PY+xeE?=
 =?us-ascii?Q?kVNtWVBzKkB2huFDBhJQ5tmDWveEy4tB2zp8ouVQj3kKPOTieBrIG+rYyOx6?=
 =?us-ascii?Q?VgWXoi52ljug4gtpeger4cZDsY1MoWLHYuzq3/I6UtMC1mpgi59We4h+xGmv?=
 =?us-ascii?Q?DAGwDFTHCs2sdHvlcFy61zBYPWsOn0/tuEA5DQ1xXHUEZ+uChUQ4KzYI7ejH?=
 =?us-ascii?Q?GTlESZG1HO4lqLsVXrXzBUet1bMzK3Vq8ztm8IZJdgtdrNOD4PsToJgIdWIJ?=
 =?us-ascii?Q?VvAt6S1XE7jHmlqIEsqhWOghC8DHJFWUTNU/QHPrpRKtp73g6asXH8DU/TCo?=
 =?us-ascii?Q?bNhUJQSS+cxTAdxZibf34Ex4/Afy4r6/FGDZwQW4DQR/6O05G06ZWFNyWuLp?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 17da0f82-6ab0-4ce6-277d-08dd5fa406b1
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:20:24.8978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5OWenMrF4DRTag1d5X7kwREQlNvovBkvz10N38mOVa0RqXBIepLI0ca7VyuJ6IrLnhU5iul9LjnVRSQkby/49wVzLdTpTnk2jfAUIpOvq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1221

Runtime PM is fully initialized before calling
v4l2_async_register_subdev_sensor(). Moving the runtime PM initialization
earlier prevents potential access to an uninitialized or powered-down device.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index ffa39bb317f7..8964d60324e2 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1295,6 +1295,9 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	pm_runtime_set_active(imx334->dev);
+	pm_runtime_enable(imx334->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&imx334->sd);
 	if (ret < 0) {
 		dev_err(imx334->dev,
@@ -1302,8 +1305,6 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_media_entity;
 	}
 
-	pm_runtime_set_active(imx334->dev);
-	pm_runtime_enable(imx334->dev);
 	pm_runtime_idle(imx334->dev);
 
 	return 0;
-- 
2.34.1


