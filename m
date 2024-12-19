Return-Path: <linux-media+bounces-23800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 335729F7D9E
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 168401629E9
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41000225797;
	Thu, 19 Dec 2024 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q1NmWueZ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D1241C64;
	Thu, 19 Dec 2024 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620829; cv=fail; b=Ci7WO3hJ3tRiYcrVD6QhHXIiLlSMtyJsb0chr7BtqrXdTLGPJmkMeh4EQNox5T0YdoWOuIetAOIFW2BrKdjlCeAhxMZZKxrTQ4H4d875cVsYnEAPAuJcDdspyNyWvqK+Rb9KEtzDiyp2fM546daRtB+05ADeu4E3cDnOqTDNrxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620829; c=relaxed/simple;
	bh=13eY3wQGnpZDBBzDih5UD5gPOC9Uc9/vuUd60h8g0V4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DbQCt0C3KgxVAmrmNJDzPOEGaZv2resNLiVaRPOvchw01/6nGJ51OLc0tEs/qQr8MVgy60u9Kym7XaWGucg5ip7Djnc+Ms27cnZ7OI2KzIVC2Lx1b4Ks/lPu13XkcRzi1/IqbwLmTTvBNpSTq4CH7o1q7yVmBOi5nryd6rUDJ1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q1NmWueZ; arc=fail smtp.client-ip=40.107.20.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2ZOF4ycv2PmUk32SLAw8qEu2Sre+8hhgiScUnCU9rVq7ZgN0nWmNLIs+2LUETiPb1eUkTEqiHoiihRPO5hP+2eaQsziA2SWIfojUozixAzJGBe405jA27VcziT5JAM10nITP1Een0BamKpXym9QESKF0XwR7yQOjgYMuabC1E9J1+hmgSf3cJuoezppxDk1PIrfxPZ8o3i8pRK1ztGs+knk+NA7tObLLx95cm95NvwZZp58RQTQBhEiTJLXoGc9c5NYJUoGwDsu+J/4y61QaK7MoU43Ugshp8ARkTFHxjBQ7uTjCk8qUN/297m7sfoCUgETmdoXvtuQZ5Jk+Xg5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDaofmuWLQK32cPcn8IlheUrq4T5w4nlZEojOjeXD0c=;
 b=AY2bNZHlmzqTKS8X/jyypDbb1NrySrJ8dlM4dFYhbSU2jtLtmRfaVk9I+WJg7txB1+5tV8upWrHoWTchNhMbvBt1kj2ijiaiigZmyanh5MMlHQzXi4B2J0maXu+d9KIUoVALTzc95H1+jMzmzFiN+eXo1nCYYxj1mOl4cDI6/WIRh8O/+hyfHDCTEfE4XaeesrZzLr42On+QzGc8comoK/Epx8E11nNlxuEPn3gqxIX3F+LkUaMtUq2JM3BNnzLuc4enSvZAny20OkCynaJqwKMPoYRxQKqcvv0yo5b7MiDGEU06u2sPkBUZbeA/IrYenieAsyWj2MROx2/grqrpew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDaofmuWLQK32cPcn8IlheUrq4T5w4nlZEojOjeXD0c=;
 b=q1NmWueZ3AquuPJUjJwo35A71CxnxWgZDDBAiKA+lsR6DpwwtM6ZJDeu1Y7YqaUEeP5l7pIXTrmYBR/xk/0ZdfQjqVGHUWM8TytUju782HQ3wqyT78KQMO4R5OCCiYTt+KhuqyAh3Fz4q6/BqQCtMNaHR3PBTZFx+mezwyy/AZ+e2PsfaUMXaAw8B95iVHSpDfyd8rIYpdYRbY4dqYwrZQEINPrMw5yxYP87xxos6EHDgZj6VYKDTVzXXlFEOXIEFTredwM/qG6ts02UpT+NDlrjKWv4N2TEnnYhJeSDfMD5iKDy6KGXdjTfOty16nfYhNkVmcQENRiLNaD7mRjKMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16)
 by DU2PR04MB9146.eurprd04.prod.outlook.com (2603:10a6:10:2f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 15:07:04 +0000
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e]) by DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 15:07:04 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: [PATCH 0/3] staging: media: max96712: a few, mainly cosmetic, changes
Date: Thu, 19 Dec 2024 17:06:40 +0200
Message-Id: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR01CA0109.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::14) To DB9PR04MB9578.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e81aef3f-c03a-4b4e-87ea-08dd203ecc5d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xQOghbVkng6BR0+9xl0R0WTFkA9ZDAm7HZg1FuW/ZWPRmAdMoz9WjggDpsmq?=
 =?us-ascii?Q?SJ8x1canQJQmlGd2H2S9fCZHXPyeiuEBLxJp+7dBqJPeSwAmRQkWmy9sO6Wm?=
 =?us-ascii?Q?cYZG4cx3EHGatJdboPRPQ+3wlCJ9+h4QVkax+Jx9bLLLayqcC+NnCtIMlRTx?=
 =?us-ascii?Q?o1b/KDCRBks9ij8LdZl96i2Iv3rg0uYPwOPkE4+j5oJqtuDpjs0ADW4G+z85?=
 =?us-ascii?Q?nLVlzBM2wFn+aIWd/Fu4TrOXs6Q+HEbKvGytE+xvW9nRCdqtRzNlVPinJxuI?=
 =?us-ascii?Q?i6rCOzpcFgea5Bl9tler6Qu3IQUNAd1nN2HVIaQjSux+PWmp+Z/eon3yoSqf?=
 =?us-ascii?Q?AfMFL0vNhkShBidKNsqqmSRk+w09eYDWe+QcU1HCC6ZRcUjPrQCCp90vi6YZ?=
 =?us-ascii?Q?FFTQa85mov4a/INfipruczXfFAquFImF9Kr2vOyF9y+1tjTwvzjvdC0cuCc2?=
 =?us-ascii?Q?+a+Qp7i1MFaL9HTddrw8rIp/Ev5fbg1lFTOPa7AhZAK46uoAiuzQDZDbreZ8?=
 =?us-ascii?Q?fjfitTPkGdJFtD2vsWeFrdSB8rwwvZ4/VbjbNCtsRiJtdOMdyvY+dN+ZQBfe?=
 =?us-ascii?Q?N1/xyjp8O14wGeJBO8v8BGPVrj1PG7eqvg6DvQED8IrXOfGQo/TKq+P5kc6Q?=
 =?us-ascii?Q?3emWHZ37WRIgxek/ztC5jgS0bsDJVXYvECkLbWyL3XdY7QDRI/wkwTmgrA4a?=
 =?us-ascii?Q?iUNjiDEPnvC4U7ljYpIho5yzqS9oL2B24piq/BDHjsabs3t8ogZQ5CU0mgdd?=
 =?us-ascii?Q?9uqXXG1jwRb6nbygCiufpAOtucqOv8BRs75c7recLg9rm2jRZK1Nyu7AUc+v?=
 =?us-ascii?Q?GjgDWhRYjXpW9/5gfWsp6W04KHe9LiX/NKoYfLxQ2UR/hsX1UzyXambVkjn4?=
 =?us-ascii?Q?bVwM5lvyxXT1kaBmgONDHlYmKeiWQvLBsHG98O5TV+yQELqKRyln1TROEAJM?=
 =?us-ascii?Q?aP4r7Ys58omriDE8y0a1s3Ex+BItaNhaAvqlIrbSGxp19uAToNETJ0dyQwRj?=
 =?us-ascii?Q?Q9tYJsVCJQJcnnHUBbtsoaa4UdRySCieCCIEdIQeWsqWiQfd3lh+w6ZJCoza?=
 =?us-ascii?Q?TTyQqF9lPXJIXA26qPAsGhDPrJGcXYGmyHf7e6zqzey6d41C7DszEaAs0HS2?=
 =?us-ascii?Q?V3o1WhKW90unGU5AIre4W1o8PUPPBWJ8PvDBiRC7Z9eCggZiRcLjB8UlNE1f?=
 =?us-ascii?Q?6mLwFQ54Uit1XOdgXgWgNkwCM8aRe5OWz6CraYjIENUnDWebsQ49aZjf0DGP?=
 =?us-ascii?Q?bs8pdcLfVGAN6nW67wIIXDqqhTHBGl59OFFI2C1RA9qdx3M84m2v2AMSAoS7?=
 =?us-ascii?Q?UEestb465f4TgZ9CfML41xf5USe+wqBi5xDH54DP4RX/sJcJZgPqBPEsjrhm?=
 =?us-ascii?Q?WKmQFsO7ahAi11VvRih5RZiYtsK0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CdlaZIs2o2bZ1DROZ7Tme0adIfjht1rTaBPzT3lTu2Esbzija4EQObWIh+We?=
 =?us-ascii?Q?1DF+2PY8kAPmOCa91e+4+aK29QIHDOPwqjlN9X2TVkO+/V3k8Hp+JynhPkKz?=
 =?us-ascii?Q?/WcM0TjLOeCP+a3zhiCXNSuCGDglBQZ380KQUjtHFwQe+EKCOw8JJkkLJS2g?=
 =?us-ascii?Q?N580FtGo1MW73/fkJFVp4VUbL6CV+KonARXKkPHZCwzMnHubP9Qk9v6vSU0Q?=
 =?us-ascii?Q?y0FW0g0KbOUNYgJN4OKarL4Zjd0EZkoqdeO1aKVJSjnDI+/fDfHBZ805VXnN?=
 =?us-ascii?Q?v7IMKSeNn9FowOa0c5bzhctC8riBAGGpO6379ZNiXMzsIaUA9YUN3/Rj3676?=
 =?us-ascii?Q?ckkM8PpQkX4usvhvcu3qbywqWm+zxXosGOJtznbl5IMMz5/0yc1BxKN39R4D?=
 =?us-ascii?Q?E5OkWT8bPXkR3YKqKc7SmVZeXkLoH+3T3nl8CZ4q5tB23qomo5slVw5sApld?=
 =?us-ascii?Q?9rYpINhb0p295Rf9R9tX6BXCDZGljXKWWKGhyhXfFNc9u90/HfQjR1+lkmIM?=
 =?us-ascii?Q?sztZNDSizU9oMobCLGdc9HxZn349nECjC8k20/HVOC8z3tH/TS1nmRFH4JA0?=
 =?us-ascii?Q?BNDeXMjN8jcYOYjknuDkYH9TZshpPHA70OVCv8oi6eQQ413QoIKuNeMfL/wB?=
 =?us-ascii?Q?GGFrwZ4Xn4NK0puDNYVpUe16nF628V8FVIijXm4PsmE3tgRKAdG6NUfKzmiu?=
 =?us-ascii?Q?f8/1GHsYRCPyiT8H3sE/exXUHMJrt3RN0tP+4rfJmKS/myL1DA/zu7GjbW8X?=
 =?us-ascii?Q?jm36Ms8gtqdQc96TZIs21r5LezN5ie9vP/Z728fav8XdA5E4MQZ2TtCC2rFN?=
 =?us-ascii?Q?t3ThMmkXI6F5bria6AhoSe7nntdK/hJdCA8c5CfSnA3d9Lc3qW8j7U77A8p6?=
 =?us-ascii?Q?7e8AFIK26kPLx5N36qlNbi0hEubCffGuHEgLSeqBVOKJz5bu7/en3cAYkFSq?=
 =?us-ascii?Q?VbiphlWh/w1rIaFNZ8opMOoewv/rf2E5P8spkTF9Pgr8Z8MdI0hodnvnIr5A?=
 =?us-ascii?Q?bK2oefz4oMNSAAvfK6Q0YufCE1RHiG65aPuk67xYpGMyUbBVG2i5qD1+qTm/?=
 =?us-ascii?Q?mDITzebBbHFBcxh/+9mF7C6nNSYcVWUNhfzdQJx2WWviJAKx4XgXlYJlg7Ui?=
 =?us-ascii?Q?1HyXLeirU3Tw0WhjWylOLRokGTkDLjzpvOVuaFo5Tx9fDNPlsxgHrWkSkY7j?=
 =?us-ascii?Q?/VqvgGwWfHlHcx6lAUlVNcUydLPbDHFqblsuHusa3sdgCYeRMSOo3Xb/Y6AE?=
 =?us-ascii?Q?4qff2N10gcBEJHseLCxSQwteg5+JoJTx9WwQQBx2lhGSTr0PpBlyK9uXXZZl?=
 =?us-ascii?Q?Fnyzrj+pkX1NVkKyVu94IAVmwfrwdK634fwXoi3BxNYocrKADvIhclO67LBy?=
 =?us-ascii?Q?1qf6ghpADGrNLVT0M+mu1F6aLWgIH3esNyrV3TJjF9WP23e9xC+aCNO/dSdv?=
 =?us-ascii?Q?F4zB7nAcqRc9RsGStQNKUGCg52FgIZkLEBOB4qtA6e4RVB7xmrURcgHCUtrI?=
 =?us-ascii?Q?9XJIutpiTzDFOHGcRa7rE0DYTxbXVIrVnpmrZRQv8jQh7YoQvR1Www0Kz89T?=
 =?us-ascii?Q?eGz88FAsHjBfjpIGY8mVRDtCBPIda3lB9ZkRU+d+fK7jVri1/PgjqSSOJ38R?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81aef3f-c03a-4b4e-87ea-08dd203ecc5d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 15:07:04.6973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Feng2mnCICM0tDb0YWXRgH7NqbfTYNTnANpKFhNEMWLL543RvD3Cig9F2pwsnUfoFeKbFM9kDj9ycEOO92lWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9146

Hi,

This is in preparation for bringing our downstream max96724 work into
the max96712 driver. The changes in this patch-set are mainly cosmetic
to increase readability, with one exception related to the PCLK debug
register which appears to exist in MAX96724 as well(see VPG section in
users guide [1]).

Unfortunately, I couldn't find any max96712 reference manual anywhere to
make sure the registers match between the 2 chips, nor I have a max96712
to test with.

However, since the max96724 compatible was added here, according to the
commit

6c872b782ae ("media: staging: max96712: Add support for MAX96724")

the chips are "almost identical". So, I used max96724 register and
field descriptions instead. Someone with a max96712 RM may want to
double-check though.

Thanks,
Laurentiu

[1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf

Laurentiu Palcu (3):
  staging: media: max96712: fix typo
  staging: media: max96712: enable extra debug register for max96724
  staging: media: max96712: add some register and field definitions

 drivers/staging/media/max96712/max96712.c | 210 +++++++++++++++++-----
 1 file changed, 165 insertions(+), 45 deletions(-)

-- 
2.44.1


