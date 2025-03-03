Return-Path: <linux-media+bounces-27386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D1A4C6B9
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 458F77AC78E
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC6F23959A;
	Mon,  3 Mar 2025 16:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jwxgmQ/1"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01CA2376F5;
	Mon,  3 Mar 2025 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018192; cv=fail; b=bmz1bO1kmbtltHKuG5W6tDcWeAkQJsUsH+jqrw7lsiBk3v4P21wSnAmt5yHeDK52CPQLSTaP9yq/EW/ueFEqw0bYp/nnvCEmLtpvxpiMpFwvdDPMTRgALMDv1AqUvtw04AGfkH0yJlBVvnTu45ctDegXNNsrJN606bYpkwH8/es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018192; c=relaxed/simple;
	bh=9j4nPijH4a1+cIb9R/wA4gjImTTmMrJZfHI4NuQOBVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ki3uKUUgQeUxgpSp9UXZ4oy11trJL51cvvrpAUpqrmflN5HCPFIQ8s8eJRWBDaPKnmn/Tt4XFQKkcjAtNNszlCdx+H1230Z+XV035uWKLaQ9vOg1SS1ghdQjNdwuFS7/gEozTkQfjRFVYlfvpbIVi/DLzyrNUnxDnfEXI8SdfJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jwxgmQ/1; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSB3e1O0HXKdk4gJC/Vf8WcjNE8r/gpP4bwdrjucT6yI8qOJAnjAFOheq1hLN68Qczd7g6bhV3bsT55ZSeEFviPDzy6g4vFh1RLnxAvB8CELxryTgY1GQUZn5h/Dgk5/FQelkRmdKXvTCdQZ8VnZKziTumERfpQgLIC9/cAlHjosfy9hoJLjM7wMxUQwUwOKUKbKo7XO52O11aqud/+844O6vdxjQwowLGvamey64as7OAWZqrZOF0QU5RLXvAPnsBpG7uUGm3sRPcP22UN3izybIGw5Z7K9rsH1AbeAD+OqX/jpZJk2adr6v0zkFXU6BhBm2IKjyDWRK1/abOyufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QqV2NgZjXgYjDJN6Evb6jvF0zTwv9S7UT5OmB6zxDc=;
 b=uGQaSfnBEoO8aFr+0vuGnTMK/J1G3ipVFBQzfMrax1pFWO0YvhoYuNzWg4ZqhssS/3gId/VmRsjy/dqTgIAeTiiBEpkal6OXsueQENGuapOl620WgBwcYMA9YxBfwaNaIWmyR7ycN3/VZb0uKFQw02aK+rZp+ZyshR5Rs/9K5d+//J60sXdRz+Y4ycIRa9tBvr2aGG9iABvKe1VQOp4JktlK3UskoWum29M+44d+rXmzBiEaO6Y2RiW2kPfd6WTPlib4sgzCNFSSH/myHuNPHAsTobTUBxDOxSrrT4KdUYrLG1TpAg8eRHhjA1XKd5ej4PcHNu948e9qUio6MtpTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QqV2NgZjXgYjDJN6Evb6jvF0zTwv9S7UT5OmB6zxDc=;
 b=jwxgmQ/1qjOr7O0KsqT8WrlA093RR89GFmzGQZ7w4kplHESkx1Dw9MvHrbDMc4Btag5xN3MXlDfB6LAxYjL4BKcR0nWWP2/7/VnZuq90ZbLFPzLw67Zlnnlv2aeVXpBq9FoU+Fk+sYh+Mxy4aox+dVxvdHPk9T0QJRiC4p0Ghlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:09:48 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:09:48 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/17] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Date: Mon,  3 Mar 2025 17:07:45 +0100
