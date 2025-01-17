Return-Path: <linux-media+bounces-24865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 322E4A149A1
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 07:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C1A7161278
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 06:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6531F7586;
	Fri, 17 Jan 2025 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YeZRZr+g"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2059.outbound.protection.outlook.com [40.107.103.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26F1F76DD;
	Fri, 17 Jan 2025 06:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094832; cv=fail; b=mNldNyOl7hEC5jxIUI5j7aVpuX8GCrnKlaJ4JOM38eaFMarbwKj6PYYwqzVd3SOORsr/IWwvFCCLosnifor95hzSwvT2Nueu2gXTR31Wv27LSfrsQT4rpoCC3TaKypCgOQ0AtfY/jOYZK/Xul07FRolA+fDKN30GsvWtvEFnE+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094832; c=relaxed/simple;
	bh=xqnaznQPCPvjwv5TdPgOPoC01Ev6EfHQm+N7zwOzsiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F+6e4HztOsF3EUipboIMSZVG3KwrI/tiGUSxmigNMw30BNhsZqc45GtM590qFVq/6aKZHWIrxEi6907JhrBxYji/YmWHz1zRI0rAKljSukzkeStbZqn1vGEgiGtmtWZMFv/uRgFYSFGXkTz/4M7ljaY+TJByj51DoDjFllSHLYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YeZRZr+g; arc=fail smtp.client-ip=40.107.103.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7hdLjjK2sLwiQ0U9rQcyssMrSOsNxNkqq6eqol0kwNyLjQkmAFxZCCkWhqS3KqzuCs76PheoXU2Su7FnnhtEAnL93U8D9rnwlcy2r+oRreiVfBoqgCxeNAbNuXdJpZcDRlQxyz3QGVOyUYgWAIyH421QDN7ot9w3wuPyihDU6bsIc1QGG00C2alm6G2O3gXaI1CcR68Gjflz9H/2WgkingWyvaoUHZU22ZVok12EEFPhxWWFquioCasNaJifaZ7HH3ue5fSpWxgUoGrPIdxt5SRpcnfJHNJguRTQ3JMzKhiwuh4beOUA4+53emcuBnOdC6lkqwq+mNzkFPF4li0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgpWWcoUPzdfQbVJYlMyUam+CypB6AlNWYM8PMLHarA=;
 b=TBxGgicb3sIG1cNAWVjFwblA835b6eKh5oAQH9GZ6FKxQbPg1OMnIOcDJVq2BxhRKbJ0un4AYQgJkwj4sObxrQ6eo4xaeyobrQZJTTQ8ZDqVbN2NDQEWUy//6vgNbyck1AqT+P8dvFhphwVvISLi+YFrOyQpRWtTH4kxFMknGys6apjcg4YYsNCB639ppICusDRQGUiKHkVo7RHbdzjAhGgJh2jayRpNTgrGtfmAe2+ltkF19s90I0auB/mQxFepL0JiXJcDajFLeZiHCDarn4T4kZ/aQuUrnE5857g5TXzareIsTOx1ljthSEQEAcSeZ8gAEbb6bA2ZVLMfs4y6qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgpWWcoUPzdfQbVJYlMyUam+CypB6AlNWYM8PMLHarA=;
 b=YeZRZr+gdTtae7BN/AWDBNsPTXaAAr/Cn47D+uHIUqc2vIvX+eT29dO062dx4LSxKEhUDhjQyQAumlmNw/a4sy3IG6omW0P4QucLylZ8mieE0azMOA4MqHZaGQTdD98M27pV9X0UoiNB4yPdfSHc2nc3CQv7GmnFnGU0DvSPyOA40zI/Piur0s7KOeGNESU0SkpGUPdhpygRjiOq2hNyTt9SZ1ytpoPu1kdtjl6b0upO/Z5vfCdBwKHAtSmJktKtImjqYFeCNcgHUY/NqcyJAemSU9s8w19yHiQQ+x0wmxXw6xkm83e2j8AM2oKfeZkzX62+g+1dIvYJZ1xDXICL5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8053.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 06:20:27 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 06:20:27 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] media: docs: dev-decoder: Trigger dynamic source change for colorspace
