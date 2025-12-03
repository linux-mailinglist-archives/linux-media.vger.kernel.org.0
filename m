Return-Path: <linux-media+bounces-48196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8BCA1AE9
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 22:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C989F30080F5
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 21:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9F12D1F5E;
	Wed,  3 Dec 2025 21:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fheHNqKF"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CC81514F8;
	Wed,  3 Dec 2025 21:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764797529; cv=fail; b=gaU4B8uPywPA1gCBFNzsaVa7sXHsm8lATtPhmHKplsfNJwZzpOB7luCz7bi4eQ4lkiKMo/SUaKDD3ku9UXY2p7F8IXSmZeZetQDBms0WNrq7Q8HHPxcZDWTvMrpqL9RmDYQJV34u/B8HFGw55+uU4eAEHEPPAc5HnrkEyhO2qMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764797529; c=relaxed/simple;
	bh=PZIwFo1wD7pl/v/u50ddn75wfuELDZhJXtNTiBdtVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZHt4sy1Bi3tNNihKRkAx9OR/qvRRKK1R57cbswJjwZBAD7aiFtDctncySUq2VIa9Z4QoosYKQUuHqNVgzcZWMENNEbBRg08AsXtXuKXH0SFHrhwvQQqRNsLaIJq6dnWEA1VXHHoJU08g3Tdxz8iRSDDq4KSJSM81vOZu1kDU3WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fheHNqKF; arc=fail smtp.client-ip=52.101.84.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efPhDJTwKdRhkFBAaQx0swyz6/ub4rc7vgfa2YCOX3JKMNeMrgxqAHb0B6ayfI3S5ul4Pb8DmX6EhYMY/QTL/K+pwMnLCMBsUiQhY2v18b0A/FzK9WNirsRt1z9H4c5UCmQ5zN9m+RkGdJLVZMfBKvN36VG37Nez1H62bNvY+UopvlX6Ogke9/2d8X/nJV2Rmfk+Ix18pK+coGS1ovKXQ9mCsu9vbWn/f4qs0ZFqYReZqJqhirmNBbvGgbOcVrgkLU7eTj4l3ZBhWhj5H6ECBankTepoJW1plPPAnqJDFDiQG3ldHzSoXTVdh8DRQyJ4tyklRKGQz6eVkCMZnRRAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OWjbgaHdH7W8Z2MCl8Uw1NKbjXmldCvetbvlKOdrgA=;
 b=cZApAZGgJJ423xc+IMFHLbf6ZVKlJzu+h/ar3w/bqzLnEVYfLnyJFmaDZ/jTGiglzSNpPShTYFhh/CCt/HlSNTa0H2L9sdZcYPsAPp2SWo3C0wjJ9CSuqclDr0Yb5p005B1kD5yu5hTBahmpg1qsiaQy19J1FaJp1QzDWInx6zXxf5E4TN8phlJSYzLlp5bosKMphD77FgUgZ/vVyVR98/eF57MoReRhRIJYB8zAPVjQS6RlVyxxUZ4U0rJZiyd2GPP4/ytYVkOZrwm/Tst2yXBvU9rk+orJVd3ucWZLnRsMLiluiaa/ZFp5ofDPbJlW908+ba2dd/FWxN0mW6BKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OWjbgaHdH7W8Z2MCl8Uw1NKbjXmldCvetbvlKOdrgA=;
 b=fheHNqKFI1/ZHR+uy7dZWph1yOYxUVikzur8HsbuSapGpovmAEV/3utB90TEULoCCQTFOTcMiKvOBR7AsCUAiuLHDbdhXE41evtlJfIT+DuYTcXq8OnQWdNC0SorW7KcuGiF086Es037E71E8OrILP0G8KHWvK3xcFBBzg5shRcPsjs4MlNw7s6mRKX5vFLt3XYbX+to31n9b3UeNjb2Fus3HSBMDMHdzHy6n8hrbCNdfZRmUSXnUvJwhBTyLjssq96XHNkcHTA1m43kwPB3VKJVJcAVo/OKVWqU2voH6EdFypqrZ7CJGmY5vKViR8UKl0m+uVvXFnXy09oL9H5mDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB7533.eurprd04.prod.outlook.com (2603:10a6:102:f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 21:32:02 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 21:32:02 +0000
Date: Wed, 3 Dec 2025 16:31:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: nxp: use cleanup __free(fwnode_handle)
 simplify code
Message-ID: <aTCsS52Bbtld/vTk@lizhi-Precision-Tower-5810>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-4-6cd42872db79@nxp.com>
 <20251119042505.GO10711@pendragon.ideasonboard.com>
 <20251119050239.GA16725@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119050239.GA16725@pendragon.ideasonboard.com>
X-ClientProxiedBy: PH7PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:510:339::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB7533:EE_
X-MS-Office365-Filtering-Correlation-Id: cf43fc24-ca81-4a51-0b41-08de32b36619
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?9TCLzcA+uP9gCX3ItBs6VDzdLW+ktLrEpJoypAr4YJJKXJkCfAOzisNDCWtc?=
 =?us-ascii?Q?Dm9Yuru4IXhuC+ymWk/iqvL7UnXLRtHphO46D8oxFVJJhou93OF0AygMe+7b?=
 =?us-ascii?Q?v6sXrKYjxtw4VvIpKg5OfAOlUIx2sTLUcLCYsn17MQrbNnfZzgXwU2ZINidS?=
 =?us-ascii?Q?0NajaiWinnbNRMK6ZLVj1FIqCwoxS7o5wR601ISvfW79N+VHtcQi1teA1ngN?=
 =?us-ascii?Q?LIJ/HTJQRG0k8L/b9E51O3kakDDDirgggsy5Gf31ZqSm6+oUe4cjl/RlVkv1?=
 =?us-ascii?Q?MAr/KqMPUCvf3FSlaAIIG7focHvve7I+x+ITO21nEe4gOdeDw/GDDEzEOCsd?=
 =?us-ascii?Q?xNoiCVZKE97F+Zc+T8RRBohwIFobgckF7X2mMwRJn+1eBNii19iYR0adzXCN?=
 =?us-ascii?Q?JEwGoyJix1lHAYM5VCUnlCWBwtq9SX9QATxKnZ5m0gv77iEIsf2UgHaGXOQo?=
 =?us-ascii?Q?UCgVucwzTtH91nUueMDqLJdX9FMYQzGW8KTjjVdTpNEEo/UuShhUtQBxANZ/?=
 =?us-ascii?Q?d9m7XdwmueDrNSPpL2gDf+iXTmhVwjDQAxB+1jGeKAzKvqFg4Dpb5VbGJVcB?=
 =?us-ascii?Q?KRGfFFqmfu4ENo8PMWsyJV+DxhQr+GZSKWxe/L1VqpFFKbW7tGBB6L8fgZVd?=
 =?us-ascii?Q?LlLu+8Qz3vfPVWwFFAOwaYu9CFdJCBN4Bw/YQgXb+8RFO559naU9U9g6nfQV?=
 =?us-ascii?Q?HdneHbRYPb81U2anPIWJ5ULBfjMXMmvy+ZuhhTzN7AmUQ456uXQ1D7aSW9xp?=
 =?us-ascii?Q?2RSnnBMxtW7XNstPBcu4KEGNCIXvWdy/LngOjw3YtaGUVVgP2FRUw+9Huvb8?=
 =?us-ascii?Q?Aop2lsi7VFiOz0gzRVLZAlF3mJsT0H/WWGJYLmShNppEJFYyykI1bd36Oakd?=
 =?us-ascii?Q?vyFnF9vGsIG77qSD+gRN2TH6d9AUeJNtN6VhRHiBCAarfamf33SaXjKQTKjg?=
 =?us-ascii?Q?iP7Al/vZugAkpORxRrWCBAYMuj364GYe/PaJ9xZthu2WM0OXSdbOWyCRUxWq?=
 =?us-ascii?Q?fJ2MoueVfMAxSRhJYs0yok8qhpQOHn3v1faZngKY26SUv/oLpV1Q8a6VgG83?=
 =?us-ascii?Q?/m8Bhmu7yQeIQYCW4GLpkFQL8AbJrmUrMfpXmPhutAVD4Lxt5x15bOJLKtid?=
 =?us-ascii?Q?ogUXph0tUm5o7m7bAC3ljK17Z4C0x+4x3cxcNwcKzNdPnilvlbMfJ3Uwppnq?=
 =?us-ascii?Q?znASFIahXvgwKDlWIJNkbKE9UcBP92kxu4K8DvsIWmX68f+YwtpDIbo7TM9g?=
 =?us-ascii?Q?XlsSXfeDEpYB3GwOJ5b1zDl5GgwatjzmG6Qb9jnrE/J+yEBlCql0ZfwgXj0w?=
 =?us-ascii?Q?IoKVP/hiOLpW4zuqYGo9YIlYIUPkT0AwFwxRmaZBaJYtMOd0PYL/o+45GOUu?=
 =?us-ascii?Q?7z7Ep+Un/ewTo07qBe70YZVKTj1S7MQr+fLx6QbBwII9e7igBul6r10iVIYf?=
 =?us-ascii?Q?5Bcgz0imolVIYhAgke+njVBNYUXH7hL7QbTJ2TAhX5b5ZdIuRAOAssLfsKUg?=
 =?us-ascii?Q?S91CztNh+M/vPwRRilXDpwOmSp/x0c4Kjtpg?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?SAEP1DnfYrf9Mx4ZTvPeLg5lbLcNujADTkr8mzHyoyI1e9Pb0gqI5noL2sOO?=
 =?us-ascii?Q?lOygeRqV7taMAD+8K2ndIhEa2UCh+P8jIG5a0q3GLdEn6V4pXl+ecZ4+UvxM?=
 =?us-ascii?Q?xcrwWavr+ijTr3H6IAA/imdDYA8herc6DvzVmbWM2lapH6o7oq2oevXo4W9L?=
 =?us-ascii?Q?XZYElJGVT/pqVm9QyiTpMc/2DSktuGLFXXz8hrQwanf16Itw0qB76xXm14EJ?=
 =?us-ascii?Q?q+iDrkNaimYhavAzoAxt9Dg7iB+WUfxqRnYm/KNLGO4f0I3XTZbPtDelj1SL?=
 =?us-ascii?Q?XasekIrh1qSHHt8lSbfzbWv1kl9RBt9pYlxonOx9yhXb0AfbDnnVzoxTYeLl?=
 =?us-ascii?Q?ECbsDpB7VTMvTkGbtQjEiQZ2UIb4/OUnxYILwhfITUXzXOrAHF7OCwFfs93N?=
 =?us-ascii?Q?wHcAHyrYRC6DlCV8409plBv1L0IFfE7MQnHxvmJaxI7Qk/BhZSBJzwdfLiVQ?=
 =?us-ascii?Q?lrWQ2mmEMTJGWPoe+vOg8PmTOWExK/lPSjhrmW0lfzcHwKsa/jWxUbTRtRbB?=
 =?us-ascii?Q?kvnWChs4kJ1oI/ycp/7i0l5K54pTpQG59Y7DWyOQxfNmD7LFOgY+MNeg9O2s?=
 =?us-ascii?Q?3B9eKgI5t9i0EhqjaywAclmn6hxPO8ib7hxkkQya5ge5AjP6ef5epyEHkk+q?=
 =?us-ascii?Q?CJGmX2DgeSg8o3/nuuzUXDLM2hF/mBCEMbpbQPyhxeYv+9bhH98E/WcvlrGm?=
 =?us-ascii?Q?9pCalXjB2rPS9Fs3uT/PInk9QL90dmUUhwkAjvFj5FWAglplqL2X4TerF9IK?=
 =?us-ascii?Q?Ih9Jn07fyXsG7/9caXYkPwhINr6CyWHTYjRvCQFkVVOF1P+tnKI+elmOCdbu?=
 =?us-ascii?Q?XM/vxxR2eiEIhQpHnrOd+NTNB7BypWydJi925EzipTK2GgaqUrXFRSX/BYLe?=
 =?us-ascii?Q?8dWPrpCDgsrGag7RI5nMVwufbiWgu1Rdua1ZgcJl4J7sI+I0PloZK+jUyS02?=
 =?us-ascii?Q?XEiVdvrrrX6+Gz6EZBa0dSnznovMg7lGfDOU+KzbhGXZdWR4vTQpCMhTIbHK?=
 =?us-ascii?Q?YlZxjxw0CcAhTZmd8DvSxqQn11J2IcEH8zU/4CMMxWg3Y8jbaElwkCKjkp3e?=
 =?us-ascii?Q?PuRd9MlYUC1r2o7ilou3XFtKdPynvDfnLU0yI9RL8karo2zefAp8/Lvv1zXt?=
 =?us-ascii?Q?PBmNSIK1vTKdd4JEyJedT1K9/HKOynobkSm+rwn3GOWGZs3gj5ysLXcVIBGW?=
 =?us-ascii?Q?1Q8LVITxNEO7jghuIBmUhqGFn0pEBl2rfBzfZiAw2iPBuce5WFjCPGkO8CR5?=
 =?us-ascii?Q?zJK10BVg2fffOvOszudV/cq/wkYBBWcFQrHbfA/AAhS8E4R7mods+9xILQkp?=
 =?us-ascii?Q?HVtXjXZNKIbl1C9V9Zl4n0+h4NxrQYqVu+rJAafipOQ/XpunNwGOJGoDTRhp?=
 =?us-ascii?Q?n03wlcbkucijYF7YFNchOfre2KcYFdSeWiy/vs3xXBL3fJK6C0nPB24QDuXu?=
 =?us-ascii?Q?xFGxI2mCiz101eZ/QLPUFJ751l4yarNNxIeFzvjOm8iRXiofZzHw12r0i+Jx?=
 =?us-ascii?Q?kdvInNyFbDxuQ6gXQH3AO/V8rD4zuO6mSvJL3IeoaBeUCRN44d/LVMqdmPST?=
 =?us-ascii?Q?k1JqeD8sSTRF3nrbt5YDyIjXeuZIp3CbkrVBrNri?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf43fc24-ca81-4a51-0b41-08de32b36619
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 21:32:02.8109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nhwl8kRcLOm4FV07zZ7vT3+U0w3Awg1JJkbkkuSx39nK4EVRxaoWCrNuH0hvfioYumVlLeeat1LloZ9IqhPZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7533

On Wed, Nov 19, 2025 at 02:02:39PM +0900, Laurent Pinchart wrote:
> On Wed, Nov 19, 2025 at 01:25:29PM +0900, Laurent Pinchart wrote:
> > On Mon, Nov 17, 2025 at 01:58:14PM -0500, Frank Li wrote:
> > > Use cleanup __free(fwnode_handle) simplify code. Change to dev_err_probe()
> > > because replace goto with return.
> > >
> > > Add missed "\n" at error message.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/media/platform/nxp/imx-mipi-csis.c    | 31 +++++++++------------------
> > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 31 +++++++++------------------
> > >  2 files changed, 20 insertions(+), 42 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > index ce93d868746f002c22e2f86b1e0aa84ec1a76061..d924adb406a30797b66f0094ab17e98ad44fefac 100644
> > > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > > @@ -12,6 +12,7 @@
> > >   *
> > >   */
> > >
> > > +#include <linux/cleanup.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/debugfs.h>
> > >  #include <linux/delay.h>
> > > @@ -1349,28 +1350,25 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> > >  		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > >  	};
> > >  	struct v4l2_async_connection *asd;
> > uuu> -	struct fwnode_handle *ep;
> > >  	unsigned int i;
> > >  	int ret;
> > >
> > >  	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
> > >
> > > -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> > > -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> > > +	struct fwnode_handle *ep __free(fwnode_handle) =
> > > +		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> > > +						FWNODE_GRAPH_ENDPOINT_NEXT);
> >
> > Let's avoid mixing variable declarations and code, this is a style
> > change that is not widely accepted (yet). You can write
> >
> > 	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
> >  	struct v4l2_async_connection *asd;
> > 	unsigned int i;
> > 	int ret;
> >
> >   	v4l2_async_subdev_nf_init(&csis->notifier, &csis->sd);
> >
> > 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
> > 					     FWNODE_GRAPH_ENDPOINT_NEXT);
>
> Quite a coincidence, there's an ongoing mail thread on LKML about this
> topic:
>
> http://lore.kernel.org/r/CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com

