Return-Path: <linux-media+bounces-28806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E22A728CA
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 03:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8227A3B7AC0
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 02:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C7014B086;
	Thu, 27 Mar 2025 02:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Bq7hBQhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A181146A72;
	Thu, 27 Mar 2025 02:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043093; cv=fail; b=DTyUaYZ6cs8MnEKNNFi9qqCR4EktMrHgSPsewHAyeDvIzkmhRE/NaQaluQ2Qye/56H7r/vrZkm621pdY9UONZfE5ua7R5G3hK3sMAAZVz7tP6yE286pOd4Hh9o9hnOEs4DrM/5CHaKeJ/EL6bjPgLEdOLEBqwv9k/ifymn35Yig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043093; c=relaxed/simple;
	bh=f0Lz0B1XipoJHiTzaFzHXap7Bqa/iNsvMeaxsWK7gU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DqwTqSYFfVKDYh2DgNHLEfWYdQeUyBTNLzZGK67Y3PVt9iTeFFj6c05niKf716bnQmCDwd1dBdKAqtsUASVrZswOE0SlXty9eWA9tn2o6uc8DYFm1wq2DE+pr6xue8JgHwTF5KHpVRvj0Au2Jg5f4fy686dEmcj4Hkz4p3dSXIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bq7hBQhJ; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgstqsRZx+Wxpoj6pso+5faX7jUUBRfIAeaJA3c6IEesdy/8FGZGUQsHwRUmTPq4ueAJHcaqscWKCYvqx1cGyYnGNObf+Rq6xwPq8439rsN8oswm3eiWmPUrHpCDzsSr+1xOA7LyJdvm4bkmUpfF18tKVRSPINGXqxTtR7SiyKZzHTu381mdXYrkQERYN9EJaE9hvFd/aqUXYkfExddcacJeJ5DxuSB38XLrBUj5WKKKHLaY+GKU5BQU1FLr+zAcrDuf3+4iL/rW8WL92J6jtd+WuHVnJS8LNiLED6jt1cQ3iXVf+CrvvhM5it1p7XsHsIYAPgzp/5zRbpua/diGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxfnoSxQGjP/HAIa840co84VuSqUb0bAWFHMoToaFEs=;
 b=JBZe8lpgaPGEWLlbVQ6yA1s6+UIEyv3TPwARhj8DmZAaRy/vPSBUyvxTydEQ2vkYKDVKTaJcQwwMlc9NGhsAwh5h0B/1dZ3C42Pkhwwn51kPpMmA6AlVcBbRpCn+Y8CFTTysUBGKMQ081AhcLdJaNkfI9uZzooV9WCK9idKacO2dMJmBieeGQ6Q4cgkiKggvjZYZ0/vhZ2PMrwjj4dc41SJUjtnFeNLsxkR4x5X8tbzkhOgQM9JQv8mTp3Crkh/JCG74zGgCUwzbXAg7iZ7DRDhCgPZRG8xgSpTIgdcIUkquvV1kWavNhFq6krirqr2imfxpwMfjQofnuj+l0eZdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxfnoSxQGjP/HAIa840co84VuSqUb0bAWFHMoToaFEs=;
 b=Bq7hBQhJN0tIMAEEZXkmnjWnd4XeD0MVYUD0FRKx9QjoaaVDaMVJofdPRlhesaAmD0PaWxFbxqamC88B1EkgYaflamLBFPaTZjcxF9pqOGkbjQVV+RJIyci5PPFrs6Tl4cQZopqMQDv057dXD/KxGJOoT8GlxrKSkkf2QIk3wi5k7hUvVs8sd0PXsz3oYFnB8o5apbcpVTkUXOs409FttM1CVEatbAQDkbu/IXVMR4HdQDoMXQcgcEZEcsao0Kx8xF0KeT1q97mP3F8GHb2CyUVFNymEnhXtTDyhh80pEqTakiRaOKfNXbD47wh/+23jiD4DJ7hTX4z3s8ON2Crp3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7988.eurprd04.prod.outlook.com (2603:10a6:20b:24e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 02:38:08 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 02:38:08 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] media: imx-jpeg: Enhance error handling in buffer allocation
