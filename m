Return-Path: <linux-media+bounces-4531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06B844CF1
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 00:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F5831C22D61
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 23:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76122405D8;
	Wed, 31 Jan 2024 23:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hqwY5nd4"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E893B18C;
	Wed, 31 Jan 2024 23:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706743528; cv=fail; b=DuRFyOa+PS/txamKJVLT4qFCB0xcOQwLWYQrfJK/iezGYokWmSCGsH/5MEOpFR0yf3IagsM5XY8sZj1rd1HDjQW9V7UTW0EJ/eGW2CB6onD3R5/p1M9jxlL6tn/NP2HORtaIdO4EypiX3zrRQVBGhE/Jede7DJmbocEFCY9eH1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706743528; c=relaxed/simple;
	bh=AqbTG1LZynwzrTaF4P+7purKPLLXLkf+rUqTG9EOzX8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WPeN8YnhYjWb5Gk2HfmSZIxJUbazbs88eLiu0yVcrn6LldiI+VQOQh7WHk4UJcM1LmEL45ezWZxTwhl0A9PoypP/a+Zq318z1j7wztugQ0r1ZPRigPHfBZgcyI0FT7bHwa+Rr+6PNDm7CRXrwAtq7awnnjAW+SrZACdsEXYOjjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hqwY5nd4; arc=fail smtp.client-ip=40.107.114.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/Yp89OhZrcLcddzOvIaYANtwO74s6cIrFUtWYrG/utJVV1p8ca5wYemni9gar3xo5Kd7IuLSOUVl2uvfTcP1xyuzXgUpUG8eSMAbcEeLeqWtySay3KrLM9oaSBTUxMzrdZW6V1sIiBUCDiWEV6KjeuB097flRMAUphwgWALaZWpBRs/M7A8WiwvvUmp3kbTwgfQiCU25NpyxN6fvX0dr3OlhskQG++wDSYFQo+KuOMYTstQqFXdRT+8IdL+FBPG0xGyVsAlZGbae/QmH+drgYveQw5ZwPnr6OeC5puwAUBjxpeMbYU1MkKWp5TflE1Bit+rTaT0BUL+BY3ifY/h4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbwwW96xV2+u+GRgLnK1w++plNV33hQ0rcB9M8x+Fu4=;
 b=gRQNtXfPdOj+Gmb4HyYOfMV+qqaZL7kHhaR2V1nWRPYkJgjny+BFo+aSOH0Y9t6Vcbnp4jqSGbYAqdF7Ub2umtMA1nH7HeV2624fB9zl/DfvPjEJhVp4V0K3U88IX6JQ7iCEw2XNJ+xQhuuEbx2xoFOIq9ZuouU+xGiNmRjvttDyAqJ+CAl1FbmvW03UXogQEpDIqfK1SYam15HRC4X/VozH3WkOZL3KJea3NvCKf93ILPH4rj2Dzp0j6f6xs7E77ecCAVrXwsBFG/nMiDFSPLOaD028MDEaob9idTMafiPji0It4f4J98oMYnNu5stSoI7SqKMK2xy14Baa4slRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbwwW96xV2+u+GRgLnK1w++plNV33hQ0rcB9M8x+Fu4=;
 b=hqwY5nd49bDnNYyk6BenJaAkoMCFRze4gqfulUQ8QA0AElniI8RVL4t+Vo2fk7Ol5uy0c/b0DF4u+X0zVk0T2Cbvt1mikHaf25O55+HMigZ5lmeITzIg08DAFirySbdGIgh6uKQ3TZwQ+WsyEzAdwqjYs24cNPr8miUev4AjUFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9394.jpnprd01.prod.outlook.com
 (2603:1096:604:1d8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 23:25:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.023; Wed, 31 Jan 2024
 23:25:20 +0000
Message-ID: <87r0hxnl0n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Saravana
 Kannan <saravanak@google.com>,	Takashi Iwai <tiwai@suse.com>,	Thomas
 Zimmermann <tzimmermann@suse.de>,	Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 01/13] of: property: add port base loop
