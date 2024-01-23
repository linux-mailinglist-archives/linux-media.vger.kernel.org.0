Return-Path: <linux-media+bounces-4056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D48378D9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6F4C1F25C39
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E066D1B0;
	Tue, 23 Jan 2024 00:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JGx33lu9"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887253C29;
	Tue, 23 Jan 2024 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968270; cv=fail; b=lVbjLDHeD2x56MgKzQhndu9SRv9JNCFnYH/w7mbAKQ94SrQZQ8h+glyUPPscAU1jEDcRswJfZj+/ftP0kz7oXjgpFlog44WXXo67MnNUq9LV644JpBy/LLsCRQMSP9sKxgERTgTJKY5tjJ9ZVUG6utMER1/qPiEVOpvAB4qZJyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968270; c=relaxed/simple;
	bh=+OSaFJVpkTcck8y6XebnUqDqSPv1A7z8UHFNplh5zRk=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=J9yX3CjKmwc23MerpFTn8HuZhcHvMzM9ThJpT2YtJzrFP8TOLbvMBjHzYhKfqjZEy0Ynv2Qmpwt1RH2qD4t8tAU6CQ7usmHMOPAdBQ9woKoWPLXs9iWA4YrLWuB+AVCryxTuueVdnI8nMPEQElOOFtX1ymiXlVbQ6jdLEA5Uwmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JGx33lu9; arc=fail smtp.client-ip=40.107.113.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POb01j2+A6Wwu85fTf4yI00JceuPE0zBoTf9XWz53m59oPv3igxXX3pPBRrT80kBVL2ORXdsUplnRRV3X947ZgTp7pVEbInLhYuS3E8P0PrvNdQjRKy6LM7WxK0ZbGWmkLO69saWJ9DQY/7gBzpttXbJW3ezrPMuKbvneuheC1r/f31xaHrbYPq4jOWHxTmWCOvjxSuYkKLbEhNUVAu2bWdNpK7Ly06WoGomL/N0WMjKn6R8yG0ei4J7h75GGueqL6/kxRmwc7d66SWHDX6WQHEX51BQUg5tHQkGVWH9jCnu9j5WSccW9SXHnjTkyRRl+EfAhlUWot8KVjHWP25ETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMIqf0muAwUfbN8dQK2ocuBX9q7rm/EQZ0Dyn6Kcphg=;
 b=AzYjVF8H/nZCNokQ2t+YsK8umkRVgcgXUuDTDUR/o6B25iep1I46wXnmPdFKsjJyHNvg3j+DuDfE9iJnMSLjUUyIMx4gnolrxhp9LKpKPzwJCRRygL2aeXz/YDLFq3lUoVYL69YmJeAzXrK5ngxZglat07nGeJIzGFJnUbJufStPS/DlwO9JIe0wfwHod7OirbVCW0pQmeOAwnTXmNiZLzqhUrknv8aBXz+QNJl4dLOBJO/iOE7G8/atWfClRkJ3uxOmHAmbNS9KHCYkoQ3E6/Cp48UBhVXPIhseqaQjtE7JbSU6HQEg2DJZZerukmaFzNEGYRwtLoBJp2dM6gAf0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMIqf0muAwUfbN8dQK2ocuBX9q7rm/EQZ0Dyn6Kcphg=;
 b=JGx33lu97IP+kEy3xKkUY30QUvzSXwQS81p+fG6I7tmmtRk+V/TnIjdASAIEcNYTo18AfuZrsHr/PXvZdRzrD/lLJGvKXglxcOrq5q8F1L+cIUQyaI1+9WKY8t+cLWf351/q3Al8XtuREw5kbnW1gyFZmDIHUv0SZgfM3NeRcTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:26 +0000
Message-ID: <87bk9cud86.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Rob
 Herring <robh+dt@kernel.org>,	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzo0uda2.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/13] ASoC: audio-graph-card.c: use of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:26 +0000
