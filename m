Return-Path: <linux-media+bounces-29161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30452A77DF8
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CED711670B0
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2C7204C15;
	Tue,  1 Apr 2025 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cBo6sjE7"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2054.outbound.protection.outlook.com [40.107.104.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F51C7006;
	Tue,  1 Apr 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518290; cv=fail; b=S951JU7hNzV2Ed53C8rhbuggRXmAISSmDAZOuby0/CO/Sd6C7ffJAmBDK4smcNjx7keR+G4kipa1DWQMVP7K/MVnkcc5VZImKoCca57c/D39goQuo3L6+GV2uKBZD3ipEApi1eykSRXfvQ9zwNxane3pL8KTtphPdxWL+iEALYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518290; c=relaxed/simple;
	bh=YFyzd5G0deVwXGp7X7/H3ogfHXLaWUGzX6Rx1Zqkd2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SvvNdlK+iybGiA8LwyAaO7m38rg8HOr+BqwNWA9DanwoeUTtBUBnFRp2zU04uwtkMc6skvh48PUEqnKCH1q+2/0uqPttDAWBMxwrbNtnLYeL/yIccsb54TcYhAhQ2h4WtmDUcPxAMFxLzH/9igqHIN6OtkxyVZzaX3IXHRE1teo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cBo6sjE7; arc=fail smtp.client-ip=40.107.104.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NphyputStKp1FYmIAxgZ4lvJDDIhMIpzY3SrEzeK2ie43buTe3nJFhdT1/pIGd3mfI6qpnwO9rw5fKnPTzhtgLm1dkN1dK6ZfEhYDttWMD5c8wwuoiL4SbLMthOvdBXhv8Kms5KolAkgsomKqklJtVfqvhvHemztKYDdMaTGfdsWC0aJsviaTuLptzPJSDcRgbuS8ZBTHDPdFD9Is5eL5xANX9taKKMDG9w84ERu7hZHoNOQlcaPehyZWx4qrb7wxmRYnNOZYLEdh2KwOGW8i5ZYO8KQ7NO9PAfz/VBzxEyFP2f57T8XJ0I9CxT7+Sc8FLj2mtExrjVt06PKK1LyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGDz47CnKbQFJVmyszCG0gihemcCXvFjUvp404BXCaM=;
 b=EpN49Y+NhoiG2gPfRqj1WMT99nZzhNjAaUuVjhco0ppcXudfYIXB7/Vlu2gr6wr3BC5HOfMaTEJUxOZdLmeQiXknRLshBPdobTPsP6amkkbXjfO7xYqT5ZpFFYORGcSHx6OTGijEUOGlXFiT2LHevQkrRSLsQ2i6/q5Qd5V9LAMFphFg74WnMA8YhsjNTA6AebMc83iVACCjRV9KeVhKwKe9AhtRknnJs4Cisz5dpEfjeoXRXRZ5Blp/WJdrk0EUq6ESpWHqbvXwkMrf4gO01BSro80YHAe4yW/U0LuKgorNSIu4gY/zcJ0Timhn6hCpZQfn+GtEggu7omIhR9GyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGDz47CnKbQFJVmyszCG0gihemcCXvFjUvp404BXCaM=;
 b=cBo6sjE7R0caBvH1WxhnL2Mh8lv5f4iSq6WczZZ6FbqIwEEfQzjxds0U0JM0aGhWfWlz/FOeb8W9d4gokoJ9i046dxolce0ynXj3sVtWrxnApJYjvmaI3r7slZAvNC7rqnQrQB/4GNTT8HVdovwYXcsgjuB5EWLde/TyPboEYQO1Ijuuznzia6VbfaojmV+ZtXR6S9eSzjuaYHhRmFJpxXFvXxLhOXN2v5JSk00XwewSNBPQCSRSDmOZc5C7wERhqeq73mtKQBUq89bPz80dq01jkHLz6x4eeIsYSEIiZK6M9Ebie4uGOKVSuph0VitsXVOQxlsNeh3y1ftp6h3YKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB7190.eurprd04.prod.outlook.com (2603:10a6:20b:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 14:38:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:38:05 +0000
Date: Tue, 1 Apr 2025 10:37:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	xiahong.bao@nxp.com, eagle.zhou@nxp.com, linux-imx@nxp.com,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] media: imx-jpeg: Check decoding is ongoing for
 motion-jpeg