In-Reply-To: <20240131185219.GB1906672-robh@kernel.org>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
	<87ede1klgr.wl-kuninori.morimoto.gx@renesas.com>
	<20240131185219.GB1906672-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 31 Jan 2024 23:25:20 +0000
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: e82c4c94-22c8-41ea-700a-08dc22b3e463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MG34OrBHsTscnkNsQICoAQOOjygv2MJIw/cdm62QkrugLeU9UO69NUFEniCEuhFVIicCgB8nNmmsfS8ggpu7tiNLbvdgomHUiYVO5egdWlPIEjeioAfYXuG/OmPUUQ0w7EcOBGleToUOEFafVOcxsN6R3z1P8/DzZLFXln9mFpYBTxNW/83ZHIgJ/r0KFlgtlr1tbQH+BvCl8Uy/9vR0MlIzZ+sOPtU7h9MaL3nP/sPLABsADSwFfeW3Jnr3pZqPo6ULfV/IPEOPj8kTy566V/+AtB8K5/EpBRbwWoFQ0MgmyH7IQ0vXXNanVS3sryZc/D3I5FX1di1Ca2O3Hnq2nVO/XPWYtEM7/WTltOx6ndcT9wvEWIHRsNuSrivqOfiLKIPRz0JD6dX96FbtcvYjW5jyb4LsbEWh33/05tghQUcw7Rn0y4nG8K2qS4WLRQFjYs1WRYwOMf3eOcA9tjwKQA0/+xGxGl/kotXtc31IOGdDb7rLxMszIxSHl2jibeHIN/insPGRt+iYZyZFjOC5cv4b0UCRbx9+65+7IujmKkcJ/KBVG91zDx1D5WA1FsXaXiFJChZexTot33kO+NJRDEumgSMwFrDHbMewROjZz9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(4326008)(38100700002)(41300700001)(86362001)(36756003)(316002)(6916009)(54906003)(66556008)(66476007)(6506007)(52116002)(478600001)(6486002)(6512007)(5660300002)(7416002)(83380400001)(26005)(66946007)(2616005)(8936002)(8676002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GUxMx1Y356bnSwviCLD6c5OKZHlCLv/lVmDYhLT0c0euF5jd5V+DYamERYU7?=
 =?us-ascii?Q?tZCWgRijA7OJyYF3vAOZk+xVxwGRbRX91N2HtGzXg3aqgINsIDWzDiMRaJXw?=
 =?us-ascii?Q?dzrsI0dKcSdP/KfUQifcaj81/TNJgW8Hsi1L7adZ63HimM3DnsOi/tyj/4FF?=
 =?us-ascii?Q?MmmV0Dw9pV77+bB5x7Rm6RV8O5KZxPtpMdt5NpOWVKklTLi+1/gsP3/biR0a?=
 =?us-ascii?Q?H//2XeGGuE3LwuA8Dif7z91nOvfQHsPbaduFioExmg4qtlxZXXZ9daXub0oK?=
 =?us-ascii?Q?pTP5wJ1n3kQkUycR7zMJ6sRfFYA5aINp9/+LD0SW7hA9y/lNavzXYlwyhqwW?=
 =?us-ascii?Q?IVPSYlve0yKqCH9xk2oDzpG9i4JPusmJuma91KzktcYxbkaDWdQ5DJ7chfa7?=
 =?us-ascii?Q?eNLvTahkNdA24ws8uBjIJko48XxWJiTghWHZnTMpVUJbelXJO7ioCDDckBqU?=
 =?us-ascii?Q?OWzEfJ6Mf2I1E7JTjWy6Liwsinae4+cxK/gcghpIoBoOQNjnT3KuiBW6JV47?=
 =?us-ascii?Q?WkIYyCqWhTdzfCXKNo25opbgGl9yyn4X8TaIEesU2EBvZ7I2688/Dfu5rEVA?=
 =?us-ascii?Q?bYSC0kN0GLsu/U8D2pi5f3xN5K7bHvmJQ7RGXcvo5+njoTvA3rKBWHLXc2gk?=
 =?us-ascii?Q?nqJt5w8nO7C/rAQrljmX42Smok3aFUTAZbIBNANF1nKlgO4IF+y+GUvMHA7n?=
 =?us-ascii?Q?AbsqnpjIHAEclMjJbie7Wi223TX1RTv4J6/pHjz+lF0z49jucWor7B8ter66?=
 =?us-ascii?Q?sWz5UlghewThIZdNZ4GJnemWr0EmI5/bNqVZjbARUmQjzYrGxIlmE8AeT+NH?=
 =?us-ascii?Q?zuJfRvb04IFaGk9UFzjbLO9vdVh4Z+EC9s4kucgNohE8O3DTzyVtohz3qliG?=
 =?us-ascii?Q?WpiHq82bTRmnCnMQu7cGMmM6Qd7hVzkQkXhAbTo9Q/B3kF8calkJpPW4Bm5y?=
 =?us-ascii?Q?VdLyloh2JSDVKKOmF4moF9j+YyJ55wYvAHdFXyt9iY708hZuDdsiie6Qzk0H?=
 =?us-ascii?Q?2QHA6sSi2gE7P8UVoL11BDtRluDzqUfE5nusE9D4g/dhGvpoNYq9PF5HWghc?=
 =?us-ascii?Q?Vvc9QXStdKynM4jPY+vZM/FFBgL/ZCgzX7CpEp1+9Pcv0/ifGzREfeidE7hx?=
 =?us-ascii?Q?2KprrJVRP/LtPl0ZWG8a9B6D+wjfUt+EGpJXM6Yk8i6+pO+og8090jYk1Gn1?=
 =?us-ascii?Q?W6svgeULIDMqj+SFXkzspCzLjDad2i214Wx+iPQu6PE7tQFSbLOi7VrvGHN3?=
 =?us-ascii?Q?FkO4PfOcoHdQNBfPDJupSDB/Aa2oLuEX/7mRAm3FLz6l1frMKvlBpYOAwdCQ?=
 =?us-ascii?Q?Y/bgdgMOaW+EmXVg3czxbLs8dxvssUy55yW6xhNWPQKT1ku5e0O3rR64N2Vt?=
 =?us-ascii?Q?h2daPO/8e3m7n0HhV0R5DUqeKK77r6Z7XjbW90ZcYAEjThAf2tdJe9hXM7nB?=
 =?us-ascii?Q?cDUVkhL2tlm1K0dw+E1ZPm0yerivAIyL4pMhPpORB1TTItuOsDA06A5GNRDR?=
 =?us-ascii?Q?UpYB/0kN7p1I/3Z59gO0YnVt9KSgjJtxyDlDFkGnBlfMiD31VtkEZGhnEB7m?=
 =?us-ascii?Q?4GzFH75fHj6E5CjW/z9wz41jDmc9cqzxLYFKh1M27zeOXXIdnAQcg3DiQSAe?=
 =?us-ascii?Q?FTL3AxnLc9eEipZGfqsyUhA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e82c4c94-22c8-41ea-700a-08dc22b3e463
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 23:25:20.7198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYxMeqdS4qS2RJ9w1SwcAyMQrYdYRoeD6W5GjP7Grl3gjrZ8xNwYtgQEp9srB9aG20StlKvPeK0VGX4FNmX/V6u/DnkQ6N6qe4c5k/ykIitkmKNeyJZzzrd3yTpLelgq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9394


Hi Rob

Thank you for review

> > +/**
> > + * of_graph_get_next_port() - get next port node
> > + * @parent: pointer to the parent device node
> > + * @port: current port node, or NULL to get first
> > + *
> > + * Return: An 'port' node pointer with refcount incremented. Refcount
> > + * of the passed @prev node is decremented.
> > + */
> > +struct device_node *of_graph_get_next_port(const struct device_node *parent,
> > +					   struct device_node *port)
> > +{
> > +	if (!parent)
> > +		return NULL;
> > +
> > +	if (!port) {
> > +		struct device_node *node;
> > +
> > +		node = of_get_child_by_name(parent, "ports");
> > +		if (node) {
> > +			parent = node;
> > +			of_node_put(node);
> 
> The original code had this right, but here you have it wrong.
> 
> You are releasing ports here, but then using it...
> 
> > +		}
> > +
> > +		return of_get_child_by_name(parent, "port");
> 
> ...here. You have to get the child before you can put the parent.

You are reviewing v2, and it was already fixed in v3

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

