Return-Path: <linux-media+bounces-27389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C8A4C6CC
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D09C7A3C11
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6E923ED69;
	Mon,  3 Mar 2025 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XVcj9nqm"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8F721B9DC;
	Mon,  3 Mar 2025 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018217; cv=fail; b=a4L+Q19fVBBDoWZKFJhBA7mT04hGNm/o7maGXEEQT9bq/sjCCHkXS2q+dS4Mdm6iSUjhN2l4PmQN3deTQ4TttJDDTzWCJZDVvz8CCtP952kV+yphm1Un7SBg5rz3Tf5B2KKzfHNC8Mob0J8pHOlX4pE5+9qK87jKu3bKJJqZX4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018217; c=relaxed/simple;
	bh=Wxv2NR4SPtkJtjm2fNJJtWbbSLqgBpIGMVvzd44aQhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hBsam0JMmf73EtwwxLVC1nKQ82yMhmuikv642VSosKDEgTcwtuzgk+W9duJk5Nb87FnohnUuRpUy4sYHDemDonVUb330R4vf1WnCeAt/GAkWJenvhd7sbwXtlGrotBZlEZr10lk+RQUzu71KP1/81GzptseqoY5zp9yZMFiAS+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XVcj9nqm; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIzw5alJu82woKhAd7X8zSTFXeuM5AjTU5FwN1oixlORcaY1yzb+nncFovjwbbEtUIgD1XUK4YmPRgoi5UdmPO96seYOXPv2TezAeMzQmysFnhm9ycpOXvV6Zu5U4KM26pdytXAWRKeaEK5Ae5No5m9C2zMbVZqCJm7urbrGxvKTIB53IcR0MDmmDXoZlCaFTOcTRpvLrVLKE8499Ml5eUmE/HCtzkuccOp/xjhyPEHBX7oMkzIZQbr6PTl8a0F9XtzQYkevdDoqWpQuIwiXaPNYSWfzYuiAW2lY/JinM9tqWq2l2oj3LfikR0QPzZudZANVZ8pn/E/3QL09Ao3SEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAL8gQrgsvYymQ2b+dNwJ33LYhY2L+OhBRxp3zEx8Qo=;
 b=LYzHr2pt/63QR3COww7tjpIJWpbIzjX7eqXqB1/nGEl4p2iW5QldwXIfeG18cn/4IUjxNEZfJKlkUVZq0m7tx+TDXK0GrtCHZVALIAjlOGdvZkhQsfdY+wd9INF8f13nRKDTaUKLVJOpx9yE8tyBgx6CJjbL3XSOERxs5MZ3xtvIQx8NE5cJIOfuAxAPnYpr5dLQMYm6dZsjGhU5Ed0smFRR63eOo9qo/mcPP02w48KBm5X3l3R8bpv7QKm9mfX5HHxWMSOspWK/X7d54HpCUEZoKCWPG4CGQYr1FXAAUsc7xsFoCF0qm84lOrugTXCFGCDR1ZtsIgomnqh9dfQ06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAL8gQrgsvYymQ2b+dNwJ33LYhY2L+OhBRxp3zEx8Qo=;
 b=XVcj9nqm2+wHM/Y6sghVXHLTqxhz7BA3fsSgSrsvGPwBognA/fHy4JfnbPsCfVsyjwQSuCxl0Deg2pjyt8EgkxN3LbUFSxUOb/hB8WtKC7mY/SIy9+yVGb1waIAZ5Ntn7hHQLYgC8q0wF8bMqGcyEerx2GU3upFYHiT43Z95N2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:10:12 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:10:12 +0000
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
Subject: [PATCH v4 08/17] media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
Date: Mon,  3 Mar 2025 17:07:48 +0100
Message-ID: <20250303160834.3493507-9-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f0bc7d-e6ed-47a4-4bfb-08dd5a6de0ca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6WY98ALChxR5m4tOCog0zLHICA2WwgtyF7uQj2d7E+v5UV/3FOPngMojEJh?=
 =?us-ascii?Q?HaZCCRaCEDDuQCNW5w7nh8CnYOJTrdAWfU8CcG7v+n90UmNV5HHEW/GWyIVv?=
 =?us-ascii?Q?qP2lW6OqZ7qT5LT0wbe8CK4QFO85qsW/v71sgEuiZpHLLzNvLr+N3g6BTVK2?=
 =?us-ascii?Q?VGofXg88OWHoFmPfidmn0lIy97uW+8fhKh7+EV/lDbG2JqYya1ZwRGGWNYIB?=
 =?us-ascii?Q?3LUx4diSATu0oqbpN2pr1hVPQSNp7JFlkclgFAz1arcAAU1PpVQ0GszSYGB8?=
 =?us-ascii?Q?+nwtiKrQtg5sP5jehZN4oFxKvxuBoZxtECTlhF2k+gigHtxeQR6kkZrJTnLd?=
 =?us-ascii?Q?WxkDjoRMuburR43+nQXimeHoAr0dr278dS+nsu8bgK7LJbR4DPfgnv91GqZH?=
 =?us-ascii?Q?B7dVYkN0xSb/PJqWzOB7HuYwxDjpDoF9/geoZAxvnk6U+qEadaFJ31ZrmaAj?=
 =?us-ascii?Q?4TqTspcBK2jPIaIrD+di9z7NPsX0LHYtXX/n3JGdJMHUQm7H6x5WskBIYvyC?=
 =?us-ascii?Q?gh5Qzom5LdE2B4tIVearR44Jr2XomvLjItazl/0M1Aua7f4KNjbO8Sq+iKi3?=
 =?us-ascii?Q?T64MamzNb1WGg5hHnf5MHRqBr8YLON+nKUVnQjG5XopDa7Wgo7PkdFpD/+oY?=
 =?us-ascii?Q?nJPiMlRBSrrhU0eUpZhSv3haEZeHA8jTr2en5HFC7KCvuNyCBWgNyVo+0VEn?=
 =?us-ascii?Q?+2PM8Sa+cmlvCihlcSUVQmyln4lOioqJJNZqh6BQuvYO+/Wizlun6n/mJSR+?=
 =?us-ascii?Q?UXmslJ8F/s9gQJ1eCPZtsRD5wLOXwQfHwRmvdrcguuyLjNH2uGUO+XZvfApy?=
 =?us-ascii?Q?X8iz/p8OyXPKdczyArb/95nTW7TCIrz9dqgeswpRsYyX7LTL6FhmJp8ivw32?=
 =?us-ascii?Q?WpWMeP2y1CpKGdLzkgjHsm2TmK3932ij8EOzM/kyxXBesxZPSEqvOSRR5Wvt?=
 =?us-ascii?Q?qv2kIhClv4+3MTsEeZjowMlXiISYWM7U7h4ak1rxoCTymNR11yHWMZ/U0vU+?=
 =?us-ascii?Q?CAnijWCAYomxc2ki200E90ouaX1NshNBbYe6QzbjrgiK6l2BsI1jPJQ3qqWa?=
 =?us-ascii?Q?D7BP2NzVMr0IVtUW+qQ+kWXjoSAys1k7bedqGBDMC89gGZGviCBoF9E56Xk9?=
 =?us-ascii?Q?uj0kE32KH5vE12+uM9yfNnRSvekVWslBFAWv8yPGSC/U8tCyD9o+x22ADjyT?=
 =?us-ascii?Q?i8j4EJUIKFsyA3CY2TeERsjHSh0QgrtoYW+XMYE4AyD5fsOljhy+xbV/WhVe?=
 =?us-ascii?Q?wbmkKSsuCDSpnVFC/7Hjq//iSXSF/vIui5WM0w/9d7R/FNI7q5OwzasF+6NJ?=
 =?us-ascii?Q?YR7D36MOcZVAbNUdQ1iyUS1EcJ+d+z/EQuSrAqzFifTmCz0m0nF4v/wuEpx9?=
 =?us-ascii?Q?Kb1trMjYFNUJUoYBgFST1ifa1+Bu0djKVg0q6k3dtc9xTpk2OIcezNW4tnAT?=
 =?us-ascii?Q?uWrZE70rCCtTlGhfyErFEuSnKx5oMmYE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7M5+z6EOkuEoEC8oz0JJYbheDfYMaI9tSXHI7EGVJlrYNP4EFMB6WuDw07m5?=
 =?us-ascii?Q?205yv2Flzvj6laQNBlKIQ00CXWTk0H/xM/d7+lAZRKQJcwSaEBONp+ZOS6yI?=
 =?us-ascii?Q?vqIOqTTBYNqc0faP2RvNv4yHr8ZdF2fBC40a9GuF4WkiPuKKVmwURWtnf4lK?=
 =?us-ascii?Q?AIOmvbyyk2NLdBLQnNPQ3jW+zpNvjqHWqdpuR+UPTJyiSTGPyuOyvgipBoQv?=
 =?us-ascii?Q?gs7gq5V+9/qL/jFJ5PidDhMJTv939a4Bt9Qw66b5kjiFpzaYvkefwVjhlAgN?=
 =?us-ascii?Q?5JiftvW3Z8UDrEoWBKk35xUvFaotimxJW5USuy3BTclnIkkRxDAk/P+fIm75?=
 =?us-ascii?Q?6ytLQ1nR+EnVkiEpjzOORWZKGtQ0yTGSyMrBipmHT5JL+6niWxe937H5MbTu?=
 =?us-ascii?Q?hlh9R5Tn8X/6AlpJ9AV0BydV5K4ND15t+EHGTHvKNOU9S3/fGw5UEiypMosO?=
 =?us-ascii?Q?EIkfWdsUK7SO0qVhtLl34GXqHFEOrB5mAvXwwvFBCHHSnbgex6drMk7DRWQI?=
 =?us-ascii?Q?VPrfIbXC4cWILrrPDhamwqTyXixoTM+Zc1SgHz+twvZeetwbF3V1Ic4JN6MT?=
 =?us-ascii?Q?edj761Y79jsAv71XS9Qv5qtK447OaZnVe3f/2IVKvbXH9Rwf0KEpaueadQQ0?=
 =?us-ascii?Q?D/ZWS8yVcQyGfSmyjJn/5yH6E9rpUOBWO7MM96VU6mZxagYpDIJD7JMmuk15?=
 =?us-ascii?Q?VaidltTqfNis5iVnwqEBvEcS7ICAGzf49JxKJJf6JIvQF6bdItqTwEIO0cO6?=
 =?us-ascii?Q?uD7qlK0GBV/hsnLjQutZL9TkC2LQwcWDZQc9BumOz2ker9dT1oabR44PjeFC?=
 =?us-ascii?Q?a00OVYoiK2PCQqT7MKUeG2ntGrgQ+IrPrrpocTASSr1PnTv8dfIzQhDhiuqN?=
 =?us-ascii?Q?N0DfOugoISY1IK93UuZfQEISR/qEV4+saAwBEkZ59FYDEYPvBNitgfIyptLK?=
 =?us-ascii?Q?YHQBMa87G0pcCRVccLcxB98p/9JBByNgqN7FfooJF4HLMdVf8yURadMiGFe/?=
 =?us-ascii?Q?UGpGmavusRClg84+yHBpss56vgmeSGUkgFxhluD6GtvzenBmYCQmfOBBiaM5?=
 =?us-ascii?Q?ZbhonLXQ9HAUGA0cfyQtMP/7NHDAaNc61JLy3Q2udQGdL4qU05wHUqnC+aq/?=
 =?us-ascii?Q?086VzoR2FfUg9JiQ/zB2Zsykkv0R7FB5nHYlEmYNMHj3cKUpJRcTEOx8Irrg?=
 =?us-ascii?Q?eetRfxTXqb8p7siy3UKcpiwPG2gtoqNRgrqHQz+iEePbkcrXFPTAfFRJgZiV?=
 =?us-ascii?Q?n9uaJGAUt0nCnU8IipCzt3EW/3y99ILiUCC9R98oJftjGBizmmUBCbzPpdPS?=
 =?us-ascii?Q?VVIZPr7/3Iw2mP6QDniBEX4PN47sjVdGHWabPtdLVB5A+Sfu/6VLKy9v3e7h?=
 =?us-ascii?Q?KiJjPZOfwzt4KbjcKoUUsHZ+DQV2vsS5cTO/bEkcwA1xJ4x+io13+fXV+6+F?=
 =?us-ascii?Q?BEHU+SveOJHAWoaYCDk2MdBxxGdhGvv/riqlDAauadVshNlUEmf+bUlWl/8j?=
 =?us-ascii?Q?hs755AzULEXYWNfl8rlNgz9I+4cOkhgb0+M2q1KA0BiSMekskbpb749w6YoQ?=
 =?us-ascii?Q?wXTMOVDLONcOdAFENZZ6HxuULRN1xmSXaoS69XkPVZCiWpned7ct77k1ZGGH?=
 =?us-ascii?Q?kNQeAJSdXaSscxzLVeXVKZg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f0bc7d-e6ed-47a4-4bfb-08dd5a6de0ca
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:10:12.7497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1TgCtQkqB3IPV+CFScyW81DMgfTKUMf2M0iTIzUOR4JxdQCVLA37NICM4UvcniODRMhOsa4QdvV6ivDSNv6yxDpiftGSqnFUvr4HM6Ohi2YJ132zPhquF7aEoQXP0k0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the RZ/V2H(P) SoC, where the D-PHY
differs from the existing RZ/G2L implementation, introduce a new
rzg2l_csi2_info structure. This structure provides function pointers for
SoC-specific D-PHY enable and disable operations.

