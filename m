Return-Path: <linux-media+bounces-20085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8339AC264
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 10:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EDC21F25ADD
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 08:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA26183CA2;
	Wed, 23 Oct 2024 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wB0WXV6L"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2084.outbound.protection.outlook.com [40.107.103.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C0415B547;
	Wed, 23 Oct 2024 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673814; cv=fail; b=WsFEpMaVCyQzzoaZnQ9p1mpX4bu2fELFHXs/x2adiR/rr4kWnzMwZX97RRoR9yXV+lqguD3S1C72/xYBWb6OhmCE1YbFv2+Lc8n3lJSg4uDprv8P4yLBBAOblavFnDBht8/jSOv9zCxTimcnQfqBsnqjiGSop8Xaqyw5+ETnTkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673814; c=relaxed/simple;
	bh=cHL9WAFCqMfJ5MfdS4NnLywkyCmgPCGTXKUWzIQ9aAI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AmZ1nPcOrLFXAIveLsztQ3kTTHSqZmkl5W8vhDcC9NbC9GclaG9xjrDmVaflVtObRS90CV2S62bGLJq6aivR/LGqwWi6sYg7Oncmw60gEe4zOWB8AhP5uvf2SrQWejnx0c/2Q/pMyYBXFMy7slwUBHLV8PYyEe2wQyLICE9M4D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wB0WXV6L; arc=fail smtp.client-ip=40.107.103.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnFkZlIaV6291t5bwo7Z1dxEol4bRgK4HCVPzBT8OwB1bNBhIAE9vJSCSANYiSQCLv3BZYWjus4pPDtRSdzDpjdRHDWGkXrMPSnO3OAtDVSt8q3xuJ0kqWMbk1O31xttPwlBhp6di0iZGlUKj067uk5w/wcegd7eXrPZSGzis4Ghgi8NrzQADzM1IdC+9g3LtwNywLcLdvCjaSulAtW+6cCBIzHxTRUqBRg1lh1zyddAimI+em5Ud92HmJJFsFc+YQYVFSEyq8L7WL10fa25u4RxDZAv14TAH9iZZjQ2GzfD0kLQqJadEbtfnVjx+iyScT5oVsvUD4FJ1az9Oa72QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKjakOuYaQ+ewzNw+5YLMhWRUTzBaiWnAb14uJ5PHy8=;
 b=Me2OHuDh9QyVzRjTcT/O1+/Esmcl+ePkkMTxKI3HhJfWkWvGB7Gs9ILFixIy5EX27uksMqtTiHUiXcSySN09moTd2Gs94vIRwHmvvh6ctYifDxeE4bf80oynOiBr0HUxw5X+NMWO8LTEV34Gi5/5v0i6htpLMUM3ULwXeTqxj1HmCONYrg3DtHrHwZAo7c6VzKbPkq0GlDlz3XeXt0mmxMP/BhPgj3Rh9a7uX9LmyURK48epm7e0uVWVyf+82nrty029XFGSi4appAEInVMQgzSCl8XebhiJDJbf9Y33Pd3bLyB+h4tIOtidVE6pnZxt96LT2DuHmPkL+1v40+Z+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKjakOuYaQ+ewzNw+5YLMhWRUTzBaiWnAb14uJ5PHy8=;
 b=wB0WXV6LWORD/wa9597Us8MSSQGNPKnrDAkZ0HD/LdvHqpw4V3DKrBXGTXqo9GWcCBzowUpmks+Bn3ZvVD11RoHIq5XRRCGcuNIA6hxw/2ui5zEO5NVInspevh1HtCAsF4WsPMFKjO8qohMSZeXoWklaPACcQt3/Sz8m4MKBbIW8YyuLPGHaMvuKCIu2Hz6rp4vB0Yztawzy+4XFKfDww/ZkFuQgXUf7CNfmi40n5D6Algl8KFWiUSNxVjaq6pD7nN302ImrtHYLvFN7uM9WtrRL9RGBC7j0/M6WmO+k2oQ0YmxgKOUUWsFJIN4J2J7KXAedHdJ4upVM3kAe3cxvcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 08:56:48 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 08:56:48 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Christian Hemp <c.hemp@phytec.de>,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: nxp: imx8-isi: better handle the m2m usage_count
