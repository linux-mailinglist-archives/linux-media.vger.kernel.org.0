Return-Path: <linux-media+bounces-30582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB97A94DD2
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A20F3B1DBF
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FFF259C98;
	Mon, 21 Apr 2025 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fVg2Pm2+"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84980259C9F;
	Mon, 21 Apr 2025 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223244; cv=fail; b=CFTEF3T7LL7xErg+5towsLdtTsREX8W1+EHRRmn3FyMg7pLFwg89vJ//hMMr6lyUh7uq+MpvGjFamzMJs+h0X7cNJXCgxxvRuBTmWimquK29T23FGgTnykUaARq0eFP4kPtVmtI/urSb9qxFpffR/JSTfr9HYUpB29U2c6sTJRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223244; c=relaxed/simple;
	bh=XsQ+Jx9+1BCsKH5wHybGhUU9OcVbHyUFTg4TCaQYXs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bfll9oFwCdPyzYXlw46cjHWL6YbqKQ+56dcwZKrE3+iDOu1agPSBbftbsNJM/p3juaYWVbVze1TMGApQ/31Qa2cvXsCbCISsaQM/N0yftmLza2q/AcbxX4c86+1Td3cu7t9jnhO3rmJZYtyejqPxR7aEhC+yrVfys0EQHeaHqXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fVg2Pm2+; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifh3Oh/sGuPGgO0rIFkNnZYD3pp1NMDhKvq0AfGwzwwytzg8vkLk/ZAIx21zYvliLzYKaQSVn87DiKrukX6z4MmNzIdwyy09V2Y1dobnqIFCtRrM7RyxqkaXanfRKvjQaYpXCQR0wswTEN9+m6fkSuYSl3+nm1o0xbRPWSSy3m0B12QuaaIwcezdcoMEp11M209ncajpK1qESsoWWncdZkAw19txVPuNqGe6YMYfRTzmC+gj1PJOTjf0NKG834o8XXbfu5mq2pnHMTWiGPYJCwhySPDQBGyVFN0vevmXz4zeSuqBD+5oG0DF/0iwoGtTojFAeDA74crPxBtgWN72xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idSatLljyUS/fQzPtC0NwTJPhsPgUQVYeIZONZmFeeY=;
 b=enVrh+gGREhG1SmPeX79luhbtFZbb3vDjvISwjmtWYWf7a9+UYzpQ57yFiV7ZATHGIfrQoyBc3Ce9IU3Bh8WR/NAWP+/NrTdcntM9LqF9G5Skm1FLARF+pQTtucJtg4+0uDrmNxG39SE470ObC6lLP5CtvnHS0juul1+dlrIAN1qvePanHi+K39eYaM6cbnumcoa7cRiolG2Poi+rDETn5OEd1vrGTw2CZ+mwyM0dOH63czySIYmM+zsFNE03EGrCbGw4MkR2m0n7xUMc8YMRYb8Z+BjRNrrb9DKjnFtdJo3CM8yAwudttwlcNsOHvxor8HWegLFc9DlCkm1KMu0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idSatLljyUS/fQzPtC0NwTJPhsPgUQVYeIZONZmFeeY=;
 b=fVg2Pm2+xW438MhfdBGk2uO2Av4wr9PoyrkSC5w1W7i2RJbQkuD5GfHVQqgV7dDAHPP7bQuu5caDFAs3yOGa7X6Eprqo5DzVNGw3JzsUKrSKAGpo1itNBlr9Lm24/hxoeS9yNP3c3jBJkRDvNw+U7dLrkz3tBOOdWPAfCmBAfgTATTkU9KHnfbdO5xTqw9893pjKdeOnecFbDCTewdECnTJ+yEunnWiaHEsTuU7J+Q60HrAMmw12MC1vp2Bb32hZqCbSmiy8gPYBLcuBhukajb42ubQ0x04zHm8qqGBnK+qMfb15Uto8p/aatst91zLLPIGKIui7v72bPE+mE3TaQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10104.eurprd04.prod.outlook.com (2603:10a6:800:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:13:59 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:13:59 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
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
Subject: [PATCH v6 4/5] media: imx-jpeg: Change the pattern size to 128x64
Date: Mon, 21 Apr 2025 16:12:55 +0800
Message-ID: <20250421081301.1304-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250421081301.1304-1-ming.qian@oss.nxp.com>
References: <20250421081301.1304-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: d71cc92f-3861-4464-3eb2-08dd80ac77e9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GwNj1fTkv30Q8O17Sr9JrCzbjeAIISwKhGdXOkulXHJF0pDVNnvCVn/6Ka3b?=
 =?us-ascii?Q?7zeTQityVjSE1Rc1sWAbo0b8jrenliDB4Du5qlzAZB3AwQk0RI/5MZyrKuwS?=
 =?us-ascii?Q?1Q1ZhRde9bBRS8Qby3UOfQAFmz0R5lNPkFLyQEYxm1QbGfTeQoOj7myaDgJv?=
 =?us-ascii?Q?DrFTBxuIijqvpJNoZceo4GYhOdcf/yQQNJjfGwXnMfKNzcHMTp9u/BuTqu27?=
 =?us-ascii?Q?dnwHAjTjxYjQP2N4Ibv4U4tMLYKnad4gbjX21LEfziyRELIiDMXAaYmsh2sA?=
 =?us-ascii?Q?KzpVfHdAXcF64kzErOL/Cz/3rf45XKx2Wj0hfWzlNakN4mM3+4sYiWnv/L1y?=
 =?us-ascii?Q?3Atq9viFp7+wLiLK1wWAKiYvoq2h6YNzKYJdyg9yrJmZ3yJAq/szvuy7ycLf?=
 =?us-ascii?Q?gqWUT0g+j7XHof9iIBB9cmkFvbECdIPUJNuhBuBxDKTQ4b5E0Eg3VPyXiF7J?=
 =?us-ascii?Q?sxaBbvlh/zOeBqMVhqO2yfUFAMKa4cMblfMmjUHZe7uDEmeRgXX4BXCL8MVJ?=
 =?us-ascii?Q?4I5aG4GzeA7nlsML/n0rS+w7YwSvrKTzcCMTyNeRh9ntghlxttsR4U4kTBC8?=
 =?us-ascii?Q?saEdEBVkN6tIOXN3mOkz2WLUuWNC6bkQ0lOiyJtkeYY5xI9TBA/zqTRxn/3F?=
 =?us-ascii?Q?j831Y4wMvFOE+GB7WEMXtESO2hVBl83RxsFDSDtQQQ6rSJbHoB6jJYEPBIWk?=
 =?us-ascii?Q?z0xuVMKuonZZV3sCFXUkgLSfwNzn0AkpCqb1CjKPlaTl53aCMzpalzU5tzua?=
 =?us-ascii?Q?CFhTFqeXKc+xh83hqjjrNUcXY0BNr3/OzjaBqGpghxQfZb6nD4sXY0eeBCMR?=
 =?us-ascii?Q?AN9Wy4HLrvAqf9oxAH4LTvn7COEbv9RFqd6KN0z1+Di8ovNy2ZaSJkbC92C5?=
 =?us-ascii?Q?UEgfeCODP7O+dQHlUi0oyHdx4Qc8l8rg5j29yRZdi5Avcrd7aCZ2VJrKN9hZ?=
 =?us-ascii?Q?mCPC2TFPFZIpQCBFC14tNd1vo3rR1IsPe+aK5jE4htijUWCg1ZsiqYW4jDXu?=
 =?us-ascii?Q?IK5HqEWcTG2Su1rW2EltWGbPZ4G48V/YLtZsF1RPm/uVNpcietoRZ+6PumcO?=
 =?us-ascii?Q?WZjmK2vHFMmfrxMPbi8tKKrNXm4pKnxvMZYgdGn7r4WUoMQkgFN42iFQgDFV?=
 =?us-ascii?Q?oIkKgRTmeBFbdyOzcmQ77SHukdAxo6nfAxDg08ncY5IknKX+3bKzVCT9vPCn?=
 =?us-ascii?Q?FjOpzhioxLyWdfVvrshazLWVK02KizbfiRcxmj8e6KpzlVk0VXHz5Kxo6I8p?=
 =?us-ascii?Q?4uKdp8ofY40KHW+rPjh7ys9tswCIMQueoxCEKpCABwlKasA/jXw/ZwPo5ind?=
 =?us-ascii?Q?cFXMpmCQjCBj3b/JknkW8J9njbc2BLJn9OcwtVo1H3s5DbIdmKzJQdfHIyyQ?=
 =?us-ascii?Q?uQ/KOm2rV5OJopdmUD4ZSJ2h5CiWMvBbHriL1R4OrmydUitgcxJAhDaZTRGi?=
 =?us-ascii?Q?3DvGLWlijTpFp9WWvpZJ9qDrEUnhVD/DCFdPbP4xpc57lyA+SZf4S54UCMAk?=
 =?us-ascii?Q?KT5lcbTwGXJfqV4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4BFRh3Rz3ogF2siFPoCKRtleW75cdSp4rARKOjUIpPt81sewZ5SInYaF19UX?=
 =?us-ascii?Q?0U5kmfvPY+DTohOpttCVyvhQ1PGZcBwMSgumfKyX9L+cFjbtRpRxcM717Nj6?=
 =?us-ascii?Q?yyrMIiWpFoJ7R63MM2vDMZFeRbmNMZLLncecEsp3xq68WsJMTht6GzY54M+v?=
 =?us-ascii?Q?Apjodj2wNNigkpbeUg6eWDsvd8Je7hag7lHaAJqwUXTDOdca6Ee8G7XebqoZ?=
 =?us-ascii?Q?xl/uF/jzLnDcjPvSBIpb9kZOfv0FBFbVF5Zqk4zC7i+Koxrtj2YNWMg/kDDu?=
 =?us-ascii?Q?eQYTDbUtcfxOxfDHyi4NAKqoe/LON2jR9Dd3Pr4r9fjIpOCxvhVW1dJErx84?=
 =?us-ascii?Q?bmiiqDTMCzUV/sW7BlM9sO3L66hby22IJRPXHt6St6rfxLIV/quExheLSmVc?=
 =?us-ascii?Q?UI3YyQ37Yt91QjAz79MQbJUxdj+F1xb/STbKbuRmRE+z9ITGfOTfBeK/mK+P?=
 =?us-ascii?Q?qzBkCyMG2w0WfsTZNbH17qmEJjPzmrr1I5iBoz9dMlwd7X5aVZ1e2I/vKQFo?=
 =?us-ascii?Q?BT/V2VNiy6jMkgiOrEbrt0/wE/iCWn++V5UTOcmXQSvdpHJFQKzqjAEufvYB?=
 =?us-ascii?Q?uhTo0Rg64Na+M2m4a9ibZrJRvH62GrGdqtlodgi0v+rjY2+CGAPrm/A7+AYt?=
 =?us-ascii?Q?/pNSBmSoCcu4uMi9R2Ij2wIy8jiaU2IYGQiFqQ7wnroQABuic49R7BshT7Iz?=
 =?us-ascii?Q?JZobIHTnnJzoXjSr+21sBB5bqMYCZJ4F5iHTsG39HZbdo6b4LXvB74liwu2u?=
 =?us-ascii?Q?tGcgX1+3OvV0g2BCqWs8BpLo0Isb95z/YYjFXGO2ozoiAa1aZkRzOmJJQk/s?=
 =?us-ascii?Q?331zrKiSxYesyQATuOJ3n+f98gnRYcXMc8n0peQpPWvdVLaYtySot584BRsE?=
 =?us-ascii?Q?6078PUF2Mh4iGLglCPnoJG9fctADYP+Vkdpy0mc32Myc/Hnt4PTAVXeXlHBy?=
 =?us-ascii?Q?ZWAoyfyd9rWzHSvJadP/gQhZrelbcDCaMCdSNGSY8in0MEqHMvXJU+z2wvyO?=
 =?us-ascii?Q?/2cXKM1TRiE0MI0L0AVqCpTv/WvnKVYh/Akbf2Wnt2tvWchSk91m0myoJUf3?=
 =?us-ascii?Q?j/yIrMOH7vHxFJZEb8B9Ku/WuH7qAz2Fkc/5aN2Lda9PSQ8X/F5V+7TVpjth?=
 =?us-ascii?Q?ZeSV2/k9rvByF7DG+MGgB+rEg2ynSRlt7booNLzOiRSeo/Xow6T22QYZjI1F?=
 =?us-ascii?Q?S5csYfB0tSBx8okZ8gQ5YdumQORwZ1ilD7PwSVHfw0e5ACN2+4Y/YHcZTYq6?=
 =?us-ascii?Q?xOhOCqZONOqDXVs2Zj+Bh5k0Sk0j0AQVN90d3S0vpGkX1dokTIaEp8DYR4pj?=
 =?us-ascii?Q?F4IgguVI14kj41IgmQ4X8Vd4N1HPgtK2PdN1VY9kynn1RmzV08Gurtcd4lfj?=
 =?us-ascii?Q?4tt0QpMHiXf86w1dZzmps+ApPEMJko2KtgRnL/vqqUnrGp/zzolVnDwFvjLe?=
 =?us-ascii?Q?VyRgDjxEkWDbiaY9BqhdgEp4MqdS23H5Azi0OI26XMQB2We6dQ8Tu2i6YkBt?=
 =?us-ascii?Q?Zh4OOkmPZ5PygHcoVEtK8bwfv4MIqNA8Qvgw+9wFE8tDtfxeNIeNqzEXLmwC?=
 =?us-ascii?Q?ei+cqy0QahNTSDHi3dIt4+Hg+WGyt0EqlBWXSFeX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71cc92f-3861-4464-3eb2-08dd80ac77e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:13:59.3542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWgtSrIraQgiE/jvP/qKpmD2lTPihEJplj2yRLNQaCyT23ah/iubMuhKJIxFqdtHNuB6jkIZjwE+pwc1qYtj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10104

From: Ming Qian <ming.qian@oss.nxp.com>

In order to decode a motion-jpeg bitstream, which doesn't provide a DHT,
the driver will first decode a pattern jpeg and use the DHT found in the
pattern to decode the first actual frame. This mode is called
"repeat-mode" and it utilizes linked descriptors.

The smallest supported resolution of 64x64 was used for that pattern to
not cause unneeded performance delay. This choice, however, can cause a
corrupted decoded picture of the first frame after the pattern, when the
resolution of that frame is larger than the pattern and is not aligned
to 64.

By altering the pattern size to 128x64, this corruption can be avoided.
That size has been confirmed to be safe by the hardware designers.
Additionally, a DMA buffer needs to be allocated to store the decoded
picture of the pattern image.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v2
- Improve commit message
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 8a25ea8905ae..d72e15ee6d32 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
 };
 
 static const unsigned char jpeg_image_red[] = {
-	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
+	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
+	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
 	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
@@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
 	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
-	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
+	0x00, 0x28, 0xA0, 0x0F
 };
 
 static const unsigned char jpeg_eoi[] = {
@@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.cfg_stream_vaddr = NULL;
 	jpeg->slot_data.cfg_stream_handle = 0;
 
+	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
+			  jpeg->slot_data.cfg_dec_vaddr,
+			  jpeg->slot_data.cfg_dec_daddr);
+	jpeg->slot_data.cfg_dec_size = 0;
+	jpeg->slot_data.cfg_dec_vaddr = NULL;
+	jpeg->slot_data.cfg_dec_daddr = 0;
+
 	jpeg->slot_data.used = false;
 }
 
