Return-Path: <linux-media+bounces-30055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E61A86447
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E88E4C46B1
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C18823372F;
	Fri, 11 Apr 2025 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LYyNucXX"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA986221FA5;
	Fri, 11 Apr 2025 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391313; cv=fail; b=uMj5JlVtD+TJAzkaviY6xw0KePaTJ5utOq8aQCDGR/hPa9MzPFXDiTNqBd8XReBNu3jM/Le2Evo4RKTbmESmGm2blv7KoovAMCGdiygErIfRX80q0/b6TiOeaQC1SQCKq96M7gUqhuYJcNUNVDnlmAqjvG8Tipv5hP/9y3ZAxm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391313; c=relaxed/simple;
	bh=ziwQQErsKES3ti1Of7kxiK1G7p0SU15jnr5Xn4Bimf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LHBn7fgiDS5whgSanij+eEWE2ZVGud6apF1YIqkmztg5wQZoA4OBA4AX7Oe12ktcLrb/x1ZoMP2B1Bb5vpFK8+eDQQUAH1yIW6Zmxz3z4b4rR0ObaCHc1EZhCec5ajTFivKqFc2ONbcV/pLlUYB0017k/xJnBylNwqfPu3e2JYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LYyNucXX; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYrL/cVH/MbQmeKqNmIV51dLBVk6/Uhwg09ZMBapMYO7OwDFqy0BxVIoeW5zjTK3HAKSdNxV8YaDKTQfnLaWWfuHnFUJXrWF8TmywjTr1KTtWdTkSX+WYshg6n45slgI2y9M7Oqd+cfwju6kZfnruiR8HiHHsaIUqnTDj0j6u29hQ3vCj4gpyvU//xEoFiaaBVmmTmcWj+UWYp6XRB5yOqZPCIJ660pfn3kG9F8kbaIlFSG6q7vWIAveU8o0i3cGwxklHrpLIxHidIhKTaiWfe2dBzD4y0Tw1yOT9G9Xvtt6TZYaSoc66L2SS5AkTfyJoHDeImGXk7L//e0n4SXFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMZ8IDB4TW+kO+7ytpbstShCtnuYPmzIIlOw0/ldpk4=;
 b=hllgfY+xIcA1rpncp0ywg0VeoNMp/IK0+kdsH6fAQTibBRlCi7nAb5whrNvHWpKloGFiSYtw5ZOzSu8KIN4NCy6md/IusTbdCGYa34gts8RfU1ljuKZ/qfrfhYqPmFr2Crw4tUxxFGqqgsgbRMFs8YZeMVU4qtf/qhSavKRBsKvqAM/C7WahwsBbl1fO1cbcir15bzNypiOVTcpSVBWWQC4wOTNNsr45xVV0MDwOdtWCpFXAApV7jsAWRQZmBHc/DAv1OF+CePUFA3f/D7hyrwaSrc+87oEzuXOmjq5SoxyWRldKgeVjtFpy7iC33yadfMG552YNRvrMlAlHuWX4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMZ8IDB4TW+kO+7ytpbstShCtnuYPmzIIlOw0/ldpk4=;
 b=LYyNucXXaVUAL4RHpphCP2P3dL1gkfAT+hXkilsDXXzXp+NMXKFx6ermEDiWUA+P5K7Z2YsHLi9VbyOOIA8ojMMkLSfabS3MG/TLHJ4fFwxw3pF6ez1UO3HI2devkxc36tFGZYfWag3YS8rktIOrsUxmCcel47OCZ7UXfYU05es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB12643.jpnprd01.prod.outlook.com (2603:1096:604:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 17:08:26 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:08:26 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 13/17] media: rzg2l-cru: Add image_conv offset to OF data