Message-ID: <20250303160834.3493507-6-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 45db0559-a9f7-48a6-1899-08dd5a6dd227
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VRl3L9q7E09q7WjqZWLhjNwUL/iTdAKZ9Svb53sHAehC83OpKU2NxWoRD0ql?=
 =?us-ascii?Q?olUXCEQokqYvBtwHzL0sJqv03KstOtqQTbv4LS9OzYls1BBoljg7aIkIrPhf?=
 =?us-ascii?Q?dJI2NzJ4Z8mCIexCSaG6mZFk8CTrq788POzUf1G3iIA+DN3g92JfUJZzKW8p?=
 =?us-ascii?Q?SPG4uymzYB23O/330iZ593TNOt2Pl6mbUm76UU9JjiE52XTtfD9j0utJtfIB?=
 =?us-ascii?Q?g2jEzJ7RutSmuOVqHz0YPQjEo4Ykn+vylkv1m99XO5y24vGpM7TjMNv0hH2o?=
 =?us-ascii?Q?XhEeYgQGqvweiuaBvhjfsuOApx+mxWXE3Da65TyxHCbInEqAucKmakfsQOzW?=
 =?us-ascii?Q?SLqmG54A9zIOahdCPjAIILNTit2ZP7uXBBvwSzabHzcsXhj5FnD1nvNAdC5z?=
 =?us-ascii?Q?GYjjsBrEeRvcJuZ+UlI8M6nM5Gi7sFbzRX8PoKpiE0Tj06mLpU+F/LTmdnFk?=
 =?us-ascii?Q?QJpIecrxIZRwjtnlr3HQSJnIaNepZwjyNDGuzDazz+2L+j/dj4UFJKL5dQc2?=
 =?us-ascii?Q?iePEBUki7PrTMXouHvFqpsXAVfVrykw+cSWw5HOxsycc80V1m2LYsOuPpmul?=
 =?us-ascii?Q?M3Xgx3ulHBbq3Le5fj4nfBpV3OwyHwyO2TzwJBLz36twDi/EF+r538UpVKLh?=
 =?us-ascii?Q?p5xqrOmyr7Fm3Qtvp18/qjM1xEkgkeWeTvgeM8sNmP8KgY4GuIX7B+eQy9XK?=
 =?us-ascii?Q?oO1wXGJVyOQ07lho6eBGxyrT5vVWwR9q0IDmay6z0TDcXKzVFnpq/IAK8bxq?=
 =?us-ascii?Q?EpSI6gP9JOZ13kt111cU6L1DYBTY9c0walEPD8klMRY7ZPKb8dpskx8/aOil?=
 =?us-ascii?Q?PvDU1zLefXKiZ4zD+3PqfNL6ehzhnIcdvAHFrJQix2t9irF18umru+QAuFCc?=
 =?us-ascii?Q?BdBnQN+aya6m4AIeIc7HAWP+urd9bzrrs+FeDOruqws+TNZM3fzkMQtbs0Ag?=
 =?us-ascii?Q?dXIYgvS5L3MX11CxYK82E6iL+OkEpjjL2tR5+3Id16yVsoZxA8S+Obmq2056?=
 =?us-ascii?Q?EQBr5G+zCCDyrQNzdXtZ03NsI3Iy54U0pfrQyuX4rvAQRokkqSlNLaq8oiOw?=
 =?us-ascii?Q?yQqEhY1JTbLwjQ3PZzK7Z4TllxNPbUrp+MrQyXkH5B+alfmBjTdU3zEKvVhu?=
 =?us-ascii?Q?6FCWJ3pvt/iDWU9JwQ7glNbXhV57A8kgBBZK8msvO9vFbFAteeEBEx0o6vt0?=
 =?us-ascii?Q?TVj0mT+DQ4xh+QsC3AvvW7GUnuKcuq+rj/NzONRNHxHFlhaa5n9gxQ9+1vaO?=
 =?us-ascii?Q?rHRc5xQsg6XAEIuD//3sXZC8zX+E/q5B4GsX+VgCn6IP0JFGWXyCDXN7bXPC?=
 =?us-ascii?Q?fobjEx1Qlicffvo7biE4vVaQ79KJ8TEeXu8dQTymxkkBY7jymIWfALfRQFPA?=
 =?us-ascii?Q?q8ydkO2NumP5cRaYRol6eKk2A1VK4RnNEol3G6bdelhGJG1YUi7+JJcPmVnF?=
 =?us-ascii?Q?fNNaIrprCdwRfBZHoOzJKJkUnMgJ/DA3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WhtHkSMRHNFMonk1hvoz4Y5pq0bN4vih58QniJDmHv08gSQQyHUuZ+papdlH?=
 =?us-ascii?Q?c+x4jmq7ebo9cQnxctHAYiOUOSLWJD2TwoQEXZuq+0WPcsFtXlJhY/ORYcPb?=
 =?us-ascii?Q?MZsuVt3JRXmzXo5AJwgLKXLXlHqyaPoHlm2IKOkEMnCUMGbQ+UFr/lJijQLx?=
 =?us-ascii?Q?/unZL4lhLt0wfvXt3GXGmbjYp1+ulTdYxZMqnchkcM1MOjKG6/8Oe6BdajgO?=
 =?us-ascii?Q?+ZXqO1a8J5i5jxRaKLu8pPt0Hd41sqXqwydVh9HGrzxzIgOBLpmd1qg6T+SJ?=
 =?us-ascii?Q?wf6aZn3NvDnlDwL5Du8WtROCogWmapq/Nf2kzmyXTH4xRBG4YJb05WPhOm5Q?=
 =?us-ascii?Q?Plu41YXqEH2zDJULXA2OySXCq2IRRq0aH4/+xvxE8bjmE29s3lVlxPKInwuf?=
 =?us-ascii?Q?Yt4XKKbUr/aFtvFmB5JWqwB/i16ZVfnAMcMCuw802YWYfLlMx2NeflIxFyPU?=
 =?us-ascii?Q?5jbFG4ANthMMOmdmQ68zXiJUfQyzLIolfhNws6E8qYrSZjhW+mvdGSz0KO6/?=
 =?us-ascii?Q?oBWaK1qQ/PT2T1BNL0Z6Sh6lk1il6UEz8BX+NIPW+hW9qaIgfhJDwypdqQZW?=
 =?us-ascii?Q?yjrESq+fJGwK3nt19DWE4tZGqIS9SEKRa7CNgHLQ65/JlSL9EQOQ2YVgJhpY?=
 =?us-ascii?Q?F2euOgZBbgyV2GSWYjeyCaLJmcVyRa4wQpjcxI0FxICgHQ4QLI+dma91zeia?=
 =?us-ascii?Q?PWOxX0bFwlTtSV8+3mKqoQ+1JypLHajnvxeLaaxl7iWDdBP22VthLNdX/bE5?=
 =?us-ascii?Q?fgvTwbPmcyzDRD3sO1x/cJxu8IL+aZb53+8BugA1APcV9rEpdT/0g13zve4H?=
 =?us-ascii?Q?1gxlpt4LQnkjeKzuuxL22NrnRZ290Fr2YgdS9r6zCCw8Nh+zmtZn3RlrCOe+?=
 =?us-ascii?Q?xZ0QvnNFstSIIWKzw/VN4N92hYcxgHYG0nauGsH+13A9g982YOOOuNvNGcFe?=
 =?us-ascii?Q?K1fxSHObdOdthXh1ULLSQQf/cIOobl+ydlZgnziCgIVeFHMqDmMbvDzjQfjY?=
 =?us-ascii?Q?BgGxNLk/ZwuJqo5us7q4CW94p+uBSDDyEofVHCdRw/iyGdPbzj8XQeqqxB/A?=
 =?us-ascii?Q?ipdkmoJCiRRvpkPg/t15TCKqLH0/2yxsmJLwVjYn4R39AOw/KLG0/t4ogHRr?=
 =?us-ascii?Q?RmRCZ7B3QEVPgFox1y8S4tyJGANlKD03oa6YJwuJVPQflyDnSzsDsfwkEePP?=
 =?us-ascii?Q?2tCr2GfP+4zj2scMSTJTTYJKeI2dZo3o/eda+ST9BhUOLWMgCw9oQmJXnMK3?=
 =?us-ascii?Q?ep3P60R6d7CYsbMKyd1T2x0H0Pv5aI1e9QO2cX7ynFIMCFQ+0ODSkyrGGz8N?=
 =?us-ascii?Q?Mno0Auy9UylRRaq16CBQmGvG/FjMOsAshM10+16H6QcqjOaQTtZwOgKZGnBq?=
 =?us-ascii?Q?+xCbBvBtGBj8RLP+lvxGdY2A3ZDpPeSZG5UQR8i9xT0vO2s+J5Ev7qd/j/Uf?=
 =?us-ascii?Q?fGj4dv25lT0DXk8vWNF2fI78v/7sQM9HI2d2QbPh/leq3KJeIxytU5D4c1rQ?=
 =?us-ascii?Q?Mzt4LxhL2jk7HAo58NlHaNZIHRx1Qu3l1IGcwbJf7QzlO4R/FNlgz0fxgkV0?=
 =?us-ascii?Q?rRzSyFvz79mQqIVirut42/P9YuIssz+ymG7+k9NKuIbceg0X0UqSpQcrzJzJ?=
 =?us-ascii?Q?f+1/Q4AzEScmo9ttZA2YXI0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db0559-a9f7-48a6-1899-08dd5a6dd227
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:09:48.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+O+ZxhpkkqRXPSnp+2A6PHIDsyfy3uDnuewDeRBqU6uHhR6mddCh4nOzXMHStU0S5Gq1I5iFzumazOIXZu8VwRMOtZ+0niU5KskyvZFIRK4FN6Zdpip4d7F9QmM9j9B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and
drop error path accordingly. Drop also unnecessary pm_runtime_disable()
from rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 948f1917b830..4ccf7c5ea58b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
@@ -834,7 +836,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
 				     csi2->pads);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	ret = v4l2_subdev_init_finalize(&csi2->subdev);
 	if (ret < 0)
@@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
-error_pm:
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2->subdev);
 	v4l2_subdev_cleanup(&csi2->subdev);
 	media_entity_cleanup(&csi2->subdev.entity);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
-- 
2.43.0