Laurent:

	After read above thread and cleanup.h.

	Look like my method is prefered.

Frank

>
> > >  	if (!ep)
> > >  		return -ENOTCONN;
> > >
> > >  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > >  	if (ret)
> > > -		goto err_parse;
> > > +		return ret;
> > >
> > >  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> > > -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> > > -			dev_err(csis->dev,
> > > -				"data lanes reordering is not supported");
> > > -			ret = -EINVAL;
> > > -			goto err_parse;
> > > -		}
> > > +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> > > +			return dev_err_probe(csis->dev, -EINVAL,
> > > +					     "data lanes reordering is not supported\n");
> >
> > To switch to dev_err_probe(), we should drop the error message in the
> > probe() function when mipi_csis_async_register() fails, and make sure
> > every error path in this function prints a message. I'd prefer splitting
> > that to a separate patch.
> >
> > >  	}
> > >
> > >  	csis->bus = vep.bus.mipi_csi2;
> > > @@ -1381,12 +1379,8 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> > >
> > >  	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
> > >  					      struct v4l2_async_connection);
> > > -	if (IS_ERR(asd)) {
> > > -		ret = PTR_ERR(asd);
> > > -		goto err_parse;
> > > -	}
> > > -
> > > -	fwnode_handle_put(ep);
> > > +	if (IS_ERR(asd))
> > > +		return PTR_ERR(asd);
> > >
> > >  	csis->notifier.ops = &mipi_csis_notify_ops;
> > >
> > > @@ -1395,11 +1389,6 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
> > >  		return ret;
> > >
> > >  	return v4l2_async_register_subdev(&csis->sd);
> > > -
> > > -err_parse:
> > > -	fwnode_handle_put(ep);
> > > -
> > > -	return ret;
> > >  }
> > >
> > >  /* -----------------------------------------------------------------------------
> > > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > index 75709161fb26a61239b94430365849e022fdc14f..94882568405db55593c5c51722db2233a64d53e4 100644
> > > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > > @@ -6,6 +6,7 @@
> > >   */
> > >
> > >  #include <linux/bitfield.h>
> > > +#include <linux/cleanup.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/clk-provider.h>
> > >  #include <linux/delay.h>
> > > @@ -717,28 +718,25 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> > >  		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > >  	};
> > >  	struct v4l2_async_connection *asd;
> > > -	struct fwnode_handle *ep;
> > >  	unsigned int i;
> > >  	int ret;
> > >
> > >  	v4l2_async_subdev_nf_init(&state->notifier, &state->sd);
> > >
> > > -	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> > > -					     FWNODE_GRAPH_ENDPOINT_NEXT);
> > > +	struct fwnode_handle *ep __free(fwnode_handle) =
> > > +		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
> > > +						FWNODE_GRAPH_ENDPOINT_NEXT);
> >
> > Same comment as above.
> >
> > >  	if (!ep)
> > >  		return -ENOTCONN;
> > >
> > >  	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > >  	if (ret)
> > > -		goto err_parse;
> > > +		return ret;
> > >
> > >  	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> > > -		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
> > > -			dev_err(state->dev,
> > > -				"data lanes reordering is not supported");
> > > -			ret = -EINVAL;
> > > -			goto err_parse;
> > > -		}
> > > +		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
> > > +			return dev_err_probe(state->dev, -EINVAL,
> > > +					     "data lanes reordering is not supported\n");
> >
> > And here too.
> >
> > Usage of __free(fwnode_handle) looks good, it just needs to be split to
> > a patch of its own.
> >
> > >  	}
> > >
> > >  	state->bus = vep.bus.mipi_csi2;
> > > @@ -749,12 +747,8 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> > >
> > >  	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
> > >  					      struct v4l2_async_connection);
> > > -	if (IS_ERR(asd)) {
> > > -		ret = PTR_ERR(asd);
> > > -		goto err_parse;
> > > -	}
> > > -
> > > -	fwnode_handle_put(ep);
> > > +	if (IS_ERR(asd))
> > > +		return PTR_ERR(asd);
> > >
> > >  	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
> > >
> > > @@ -763,11 +757,6 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
> > >  		return ret;
> > >
> > >  	return v4l2_async_register_subdev(&state->sd);
> > > -
> > > -err_parse:
> > > -	fwnode_handle_put(ep);
> > > -
> > > -	return ret;
> > >  }
> > >
> > >  /* -----------------------------------------------------------------------------
>
> --
> Regards,
>
> Laurent Pinchart

