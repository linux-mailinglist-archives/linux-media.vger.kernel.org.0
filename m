Return-Path: <linux-media+bounces-27609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB20A4FDEC
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92ACB16DB0B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299AA241674;
	Wed,  5 Mar 2025 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="gth+seKT"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E468F23F291;
	Wed,  5 Mar 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175066; cv=fail; b=SgJqUYFiPQnq+2LLzJxKIPC+e2KYuXD+jOJzjao5orna7TrKU1jcOlYgf087gsGCmbesQcX9cLyI9+6SJKwBckgYtRwIXnXoKjd/jjpqfoHTbnEJ3i3MXxeLkvo8bkAr4qzhy3QrtbCF9dyBSp0w7LJAaRNkrVUQ2MFvqPV1/pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175066; c=relaxed/simple;
	bh=0jKrIOzviKxyWVL6kvTBPxp69ISASbUnavlKSV4dmOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ePHQRd9t/iSWCY8U+56i8dugB7DR3GYOQaObA5S0+HUSAeBPI08qF0SgT6IyvXtTAPTQ1gLxZsDxdtRfb2LlVv3CegmSp9NJ2ayKjNodlWFjF6OVOZEYS9yqqzAMJooDiepbkUmnrIpyOF18TdP8UtEwQHqN28InW1GwixJxs6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=gth+seKT; arc=fail smtp.client-ip=40.107.20.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xyi8E71g8qBQLYtoC/dvQvZVdpnQpAJZ8Xn9/PDehzKOEk72Ul6xRyfguXU41V4U2x65iGZXw2/QrjrxIaafURbfNsD4rpmurX9F7Ysm9pBbYYE202PPUSZtrfMtsVO4NhRQzzbAsbssBPjyZr2MHUxwOOXFSVgiqPbgF6FcSth7jS+IYVpKmJ0DT0U445pfC6RwewUVLlD5XbTXby7axT0KItR7GYTMmNL5c+yZAwr6qWdufN/2PlDyJdj6bWj+qUsxf1hy1Jd+GGNy32tlFTKe+0wk5w15bMk7h+QCcj3TfojkM0YEeqZG6NQTB+01HZdhrO0Tz9HBsx9ICiJ2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xIgZoVXszBtw20RzATPCXrXohld3inZadSZDeCPDWU=;
 b=QRDuyxpeYvDfQ9RGzd1U0P6l1vUR1XoH7CfAmJ8F9jz+A3gsq66G8ApA4BETbYfTrN4N/WmIGM5FE/oVuv873i0QRQrR9mAiHWEf0ifVY9j/W1lrK49rmFhutYyrRhQuxEgCvYx2kx6KucmxXsiPJvoflGMr6gWj5VwU4XUu8jmUmOZUjwYMtg0RjHdxmLGw3cBOh0wBt4qM9X2cOKr+0tP0228TAdWL+lahBSqsR6J2aGQdKAMJfsESBPBZgFM6HMEw3A6apEw7XYzVpIVJEbxB+ZvQzc3K/BfZMbEnNBcpn6xpNnhz7M+5eAMD4QCgeqnfwoBceNOi5qdfNB4Z/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xIgZoVXszBtw20RzATPCXrXohld3inZadSZDeCPDWU=;
 b=gth+seKT1q0B5BDKc5KxFHoRgNTiY7Be6tLm7G8sqaqZsUN0XQoKo9NZKq7xtBcWdyamyUYj2qW2jUj0wOrTDdhNPgB3vgmDyKVysYWMrZN5ZNrgF1Dy7+NrIs8/3FUCkzRY7qe9AScxu36mmtMOaGUN2qE0sdsrwIiBZkb+slS7yk0hJZnXAw+ugjm6ERXGvG0g1rvl1xx5bzXO00aJC8T1elKmyHv+VhtP5APEhH9QFDm6Gl5pcD6C6wyd3b/nUzIvrEmmXU1WXTtr2BrSPpVGgGBgpcSgQrzpNEL6b3Qj6uzhPNa6yCXY0+Gblv265FH/nMTILDbIZTT8Lz/5gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU0PR03MB8743.eurprd03.prod.outlook.com (2603:10a6:10:3ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 11:44:21 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 11:44:21 +0000
Date: Wed, 5 Mar 2025 12:44:10 +0100
From: Mathis Foerst <mathis.foerst@mt.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, manuel.traut@mt.com
Subject: Re: [PATCH v1 3/8] MT9M114: Add get_mbus_config
Message-ID: <Z8g5CilgfZeHV2K1@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
 <20250226153929.274562-4-mathis.foerst@mt.com>
 <Z8AoA6WjbXQufqR6@kekkonen.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8AoA6WjbXQufqR6@kekkonen.localdomain>
X-ClientProxiedBy: ZR0P278CA0122.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::19) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU0PR03MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d56d090-e19d-4d12-e9c4-08dd5bdb1206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Y6ceWy2cu+XAlULh6JE4ULF1j4+dvGv9JmvKLRskzMjafCfT+rSizZ+oaYe?=
 =?us-ascii?Q?tPwA9YTjyjZr13642u73LK7P3SNn9MqUVJXxkXbn/WTfpcam7VV9jaMJE2vQ?=
 =?us-ascii?Q?V6LgCkUpDCa5lijKtjTaLPsOf6wvPb1YdA+TfbfSlfg0ExtfxbXYbn0gssB9?=
 =?us-ascii?Q?TP71Xdl5z8XboXzQCOXbDJvt1L+7XbgyC8VmuM39CUPipLTSaCjDHD5BRarE?=
 =?us-ascii?Q?qFv4ztxqHc+ihoh80mI9wCTmnmJj74P6lVFiouOiFHvkKmyost9BaVqi0pUl?=
 =?us-ascii?Q?qGlN3p+Ah3t3nY8XTMx2CphZXM9bhVcB3gB8UtSsoMIgFBk93uu9m86CtxtG?=
 =?us-ascii?Q?oyaxefrfIW/GlglXo4xSsh6stOSqndC9UJWqVwrN/jUcWDv2m8WWEmcTURVS?=
 =?us-ascii?Q?OYB99P3vGl+zFr0Rz1Py90wkeMugwv7vETz74mCIsQ9wq2iIsXpBmzLORGK8?=
 =?us-ascii?Q?cnAchy9BNuB5FZck7v0K8B/Hg6XCFlc4QLeThWTYJkraJ76yY7h5OTj+vlIQ?=
 =?us-ascii?Q?av3mTBLKqprAUvjfWqM/ZeeC08xVqw4zA0GA4rB7+cKvRt/ZOqGSe9QcP9nD?=
 =?us-ascii?Q?nJt6VFbRQUUDVTFUqCBeSb1/be/UHV8dUw8ZlHwloPq6NSMgOhwdDNXHXdqA?=
 =?us-ascii?Q?rDC0v1jJJijp5ZQqPZbGnPkKO1pTxA2mX2GItci6okkSXXgd3sbsVdFP4Ffs?=
 =?us-ascii?Q?+sphYrDyxO8zNGwIoEUsiH037OkFh6XLQGYX9tWyqVsD11gTP3/UFc811byr?=
 =?us-ascii?Q?DjyZGgNLJa55Ch+hRsQh/I6utf/ifQFVTCCBdT0BxU5RQ1Ap/g2qAee+5DB8?=
 =?us-ascii?Q?HniC107wnNOOHGO6DfRUYfiQnL5U7vChaU8aBaO/iZQRoUUp5wo7MHVVN/zb?=
 =?us-ascii?Q?N0cP/YsGR+n2mGIGy7vs1o79thGpLs6xUlKi7wfN/6I+rmtJVOqyg7mrvFhl?=
 =?us-ascii?Q?1GHa9SmN/hOmZ+n5sMTmgw7f0pPT1T5GLQvpYLEP8ObYtUf4Yee32cTEeqiy?=
 =?us-ascii?Q?qPRfdnzPpl/2w/1vSJ0JsidTB277MzdQlEb+dTttje4tA+aH5e89Bc5zn5v/?=
 =?us-ascii?Q?NR7SGf7++2FaZSdgmUSmHwiwlALgGlU/WVaV307ASjff9RcRuP6Et22oY3FL?=
 =?us-ascii?Q?X/Mn4k46XSFdBIKtJlq1XV77YiLt0sNmueHgQOEHZP08/M55mjRNerTBnpVc?=
 =?us-ascii?Q?cWbg0P/NQ6kZudB6rltI5HcPBz/lNcMjgLI2R56085uLC8fTsZWEhzGGdGJh?=
 =?us-ascii?Q?K0PbXNk4cd+5nSQlJryT8LDE7zTxu/RkfqC06eyIWt/iMv9uo4op+GP7GsYz?=
 =?us-ascii?Q?T3fa7GQz3i2Hxw+lHrvN5RoIHJQ0IIvoELA6RcdVCUEz8JQcPOmeLdvZjRMI?=
 =?us-ascii?Q?FEHWGTmjqeDOnSEl32mavoMClR6Aki94652/CRUsTkeHLAjl/t6sYaYeg8ZL?=
 =?us-ascii?Q?shBQCEvN1QFMABUqTZXNCtz7HPyCbdeZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/38TflI7VOe3216EQcvLgibXuE5g3LTsyjRjHx4qbj9GId7cZ3tP2QwDeNGU?=
 =?us-ascii?Q?t+qAqBfi2rL7aM8qYDM773lpkz2Xvy/ZMHaHmttM6VWND5+v2xO9G9rqRlSp?=
 =?us-ascii?Q?gHMLAn5zgAb8wGLqii5s0FFRntWpeykXzuHEvyqltNSEOovg/ZkcXHmelF4p?=
 =?us-ascii?Q?WOO5QljGr6hV0oO/6KZUOEGBQGxb6y1O2yKw5OCpEx2Rnvy5+GdO7B9e/9Ig?=
 =?us-ascii?Q?WW5hPZT/8dqeMeyBJgBxDVJ3NnY9olylHUFdPVpcdbJR6z9Xcly2qndF+dhH?=
 =?us-ascii?Q?KZARNwAdr3SbBtjJ3CWrl1qQ06F3JZmntSsPLnDtYowGRoLMDh8JBnJhhdsb?=
 =?us-ascii?Q?2zq5A1TEhePvxHqPsTwbcduyGgMNCVrGtXsXnbxCGQ0PbAp/BuAflSObhK7C?=
 =?us-ascii?Q?XyVXRJ2rQjEzpmuUyecea7QCr5nQxU2/iRw9NPwXnyJR2W+BBNH7fnIbcnmH?=
 =?us-ascii?Q?sT8ZBUBFnGuc+Q+QzAbpEl3tjeZs4NlvZNCCzDOfAfDY7bDnEbPYEAFSYlvi?=
 =?us-ascii?Q?DQdZhaYA2IPz7xzj5JDnsKkY1tDz1+5fmX/AFdHKgrdNPLFogiKdTJD0KjQJ?=
 =?us-ascii?Q?CuX2vt2pXai0moKdJsWgoX7nEFUiQ2oTvjmGptFA4cLSF6Gi/ujdWtoosSCq?=
 =?us-ascii?Q?d5Txqwh0Z6d+738XYUju2YdDMSygn/o/Yhl8oIdbxFAt20NLHDPuNDqLT5gX?=
 =?us-ascii?Q?8gQbgDADrhDWIebv+21z2sVlDZidVWP7jwNGvtaBJQoJOHP4tG1VYPkaEgm4?=
 =?us-ascii?Q?kFyhnCEtA8Lh75Y0ofQEGPj3skpmeJH2N7vrT1ecwBao1TvxrU6dsGE/o4cI?=
 =?us-ascii?Q?WJZ902nHBGQaGLkfIEmXTYCP6Y5OJuIWTibkdJ3xUX5YgXlIzhmmuqxvHhWu?=
 =?us-ascii?Q?Wm6JDngItzOMstrGdVVbm/JvfHMzAo7a5jX9l0CuFhprJPBxcIFnbvyWpV5X?=
 =?us-ascii?Q?NlG6sa+hftcgWCh8r4RWbWXAJeICO4huo4o3yP96Y0T24aNUJaSkoV+nK2iS?=
 =?us-ascii?Q?qlc5tGEceCyavs3oM2tAgWEOTm2OzJKWSS5l3KXLeOGcl9cMJIXH1AhznFDT?=
 =?us-ascii?Q?M4h125JBNqnr++iutzHN9cH2yUc7opsJ2k4Zg6GgegCvJu+lWv6O2MwleA1y?=
 =?us-ascii?Q?JOJpaKs44w+08udt7c7KYlHUlTq+myLwoH4UJ9VXsE9XghZ24tdwkHAhV7dT?=
 =?us-ascii?Q?ct6k0SH40rd5aL+vfp8rx21evJTEWv4k4hR4Olybri1VOO2sWikw3WjnkM8b?=
 =?us-ascii?Q?PFYbsxbxy2CtEgGwvSCgrT5AfvIiiAWMqNFXiJMM5cCzhahLypj/RDma7ZmN?=
 =?us-ascii?Q?iIhBOP5d164enw7GMaLUvxlgMYlRl1XYEUQc+fWFFsdEsy4P7M5F5p02nweT?=
 =?us-ascii?Q?nx+AYpKbs0sWOJXUmi6ynj9eohe9/yqSTYCOgMFhl+zqNj55H9Chkeq9kFrS?=
 =?us-ascii?Q?0HnODTjlosQoQsOMWXlXl123FaEvxbmyaU8DYkBrIa3Af7CY8MWVXVlZjB/T?=
 =?us-ascii?Q?I3NKke1lbm5arp3sB3axFL8R3RfD7omhSrRcBl2oP/Huhakrb8YI/rXkh3Sk?=
 =?us-ascii?Q?alP/kXeleDd/FnhIuIUgS2rcx1jF5Simrew3N4QE?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d56d090-e19d-4d12-e9c4-08dd5bdb1206
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 11:44:21.6185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dt0sgGUqNslgmIPdaQJU+nSyrpRnRcbE5mH+TxRQz2AJ4FkfMZUzwdDJ2bLD4fGgGrPvrn6PI6FOkIyA4In1iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8743

Hi Sakari,

thank you for your input.

On Thu, Feb 27, 2025 at 08:53:23AM +0000, Sakari Ailus wrote:
> Hi Mathis,
> 
> On Wed, Feb 26, 2025 at 04:39:24PM +0100, Mathis Foerst wrote:
> > The i.MX6 camera frameworks requires get_mbus_config to be implemented.
> > See [0].
> > 
> > [0] drivers/staging/media/imx/imx-media-csi.c - line 211..216
> 
> The imx driver should really be fixed instead of working around a staging
> driver issue in sensor drivers.

Makes sense for me, I implemented a fix in imx-media-csi.c in and moved it
to a new patch series as it's no longer related to the MT9M114 driver:
https://lore.kernel.org/linux-media/20250305113802.897087-1-mathis.foerst@mt.com/

> 
> -- 
> Regards,
> 
> Sakari Ailus

Best regards,
Mathis Foerst