Message-ID: <Z+v6Q1TRpJUkF2oh@lizhi-Precision-Tower-5810>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
 <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
 <99aa5db6-eb75-4fcf-ada7-cc6d519a40cc@oss.nxp.com>
 <Z+qnln8qbHCYVH+e@lizhi-Precision-Tower-5810>
 <22fd3087-6832-4b61-8c78-bc8dd3ac808b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22fd3087-6832-4b61-8c78-bc8dd3ac808b@oss.nxp.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: e54c724c-fe56-4c93-cba8-08dd712acff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oFf7HqTGbK5MW1pAyhPCqSpUBWDjVqnBhI1cPObUPzzwd6j/e+zFFy9+KBOz?=
 =?us-ascii?Q?xfGuTZJqbOWoZDpxklC3J8QHYMl4H2U6jVoyAWoZHr02XF+bOvBvAM9azAOH?=
 =?us-ascii?Q?9VtvKkJknzMKmnTbW//3j8omVUbIUwZPMzb9pKEIumpAWF8CGJ4CayckBTaR?=
 =?us-ascii?Q?NBv27xgHTGu7+wht07vfyKXm5lTdBR4wNixmQjKPMuRH1v+7gvAP+z6Zu35X?=
 =?us-ascii?Q?NvpvlyzE8bVvYoMi2A++zZIyV57FFKi8Ywp2KrV9MCMh0Ttkd8FJ3QhtQXKE?=
 =?us-ascii?Q?8aZ++jN7GnQZRGIO6teV/jbAReawnNPE76kPtv98dMVwaWNELQlNmr4sqQTl?=
 =?us-ascii?Q?e3AdlbcCi6qmY0XF3xhJdjLGl2uK1snyCYVYFR1BtJveugq+0bC0WAowotXD?=
 =?us-ascii?Q?KMR6RZWNDpOOC2Z4cQyKYY/u/PyiBNI7YbDz1CK74hd0gNg9O/p6Dn+w5+/s?=
 =?us-ascii?Q?Tvz30rm8swYKqvCU/xttErFiCEk3hqf6WRdp/eCVIopZYwcCt5mdTn4mTtHB?=
 =?us-ascii?Q?YcdoQM8Qu/Eosjfr/w/Ut4WngFKVm2aS1gQ8IYx8Y/KW26HP0+gyDuuhWdkQ?=
 =?us-ascii?Q?i0aEF5p4S0yK3GjZ3fXZ9ucZar2cBfO2SQIPYX04CWvJHGgGcwAGc2q9gnsD?=
 =?us-ascii?Q?Yl98M8/p66A1twsIACCnROaCmUQimfRnOJ87wDgoFlsAVBcFIyIOP/GHH1QS?=
 =?us-ascii?Q?Nh19xnB6K+cI9Tsv4uhfzFrWylEwgte9VRFs/fQwcSrxxNh2CaqZFgDEzmbF?=
 =?us-ascii?Q?v/HIHjhFBue50qNKNCIiW5kxPtXdAQcGoX9XFmGFNpsyZ5XkXFG08V9FPm45?=
 =?us-ascii?Q?uiDYebOdAIRMEf/WPePZsoxg48YC1PqqmLpje19YAO7E20olXsB0esghch8r?=
 =?us-ascii?Q?mv9U7V9wTzZNlNiPAQhlz+2fi7pNi2criPaQyeymh/ZsMwD6W2z03u+YdmsC?=
 =?us-ascii?Q?MguUww7OrJJk9fNEDpAbVErCopZQ2iCeSzHQ44hQW5G0j/UrjLWF7mF7PaaP?=
 =?us-ascii?Q?ourdc5JqqZE9ihdH49qe0uGiDCinuftMwKUIrs3RcqTr0QAbdN2oyYjP6w8n?=
 =?us-ascii?Q?M/jv4EXazDbh1H6WBvGKggXMnnfQ0lmoT+k0YXqEtUdPViP1d3JrbTdzfoXO?=
 =?us-ascii?Q?xvFjzWfR2mSjVS75sCFSRJWp0mMDi4CZoc690P1EGpSgA5q13snDjP8cu88f?=
 =?us-ascii?Q?X9iZeZJexw1VIs459RGfc18Hqigrmfr6wWU1yKCGv3fzZ39rtpFUGLWtf2yj?=
 =?us-ascii?Q?N8R8wmyM9KwLVMmFA6uZRUKOq772TpXHhzEgaf35VKLiKfSGFTJXlVgpraMr?=
 =?us-ascii?Q?4amkdsROQktpqzwvwjS0CK+2X8L4knS+sgGU9vH59g9wzVQcYJJO7kS7w2VE?=
 =?us-ascii?Q?5cHtd91WM/NvfSywENiB7CZYyWd0K0WOsQBjtpn4w64YZM15XQWW5LXSb8tO?=
 =?us-ascii?Q?3Rq0o0lfjxK/FgXlK3AwtIGkPiG8uOQv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jHdGbNtvAWvyxNMoMm1vBZis5N8NbqESZaxXW0fpAo6SRNowgX10S49qGhYe?=
 =?us-ascii?Q?gHSPjftqV0Hb5VVjwVzUO1+uVyoJvTzEFKTmfKrN7golpAEYXDNh5/V8YMyL?=
 =?us-ascii?Q?JyCAkJfQCbjmxu+KiJiN6ooDrphh+Cy8C8LbejUsTx0R/026Y5+3DfgfmfYE?=
 =?us-ascii?Q?aIAj+vRPJhbisvvrAFrRcpfE3vm8dob5hi9Ej+muNFDBOLowSEWgtG1apJto?=
 =?us-ascii?Q?2VzTWHqg42z46HfblWZwbmqUbFgipMtN5B0H/eRUgtW4XiAdenaVsFk4lByl?=
 =?us-ascii?Q?yQU2PqKhEqPcka0vowz6fWF+7eKP7ZoMGVSLJLM2SEdead/UQkSxH4lQnJM0?=
 =?us-ascii?Q?gxD66X8HIGIZWPNpmzmSVOHw6yQNmpJPs66B5970XJwJocWnKkaJNWGbT5Mf?=
 =?us-ascii?Q?rvGJGmOqS/bKbJBZYj6Wtpe8rSxTu+Xulr37hpda2rHbSQNdJlDOdKYfZEbG?=
 =?us-ascii?Q?k4ev4P9n5RLjhwYNrC/dSLGiAGzehS5DJrNasOW0IWoKMj9f2DgRWJjjsXR1?=
 =?us-ascii?Q?Yc3p3EECKjzubv+1TWF26rqlc/45y/ZHE9EtK7vJtDRygkyDRapURxpsHoM4?=
 =?us-ascii?Q?WkQdpnyxnclyFAqWid8fbxWYFleITo79PiDbHQRGfFjuiqO+Dhh6ZhTpoyD8?=
 =?us-ascii?Q?mtdiF01iTeeCdYQewCmxopZSTiZQnbhX133iCHfxel8eZT7Ymsd5J7GHXHxv?=
 =?us-ascii?Q?VIVP4PodH/yhQAd4piW2H5NCZ1N14ZQqIloxShuncbaAwD0XYZltbo6zQfqv?=
 =?us-ascii?Q?fSmNnQDXqKyLnFjRvGJoIhdHh/j84MZzLOT6yePCKpPxUiKkSE86v0weRNxq?=
 =?us-ascii?Q?DXroJMToADiAXPWEhnjygza/d//UmU1rsgzTCu3s6cJ+Fq3txycE5t/N0ov9?=
 =?us-ascii?Q?Vlnm749sHcZBdis59V4E4y5BUtwHUAltCJmE2wZ22TB+INazf1y6TjALNXwk?=
 =?us-ascii?Q?A5ww9U+WcvFmfsEDK3Q0edKLSLyBKSZeLCp3mmRYDqWH2+3O7PigIc/XhIh9?=
 =?us-ascii?Q?UilfbbfX0d/iwoLJTdhsAvbDC1LVdDE5iBXcD2xVOCGfWV+Xh7eVjVenLsjG?=
 =?us-ascii?Q?u/iYKdD/o/Zit8o/Hv/pB8rTWR4DpVbtPQP/qqC0Ag0cfFMGrQqFkk3gtF1z?=
 =?us-ascii?Q?qnppSifxh+3ZHh1y6O4JefEEPB6RW/UreIuOw1h/0rwQK3mvEGfQrwqyluq1?=
 =?us-ascii?Q?tW2+T5NJaYM1ceQp/3W8aRpmzxsfq15Azr8tgGc82ItJkYOU19+S+IuLNDqk?=
 =?us-ascii?Q?m1Szdmm053HGu9/+mdepzLhbQEOw4S2ZiBc8RVCsjco9zS+FD9hlF6K42dyY?=
 =?us-ascii?Q?eT/7eI3LWZBRBaCgi9fs8zfhCNT30IvxN2/do4KOBJ+LHX6oksjIjCY5OtSg?=
 =?us-ascii?Q?gFZS822rIXYZEGVcO8t9BYKUXZ+VlRK1cAtzZwW++zJ1A4BetqHbJqKcTseK?=
 =?us-ascii?Q?Gb/kgk6bMcLEkw4ITe/c6kn97S+pOcldvxJkwQXtJWWJAXVep8y3SkAkLQL2?=
 =?us-ascii?Q?/tmqQ/Oc1SLRbNMGipbvfRJFrAzP2aw1noIoPIXu7uX13C68m1efsr4nEZJM?=
 =?us-ascii?Q?XPeym6p4lhlxo6uqAm4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54c724c-fe56-4c93-cba8-08dd712acff2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:38:05.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZjJDUcbFIw0v5fxtyVUkOWiqGZ5jDmeClagu99WrMySfFZ3axhIy/K4VW27GU0Uevyzf4ZRYqiYAYZkG9GczA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7190

