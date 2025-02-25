Return-Path: <linux-media+bounces-26938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6E4A43D86
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB26A3A16EE
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 11:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14034267AF2;
	Tue, 25 Feb 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q+ghI5Rv"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F859266B5E;
	Tue, 25 Feb 2025 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740482541; cv=fail; b=o9UI47/ZA4q20wYPx0nPO5oFjGVFcZQeG1NTxmXHTJjTi3SnmoiVbh2t4Xyw1eMNJItQV8NV9oVE6FI/CAmakvqptmvM1qpbjwi1o51FBf+JUufketRcYnq8dvP8/Y78LGWHCBhU13pXfJ5xsJRWkzZiUwsGoFCaLQ7x08VQO5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740482541; c=relaxed/simple;
	bh=3kYcCPsbmAyU8VmlnhgyjkMRl6sOVxV8HbQhh5wx7w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K35SC+4HUW4p0Og6hvVtK2UbWUKNFVEvk5QeBVo+9N7n6pVjGYmWTHWlCieQLkpK7+lKdKRCpq0h/waQUneoz1i66Cl9iV+WprcXdndVfl5OT3bN9zgtY/udZINlG77LbcAGR5CvKKrUku7+NocKhsOZgIRT9R76RxlF+arp3TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q+ghI5Rv; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XP/LWla0j5XuwsQI7TIrIiKoQy0N5YghgkW5Iy/AeePSyuqFUJw4aSvaU3Bcs5JfrrZGOuhn3ZSqAoHOBBpOzXn20+y/JagmOcsqaSilnEqnvNcRE4h420YC5BYAIrfstc+2HdapO1ioDnbMvwWSP09m6sDngFuVYxldaU0HrapTqCdjVQLjMMcGpEQgiOU30MVIC3Pb7wESO8iICyuyFFL4nKR/RkXLmCh3niOnrW8z6ao3X2HQjtpnyVYLl+PxhCYOULsLUoawkcNwXMHrhferIe9VnuV5ZhLHeiSJ+wveEHrKIq6542Y6I1EgVjLJOPAllft2aatqrvQLkV5BmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EY7Jd9gN+dp8Y0302OxBIZr++oTggUdlXb2u1Q74wE=;
 b=Zmmz7OHbBKrSpjGd4bHvZ8MFHoPu/+TyC+2/GauZabfOMdpV9/GTpWar9ZFm5jdf5U9AJ9jgadlwY3kORw3LWc0mn6ung9el+iFeO0FyGa6ba9Do5PNAieCrHII+31D1QleQZcrKjl2P5MLHSmQWZV2/wPf/jwnHqdshxOUzkrKKPXJvqao8XWj8+wEQizA6E8E4EJSPG2Uz0F6M3mDI8Bh5uxOtdNw4HJJBuDU5ITl4VXfnqEUwpF7jJlUvrVfZ5aQa4x6vG+YlvXVRszj7p8G0IITJa9RBvY2GZciUR1Sg81qzCSSUee1fQSqLu9kNKglsqcaUPKTNCgTOXOdBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EY7Jd9gN+dp8Y0302OxBIZr++oTggUdlXb2u1Q74wE=;
 b=q+ghI5RvJNZveclZDuKTmOIONYzQRBIfchDq1NKEnOrRuzrxYgCj6KUOe821nxExkRuEeDrjedL24EWIo756+rkN0hIdZEadcLA5wn+iwRocsDc6cs7M52Geh6mXi3gA7iLnh1fy4smOMByS3hTOCDf29omGtZA5Pgbu40fXhs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB11241.jpnprd01.prod.outlook.com (2603:1096:400:3d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 11:22:14 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 11:22:14 +0000
Date: Tue, 25 Feb 2025 12:21:57 +0100
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
Subject: Re: [PATCH v2 11/18] media: rzg2l-cru: Add register mapping support
Message-ID: <Z72n1XPofyYAzCKl@tom-desktop>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-12-tommaso.merciai.xr@bp.renesas.com>
 <20250223195232.GF8330@pendragon.ideasonboard.com>
 <Z7x4MDVQ_JxeNllA@tom-desktop>
 <20250224184416.GE6778@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224184416.GE6778@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR4P281CA0449.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::9) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB11241:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e15ae31-c629-44a8-a067-08dd558ea779
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Ys3w9/GaWtF4ZknOWt5HEW4weRZAOzfebhU2BnvH9N0Go3ZNUIRlXZLPwmBB?=
 =?us-ascii?Q?bUWf6X+QGnR7Bs1zuCaI5smBy4xraVs+nEACAE4U7y/XAt0tFmGDPiOURCVq?=
 =?us-ascii?Q?Ax9U3/Cbmo5/2OTCz8Od+mVpudfNUx6rmAR92fdl2ZCf1LwBNyn0Vk7Pcj92?=
 =?us-ascii?Q?zsvAvPJHWgEUrY2U7x0Kt/s6q62NnwjmG4fCNUYcaiBwuX0QzjLG4jk6iKDc?=
 =?us-ascii?Q?ek1zJrl6zPuFezy6f/r/LQWX6shBuzMYHmmYmDPgNNypsLG+V2gv0DKkW58l?=
 =?us-ascii?Q?b8XXUdUOx4JirNrrrJpWq+NnUsdxB2USDKV6J0uvlrPNewnlHIQC4k47lC0r?=
 =?us-ascii?Q?9Pn5mnrlZr4pNXrHxPWpa38WU8NiEHfwLQ9ltgEMCbS27K/FL7tEZnwnjwmr?=
 =?us-ascii?Q?rvEnfDtKjVmoT6Vcar3iCn8X7c0WUZK2+a1CdEZrbcQKNRqNkj4sQcGG1Wh+?=
 =?us-ascii?Q?ZEGkURUJXwE1GGhGOiOrO11TOKL74f5cSMBm9Lf+4E2nw/BT+EJW7OnOYYXK?=
 =?us-ascii?Q?5FZiXFwT6C4muXQvdqf5JK7OWTjwUKIqnOtorWU/nTxnSLT9ZW6mM9lGdfDY?=
 =?us-ascii?Q?wnzjh93V2s4oQpvu1nk2EXp+82G5vmKIi82h7ykqpQhQ5tTPp8J2UpZlfcmL?=
 =?us-ascii?Q?IClQCCdQln9NwEHpoeHnr5xbDY8Z7oZukhxFIdBwDuLofcxebfen2T2ur2KR?=
 =?us-ascii?Q?K6yk5nNHCo1dzyhuq/WeTJsEFI/Pjo3nUUMMEpdoRmXqtO9I1HPtBhUPSlRm?=
 =?us-ascii?Q?aRMR6AgGzJ+06Q5JpSsQkRg6NnY6Z+OJIUPPOla0XDAomLK3NQWwH/oOuxbY?=
 =?us-ascii?Q?ICvFSylVnQkcOiUSMRNtiCSLOL7D3tr0DGuELs+ovAp46KwEwNjei9H937E1?=
 =?us-ascii?Q?ov40UxrkSMxo+NfHT3ruHPp3lHJVFH3oIe9zLqqcoKV/QuSp90YTqotS1zHt?=
 =?us-ascii?Q?Vw0cDA1ggT4UfnfRtwWgRLLlQOrXJTsWSdNTs1egRnVg07OiqKb+86+2ShNY?=
 =?us-ascii?Q?NG93/EISG66OHEVyBt4BmcCqKXg0QltOmtXj4fV9brWCQcrRQvFaZWQQW22p?=
 =?us-ascii?Q?sGdHnVa81o7ULrgirGszJi/Q1Vo7X8mypGprUQVaRw++csCyLaLc82ijeDG/?=
 =?us-ascii?Q?uCncMGdmrs97tH3enOKfU3huZNvo8kM5PuRq4x/KotrUicPGh9nvaSNa2rB5?=
 =?us-ascii?Q?Om5pmjueP0UP4lz3/b1nEyYCmiNGnqzYiIFR8MFwjIMAS2bm7WaTSFP6VgTh?=
 =?us-ascii?Q?ioRVvjal7TLSA/98t7xAjt+Hs54t6ISGAyq/dqqXVlkWPMdtqn2wbfgipeoj?=
 =?us-ascii?Q?tYoNgz+tWSIS4uA1j7Pasc4Ok8dPTvxEIUas9a+cDrtHutAIsEvA6jA4sVLs?=
 =?us-ascii?Q?TU32vIjKm2OUPFJn9kdmpwj08wLfq/oIMULf9u+A/ObYMaon4rK9haxULAlm?=
 =?us-ascii?Q?hhttBsjoPrAgQ1mPUuESxs0MGs7azroC?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1T2PCq0r418s6nS3as8vWJMejudBIFvlAUMjTskePSkjweu4PITxB5Boe4Zd?=
 =?us-ascii?Q?b9ZfuWqV+nhJ8aoc+qkhn279HJGizO0f5tkcAVGdsVp+4kmxxXlv29FHngFV?=
 =?us-ascii?Q?+gLOQZrdmwkvmXZnKkoWYyu75jpSJ0oq7G3gHBYRDsjUln6ww/OEzzXRarJL?=
 =?us-ascii?Q?OrQwqPFGBVYJ3x0DSAcRU+oGhQMozEDJgPZvm/KvWa2SqdLgJtHf3sMal7y1?=
 =?us-ascii?Q?uP6ZWXrRD8BDa03nixPEK1wc0k8kqXPRn2Mj2luhNNU0pDc5ghfoiBfBoCNj?=
 =?us-ascii?Q?8fvlkVpnlv2A5z7I7HQeWqzjISDPlBlRfSoD86Y5OhE4RzatFuRZg6wTfVri?=
 =?us-ascii?Q?zyx/S2spg7/CJ/IiAZ5bs0Apu43+vXuqMoYaTyBhZcxqCmq5Yi0K7qbhqxVS?=
 =?us-ascii?Q?ScOXmRPRtt46eq9q8VOu4kNClAkFvTt2r4Ht/whe/Ltbvmn1Z7QSVa+5u0XI?=
 =?us-ascii?Q?iNqIRAkwtyfS/gS3ak5LXGCucnMHGTUIDbWkYhHIuCrftLwvnlR4J8Bvn8/t?=
 =?us-ascii?Q?tryWhQMZtCvV8y2EDI0JhlPy8qs3A9tlSBZGn42gKuecdleK95LidF1Em/lV?=
 =?us-ascii?Q?/Afizypi2Nw4fSl6XC2ixLybGsv86Tk6wOF4pGCSspAL8hG8m+54gZMOGOK9?=
 =?us-ascii?Q?M1e9+wNpykyu4NCNSrJjBfI9VqSO5xpUhtlCK4vCr9LNYIDVNesduOKHaRz8?=
 =?us-ascii?Q?9x67Y7d328n8FAeXFKCw/jfveWlIGGf6x1VLG4qUO2TXdnXN9RcIlStkhp4u?=
 =?us-ascii?Q?qHSz3TV91wCY9gZF6c3El58e4ryyHKzOHzJlOmxG1oh1WDR3cdi6ZDlspxMt?=
 =?us-ascii?Q?Zpi4FZHoLpLvieBfJGRZmQ3jijpbyGw4jBovQTXiidKqy5becYwhSO3D+v+D?=
 =?us-ascii?Q?45efviHm6cre/FDHpKFLwZ3E1wN7wqNrA7f+OuFokuC9IzFPX33Sc+yKgCem?=
 =?us-ascii?Q?CaaWI2To1CJHQPTr/3Ok6OlmB7lZah7etY48ECh9PFU0ATbTKwtTrhaIuqSZ?=
 =?us-ascii?Q?k8iLcMJFrL+/WHpe5wb2k/k3nlwd3nRct26zHnlqJNdy5LTo2/q0cW+xMwBJ?=
 =?us-ascii?Q?jET/HZwz3KrsOYRSnhYR6QyjWNjJg93Xg/QKxke1V+Ty6JNfnP39lK14dX30?=
 =?us-ascii?Q?VpIPh12NLof9+9+lnHCE1vgZYuX2bJ48ixWvdn7V8S6+kpmwaHRGOE2D3l+v?=
 =?us-ascii?Q?DLtNkp1ShoWHXi5DPF9lcKESMGm5jdQdubG4ipDObailpjHzSlh+2cRuLHn1?=
 =?us-ascii?Q?Gx64GSdlp9gIyw5/M4aUapzIZFaHE0RqfyDrniGJcLWZu6oSaimhjbHMpZnp?=
 =?us-ascii?Q?Bo65o3g8R2vWonNz8+q1gLiYwHDLAWJvi9mvLGLUtavawFBKyL5S77DEOlao?=
 =?us-ascii?Q?ZYlFrus6Im+yesADnpRa9c0aJmliOTeFit2zprG4BCIn7BUhL/TMTKKApzYm?=
 =?us-ascii?Q?xJhCjd46at0Zo8VbtnUXK0FKmddTB3r+zYHPwrnEg9GMWEsupw8sAUVY6RLn?=
 =?us-ascii?Q?vcI4SC2TbmOle2kEITTeKpH00Qc6Ueot25WgdowCHrSBm2SUjtSsPPedq6oY?=
 =?us-ascii?Q?+8snClYianAKz24VPx8OurQ0CFqX4Exr5f0gfgg3GoPx4ao/fm5CyUoOPkPQ?=
 =?us-ascii?Q?JKUDbyVGg9tpp2aTp22I6/s=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e15ae31-c629-44a8-a067-08dd558ea779
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 11:22:14.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO4h7dZeuNFbQHkN175KHCxzwo3ammGQVPLlfDyWCZPsqINyitTG3okbn6HavoCLsW4fNhXcRPTxilmCjiBQZnFjR4HUedel7/Uf+IU/SusSGanw0MPSm0bdzA2zTD8W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11241