Date: Thu, 27 Mar 2025 10:37:05 +0800
Message-ID: <20250327023710.549-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250327023710.549-1-ming.qian@oss.nxp.com>
References: <20250327023710.549-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f021a16-51d1-461c-d0eb-08dd6cd868c1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vAfwCh3/aJKoUge88Py1nmM4RQXDGPwI+6aYVXa+rQ5rKaCx4NlC1Y6qL+fG?=
 =?us-ascii?Q?CFhtwpESDzpD1Fgp0xawXB56LHXi/wVV72jB0FaqfaMAEH1UfVDkCOr8DEBx?=
 =?us-ascii?Q?d8DnIviY6cmxn6IZRpPoOuMDWal03Cr9RhR45mMjjGxRz9Vaotpc5vBksdNs?=
 =?us-ascii?Q?O7VlihRrMC4/0zNvxEXtR8N3gDHqnKx0WHWs70AHTCdG4gKhh0e5E9RGBrH7?=
 =?us-ascii?Q?yi0luBkk2MG+gBJmu4EyeJ0AHJUuyx0FZtLEj1M40wFJ+5afmlqn1NhUqh/R?=
 =?us-ascii?Q?tMz/aqPYkJ4CERDghs7A53n6fF1BF8YyYa4MBzXI4QyY2s18K6+L8FY1ydtj?=
 =?us-ascii?Q?HX3AIKeU5K3UEDri5WKSl6DTlRW5/hKfMXPOnDkygBE0dWHgRNgr+SkOLC2E?=
 =?us-ascii?Q?R3lZi98J+FMzTDu6IFYckN8bmrRctFyVAn0aid1tr4TNIjGIOshwec64SB4y?=
 =?us-ascii?Q?6wEN6pyfy8BHuVL1I6+wyCU2WelM501/FuHJC25A0WbhXRoSPIEIYYVGWc2H?=
 =?us-ascii?Q?0r0TK5VpqTVpi0OKkhoKvmVMoPwQADCiBhJ54C5RDW3n+Hy4MFrN1xOcSo83?=
 =?us-ascii?Q?0vaqUiRpxvwyr0H2LsAc9gR+flnfIIGwouolAOCh0f3X/vTe2TCwPUrVXifD?=
 =?us-ascii?Q?qzMVhd80Rl71UiyChlKdcG2XJvnSszaQp96mj/Et/37boOoUjpp3Uxqw3TRo?=
 =?us-ascii?Q?kGu3HgzUEQ6bcAReQcwTbwa5I7uYAMGPW4JNaGKOqqmkkaAOjlmD51XpTBmT?=
 =?us-ascii?Q?yDVpef/4hF6BNECEqs3psixXsOop+LPQVh7wJnwYUN5QQ3dMj3HIOIpHBjG2?=
 =?us-ascii?Q?t5ywZY9WSYf6HiG0Eu8Dw4oB4356Zb8xMpL+JvJpb70JOIHL5yYRTUHnpaXV?=
 =?us-ascii?Q?1pmVolx4ZGlDxbmUeouvhY83dO6GUBhqyedlyANoJeQ12ePQ49jEJatNgQVY?=
 =?us-ascii?Q?hIiwbDtNFTOwdkQJ52QOU3jw5YEJYprJYYTgqfRIwNbulQsZ4nj6q+pjeXgY?=
 =?us-ascii?Q?FzGdj58anT9qs5jyYLgj+QXZjMUN0vGRBtGR8M/JqMcTY+SGBvXyNRAAVWPz?=
 =?us-ascii?Q?cWUc5CLo4zSWk/ZfvM7SgmDK/3dA1KJU3J3u+OqBm+FgmKwU1cLOYEzacVpT?=
 =?us-ascii?Q?xduB0v/MjQ14ctPNnBJ1yRmg+G2dp2J/2yL3SP5bERD5o20mI+dcc5KfKa0I?=
 =?us-ascii?Q?ogcmE3zEIUvORMaWwETt5Cl9iUqqoRfAAzkVPdXNetD5FT4tMNZQrp5VqvCD?=
 =?us-ascii?Q?Xgf09w/096VwYjjuACWX0un8th7CK1tE9r4s1rgAqhGppKd/PS8Vllw7Vpsm?=
 =?us-ascii?Q?yVBUMlVwQxbWM/xTCjfIiHq8KT4zdvDlUK+A3c3E1OW6Fv9dI7s9noVvUZoY?=
 =?us-ascii?Q?ajJnAyVeO0rICzQDdbKmtX6RDLK8+ICwp/4elFZeF8IE2B6ss54hDjRtFbP7?=
 =?us-ascii?Q?LGdywW339B1Kx6ixREDQJt7/RvhKgDTW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kIULapgHQ1biBDGR4NVd3wrbIbnNNu9cTiLqACyuXX78yWoYAWDTY8JWgkl9?=
 =?us-ascii?Q?THb7DfwOLbMpg/zpKHVaeWpmILlOyh9Hd5ghOc9GgVHaYVdeM8xPCR+PoinQ?=
 =?us-ascii?Q?MADPxFAqlj9ERF35WNbJx2BsVDNDsLBqXlJ8pefpBm56luYCmtUN1zj2JnNt?=
 =?us-ascii?Q?/aMSi5KJrIBMRemKcOKmpSaJTLQ6ItjWXfASSyyQE6/NvJNcmlvvYYYqIFn1?=
 =?us-ascii?Q?zO916otsSVhnduT6PGd0FuOx3BztBFb+8N4mR9NyIDZ/FMtE60W7+Udv2Cdj?=
 =?us-ascii?Q?T2o7vbcxT9RMArBIyQFjxp9LP2bwJSMvEMUZHhrTBUpoZWqQNQWcf3ZLN40j?=
 =?us-ascii?Q?b1qKfSO1wBEsYZcFcowJSMETjiN7bgPNL9p1WOe2bf9CuDu+VmnOVJUl7u0Z?=
 =?us-ascii?Q?p8OQy4Gu1lbkHtkS3oovlX539Mmw4vGJsOuBksMwkj7hUKV6XT/YeECQV+8g?=
 =?us-ascii?Q?L55XY3D2b0UIxP4XrFa9PyK3/qPeKc78snWV+K517O43aw5squqEn1Z3pVir?=
 =?us-ascii?Q?H7yEw5ymLyhUXUZNacuvpboE9EwFsfM6I6XTBq9PBmyGa3gVB/gF414oLsKk?=
 =?us-ascii?Q?OnoAgvNjIN1heD4eURne+dETeQFpcxXFMqSVbGuUypY0+rX+4M/1VC8q22A8?=
 =?us-ascii?Q?0MSjPr/vCMhX2/1PzpOgsUTPMHyxGRdR45vNxnTLZf2L5aE/Pxbz+ULvJNoN?=
 =?us-ascii?Q?bMyBJ4fJ9H+6tg2+gNsNH3KK922fKUPEsx6ysRCV7a6WiIOIShiu3S3z0zbL?=
 =?us-ascii?Q?Zh8sH96n2eMdON4bAIi/FpYY7FYxusdGf3LpS9i39MTTK277LwE7Qkj811Je?=
 =?us-ascii?Q?tYXEklavFNerI6I4wlYRSE1KKwdAkuEJFnOdGvd3275DRX8Y1sUzmi0PdssJ?=
 =?us-ascii?Q?qAJjvio/YUFlUGVQa/z/P+25prPT1+t9OTCesQlkAsIYLNZtkOk5zZvcZgOX?=
 =?us-ascii?Q?54C02ZPdFrUTEl+Bk9UxtU4jXwxrTyLyiXG9dMzxpuByTSrUgjb7axU5Afzu?=
 =?us-ascii?Q?HNCjvJSem5k3jz5z6nQC7cj44Tl6sUmmNvc4kd+BueXo9stFKIZCQXHnHLjZ?=
 =?us-ascii?Q?2hCYtLnktFofb8B6AS0ywzPKrzyy3nhHcvEsZxNzWpSkKA4/t2uCi9x4YTFW?=
 =?us-ascii?Q?CUJAovbvpHNnb8VBCc7TYkNsyIz8R6jMomxpJLalbktRJiJ63zxaD0RWkz3k?=
 =?us-ascii?Q?AnS2+KgZGJcpr6U//3A4RtCxolTt35PYke161i/RWUsWUDY8LrjWVDlGwjx+?=
 =?us-ascii?Q?gvFlqRUlurdmCdDAbqit04iVLisbfxIiMN5LIO5mhQvblBmxwze9Q6hsAG3H?=
 =?us-ascii?Q?DXVi7xAxEbrMbOpf5Nc2xLzLetfGegDoCMp7a00NLg0dGGjENzas5Nsmo2mt?=
 =?us-ascii?Q?8OubWHHEB9y7PAmE6mgQaUKIPy/94imTYjOzSqZ0iTJX0+gHp+XJ9BQN36ql?=
 =?us-ascii?Q?mj3O26Cl3AUFPH4b+Whmmt6ZDo+mAcry1H+C92TcAMnQQI/0llK/FHzewYwi?=
 =?us-ascii?Q?AYUUSYygPDPkVpMCUBmVdYLBFm8pWu9f5CLmEQSrss6pppQr77/zC+ZdoVx+?=
 =?us-ascii?Q?xlzWW0sjYYypt51UVUzIfr8WN6J8bBnqIGAYN0s+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f021a16-51d1-461c-d0eb-08dd6cd868c1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 02:38:08.5354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UQUreTcGPP1G6XychlQ3nvh6U8g4pQmPyrG6JbO7F2nNa3GSiIgqWNkeRggymIYEUavO6ALhjmD1oq8G97+bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7988

