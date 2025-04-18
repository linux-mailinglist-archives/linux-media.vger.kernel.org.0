Return-Path: <linux-media+bounces-30532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0BEA934EC
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E988A0743
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ED226FDA9;
	Fri, 18 Apr 2025 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aRRP4lHN"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2040.outbound.protection.outlook.com [40.107.105.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5438B26FD90;
	Fri, 18 Apr 2025 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744966512; cv=fail; b=g95M8T7KaZT5NDZTaSenMKP8gO5mEnYdS9D75BuOW476p8+/bBw1P286xGNe/5qEt5reBGgfZy9tzrmP1pfm8MGSArnbRzbAzwiau9LNBOAtsgkVBlJfMzRDfRmnP39luos8uKXegqQJSg/eBiesOjdpfCZON+m4+Xbq1sae0U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744966512; c=relaxed/simple;
	bh=7QoIWGn4LExeqzKNFZ9dpfBgFg6gk1w9oq2Tc8ZBeME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TRWQb2bqmLiR/zFYsU5VVM1rPrncKLNgljKZ2wjY3hZ6PCsnMrIunnw00od3o+s6KwHxDSdtZHrcMKT7vqPfijbaVUreL/MUfkxb5ueeSqIfJAQ0OTGCN4R09qKYHExOeo6zQVBvYRSQsUgUrybBAyskJJEjGs63lUVGq2Gsv0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aRRP4lHN; arc=fail smtp.client-ip=40.107.105.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+s952ri/gBhvVKPfeQgqzisci214P1UUi3fDqx2ndSydjUQDwM5/PNP21b86MO0Tjs+de2QQpH6kqFfrL/7Tj25PrKJY/i5Ese7Je7OC3QnYqjunNhc7Kn38M0UGfYc+BcadZjOYAmhdNwDAss7MzOWMzDcS+1nktgHNBBx/2TJyf6J4cJMz1p+4N1HLziuIwxsiZjXLkLotWY4AHKYsyF+jU0zF0d7KP/tpwnh5rV3nH2hPEvZ6Srp+gIESf7UxvQChFtP6ATIZ3Zr2+PqlGC3ZCNUfsSds5MLY0q4dZSeDq2Vgoy6hjCFD0y9yv6hDsdxu2MHvIWTP4NsQWthBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf0jQyJXJbh0GIVslBpxdpDBoPcwDClwvnC7scn6OXI=;
 b=fj175P9OERL5iPgQIRlr7lYF2TkQ05It+DWp/w3fBhuS9ZPbKQIFHsf3ZRwXIn+LLraLKO4QQaz/ap2Vz8XlTlZV87EANoxyowe316awBm+jQTudT4kGiXpB64M0tT+xEBOyoYRoDnIKFifXBw4W1Wtfy3W3MYbsgYN9kG8/9MFCl1wCIyOcLc52x8pzK3oi2LLJAuIsNp0er89g6t3Z0E6qWRZqcm/MU9/okG5GYfRB4FXBUfZU/8Nuqo9X4i0muiV1rPexqk+KjG7PX4g4k9LyT/UDHQOMPFL4Pgqs+xQ+3kgfMlLOenQpRCQa136FYYzG+ulakRZJhVonvV1qag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf0jQyJXJbh0GIVslBpxdpDBoPcwDClwvnC7scn6OXI=;
 b=aRRP4lHNgiKEy+v67nelheeEDip2myXh0EH3yuFEWJUisGlvU/nkbFFKH5M5Apt7BnWblfzvW/BAZ7N9n6mVDpqAtSDsUzFQ5TDqn8MayXP6O5sbspqWGiD6ZxUsBN0wPfRMmkHDOHq/l7pqVwwVBFegn0piLUsjRaVMQmnDKAD92SMZjP+zVz4ixt+dYphGYbAHmhWaTSQU9heCg+5yRfJ9DtSTQM0cqwM2kAgAkDcDUy38KCf3/0Sq7ISvp4LKltOcOgJARm7ejH8OJ1iZUwI3DTfypX88/zSJZzmv7vSnQfrHlMlJRVLsw2W0qATv9iEh/ZHa1nXQfsdDb9juAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10638.eurprd04.prod.outlook.com (2603:10a6:800:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 08:55:07 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 08:55:07 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] media: docs: dev-decoder: Trigger dynamic source change for colorspace