On Tue, Apr 01, 2025 at 11:17:36AM +0800, Ming Qian(OSS) wrote:
>
> Hi Frank,
>
> On 2025/3/31 22:32, Frank Li wrote:
> > On Mon, Mar 31, 2025 at 11:10:20AM +0800, Ming Qian(OSS) wrote:
> > >
> > > Hi Frank,
> > >
> > > On 2025/3/28 22:45, Frank Li wrote:
> > > > On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
> > > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > > >
> > > > > To support decoding motion-jpeg without DHT, driver will try to decode a
> > > > > pattern jpeg before actual jpeg frame by use of linked descriptors
> > > > > (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> > > > > used for decoding the motion-jpeg.
> > > > >
> > > > > In other words, 2 frame done interrupts will be triggered, driver will
> > > > > ignore the first interrupt,
> > > >
> > > > Does any field in linked descriptors to control if issue irq? Generally
> > > > you needn't enable first descriptors's irq and only enable second one.
> > > >
> > >
> > > Unfortunately, we cannot configure interrupts for each descriptor.
> > > So we can't only enable the second irq.
> > >
> > >
> > > > > and wait for the second interrupt.
> > > > > If the resolution is small, and the 2 interrupts may be too close,
> > > >
> > > > It also possible two irqs combine to 1 irqs. If I understand correct, your
> > > > irq handle only handle one descriptors per irq.
> > > >
> > > > Another words,
> > > >
> > > > If second irq already happen just before 1,
> > > >
> > > > 1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
> > > > 2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
> > > >
> > > > Does your driver wait forever because no second irq happen?
> > > >
> > > > Frank
> > >
> > > Before this patch, the answer is yes, the driver will wait 2 seconds
> > > until timeout.
> > > In fact, this is the problem that this patch wants to avoid.
> > > Now I think there are 3 cases for motion-jpeg decoding:
> > > 1. The second irq happens before the first irq status check, the on-going
> > > check
> > > help to hanle this case.
> > > 2. The second irq happens after the first irq status check, but before
> > > on-going check, this on-going check can help handle it, fisnish the
> > > current decoding and reset the jpeg decoder.
> > > 3. The second irq happens after the on-going check, this is the normal
> > > process before. No additional processing required.
> >
> > Okay, not sure if hardware provide current_descript position. Generally
> > descriptor queue irq handle is like
> >
> > cur = queue_header;
> > while(cur != read_hardware_currunt_pos())
> > {
> > 	handle(cur);
> > 	cur = cur->next;
> > 	queue_header = cur;
> > }
> >
> > with above logic, even you queue new request during irq handler, it should
> > work correctly.
> >
> > But it is depend on if hardware can indicate current working queue
> > position, some time, hardware stop last queue posistion when handle last
> > one.
> >
> > Frank
> >
>
> I think it doesn't matter, the 2 descriptors are the cfg descriptor and
> then the image descriptor.
> If the current descriptor register remains the last image descriptor,
> the ongoing check works.
>
> And I guess your concern is as below.
> If the current descriptor register is still the cfg descriptor, but the
> hardware has finished decoding the next image descriptor.
>
> I confirmed with our hardware engineer. This can't happen.
> The first cfg decriptor has a next_descpt_ptr that is pointing to the
> image descriptor, when the hardware read tne next_descpt_ptr, the
> current descriptor register is updated, before the actual decoding.

Maybe off topic,

CFG->next = Image

Image->next = NULL;

If hardware finish image descriptior, current descriptor is 'Image' or 'NULL'

If it is 'Image', need extra status bit show 'done'

1:	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));

