Return-Path: <linux-media+bounces-23803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D99F7DAC
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE76A188DA5A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BC9225A3B;
	Thu, 19 Dec 2024 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AkS+oJiF"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6426227565;
	Thu, 19 Dec 2024 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620847; cv=fail; b=mWuahQ6jPFAmTS6E4LgDB4b5+j93QeAGHOv5rvMukExhpIvoFXty7cT5VOc0ASaEQm/vWydgHr5izhufUhR/OmCcc48e8NPhNqTbFcLgC2/l/e2AUfT1ZiSAsj6LD9s8uvZJBbz0mHgpUeL69XFQmecuN/zb5pAqnBvGZrgsL6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620847; c=relaxed/simple;
	bh=qPZRcvv6rlJpbf6D+oig9Q7kFoLnS50ismrtLOLT3W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mcbKHiYLJUOmkDg6ObNuld/ZTXcnF+KFipmcZrxQwwE9LnBpUkd1hpDONlP2tHljEGoOejepzQTH6gWO8juGy67aL9N1h6UL6JxCZyR0FArvelAr6Lo1Dnc+iZs+aDHqbNYuKlyMw/GNCWyX0dMP/tq6mj9NgngvGHYbih86NRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AkS+oJiF; arc=fail smtp.client-ip=40.107.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n43TPruz8OHxAyiXChROqT2nvEUl6a+b+yxax4ejS42Q9jBbinTo9j5CLV0W71xRCuIF4pxEBCnll8SrRt9R7/eXi2xAgsR7Sut9hZJaUhiwcn2LZtR7idqE9+rKErTtkFZm1Py3PcMtzzFA7KZ5soPbXFhiFS09QuEfHCDvz5GYoHqhuoKrwLu0P3oX5Smb6/NAmK4p1tXE4fvfucctiPbcoJMuUMlp4Qn6b2Wa0cWS418Moy2a7ohPpmKiVcfmxPJ7Lue4lOKGK2UhMTKYqwNMnS0kgQiHGpkwHlpQi7blzjeqA9yFKfwOQebhp9zfDe1qelLkeG6Wa9NqxmRL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKYppRvPMmEGIhl0QuPNeyEWgFy/Y+mwaiafOPR+hKw=;
 b=BhnOD66DMGTnl3O4nYrZPH8SfLyTRk8swKLGDppXeHs3QqzrhRlmpcvcEocRFOJb9tCumJRDr9EVSty9JvuvHPcz1L6v+q61SasCnjY9o1xbwLOwFePfaMfzXwwe7Psyc90GGvsPfyj7hPhN33t6m3I7hX6ziCOZqa8BdLHPpeQNKkhhLzxAKUhPjRUyiVAgVDUUd1SstC81o2ZrTO0Kygauz0G8CB1Z3Rf7Fy1U2wuRFMGwOkR5wKz1iqY8BCEr85CEp0KPDsS0cTprjnNGMkGadsSWVz1/IequAPeRu/T+MEaBS50o4QzKnFypsew4Re6YFo1s83zmrBXLEoCw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKYppRvPMmEGIhl0QuPNeyEWgFy/Y+mwaiafOPR+hKw=;
 b=AkS+oJiFxYora/3cWxHlWyRpbbVIf/ehsYQ4yaxbfrDu2iGSXmvjtWMAtleGgt/glVHv+SSpWGg4lHiddfX1kWStTDRb1nWyaatGvWxXhcOXH7dVxRXfd5tp8sCyjt2C5IYCWRgRthO7FHw1fy27maUYJfuLW9C9fSnvjyxvR35ucC6nix/9ioDAKAJo5602voRAu3bozAQsSoWu0Tbbn8q8XkazKMrVrehx0A8wDSG0aEDPSUbLTLHQLOa6CHO52L53Bue6qIdxD1utNfL5iYGsy3n2jS2uBInBbakTAQmugUa63c0EM/IvOPwCbdn7ptY8tiPrdlmcjRJBede1yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16)
 by DU2PR04MB9146.eurprd04.prod.outlook.com (2603:10a6:10:2f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 15:07:22 +0000
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e]) by DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 15:07:22 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/3] staging: media: max96712: add some register and field definitions
Date: Thu, 19 Dec 2024 17:06:43 +0200
Message-Id: <20241219150644.64507-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0036.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::18) To DB9PR04MB9578.eurprd04.prod.outlook.com
 (2603:10a6:10:305::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9578:EE_|DU2PR04MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0ae3b2-4739-48b7-88ae-08dd203ed6b9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hnBa7eInFgKIX9SU8YSvbSvrsXiVj8/OHDNneyiBApMpUWJ9l3pBti4xRXAH?=
 =?us-ascii?Q?MXrnFm2oX8ZKvPBaNsbi/v20civ/ZaccZGXn6jOBUNGthxprt4r33Xp22Rt6?=
 =?us-ascii?Q?FMzdrU9OtGFDUzC75qloeVvApNd+uT9zmG1Z5aaSlNNwQk+9aFEsJAZLd3aB?=
 =?us-ascii?Q?W36qlwA8wowkCBkg/LVQnn4R4+Lh+glCz5CpHGKbpGwAFgkPARZ29boWwrtA?=
 =?us-ascii?Q?wVWqMYGnV+K7yV94mDqEAQ0mOL/DruvJQQs/Tv1UQJR+StYC4r7xnPsilepo?=
 =?us-ascii?Q?f1kReyqZezlJe/E07Ezta1nsbtGpuYIm8Z3cY3OP6tO69s04niCeLq/DSHKC?=
 =?us-ascii?Q?mVdorrRi8cjj8U7fLMWXxq4z9EKWka0ICJKiXp0zLUSxXFk/NWwf/Rl1lGIL?=
 =?us-ascii?Q?vG2gT2UCxORHY1mElDaXKZ+O7UMHtvYWRpDV1q8MdqjVxCwu24jDN43BJleR?=
 =?us-ascii?Q?QW8MUDlRSaNy0vz6S4I9N7/Ohre834lcyORjlZaHYcTodLHActuvgjY7SH88?=
 =?us-ascii?Q?49eVpmcozMefAKnvjM2COL3n5eMsbcIbvMIiRAmJvBPU2vzBPXUTSMd3YTl3?=
 =?us-ascii?Q?xP2WCtiHj2WJNvlb0jrVtd6v77N7AwmgVXpPfGRd6NIYICXUDkUTxaw9k/h4?=
 =?us-ascii?Q?vsbP+0NtIcfVE0WQ2rfk9UjAXQERHodXjJJ6acDvn2sLkIiQdRY+LQOkAAHH?=
 =?us-ascii?Q?8aqkqUCCuzzBGTIIecZIkhbzwNzpiGVXu0KrSj7Vq8l3aUF2gVww0xBAeRax?=
 =?us-ascii?Q?42y/n8/XOeeF121ZeNWh0jGzaXGC0g+xD/uldGWKUMyClv6lWCdRDnj3RF7V?=
 =?us-ascii?Q?ntIGFOYvU08YUPSNqAT53lSVLBu1/g7pvP6qBaSpNOr+vRf3cgcTqqHoeIFO?=
 =?us-ascii?Q?Qln5oO5cyMgwardkXDD0PaaiXi/tUQ6qCgu8BjNqRKgpjade8n+D/TjTjigt?=
 =?us-ascii?Q?0e54+5lRcbj60gNV8j6Ja+2Yv66IXEd2pFV6g8rKHsZdzDjlXOl3MItQVbEe?=
 =?us-ascii?Q?B5GAOXRvr0OBkS0jJ5sXzp5Xxwv0JE2x4auaZ1sK0un3bY7eRcsiAd5aMUl5?=
 =?us-ascii?Q?7gvDe15uphncWmvL6wG5PN5Vsb8bdlx0e26pCpYq3/iUvs5oCVdbNGJvUE/1?=
 =?us-ascii?Q?+rrelqBIYKtykI0upLFphEg9Yn7hbpKBhyHDqK7rnH4CTWf8la5MDqwQwHJT?=
 =?us-ascii?Q?OdsHWTRftPGUKN2TDJnjxjMETnoQuYmECvttJJQAWAIUlCHnN8SCOiQm4dEW?=
 =?us-ascii?Q?emlMYmkG+8Vx17fGHDpwKXlZ2SzLydT9GoX+Gh6Gz3z97mchM7F76ofTv9e/?=
 =?us-ascii?Q?juk7IAwiQGd3XtRzjKLFwG4qNehfHXj5xI6rVkTH0J89AuOa9n1A7SwOn2ne?=
 =?us-ascii?Q?X7SLstAgWrrD/8RULLJeTOvZ286s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWr6LzOdeAsPgQEeZMicRTRc+zI2qf9Cy9rYsQhsX0gYBm7bFd/fvXquEGmT?=
 =?us-ascii?Q?vm9VMaFihufyloBKeabKPagwmZFy3pJBbOBGY2/uQSYHsZpzGIFurVFyChfK?=
 =?us-ascii?Q?4BewoXlwguDcilFrQv5CODvs60hwBANHUi4Yps21DxbJs+BE+972MbuUr0uP?=
 =?us-ascii?Q?XiXiYw5UXGvn9dmR4Q8hXvX16xX8WjkgU/dDev8bti/KQB+0CSNz4v1iEmWh?=
 =?us-ascii?Q?sA1Yxn+4sUl2fXpB9YiSeeroAsRML2sUo2F2LYKxvQFXaWRg18dLaNzGrxsh?=
 =?us-ascii?Q?IMp/PncvEpUHw86GVpuAnuVStViNiAbKj8kxQL5e/UIy6JpdTt/w/Rqn9Vas?=
 =?us-ascii?Q?gAIf5MnyTc0z6o36E2JqnG8ZXeRLTNesn3E3J0EPYxLLgS3zoGTnrhjZibEF?=
 =?us-ascii?Q?lLxmtXkSTO/o9VTrC0KoCgF6f5WgAjvOuXJ0c+YK+2un3Y7jWl5FVfGlNHv2?=
 =?us-ascii?Q?aQQiBqjCDDCupA4HA0pMm8s/GmClcRVWl21wUqjD1mJMwVXcHqcZ/wPY+U+u?=
 =?us-ascii?Q?Yub7iMvEsK8h4I8vKLZN2N7v9EEoGmQgBSvxccasa2rJNi4NQ2Bddj24pjiM?=
 =?us-ascii?Q?ts5/390p0QG9Qza3IDn+2TKNyW7KVopP90ZXFhZLM0AKX3cAVejkkwxvSbaR?=
 =?us-ascii?Q?KPgXAfT7vS2zjGjn3o/G1lc9fpDWu8kgj8oIGd3s2W+z2ZOdS9yWqGlJjAe+?=
 =?us-ascii?Q?sNGULOdJ8qPxqlrt5ubuW+U8F2LN07vRROd7TX/0MUO4MVrSYtyi2fA3SqBk?=
 =?us-ascii?Q?uHGO0fObeVj0gF8mVdrGMuAXZ4FQ4gXOkGcEi+0rehoHV/yUrtbjp8mgiix9?=
 =?us-ascii?Q?0Dm3TyRdfI7j6Zwf+sLLWOJ5qv5ibnqxtgx+dBSM1x9YZ+YEliINCL0REybc?=
 =?us-ascii?Q?MY/LOKSSgvPWOz3kk+ItgZzq6LdzNIfTmbMaVjqTcPEM0V/4hAa5mivjX2SX?=
 =?us-ascii?Q?AYnTNAjO+PMR1wjhKJGyU38z3IE/vzRlFfRs7UJCleAcQ2IUxveE+kRSudGP?=
 =?us-ascii?Q?VMkmPhkvWWnCZJeJ8NnJ/75sCNcQoUMf4D4adUfi44OD4RMAQXEi0cfXTTg0?=
 =?us-ascii?Q?9M4UKv1IEckT7LY4r5WM5m/txQ/hZTIJYbOKJtNoCC5Zrhlhe47EuYpLD2Hk?=
 =?us-ascii?Q?3guU8U9aE8ib2cNF8qDN6jPaOOkkNfp71Og+YjzNNZ8/MekUUDnnCNAGbO14?=
 =?us-ascii?Q?8+DCL/9VnjVzk+pWLpTYfnMLyVMT/Fnaa8eWYn9mpcm2FTWJMtC5+Yvy6LYP?=
 =?us-ascii?Q?pQAAgadlSFD6bbqC0ONVWMYclIFsOBl+2iGTVJ2i4JjkkBKQ0MX26D9fkg3s?=
 =?us-ascii?Q?9LjU5q7JovaZGqTfD5H+i9nwQPG1ugKP3hUm62KvSQjbuJyJ6uyvuTskWsbh?=
 =?us-ascii?Q?Jt5h1FJypXuvTdVjC+H+E1O+UpschMQds84wfApg+DldazBCYeOh2HhPySNL?=
 =?us-ascii?Q?YLJ/SmRhtQKWqH46UfuW5loOLYCN41HJrD/9sRaZ+T0RPcBNIG5dmo7byD4E?=
 =?us-ascii?Q?DYorFZD4iudWMB+a6y+wubItZAf1tKZowS+UTHsShDD466zbtbWVCMh59gcm?=
 =?us-ascii?Q?dCpm5ql3EMnRdPGKCpj16PchoSalLIgeYbBP9Ys94F3B1JIxC0Mnq31suRpi?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0ae3b2-4739-48b7-88ae-08dd203ed6b9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 15:07:22.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FHR2EwZgB02NeO5tHKhxRtv2OqTscq/AWFybA9aIH4WYJ5gXhzEZWRgJ4bfa8V90HeDUqEwgjnaT2lnYcYiPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9146

Most of the registers in the driver, and their values, are hard-coded
which makes the code rather difficult to read and maintain. Add register
and field definitions and use them to replace the hard-coded values
where possible.

This patch does not change the driver functionality or its structure.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 207 +++++++++++++++++-----
 1 file changed, 163 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 682ebd20851f7..a3e4b51dc5048 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -16,9 +16,118 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define DEBUG_EXTRA_REG			0x09
-#define DEBUG_EXTRA_PCLK_25MHZ		0x00
-#define DEBUG_EXTRA_PCLK_75MHZ		0x01
+/* TOP_CTRL */
+#define MAX96712_DEBUG_EXTRA_REG			0x0009
+#define   DEBUG_EXTRA_PCLK_25MHZ			0x00
+#define   DEBUG_EXTRA_PCLK_75MHZ			0x01
+#define MAX96724_TOP_CTRL_PWR1				0x0013
+#define   RESET_ALL					BIT(6)
+
+/* BACKTOP0 */
+#define MAX96712_BACKTOP0_12				0x040b
+#define   CSI_OUT_EN					BIT(1)
+#define   SOFT_BPP_0_MASK				GENMASK(7, 3)
+#define   SOFT_BPP_0_SHIFT				3
+#define MAX96712_BACKTOP0_22				0x0415
+#define MAX96712_BACKTOP0_25				0x0418
+#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK		GENMASK(4, 0)
+#define   PHY_CSI_TX_DPLL_PREDEF_FREQ_SHIFT		0
+#define   PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN		BIT(5)
+#define   OVERRIDE_BPP_VC_DT_0_2			BIT(6)
+#define   OVERRIDE_BPP_VC_DT_1_3			BIT(7)
+
+/* MIPI_PHY */
+#define MAX96712_MIPI_PHY_0				0x08a0
+#define   PHY_4X2					BIT(0)
+#define   PHY_2X4					BIT(2)
+#define   PHY_1X4A_22					BIT(3)
+#define   PHY_1X4B_22					BIT(4)
+#define   FORCE_CLK0_EN					BIT(5)
+#define   FORCE_CLK3_EN					BIT(6)
+#define   FORCE_CSI_OUT_EN				BIT(7)
+#define MAX96712_MIPI_PHY_2				0x08a2
+#define   T_HS_TRAIL_MASK				GENMASK(1, 0)
+#define   T_HS_TRAIL_SHIFT				0
+#define   T_LPX_MASK					GENMASK(3, 2)
+#define   T_LPX_SHIFT					2
+#define   PHY_STDBY_N_MASK				GENMASK(7, 4)
+#define   PHY_STDBY_N_SHIFT				4
+#define   PHY0_EN					BIT(4)
+#define   PHY1_EN					BIT(5)
+#define   PHY2_EN					BIT(6)
+#define   PHY3_EN					BIT(7)
+#define MAX96712_MIPI_PHY_3				0x08a3
+#define   PHY0_LANE_MAP_MASK				GENMASK(3, 0)
+#define   PHY0_LANE_MAP_SHIFT				0
+#define   PHY1_LANE_MAP_MASK				GENMASK(7, 4)
+#define   PHY1_LANE_MAP_SHIFT				4
+#define MAX96712_MIPI_PHY_5				0x08a5
+#define   PHY0_POL_MAP_MASK				GENMASK(2, 0)
+#define   PHY0_POL_MAP_SHIFT				0
+#define   PHY1_POL_MAP_MASK				GENMASK(5, 3)
+#define   PHY1_POL_MAP_SHIFT				3
+#define   T_CLK_PREP_MASK				GENMASK(7, 6)
+#define   T_CLK_PREP_SHIFT				6
+#define MAX96712_MIPI_PHY_13				0x08ad
+#define   T_T3_PREBEGIN_MASK				GENMASK(5, 0)
+#define   T_T3_PREBEGIN_SHIFT				0
+#define MAX96712_MIPI_PHY_14				0x08ae
+#define   T_T3_PREP_MASK				GENMASK(1, 0)
+#define   T_T3_PREP_SHIFT				0
+#define   T_T3_PREP_40NS				0
+#define   T_T3_PREP_55NS				1
+#define   T_T3_PREP_66_7NS				2
+#define   T_T3_PREP_86_7NS				3
+#define   T_T3_POST_MASK				GENMASK(6, 2)
+#define   T_T3_POST_SHIFT				2
+
+/* MIPI_TX: 0 <= phy < 4 */
+#define MAX96712_MIPI_TX_10(phy)			(0x090a + (phy) * 0x40)
+#define   CSI2_TWAKEUP_H_MASK				GENMASK(2, 0)
+#define   CSI2_TWAKEUP_H_SHIFT				0
+#define   CSI2_VCX_EN					BIT(4)
+#define   CSI2_CPHY_EN					BIT(5)
+#define   CSI2_LANE_CNT_MASK				GENMASK(7, 6)
+#define   CSI2_LANE_CNT_SHIFT				6
+
+/* VRX_PATGEN */
+#define MAX96712_VRX_PATGEN_0				0x1050
+#define   VTG_MODE_MASK					GENMASK(1, 0)
+#define   VTG_MODE_SHIFT				0
+#define   VTG_MODE_VS_TRACKING				0
+#define   VTG_MODE_VS_TRIGGER				1
+#define   VTG_MODE_AUTO_REPEAT				2
+#define   VTG_MODE_FREE_RUNNING				3
+#define   DE_INV					BIT(2)
+#define   HS_INV					BIT(3)
+#define   VS_INV					BIT(4)
+#define   GEN_DE					BIT(5)
+#define   GEN_HS					BIT(6)
+#define   GEN_VS					BIT(7)
+#define MAX96712_VRX_PATGEN_1				0x1051
+#define   VS_TRIG					BIT(0)
+#define   PATGEN_MODE_MASK				GENMASK(5, 4)
+#define   PATGEN_MODE_SHIFT				4
+#define   PATGEN_MODE_CHECKERBOARD			(1 << PATGEN_MODE_SHIFT)
+#define   PATGEN_MODE_GRADIENT				(2 << PATGEN_MODE_SHIFT)
+#define   GRAD_MODE					BIT(7)
+#define MAX96712_VRX_PATGEN_VS_DLY			0x1052
+#define MAX96712_VRX_PATGEN_VS_HIGH			0x1055
+#define MAX96712_VRX_PATGEN_VS_LOW			0x1058
+#define MAX96712_VRX_PATGEN_V2H				0x105b
+#define MAX96712_VRX_PATGEN_HS_HIGH			0x105e
+#define MAX96712_VRX_PATGEN_HS_LOW			0x1060
+#define MAX96712_VRX_PATGEN_HS_CNT			0x1062
+#define MAX96712_VRX_PATGEN_V2D				0x1064
+#define MAX96712_VRX_PATGEN_DE_HIGH			0x1067
+#define MAX96712_VRX_PATGEN_DE_LOW			0x1069
+#define MAX96712_VRX_PATGEN_DE_CNT			0x106b
+#define MAX96712_VRX_PATGEN_GRAD_INCR			0x106d
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_A		0x106e
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_B		0x1071
+#define MAX96712_VRX_PATGEN_CHKR_RPT_A			0x1074
+#define MAX96712_VRX_PATGEN_CHKR_RPT_B			0x1075
+#define MAX96712_VRX_PATGEN_CHKR_ALT			0x1076
 
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
@@ -97,18 +206,18 @@ static int max96712_write_bulk_value(struct max96712_priv *priv,
 
 static void max96712_reset(struct max96712_priv *priv)
 {
-	max96712_update_bits(priv, 0x13, 0x40, 0x40);
+	max96712_update_bits(priv, MAX96724_TOP_CTRL_PWR1, RESET_ALL, RESET_ALL);
 	msleep(20);
 }
 
 static void max96712_mipi_enable(struct max96712_priv *priv, bool enable)
 {
 	if (enable) {
-		max96712_update_bits(priv, 0x40b, 0x02, 0x02);
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x80);
+		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, CSI_OUT_EN);
+		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, FORCE_CSI_OUT_EN);
 	} else {
-		max96712_update_bits(priv, 0x8a0, 0x80, 0x00);
-		max96712_update_bits(priv, 0x40b, 0x02, 0x00);
+		max96712_update_bits(priv, MAX96712_MIPI_PHY_0, FORCE_CSI_OUT_EN, 0x00);
+		max96712_update_bits(priv, MAX96712_BACKTOP0_12, CSI_OUT_EN, 0x00);
 	}
 }
 
