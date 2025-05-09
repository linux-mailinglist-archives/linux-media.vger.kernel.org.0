Return-Path: <linux-media+bounces-32138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68426AB177B
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 16:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8F71896AA0
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 14:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ED722425F;
	Fri,  9 May 2025 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Sbji6PlN"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA621E3DEB;
	Fri,  9 May 2025 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801150; cv=fail; b=eAmDiAQwPLW21QBFwmypTZIQeBhImX6H7FAMiZm1iwI34ODiHN2NOtEyiiw1XLV0u8YUXZwu2bdDR8923HQ0Vl5ha2jax/6VlllL6uvVtBbkK1vixMUxf3DwlusDGAziqsBxoSNro5c4vS1TzvD5WTvbj2edqbx+c0Go3jfUVY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801150; c=relaxed/simple;
	bh=FwByac1ilssuD+D8uVpmN1XzIyEPIyQUaefnBhRM8rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EOsKL/Kr1E49oZpswS5U9qRfpuVc20sf+Qi1XV8GgIeH72mu6bo7f+OhQL1LOzeevsFosSLWeGuZaS6ekm4QGYLPqAJFBvsqSiN+lSDvYFS7gf4y8F/F9t5v9DKxNamdWaibSojwBKYm21s2l4mHXcAQ1fWco9i095JxZMKpR1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Sbji6PlN; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5Msv7MdZM2gFtKt1KYoEr4fuFSGZfYD7ex74auWM0TiUTa0qqFCTpPGgIjGAGsDYSAnmfvWfVgzAQulOg28kUdKo1yytKmQNm8ADNlEWtUpf8IT1X1GgPDZ8YsA5gF/ek9kmjdQiofqNMVCuE2NCa9LvEt8AE96/NIhT689+Iusi1ExzisnD5OyhPC26ZRR84YyNCEyobq9rg9NiQFek+BlSr/o4kgCmbZfXriEnrV4ejFSsDkuJCc/ob9pDyKm/i3LrQTP8bjIfjSpH4jH6GIlDCD5bvQlmXIHp5/FV+pJ2KEPiFjUkeh078edbZ73McjZuzv/G+9B29O2ht1HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jev3WqsRm+yRZKx6whaO4NOABHtig21pgoGASmVfuBk=;
 b=XPtTSXttshE0mrJiHOZdvEI5RqgS3PZtcDflnci6QP1s4q/8ziBVo9MVgpDrVcnEyoo6EaTSdLjZI/b4Erfn31rPWEBQJPtDW844PFxvHqE+tz3bVPhnHp6wleoJQAhaPvIWqDYd0lXwHWGjSqu3MUlq4+09seutsOtPUbLYmhh3bule2qPsMXdak+uTCzbUoPubaxIyR1DfV+8hwVSZVOFfY2wXNLYC9OjTbxmngK9cn9deBvYn9SUdltn+Cz4oCfrkTTzPRz4C4eaWd+diOBms2MpKyRmisQlo/rfDgYjQ0Xyf09sLSvp2TRclHw+d9EP6+H14XokFOdsFDzuTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jev3WqsRm+yRZKx6whaO4NOABHtig21pgoGASmVfuBk=;
 b=Sbji6PlNIkMgMVQiq7W+mvbPhH9iR1TUvL/R5LFrsfbG9Bo1AbeeDhhcFmxbxsU8QAKAshxqn6IcD1MGzGgh8tGDAYZwkQ+LpDlKlN5b0XoBFvvj4h1pVcTqoxbDIFthv9jMLKSqYf/pu/q4mQvmEWBU/9FYCZSm/2oKjqzLJaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY4PR01MB13945.jpnprd01.prod.outlook.com (2603:1096:405:204::7)
 by TY4PR01MB14973.jpnprd01.prod.outlook.com (2603:1096:405:261::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 14:32:23 +0000
Received: from TY4PR01MB13945.jpnprd01.prod.outlook.com
 ([fe80::d31a:b7f3:d305:92bc]) by TY4PR01MB13945.jpnprd01.prod.outlook.com
 ([fe80::d31a:b7f3:d305:92bc%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 14:32:23 +0000
Date: Fri, 9 May 2025 16:32:09 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
Message-ID: <aB4R6WRZr-k_Nfb_@tom-desktop>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
 <aB4OfjTGktdu7Yos@tom-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB4OfjTGktdu7Yos@tom-desktop>
X-ClientProxiedBy: FR4P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::7) To TY4PR01MB13945.jpnprd01.prod.outlook.com
 (2603:1096:405:204::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB13945:EE_|TY4PR01MB14973:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb3ed53-a301-45f0-2fdb-08dd8f064fb4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?D3n3Ct7wle9Wa7lOjN+zSfcRIB6NBVdKjIqtYf2/p//BoG0AfeUGBS0EgKhx?=
 =?us-ascii?Q?ZM45ApIc5EWLhnZTvmcCNZSux4Gh/rxshqSVmzc3fJ1lR/FF9hRg8+GUgz7M?=
 =?us-ascii?Q?3/3f7Fs4sR5D1D2u8/Haza1S+OxkXpJoL6wMmyWGBlhCTtxj0l0Ws/mUhNSI?=
 =?us-ascii?Q?58sHF3oS0Vq2WANokCOueu5GCI/d4RDgnd3GUODJeVeIPeRspP8y022zaoXD?=
 =?us-ascii?Q?tpCBgxhNSckPsuFRU3/LqCMZGAsU5hhmqY/lMJXVPrryU8mkAalAlbceBW+D?=
 =?us-ascii?Q?OUgNU7qQlwVzOHsDAIcwFXmv9XNojj7VvC3e1TPyyXdrDhzMBVM1B7vwI2d0?=
 =?us-ascii?Q?gqW4eGPxpRwWOSc7OfrCfAt9yGAu9czrJPGfBJn9hSUFl+ZjkSlYUKM4b0V3?=
 =?us-ascii?Q?pcqBmeTyNiEZPQ/gDOeFRF1jPtIgBnrxUk6bgKWN3lwQkd0nr9X6S2nr1UqB?=
 =?us-ascii?Q?T5sy4K/ZdFqI2Nmh/MaoEBPnbbPaMpo13oCaG8yE1esyFK7wgRXtnqM0Qyah?=
 =?us-ascii?Q?4BtXN/5jnouRcPOYvP4vHeD5XB9VO1xUFwbP8k0gwdTISzFxwxegJv4/29lj?=
 =?us-ascii?Q?kjgXwHQ3ICn2xi8KhkmjEmCxxUmoxUOZZrAhmuyPslSDA7nRKzzKxtxPe/79?=
 =?us-ascii?Q?hBI6YVFTT7oIJyVH0e41HmgcsbQUxxE9xwuG9fyiTCAxO+cVHvDnlz3tk4HO?=
 =?us-ascii?Q?1YHZYCubzOlAOGqGFqg5ZdT1gTE081b+cRqOASoCvXCdwcEpCbqICwd0YYUC?=
 =?us-ascii?Q?5NdkqqF2al9r7TqPY/nI+1lVJrodO1AmJePlLuHR/V5cyLEtWtKFb4mW8ekF?=
 =?us-ascii?Q?wm6Jtdbh+ECqR1qJA1qSiPqWKfdZI7Rw8m3YNFcIPWHtf9eYUwvuNHZ5Y3mg?=
 =?us-ascii?Q?jspKU4kPBDAkWTIAw2Loky0si2Kj4rscVZNEo9bXzzhul3kFvZ/SZJdk9c4c?=
 =?us-ascii?Q?B0CuRC81I1KW9IXgcp0BseWgXOJVAHIBaZL/9F9O9u7VdMCIeBsYv2jLSBnp?=
 =?us-ascii?Q?foeohTEZrnie+2IlNdkW3wMFpkKWwIt1DTdAruUA2kUnnFcphrxqYnWLieWs?=
 =?us-ascii?Q?QPVZ56oMxaaOUDuQxtVbiD8OLsdwYGMFxSsYZhGhJYRvqj7sZFoKut2tyRVy?=
 =?us-ascii?Q?rFKo7ud3UscVCrHKLUavSVrz349jZfWFtKDGjmPGFhscMMNqRnnUHNaDh4Ri?=
 =?us-ascii?Q?7O5ukROG0jeZZp2ta181hSvmioaCtkG2l0x95BTG4NkBPBIXPXr5pzeA4yDJ?=
 =?us-ascii?Q?fpIrbP7k11Hl1RIToBJ1texR3V94ccqeapRyTcO5HOwUgI9wUI6P1wlaiuVY?=
 =?us-ascii?Q?IboLSAlaGfbUDFBg2Hrw3W/JhzahdA4Oaz5y35kcwcxGKRSsJk+eYMJ2yZIJ?=
 =?us-ascii?Q?UpoUVj2UlToxvZPsSa33FcOPbIP1Oby+mOzS+az+r9k1nS00ACcaMiUgFOWB?=
 =?us-ascii?Q?9QQ9g1+v/3gLiNf90uV/DiHKZnpr4E1rBVLApkJYGZpSpZC1EHgAJQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB13945.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HDq6OSPfKg0ykBAtZwfCMCpjSgeLCLbiggW3BduB3/9xwVmlJhY8jjfPjPGE?=
 =?us-ascii?Q?tfkpfMUcmZ3d62CYTh6WmeiEHov+NYXCsNK333WwGEdxHugBQ0jWJ6WptcDZ?=
 =?us-ascii?Q?ryUkBYnsIOusLQRy5JcVE48aHBbuNEovk3hN85+5mL/2bctn1T2oq/rhGRCf?=
 =?us-ascii?Q?3L4+8+0bn1srX5UG6LuqgxEOglEy4xUJp1+swBYtkbVY5l/cFGXWgmd56VQX?=
 =?us-ascii?Q?zqHyxdEBYvKo5egcWqp1ZzHMlMOF/Mbd5ASNsd+R4iI6ksbkYsofuBZXWZ4t?=
 =?us-ascii?Q?sxn8y4cEfxWf5CcFz/Za+pqVm72edMivuFXEl7yGJw14/z9PLq6UIJRqD3X8?=
 =?us-ascii?Q?0jq1BhD92X+M3zKWV84NrSoQdv5drKic7gEBJibxURarPfGJUw6RUTvLOx2N?=
 =?us-ascii?Q?UdBXIX7lNjrJPuS5BZYiXqI697J+keckYjW4okz8wxrHhKn9bj3j0Nh7bH+W?=
 =?us-ascii?Q?aI40wjgHCIxQyQa7RCygVf1V8z1aj6DmwDV7wiLow+ZlV1u83KnDOah8zGxB?=
 =?us-ascii?Q?oH/JMS4DS5VrQ1w1sCfak7Z4bgoPbTPuruU6xEWWZtDMHmp2S+OiYtgT4X8x?=
 =?us-ascii?Q?XEii09CS8bzRhj/lTLC/1V+vkvjawSQYew0l8BkQrb0qUVOCkvZXvoZziHjB?=
 =?us-ascii?Q?5dQ8KntQlvJEcpl8+/ZstmpaCU5Vn8h8QdC0d0u6D2s/8+ELi9wtbDAHzaPk?=
 =?us-ascii?Q?GBPgLJ43jXe32nRfdXkQ6erR3DvqKhnnWx3+5HzFc9LB0RmbMcFAbnvE8OVy?=
 =?us-ascii?Q?jhNNBlR/yLut4Itx2sg78jQQOQKIDgq4xGnx7TInS6trsG/4T6/kGf2Kfpg2?=
 =?us-ascii?Q?svYY1yeRZb5F6iRBRQVCh1st2JCmaZY+c/AN0pjlV82/U60PEOgbByjlGuTH?=
 =?us-ascii?Q?43G1pbvac2cwp91gOHQcUfxnqWhoo0TCHGK7nTss7ZTHdOOl1LjLFoCqo1EI?=
 =?us-ascii?Q?bimnKR2YLw8lMtZVYuyWhbCGAoT9LVgijx5IWG+JCqNhq3UmGlXUDlroL7iG?=
 =?us-ascii?Q?u3qsI16JiJeyzkm3Ob6Xz+y7cW+JdaO70a5BmskNSOjJe/jty94mQOoAjg9K?=
 =?us-ascii?Q?AKfgCoNxmfyJc42+cWRt9lcIgsvjjBI8ETuQhs+7Y4i8JdIQfpAWz8sr7kjw?=
 =?us-ascii?Q?HKiRnSfMqXGxfmxsK9wf3pt1cmWFVHLH1etNuwbzgYqxnGz2+7uSbNTERLxq?=
 =?us-ascii?Q?S6MMKgIx29j2GjTnajfF/xZCrsUfaxA6aXobQ8Nxa/2bvYOWZtk6TfbkPPc5?=
 =?us-ascii?Q?0G3AH1eSQjV7ZfqhX8qFrRrs4EUaGLopyXQtODrGBuS2fmwLvwwtmv3y2+gr?=
 =?us-ascii?Q?bKwf/ShhZ3MKfdvbuLoCtQguVJNvVRDgJuhXpjSAcIq0GFjo5NxvvcGhiPP/?=
 =?us-ascii?Q?xtIMNZuCm1bZ0kArYVWDLV96HI6qPOCe45TcBHDgtJN5A2ropPXacea8HsCj?=
 =?us-ascii?Q?A2wbtXwNmJWmUEqoB/zBW+N5a9PTglv1UnlpCXEgESgF9HwuuO2sS6lI3X0Y?=
 =?us-ascii?Q?LBtB7va54BxPnlhF/QR+1DCuiWN+djhFqSvF9i6BcRhbH5Ll0E07aX8ULpZA?=
 =?us-ascii?Q?Tf8gDvLs2Ufu3MPRq92up4EHvU8CAAR182iZl1eaw9QcZVz6/jr9LF1gKLwk?=
 =?us-ascii?Q?SuBZd4XYtQeFwuVMpNdDI+Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb3ed53-a301-45f0-2fdb-08dd8f064fb4
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB13945.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 14:32:23.0707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGHbnk0ofzt9R6ZPBI6QSTrcqDq6eAf0CuX5bP6QW139IGsVZhYyLXt5ivdpK3moEuTdhDVuL9JfkFZWFnPm38OwHWuunVtR6xTr2gK17kfnF/O1lFvds71lPaJUanGr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14973

+cc linux-renesas-soc

On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
> Hi Daniel,
> Thanks for your patch.
> 
> On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
> > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > 
> > The rzg2l_csi2_calc_mbps() function currently tries to calculate the
> > link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
> > of the remote subdevice. Switch the function to v4l2_get_link_freq()
> > which correctly targets V4L2_CID_LINK_FREQ before falling back on
> > V4L2_CID_PIXEL_RATE if the former is unavailable.
> > 
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > ---
> > Changes in v4:
> > 
> > 	- Used separate s64 variable as return value for v4l2_get_link_freq()
> > 	  and as the mbps variable for do_div() to avoid compilation warnings.
> > 
> > Changes in v3:
> > 
> > 	- Fixed mbps sign
> > 
> > Changes in v2:
> > 
> > 	- None
> > 
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
> >  1 file changed, 12 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 9243306e2aa9..8870c2cb8104 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
> >  	const struct rzg2l_csi2_format *format;
> >  	const struct v4l2_mbus_framefmt *fmt;
> >  	struct v4l2_subdev_state *state;
> > -	struct v4l2_ctrl *ctrl;
> >  	u64 mbps;
> > -
> > -	/* Read the pixel rate control from remote. */
> > -	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
> > -	if (!ctrl) {
> > -		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
> > -			source->name);
> > -		return -EINVAL;
> > -	}
> > +	s64 ret;
> >  
> >  	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
> >  	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
> >  	format = rzg2l_csi2_code_to_fmt(fmt->code);
> >  	v4l2_subdev_unlock_state(state);
> >  
> > -	/*
> > -	 * Calculate hsfreq in Mbps
> > -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> > -	 */
> > -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> > -	do_div(mbps, csi2->lanes * 1000000);
> > +	/* Read the link frequency from remote subdevice. */
> > +	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> > +				 csi2->lanes);
> > +	if (ret < 0) {
> > +		dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
> > +			source->name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	mbps = ret;
> > +	do_div(mbps, 1000000);
> >  
> >  	return mbps;
> >  }
> 
> I tested this series with an imx219 image sensor connected to the CSI-2
> RX IP of RZ/G3E:
> 
> Some notes:
> 
>  - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>  - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> 
> Then hsfreq should be:
> 
>  - hsfreq = link_freq * 2
> 
> Please correct me if I'm wrong.
> 
> 
> After applying this series. I'm getting the following issue testing the
> imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.
> 
> 
> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
> [  947.305876] rzg2l-cru 16000000.video: Invalid MB address 0xe8bf8300 (out of range)
> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
> [  947.339165] rzg2l-cru 16000000.video: Invalid MB address 0xe8c9e900 (out of range)
> 
> 
> I'm suspecting that this could be related to this formula.
> Let me know what do you think.
> 
> Thanks in advance!
> 
> Tested using:
> 
> root@smarc-rzg3e:~# media-ctl -p
> Media controller API version 6.15.0
> 
> Media device information
> ------------------------
> driver          rzg2l_cru
> model           renesas,r9a09g047-cru
> serial
> bus info        platform:16000000.video
> hw revision     0x0
> driver version  6.15.0
> 
> Device topology
> - entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 <- "imx219 0-0010":0 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none]
>                 -> "CRU output":0 [ENABLED,IMMUTABLE]
> 
> - entity 7: imx219 0-0010 (1 pad, 1 link, 0 routes)
>             type V4L2 subdev subtype Sensor flags 0
>             device node name /dev/v4l-subdev2
>         pad0: Source
>                 [stream:0 fmt:SGRBG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
>                  crop.bounds:(8,8)/3280x2464
>                  crop:(1008,760)/1280x960]
>                 -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]
> 
> - entity 17: CRU output (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video0
>         pad0: Sink
>                 <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]
> 
> # IMX219 TESTING SGRBG10_1X10
> v4l2-ctl -c horizontal_flip=1 -d /dev/v4l-subdev2
> 
> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SGRBG10_1X10/640x480]'
> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SGRBG10_1X10/640x480]'
> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SGRBG10_1X10/640x480]'
> 
> v4l2-ctl -d0 --set-fmt-video pixelformat=CR10,width=640,height=480
> v4l2-ctl -d0 --stream-mmap --stream-count=100
> 
> 
> #  IMX219 TESTING SRGGB8_1X8
> media-ctl -d /dev/media0 --set-v4l2 '"imx219 0-0010":0[fmt:SRGGB8_1X8/1920x1080]'
> media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:SRGGB8_1X8/1920x1080]'
> media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:SRGGB8_1X8/1920x1080]'
> 
> 
> v4l2-ctl -d0 --set-fmt-video pixelformat=RGGB,width=1920,height=1080
> v4l2-ctl -d0 --stream-mmap --stream-count=32
> 
> Thanks & Regards,
> Tommaso
> 
> > -- 
> > 2.34.1
> > 
> 