Date: Fri, 11 Apr 2025 19:05:41 +0200
Message-ID: <20250411170624.472257-14-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB12643:EE_
X-MS-Office365-Filtering-Correlation-Id: 490657d5-eb30-4b9f-e033-08dd791b78f8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AdLfdXI8ilGMXZ2PrzL3XqszPo3nnlqNZX9fzmBwX+FcscInA5yiXel9z2X6?=
 =?us-ascii?Q?uxWoRmmPUHI39Hv7ZZHcm/tpYXzeosiaE4ZA8VVouQA6Ohpm1OxIlIIvZ91l?=
 =?us-ascii?Q?6jh71dadau3C/3m9SRWtu0HIj2U4nm7x8VaRD1HbncXqvNzqMurPv11DzLIK?=
 =?us-ascii?Q?ZY4R1TTosCqjiXWJuGGciZDZkK4k0FHtX0nmj5+0X/O+GIRHYDWyGyWTwW+O?=
 =?us-ascii?Q?Lc7ta2fdP2DJ9Ml4+cxjaSFCoSzbUl1Kv3PS5l3yBpGFxFwpT3YMFSoTFv6A?=
 =?us-ascii?Q?OcLoQ3Tt21VnE7sp4WBEe7vIhXyDdse1zFoRGUsGI7ctT2fbZOMSYgV+yBsY?=
 =?us-ascii?Q?47xTyG2dqB6RFl/P74NJ35FnzfyHLpkOsYah40Ct/rjtq0O2CXYa7WxTMztJ?=
 =?us-ascii?Q?e3Ki4EjbcFbs6+dlw7hgPdgaqpoazMsN3q4dWWx+kZJ5qg1mGFLdZZzgro+Y?=
 =?us-ascii?Q?MgXVMJK8qm6s56gAzkinRqPq3XAgpMnnEOmOMV3P+szw3nNbTtpvU2JUKsyS?=
 =?us-ascii?Q?m7P63Dwavs4xJRThNB95S78gsutZEGS8KDuZ9fS/qsiOOgJAbQDGTfwPwUEj?=
 =?us-ascii?Q?qhjc8HZQ6VLoU+TFnSo+p96N+9lMh67rwUXYJvpm09gW24Di3kv+nxbmPtd/?=
 =?us-ascii?Q?LUGMGxXp9Rny7EbjF0Yr5OgKWJ8OdG3lKBBMkhOJo9OYydBh+CaUVZQ8Lg/r?=
 =?us-ascii?Q?DMyKLRh3aHpUwbuTe+SyxSFyQbWf1SuI3hH6VFM4G+h6eyqtU0DM9Lmz/fnd?=
 =?us-ascii?Q?ikBv1tqvkaZ/Wot/79ip0eF6l62MVQlWLw08LpcplV/jA3fkHB1atiEajYzg?=
 =?us-ascii?Q?r5Csg00Tpz3dPAnGS2Ko3PfKF1MZBMITc60J+zl+Q/dxpEry8wZ3u2VajMxX?=
 =?us-ascii?Q?WK4ASyQeD9CIVwfvjMeNDYSd4S5pvqEV68aVnmh5dkcb0SE6b9zsVNAzznNr?=
 =?us-ascii?Q?Rgq9Vzc6WD+Awj/QXg4WFOlPkp3PSiX+TVO6QFzMjccFyfA7fAynppMJSfh6?=
 =?us-ascii?Q?Nz/YI56tdNsr36AtdmPq6GFAJX0+Sx+It/52dtD1oTTc3EOUtjfhD6/zzmmz?=
 =?us-ascii?Q?98r54VJBBxreS7Cq0eTvqgmgGaXGbM6afhHlMUpmxqji8BW22KSydoptwp0f?=
 =?us-ascii?Q?Na3eLRb9fIX1K9gOwJp3m/EhMTc3H26ZlLOKhPdj6QI2mN2FcBUdArniE0Zw?=
 =?us-ascii?Q?Q3Xb0AzSy08phnnJj3fMp+Jsc2BV3fjhwn2oDMSJ9lpWNoPpKkJK+gWBiHW2?=
 =?us-ascii?Q?xHVSsF76+bMNf5Cv7xKz5o9L46wX1EMcxWincxIDs06wu2PxJ4ba2JRsqODL?=
 =?us-ascii?Q?hv4nF6gQxbEvRgxhJGb7YWim5NUDrOcU8D9ubYfkkSe6xuN0YHB8JRRNvFZ7?=
 =?us-ascii?Q?mauXWXGcF3essNm/623v5YnS7rMUxIMPJycZG0w2vAUZYjMl7mwXo/S/IWJj?=
 =?us-ascii?Q?jFKpryx5LvFpqhiW7BPL0IpxqAnsxY4m3e26al7dPWbtv0BPiE9XJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?00dq3KZyEBbR7qsS89iy1byQo6A4Kj+dHv7+eSM2QMoUTNfK146nbu0Ov0HY?=
 =?us-ascii?Q?DjqsB6gk62dMFLFcBO6bs03EaB7rNqE3Tv6S3Tz+/rf63bcvOutNZTiypNJQ?=
 =?us-ascii?Q?yPZOb/RdVmYQum0vi4IIcPbMvalvVgMLs1WvEazHIT29i/g2wk+lKO472Igg?=
 =?us-ascii?Q?aQz81/4CEhn2+ouMW0JaOw12/TJGN4sewXk3XguAkIXVVKVxtgZzISsw/RSS?=
 =?us-ascii?Q?yMarnkFCc+g45Va8pdUlpitHBifnRCayHAZI6I+FfAjshaz+Z9XRBDoBpdAG?=
 =?us-ascii?Q?IHcFpFLTQ45P8/WZCFqNgtPMCR1kMe/4GjYVo8sttYCc4gPcAu22gnA/eEMx?=
 =?us-ascii?Q?7QBDpqZ2SsYXLy8H9tnlg1MjLkhyKXkppXuEs3xveD5f9hc4B5x8RL/u6aXD?=
 =?us-ascii?Q?Au+HTCNNjRIv1cdyFQt8hoo8ZbWS5cDh+SilAh02G3I9RyeYpaKP7ySFwKcn?=
 =?us-ascii?Q?jk2vw5jcQwHodQY8Rdx17dlcvrpfd4oxpOfd3cswFWiUFQ3peC0Xt3EcReXn?=
 =?us-ascii?Q?t8aHPL1VVpJ8W3c9RpHT+DmwSFwDt9QXPyLCEHX3At9co6bjoXD9XFCqaG8O?=
 =?us-ascii?Q?70hmRCJkmcuDuirV63LT85th/yTh9vXwLq2uplRBoClOejZqk8gMxooQUAZR?=
 =?us-ascii?Q?Rri5dFRPM9WP3bLHqyatRWQbEFccF/T8jzIbF3/Nr1rfiTXPVKy+H0nHuLOw?=
 =?us-ascii?Q?fc2HNhncWzuIh75ijJ/cKW0xyfLQtPo32fZCiJFziVQ3G5XjlfKNYqETSQsY?=
 =?us-ascii?Q?sGqVmpFEfr/SbntTMyjed6t9wwUMCjIEPYxWQTxTgin/i9wdVv4B9MYtYnbG?=
 =?us-ascii?Q?laTCc1sVSn8WsZuBfGo17t2DaIH4CzRnSdHdiftRWjq3rgIaoBAUQed4PI1/?=
 =?us-ascii?Q?ydWmoC1RHCfbAp0N/CR4dNZLvJn2uvHlMPqs+fBhJsafCPTv7RrByMMNYvcD?=
 =?us-ascii?Q?+rlgLCkOFHdYSlgA37U+P4PajBQuYQW295dL3TtGUSjxdJ4B+ZvqLmolj4No?=
 =?us-ascii?Q?UzGVzIjijLqTbCX2jeQijjBAx/0oNxyX/v4jat2XM5Y0gPZsLr1bQuX6dzf3?=
 =?us-ascii?Q?5/6N3n9Kk/YujhzlcqHUNuR7RMdlS3zAemP5w6uSzb6auzBvl7XE4w8NY7tQ?=
 =?us-ascii?Q?xtMzLMqmJIvsN0pbNBs6JWwkdpyZLERN3ip3T8Kz36IQVhDXeEU/cBb1ed6M?=
 =?us-ascii?Q?BbPICKyK+VqSvfF51v+yD4LERqHTma3LVfpfngS3BwGvFzy43vEDpY/Zr3mS?=
 =?us-ascii?Q?KMOcKpb7PTQ8f3+xyDCiLateL2tR/rMtZpCZuki+QAYhcZ1MJJA5xtm8NKjr?=
 =?us-ascii?Q?C3rkkb462U4FAkiVBQIFD5ajphHRE2dxvD2bUSeaz0P6cixpuA0A5IzA230Z?=
 =?us-ascii?Q?TZoOVBt5LmzjpaCM+tLXnVjy+iDOqVcDrr5ofCiDPkUcZ6crkbhX8PVaWHWi?=
 =?us-ascii?Q?cCx4cg0i9pkcT6aJrnoLXUuiX+Oh44MrjYCsNtamV90AV/ICLtKL4g65Ug0Z?=
 =?us-ascii?Q?GfYJY6NFkTJ2jGHKx6/N4jYrYq6DajViDK2FD3rm42CNjPXV2wqOme9PttQt?=
 =?us-ascii?Q?VQfUhAEJtT6pYyVrCJkuDrwB094lcC9w/tyX/p5dhl4RpiMUdC+A8g5lG2pV?=
 =?us-ascii?Q?CpDLKpSO4+eavM0xcIUoKqg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490657d5-eb30-4b9f-e033-08dd791b78f8
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:08:26.0424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgjIYpprFOAH+EvgqqYTV1lLIMRlzbYniWJqWHbYxDwuS/Vfek+DKh32FZ9CGj6OMwuYiDLE9sO2CXyL0Rv6HplbEGk8VSVLb5rstsdrmVrDwZb+KxoUocL4tLNpFcRQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12643

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `image_conv` field to the `rzg2l_cru_info` structure to store the
register offset for image conversion control. RZ/G2L uses `ICnMC`, while
RZ/G3E and RZ/V2H(P) use `ICnIPMC_C0`.