@@ -120,39 +229,47 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 	max96712_mipi_enable(priv, false);
 
 	/* Select 2x4 mode. */
-	max96712_write(priv, 0x8a0, 0x04);
+	max96712_write(priv, MAX96712_MIPI_PHY_0, PHY_2X4);
 
 	/* TODO: Add support for 2-lane and 1-lane configurations. */
 	if (priv->cphy) {
-		/* Configure a 3-lane C-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xa0);
+		/* Configure a 3-lane C-PHY using PHY1. */
+		max96712_write(priv, MAX96712_MIPI_TX_10(1),
+			       (2 << CSI2_LANE_CNT_SHIFT) | CSI2_CPHY_EN);
 
 		/* Configure C-PHY timings. */
-		max96712_write(priv, 0x8ad, 0x3f);
-		max96712_write(priv, 0x8ae, 0x7d);
+		max96712_write(priv, MAX96712_MIPI_PHY_13, 0x3f);
+		max96712_write(priv, MAX96712_MIPI_PHY_14,
+			       (0x1f << T_T3_POST_SHIFT) | T_T3_PREP_55NS);
 	} else {
-		/* Configure a 4-lane D-PHY using PHY0 and PHY1. */
-		max96712_write(priv, 0x94a, 0xc0);
+		/* Configure a 4-lane D-PHY using PHY1. */
+		max96712_write(priv, MAX96712_MIPI_TX_10(1), 3 << CSI2_LANE_CNT_SHIFT);
 	}
 
 	/* Configure lane mapping for PHY0 and PHY1. */
 	/* TODO: Add support for lane swapping. */