From: Ming Qian <ming.qian@oss.nxp.com>

In function mxc_jpeg_alloc_slot_data, driver will allocate some dma
buffer, but only return error if certain allocation failed.

Without cleanup the allocation failure, the next time it will return
success directly, but let some buffer be uninitialized.
It may result in accessing a null pointer.

Clean up if error occurs in the allocation.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 +++++++++++--------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 0e6ee997284b..12661c177f5a 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
 	return -1;
 }
 
+static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
+{
+	/* free descriptor for decoding/encoding phase */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.desc,
+			  jpeg->slot_data.desc_handle);
+	jpeg->slot_data.desc = NULL;
+	jpeg->slot_data.desc_handle = 0;
+
+	/* free descriptor for encoder configuration phase / decoder DHT */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.cfg_desc,
+			  jpeg->slot_data.cfg_desc_handle);
+	jpeg->slot_data.cfg_desc_handle = 0;
+	jpeg->slot_data.cfg_desc = NULL;
+
+	/* free configuration stream */
+	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
+			  jpeg->slot_data.cfg_stream_vaddr,
+			  jpeg->slot_data.cfg_stream_handle);
+	jpeg->slot_data.cfg_stream_vaddr = NULL;
+	jpeg->slot_data.cfg_stream_handle = 0;
+
+	jpeg->slot_data.used = false;
+}
+
 static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	struct mxc_jpeg_desc *desc;
@@ -794,30 +820,11 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return true;
 err:
 	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
+	mxc_jpeg_free_slot_data(jpeg);
 
 	return false;
 }
 
-static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
-{
-	/* free descriptor for decoding/encoding phase */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.desc,
-			  jpeg->slot_data.desc_handle);
-
-	/* free descriptor for encoder configuration phase / decoder DHT */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.cfg_desc,
-			  jpeg->slot_data.cfg_desc_handle);
-
-	/* free configuration stream */
-	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
-			  jpeg->slot_data.cfg_stream_vaddr,
-			  jpeg->slot_data.cfg_stream_handle);
-
-	jpeg->slot_data.used = false;
-}
-
 static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
 					       struct vb2_v4l2_buffer *src_buf,
 					       struct vb2_v4l2_buffer *dst_buf)
-- 
2.43.0-rc1