Date: Fri, 17 Jan 2025 15:19:36 +0900
Message-ID: <20250117061938.3923516-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
References: <20250117061938.3923516-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d382d9-e128-4fb7-f46b-08dd36bf08e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WRlqUrgThval9UEF6aadfK3juZjWe2sBA5pBVWHhKh6wGK9gWuWK0Pj7Itpw?=
 =?us-ascii?Q?I3aVUY97P1hn4G9ZhatF/G7tQW7P9H8Cyel5TF6Y94GFVvitmNAHRvMhVItF?=
 =?us-ascii?Q?s5aRQQe6TgAqNmZ81t4giFYpYyjhSLrFJ4H4fXaSZwzy78yXDJKEwmaoVVCs?=
 =?us-ascii?Q?cG5NT/jpSqQGNgW14M8+9F3MmpyUIpFxi4KWdQBoNw+iFx+WJCCN8Q1I2U9C?=
 =?us-ascii?Q?zW+9NJutv0esjtV2/5gUW/3bHY1+q5GgGAyQUILcCB8rygTZEK1pVdireQ9o?=
 =?us-ascii?Q?XNCxcptSaoYaY/eRPPflkYMU/AEpmIXf7wdXvwsoLzhE4E6a2c161yJNnSqy?=
 =?us-ascii?Q?+5owncDnHRM5fvx6zc2eEH7IuPut9XyzFfkT7FVuPtLPCpZjxpuh/GNs8g5I?=
 =?us-ascii?Q?uwl/TLIGSzi5jPWRHc4hULhCdN0B/Wrt3w+7YO0l1dKylgnvQF25dLwSEGPm?=
 =?us-ascii?Q?FQFWwZ1oMnryRacwW+t1JwvLafhIYZl8nl8U+wFYXiKgoq+LJEHtjcn0rb3e?=
 =?us-ascii?Q?VwSe8my616jg3nMZ/Tj0RnE5Q446R+dN1aMJ74mzUZUSrORm22CTM21xbRaW?=
 =?us-ascii?Q?+KgnzdwDcvZH2dyiL/Fgqo8wFd7m+GtPuZ7+FHwRgoNND03O7OR/OwReQ5I3?=
 =?us-ascii?Q?M7VUMYMDRLvef8A9wacya+8ZNtG1RMTmStlzvT+z/M+nTKXHcvza6y84GRWC?=
 =?us-ascii?Q?LuZQNd7vKL2uMoY8nXw/Ry2WWVf4WSW7UAK7p4r5bdklhm4ShBr69G284PTc?=
 =?us-ascii?Q?JA1bSdM4vbKXHPXFHk0dVD56G83TG0di1ewqDFifVfXAvaph5lpeyAF0kvuJ?=
 =?us-ascii?Q?nYV9b2+0NvWGiyGj9YLLUOF3QPo1lLn2Dfiab1cFqTm+nTYLcPrOunvLAhXd?=
 =?us-ascii?Q?wddd2oFM0RsBbcMDvAdZXxpWUKW1N2ClPsXFL699lcRhqKhrL3z0A5KijJ8u?=
 =?us-ascii?Q?UFESptS/Nb3cr4UnRy50q0Q87V31UAU/j22m+gYBLA7L3hr6K3ySqMBGfhMw?=
 =?us-ascii?Q?TLo86j58YNE1Vmi5k8Umqx6UCzQrWK5LUtCQhjv50ksC6M+yT3/tWDoy96Ya?=
 =?us-ascii?Q?gKbR4X2PR38rImvoQNCPBeB7J9cvr4EhEASXQ7bpX3xrUtiPcTlnmmEAXAH8?=
 =?us-ascii?Q?OXUr/RDdBRENgzsqTVwK+3G7PfWES58A0Q04DRLsAESdpc78lGMy+19+5z/f?=
 =?us-ascii?Q?FnVfgUZn7CBcz8bhzgI1PfjKf9pzFpRTjHING5ZmHIqAOmA7ZZ+EsfTqTf2r?=
 =?us-ascii?Q?G5RSIeZbTyPEE4oi3ftdPSBfYEm+ZY2hPP5JqqQMeJDOsP4lbO1KhfFH8NJ1?=
 =?us-ascii?Q?hc+GDzaC9ECgZzK1y6NcpsU5DAL2ERSN5TMVPvWbr0WH63DFXitLBFVR9gq0?=
 =?us-ascii?Q?bYfggdAgUtCc+8VMWEfpOtZ4vJx7q7/03DFSwTpdkPI5iDzdDg/+utsITNJn?=
 =?us-ascii?Q?8M2j2kcSHHQCoRUIQdAsfRXV1Tsl2s4A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xkE3/eo4yeX+WkSxAtfuG3uz7YjuupdGbBfOIU/wVyiEp8YLcbXom8WH/ItD?=
 =?us-ascii?Q?klYR1wapnIDwKDfOWs0PhYKNzGkwjwzx0ofnMQe5dQubt8lxDtedzLkLQ+3L?=
 =?us-ascii?Q?3joXQQQ0rf3mB9z8LrUvhTohnXumKwovNG/GWqgbb5TaslSESvLS4CUegY5n?=
 =?us-ascii?Q?0QzWdcCXTh9WhdmYalnf7MeZAqjXFJ9WI3Eo8xO/MVsTBuZ4JcxoRrN8cnrX?=
 =?us-ascii?Q?OG6+4+lSW0/JtDd0NfgQMj3VUwjeI0hxNtkkVPsXv9Lszx9vbhCHvlAKYNLd?=
 =?us-ascii?Q?MVTiuoKKE2udKEHBsMbhCo3gfXFYrUae2JOoU4dsptAk8u+XgJSmKoCSA+TN?=
 =?us-ascii?Q?WwN5xG8mWMEnIjYT+Duah7Lp/0L6xBPHplimfAr0M3j+851pLFRT2ZLkCOFn?=
 =?us-ascii?Q?iPJ2pfR4V49YFAictPmew0ge7bZVk4WXFNUACO4uSOFOAqrdHPrrDaLILtsu?=
 =?us-ascii?Q?NHKd7U+5DXOMG8hV51JTAf6FIfPV3KuXQvhTDVuU7JaaqyFpu4xHaDj7DEvo?=
 =?us-ascii?Q?mvaU+DdN0fPwbkDXAZ1oblV43TAwbjoZz4i1B29lJMcY2UgwgoMBURmmWmib?=
 =?us-ascii?Q?1657bxRTmIeSHe6xotT/jECJwt3zs7P/u0LmD32qEgYD074zfoUWdqMaeDoN?=
 =?us-ascii?Q?dTYoHtIgNDCGc8xHi7dDQIOkNg04Xw84vejgP7jFq6gLTM7pHuVKfxBJO7tU?=
 =?us-ascii?Q?Lf5Nw1LE30/U9Srcr54LiqblxbNNOHsCccHPQOTk3Z9mHy8ZXzNszogX4Lfy?=
 =?us-ascii?Q?VJCEwVy7NCbm1oA3hcUX7DKL0ETHtM9PtgGwOAYyuSEXQii8bz+YRUi6bpTZ?=
 =?us-ascii?Q?iiZQqXh0dmyugdnSEBCPQXtMvflq4yuPrHk1tlLSyg0SxlPeZcyyAhoBbNDH?=
 =?us-ascii?Q?ZpRLd5DqqfjVXJvNHnQEKDc7W2RT+h+t/8HXOxlJK0YWtqmiEA+IoXYTZHIq?=
 =?us-ascii?Q?KAxNXmaT6wLaaYj9n2yTLTO0L98sOAHbPUl5IwlTWuyoig/ZmxZHaKq/vEv1?=
 =?us-ascii?Q?iGjNGg1BFUCdoOLIFCFgtuWu9+i13N1veXQzKpSuoJrv7nnIeX8+7JKwRTQi?=
 =?us-ascii?Q?dY03CqJnCQin0AOEoZMiB0YUXxDMLh35jLWRUApTjE1wty1KNqLiTf3NeT9j?=
 =?us-ascii?Q?LMzChLsjPpNMncbyXmFLp/hi0fdMSXkyocCpMUe3lK+L6yQcWtziy0scXTCD?=
 =?us-ascii?Q?nMgS6PMPx9rPf6ecnv5cRuZETpK7KOJtDnjgh97TxZsGjY7gerJTybUgFWdg?=
 =?us-ascii?Q?8kOMMOzt7srcu/j+S1INGlB2aMqwGHUXNl4IRYhFGBlaUf3HFuw6mlnhIVmd?=
 =?us-ascii?Q?xhjfBad1Y/HVBeRwmpkdRGWanfZEQSJDcJySjw0WX2rQqjncaVT2UBIM9ENT?=
 =?us-ascii?Q?Qyl0pa5pyE6jE1SE2NcYh0TOLwkmoQOxwWdq4MkfJj8TkwIrXbHZwVMcSUah?=
 =?us-ascii?Q?+SOnsNOp4wRecMZuj4Wp45m5kWvYleHxI6Kd5jNWv9mFQBflhEqNeOhlnSYb?=
 =?us-ascii?Q?D+Ome0me0czv0FVCZU9lO7VJt1rMQCSaq1jmUTXQSZmgVIbkmfetWouU99+/?=
 =?us-ascii?Q?5zXq0PnN0yv2De8RkhvK+g/VW2Xnf+fveQ2lxMHe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d382d9-e128-4fb7-f46b-08dd36bf08e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 06:20:27.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3qRkOubz74WDFBgsoIiWzsEB7pVx/YtnL4GnegT6qtW6yawY+QMZqg7Tpp50iUOSTFWJh4BW2bHD1FqD7EtDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8053

