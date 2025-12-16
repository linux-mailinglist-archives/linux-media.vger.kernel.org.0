Return-Path: <linux-media+bounces-48892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 666CFCC3B7E
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E443D3038F21
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1697934C83D;
	Tue, 16 Dec 2025 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BW8okLyT"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF0349B0D;
	Tue, 16 Dec 2025 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896380; cv=fail; b=l0IEnd7ijB16btFoKb9zGcrDF0KrMv4u+Y1RCrMxAKX0C4Lib/LmCSToNWA0OrmmL92JUurWCNd1IE7wKXPSHyb/yj1pb/amoAJdg6wNOnt51nDSVnjRH7bpwhHSRB0Q6CetAWtSmYSp2Yx4VyVC7lo4O4hoRMYQEl1RQIjOJBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896380; c=relaxed/simple;
	bh=7pMAnL3pjxLu6pjUJ+1Ofj5+KqURoYWH9WwyGfJD1KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bQ3zDZ21E409CCGRTEGXwTUH2f8i+uD5EnbjVwztTTidiSiNoZgrD7WRybvO8CLl0elp5d0W1SPVm6MDMhd6Xeb3eqIeMOwQMemuyuUZVlwEz3uSV8mnqLOvJZRLww3naHuZmqjJY+zSdHFA9BOV4REx79v+pakXdGPId+l0jzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BW8okLyT reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7iC6WzONZIiNtQssj/uxrAchaiuDs92WG+InTFJFoKuqcNp66DUNDMFyl5yAz1aZ/rZqBsdPXSwaLkgfDsOG4UH/JrpsaIUDFFmtLJasTo8BwZZBFgd+o7lD2ztlkkTEg+CaOa7Lz1YPj4Ip3yoDy/xoSfYMTMJXvJmjqXMo7Zqt7/hX+MgCw1aAeV9cequ+372QDFueucoJrF/2gMc5nT0ytMws0BFKP9U1nK87q49LweO8d1/zXv6sUIV5JeA2KHSUR3w9fiIwvivtNgfmys9pig3N9YcU7MCWtgVSYWxmFcsETRhP/0tV0JII1h+JZoQRREMFWO3gWq/6n9K+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6zIqvziQkSaAjcEumzv6Ydd1cAburN4gwS/SoqWdPo=;
 b=azlyIyWEU1QSKadUn6Zf6OgqGkCZ8lKolxaUOseYKeupFLfparmApgCwI6T6VsvAYGJ893K4aiRvd6aygDlmGYvO1jozjYAIc2FKs+zaDHf6q7J5Sm/eIwMj2DXV/+LvlXFaZpvLaJEb3b/fmAKI5KiwyJ0C48+F4MfdRL7aH2O53MzG4GxhJD3WIGym+bgCkY6cHLOpJVTVwWNlGEHYsXeJkNCrTbv9kTGaR40jn1cRIUTm6qjrPixs8VbNWIPI980gzxff3D+F/vr6h1gqKhjSo0JKONHLHs2yEBVajbOu8I1QG5yiBh+WX6QApUGvrbj2WM16QfPFpLTQPU488w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6zIqvziQkSaAjcEumzv6Ydd1cAburN4gwS/SoqWdPo=;
 b=BW8okLyT2tktA6TNr21BDpTgKI3GDw7dH1lVUiAPuiN3vIkRB5P7CEgy8LbCZdYrsh6NZDPhHFmMoBw9wv1GHqZt3E0chiRF3M9fIXGSsq4RVfCz7C7QHu19hwptzjgb99VHNvmdOWgEUFdGq/p70Ecf0SZuAnjxDvPNLrTIplpZRZwKAF+59CSGxT7oH+qydp7pRvDH0QH2+GOCpwhXjRbWQatmCQ75qS7Tre6BjXTl9J0fTJohHBu/0hVyEsl6eHdwRC//+bmvOj8Y0KqtlB2ntXgmsFPgdsaxkQOScseWWoiVdsT6V+qD+clCVKwd/MBtj2l/lD161TFO+LL2yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM8PR04MB7731.eurprd04.prod.outlook.com (2603:10a6:20b:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 14:46:11 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:46:11 +0000
