Return-Path: <linux-media+bounces-18591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0E2986A2D
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 02:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A7D2814C2
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 00:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEAC189BB5;
	Thu, 26 Sep 2024 00:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kP8K8fZp"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D1B1DFE4;
	Thu, 26 Sep 2024 00:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727308867; cv=fail; b=lS+YMVkJtFWR5qxc4HH/OEk1fmcq6bN0me/EaRExiIubn74FR9iTq+JVHfRJ8hsp54WuGQvpACocQMjcXvwZ9UMM7a9eOjC4g9xujJ9MNdpICP0vMJX/s1yCt5oEFjebtZuwk87Tep2xwXVPjk8TYnJ0Ysa9r/sQSM4DOzCVVOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727308867; c=relaxed/simple;
	bh=YTixO+P/00NtAvhz7qNrMCI2D7sGMFZEkJn2SvoZwWY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZF46oDgiAOGEe6VQwXRYNlqehis6Bu7BBGwhQD7zfuP7bSaHpBC8yselTaAWQkP77kaFiBj/ufjUMZOVb5gLfV1ErIZ1N/tz2PCjMtBK/urBtW9UvbJSpKnnq9CgIYh9EPEoV1pBb2Em9in0+Wk+bjFO+H2gJ3pmDZZkx4LNI48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kP8K8fZp; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBLHmAxJ+5w7wkWE82tKEYvEuhEtrGzNtmvvXvVV2y3MF8OfuCgn9f59UAAZVb8aAzLFfJU+w5dyKDidjOdbtIuQNlTOQSbqS8noCYIFqfQAeRJiDEMN3TGVWqMwO8eHVHbhXo0w2YJK73nPJ/unmZigXmblYQstzJJFJBFWlL3lLOpwN/kgDlPJgxzHfpG6sMNaI25IVMVOA+U9fJJQdZVXRcNrygfiHPGChqxMfVVxG9elePzbOeA1ol2Se/j6xQW3iJlJxzBHJRAVUA+cZnWmk6nu4EUMi+qLw1Z8p694IiFHW5R3r3F6vv4+l8TnTxzmq6FMwa5uRrgQS6zLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b26e4lPby7BLxC5zKKY0mudtjlBHT32JbnaTQZ/9/W4=;
 b=QEU1ZsjkTeTQxkjWuQkPZMFYTtIdrhXej+fJBjucpbtQlcLsCeHtrK+8iBuAFf2CZk32CdtrzC5S9MVGOaTG6Q1mMW5UqGPgTC4dingUqx6dFhWnZckgrQeQgjW8nfjfkt6puNSxu4+ABMaQ7e6FN+FtF03O7GBrjHaASYkThBdhx66gBlQZsXRiWxs7Bp5ifEzVWwYC8lg59dK+Hm18shlObm7cAtOa4xZGDewrcbO5fgtxFPHFIwB/QfcNTc9SFfDQUweDF2zuTMyHczyZUnOwlO09TKHvqXHktZNKuNPi7Y9NvT0Q47prWT8USe4zBEaRjgLrjREHC7sMqik88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b26e4lPby7BLxC5zKKY0mudtjlBHT32JbnaTQZ/9/W4=;
 b=kP8K8fZppec+O/mfdUJPcIfyBOk844pk/SJRJrqJKrNTo1B6zlESjFBcX6mK5pbbSorWmiTDuN8pfZkLplnamAkGLURFCXLZwi7DcyPtOfsYAVMu5Kl1N+SJZ43qjfPC1TjJkNu3iQmny+O1dGVh/1Ys82MueBqEv4lfmFKVX88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB7353.jpnprd01.prod.outlook.com
 (2603:1096:400:c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:01:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:01:03 +0000
Message-ID: <87tte38erl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 9/9] media: xilinx-tpg: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
References: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Sep 2024 00:01:03 +0000
X-ClientProxiedBy: TYCP301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: dda8066d-f7f4-4ffb-1e3e-08dcddbe4fe0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xY0UhKWXeGyAVInM8xbmYgRXLyKvjVFGXFAMz7JS/JGfiWHt0skBU0LcsxYX?=
 =?us-ascii?Q?BraCEnSBUx6Y/Qxq+7Qq+Kh01qiY0XF1Qa6iWb8QTS+ciVHNhj4xIczTwmIl?=
 =?us-ascii?Q?IHpZzN3zTn/4NlfaNqw4Eqhnx76sB6pI0dvTTNHUQQcKy5W+2tlkFXQt6BWU?=
 =?us-ascii?Q?DNdHDjpmHI/2ZaaFPpDmbADNiiz2pEHKpb3wbYzaKQQFC0oo/muYgYds8X4C?=
 =?us-ascii?Q?k7X8SvaZiixTx6xI3U03N+2iaTrO1Id71pFYWQ0lVxSkqliBCWrLqJG+Hqd0?=
 =?us-ascii?Q?xZ+k+zy/21aSYL1jM+xaJQtOFmvDXwBgndxEKvVj/yMmXiPe8i/AMgEqImah?=
 =?us-ascii?Q?qBcJVTlG7kzl4Rt0NyaGoRyvCSCZTUxCbxGzZzyuDmdNgTb2mwJR64S9cixz?=
 =?us-ascii?Q?Q07UqiRaowZITAzROOYelQrSTTmag97iZuoWnuFvwSKWBMe23QrtNLvVPn75?=
 =?us-ascii?Q?rd3UJIHq+bks6B5bL3XPb74P1JVOcN4h7efKcPkiI8XMd3Vb2srcH+xzHQpQ?=
 =?us-ascii?Q?+RqFrOjSMQNSB6+r6dtX4/dxCgRWaBcTki66DDFKtAZGx8I9V9dklUsWHwoe?=
 =?us-ascii?Q?4DWJzHVh/G1MAUptjslJItjH5S95RUeztk1vvQ6rw43lz7qpO3iFGQo1gkvq?=
 =?us-ascii?Q?Xypda5kC/BZiQIc1IQFEBIG7eldj/AiJXJwwl1Gc7EcYH1Gv+Gd3rGpdjSya?=
 =?us-ascii?Q?CYg/uNlBFlqyBUG+lzPGp35PspvTkoQ6x6tUbyLQHIJNKM6svV+yyXFrmTMC?=
 =?us-ascii?Q?PGbsyESvKbW7LQaSkLiLY4V1d2R0RvH6unURg6400qxPkqTDQVY6LnQnNr4F?=
 =?us-ascii?Q?CoHd+pWBSP96UX7GyjSxG23Fg8j7M83mH41fJpfO2fYv3sx3hn55go7vjPG8?=
 =?us-ascii?Q?gPurbfKFCJaXayYuDHyX937NI3fUZ4fGRAuBsfQ8leNPTSVn38egRpNIlTXI?=
 =?us-ascii?Q?ry8tmYv1sgeQ1eWYQ1qVV1FjAAICIkaj9yNJVHjzhWPAKosO02z5A2n6K1yE?=
 =?us-ascii?Q?vfJZRnSbkjXwxDcOVEfH3vESyadz/ZPQhIAQTIA8WlfZ9fyQHlf1CA51KHVn?=
 =?us-ascii?Q?EBWDls/nP/geUgJCY6qm+OEw1MEwDeMripWvj2aaA3uZUY5HskukLqWSm/Xu?=
 =?us-ascii?Q?hwSHZVyuL0rv5vC1uDmUQ7j8NC8y+F2O+ts+U1Ff4l8pfSh0dorsFWrAjMge?=
 =?us-ascii?Q?Gmtnt3WWOlw56+HzgwtVxc5xBEepUrdA4NgvSR/dHKr7Dy6YtrBwQMmNhYbG?=
 =?us-ascii?Q?66a1xS4ewXFRSIBWj11t+iNvjc0/fnKekA/39+GumGEa99PwcESQzkkN5RFU?=
 =?us-ascii?Q?uWApFmpM+4yGjhDKXkGLYrkIKUWyPr3wmhLdItCTxgmsylFG0gNMEMguFdyR?=
 =?us-ascii?Q?GuF7wQI7lKU62f9PDE/RQagT40emTyBoK8oAudgn5qx9eZiNyePhVTpJQmBR?=
 =?us-ascii?Q?5WVH/S3FcS8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mVRyEygqrYTGMtDHYZu10t9D86mNvBP942FLSnt96+bxVRm7JeU4zYxJha9w?=
 =?us-ascii?Q?tZiNN/E5I2gwcrVU32bHkvH22VCPGXXJdJK0WJFNd4uucOxDgmUZzbCHDz8/?=
 =?us-ascii?Q?7zyCWPjFfRlNbvUTekxRxpCcn18JenaFWXm2yg3eG91W9Y3VLA1uTRQY7pWf?=
 =?us-ascii?Q?VY9hjRpoKK7BKBrh9FsygCThmEi+v7IlfuBlxkJAevID9nSiBghXpY+vacLD?=
 =?us-ascii?Q?AUHBkkfAIz5nnnqzqvBcHQ2DAVv32nKJyXPEahUxOXBu+qarcNjFovpZufKV?=
 =?us-ascii?Q?dYUzIUZNUO7DMNSzURatLWGAmxN9z4E5+TLqhn7f8h5bdmWSxF0gqx8WUkQK?=
 =?us-ascii?Q?4EsW+iA6MKufoXVNEzXPO0mALnCdffR4CoYP53cyQr5jkfSHLL77tTmHCPW8?=
 =?us-ascii?Q?TxXAAakraTqK3ZOuLuH5vcuFrXlhugdxJMuHlXlHXe1G3ChYYEqNnlI09jhQ?=
 =?us-ascii?Q?BZHKx+Fz5O9M+kaM8tIpY5a9Hm/ZJOksBGv6PVP8E0PPaFlqXhoiHGqaBmcL?=
 =?us-ascii?Q?pIngB6hEZMvg3UZyH7Az0fTJKNjpLp9tj5bh1w7Uf6e7zMf6595LqW6AQMRC?=
 =?us-ascii?Q?eNmMB3xeC19d7/Zx600p2HJJjJRfYPnA+e5wB9/4rn9m2NVCIClDEbFPg57u?=
 =?us-ascii?Q?lDTBQaonmJjAtkXwIiZZvIkUDnsw52vLXF7GQ73cbPQSu9wbddxDFInjwPcb?=
 =?us-ascii?Q?c17w55w8aNzr7a0FOnDZzALbCVOixNvvwteFyWethL0DPXnAYi/WYxBGB/uk?=
 =?us-ascii?Q?0n3vndKbFWysrGvjRSLRCJkK5u1WePAPwCKTnKzKfyFJv0YlwVrwvDRNL4bt?=
 =?us-ascii?Q?WeQxiz2+3PZGQkxiTmZ296xZ4hVNy4P+ODcqE3vFjmESBk7f2WgxcD6fQO4w?=
 =?us-ascii?Q?d5ZjvXAugs8YUBu45t16JVEpZd865NJTpMUQrCYAG4PfMJSARNZ1QifH0EN7?=
 =?us-ascii?Q?dR0FsAlB0+uXMlXbZ1Dz4H9wBwtMri4zGVoAlcSd1peewyHnXzU1rVZoGx2G?=
 =?us-ascii?Q?73csTVu8Bv9hFDUwqLPe0TVDd33TZFxZyDfxAKL0uovNxFTYBJ+393HI9MKf?=
 =?us-ascii?Q?XCm0e5D4zEM1r8Ud8wP+flNDb2qEQ4CvFT2nawADn8rzL/7XYbqEg/P4Gfyf?=
 =?us-ascii?Q?CgS4eOhwUCltYbAFwy1sAd8Zn7k0hSLJrJzWdPT2cCMtcpuJaX5QGS50ZT/5?=
 =?us-ascii?Q?R61kuxm+cEzZ6yRfax8b90rho8Pgj5DLd26Bxc3SinrZzrMU5TZOtkE0QSv0?=
 =?us-ascii?Q?kCbhoWmFUWzGUb+Sa4FQIP1NP9GyeVhpwvApflahZmobC4rbBZPqMnI4foUW?=
 =?us-ascii?Q?zP4aMcGnMlOtRwIEClHMtqV3YI+Ox4g8pSeT89VJUxCyylTbluXrm+tNdK9G?=
 =?us-ascii?Q?IFNkDcXqVtPzW+IVJ6sEkbQjgKBQLAGAXl6l32eCLsWb6IEZGBv7ZB02f0kE?=
 =?us-ascii?Q?zhmmlp4ObLwWXkh7Bn+H5O1XloiBM98eNgsV3MyIc2pR36aZ/1J8xz2N+15g?=
 =?us-ascii?Q?ybMJ74qFhDUBmLwKufDnrPephQxQcOVhdbKI2cWu6sbPPimeGIdpveguvxez?=
 =?us-ascii?Q?fXEODf9pt4VvqEcmO6m2GCnAmfXgYKuRlLUL3sfyp1Ly6Sd/Ns11J/3Qywrt?=
 =?us-ascii?Q?KEYq86LR36+KOJ//Wbl8mmY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda8066d-f7f4-4ffb-1e3e-08dcddbe4fe0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:01:03.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CQn5cTZi4Hkrjn5ZDG3hlzTG5owcJdhUFzJ+R3LQInLssiIa1gbPQQxgb24njV1Cwwom6Xgn0VMhYHFWIcm/MECFu7NMUHltUTRWyf99bxYmXuFzOy7102McVL4VVmM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7353

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index e05e528ffc6f7..1d67f576a44ff 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/xilinx-v4l2-controls.h>
 
@@ -711,22 +712,13 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 {
 	struct device *dev = xtpg->xvip.dev;
 	struct device_node *node = xtpg->xvip.dev->of_node;
-	struct device_node *ports;
-	struct device_node *port;
 	unsigned int nports = 0;
 	bool has_endpoint = false;
 
-	ports = of_get_child_by_name(node, "ports");
-	if (ports == NULL)
-		ports = node;
-
-	for_each_child_of_node(ports, port) {
+	for_each_of_graph_port(node, port) {
 		const struct xvip_video_format *format;
 		struct device_node *endpoint;
 
-		if (!of_node_name_eq(port, "port"))
-			continue;
-
 		format = xvip_of_get_format(port);
 		if (IS_ERR(format)) {
 			dev_err(dev, "invalid format in DT");
@@ -744,7 +736,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
 		}
 
 		if (nports == 0) {
-			endpoint = of_get_next_child(port, NULL);
+			endpoint = of_graph_get_next_port_endpoint(port, NULL);
 			if (endpoint)
 				has_endpoint = true;
 			of_node_put(endpoint);
-- 
2.43.0


