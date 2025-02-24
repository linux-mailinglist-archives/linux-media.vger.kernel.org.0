Return-Path: <linux-media+bounces-26855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBD1A42AF1
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA0AD168E91
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C86265CBD;
	Mon, 24 Feb 2025 18:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OUEy28ee"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCFA263F48;
	Mon, 24 Feb 2025 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740420969; cv=fail; b=Qq+Cm6iTwz+APPB8/3pSZIHbrvFE3wsDHSBtYX3VLO1r/hBnbp3xuLs2b07ED2pBm/B8KH6UdouopqAXz5B8vEUBO8yeGMtoQRNdeQyk1ptac34UZfljKwN5F0ky/C+k0FE+e7EK1iIVdex7ZKRsgtul0ySD7e2LmFvkp+MZt8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740420969; c=relaxed/simple;
	bh=MxMphZAg52PpcInaNTpRD1InD5/BipMeUZaPxMn4XSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TVZDEtyEmWc1iE0bMEcPCb0xrk1mud+DocN91gV8ysbgvUM+AChQ4/0SOc1xW5hdDc/4oGIyUaYgKs0CnSUp75AXgWstZNvG+1/dBbATBy3B7ySzlbV0Mi3ZlwtzlLUKipNS1MnvdUejuGf+PDrQyGaUYZppN3oKBPgwWCuaCQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OUEy28ee; arc=fail smtp.client-ip=40.107.74.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNae9QVs4aWNaC73x19zTcjY/PL94QDDfK1z/gPifL0H4TG8UJ1768v8zT+QU1HLQO/i6inXYqvd8oBY0qu0f+HnJ7oe5oVaLK4cUn6O/P4KD5quk/J3Vauly+WhAIQmLdmJBwmkr0suNzQGjF+w9KfXC1qVj+6dm/YVT/YeVoXS7O/LSC+sHyT+fMxB/XuYxeDxKCAUAOhYAjvXM1vsj3463oOZm1lK+n01/G6Im/HGaF4DcwWGBnpf/lAAKXIQCtKD4Fuk3VK8oeUHOv9AeRwpqyY3MbR8zJtsaTKRaMuusT2w5lIrhEmjhqmz2oMHG9HpJlZk/cK89ZY/2cDa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvyxpivmWX+5l/88jwCNjnwXFcPY8fK3xbxZZAzIpj8=;
 b=HL/+H/Gv7umHiSF6YCl3KQ+3saCj3goA3xX/GX1mStx6lsQ1sicOrfl75i1VuRXKe/RMVGIJ48PLn6i5CArfV+hVV7gLYxbHVQjvJKZJ8MH/t8i4haw6UcNH3VSZ5bQMFV/exJXjI40IqDq5mJzZDkiqvWPpmTy4TUUME5BFyvqmfrtKqzjV+yUqWqH/XSz5I8YSdouiGy38/8Ayn2OSJ/7XWTSbiedYtYN1UnCq906sIUmCXJ+MfbPCP4Vo7eQZFRkQbMunjP11dCaREmepJBmkJkc4dAZYLn6pxhubOnyffFMNRnkLzUP5yKoEpsQOI0Ood/uTEcz/lMKJrwNinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvyxpivmWX+5l/88jwCNjnwXFcPY8fK3xbxZZAzIpj8=;
 b=OUEy28eedbs8j1VME4VoCC3ZIPheq6Rje6Z60llsCPWYoYlNBu9ExNx33UZ1x9d1Ov+UpDCHGV0UnoTMHIvnVEnWlKVmec9A1pxAizGKJyDZUyfDKJpVGfOg/BCdymwnTNbLtAU5oXyWTQv3sCoPuGj3jaIAzxjbCP2wUrdqi20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10) by TY4PR01MB12765.jpnprd01.prod.outlook.com
 (2603:1096:405:1ea::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 18:15:54 +0000
Received: from TYRPR01MB13941.jpnprd01.prod.outlook.com
 ([fe80::1512:cd0c:8675:4688]) by TYRPR01MB13941.jpnprd01.prod.outlook.com
 ([fe80::1512:cd0c:8675:4688%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:15:51 +0000
Date: Mon, 24 Feb 2025 19:15:31 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/18] media: rzg2l-cru: Add support for RZ/G3E SoC
Message-ID: <Z7y3LP2u2SP4x77M@tom-desktop>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-19-tommaso.merciai.xr@bp.renesas.com>
 <20250223203230.GE15344@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223203230.GE15344@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To TYRPR01MB13941.jpnprd01.prod.outlook.com
 (2603:1096:405:21c::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13941:EE_|TY4PR01MB12765:EE_
X-MS-Office365-Filtering-Correlation-Id: 982aef20-dba3-4fb1-42b6-08dd54ff4539
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?eGKCmryvISeg21v5RvkNsc2okKO5q9jJLF9eIZXr39CVIj63n3840Wk03mEW?=
 =?us-ascii?Q?fv7VWOtvekvT1RKiwM9sjQmnF7aXk3dzhQG7ygeYfq/E6cDUc11Oijz81/fE?=
 =?us-ascii?Q?PqHIi8B1Q83fpaMde1lVz4s9DpfX0KNipofNXGQE7E5o36FsGzZXm9u3Ixce?=
 =?us-ascii?Q?BcPZR+eMODg0Ae9PqllgsHM/6/4PtkU/rol3MUP5OwgbCAp6xbiMlb3cAiq4?=
 =?us-ascii?Q?5ukssT2V1VZAn6AVnGq6IDWnk18crhgqRTAfEmm0LpDECgGEDHkp2Nb/Akzo?=
 =?us-ascii?Q?TFGi5N1Nrc0y/uR4zL9+7McdzI6z+tABfRGOAPIJpKZ4QPt9SVsIDICNHLNU?=
 =?us-ascii?Q?EXLfVDrsZQjACvNYNo/X6Dk7uCmkhI7S0RBZqB/f9GM0UiBJJnXPytcZPY+j?=
 =?us-ascii?Q?hnlk3qXvWlb605kbTkVFWtlr1Het6fbFMbxnDRTJ1o51sIsNy3NvZEvPeaVw?=
 =?us-ascii?Q?VPvs8jLSz6UEKwbp+0uWkY2ZAXmpIaD/jVzj45p/Zqb442bRVoaMejNc2ny6?=
 =?us-ascii?Q?EIEkDFO6gv2X544MrGTtEF9gYr6Yk1+3t3xqIKicCWa1wr3aUybIbRIkT8cr?=
 =?us-ascii?Q?APvCaylR09CNaPNDa6SnWCATFPoaFmXf//CTyCO3cGL7HKKovkkHQGGUvwPg?=
 =?us-ascii?Q?D+IQ5DmMtGvcpFBV9uG5fzOUkZHuxyehaZYdm77uYzid8HUrmmkHT4iVGVgL?=
 =?us-ascii?Q?6G0SmXl5Q6hZiZz4dL6iEWJyU7esmbdcd/NNVjFY1+JTDWZ7uQO0iEVfSJM+?=
 =?us-ascii?Q?N6MQaw0i3S3z6WT+smfd3+TxgDUjpGedk9MSxkNYl2QIM2RXLM4CzFEEBfzR?=
 =?us-ascii?Q?umGSblkbHDYLgnvdtQM5RpoVM5LKe7i/nxPI0MqSsJGvamcD7TF3K4ZD+dFx?=
 =?us-ascii?Q?e3cTTAzpqvLts0JwUMKzeVTlf3Fs5FetwmkayXRh8NLIm463Sn94ndqg6/Gd?=
 =?us-ascii?Q?umqEyD8ol9RoaXXWupB02yRlDdxK6/rVFaDqDEJL6Cnweslo1gBEWFVkItm/?=
 =?us-ascii?Q?4k+WGffKbim0TyJpYTJGz4F8WDE/xxYc4BoeLJyX1Cq35gxnmhZNY2KLJqeH?=
 =?us-ascii?Q?dHyeMy//+kga4mFzMblhWZ9rG5+NFcE3lHxx0RoJylcMeqXSWRK/aZ/SAK3I?=
 =?us-ascii?Q?CONLfTiZ4G7rjiOCVbg9Yd8eP6IGepYd5ItdYs96X4x6MwTmRMlGjYsxESLP?=
 =?us-ascii?Q?F/pQbkefop0hJNvYGKn1jvx/SJTR+mCvS4FKTfFW+vl2DfrP9cfSySERsHbq?=
 =?us-ascii?Q?UWps7K7o0H53C7Z+0E0+XUQ4zOybXzNS3moiOxxBDgzRNi4ZHxhzO0a3sImL?=
 =?us-ascii?Q?J09j2b4ofwC7yPdLrG4c1TQQ+4igfsIaDPo1BbsdJMdF8j8jvrXWG2RcqQ+X?=
 =?us-ascii?Q?f+lJJoWVilBWljAvOXgR3/+gUpNXbbAgQ+nfliQz3o/eyYjKwWB24zA2f6ni?=
 =?us-ascii?Q?48IBc+G9TZQTQz1ZmlWSa4F/z2nFc3Gm?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13941.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?iV7iu2t15/H6RKgfZY/f4SaE9dIGVt2xkEw6Z4NOCDdPW2bXEWgVlzYK+i9z?=
 =?us-ascii?Q?tgoDg4IKLonPvGAS9NKLbkkCEVZKDRhLG/OIPs+mZU6N0X6aMu8wtai4+H5A?=
 =?us-ascii?Q?/e0W2Nx1FTj9PuScPdRACTz/HxnYgUdBZyKh8lONo0rwObQtnMSqzU0X3spl?=
 =?us-ascii?Q?EebynbTyzLCewTmAPkLNDdYnxN4QwTf0Cd8SOpkv+sTwN7btJWKZzW+5P/+d?=
 =?us-ascii?Q?Z//SQNLDUk+h6ff+5joxOcQzvw0n2kYwBEY7mfRZuOtJ6/blv5GmDZAqljs5?=
 =?us-ascii?Q?a0dJHlMzcBGpr9DkPn9FvPonqvodFyibrlDClIWpKkxUgQ1sR1LTna8qyVOv?=
 =?us-ascii?Q?lzJftOzsxGL0pKzBujVnGfVl88OxJqxvD9vCx8Y7dSNjwKPM5f3ZvqCby0gi?=
 =?us-ascii?Q?QlyoKZpufOdHyuWCxyOf95H6G2UjoujYnQvNctx6JydC82Wm+7BPdbt4BS8G?=
 =?us-ascii?Q?/KFEIWrWUfAnMb87YWE6M6hCZHrDhAhAoROw40GBNeZQBgyGL41dOUJGWCbc?=
 =?us-ascii?Q?utKbqMeoyN4W8z6DRHK53FUeQYX4Hcnk/RSSIVwNL2NTAmQZ4WpbdL3+pWHp?=
 =?us-ascii?Q?HF1/qbVES9v1tAUPvRMIHSzaS133dmki+M8PUJ7jVS90ypOrTOB1Vrr9F+xA?=
 =?us-ascii?Q?NrnjQBNxruXvA2fx5zZSrji7o2U4MsmvYtAClvLnXVmAvjIRNjxOsMQJ7NM7?=
 =?us-ascii?Q?p00EZ9daH6km7QUZ/MRV6hIyjtFFrN4VKr8O6Kd68D626CsuB8GDsvQk5h3Q?=
 =?us-ascii?Q?GGpzDKm+yDZvZEMGUHTj0mVD5zxgj1wNmjdu2KmDWQQiWRo19UyErC4QvTV9?=
 =?us-ascii?Q?glpEx+0mIhh2SsAMo9As4tzkzqsIlGV+GzylxsxWrTgqCk3pK/jOFY1Rgr1q?=
 =?us-ascii?Q?8/FDXCoxY9e8UlB8Vw0atJfTNFA+rpu98iG5ogOETJvi1c5Ei3tMj8+r5qKs?=
 =?us-ascii?Q?cdggzjEspgIfOF/FTtfFbb5XR7a+Hg+QF7ta6FwAurSk5qRxD1MWls0P0jbs?=
 =?us-ascii?Q?RfUG/wR0/0wxCpoQrzdEpAG/AZjHhI88rYIMKWz3Lz8dyzR6uWUEv8GScCgS?=
 =?us-ascii?Q?0IVEdREirqd7eP7uPHFklB/BImDDYCSot7IXUlhRHuqVgz+Q30dH631neipn?=
 =?us-ascii?Q?mH/w5zZ/ngku8HlgbWqMvRmoBiaMohXCJCzs3GXXdRi0ygj4Wkxpyj760QbR?=
 =?us-ascii?Q?GT6GZax8A4i1kUsk2yKZEfhc4HD2OKTQ5Cuudj0ShkjwIOYjUZRQim4SbLBV?=
 =?us-ascii?Q?MHBCIeW5bfhtYfet+JeMqjPAh1VU/3TGVW2/FQeWYZHzMDrIgDCfQcG5SggL?=
 =?us-ascii?Q?ahDX+6F1n8XBWg6toDjP+BFc9SBJo8fAVgBPCzpf7fghneMiAWR6cDaYGp8F?=
 =?us-ascii?Q?nc5tvgDA1aiB7YTA7U/0tG3hMN8WFAUGqmSwV+EvsS1ky/Lo9YcWd0iWxEnV?=
 =?us-ascii?Q?zbBhbbfO+txGyg4TXJuUcodQKspT74G6Iq4F4zUT7MtY4Un3XdgDCZmgXJTG?=
 =?us-ascii?Q?lMTTY0DotAlk7NQjMkNSxg7kbmu8RQzgQUuuC6BmjI8jGzSTLf/WnzFBLCGg?=
 =?us-ascii?Q?STGWmOidQGFY9TKTlu8WjFKuEUjUhO/P++EtYUzpzEwyX6i2IDJygeR2ja4T?=
 =?us-ascii?Q?9EjIC6szA36lFqT+PyqQgZ0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982aef20-dba3-4fb1-42b6-08dd54ff4539
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13941.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 18:15:51.4852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHbYSVZgaCYB0VFTUU1Dn6yTbdau69pZGellrhh+Dqv0+Ytp9f+QQW2JNlhavcx7Q4XBmhKj6LpnszqxVYZIJTju+8bRJ8NJQ+Qh8dL5RiucfG4OZqjWi0VMWSL3xP9j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12765

Hi Laurent,

Thank you for the review

On Sun, Feb 23, 2025 at 10:32:30PM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Fri, Feb 21, 2025 at 04:55:32PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > 
> > The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
> > the Renesas RZ/G2L SoC, with the following differences:
> > 
> > - Additional registers rzg3e_cru_regs.
> > - A different irq handler rzg3e_cru_irq.
> > - A different rzg3e_cru_csi2_setup.
> > - A different max input width.
> > 
> > Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
> > and RZ/G3E and related RZ/G3E functions:
> > 
> >  - rzg3e_cru_enable_interrupts()
> >  - rzg3e_cru_enable_interrupts()
> >  - rz3e_fifo_empty()
> >  - rzg3e_cru_csi2_setup()
> >  - rzg3e_cru_get_current_slot()
> > 
> > Add then support for the RZ/G3E SoC CRU block with the new compatible
> > string "renesas,r9a09g047-cru".
> > 
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  63 +++++++
> >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  18 ++
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 178 +++++++++++++++++-
> >  4 files changed, 282 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > index 3ae0cd83af16..075a3aa8af29 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > @@ -290,6 +290,13 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> >  		return ret;
> >  
> >  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
> > +	cru->mem_banks = devm_kmalloc_array(dev, cru->num_buf,
> > +					    sizeof(struct rzg2l_cru_mem_bank),
> > +					    GFP_KERNEL);
> > +	if (!cru->mem_banks)
> > +		return dev_err_probe(dev, -ENOMEM,
> > +				     "Failed to init mem banks\n");
> > +
> >  	pm_suspend_ignore_children(dev, true);
> >  	ret = devm_pm_runtime_enable(dev);
> >  	if (ret)
> > @@ -321,6 +328,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> >  	rzg2l_cru_dma_unregister(cru);
> >  }
> >  
> > +static const u16 rzg3e_cru_regs[] = {
> > +	[CRUnCTRL] = 0x0,
> > +	[CRUnIE] = 0x4,
> > +	[CRUnIE2] = 0x8,
> > +	[CRUnINTS] = 0xc,
> > +	[CRUnINTS2] = 0x10,
> > +	[CRUnRST] = 0x18,
> > +	[AMnMB1ADDRL] = 0x40,
> > +	[AMnMB1ADDRH] = 0x44,
> > +	[AMnMB2ADDRL] = 0x48,
> > +	[AMnMB2ADDRH] = 0x4c,
> > +	[AMnMB3ADDRL] = 0x50,
> > +	[AMnMB3ADDRH] = 0x54,
> > +	[AMnMB4ADDRL] = 0x58,
> > +	[AMnMB4ADDRH] = 0x5c,
> > +	[AMnMB5ADDRL] = 0x60,
> > +	[AMnMB5ADDRH] = 0x64,
> > +	[AMnMB6ADDRL] = 0x68,
> > +	[AMnMB6ADDRH] = 0x6c,
> > +	[AMnMB7ADDRL] = 0x70,
> > +	[AMnMB7ADDRH] = 0x74,
> > +	[AMnMB8ADDRL] = 0x78,
> > +	[AMnMB8ADDRH] = 0x7c,
> > +	[AMnMBVALID] = 0x88,
> > +	[AMnMADRSL] = 0x8c,
> > +	[AMnMADRSH] = 0x90,
> > +	[AMnAXIATTR] = 0xec,
> > +	[AMnFIFOPNTR] = 0xf8,
> > +	[AMnAXISTP] = 0x110,
> > +	[AMnAXISTPACK] = 0x114,
> > +	[AMnIS] = 0x128,
> > +	[ICnEN] = 0x1f0,
> > +	[ICnSVCNUM] = 0x1f8,
> > +	[ICnSVC] = 0x1fc,
> > +	[ICnIPMC_C0] = 0x200,
> > +	[ICnMS] = 0x2d8,
> > +	[ICnDMR] = 0x304,
> > +};
> > +
> > +static const struct rzg2l_cru_info rzg3e_cru_info = {
> > +	.max_width = 4095,
> > +	.max_height = 4095,
> > +	.image_conv = ICnIPMC_C0,
> > +	.stride = 128,
> > +	.regs = rzg3e_cru_regs,
> > +	.irq_handler = rzg3e_cru_irq,
> > +	.enable_interrupts = rzg3e_cru_enable_interrupts,
> > +	.disable_interrupts = rzg3e_cru_disable_interrupts,
> > +	.fifo_empty = rz3e_fifo_empty,
> > +	.csi_setup = rzg3e_cru_csi2_setup,
> > +};
> > +
> >  static const u16 rzg2l_cru_regs[] = {
> >  	[CRUnCTRL] = 0x0,
> >  	[CRUnIE] = 0x4,
> > @@ -367,6 +426,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
> >  };
> >  
> >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > +	{
> > +		.compatible = "renesas,r9a09g047-cru",
> > +		.data = &rzg3e_cru_info,
> > +	},
> >  	{
> >  		.compatible = "renesas,rzg2l-cru",
> >  		.data = &rzgl2_cru_info,
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > index 82920db7134e..1646d1e2953c 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > @@ -14,8 +14,13 @@
> >  
> >  #define CRUnIE_EFE			BIT(17)
> >  
> > +#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
> > +#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
> > +
> >  #define CRUnINTS_SFS			BIT(16)
> >  
> > +#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
> > +
> >  #define CRUnRST_VRESETN			BIT(0)
> >  
> >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > @@ -32,7 +37,14 @@
> >  #define AMnAXIATTR_AXILEN		(0xf)
> >  
> >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > +#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
> > +#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
> >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> > +#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
> > +#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
> > +
> > +#define AMnIS_IS_MASK			GENMASK(14, 7)
> > +#define AMnIS_IS(x)			((x) << 7)
> >  
> >  #define AMnAXISTP_AXI_STOP		BIT(0)
> >  
> > @@ -40,6 +52,11 @@
> >  
> >  #define ICnEN_ICEN			BIT(0)
> >  
> > +#define ICnSVC_SVC0(x)			(x)
> > +#define ICnSVC_SVC1(x)			((x) << 4)
> > +#define ICnSVC_SVC2(x)			((x) << 8)
> > +#define ICnSVC_SVC3(x)			((x) << 12)
> > +
> >  #define ICnMC_CSCTHR			BIT(5)
> >  #define ICnMC_INF(x)			((x) << 16)
> >  #define ICnMC_VCSEL(x)			((x) << 22)
> > @@ -52,7 +69,9 @@
> >  enum rzg2l_cru_common_regs {
> >  	CRUnCTRL,	/* CRU Control */
> >  	CRUnIE,		/* CRU Interrupt Enable */
> > +	CRUnIE2,	/* CRU Interrupt Enable(2) */
> >  	CRUnINTS,	/* CRU Interrupt Status */
> > +	CRUnINTS2,	/* CRU Interrupt Status(2) */
> >  	CRUnRST, 	/* CRU Reset */
> >  	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> >  	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > @@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
> >  	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> >  	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> >  	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > +	AMnMADRSL,	/* VD Memory Address Lower Status Register */
> > +	AMnMADRSH,	/* VD Memory Address Higher Status Register */
> >  	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> >  	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> >  	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> >  	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > +	AMnIS,		/* Image Stride Setting Register */
> >  	ICnEN,		/* CRU Image Processing Enable */
> > +	ICnSVCNUM,	/* CRU SVC Number Register */
> > +	ICnSVC,		/* CRU VC Select Register */
> >  	ICnMC,		/* CRU Image Processing Main Control */
> > +	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
> >  	ICnMS,		/* CRU Module Status */
> >  	ICnDMR,		/* CRU Data Output Mode */
> >  };
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index ccaba5220f1c..3301379c132c 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -84,6 +84,7 @@ struct rzg2l_cru_info {
> >  	unsigned int max_width;
> >  	unsigned int max_height;
> >  	u16 image_conv;
> > +	u16 stride;
> >  	const u16 *regs;
> >  	irqreturn_t (*irq_handler)(int irq, void *data);
> >  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> > @@ -94,6 +95,11 @@ struct rzg2l_cru_info {
> >  			  u8 csi_vc);
> >  };
> >  
> > +struct rzg2l_cru_mem_bank {
> > +	dma_addr_t addrl;
> > +	dma_addr_t addrh;
> > +};
> > +
> >  /**
> >   * struct rzg2l_cru_dev - Renesas CRU device structure
> >   * @dev:		(OF) device
> > @@ -108,6 +114,8 @@ struct rzg2l_cru_info {
> >   * @vdev:		V4L2 video device associated with CRU
> >   * @v4l2_dev:		V4L2 device
> >   * @num_buf:		Holds the current number of buffers enabled
> > + * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
> > + * @mem_banks:		Memory addresses where current video data is written.
> >   * @notifier:		V4L2 asynchronous subdevs notifier
> >   *
> >   * @ip:			Image processing subdev info
> > @@ -144,6 +152,9 @@ struct rzg2l_cru_dev {
> >  	struct v4l2_device v4l2_dev;
> >  	u8 num_buf;
> >  
> > +	u8 svc_channel;
> > +	struct rzg2l_cru_mem_bank *mem_banks;
> > +
> >  	struct v4l2_async_notifier notifier;
> >  
> >  	struct rzg2l_cru_ip ip;
> > @@ -175,6 +186,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
> >  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
> >  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
> >  irqreturn_t rzg2l_cru_irq(int irq, void *data);
> > +irqreturn_t rzg3e_cru_irq(int irq, void *data);
> >  
> >  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
> >  
> > @@ -188,10 +200,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
> >  
> >  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> >  void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> > +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> > +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> >  
> >  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> > +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
> >  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> >  			  const struct rzg2l_cru_ip_format *ip_fmt,
> >  			  u8 csi_vc);
> > +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > +			  const struct rzg2l_cru_ip_format *ip_fmt,
> > +			  u8 csi_vc);
> >  
> >  #endif
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > index 637c9c9f9ba8..efd70c13704e 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > @@ -138,6 +138,9 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> >  	/* Currently, we just use the buffer in 32 bits address */
> 
> Should this be fixed ?
> 
> >  	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
> >  	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
> > +
> > +	cru->mem_banks[slot].addrl = lower_32_bits(addr);
> > +	cru->mem_banks[slot].addrh = upper_32_bits(addr);
> 
> Here you stplit the dma_addr_t in two fields, storing the low and high
> parts separately (but still in dma_addr_t variables), and below you
> recombine those two fields to recreate the full address. That doesn't
> seem needed.

We can use:

struct rzg2l_cru_mem_bank {
	dma_addr_t addr;
};

cru->mem_banks[slot].addr = addr;
Instead of using low and high.

Then accordingly update the rzg3e_cru_get_current_slot()

> 
> >  }
> >  
> >  /*
> > @@ -176,7 +179,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
> >  	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> >  }
> >  
> > -static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > +static int rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> >  {
> >  	unsigned int slot;
> >  	u32 amnaxiattr;
> > @@ -190,10 +193,45 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> >  	for (slot = 0; slot < cru->num_buf; slot++)
> >  		rzg2l_cru_fill_hw_slot(cru, slot);
> >  
> > +	if (cru->info->stride) {
> 
> I'd name this field stride_align or something similar.

Agreed on stride_align.
Will update this in v3.

> 
> > +		u32 stride = cru->format.bytesperline;
> > +		u32 amnis;
> > +
> > +		if (stride % cru->info->stride) {
> > +			dev_err(cru->dev,
> > +				"Bytesperline must be multiple of %u bytes\n",
> > +				cru->info->stride);
> > +			return -EINVAL;
> > +		}
> 
> This needs to be caught at set format time, and the stride must be
> adjusted then.

What about doing this into the rzg2l_cru_format_align() function?
Somenthing like:

	if (info->stride_align) {
		u32 stride = pix->width * fmt->bpp;

		if (stride % info->stride_align) {
			dev_warn(cru->dev,
				"Bytesperline (%u) is not aligned to %u bytes, adjusting it\n",
				stride, info->stride_align);

			stride = ALIGN_DOWN(stride, info->stride_align);
			pix->width = stride / fmt->bpp;
		}
	}

	/* Limit to CRU capabilities */
	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
			      &pix->height, 240, info->max_height, 2, 0);

	pix->bytesperline = pix->width * fmt->bpp;
	pix->sizeimage = pix->bytesperline * pix->height;


> 
> > +		stride = stride / cru->info->stride;
> 
> 		stride /= cru->info->stride;
> 
> > +		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> > +		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> > +	}
> > +
> >  	/* Set AXI burst max length to recommended setting */
> >  	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
> >  	amnaxiattr |= AMnAXIATTR_AXILEN;
> >  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> > +
> > +	return 0;
> > +}
> > +
> > +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > +			  const struct rzg2l_cru_ip_format *ip_fmt,
> > +			  u8 csi_vc)
> > +{
> > +	const struct rzg2l_cru_info *info = cru->info;
> > +	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> > +
> > +	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
> > +
> > +	/* Set virtual channel CSI2 */
> > +	icnmc |= ICnMC_VCSEL(csi_vc);
> > +
> > +	rzg2l_cru_write(cru, ICnSVCNUM, cru->svc_channel);
> 
> As far as I can tell, csi_vc and cru->svc_channel hold the same value.
> You can drop ths svc_channel field.


Agreed here I can directly use:

rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);

