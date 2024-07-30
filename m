Return-Path: <linux-media+bounces-15495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDAA940274
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 411891C2293C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 00:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A547A4A28;
	Tue, 30 Jul 2024 00:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i5JETKRy"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D8621
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 00:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722299715; cv=fail; b=m9BzL1I4ZpPGKbhRrWlNckmtnryCD/HD4T7LwK+VeE6+kvCAGEXtQ0xHKGRpymugrmMZvL/DcUE0jthfdiEuNhN3P9vNTCjKnfwe/MO8AZ6zbr6hPAl5Xr6AEw406vHr8ucSNExgiulba33xtzxlAV9Z1ovgHeHq5ufAiSEOJvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722299715; c=relaxed/simple;
	bh=uceUvCGwLuoMrbqNp+yNdos4nDNpPBVY4SNxjeyFpOQ=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=SGBPCzqbKAZv/YGmCToHoda4ZzYcmvu/ny3Tj621ZueuBKF8gQytbY3yR+G2PwSqg6ZD3F2iwcwHP6Uw2hXA89YallZKT+kiMHF4uoNn7prOKRsBrNJ9WyVpYQAMMY39SSLl6P1N5VRLOp5EpzaNIAJ6YDCpcHLFMnDdIbKpsM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i5JETKRy; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+OWY07MbksGqmkyWnoeqRJIVMCRVA6IdEx/INGh4eJzQVDR1TxqB4Qt6SEolotgFwEg5hKUMoSJWiYnHTVQnsHuhn3HV6PEAabiV0jIcnt6R1I5wNFj0pDI9zauqDW6HKIHPOTxNOYCNLp5JHtU9qzSi+RCmPTUPe502YdGmlWwjxaWlra3JyB6B47pqLXR/J8c7l/crxtaQ9sVqavwb7Tx5AbN84FSGo9wcvr9ORJRob+5VDyFqRbGsMqvJ/4hJ9rwhr9k0jGRMKosoqIxhmINu8N5/KQ1XzePRLdiPdgMWZ4k7wMri5BjxLrrxQeoyMSCwd5EQgWo//ioJxKm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=zV5luwDrDOGwoLdrSQwSJMbDxesgOSocCb9p4iICcgO6Z1O6ZYLfsU8QtDqplw2dFXjOVv4BsCn1cVPBe0V9hQ7wd4a03A6w1/WZr/Tap95A6/a6eTwkauyQEP3QX4geUAzNFp4Jdel83VYtcQDpJ+mz/RrYtGTqSdeim4TLBau5wuJkWzHzJQCXixniaexuYJ6G8VupZz9NwZ2rwud3zmuFAKy1za/bmdy3ig7dbQBooNPwn2NnobkT0uZ0IiCW1zaJEnajS95UHy8PafWdBu698ab33JVkrA0le+K2KNrYDrRv+mCMDDMlQGhYdGEVY+n2+4c1JYrZjhKUYwfOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzMCVV5NPWYM3brKH+nwYP+wX2ZizcEpv6rpzs6d6YE=;
 b=i5JETKRyoBDCEzPJG+CxPzOz0+pdwO/9/L7CHitrFr0ZPKqxllJf57G5wXXtPY5kcz4jxeCB/EM66ZFQxh253IboWq9cGexMa4mH5obQ33NZn4OKjZoFiCtEZN23+EOoBqiK1erbmid7bpgLOQwj1HmEkXha5oXny6p3YauqBBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6149.jpnprd01.prod.outlook.com
 (2603:1096:604:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 00:35:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 00:35:10 +0000
Message-ID: <87frrrlnsy.wl-kuninori.morimoto.gx@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] media: platform: xilinx: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 00:35:10 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4f1e1d-839d-457b-8709-08dcb02f77f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bvsnmDbRyDLdf9lHczY3Vc1e9mZNgiTnhwuHaPhEp1fiytGsJGb8+ZCfr0BO?=
 =?us-ascii?Q?St7Bjw2oQFCbosBXGYYKy7xgprMns/n1Co8EtdU8nUPZOW8lsQJ4qC0lAoQ0?=
 =?us-ascii?Q?8tpyp3dB91FBJ4UmO6PHn2TK25nA2Xs2c17rc5fIo+WnMKyJGUrgiHPKDHYe?=
 =?us-ascii?Q?hIp45KRd2FU5U9RFkGxgDzG8m80UZAwEBhgytN8tdMIfFR9RaHtqo5z5vg18?=
 =?us-ascii?Q?PixjDBum95sv03AbGjtdliDHkG0L5obBxYHgEA0lwrBn08a788PGRwGmsZN8?=
 =?us-ascii?Q?OKiYZYqHo6UWWzwRxviejof9PKejbwe/6JZtWH4dwr2AwzndhR3/IRhGnpbs?=
 =?us-ascii?Q?JVKlXVdd8DkytSPp2BksgoAZamk5g7RwPWk8SmtZ3ozBPb/dNW/cySm0XnNM?=
 =?us-ascii?Q?FydjlPfYTn7bZEibmjiI96OQtf05An3kdUmSyAv/ZYY7gdkieQHlQT0UY5ty?=
 =?us-ascii?Q?HDRELbY/wrI2OFDdXaOyjitXFjMTkxhJlS6hTc3C7C+zqmnxh16s0qEZroS5?=
 =?us-ascii?Q?NV/+60w+pWZ7dce/sAwq2hgkS73SG8vINPT5NUuR0SbFQRZfm6zi4EetJSm9?=
 =?us-ascii?Q?QOQzmPQrAK35Xq3ilnDUCrrGhU7cWS+PzrfFxWMcrIbJFXYHe9gmXfLwk91t?=
 =?us-ascii?Q?Zlnvy6ta2ot5uZ8AKTu+L3mRNAsvjNefFHYsK5+ihqRLTn+EcEGDKQxyDBUl?=
 =?us-ascii?Q?Lt5BgvdDhMUMgiSIN3sTCySexXlZLhcXysAzqcncA7v/cYEBnFmS1QZCW3JY?=
 =?us-ascii?Q?PhUfvvQgKNv74W+yfTN7iy7Y8c85ojKM1PtsTiAEjjmM6qf+KzYC6CzCbqvE?=
 =?us-ascii?Q?F4ULO1vx95NHo8AzgUQgkbt0DIp+BjQAIChgOFfhWBUBYzRnILxwtwLl9GN3?=
 =?us-ascii?Q?lxUj5ceq/qWYN5hrWhNCMIpoHLu1lyWwoxbWG9qtz5nmDrKcokGkm7WYaY2M?=
 =?us-ascii?Q?vp8cgIskjLLncU2p9kKCsDr2oCYooGM6nwJGBK+XYnVe9O/W81VvuHLtEQKr?=
 =?us-ascii?Q?Q1KwmYukUrmhjOdTkG0Wx6QI1Ojv1lm9o3QVRozZfXN9vxF+Gvnmz91DARrl?=
 =?us-ascii?Q?SM3mt58RW6RCkVY0R2ILWOpYSNRGuQ6ysmJ8CALkQGfEzywEYS84mTgC094T?=
 =?us-ascii?Q?XKYWMP/3pcTGfiGVcLGTbeViyTNXez/MQhHNB0mBhY081gmZ5cjHojCBZ7Hm?=
 =?us-ascii?Q?Mo9EoQZ0TNmqDni9MSdec3n2OyVd/oUtGupkkh+tRmPu0j+Z9jIKStAsiDmK?=
 =?us-ascii?Q?vEj1cs9stN+6qJl1RNVBvDHqiqpYZw4fH3FOIXOe2cXd2LNrirK8x9SS36PW?=
 =?us-ascii?Q?+Fl5eK9CU5kV3W9jz0/B7O7+1GWguN2S1DNfEona08UNpjEPtZOOwpDzRNuw?=
 =?us-ascii?Q?INgKYBbht8TAJkg1+/6Gl2T8PEzPfUePjBNsaKFWqWk23RNWwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K6OCbAEHXwDP3fdTW31onEI8zOe/VN9KFzuOxR76PDZS9X8SenghPIfP6S/A?=
 =?us-ascii?Q?uCSNNJKH9Cnc80KzLTm9ItX75PglGqr/gVJDeSjysWOr8BkEJauZ1WFJ5uqj?=
 =?us-ascii?Q?FU3weTLfXpkSY+DSi5TILAaMiRQSlRiFsvBt9jqSVCWo/ycXCqz2sX+Z2fUZ?=
 =?us-ascii?Q?kndYBTNgR+3btfp4HlYpO2gDpaK5IYr7FOezodtqNFzIrpm3/hkK8fUXJGUx?=
 =?us-ascii?Q?404x2+meobrLv+iqzt14dzxA1hCMl/JnhvRiKGr3WBEQQOm6i9lbYHPcsF/N?=
 =?us-ascii?Q?T34462dlKvXbmx5BCztm2hxUsL0av8YI4DjZwRZVhayAyT3x0H91L3XBspb5?=
 =?us-ascii?Q?EFvDqkklm7KbFr75/7twoziyhxrAAHfrNHH3sN8aYY9vdJ217O5cN/D4uKyu?=
 =?us-ascii?Q?F/AwYHPqTv14HKDs3nhAGUvazGJfLQmepf1BjePQONXazoDVWl/MiwHMHbbU?=
 =?us-ascii?Q?MXq8Va7Os39k70yYqrkWexpSGxeIOyQ7JEN+NTJF2LWQtlS3yqZbnqRi5UNU?=
 =?us-ascii?Q?1gd5ahlcC2FkKadO8A6586diO6llABd9k3hjD0faJHLjUL/3tRAk/vDz8IDM?=
 =?us-ascii?Q?DDs7Df3Wh03bBesmqFcmyNSzSk9gmja2QaxXzhZ9wgaa8764MB6kOKuFLsT7?=
 =?us-ascii?Q?otN+qhH2JVA3LCLHfUqKV04FmnpX+qWAvGjQgXnmNZGpOUf+MiklhWdFy0gL?=
 =?us-ascii?Q?6MQ0QQQ7YoeCIchXhhd1NqC5prhOoVasp4KfzR1JJXXOO3FudJw0ZZtl2yLT?=
 =?us-ascii?Q?zmmPzDuZf/7lp7Q/ppEBaiqlOTD9su9jtElz6XVatIbOQFinOVPtGAdNriCw?=
 =?us-ascii?Q?spRzzECO49K36Sdn2xmVJIQc4+hG7SOEDDAzjEYZsQBSzjMkxwl/WfVCnNrN?=
 =?us-ascii?Q?fYOlx4GJ4zX4ff9N4kEy0Yo3zSVO+H+7yugXWtaaUCqn5BJ6YTrVf/Kie+1K?=
 =?us-ascii?Q?hJ4Ag/bApaN/GGsnfsvy7NgKguyXnXexwjm1wtWg9XGWkvfD7lhpRqpUvQ4p?=
 =?us-ascii?Q?QclaOVkTI0IRvsQdSKDy9nkkncW5Ci5Up3k3vbe892UH0Na3DwNGso/Urhjs?=
 =?us-ascii?Q?h5oPkH8KoiE1WTzZJL6Yze8N69UKYTUeESTKrSzKmRuvkQ1PhbIYGy2j27fs?=
 =?us-ascii?Q?T3dit7PJboyW1/4PM9RVlmOQf7I4y6JlhE8FKT1PGJgPW+fHBk94+/i4p1/c?=
 =?us-ascii?Q?r5jSEUkgjMTGvt87Bxid25Nts4o4gPGyKxkB5CyjhZl42mXadFL0hAekyvKC?=
 =?us-ascii?Q?bOGUST1+1zGWt/yg6Dw8ctLYKEybnerJBJ2JGlZLURigZXARpbGSf+faN5TU?=
 =?us-ascii?Q?FfbHxNioeY4jghNi7zvI7cxE4/Nz5nOY+76PyN2AmojoZNN+qlfOuuAFLnx0?=
 =?us-ascii?Q?oT6YUIXPyPegMhT3yBOoAYxkpKhbFpTuz+tFpXlu+Osb35ZkftDzjjfW5bjd?=
 =?us-ascii?Q?5uwGdiARjASdbuxzlKJePsvbn0dn+Uwl1+WdcNplakJBTPtz2rvP5hbGqcPP?=
 =?us-ascii?Q?2RPnV+hwGO0kxnuppkNczP3G2qMmrDmRQPoBH7Ygg9B7PNtVliRrtCZ8bV4q?=
 =?us-ascii?Q?Qu0r3eKwlBN59qHVXBXKuVW1v67NEjyXxNG2CU9dBt8ZN2K9h8aVW7zGnlWc?=
 =?us-ascii?Q?Ra07Dfi4oyoiz/8bnpX6Xx8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4f1e1d-839d-457b-8709-08dcb02f77f5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 00:35:10.3533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP/AxatUnWTjk6KRIGBSvzMiSyZo3HXxLcbpB+n7xJEUuV/P0VIlP/+2nMy8XRgMH9FcYCH6BqrwBDOJ4d3mbteGARvN2sD4fXtANa1VDnKxqLpRhIQiSMie7g166tSb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6149

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a730383..bfe48cc0ab525 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -199,18 +199,13 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 	struct media_pad *sink_pad;
 	struct xvip_graph_entity *ent;
 	struct v4l2_fwnode_link link;
-	struct device_node *ep = NULL;
+	struct device_node *ep;
 	struct xvip_dma *dma;
 	int ret = 0;
 
 	dev_dbg(xdev->dev, "creating links for DMA engines\n");
 
-	while (1) {
-		/* Get the next endpoint and parse its link. */
-		ep = of_graph_get_next_endpoint(node, ep);
-		if (ep == NULL)
-			break;
-
+	for_each_endpoint_of_node(node, ep) {
 		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
 
 		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
-- 
2.43.0