Date: Fri, 18 Apr 2025 16:54:17 +0800
Message-ID: <20250418085422.193-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418085422.193-1-ming.qian@oss.nxp.com>
References: <20250418085422.193-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10638:EE_
X-MS-Office365-Filtering-Correlation-Id: ba534594-bb99-4d01-0b89-08dd7e56b77e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I0EixdZUMwcicsalLDgFjFunSlKh+SOww1/x1Z53bdb28o/i8xEEkYtIzUPd?=
 =?us-ascii?Q?5/GqvwW1HjHsZCzs2oXFhrVnzy/DnrBKKeHywsnnCJ7ZC3FFoClNk9QqXnQi?=
 =?us-ascii?Q?FBpPJ0hnFIFhiOAdI+MkslvgSLokTmA2hqYj6exvD5sFrT7Cz9x8wMhSkudR?=
 =?us-ascii?Q?R9Jh6jNZjhg1inTYQV8PJflw0SZ53N/SvtGwNKWRMpAW+rdS7cvjAOhptSgr?=
 =?us-ascii?Q?IbobuA9HexVs84qDTRlvJVPFILn892HpL68rXK8ZUC1Y/Mu4AVooWRvKHPkM?=
 =?us-ascii?Q?LjQhzxxbJ4SyiRbOOYEl+RMeMWdqmsINoGqGOkz98BXjAV04lJ/WDXYbpEuE?=
 =?us-ascii?Q?sRHbx5mHqCxGGPPNu3qJgtM+E2heuebN3Pf5ps5MVxWJ+FtM4B54GKWGiayn?=
 =?us-ascii?Q?pIdXsx/v2QRefV6OZrVvhxYV0+N2fT5F60sixkOQT7TMiN6cHxfnVeTkTeSt?=
 =?us-ascii?Q?Ukl1raF/TcxFJkFi7iTq0G/UH8d1Ws/CL3a7Z2Tps9BXBzdjCOglvgxXnrec?=
 =?us-ascii?Q?5N1lm7iEIPWLm5ZEuMRu7psHloo4qtP5f3Syd3XDpMvYl+npnxw6/aVaAXW1?=
 =?us-ascii?Q?ymYU8WaEhkMHE95Fcq2JzMx1h+jkByNNlqsMiRniTGa+O4cN3hCd3yoGg0fC?=
 =?us-ascii?Q?Q5m5/BJnoOWopLVHjf9Qkpb790rWrzZHISxk7DVGvYpg88qMnhAjI4jtLL/o?=
 =?us-ascii?Q?M2NoMGSxes/kqdpCZWq4j3CtqcFLIF95D+k6TFsuoovdin7HhC+uXYUKqLab?=
 =?us-ascii?Q?46uGZT3smxcqSXx4k/Bk38+hcDTncu2Jo1V6ZjU7kdVAI5+WlP42JvJK4Wlw?=
 =?us-ascii?Q?2lPzzkTi6I5nuDxktdUL7ANbrCs7WUFTPDawQflQzqh+boNSebeHDYRcdqCA?=
 =?us-ascii?Q?RpDtor0z4QRq9Gdy2LzOAJ/6GKZ6ZdkvWrwFGwR9l/+adoMV9+QscAo0pb8G?=
 =?us-ascii?Q?8B3E5CIqDwfIhJRlaUbwX6ngBJGQFDvrtIhKTBcuVsfzvbjO7RK9Ipi31oOJ?=
 =?us-ascii?Q?ZKl+kKC9TWuy8Wn7hN5WDH2RpL8Pb9/XvV1FlkP0f1b1p34oCosueUszKBIS?=
 =?us-ascii?Q?4worBa+tuE3RlS1uXZm5QL9lxg2Njia9HtSZaSzBmbyVxtxeCVrkImfgt/Yp?=
 =?us-ascii?Q?IWRhkvOm8FDUg+29lEDRN5nm/M+lNFCg9pi1tRkZ96T7ZkalXuvdUQirgd7x?=
 =?us-ascii?Q?q4eyLBz98jr+8XdfsRhA57bwxsioV4pKOm9cGx/drW6aycCpb4A/J3iD7v3/?=
 =?us-ascii?Q?ror3MmSVt+EOgEtPui639UGCNxafLLFl6AS5+Qg3idHVwLODFpoEmbyApQnr?=
 =?us-ascii?Q?x8oKP/ULwFTTpE0lnF1c4YMaCB0FDXWXRoIr6OyYAttBviGT1Hm/xBuBtY0K?=
 =?us-ascii?Q?6i5NDbjFLQhnDfo29tm7LRpwUcGfFKPrZQtf4NqRNWa3IUHIALWu1EjyrcHV?=
 =?us-ascii?Q?XHMI44VK+42MT4VzfXfZ/pO4SNHtiOiHL0fxuwZmu1Gw8EylsZaT6ShOml+G?=
 =?us-ascii?Q?aEqlHJvpt7LEONA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CPSE7yr3l0iCZ684xHeMJG72zyVAq28Zvh5CCWzVmTJkL2ZuDKJQ6X+3+NRz?=
 =?us-ascii?Q?Fy4JKnKOBQLdfX/y6meGP3pZAawf50ufW1UabTs77f/s0zqA4E5Wc61o73qW?=
 =?us-ascii?Q?deSXUMRU2B873ABfRkDJhy2zDqbEcuWkv9Z6fgMvug93kHDiP6LsvvtUT75J?=
 =?us-ascii?Q?Z7RDmpl1eA7RjimGUkcUyoaofq7lmhFIBoKMz3dC2YM+7L02nFO5OeWOKb6G?=
 =?us-ascii?Q?cmCri+FHv5DRIPUv7igTGHzqJ9JVfFGfY53J5rVjwBDKhxjVyuv6uPoXx5xp?=
 =?us-ascii?Q?ecoSU8SlSmb78BoZyqRzDdWpZyTXSBvS7Bouy791KBv+dXnTwGoDUUBv+5CV?=
 =?us-ascii?Q?3fwhlcVnBpT8Le+d8SqAS0omcybXpfIUtA3aA3KkTMKHIu5kR/8bBzNgkZph?=
 =?us-ascii?Q?RMnB0cKLMtjfJALLFEz2sSIDpeMbOsF25uDl0Lutn+wg7NSTvjQeFoLVNBcA?=
 =?us-ascii?Q?qEzFBC2dlgPmu/g1dylNDIkgemdRh5p7XQRkSEvK9A0Y1uArrQqTRZwecPLj?=
 =?us-ascii?Q?VvZHZ5QzMa/0PSJTlwYBZfWIzl2wJgUx44feGyeIrzCUFbAxrhYtOsqiESiP?=
 =?us-ascii?Q?eA4VxNcrffX1HIoRYqhT1tbNOQwDfB4XbiqtthnVguo9+G2zT4iKaB+9psmV?=
 =?us-ascii?Q?R5xWTab5Wv8nVGxiwyYHlpPIDJu9VO6wcRS822y1kgwVcb5e6qpFECI+DE8x?=
 =?us-ascii?Q?mEyrHLMgcyPjbyY+/QOCTZNWAYUJi1SGNMKf2n+lG/T5urRBlA8/pcrW5ij9?=
 =?us-ascii?Q?9xRDQZ15gYi+XPLoWV24t9zYJQ6d4CGyx6JhJ9iJwrHbSpFn9dh9+mozu1FA?=
 =?us-ascii?Q?1HcKkkVaXlE1daV0QOwD9gGLOLArm+HAuJOTWjrbloR6qYxkMf7BfOTCB+m2?=
 =?us-ascii?Q?jjd2/uVZK+eI0I+fgbIZVvNtqayAO3btuIaVuJzldO7g7lAYe1OW8Ly4ndtu?=
 =?us-ascii?Q?qhhOIyolkds+2Kxycy8Y+xVyfhdMsrl9nzZC5VJWdLc3MX7tiD9RyE2wX3QI?=
 =?us-ascii?Q?ptP6aDhTHXWLJYZPKCEhdzYj6ojiwvmKzVDRXsAo6LFEgxWfTJNlfK/pTACN?=
 =?us-ascii?Q?aTsb6pgaKQHCmKYeDw7PF08N7WQ+rSMDMpENEwX9qpo5fd1puZxWqvnb/zed?=
 =?us-ascii?Q?yEAN5TlGM1MCsj86weDCDvnV6gr0Hg26QCV1mr0OGxNoOG//6YNFcn99oHTj?=
 =?us-ascii?Q?lHt3sXXpY6OXfSWDj6dXSlEq3DtEC6my1AHB3tTX/CrgciZXXabisS0CYNWM?=
 =?us-ascii?Q?W3ydQeLkHNB2b7SN2rYOgk7qjs39+7KdE5n7U0Fd21YQA2h5hfMueLbSD6Ay?=
 =?us-ascii?Q?FMSF2XkPdsAPLRqNfMbC6OJTWMqCUYCOzbmEz6nDvSPPtY9B/uf0PKrDQW4T?=
 =?us-ascii?Q?K6A3ZuKgIr427YwD7zlDMzFZV3Xt9dtyXW4wrLI6NhBxkQ26AhuhQnJjQkZm?=
 =?us-ascii?Q?ichMJNQ+4Zf6AaLp3A3ZDp5oJs1W9Rr4c8WbbcuOlgSYkgvw6SPOsLpCU9Jy?=
 =?us-ascii?Q?UrhF307JHBHk4Lm8rls9ddtEuS+CI4LBWGTOTlhM4HQIRnBuMQvFvRs+KBAV?=
 =?us-ascii?Q?nXMb3LFONK6/YsHfjTlJkkqPuKvSRXKPLLv8P5Kx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba534594-bb99-4d01-0b89-08dd7e56b77e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 08:55:07.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2UDp5HIgKEni4ZdoClbXHuynozdqkAtH/E5p1EVMbf3A3NRJlXqMF2WG1m5UVycCl3OlpmUm/UxlDsOpoQriw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10638

From: Ming Qian <ming.qian@oss.nxp.com>

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