If colorspace changes, the client needs to renegotiate the pipeline,
otherwise the decoded frame may not be displayed correctly.

When a colorspace change in the stream, the decoder sends a
V4L2_EVENT_SOURCE_CHANGE event with changes set to
V4L2_EVENT_SRC_CH_COLORSPACE. After client receive this source change
event, then client can switch to the correct stream setting. And each
frame can be displayed properly.

So add colorspace as a trigger parameter for dynamic resolution change.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v2
- Add V4L2_EVENT_SRC_CH_COLORSPACE for colorspace source change event

 .../userspace-api/media/v4l/dev-decoder.rst     | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index ef8e8cf31f90..51d6da3eea4a 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -784,8 +784,8 @@ before the sequence started. Last of the buffers will have the
 must check if there is any pending event and:
 
 * if a ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
-  ``V4L2_EVENT_SRC_CH_RESOLUTION`` is pending, the `Dynamic Resolution
-  Change` sequence needs to be followed,
+  ``V4L2_EVENT_SRC_CH_RESOLUTION`` or ``V4L2_EVENT_SRC_CH_COLORSPACE`` is pending,
+  the `Dynamic Resolution Change` sequence needs to be followed,
 
 * if a ``V4L2_EVENT_EOS`` event is pending, the `End of Stream` sequence needs
   to be followed.
@@ -932,13 +932,17 @@ reflected by corresponding queries):
 
 * the minimum number of buffers needed for decoding,
 
-* bit-depth of the bitstream has been changed.
+* bit-depth of the bitstream has been changed,
+
+* colorspace of the bitstream has been changed.
 
 Whenever that happens, the decoder must proceed as follows:
 
 1.  After encountering a resolution change in the stream, the decoder sends a
     ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
-    ``V4L2_EVENT_SRC_CH_RESOLUTION``.
+    ``V4L2_EVENT_SRC_CH_RESOLUTION``, or a colorspace change in the stream, the
+    decoder sends a ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
+    ``V4L2_EVENT_SRC_CH_COLORSPACE``.
 
     .. important::
 
@@ -946,6 +950,11 @@ Whenever that happens, the decoder must proceed as follows:
        values applying to the stream after the resolution change, including
        queue formats, selection rectangles and controls.
 
+.. note::
+        A ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set to
+        ``V4L2_EVENT_SRC_CH_RESOLUTION`` will affect the allocation, but
+        ``V4L2_EVENT_SRC_CH_COLORSPACE`` won't.
+
 2.  The decoder will then process and decode all remaining buffers from before
     the resolution change point.
 
-- 
2.43.0-rc1


