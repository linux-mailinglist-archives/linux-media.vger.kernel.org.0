Return-Path: <linux-media+bounces-4058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD48378E9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 01:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02852285DE5
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 00:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314DC14534C;
	Tue, 23 Jan 2024 00:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Mg8JHf+0"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33CB145322;
	Tue, 23 Jan 2024 00:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705968283; cv=fail; b=CaXYmUha3ItStQazvLUJWf+UnXBiDfenNpo8bX2fJr+uY6HiabPPWADbryRY0Poj68qN2ticsBFvaSCRGqEvxHFM5BCKCSQR+rvzizSP5BhT21MECVnj6cFGYBhegvDGz9KCr5IULk/gO9qgLhmESKBaKqykpfJN7ohE/8R0ICE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705968283; c=relaxed/simple;
	bh=V3wysxgtpraf1FD3rzXyb67aBJ+ub2E5Q1LB48ROvSg=;
	h=Message-ID:From:To:Cc:In-Reply-To:References:Subject:Content-Type:
	 Date:MIME-Version; b=O74AUe7dlYM+AqIX8fLxUrleujDgFV82KPnNqrF8IMRJYccL4fJ24sYB77H8GZFQUddN7CjG6jwqocRslba325vKLlhYK/5UhUiVVB3Z5eFOOI+MwjkV+jwvrQ1aS5f09G6LAFGLbPAT8iknklSQRYOLG5p34eHMKd3DM7rtm6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Mg8JHf+0; arc=fail smtp.client-ip=40.107.113.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuFVBxh+m+hI0hkiMY3rp9NSnbrqSsgae61T/rWvwSxCttSyQdRs9Oa9hSMom1nuFnbn+0LxvZ0q72UG1JHzhea9LfpULmxXd23i1mqVkD+C/kDQm34xzX0sAjPdlRM3BZnvQKQqBTvFqWY42MfwDfWKBfqKJjvL3xDWDIs99Jl/HeGduHoi2yoKFP9lsYmx3eYarTspiDA9VH847/tegWCRqsvQgOcDvbuQNAch3RIL7RYIEOhzXsr0hBEV+Uis6DdG41I6MJEOeCF7jr0xVNJFTgi0hSS5Z5cZUm1PnHaWhiRcjrmjU3VbPUuYVxf6SS/7eALybdcz+Gz60GynCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+zbHtJG2JPjss3ic5YyQJsUH4T3jOKFdArXm1iaN5c=;
 b=Pb1iBXTLrnJcdEu5dznWSKhPuNd2JuAPYL/kAD0iTwTIdAd+4wZANbN4HOlPrmwsmklOX/auXK5LByANjuAoowtXJNEtXWAz/eDtWyBHzer1bJtan6JS54gtjccwtPHO3xpVCwYThjP914d3Tf8jvq+D73NrTxf0tdihLHhOlvs6ouAiftwVN70sG9wy1YI6+w2Hxm63uCwSrnQe6IkY6eKmzkHYEibKun5ZAehsSaLSE1atPMM/9CPNN0MKLb8dO+4LYqLbiz6HJOb+SbFZ2DhEw/1oqxxPY5ecEKEKMNvaEfbhEvz3DU0gydWDpQm4jymvZAC3JkLP2uI52Abuuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+zbHtJG2JPjss3ic5YyQJsUH4T3jOKFdArXm1iaN5c=;
 b=Mg8JHf+0l4ct0nJZVaAcd0wdtCzoGhp8Pln6DzAu8ga3u+D21G6X+YnYmAPb0k/DTqc4MjWyFkj7fyLgI66HVs+CgKm2/vuf/a5tjYyCimvnp98Qb6McpjIGtAvw7KYHcyAk8/hVK2l+FPPF7PQDKYEj160xu0K4g6Jl+k37Kzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5583.jpnprd01.prod.outlook.com
 (2603:1096:400:40::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 00:04:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 00:04:39 +0000
Message-ID: <878r4gud7t.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 08/13] ASoC: audio-graph-card2.c: use of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jan 2024 00:04:39 +0000
X-ClientProxiedBy: TYCPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:3::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da20250-ba7d-4dfb-f391-08dc1ba6e497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wXDoSEUVkYB7r6lwadXGtAUcUZ7oVjtIUk0EJWRG9sDyGgaq5S+KLMDuJrQxU3VMI5IcpJqQ+DyAVb5Vjo0AFS5XfCqfh5KCekFrUuG72a51WWu4GSb7vzfDyFGLKcCkMN81n/pNlMjInxV/XafpbbDM7s2JV6VtAndKKohWjWxq7DJlGmc+D3CMMTDRXVJ/lLipq633WtgxGkfTRn9OJ4e3VlAK5myaaMkXc0PybjRH/AhFM+3+W90zn+YbI1kieo1ldZDIHNwY+ICK7moOwyTazQX4FCiYZR+4eNHsLWboldK7dQwP4khzW6H+iCXWHu4EVOWBXh9Zr4X1Ae7T4lrtaNQpeRHAW8XuCVPa2BmB7A6WoqmJZMIxGLprPadq2RxG6brNQ2uMgBZdakMN4EC2bdehfPyYM19cHcq7isO/d1AR55SmQ7HprLu+wyaPae9jAz8i1V2C6AtrBcU8qjz7MHYroi9eRM88rQ6Gurgsj14DAQHVwGkZaTbklQDm6t7c1kwEKzIDnQMAfB7AuwGFiR93i/6w0qRUfJc/mlxzr9VifwTktmk5wlTa6HBV0MeEWoCbRYEL0u1nveKtB/Mm+KJTLbFirJNqiS81rkNowZaXRzB0mzKOHQUd0ufhhuARB90sUYprHE8kbOqaVBdsADeBi8zzF3fnYv5Gu3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(2616005)(6512007)(52116002)(26005)(2013699003)(36756003)(38100700002)(86362001)(921011)(38350700005)(41300700001)(83380400001)(5660300002)(4744005)(7416002)(2906002)(478600001)(110136005)(4326008)(66476007)(6486002)(8936002)(8676002)(66556008)(316002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FCPemcSm1y0rB1vOu3T+yiLJQTlmp8DBWccPSpuzZ5MdgYMkf/h66W5iYlED?=
 =?us-ascii?Q?iFppc6+WWoMxZAcqhScnPkasd9l2MZGvYph8ka3E1E2Mj1PWsyrrLsK4bWp8?=
 =?us-ascii?Q?2v0/9qQl+RNSC0oT1llntIie046/LYW2pplfSmjDJjf1Pz6gWAApTx+nbsmv?=
 =?us-ascii?Q?7/aSWMGlqklQPceoUKPNlT47BUMVuwv4fyNduxeUsymj1ye4q5DYbG4YUlaL?=
 =?us-ascii?Q?0I6RxUjFgzjrKjzHvDuYBxgDSNDDLDjkj977SpwMXD7RkHSBwUX3o3kGaCs4?=
 =?us-ascii?Q?gWMP/Fa9RVZs72qs364NAt1U37kDZglN7eGraXZgQxqwe7+RahANkq4wadZP?=
 =?us-ascii?Q?EP3zHFctgHRh6pLTGxmmqJoTvkfTofGDQ/ydE9yT0ua+YXDCcujYDVTLiyrS?=
 =?us-ascii?Q?+weEnra7UD/HhaoFPm9hNB4M1TR4K4ma5iVNKXSY+ATvw20cSwTe6bEL1+IA?=
 =?us-ascii?Q?GjvzmU42UXp3pO1xCdDILomVVL3wtN6ZiEcDw5sKfkmCWKVPaAKVyl9w6AxH?=
 =?us-ascii?Q?jcrb+KAmd7biwWBOOhpTZEWpumXJdktmjNxQHDeDWtbGvqhhO8ujD+lE+/EL?=
 =?us-ascii?Q?niOH4/Xmfe2v0xSe5U22TTMqpxK9B8ywoFw2NX29yxgelBua0Ay15BFucEM0?=
 =?us-ascii?Q?clNURunhIDCd/6u4nnIaFzEd5nwcLm8CbS9Q9eDmpTaoxhP7zLAPWXNU2LMq?=
 =?us-ascii?Q?zsd+n6zLc+YHRuvKRTlU++Xaeh9TNbdaq5vqE+CQHYB1wI5UQpkhsFBHQO75?=
 =?us-ascii?Q?Ce5/GKrTbDWZJ/T7NiO7nUgdZQ/CpYZ3Hq8WEY2B6M/CE/Xqpo+4PCgad55h?=
 =?us-ascii?Q?kNyHVerMo5uNdyKt6/VRExhiSEijEGUliEkTGuNyi7WJ9UnuW/5y/kqy8YR9?=
 =?us-ascii?Q?lA2Ax9FoHjGENL244vhU7rZ6qTajpzO4Nks5czWVXs16NEwaRkBVoTwNn4Dd?=
 =?us-ascii?Q?59NQOclXnPztrRMXwIZ5Ow9R9F5RNnTCFOFdH89yYqwQvmOaySZdeo4JTA15?=
 =?us-ascii?Q?mzyd+TH6oNEXs5E3kfJMwLbiQOeKoM7rbt0SUKiKcbZutjVOD5tw9bm5KtwD?=
 =?us-ascii?Q?yF2abqz/PsS5kcMTwNR+NZIAQIULJ+JFBXgvc2sMjBBkPfOAaoAEfbLbys1+?=
 =?us-ascii?Q?LHyqFYchg14PsbB9i0U5EKO3CK+37/cwnnTqHcxTgy/pykTqdxipFlStFKUI?=
 =?us-ascii?Q?wK7Cr0VlqaPMdwF+qX070enaxpIiwXqs9yvBRk3gzf5ECZSBlecfaBTqD2MK?=
 =?us-ascii?Q?oHSexXjk5ay35IxmFyg9Ueccd0mu2WGu6euy9ackVSTvgJvkAp+tS74CqOvZ?=
 =?us-ascii?Q?6OUtxRnavTKQppmdd6+OqQE205hwUc3qy48ftNRAUqOtRVSNMT1nlVAmMwCx?=
 =?us-ascii?Q?I5qpjVINqaFYi6tUW+OcDqGs6vm2atDie+Zwp8CPw++dHy7m0dIHWv1oeqAN?=
 =?us-ascii?Q?5LaN2g7Ni7Oc/DxWMUVg8ZwGe61oWq2qj8DZNSjjpCAC1Zyz4y3ho0izRRAv?=
 =?us-ascii?Q?kEpa5qjQAOR1k5zfwk6WwJw5pchsU/m9/1PCW6rL8DRbUzWPdVq/FCkSjDmT?=
 =?us-ascii?Q?DxYNJcYB2YrKSEFyYzbvlu3tgEk5rVhan3QMmXxhrjtctPJP8R43XkLjWUdI?=
 =?us-ascii?Q?jq/Yy3AE/uZmTR1v7iPHmIc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da20250-ba7d-4dfb-f391-08dc1ba6e497
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:04:39.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHSYa/nDpFnUxJ5ZeddWHxucmsVUqgzluZHumJMtz33N4r2Gm8TZSIKihn63VFFDnAOizBLGW+FxJjKlEJqoyKqjHbBlTcjTm43XJaGaf4gb+RgsF7YdXKFMy61k+a/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5583

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 59a5db12bb5c..d616a82f05b6 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -555,7 +555,7 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		if (*nm_idx > nm_max)
 			break;
 
-		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
+		mcpu_ep_n = of_graph_get_next_endpoint_raw(mcpu_port, mcpu_ep_n);
 		if (!mcpu_ep_n) {
 			ret = 0;
 			break;
-- 
2.25.1