@@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 		goto err;
 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
 
+	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
+	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
+							   jpeg->slot_data.cfg_dec_size,
+							   &jpeg->slot_data.cfg_dec_daddr,
+							   GFP_ATOMIC);
+	if (!jpeg->slot_data.cfg_dec_vaddr)
+		goto err;
+
 skip_alloc:
 	jpeg->slot_data.used = true;
 
@@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 	 */
 	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 					      V4L2_PIX_FMT_YUYV,
-					      MXC_JPEG_MIN_WIDTH,
-					      MXC_JPEG_MIN_HEIGHT);
+					      MXC_JPEG_PATTERN_WIDTH,
+					      MXC_JPEG_PATTERN_HEIGHT);
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
-	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
 	cfg_desc->buf_base1 = 0;
-	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
-	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
-	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
+	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
+	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
+	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
 	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	cfg_desc->stm_bufbase = cfg_stream_handle;
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 86e324b21aed..fdde45f7e163 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -28,6 +28,8 @@
 #define MXC_JPEG_W_ALIGN		3
 #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
 #define MXC_JPEG_MAX_PLANES		2
+#define MXC_JPEG_PATTERN_WIDTH		128
+#define MXC_JPEG_PATTERN_HEIGHT		64
 
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
@@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t desc_handle;
 	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
 	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
+	dma_addr_t cfg_dec_size;
+	void *cfg_dec_vaddr;
+	dma_addr_t cfg_dec_daddr;
 };
 
 struct mxc_jpeg_dev {
-- 
2.43.0-rc1