-	max96712_write(priv, 0x8a3, 0xe4);
+	max96712_write(priv, MAX96712_MIPI_PHY_3, 0xe4);
 
 	/* Configure lane polarity for PHY0 and PHY1. */
 	for (i = 0; i < priv->mipi.num_data_lanes + 1; i++)
 		if (priv->mipi.lane_polarities[i])
 			phy5 |= BIT(i == 0 ? 5 : i < 3 ? i - 1 : i);
-	max96712_write(priv, 0x8a5, phy5);
+	max96712_write(priv, MAX96712_MIPI_PHY_5, phy5);
 
 	/* Set link frequency for PHY0 and PHY1. */
-	max96712_update_bits(priv, 0x415, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
-	max96712_update_bits(priv, 0x418, 0x3f,
-			     ((priv->info->dpllfreq / 100) & 0x1f) | BIT(5));
+	max96712_update_bits(priv, MAX96712_BACKTOP0_22,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     ((priv->info->dpllfreq / 100) & 0x1f));
+	max96712_update_bits(priv, MAX96712_BACKTOP0_25,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK,
+			     PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN |
+			     ((priv->info->dpllfreq / 100) & 0x1f));
 
 	/* Enable PHY0 and PHY1 */
-	max96712_update_bits(priv, 0x8a2, 0xf0, 0x30);
+	max96712_update_bits(priv, MAX96712_MIPI_PHY_2, PHY_STDBY_N_MASK, PHY0_EN | PHY1_EN);
 }
 
 static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