Date: Tue, 16 Dec 2025 09:46:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] media: nxp: use dev_err_probe() to simplify code
Message-ID: <aUFwqMiYE+P+KdsO@lizhi-Precision-Tower-5810>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
 <20251215-cam_cleanup-v3-2-a61995068f38@nxp.com>
 <5462566.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5462566.31r3eYUQgx@steina-w>
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM8PR04MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdeb8b6-73d6-4ec3-e6f9-08de3cb1db1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?XPxlgR6uoRGPBLo59Gvh52GUrysOhJ9LSV/tY9rOs13Y2YwCkPqYfmom/G?=
 =?iso-8859-1?Q?ue/Jv720+Zvwf2dpH1PQqm/m8WbIlI6JgrMDZ3eSC241vt9T9Y4w1lGErK?=
 =?iso-8859-1?Q?XUWoe1OL2vfdZssXh1NS9aHPbEMFNGTfvc06xQ4YLaIKtXjNpR9LFZ4rJf?=
 =?iso-8859-1?Q?rEofx4H9FsC0W6ogYg+NzMKODpiXrKzWD52CvcIDO+M7BiF4vdXciFRWgs?=
 =?iso-8859-1?Q?bmZSrj1uy0Exk21XwyAKAZJw5NB2HC34wgd8qJOF/bTlXgCiYGJyrF1k2r?=
 =?iso-8859-1?Q?4rrU9Z+1EnhzfsIt7ROO/+rR60G+7VTe1UK8YWWHxj5p1vHQkJIALq0U2L?=
 =?iso-8859-1?Q?uftVd3b4+6Cy0GHCmqnCziBg2Ffd/eoAPQ75C/AfP57KxpdGx7ZlTFYImC?=
 =?iso-8859-1?Q?tZIPJ8OBNFrJAinEa02Q3Xm9jPy3HeWbDIrQrdNm95XFvngAhT9oGN87Db?=
 =?iso-8859-1?Q?GjMqWOLY5iUxseBffruRttE8Qw3HO8FB6tbLqCuIUAo66z6rE8FnG7LA1H?=
 =?iso-8859-1?Q?pHa5zdyO6YunZCGH+EFhizv+StDZ9Dp2fdrKTqHcxszsIsQrzdJdVk7CCH?=
 =?iso-8859-1?Q?ugPOHJ30fkmdPs/3gTyzZZ13TzuEhc2/101L6LgskP5yDebgUPaOun6H+y?=
 =?iso-8859-1?Q?YUz+4XZcecWVVesDciYBXIxzEthpUdsF5nRIVOd1P5hx5mIJfoSpDmC+kN?=
 =?iso-8859-1?Q?11JrLVRh3pV5M9rxRBXamliygxWfXYOD9mxcqEls0sFD5XZxOvMeYC3NEO?=
 =?iso-8859-1?Q?fvMgLb9+JPWBUab3B1PP1dqv2kGFweW6Isw5ObtX5P6CuZtZZB2rRGHboB?=
 =?iso-8859-1?Q?1O2qQldFwiQnRBGxxeoU3b5Z+FvHiV3XX0ci0xP/yApEGxw/51C+cBU6fW?=
 =?iso-8859-1?Q?8YzbyVet0qdvl7x2xW+2Va9oLSAV8UnsulkxRL+x8huRbx+IAfHCGURS61?=
 =?iso-8859-1?Q?/hK8of1OboALYgPHBGiLiZbv03qmn2VpVuvhF408WLRz7w0JzrmftALzW9?=
 =?iso-8859-1?Q?FpiVtFRjYRcJ8fJCBDby8bTAICxkneQsuLkBq0jw0etgtFCCuNLTSw5Cna?=
 =?iso-8859-1?Q?iNR5EZPPkAIZBRlfz6GMubnS7R2Ti9lS6a4JEk0RN8jTU3F3XFRqeCCfnx?=
 =?iso-8859-1?Q?G/mxegFBgHXBN993YNKNdsNdop5pKRCr7+1CetepKNd6g6OPgDilWV5fDW?=
 =?iso-8859-1?Q?mcoIeXZFgq4MwGvoOAV/D7efvJjcic2BjLlXl/3eWiJtjVqiN0b4mXb/nw?=
 =?iso-8859-1?Q?tJbzOwFLP8TwwKLt2Sn00yWKH5FqhEeaJINH4QELcs819m+HW2N/AS5s1Y?=
 =?iso-8859-1?Q?d8p0aHlYDhx9hIS00gO0Ei6DOExRmPNltt4EUK4piHbkn0NBg55RA78u3/?=
 =?iso-8859-1?Q?nGbdTWNDQsWIpVzdaWeTZ/6D+25E8G/D8guroZUuMxAuyNFgRQFmXZWSx6?=
 =?iso-8859-1?Q?9lESJZVMsqiaH4+ZkKWYvEZw3dJFedMyq3tUh3pi99gkHDmf+2sa27x8EF?=
 =?iso-8859-1?Q?Cm7mijiinFFN5hRn65MAw3dfZvWq0jPIZ2d2GdkUP/mg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?bkdt34tjSaP/2ve22/lFw5dD6lcw7Q+kZ0FaorBZCPHpqNEzYTukT9tW2K?=
 =?iso-8859-1?Q?dfE3F66ANIlOa29UQH7PEHfSwu5lC4aYrVg4kqSBdQhL6oNVrfpjFhUeDa?=
 =?iso-8859-1?Q?ZlrmXN7DYBtnq3tswhHSPKekwfRkrksyic1tZkLBIR+DUAk6RcPqgJPuUw?=
 =?iso-8859-1?Q?pqMxqCRoeVH2nIQ7Q5pa5n9QMjshXlS7Er5VTld252Osn+v7X3ImRhz0td?=
 =?iso-8859-1?Q?XhsGHLdzED+JDnf6899yExS6z9BuuQj0hU629nVBhpSnxZB8J4zgPOcntH?=
 =?iso-8859-1?Q?s5rGqY/FpDfjTLS5Mzx8bMpAYrcJPGnyZZcV015BcyFmJSsYA9g3cIuqhw?=
 =?iso-8859-1?Q?vknmf96IEqljHpyIye8tmhCyybNg5dC7+Cn+zX+2DkCXdkJ9XVnqsxch3H?=
 =?iso-8859-1?Q?GtgKT3AGFSTl3jB9fhe9h/7h+c9/f63B6i5yeo5JhG1GWJAidpXd0PGc2N?=
 =?iso-8859-1?Q?4FEEy+nnFV40RmJFt6l7wLx8hp9hzthj8lpEfSS2iYGUgU6VEn+vP1AqXF?=
 =?iso-8859-1?Q?r7VTNNNTK5j2+wfXsksJrCTJeAL61wjsC1e+b1T9CNW8k3vtJq7uOSHudB?=
 =?iso-8859-1?Q?ndtA1SryKME2El8+7wEF4mghJ5mk5C+6GQRY2sty2yUcac5P7r83H7G31x?=
 =?iso-8859-1?Q?JMa2gT2EtYmz4lrEKxgMkIazLuq9Rel5Q6OCh8W4vhZBVLOAarLG/v0ul4?=
 =?iso-8859-1?Q?v1onJZGoMsofhMyWa0OKwjRIKRFrjbr4L+/ohh08xCDxwjes+VaUizkhpC?=
 =?iso-8859-1?Q?j1R2jXTXYtKQtYT7LZXpPHWpB6aZt78iLct/GjTv66i0h43ONC7We/zefk?=
 =?iso-8859-1?Q?6AHVGRcanViwo3zh1Tk0HnjWBlVr/y7+bDMGR6QqwAQvKeUjPf/oyTrYdn?=
 =?iso-8859-1?Q?fzlgwvI6IbLAk64hBYOK1bYWnhbSFUSxJl6QyVmIvrXVC6rjn2CpgD+vX1?=
 =?iso-8859-1?Q?1TUZH7CgdgguKSMj3eALSOM9WXTGcGnOvrbXt+RUe36SEypX8XdiUhwUXE?=
 =?iso-8859-1?Q?r3QNYKO3LSsQ+QZfmo5Y5eSm6oZ7d6QW3L2YmJGuFAUaigWRZj+/nkTvKv?=
 =?iso-8859-1?Q?kXQea0D18XXTJcwq66pSUVPnwj6n8+GkGsgcFsTyVtlOz6gAd/J9wYRoI4?=
 =?iso-8859-1?Q?ftmHil/wA+LdcNepLWAO1YosPM9HdvU3Ew7oCK8bvpOB5zcRGhL4rhgOCS?=
 =?iso-8859-1?Q?Cz89RRYlrhYnYOgMiNZtVRDx6UH23wDTctD+r1hdlltSp3ilBAfYgJlovx?=
 =?iso-8859-1?Q?qdM5xxY6RzANeaDqcSZkziFC0AcjLRpfZ7yUPAxLUO+9ZJ3buvpnGO2eQo?=
 =?iso-8859-1?Q?6CkRmxfK1ucY/XPdqypPrWzp7FOpRHxnNMjTCWjnOH1Du/RWr/2UdskKvi?=
 =?iso-8859-1?Q?G0Uko42r0VHmfezO3h+Bd/eaZ8aUE1t0Xs0H/KWNRuZBxD6XW2bLygMDYg?=
 =?iso-8859-1?Q?gThOrEZnT10K2pR0Xjeb60XKojLP3XQdZ4XqnzPB7IZ1l05cgmRf3myLQA?=
 =?iso-8859-1?Q?s7W7ANlK6zq60aj2C63Lr7UPJbB8mOs8hNghYwF2e10m/MkGbDz5tkirZD?=
 =?iso-8859-1?Q?7Bay18Cl7xtyJB3Ub6WL797NWA22Ik3CHdcHOB4p/TTsGgFfelrYwVqx1B?=
 =?iso-8859-1?Q?FfF7C2c2u219xt6511PmtageraniThPej+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdeb8b6-73d6-4ec3-e6f9-08de3cb1db1e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:46:11.7826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6ElhA5MdBavAVPjSO7veJL2K5Azdf6dK4jp0kaz26bGeLVn8z/vf+JjT6lqyx6ZVkS9Jvvx21HwOajmLC88Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7731