Update `rzg2l_cru_initialize_image_conv()` and `rzg2l_cru_csi2_setup()`
to use this `image_conv` offset from the OF data, facilitating future
support for RZ/G3E and RZ/V2H(P) SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v5:
 - Collected tag.
 - Dropped unnecessary outer parentheses in rzg2l_cru_csi2_setup()
   and rzg2l_cru_initialize_image_conv() as suggested by LPinchart

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e179f8d29038f..e7fef7f3f8223 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -354,6 +354,7 @@ static const u16 rzg2l_cru_regs[] = {
 static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
+	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 6a621073948aa..ca156772b949b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -81,6 +81,7 @@ struct rzg2l_cru_ip_format {
 struct rzg2l_cru_info {
 	unsigned int max_width;
 	unsigned int max_height;
+	u16 image_conv;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 395c4d3d0f0fa..95cce250b3272 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -246,20 +246,22 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 const struct rzg2l_cru_ip_format *ip_fmt,
 				 u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
+	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
 
 	/* Set virtual channel CSI2 */
 	icnmc |= ICnMC_VCSEL(csi_vc);
 
-	rzg2l_cru_write(cru, ICnMC, icnmc);
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
@@ -276,11 +278,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
 	else
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_CSCTHR);
 
 	/* Set output data format */
 	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
-- 
2.43.0