@@ -170,51 +287,53 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	const u32 v_tot = v_active + v_fp + v_sw + v_bp;
 
 	if (!enable) {
-		max96712_write(priv, 0x1051, 0x00);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, 0x00);
 		return;
 	}
 
 	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
 	if (priv->info->have_debug_extra)
-		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
+		max96712_write(priv, MAX96712_DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
-	max96712_write_bulk_value(priv, 0x1052, 0, 3);
-	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x1058,
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_DLY, 0, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_HIGH, v_sw * h_tot, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_LOW,
 				  (v_active + v_fp + v_bp) * h_tot, 3);
-	max96712_write_bulk_value(priv, 0x105b, 0, 3);
-	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
-	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x1062, v_tot, 2);
-	max96712_write_bulk_value(priv, 0x1064,
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2H, 0, 3);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_HIGH, h_sw, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_LOW, h_active + h_fp + h_bp, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_CNT, v_tot, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2D,
 				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
-	max96712_write_bulk_value(priv, 0x1067, h_active, 2);
-	max96712_write_bulk_value(priv, 0x1069, h_fp + h_sw + h_bp, 2);
-	max96712_write_bulk_value(priv, 0x106b, v_active, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_HIGH, h_active, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_LOW, h_fp + h_sw + h_bp, 2);
+	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_CNT, v_active, 2);
 
 	/* Generate VS, HS and DE in free-running mode. */
