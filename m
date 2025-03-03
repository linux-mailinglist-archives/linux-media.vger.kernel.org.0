Return-Path: <linux-media+bounces-27388-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888CA4C68B
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A88C3A7917
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9CD215195;
	Mon,  3 Mar 2025 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="o+oSIfHs"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85968211261;
	Mon,  3 Mar 2025 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018208; cv=fail; b=dFiyPx1uCYmIInx9Rejri+vTu6eXi9/8h4gGIn4pffNu/Y9cNTRDSeTiJ9swc/1f2uZQGiX5mwb0+KBCIzbLVNGcwVD+un9ZVWSl8GgAMJd8HqolMZtjPNumVo00GxWEQ97DVtVKFg19ZhjRTOYXbL/HKR94pXrZUWuBhogCdE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018208; c=relaxed/simple;
	bh=HsfbftITW5fd4UAh+3xyB67wD6ITcjCaKdzsXSBD5XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vFNTCMmXwlV0Aq64jeGeLpDMoSyEpv63mAj1eRL4tYKEHnG7rMM2IBA4FefNlleDuQfoRLl8OvzBFw5AE7Vr+znRLsQWgPRnh7CBj1okDlKnz2tixvlETTbUmq+D+ZrOX+A0Sf2C5N+hzQIzdA7EMcF+12POTgh9rUb3zSgZzVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=o+oSIfHs; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6kO/1cKjNKOXv7zyf+1mYaHZ38xJno5P0jSz0HZAM55S8QB+6kQY7TDB8XqTlzD3Rz6xFfhyAbnm9EsKr0jSlD6AHYlmS8VBKLgOCZL0XoahMT0QxFCGPEzxVNOmy4dMaYH1vliGslg8FvQmCXLneipEzVVD1eELaY7LgXwijRBacxXOUgvHG4UFQqZxLgXHzjGzfmdSpCeRJKjmMtgWYPDgJZv/E7GapePWY1bJbK3pM0y7x1p5cwoq3XClzyK4Tye7j5KCNCkg5XsY5DarNMoTsY7UbHh08bzahoaW+CjpsfekexxBEzM2Gmp3dguKLw1SbIvg9xunWIi8YebuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxD99Mokwvg6veNRRvfJy1z0QYpISgAvXyQloHsmRL4=;
 b=OyuYSxeqsUa38rGAi6ZRpE4hM1dq9JUPlrnnBQOmFoK3Syk3eKkuqfuQq91187dS7BL2+bv9Ie7Wkvm5AqTOz0n1mbyyZAPiKagz/fSxPkNx6hZjLFP2la+akCQ/wN2NdqlDSQ84jSzGGjmAS3HSuC/4cox95y6kmAA7pYq1vcyPgmbYZP2o5EMGqbCMaK/7B5ltPHbKx042f0GdWSvAh2tebDK7PgYUFtVgFSbMb6gaIpE3zb8JaJjN7/BHHJukDRQf1SLyT2w9dbXIbkVEPcMdUFiEUucrkf4qeOzORjv11KRKFcxrD28WJeWGZiMqccyU18tXyvEI0V0UWXqFcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxD99Mokwvg6veNRRvfJy1z0QYpISgAvXyQloHsmRL4=;
 b=o+oSIfHstPrUKccTEt5hbNgfZUtPKKYTICTgYjWawMXcR4eTyvGo+5hWGvBhQceiE6QdFH783v6UNWSVLLvVkpOKnS5N0aVoqqqcGCAirCZAanHFvmevZ7VMmd6zxGy4EWAES1r1ZQxABUOlS6VvdAQsFwajIe+fhVcTJl7YARc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:10:04 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:10:04 +0000
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
Subject: [PATCH v4 07/17] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
Date: Mon,  3 Mar 2025 17:07:47 +0100
Message-ID: <20250303160834.3493507-8-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 70f5a4eb-90aa-4d1d-f8ec-08dd5a6ddbd3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qhqs9D9/77hSKq81Bs/FPn7HE6D6VbMRMiN9Vf4QICB87ZTyvYJGgfi28n/0?=
 =?us-ascii?Q?kr/d2vHYBDmxVVTrxwN56+4Kb5lLvOlNnWqZzQMDKstuk6O7sIOo00hf049B?=
 =?us-ascii?Q?F01Nml8hxP9vhBStFHldHevYFiLKu5Uj8nduzMJB8L0Ns50r7MTnksQOEyvw?=
 =?us-ascii?Q?oJHE0Cf25bgAswgjJwer2dtTuYCdjHuCoBLqOFclPqJaLHNy+rV6xhAQWNlo?=
 =?us-ascii?Q?WssLrPJTUMHO+AlB3L6HWstFcgqOpTx9JKoOeKMcMWb2QfpUgx1yw1KsGt1t?=
 =?us-ascii?Q?Rw3ynXPvoXpmT57BKhS7qkCnrBKPWN2VhZ+j9veKbUjFXommKxNz1n29zCvS?=
 =?us-ascii?Q?wTas8dfsgWHHBSoMgV7ROgE9cWfs7aD8zW+iqUe5YP4wIqUdraL1LlCRotAi?=
 =?us-ascii?Q?ZjXVIcm5K9WD5V/jzxMVvs4N3yNUp7BFAaWPdTFn1oaVwapxN9oiPVKfK1Cy?=
 =?us-ascii?Q?2wH0oXPSE1BATwiFv/TXaJiN5c/BT8296Nm/Vvh+0FGN3HJ4blfZwLQ6cwpB?=
 =?us-ascii?Q?aEVhyRsW/KLG3Mzz+Sz6x2kiMyBVyrGjEWn73bL6JXbP/+9pqjalw+NUAIpM?=
 =?us-ascii?Q?lwWLJqhGTFaNsUaTkDYsFrVBr6rUqSf9X0/yyYv1lok9E44rbJu4WoNcpkhz?=
 =?us-ascii?Q?R269PjmyJ28CviBOT6wfXvpvcZCROytDboFFgj6DPgoaBouYxCOaP66+OQ88?=
 =?us-ascii?Q?V4fGLpce8PZqvM1Nh6Vlb1AHP9zpnHoFKIFV67G3W9/Iu8EELld6WAYGujIH?=
 =?us-ascii?Q?1pKz8hCBA/yi1iP3kQKohOhsvm/o5rlTlTuvpQfMf5UmVZMxv57KpSkQzZsu?=
 =?us-ascii?Q?h3yjG+0KfnBq/BOT5vbX0eETAygSWuYbLjX/ZIwJRcwDELgC8eyvtir1d/zH?=
 =?us-ascii?Q?fV79xphlLguheZISWucz9RZp4VZZbiAnA6Xz2Y5b9DD7Lcvu7f01PG8KxoTC?=
 =?us-ascii?Q?RuLzF6vBnAKaOy51U1Y8pG3K+NBjwqpjFVnOwKuwszoLp9+KPPHpC1qbgDmr?=
 =?us-ascii?Q?NeehyTcatuv9IBEMdrTeK5g5DgidIrLiCgaWbEYKVby7m/77ASPEzVqtn6io?=
 =?us-ascii?Q?9oR2TFWF/ayuVSfuRQtSeELErUxU6i0Kh7+wglQ+lMiTGUGB2kIvA3iBp1gc?=
 =?us-ascii?Q?qKxLLj1f+wT+Pr0FczckmZQxpNkcSpS21tFzxUjjTuRjsKA5pKvaeQMiCBk7?=
 =?us-ascii?Q?KkhroJWQgd3GMv9mTUj35EvKdW9dQAQTYpiZuUGFeuAofhpF1kYfAt3GOWHP?=
 =?us-ascii?Q?ZUKa+n8ptTHfjnEpqRWJQUm9TT8UVd6V2wywABsl2RzwzRPkFtArIMf6AN7K?=
 =?us-ascii?Q?VEAKr9x+EDkS++PbfB88X8kWr2JJrxjZZ1PAe0eLnGz0g0pD2BujTen9YPtY?=
 =?us-ascii?Q?m2bQ++8CUWvMuhS0TmqvgbD/CjuiaEPigamJm+nxDrdI4oR/NFwDABwiYEWI?=
 =?us-ascii?Q?lH72p3HbR56riz5NejkiDdUqh7CpjMHb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KRBRBxU3O9RSJDJC9tVMW+5OjX9cPO1UvUZIb7oyYs2A6iB75sHFhCzu+W+L?=
 =?us-ascii?Q?26HCdZ50P7Hho77jivSAuB8DKlYKpb+ZAV/Oa03h7CbBrukoCUyUwe/VSxxJ?=
 =?us-ascii?Q?2Vhgcjl6oFm5aXzq98IITFBudcK4u2RfZv/dC8o0y+iVSe0z56rmLZ9lipDu?=
 =?us-ascii?Q?3XTnUIUnivGEb9hJelxdQsJXWBwgtaSS+mGTRNXMHR2o52aE11f/qcfM+sNS?=
 =?us-ascii?Q?ETS2aGO8sQUgBov1bpiCyDD7c1YZrz+vxWs5JxMSvNIoE4HYS9TBfVr6LiXF?=
 =?us-ascii?Q?kWP5g+7mv/n5v6vqXufvWb9NDhVldW/HfvalXVkB/SLpwCAK/pjSzGa+GD1N?=
 =?us-ascii?Q?87P4CcR0SGVP1/oFNjft4Q2Yw2M4E/DaqkrjCpDOZ79wXOqk23rMvZOXcVJH?=
 =?us-ascii?Q?Qkqe1QuJCNVIv5dQWV/XnRjUYzauY/S/ADwm8os/IP5ZZCJcnt/MuSxNpApN?=
 =?us-ascii?Q?aO60WOw0z5WscZ7aq1T1EEgPdhB0przotzBnCgyaI0VAn4qf6cFYYv0MIIVu?=
 =?us-ascii?Q?lzRBOoRZYLXvC6HseSy2c9NH/YZufQS1UfpIHTX3YDyDIRonn8JYI6M/Ct3A?=
 =?us-ascii?Q?YfOx3G9A46Qx/fsQqrYB+PYUOKNccjRQb3Gsawy4fJhsz/M4DDRcebU5TzCS?=
 =?us-ascii?Q?rzfOuRhrS4T1Qz+zf1AUmbxcyH7LYfUq6RV8DhxJaOFVlVWGskuMwnZo28Dc?=
 =?us-ascii?Q?+/27nKeo64IZoPDRnSB+0/gC35CQeQbchf6koNy1k39YhXEM4zUIqspP9KVC?=
 =?us-ascii?Q?nuPQ7dL+7hopKYELyvZc1+iDdCvmvr3j3wUgzcBzz+S0TBJij6yIWcs8Ttha?=
 =?us-ascii?Q?5MpkD3UUvYxZ52BRmeHAB7Vf1UEwVVXYjoajgn9/+jkdVzcWpAKE/dhIp+bh?=
 =?us-ascii?Q?WE6UuRWQQatZ1P5goY1XjGvY6DBC63NmV77S5D4JxOes0x22A8v43Efo+XUY?=
 =?us-ascii?Q?og6vfiJ84fv9cNKfQjYPQWd+4YTbi2A8Tyeev6y/YL6PqdDQu3rA8rLvmk1y?=
 =?us-ascii?Q?xdz2BaLhXWBWLi6y1Q70yLAdAsBZwUog1dMtT3KJ+FOqoftEFMCDZDM7oT9g?=
 =?us-ascii?Q?rApzyNfUXRJIFj+bEmNL+1KNvFIKe1gEe+UVkSqTHoDb5q9SH7MjiqZtx+Iv?=
 =?us-ascii?Q?F5opkSqbDP0QIf7OaGdbudVg7drqmUqyWGG3fOfCX0ewUQetwiH5vL8Bbm2p?=
 =?us-ascii?Q?7e8n3StelBD5U7wqwIJcgQtvPl37vCg96FAryqn26BfC2lpHAYnZFy7k58mM?=
 =?us-ascii?Q?dkQ9CahZN+sh5D916wUnPg6NEGWwA3yLNFKfaEh3U9l5ac33AOKM/ibGp5UF?=
 =?us-ascii?Q?MjdjjxrHRrbkpi2N+rl1oaFjH/hCesf+dDGt788M31cB3fy6WuIW4uqBCNAQ?=
 =?us-ascii?Q?mq0zPoKZgQ5NhnlGJcTxUCUYC7iCHM1p40n8sX6nYDLG5cXV3L6jn/bqZq3s?=
 =?us-ascii?Q?3c4V0pKJ9BpVM7eiCD4oF7/A4/a/8zsn9ICXfyYzV/h8j1rA9CXnK2aVt9Sv?=
 =?us-ascii?Q?h1yFsgjXWGvo+BSp5gbTfKzzqPunpKZ+gX4ecEvhrqAYQQf6S/HKfIACV/cA?=
 =?us-ascii?Q?Xki2kpxafBmn/rL21VZy4tGTXN4IqiTczvnHRNd3CVo+dEVsBm35Cktuwq85?=
 =?us-ascii?Q?DryLehltQzuhn/T8MRFLFbo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f5a4eb-90aa-4d1d-f8ec-08dd5a6ddbd3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:10:04.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKZQ81JCw3rM0l5F7SqfCtxFv89LNXwlISeB1GwGvHIMe2HQydj000/5GqzVom/Cp1oHA/uGSZKgGH8nmkDkO/u+ItNXHFb2lfAgaThRZs+uw7pte5733SIMxpQDHJWm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed DMA leak as suggested by LPinchart
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 70fed0ce45ea..eed9d2bd0841 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
 	pm_suspend_ignore_children(dev, true);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto error_dma_unregister;
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_nf_unregister(&cru->notifier);
 	v4l2_async_nf_cleanup(&cru->notifier);
 
-- 
2.43.0