Date: Wed, 23 Oct 2024 11:56:43 +0300
Message-Id: <20241023085643.978729-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::18) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3e8f73-386a-4823-3736-08dcf340a095
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Mtj7hNstWzbQaXpNo4jPQcOg3XCsA/Xa94NFYaKGqMXph3XQBy3kv0CwY8Db?=
 =?us-ascii?Q?dbR4qZZ6o/MG95MqC0ZVjJeVgNOf6l9mvIn2KWXx3NX6GssOSiBsi1ydhHhG?=
 =?us-ascii?Q?1Ed+xKM2QueU8ACNFt/43+BYKF0ypE+MzgYD2ZyrWXWe0ijqdCnnXms4r/IW?=
 =?us-ascii?Q?U823N8hO31sAyz3hejaoysvM75F7yxHWNu1PDsmVY1Y5/4TpM05BUdwlIpes?=
 =?us-ascii?Q?1wkIv4RCB5QRNqfIDaZ9g4X6ATXEzo7t7X/QLP8xE2jIQASy9MlE9kGquyIg?=
 =?us-ascii?Q?dAsb9vl9hKPysYTbYlZS0IMP/hom1sCB4/52zUSQCF+61KzC4U0cizrMn2WF?=
 =?us-ascii?Q?LkmwOHX9Cf/3B+/7ZPsgfyaozErXzsX5C5Ik5O1Jr9dLbcSVRcL5XKiPDE0D?=
 =?us-ascii?Q?ZiHlb3YKqo5xIqsurTJHWlN54E+EtVJ/5xXqjvoBEOs06xeh63yeTH+b1Zha?=
 =?us-ascii?Q?nyilucnn1Mm0BZ+kLar3RlrzOjJenIC+rFkOh2Sv7pJ4TQEAXkRqobDU5OzY?=
 =?us-ascii?Q?X4UoIG/xea8j1gCNTwGRL+tsUvSGJSwYBH8D/603EQ+9Y5rYAGLPrjcLsLWe?=
 =?us-ascii?Q?gMib8gsa/482t+Uhyr+ze4sLXxdgjwPvSK6KmmOpez5yWyoXVkfyD5+M+044?=
 =?us-ascii?Q?DVKsVAT2eoaAVwTOcWOxFEA4rhdIGAVpwdLjQH3AVwL0EFsDfi2urysYz5Wv?=
 =?us-ascii?Q?2z7RIIbrNokHZ7EANeSrcwf/keNALTRYDxu7AcE4aJ8iCkgN9lSdPoMiWIbN?=
 =?us-ascii?Q?dBHeTmefBd5oQjQP6wRl18LLONkLVnWmgNf+eF4ASvf5PSNAIX8yPMnfGIk5?=
 =?us-ascii?Q?9SEwwIo2UPek9hLq0p/O8okzIOktRcQmX8fUOZlxshz8Svy5fGpyQHHFcASA?=
 =?us-ascii?Q?tW49NmH+98ZURoThEilq8pd8FWOb3uEiuIuf5VAMD3fzVzU5FJ4Q1wexVZ/P?=
 =?us-ascii?Q?uvEIssrDCwjkQSorRuwuc9NFyHFhSh9buZzr/W+FYSgIkApx6JH3gB6ssOHd?=
 =?us-ascii?Q?gB0rFvoPTeoffRuPpvZQ2voiVnAjU1GKXkdHs7D96ZUVJwbH/m+idb/RJV8P?=
 =?us-ascii?Q?3HK9tFgBu0Dsdt9b7vBXDTXOktcVofEt5wX+qIkWAGHbOFCVMGq5oxQvU5Or?=
 =?us-ascii?Q?i1xqPJo8lyCuxULJu+fmITvgeDx/huk3YSq9Rc3lXwIwehjCVCW++yw7jSae?=
 =?us-ascii?Q?+cCkIZHpHFI72OLo7z8Hfy16y3aQX5TmsfwzYCvmiQmsgP3BAzfsZbzAeGgK?=
 =?us-ascii?Q?UOOgwHFDQ+/MAjFRkiqCYX62GjwUOWxWjsKBlLZe9ZFh+3zl8vlKZ77lse8l?=
 =?us-ascii?Q?vARlUAmVNM1wHEGcW105CgTiVNLYjUymhUCkaPWZzyElu7i50/nz6ZrXkX9/?=
 =?us-ascii?Q?+se8izY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Rgbt6fqncOSwL70HC1gRESK6oHSnt/Td+6zn08QOR+24xsr3wmB9bD8UD1mL?=
 =?us-ascii?Q?PN9t/gPrsxeRUEdR6X1h3pyfP5Wm/JurnP6D5PSQcU/tP1BV4EsLOObpiK1p?=
 =?us-ascii?Q?7QGjRkgwGB2NsMWNcHVCfP4DqM+hj0h99KviMFTcOB+/gyZwODLMnoEuKCgy?=
 =?us-ascii?Q?FrKkkc9OkqDlNYJVnF3rI54m+71de3dlcKzMDbfYDkaTUlJukGZ0VgdJjKqZ?=
 =?us-ascii?Q?fq//UOnkiet5PYSjXH46IqLCM21DE13agy7zcCWdzpT4H+8E4YRsGncuUu0r?=
 =?us-ascii?Q?CxWSxmqK6hgQXiwCPaiBu/obGGKtDD6jnLtnxorW58NEV+QB0yOmoN1c4vbi?=
 =?us-ascii?Q?9enPNqej7HKa3puCDXJvY+QkhfuSSL2uIlkzpDZ47tdlM2HVPyd4DVD8mv8K?=
 =?us-ascii?Q?Bfgm75c0ymbfG4Ar1YoHuuzhhqd9F5oi0+8kQ82nNM5AIcgMc6excKoMilw4?=
 =?us-ascii?Q?T9TXXa+rDOpyB5vA667y9+NKB/CEAlB64/six2ihoKSKcB77Lxog47A7mWJ2?=
 =?us-ascii?Q?Cn6RQ9B3DNbQWrtMPNGG4ZCCtfgpPlz/enmFOFYAmt4aNIyYA+htRcRweW6v?=
 =?us-ascii?Q?qWoA8cZrY5batznkkBMUl6PPUKl0IlbOaDQBV6UQGJHUWnUyPnPwqM4QIBZy?=
 =?us-ascii?Q?CFgIDPGgGmNC6+HhRFBTABxCjGjC96OpK7axb0B7yfYSMhV33faJYkIZo5Yd?=
 =?us-ascii?Q?pix7ZMS0biA8zauvSO2yb0cBcQJw+hSJnNzITit5mlDZxSoXuOUV4AD8je6J?=
 =?us-ascii?Q?6NbKMPmWgtENLtUUyauJpaqZOfjubtHL6Hjm9T5XmBeSgEvO/KQRmDl0hqlV?=
 =?us-ascii?Q?aCzxwULIb82YYVyVZHX6OwqHlG0J0/iJg53f3TwZrk/JbV5nTZb3OGS3hDZm?=
 =?us-ascii?Q?LD1DFVH/0T+ITGnRK+m5FYuCTgDu8R1RujiPfhNpbV5wAnS2cU0l4thg7eCF?=
 =?us-ascii?Q?vFTcIQAM/Qd83nSXLe4dw/eKveqTjybfJLpgyAbOyLfxicNcR+khX1MAyZ8z?=
 =?us-ascii?Q?DamZkCKkOHmXlHzzt0Q8IECWx1hbwPb3DPImEO5PCHiykX3dn3PIw7Nnm2+v?=
 =?us-ascii?Q?hTDUIV2fxH0xJQ4UVVyTsrW9F8IEZ1DqvqAO6T5D49jIdLcoaQggXtW7+WIS?=
 =?us-ascii?Q?lu1SsEwCMgjB2uubQeMDHRF1Bc+Bx04+kVcdkFebzgoujU5Bq0flW/uRtwoF?=
 =?us-ascii?Q?zOSpYmAa6utDtuQXKWWY3ivzMZgmptrzmid/nSOOhWOUihgs0jw/6943goio?=
 =?us-ascii?Q?U/IMeuJZJReuUtM4Al8ewbIPRt/MCBqr1aubHWHCJCHCmCX2YxE/Wca1/0rP?=
 =?us-ascii?Q?rTWBqJ1x0Huag/WIFqCc6JcQudTh13Zp9jKz13SQ71x452Od7c6qQHuMwREQ?=
 =?us-ascii?Q?jK1j+RixpA2ppq09Yq6yIdVI7CQ+IpJIVv0BoBbQuVg9CEoNtzHAHhF5bEyc?=
 =?us-ascii?Q?/owKKY3ymnnXj3s/cgcBTDbZ1R/pWbANiwrL+ISbnEJchOW1sk51CqYb4f/t?=
 =?us-ascii?Q?/7/OxGFvZPuPJ0TX7z+PMwUemqO+hmmCGxzxQJoH8pmfJEJNNmJa4DArmqU+?=
 =?us-ascii?Q?GLhEr9R+EHMIFXpjzYPDeaCeKzaHB5bTA4u2+Df4qudm5RXDl1pkBEe3J+VS?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3e8f73-386a-4823-3736-08dcf340a095
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 08:56:47.9795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wbMa4IocgeA9FzYUqQh3kixFzqYxZLQg7+d/oajC/3IgzehagKNnjH5U+p/eUCIEhkwjzuslma72m325Sxl5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936