-	max96712_write(priv, 0x1050, 0xfb);
+	max96712_write(priv, MAX96712_VRX_PATGEN_0,
+		       GEN_VS | GEN_HS | GEN_DE | VS_INV | HS_INV |
+		       (VTG_MODE_FREE_RUNNING << VTG_MODE_SHIFT));
 
 	/* Configure Video Pattern Generator. */
 	if (priv->pattern == MAX96712_PATTERN_CHECKERBOARD) {
 		/* Set checkerboard pattern size. */
-		max96712_write(priv, 0x1074, 0x3c);
-		max96712_write(priv, 0x1075, 0x3c);
-		max96712_write(priv, 0x1076, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_A, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_RPT_B, 0x3c);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_ALT, 0x3c);
 
 		/* Set checkerboard pattern colors. */
-		max96712_write_bulk_value(priv, 0x106e, 0xfecc00, 3);
-		max96712_write_bulk_value(priv, 0x1071, 0x006aa7, 3);
+		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_A, 0xfecc00, 3);
+		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_B, 0x006aa7, 3);
 
 		/* Generate checkerboard pattern. */
-		max96712_write(priv, 0x1051, 0x10);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_CHECKERBOARD);
 	} else {
 		/* Set gradient increment. */
-		max96712_write(priv, 0x106d, 0x10);
+		max96712_write(priv, MAX96712_VRX_PATGEN_GRAD_INCR, 0x10);
 
 		/* Generate gradient pattern. */
-		max96712_write(priv, 0x1051, 0x20);
+		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_GRADIENT);
 	}
 }
 
-- 
2.44.1