Modify rzg2l_csi2_dphy_setting() to use these function pointers instead of
calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly.
Update the device match table to store the appropriate function pointers
for each compatible SoC.

This change prepares the driver for future extensions without affecting
the current functionality for RZ/G2L.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved rzg2l_csi2_info below the definition of the rzg2l_csi2_dphy_enable()
   function as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4ccf7c5ea58b..4aa5d58dde5b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -107,6 +107,7 @@ struct rzg2l_csi2 {
 	void __iomem *base;
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
+	const struct rzg2l_csi2_info *info;
 	struct clk *sysclk;
 	struct clk *vclk;
 	unsigned long vclk_rate;
@@ -123,6 +124,11 @@ struct rzg2l_csi2 {
 	bool dphy_enabled;
 };
 
+struct rzg2l_csi2_info {
+	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
+	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+};
+
 struct rzg2l_csi2_timings {
 	u32 t_init;
 	u32 tclk_miss;
@@ -355,14 +361,19 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 	return ret;
 }
 
+static const struct rzg2l_csi2_info rzg2l_csi2_info = {
+	.dphy_enable = rzg2l_csi2_dphy_enable,
+	.dphy_disable = rzg2l_csi2_dphy_disable,
+};
+
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 
 	if (on)
-		return rzg2l_csi2_dphy_enable(csi2);
+		return csi2->info->dphy_enable(csi2);
 
-	return rzg2l_csi2_dphy_disable(csi2);
+	return csi2->info->dphy_disable(csi2);
 }
 
 static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
@@ -772,6 +783,10 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
+	csi2->info = of_device_get_match_data(dev);
+	if (!csi2->info)
+		return dev_err_probe(dev, -EINVAL, "Failed to get OF match data\n");
+
 	csi2->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
@@ -891,7 +906,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-	{ .compatible = "renesas,rzg2l-csi2", },
+	{
+		.compatible = "renesas,rzg2l-csi2",
+		.data = &rzg2l_csi2_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
-- 
2.43.0