On Mon, Feb 24, 2025 at 08:44:16PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 24, 2025 at 02:46:24PM +0100, Tommaso Merciai wrote:
> > On Sun, Feb 23, 2025 at 09:52:32PM +0200, Laurent Pinchart wrote:
> > > On Fri, Feb 21, 2025 at 04:55:25PM +0100, Tommaso Merciai wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > 
> > > > Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
> > > > CRU-IP that is mostly identical to RZ/G2L but with different register
> > > > offsets and additional registers. Introduce a flexible register mapping
> > > > mechanism to handle these variations.
> > > > 
> > > > Define the `rzg2l_cru_info` structure to store register mappings and
> > > > pass it as part of the OF match data. Update the read/write functions
> > > > to use indexed register offsets from `rzg2l_cru_info`, ensuring
> > > > compatibility across different SoC variants.
> > > > 
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
> > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 65 ++++++++++---------
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 12 ++--
> > > >  4 files changed, 92 insertions(+), 35 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > index eed9d2bd0841..abc2a979833a 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > @@ -22,6 +22,7 @@
> > > >  #include <media/v4l2-mc.h>
> > > >  
> > > >  #include "rzg2l-cru.h"
> > > > +#include "rzg2l-cru-regs.h"
> > > >  
> > > >  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
> > > >  {
> > > > @@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > > >  
> > > >  	cru->dev = dev;
> > > >  	cru->info = of_device_get_match_data(dev);
> > > > +	if (!cru->info)
> > > > +		return dev_err_probe(dev, -EINVAL,
> > > > +				     "Failed to get OF match data\n");
> > > >  
> > > >  	irq = platform_get_irq(pdev, 0);
> > > >  	if (irq < 0)
> > > > @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > >  	rzg2l_cru_dma_unregister(cru);
> > > >  }
> > > >  
> > > > +static const u16 rzg2l_cru_regs[] = {
> > > > +	[CRUnCTRL] = 0x0,
> > > > +	[CRUnIE] = 0x4,
> > > > +	[CRUnINTS] = 0x8,
> > > > +	[CRUnRST] = 0xc,
> > > > +	[AMnMB1ADDRL] = 0x100,
> > > > +	[AMnMB1ADDRH] = 0x104,
> > > > +	[AMnMB2ADDRL] = 0x108,
> > > > +	[AMnMB2ADDRH] = 0x10c,
> > > > +	[AMnMB3ADDRL] = 0x110,
> > > > +	[AMnMB3ADDRH] = 0x114,
> > > > +	[AMnMB4ADDRL] = 0x118,
> > > > +	[AMnMB4ADDRH] = 0x11c,
> > > > +	[AMnMB5ADDRL] = 0x120,
> > > > +	[AMnMB5ADDRH] = 0x124,
> > > > +	[AMnMB6ADDRL] = 0x128,
> > > > +	[AMnMB6ADDRH] = 0x12c,
> > > > +	[AMnMB7ADDRL] = 0x130,
> > > > +	[AMnMB7ADDRH] = 0x134,
> > > > +	[AMnMB8ADDRL] = 0x138,
> > > > +	[AMnMB8ADDRH] = 0x13c,
> > > > +	[AMnMBVALID] = 0x148,
> > > > +	[AMnMBS] = 0x14c,
> > > > +	[AMnAXIATTR] = 0x158,
> > > > +	[AMnFIFOPNTR] = 0x168,
> > > > +	[AMnAXISTP] = 0x174,
> > > > +	[AMnAXISTPACK] = 0x178,
> > > > +	[ICnEN] = 0x200,
> > > > +	[ICnMC] = 0x208,
> > > > +	[ICnMS] = 0x254,
> > > > +	[ICnDMR] = 0x26c,
> > > > +};
> > > > +
> > > > +static const struct rzg2l_cru_info rzgl2_cru_info = {
> > > > +	.regs = rzg2l_cru_regs,
> > > > +};
> > > > +
> > > >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > > > -	{ .compatible = "renesas,rzg2l-cru", },
> > > > +	{
> > > > +		.compatible = "renesas,rzg2l-cru",
> > > > +		.data = &rzgl2_cru_info,
> > > > +	},
> > > >  	{ /* sentinel */ }
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > index 1c9f22118a5d..82920db7134e 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > @@ -10,71 +10,76 @@
> > > >  
> > > >  /* HW CRU Registers Definition */
> > > >  
> > > > -/* CRU Control Register */
> > > > -#define CRUnCTRL			0x0
> > > >  #define CRUnCTRL_VINSEL(x)		((x) << 0)
> > > >  
> > > > -/* CRU Interrupt Enable Register */
> > > > -#define CRUnIE				0x4
> > > >  #define CRUnIE_EFE			BIT(17)
> > > >  
> > > > -/* CRU Interrupt Status Register */
> > > > -#define CRUnINTS			0x8
> > > >  #define CRUnINTS_SFS			BIT(16)
> > > >  
> > > > -/* CRU Reset Register */
> > > > -#define CRUnRST				0xc
> > > >  #define CRUnRST_VRESETN			BIT(0)
> > > >  
> > > >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > > > -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> > > > +#define AMnMBxADDRL(base, x)		((base) + (x) * 2)
> > > >  
> > > >  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> > > > -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> > > > +#define AMnMBxADDRH(base, x)		AMnMBxADDRL(base, x)
> > > >  
> > > > -/* Memory Bank Enable Register for CRU Image Data */
> > > > -#define AMnMBVALID			0x148
> > > >  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> > > >  
> > > > -/* Memory Bank Status Register for CRU Image Data */
> > > > -#define AMnMBS				0x14c
> > > >  #define AMnMBS_MBSTS			0x7
> > > >  
> > > > -/* AXI Master Transfer Setting Register for CRU Image Data */
> > > > -#define AMnAXIATTR			0x158
> > > >  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> > > >  #define AMnAXIATTR_AXILEN		(0xf)
> > > >  
> > > > -/* AXI Master FIFO Pointer Register for CRU Image Data */
> > > > -#define AMnFIFOPNTR			0x168
> > > >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > > >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> > > >  
> > > > -/* AXI Master Transfer Stop Register for CRU Image Data */
> > > > -#define AMnAXISTP			0x174
> > > >  #define AMnAXISTP_AXI_STOP		BIT(0)
> > > >  
> > > > -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> > > > -#define AMnAXISTPACK			0x178
> > > >  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> > > >  
> > > > -/* CRU Image Processing Enable Register */
> > > > -#define ICnEN				0x200
> > > >  #define ICnEN_ICEN			BIT(0)
> > > >  
> > > > -/* CRU Image Processing Main Control Register */
> > > > -#define ICnMC				0x208
> > > >  #define ICnMC_CSCTHR			BIT(5)
> > > >  #define ICnMC_INF(x)			((x) << 16)
> > > >  #define ICnMC_VCSEL(x)			((x) << 22)
> > > >  #define ICnMC_INF_MASK			GENMASK(21, 16)
> > > >  
> > > > -/* CRU Module Status Register */
> > > > -#define ICnMS				0x254
> > > >  #define ICnMS_IA			BIT(2)
> > > >  
> > > > -/* CRU Data Output Mode Register */
> > > > -#define ICnDMR				0x26c
> > > >  #define ICnDMR_YCMODE_UYVY		(1 << 4)
> > > >  
> > > > +enum rzg2l_cru_common_regs {
> > > > +	CRUnCTRL,	/* CRU Control */
> > > > +	CRUnIE,		/* CRU Interrupt Enable */
> > > > +	CRUnINTS,	/* CRU Interrupt Status */
> > > > +	CRUnRST, 	/* CRU Reset */
> > > > +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > > > +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > > > +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> > > > +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> > > > +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> > > > +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> > > > +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> > > > +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> > > > +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> > > > +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> > > > +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> > > > +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> > > > +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> > > > +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> > > > +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> > > > +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > > > +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > > > +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > > > +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > > > +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > > > +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > > > +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > > > +	ICnEN,		/* CRU Image Processing Enable */
> > > > +	ICnMC,		/* CRU Image Processing Main Control */
> > > > +	ICnMS,		/* CRU Module Status */
> > > > +	ICnDMR,		/* CRU Data Output Mode */
> > > > +};
> > > > +
> > > >  #endif /* __RZG2L_CRU_REGS_H__ */
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > index 8b898ce05b84..00c3f7458e20 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
> > > >  	bool yuv;
> > > >  };
> > > >  
> > > > +struct rzg2l_cru_info {
> > > > +	const u16 *regs;
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct rzg2l_cru_dev - Renesas CRU device structure
> > > >   * @dev:		(OF) device
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index cd69c8a686d3..f25fd9b35c55 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -44,12 +44,16 @@ struct rzg2l_cru_buffer {
> > > >   */
> > > >  static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > > >  {
> > > > -	iowrite32(value, cru->base + offset);
> > > > +	const u16 *regs = cru->info->regs;
> > > > +
> > > > +	iowrite32(value, cru->base + regs[offset]);
> > > 
> > > Should out-of-bound accesses be checked ? Ideally that should be done at
> > > build time, but in some cases that may be hard. Maybe rzg2l_cru_write()
> > > and rzg2l_cru_read() could implement compile-time checks, and
> > > __rzg2l_cru_write() and __rzg2l_cru_read() could be used for the cases
> > > where checks are not possible at compile time (for AMnMBxADDRL and
> > > AMnMBxADDRH as far as I can see).
> > 
> > What about using:
> > 
> > static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > {
> > 	const u16 *regs = cru->info->regs;
> > 
> > 	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > 	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > 		return;
> > 
> > 	iowrite32(value, cru->base + regs[offset]);
> > }
> > 
> > static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > {
> > 	const u16 *regs = cru->info->regs;
> > 
> > 	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> > 	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> > 		return 0;
> > 
> > 	return ioread32(cru->base + regs[offset]);
> > }
> > 
> > static inline void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> > {
> > 	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > 	__rzg2l_cru_write(cru, offset, value);
> 
> If there's already a check at compile time, we shouldn't incur a
> performance impact at runtime. I'd do
> 
> 	iowrite32(value, cru->base + cru->info->regs[offset]);
> 
> here. Same below.

Got it, thank.
Will update that in v3.

> 
> > }
> > 
> > static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > {
> > 	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> > 	return __rzg2l_cru_read(cru, offset);
> > }
> > 
> > And use rzg2l_cru_write, rzg2l_cru_read where check can be done at build
> > time, and __read/__write functions where check can be only done at
> > runtime.
> 
> Is there a way we could use a common macro (e.g. rzg2l_cru_write()) and
> use __builtin_constant_p() to dispatch to __rzg2l_cru_write_constant()
> or __rzg2l_cru_write() ?

As you suggested I'm going to use:

#define rzg2l_cru_write(cru, offset, value) \
	(__builtin_constant_p(offset) ? \
	 __rzg2l_cru_write_constant(cru, offset, value) : \
	 __rzg2l_cru_write(cru, offset, value))

#define rzg2l_cru_read(cru, offset) \
	 (__builtin_constant_p(offset) ? \
	  __rzg2l_cru_read_constant(cru, offset) : \
	  __rzg2l_cru_read(cru, offset))

In v3, thanks.

> 
> > > >  }
> > > >  
> > > >  static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> > > >  {
> > > > -	return ioread32(cru->base + offset);
> > > > +	const u16 *regs = cru->info->regs;
> > > > +
> > > > +	return ioread32(cru->base + regs[offset]);
> > > >  }
> > > >  
> > > >  /* Need to hold qlock before calling */
> > > > @@ -132,8 +136,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> > > >  		return;
> > > >  
> > > >  	/* Currently, we just use the buffer in 32 bits address */
> > > > -	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
> > > > -	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
> > > > +	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
> > > > +	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
> > > 
> > > This seems fairly error-prone. The first argument doesn't seem to be
> > > needed.
> > 
> > Sorry I don't completely got this.
> > Please correct me if I'm wrong.
> > 
> > I think cru argument is needed here has AMnMBxADDRH macro is returning an
> > index of rzg2l_cru_regs[] and not the real address.
> 
> I meant the first argument to the AMnMBxADDRL() and AMnMBxADDRH(),
> sorry. Can it ever be something else than AMnMB1ADDRL or AMnMB1ADDRH
> respectively ?

Agree we can just use:

#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)

Will use this in v3.
Thanks.

> 
> > Btw with the changes above here we can use:
> > 
> > 	__rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
> > 	__rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
> > 
> > That is checking for out-of-bound accesses at runtime.
> > 
> > What do you think?
> > Thanks in advance.
> > 
> > > >  }
> > > >  
> > > >  /*
> 
> -- 
> Regards,
> 
> Laurent Pinchart

Regards,
Tommaso

