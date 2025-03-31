Return-Path: <linux-media+bounces-29061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A5A7680F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83D6B3AB967
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6888C21481E;
	Mon, 31 Mar 2025 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e8R2MuK7"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013022.outbound.protection.outlook.com [52.101.67.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88FB214222;
	Mon, 31 Mar 2025 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431586; cv=fail; b=YDFZONuhX2zowunaqAE0j4qyKqJ7TWGCD6hSliljxtIfUj2fMfMYZFPtegZDZeOAFQMRhVx/cvAOhNB9kHdky8iukKuC8sH6TXcVH/pzJekwfv/SJXXpC5up0s0CrivBDUKBaklQk+9twH+WqaxjXzwfCrJ0a6FoRuUCK9dLm8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431586; c=relaxed/simple;
	bh=a1YWlM8bza+/vAkGUsHw3rVgX3qyNkiry1JQgHkYyiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EWu67A0tQLWYvr61J+1IXjWJTHV4mKPhzHEIBB6+8fdubhAQTdqAv7n+A0L2x+OV010K5ZEvWMbSJxyTdOPR0Opkfq5c7GJWSOGVkgd4xDjaHYxvIJs6QZqAy9EBfGkRDXF3dQYCGQaUE+SKvnfLXpRcoOBtcrP3hE+bDJBBs+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e8R2MuK7; arc=fail smtp.client-ip=52.101.67.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qG1OpeUq0ycEtZGswNVtGH/C7HDnx91x2YkG3t9Ierpnn4a76bSpeMBLXgxknWX0kgUjzFaj1fVRJDB1J2L8jVITGa5LMa45tw3x5mkjhKMHYi7c0pIPw/rF23MlQ6TQ6GxJ9zAze51E7EApo6vYfC7tBLDbZYf95zT9K+oZci+VnBrkDmX8ih7z1R13YiKSZ3vXfuIvLSh6eHCsuNEcKUIVG2YC173xyCWTj+yz5amCC9Q7me+pH3We67XSwQeJcMki/7TCusZuzVKbT5BYOryCIsaZyK1udJoHYKMMoX7nEwJsHmc1kLFJ+c9hTT28lx+Ge9OT+HwFC/tDwWcwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcta9tAjSztKIIducP7tOljskea0zsu3PgRDSXrIqbU=;
 b=sU3Gy5jAjQUhFkhCG90iDECkh8n2aYrwDU9K1iXHLVKe1oD4izK+hFchZNVug0fXQSQo4w+X+llr1yqDHeXLUtYYXPLMcU3pQDcLnHD19PjZQhwU2/r5Lo9snnRWxOkZ8U3aqn9qvheae4tWW7hVnXoapc857tnsPkMKvwIDzMj2ztzx0M2K0iBtvKwKM4H+IS8COo2vMrv2UD2KsMQYDWYdovsVBtGdThr4gJNFEgn/kehaUlXWREnys2Swc2FNxdRadt74x8KStoQ0uVDLQmql+nYECPqa/AdBZyfVQfgRRbwEmSQbeJGlgsfRtvn0pTlZTAiyB2AtWImA7t2ukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcta9tAjSztKIIducP7tOljskea0zsu3PgRDSXrIqbU=;
 b=e8R2MuK7HYLb5zM90C+Vb8HFHcqzsmNjMpr5FH+Xd425FadYTe4OsXyyjBSGt9YdCLK+jGA7i6CUbWeeHYQrvzweM5/fEU1SZF9Ang8am2kzP5sDBWf029PnO1fkZnOHLriiLncuX3uhwatVULfs+m/5pBJcyK2iO4vY1NmzO+TGxwkrN3DWwGUQ1hqvpiX8zc+OyMH0MG1r17kD0bK3IlJnPQS3nXdO+WosSzLfpFkO1Ts+8pk3ik8QnsVQLqEM00j/XAVt9mxinGrEMYgHUVKZyQ4KYIIU8oW3fN9XKWGRvpQ1nmO9qzyDBU5zagk0sKH7rNz8hHMxNyom/7HwZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10597.eurprd04.prod.outlook.com (2603:10a6:10:581::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:33:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 14:33:01 +0000
Date: Mon, 31 Mar 2025 10:32:54 -0400
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
Message-ID: <Z+qnln8qbHCYVH+e@lizhi-Precision-Tower-5810>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-4-ming.qian@oss.nxp.com>
 <Z+a2G5We38cQw3UD@lizhi-Precision-Tower-5810>
 <99aa5db6-eb75-4fcf-ada7-cc6d519a40cc@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99aa5db6-eb75-4fcf-ada7-cc6d519a40cc@oss.nxp.com>
X-ClientProxiedBy: PH0PR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:510:f::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10597:EE_
X-MS-Office365-Filtering-Correlation-Id: 951ae4cd-64de-42e3-da88-08dd7060f0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zpXr3EVxQZGXlyoCuxhHOZ5epJMSYKIpM12OBHrc0ZGmqPCPan9S4tsIyLHi?=
 =?us-ascii?Q?tfcSEo0pAXEpbCFg+EcM//6x6kgNaFZTRnMBoxVGj/Wj7I9p7K05/7vyufQ/?=
 =?us-ascii?Q?8gymBk4lvYAqZZNAIsl7gSTAixLJE66cIR+5gWHE/UZ9gxICQU65wW4DXqdF?=
 =?us-ascii?Q?k0H8P/x/CmmOXsApSyGrEtLbduqUOqqLjv8/7UnFi4nkOyqgzwk7LsDwdZDX?=
 =?us-ascii?Q?TierYCf5STyF0vKoC2cs1b5l6x70eNg5WpattEFxlSdF5xsR4PlL6VaADTiM?=
 =?us-ascii?Q?tfKbsmkuPkG9ifD+0RqaVYVZpFKpNjfeWjpc4+PVnaN/JdvYoTAuru/qNP86?=
 =?us-ascii?Q?uquDQMl8iqvAETKhFonfL3vuPE8538dAwCH5tZae+yvL2UEJeBaaKfJdMHcP?=
 =?us-ascii?Q?TnTZrO3a2cCYMesQFB7ODf/awWvosN+H3RmtmmNJTB9Xfy97e3V6vSKvQzhv?=
 =?us-ascii?Q?rXrf6NM0+rv4qc5ZWaaL378DuuEtKHZLlrqy0qL1+r0U6SDgb9im/S4D1MEP?=
 =?us-ascii?Q?FaFjT1nwy/lnSyMtfKiZjEP3tOwuwSXc5qFyZRUDX+pG4YZWZtYIPmA66Rjd?=
 =?us-ascii?Q?JikErmuMe8Ta+JRlJZI4fCkutUKmOmk55vpeAzs9r4l1PmYPAfKef511RKkP?=
 =?us-ascii?Q?+22tuejojJtrOdXvFzPkMLelAvofdbXw8esMRmWdJtRgR7aelBxK4NPQfx8T?=
 =?us-ascii?Q?I6if8Oskwh0CCNWvMbmK0f6DzGtV0al+pzgpP1p5Cfx/lb9WU2SYRsCH76G3?=
 =?us-ascii?Q?v1lDnU1J638qbR5HWZuyWLIsYKxXbJsr6ath7DvJyyUBXs03w2EABleJNLFy?=
 =?us-ascii?Q?Q1uwjstaUE/8VUwR1PC/Bry204yROxDaRW0U1H6+Cvgkqg1ILy62MzJmO51J?=
 =?us-ascii?Q?LqwR4WfGPHIDrdDPiw/K8k+hp7Q/E9VhfuhJdxz/x+gxMFLnf3P5UCQF1dir?=
 =?us-ascii?Q?Fo86pFC9qeHiPhDqIBQvxFirHTS6cWpoR8phvMhoikpeJtLCbM/Mehu/nz57?=
 =?us-ascii?Q?5RW+O9RVw/7i01R52RjPt8lDiZyIm0L64GZjeA7t0aIgUrkw6iqSXb5qbH+1?=
 =?us-ascii?Q?18ToSAh6SWQK3IKCaxqXF3hP+nsJdk6Pm+OgBAijhCXeM7xTm9MKvqYj5GgT?=
 =?us-ascii?Q?RxbKwFk1i89JcE7H6L3Z+3E1TOi2Y4V6XZepg/geID+JNAze1eBr3YeT4VUM?=
 =?us-ascii?Q?SaK1UELDXLLa0KAXoCblJKRKaupnheRiX0H+d7zlC8B7bmwZmnSBMdHskFc7?=
 =?us-ascii?Q?NRr+E+qDFJxznD5CBRsnQcIhSxGYe+eoFa8iJ8dWjOPVn8I6qknIbgBY4dm7?=
 =?us-ascii?Q?VgnKmqxenv3kkZQhceQsMRQAfsKlATR1Kn967bESyv3SHv4i7MtdGWi1Nh73?=
 =?us-ascii?Q?/B+QK7OvFgpFo5KYmZOyyfC05LoTA7VQfPp9GaLXc9xGXm4J6go5DN13iGi7?=
 =?us-ascii?Q?AKhMJQdf2YPNOCY8WrEWixwTWWLMDlH7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w4hI3cx4+D28/cwcX9C7LqFfz5IK02FwxgqkYP/Hzb4+MB03SReXRoIydbhs?=
 =?us-ascii?Q?D/8R/Hy9hdyeDb+K9laJ7+bBd7FJ1rlPCLQr8NXOUjD3K6BbBU6/3nXYkBcZ?=
 =?us-ascii?Q?g5NQ/GsbvOjY2LwrdX5c8NMncgSQnKHJ/gdthkRxH5+vTwXGbSdvFYsQegGP?=
 =?us-ascii?Q?whbtfS/ZNpCFLOSkCOc50T/YjF1laM/EdOAqNjUjICWUe4KzmcByuP23oYvN?=
 =?us-ascii?Q?47Lh8URPngOSy/bs12ABIMxzMZJBIglM4z41zeAmoI2WyNRiwLDGSjFjHfgQ?=
 =?us-ascii?Q?5yTudeq/cpRFCb3PauiDI/Ax8j68XFHlkglLJ8KxqssDcQHwS7MHSufTrz50?=
 =?us-ascii?Q?l7g4LvooSCZZoBBWxs/oxSGpi7kcgLZLpHRsnvhUmoLCqxicEbiOtDrmQK0w?=
 =?us-ascii?Q?7u8pDeQRyaR5PcmIUTgnsFn4q5EYWR4T8UbYkuknee6I2QPRacYYiLAXuWIl?=
 =?us-ascii?Q?T5OPTXjHh8bHCpwTCrFwgCcguPMR8FvpJ/Hsr1uKDxdDONFrE2IDKT7iaPOm?=
 =?us-ascii?Q?Ip8loJpplEr21uDW6MDVyEJxK5PF74eYusGR7ORg3JupeVbGkXxStE7qCiJN?=
 =?us-ascii?Q?C72YAQxnwyf5+HwHEw+k3IAC+fvTqPCGqDbRv+SdROjayVB/CRL6rWLBa0Vw?=
 =?us-ascii?Q?sY4nZpVkZYV3/705OEZnG7WwGm4IxSeTJECtrasvNjB+MT1pYBrJ6Sdt8U/y?=
 =?us-ascii?Q?Er371N4OeTXZz0Ma7DgP95OABhOIKOOoJwmsjYfgax9T7PR/4GkqKtrKLYZq?=
 =?us-ascii?Q?dMpMKRM9Z2qoBNsbvNdjmDPwtV7xFA/f+BRVLahKi5r6ToTewSQyJbWU5zzO?=
 =?us-ascii?Q?ePnSj/5pmw5ge8FF8lqs9mhwKS//1uapKjbJFAgjjgop+GyEHWYjyWZxA9cv?=
 =?us-ascii?Q?faR85jc7mROrIKIFytfuqRw0hqu4HeQYqCcSefqmavJwj3Z0N2m4rpz2O9/E?=
 =?us-ascii?Q?RUM1w0A64Qddb6gBbpoKIYl++6oQ3UaR4mpUh5y6/mmF6FozOif/nJL1QCsL?=
 =?us-ascii?Q?2XtZucFnBRQtKZhaHaXDw/a9ueP4BKn9qMmvXRSaN3ZlDuTzrZnmPgYCtWe0?=
 =?us-ascii?Q?Q5gjHI5zT+B4yqZ21J+fUbdVYByes6XcNwWu66SLipaYPvxOT1azKGbfbixQ?=
 =?us-ascii?Q?9FTUdQqXpmFLDMF1JZKSsRn0nlhO6u7ZPtU/eUY2K9uDlppJvxMV77t63HLH?=
 =?us-ascii?Q?CGiOMc9dzcXelbjQV99JRaGtelYnPgy2TjXbe5L+6t4T/aJHWdVy7GR/Ckce?=
 =?us-ascii?Q?pjzqcAFCg0WCOgvO/x1lJj1jblx6L86QBTAt9BNbXLTqc4lChcxYGpufXZ3q?=
 =?us-ascii?Q?nwelOHO16uAxhab9lhrwr+i8N3qkmvJdwA6H3JFnNoz5zqPolKGAavOwWXEJ?=
 =?us-ascii?Q?3LSkcUk8sRsKuAyTCr2PQ2xMM4/3v86AoI4UrMxHHa6fqGZaiYRkQUa141eL?=
 =?us-ascii?Q?zbovEy917/5Fuv49GS2pHuhKFMRbebCvH67PF3k+qzZe87F0EunmkUjmhMIy?=
 =?us-ascii?Q?j/r4ngOL0UqEgOisKWutFe+ETkV31injwFwSSFV1T3g9ao30Y/5xN0/gZm+X?=
 =?us-ascii?Q?/7NAlbvJov8hdidDlNg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 951ae4cd-64de-42e3-da88-08dd7060f0ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:33:01.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnsvLKxc+rtJ+ZD/ALaTbphTuqvdwxMJWB2DyLaoEsHdmAIB0Zpon7wDsrnch6G2jbgYLCV4ZTztDOQd5B3uEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10597

On Mon, Mar 31, 2025 at 11:10:20AM +0800, Ming Qian(OSS) wrote:
>
> Hi Frank,
>
> On 2025/3/28 22:45, Frank Li wrote:
> > On Fri, Mar 28, 2025 at 02:30:52PM +0800, ming.qian@oss.nxp.com wrote:
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > >
> > > To support decoding motion-jpeg without DHT, driver will try to decode a
> > > pattern jpeg before actual jpeg frame by use of linked descriptors
> > > (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> > > used for decoding the motion-jpeg.
> > >
> > > In other words, 2 frame done interrupts will be triggered, driver will
> > > ignore the first interrupt,
> >
> > Does any field in linked descriptors to control if issue irq? Generally
> > you needn't enable first descriptors's irq and only enable second one.
> >
>
> Unfortunately, we cannot configure interrupts for each descriptor.
> So we can't only enable the second irq.
>
>
> > > and wait for the second interrupt.
> > > If the resolution is small, and the 2 interrupts may be too close,
> >
> > It also possible two irqs combine to 1 irqs. If I understand correct, your
> > irq handle only handle one descriptors per irq.
> >
> > Another words,
> >
> > If second irq already happen just before 1,
> >
> > 1. dec_ret = readl(reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS));
> > 2. writel(dec_ret, reg + MXC_SLOT_OFFSET(slot, SLOT_STATUS)); /* w1c */
> >
> > Does your driver wait forever because no second irq happen?
> >
> > Frank
>
> Before this patch, the answer is yes, the driver will wait 2 seconds
> until timeout.
> In fact, this is the problem that this patch wants to avoid.
> Now I think there are 3 cases for motion-jpeg decoding:
> 1. The second irq happens before the first irq status check, the on-going
> check
> help to hanle this case.
> 2. The second irq happens after the first irq status check, but before
> on-going check, this on-going check can help handle it, fisnish the
> current decoding and reset the jpeg decoder.
> 3. The second irq happens after the on-going check, this is the normal
> process before. No additional processing required.

Okay, not sure if hardware provide current_descript position. Generally
descriptor queue irq handle is like

cur = queue_header;
while(cur != read_hardware_currunt_pos())
{
	handle(cur);
	cur = cur->next;
	queue_header = cur;
}

with above logic, even you queue new request during irq handler, it should
work correctly.

But it is depend on if hardware can indicate current working queue
position, some time, hardware stop last queue posistion when handle last
one.

Frank

>
> Thanks,
> Ming
>
> > >
> > > when driver is handling the first interrupt, two frames are done, then
> > > driver will fail to wait for the second interrupt.
> > >
> > > In such case, driver can check whether the decoding is still ongoing,
> > > if not, just done the current decoding.
> > >
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
> > >   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 20 ++++++++++++++++++-
> > >   2 files changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > index d579c804b047..adb93e977be9 100644
> > > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
> > > @@ -89,6 +89,7 @@
> > >   /* SLOT_STATUS fields for slots 0..3 */
> > >   #define SLOT_STATUS_FRMDONE			(0x1 << 3)
> > >   #define SLOT_STATUS_ENC_CONFIG_ERR		(0x1 << 8)
> > > +#define SLOT_STATUS_ONGOING			(0x1 << 31)
> > >
> > >   /* SLOT_IRQ_EN fields TBD */
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > index 45705c606769..e6bb45633a19 100644
> > > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > @@ -910,6 +910,23 @@ static u32 mxc_jpeg_get_plane_size(struct mxc_jpeg_q_data *q_data, u32 plane_no)
> > >   	return size;
> > >   }
> > >
> > > +static bool mxc_dec_is_ongoing(struct mxc_jpeg_ctx *ctx)
> > > +{
> > > +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
> > > +	u32 curr_desc;
> > > +	u32 slot_status;
> > > +
> > > +	slot_status = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_STATUS));
> > > +	curr_desc = readl(jpeg->base_reg + MXC_SLOT_OFFSET(ctx->slot, SLOT_CUR_DESCPT_PTR));
> > > +
> > > +	if (curr_desc == jpeg->slot_data.cfg_desc_handle)
> > > +		return true;
> > > +	if (slot_status & SLOT_STATUS_ONGOING)
> > > +		return true;
> > > +
> > > +	return false;
> > > +}
> > > +
> > >   static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> > >   {
> > >   	struct mxc_jpeg_dev *jpeg = priv;
> > > @@ -979,7 +996,8 @@ static irqreturn_t mxc_jpeg_dec_irq(int irq, void *priv)
> > >   		mxc_jpeg_enc_mode_go(dev, reg, mxc_jpeg_is_extended_sequential(q_data->fmt));
> > >   		goto job_unlock;
> > >   	}
> > > -	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed) {
> > > +	if (jpeg->mode == MXC_JPEG_DECODE && jpeg_src_buf->dht_needed &&
> > > +	    mxc_dec_is_ongoing(ctx)) {
> > >   		jpeg_src_buf->dht_needed = false;
> > >   		dev_dbg(dev, "Decoder DHT cfg finished. Start decoding...\n");
> > >   		goto job_unlock;
> > > --
> > > 2.43.0-rc1
> > >