Currently, if streamon/streamoff calls are imbalanced we can either end up
with a negative ISI m2m usage_count (if streamoff() is called more times
than streamon()) in which case we'll not be able to restart the ISI pipe
next time, or the usage_count never gets to 0 and the pipe is never
switched off.

To avoid that, add a 'streaming' flag to mxc_isi_m2m_ctx_queue_data and use it
in the streamon/streamoff to avoid incrementing/decrementing the usage_count
uselessly, if called multiple times from the same context.

Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
v3:
 * Changed the implementation as suggested by Laurent and add a Suggested-by
   tag to reflect that;

v2:
 * Changed the way 'usage_count' is incremented/decremented by taking
   into account the context the streamon/streamoff functions are called
   from;
 * Changed the commit message and subject to reflect the changes;

 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 9745d6219a166..dc10e1a9f27c1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -43,6 +43,7 @@ struct mxc_isi_m2m_ctx_queue_data {
 	struct v4l2_pix_format_mplane format;
 	const struct mxc_isi_format_info *info;
 	u32 sequence;
+	bool streaming;
 };
 
 struct mxc_isi_m2m_ctx {
@@ -486,6 +487,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
 	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
 	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
 	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
@@ -495,6 +497,9 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 
 	int ret;
 
+	if (q->streaming)
+		return 0;
+
 	mutex_lock(&m2m->lock);
 
 	if (m2m->usage_count == INT_MAX) {
@@ -547,6 +552,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 		goto unchain;
 	}
 
+	q->streaming = true;
+
 	return 0;
 
 unchain:
@@ -569,10 +576,14 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 				 enum v4l2_buf_type type)
 {
 	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
 	struct mxc_isi_m2m *m2m = ctx->m2m;
 
 	v4l2_m2m_ioctl_streamoff(file, fh, type);
 
+	if (!q->streaming)
+		return 0;
+
 	mutex_lock(&m2m->lock);
 
 	/*
@@ -598,6 +609,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 
 	mutex_unlock(&m2m->lock);
 
+	q->streaming = false;
+
 	return 0;
 }
 
-- 
2.44.1