Thanks

> 
> > +	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> > +			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> > +	rzg2l_cru_write(cru, info->image_conv, icnmc);
> >  }
> >  
> >  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > @@ -244,6 +282,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
> >  	return 0;
> >  }
> >  
> > +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
> > +{
> > +	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
> > +
> > +	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
> > +	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
> > +	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
> > +	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
> >  {
> >  	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
> > @@ -355,6 +406,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> >  	return fd.entry[0].bus.csi2.vc;
> >  }
> >  
> > +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> > +{
> > +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
> > +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
> > +}
> > +
> > +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
> > +{
> > +	rzg2l_cru_write(cru, CRUnIE, 0);
> > +	rzg2l_cru_write(cru, CRUnIE2, 0);
> > +	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
> > +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> > +}
> > +
> >  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> >  {
> >  	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> > @@ -377,6 +442,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> >  	if (ret < 0)
> >  		return ret;
> >  	csi_vc = ret;
> > +	cru->svc_channel = csi_vc;
> >  
> >  	spin_lock_irqsave(&cru->qlock, flags);
> >  
> > @@ -390,7 +456,11 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> >  	cru->info->disable_interrupts(cru);
> >  
> >  	/* Initialize the AXI master */
> > -	rzg2l_cru_initialize_axi(cru);
> > +	ret = rzg2l_cru_initialize_axi(cru);
> > +	if (ret) {
> > +		spin_unlock_irqrestore(&cru->qlock, flags);
> > +		return ret;
> > +	}
> 
> This will go away once you remove the error check from
> rzg2l_cru_initialize_axi(), which should then remain a void function.

Ooks, thanks.

> 
> There's another function returning an error here,
> rzg2l_cru_initialize_image_conv(). I think it can also become void (in a
> separate patch).
> 
> >  
> >  	/* Initialize image convert */
> >  	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
> > @@ -555,6 +625,110 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> >  	return IRQ_RETVAL(handled);
> >  }
> >  
> > +static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> > +{
> > +	dma_addr_t amnmadrs;
> > +	unsigned int slot;
> > +
> > +	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
> > +	amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
> 
> What if the two registers are read on a frame boundary ?

Nice point.

You are suggesting here to read the AMnMADRSL and AMnMADRSH with a single
ioread64 starting from AMnMADRSL right?

> 
> > +
> > +	for (slot = 0; slot < cru->num_buf; slot++) {
> > +		dma_addr_t buf_addr;
> > +
> > +		buf_addr = cru->mem_banks[slot].addrh << 32 |
> > +			cru->mem_banks[slot].addrl;
> > +
> > +		/* Ensure amnmadrs is within this buffer range */
> > +		if (amnmadrs >= buf_addr &&
> > +		    amnmadrs < buf_addr + cru->format.sizeimage) {
> > +			return slot;
> > +		}

Here with the upper changes I can use:

	for (slot = 0; slot < cru->num_buf; slot++) {

		/* Ensure amnmadrs is within this buffer range */
		if (amnmadrs >= cru->mem_banks[slot].addr &&
		    amnmadrs < cru->mem_banks[slot].addr +
		    cru->format.sizeimage) {
			return slot;
		}
	}


> > +	}
> > +
> > +	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
> > +	return -EINVAL;
> > +}
> > +
> > +irqreturn_t rzg3e_cru_irq(int irq, void *data)
> > +{
> > +	struct rzg2l_cru_dev *cru = data;
> > +	unsigned int handled = 0;
> > +	unsigned long flags;
> > +	unsigned int slot;
> > +	u32 irq_status;
> > +
> > +	spin_lock_irqsave(&cru->qlock, flags);
> > +	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> > +	if (!(irq_status))
> > +		goto done;
> > +
> > +	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> > +
> > +	handled = 1;
> > +
> > +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> > +
> > +	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> > +	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> > +		dev_dbg(cru->dev, "IRQ while state stopped\n");
> > +		goto done;
> > +	}
> > +
> > +	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> > +		if (irq_status & CRUnINTS2_FSxS(0) ||
> > +		    irq_status & CRUnINTS2_FSxS(1) ||
> > +		    irq_status & CRUnINTS2_FSxS(2) ||
> > +		    irq_status & CRUnINTS2_FSxS(3))
> > +			dev_dbg(cru->dev, "IRQ while state stopping\n");
> > +		goto done;
> > +	}
> > +
> > +	slot = rzg3e_cru_get_current_slot(cru);
> > +	if (slot < 0)
> > +		goto done;
> > +
> > +	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> > +
> > +	cru->mem_banks[slot].addrl = 0;
> > +	cru->mem_banks[slot].addrh = 0;
> > +
> > +	/*
> > +	 * To hand buffers back in a known order to userspace start
> > +	 * to capture first from slot 0.
> > +	 */
> > +	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> > +		if (slot != 0) {
> > +			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> > +			goto done;
> > +		}
> > +		dev_dbg(cru->dev, "Capture start synced!\n");
> > +		cru->state = RZG2L_CRU_DMA_RUNNING;
> > +	}
> > +
> > +	/* Capture frame */
> > +	if (cru->queue_buf[slot]) {
> > +		cru->queue_buf[slot]->field = cru->format.field;
> > +		cru->queue_buf[slot]->sequence = cru->sequence;
> > +		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
> > +		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
> > +				VB2_BUF_STATE_DONE);
> > +		cru->queue_buf[slot] = NULL;
> > +	} else {
> > +		/* Scratch buffer was used, dropping frame. */
> > +		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
> > +	}
> > +
> > +	cru->sequence++;
> > +
> > +	/* Prepare for next frame */
> > +	rzg2l_cru_fill_hw_slot(cru, slot);
> > +
> > +done:
> > +	spin_unlock_irqrestore(&cru->qlock, flags);
> > +	return IRQ_RETVAL(handled);
> > +}
> > +
> >  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
> >  {
> >  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Thanks & Regards,
Tommaso