I suppose it should be DONE status if just finish CFG description.

2: 	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));

It is possible curr_desc already was 'Image' after 1.

 if (curr_desc == jpeg->slot_data.cfg_desc_handle)  //not hit this
        return true;

 if (slot_status & SLOT_STATUS_ONGOING)  // not hit this
        return true;

fake false may return.

check two aync condition "slot_status" and "curr_desc" always be risk. But
I don't know what's happen if fake false return here.

for this type check
	do {
		slot_status = readl();
		curr_desc = readl();
	} while (slot_status != read());

to make sure slot_status and cur_desc indicate the hardware status
correctly.

Frank
>
> Thanks,
> Ming
>
> > >
> > > Thanks,
> > > Ming
> > >
> > > > >
> > > > > when driver is handling the first interrupt, two frames are done, then
> > > > > driver will fail to wait for the second interrupt.
> > > > >
> > > > > In such case, driver can check whether the decoding is still ongoing,
> > > > > if not, just done the current decoding.
> > > > >
> > > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > > ---
> > > > >    .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
> > > > >    .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
> > > > >    2 files changed, 20 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > > > index d579c804b047..adb93e977be9 100644
> > > > > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > > > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > > > @@ -89,6 +89,7 @@
> > > > >    /* SLOT_STATUS fields for slots 0..3 */
> > > > >    #define SLOT_STATUS_FRMDONE			(0x1 << 3)
> > > > >    #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> > > > > +#define SLOT_STATUS_ONGOING			(0x1 << 31)
> > > > >
> > > > >    /* SLOT_IRQ_EN fields TBD */
> > > > >
> > > > > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > > > index 45705c606769..e6bb45633a19 100644
> > > > > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > > > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > > > @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
> > > > >    	return size;
> > > > >    }
> > > > >
> > > > > +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
> > > > > +{
> > > > > +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> > > > > +	u32 curr_desc;
> > > > > +	u32 slot_status;
> > > > > +
> > > > > +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> > > > > +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> > > > > +
> > > > > +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
> > > > > +		return true;
> > > > > +	if (slot_status & SLOT_STATUS_ONGOING)
> > > > > +		return true;
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > > +
> > > > >    static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> > > > >    {
> > > > >    	struct mxc_jpeg_dev *jpeg = priv;
> > > > > @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> > > > >    		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
> > > > >    		goto job_unlock;
> > > > >    	}
> > > > > -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> > > > > +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> > > > > +	    mxc_dec_is_ongoing(ctx)) {
> > > > >    		jpeg_src_buf->dht_needed = false;
> > > > >    		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
> > > > >    		goto job_unlock;
> > > > > --
> > > > > 2.43.0-rc1
> > > > >