X-ClientProxiedBy: TYWPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac22e73-1a19-4e0a-4e07-08dc1ba6dcdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FHgqO6nbYJvhFSzJdpjnxAfDct1zuk++bN+gp820/4+nxoaEnIT9XQP+jFZ0mqAAlHX3ma6BakShs+hhBIJTwu3j62CH8LceGasNl79tVoutbO+69db0DGOOwH4SqTVGJehX1ZSfaJatRSKY7VXBcxZ15cBVQ40pJP69O9cwZFeRayCzY0UENP6GO8Y7EbSxFei2Wo+8nJdQIdv6Vwvt1HZPnez9AuQ9ZNmWCMf5YqnR3WKegvWWFxHAbO7hICfMqdALPB/HWRj9CNzuIBgF4c2yC4p6dCJK6ItfchFajixI1BSYC7mtOUbr5uz6vnX4AaYOGVMbY1UjIdlfIqKALavuXwcXDOsgWDJnRuVylD3uokbdHcMEARd5X5IswFBwrSerLMf6SJ6ZfyWrD3/H3AX4iJJ468r645oLTR1furXex3G9q+2j5pGEmWwjocLPlAF2J5KT0NxH8l5Q8U70Z9HeQVMyad/jipP3NxhhphKc0spYsCtmsk7LVbI1QRfs7j05sTGsM1sRX3GhvytmD3g5iIpdcAtUilcymzWcC4fjvQBuntYPKAu1InJN5+NYwT46SCR3iMEj4kDIjH/HaEq0ef+xWkHwmUIq5OqNcWnhlAMJdVlYNyiz0wEdiJEThWN0YzWsrjo819eV4RfsQHXdHRqiYNyCpSz3wdkcVz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(2013699003)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(4744005)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V7c8fa7tRl4aA9Y5pp4KVMN0HXK42VKWAc+MHUYryTOZc+RZxIBg5h9v8kG5?=
 =?us-ascii?Q?u/DtovyPFdHPqjN4FzrB5lZfmfQsn3bnj0kKu8oTihHksP1u/CjZXq6m9qAb?=
 =?us-ascii?Q?8sqMTBjFErTbRjhbquqb7mTSpWayh7GD3GdGYkTeqJ9yIfFjXOxS9G0NhRbN?=
 =?us-ascii?Q?u+tMKIY9HvD9dKl9HAsjxQrbBJsIuk+QepRsH6wFnFIIVEnxOzatoU3EyyIY?=
 =?us-ascii?Q?XYpuuN1UAHN4p5FpyRdm9oiHdxGQjl0P2eGF2sOBiYySYVwtylDvJLY9IWPU?=
 =?us-ascii?Q?jI/qWyi7Uss9P4uN3u9Lp4Acv+KrHgOYVj4ybw++7kAZPR6ixAPV63/Uj599?=
 =?us-ascii?Q?sctNUW2QDzZTPFYy99Tv48q98mRi2rx9sKz+euPyl+eoi9NCWOnFqgIPxDO9?=
 =?us-ascii?Q?Oh/lJ99plLOnLV5khY9DeY0T66ESVGCnR0fC3CH9vaeNEPyLg2ozIdowAAex?=
 =?us-ascii?Q?pvXMehXd6tcZfIUoCpOQxsjIQ0x3bj8VRBtOgM0NgkYDlDsIdmM4Jw9B4VOQ?=
 =?us-ascii?Q?iJ70urdADGlnF8IaKDs5lb+OZn9BaIIYO/mCZJj8v/EgYoq8pMxf5opfB/3k?=
 =?us-ascii?Q?GykO2vtwTGGtqpMwX9sA6In085MMwT9qduIit4rjLWX27aGM8CoadKaLyXj8?=
 =?us-ascii?Q?qNjveVgMiisSDTSx26QGjopEPppCEl6lrKsbuMAx9Px8yFik0QqZYSFN+TV3?=
 =?us-ascii?Q?P4j61m9fdbgs0DSqCsPOuZWkbMnZqfFM76TCzIexFrBwElcmQgbl6P+sHLRv?=
 =?us-ascii?Q?vhNQF+Gxxz5lpW1pX++Sv2SjJVlOEsVDGZMen5wHW6dzpPfy/9ykI0r5q55r?=
 =?us-ascii?Q?a2pyUO1Ef5MtTiSYk9sQNbSiaffaW29Pq4qUCF2t8gdRol/67ZY5fD324UAc?=
 =?us-ascii?Q?2GXr1Bc4bmMY9DXpnzLSyGuKN+GiV/RVLa8Wq8yOyju7w4VHLSMe7KKaW883?=
 =?us-ascii?Q?AOj+myaicJfhAGfSg7g9W1MkCG9KmDUY85/j3IgBK8GW1hrB1WxI4+bspBS4?=
 =?us-ascii?Q?OLaj4joYRK/iVwugd00A94dBO/yDgrCUBav/p4/IPtI89j6TmhLBzaEnKmP9?=
 =?us-ascii?Q?sFgmjJ7G0i4Rhd39exvlc/NC2h80R0Y5WMFQwMvLIh0+iqRhP6tloi1C+6Es?=
 =?us-ascii?Q?Ei3GH3Y1JxWeXA72+v4WbfhzPvRn4blvfMqpHq2/9hOFG4wxK4/zK7skN3uo?=
 =?us-ascii?Q?YI7C/8b7wzfuQ5GDpI0OBzKrAXSzD2tWUOYXYOi3XGrsdpMC28GRGGnskRdb?=
 =?us-ascii?Q?CoVACrqLYfh8OySfl8kYaXn0dXYihm8wUXc7yiMnHBXrR5GZJcEjD23pbJ8u?=
 =?us-ascii?Q?PaNJ8xu57jxZg87iKYghhkBqNtNm0SKZp08zzis3gq7Ke+RsIjgZhpZJ0LJp?=
 =?us-ascii?Q?oFoVIqEp6+Kvt9KwkiwsD17ruPw0eVkv7hzkAjFZ6Y3vQJ2+3htppvz0Z73z?=
 =?us-ascii?Q?WwhMM9MFG+g8T0b2NCMIYeohQxoMbn0Fvq6C3baAUa2EOlhxk34EZGTewIpJ?=
 =?us-ascii?Q?iP9Q/S9MaBFTbMr83msGNTtb9TnyZsrJ79lXRGzXSGPGkdzHqCNrfCodfUrw?=
 =?us-ascii?Q?H1SsIZ0c7dDd++iSngXseREklXlx1rU3D5FRfg4CwNgiClZQ43yghCRs24LB?=
 =?us-ascii?Q?I3BHHRmpkLUJcdxEBuVeQ24=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac22e73-1a19-4e0a-4e07-08dc1ba6dcdf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:26.4712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnFhssjkEK8ll6zvLOoet1PmpG4n4/y1vUTPpR7ryAurP3pypvlii87lqRnFO/NCGZW0NkYhClDVDNPooMNRtMMUJfIP/bjfU6xmcvejOpq1ja8Zhmo57OtTMSg6GVKR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd..29bd7c234fed 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -344,7 +344,7 @@ static int __graph_for_each_link(struct simple_util_priv *priv,
 
 		/* loop for all CPU endpoint */
 		while (1) {
-			cpu_ep = of_get_next_child(cpu_port, cpu_ep);
+			cpu_ep = of_graph_get_next_endpoint_raw(cpu_port, cpu_ep);
 			if (!cpu_ep)
 				break;
 
-- 
2.25.1