On Tue, Dec 16, 2025 at 08:34:18AM +0100, Alexander Stein wrote:
> Hi,
>
> Am Montag, 15. Dezember 2025, 23:49:53 CET schrieb Frank Li:
> > Use dev_err_probe() to simplify the code. Drop the explicit error message
> > after returning from imx8mq_mipi_csi_parse_dt(), as the error is already
> > reported by this helper.
> >
> > No functional change.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v2:
> > - add  Laurent Pinchart review tags
> > - wrap error message to new line
> > - remove error code print in dev_err_probe();
> > - drop error messaage at imx8mq_mipi_csi_parse_dt()
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c    |  6 ++---
> >  drivers/media/platform/nxp/imx7-media-csi.c   | 14 ++++--------
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 33 ++++++++++++---------------
> >  3 files changed, 21 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 088b2945aee33731c565f049dd17721356300b84..ce93d868746f002c22e2f86b1e0aa84ec1a76061 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -1547,10 +1547,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
> >  	/* Now that the hardware is initialized, request the interrupt. */
> >  	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
> >  			       dev_name(dev), csis);
> > -	if (ret) {
> > -		dev_err(dev, "Interrupt request failed\n");
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Interrupt request failed\n");
> >
> >  	/* Initialize and register the subdev. */
> >  	ret = mipi_csis_subdev_init(csis);
> > diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> > index 933a5f39f9f4c9b43ca8d2a1819d0145981266e6..7ddc7ba06e3d4e007013821f67d783898a15461f 100644
> > --- a/drivers/media/platform/nxp/imx7-media-csi.c
> > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > @@ -2218,11 +2218,9 @@ static int imx7_csi_probe(struct platform_device *pdev)
> >
> >  	/* Acquire resources and install interrupt handler. */
> >  	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
> > -	if (IS_ERR(csi->mclk)) {
> > -		ret = PTR_ERR(csi->mclk);
> > -		dev_err(dev, "Failed to get mclk: %d", ret);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(csi->mclk))
> > +		return dev_err_probe(dev, PTR_ERR(csi->mclk),
> > +				     "Failed to get mclk\n");
> >
> >  	csi->irq = platform_get_irq(pdev, 0);
> >  	if (csi->irq < 0)
> > @@ -2236,10 +2234,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
> >
> >  	ret = devm_request_irq(dev, csi->irq, imx7_csi_irq_handler, 0, "csi",
> >  			       (void *)csi);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Request CSI IRQ failed.\n");
> > -		return ret;
> > -	}
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "Request CSI IRQ failed.\n");
> >
> >  	/* Initialize all the media device infrastructure. */
> >  	ret = imx7_csi_media_init(csi);
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 0851f4a9ae52d3096f454da643cfdc5017e000b1..a007c582b4d91660a97910a6a0d53c9b6fcd73e9 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -951,10 +951,9 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
> >  	int ret = 0;
> >
> >  	state->rst = devm_reset_control_array_get_exclusive(dev);
> > -	if (IS_ERR(state->rst)) {
> > -		dev_err(dev, "Failed to get reset: %pe\n", state->rst);
> > -		return PTR_ERR(state->rst);
> > -	}
> > +	if (IS_ERR(state->rst))
> > +		return dev_err_probe(dev, PTR_ERR(state->rst),
> > +				     "Failed to get reset\n");
> >
> >  	if (state->pdata->use_reg_csr) {
> >  		const struct regmap_config regmap_config = {
> > @@ -977,24 +976,22 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
> >
> >  	ret = of_property_read_u32_array(np, "fsl,mipi-phy-gpr", out_val,
> >  					 ARRAY_SIZE(out_val));
> > -	if (ret) {
> > -		dev_err(dev, "no fsl,mipi-phy-gpr property found: %d\n", ret);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "no %s property found\n",
> > +				    "fsl,mipi-phy-gpr");
>
> Do you really need to pass the (fixed) property name as an argument? Why
> not move into the const string directly? I would also rephrase it a bit:
> "property fsl,mipi-phy-gpr not found"

Laurent Pinchart provide comments at previous version. The same
"fsl,mipi-phy-gpr" share one entry at RO region. slice save RO region
space.

https://lore.kernel.org/imx/20251119043307.GH17526@pendragon.ideasonboard.com/

Frank

>
> With that fixed:
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>
> >
> >  	ph = *out_val;
> >
> >  	node = of_find_node_by_phandle(ph);
> > -	if (!node) {
> > -		dev_err(dev, "Error finding node by phandle\n");
> > -		return -ENODEV;
> > -	}
> > +	if (!node)
> > +		return dev_err_probe(dev, -ENODEV,
> > +				     "Error finding node by phandle\n");
> > +
> >  	state->phy_gpr = syscon_node_to_regmap(node);
> >  	of_node_put(node);
> > -	if (IS_ERR(state->phy_gpr)) {
> > -		dev_err(dev, "failed to get gpr regmap: %pe\n", state->phy_gpr);
> > -		return PTR_ERR(state->phy_gpr);
> > -	}
> > +	if (IS_ERR(state->phy_gpr))
> > +		return dev_err_probe(dev, PTR_ERR(state->phy_gpr),
> > +				     "failed to get gpr regmap\n");
> >
> >  	state->phy_gpr_reg = out_val[1];
> >  	dev_dbg(dev, "phy gpr register set to 0x%x\n", state->phy_gpr_reg);
> > @@ -1017,10 +1014,8 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
> >  	state->pdata = of_device_get_match_data(dev);
> >
> >  	ret = imx8mq_mipi_csi_parse_dt(state);
> > -	if (ret < 0) {
> > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > +	if (ret < 0)
> >  		return ret;
> > -	}
> >
> >  	/* Acquire resources. */
> >  	state->regs = devm_platform_ioremap_resource(pdev, 0);
> >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/



