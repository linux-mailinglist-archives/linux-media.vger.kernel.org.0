Return-Path: <linux-media+bounces-18699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F59885EE
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 14:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE3AF1F213C8
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF2118CC05;
	Fri, 27 Sep 2024 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BWqco7fN"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F65E18CBF2
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441966; cv=fail; b=ah2WEyJeA4m5q8GMaDhjLWgzV0dlpqryA/mp3iGLHdJiyOkjt2zTG03tGeS5phH+b03g/CjqQDI8rb1wGH/0Z4d8J/1e/WtTpfGa6zBvSRYsF8lgTlzmQBZm8++1cXp7KumbVgpVOI8AfazkakESamcPcO1nqTDUX2xMjUBf0Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441966; c=relaxed/simple;
	bh=+y1E14LBM0UUSvg9jbjIuV4CBp2ZRxy8alHnrSVaU5E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XZQ9drPJjGY/bnnnNj2kD17vD97FN/rkr+FrYPAs5Oi2CwbFyFGgCrNPElwyLUnuotiPeWVH3Bln3yNSimY/HwcmjD8GRwkU0+UR0Anic12vTDDQE1Yqh8EyXMvjlaU79G0IJQ8fbH2UuV4iw9agFrKSa4i+V3bCXu240/yY7D8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BWqco7fN; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p82864955b4AM6h6fJa7LHSxBQN1F2L2z2b9FxK80XUNOKUO0NR2RBTx7qRh+rMIOUrrBpOTIyoCgmY7NGsGFkxK7IjkAim359yQsbynwJxJT3TkUEZznIoNIZvILNfimXXXHcgOj1refNpE6IS8BpoRXGnrCPkfNpA6SWpXaY+JqEelBdzRubGvLD0e+OdpHspet2NirH7i3cJKx7HBsZVuuboTylXYhMnLmh9j95kytiJyHoygk4hG7jUhNiOYUnM8A+2TGpyDOq3vAWnD6Y3cQshpwYsEjQCKuL8t04o6EYJc2XxBL1d6cZu4Xq6SmKoIv5Jbp3w4A9tqrI91Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvXkNZf73PQKWiJ7APMua3qncHF60DG5pvf+MdH9M+4=;
 b=d3w8fmWClDApf480Atw91x/IQQXEG/IvrHJGvKYUKr43X1a3elGQLDsbxr7Ae33XpETJ6zrHuZG4qtUlo6pzUg1+ctAtYr6fp28+BDCoGm8ARiDEB8AjztUHwVJJJsrTVBPv6HAiJxoIYl/Pq18POgMPsmOqhPEY+Biff3U9tp7hrpjERL+6Xg0PQDy42jvzw2ZNn77Qj5cTBMexx7bvEQjg9z6xuikELdnGLPk5pyR5u5IVUol/uERbSNDElbtm9/yEyJga2WEV6SZqorUMwhQcp7ECjbR+ePZuP0mM78mo1vnmjGmwCvrbALZdpeIlfFr1nhikaC/eNOoyF5ZWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvXkNZf73PQKWiJ7APMua3qncHF60DG5pvf+MdH9M+4=;
 b=BWqco7fNxoasHEHZjdR9gZYsTzTnnJ+t9PGi/VfnDQnW88CYbjeVrC/+vWOoPkWx8bZihy9DFbxtTTOhpnBuEWpbTG3P6LzcSYU5lsOL+CKvWkFdoKjE42AiRg4dHGK0TzPMkx4IQkGJ4Rrkwp0MzArn4X0rBFCsfR6bB6223bA=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by TY1PR01MB10898.jpnprd01.prod.outlook.com (2603:1096:400:323::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Fri, 27 Sep
 2024 12:59:18 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 12:59:18 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>
Subject: RE: [PATCH 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Thread-Topic: [PATCH 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Thread-Index: AQHbC1pz0CUtG87WQkiGPqRZ/EP6FLJrotNQ
Date: Fri, 27 Sep 2024 12:59:18 +0000
Message-ID:
 <OSZPR01MB701980F062636F7CA9C74557AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-5-dan.scally@ideasonboard.com>
In-Reply-To: <20240920124115.375748-5-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|TY1PR01MB10898:EE_
x-ms-office365-filtering-correlation-id: 16de1a6d-ab50-401a-a379-08dcdef432ad
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oKiS1pHHDFJb+nIXTun8O/RAsr5Praty485A7oauJbrGcm6HzZS6Qznka2s0?=
 =?us-ascii?Q?1R8YjMdxpuHg6YBx0ARam4p9+xFK1FjVOZ7ZMoPdLVi5C7ubwTLkE5vXJr9N?=
 =?us-ascii?Q?bvd8yhaOwIpZhMzW6fKJwiOeGNdypSbpVIgeEXHa+4WiO17ngtOmq1/upFh6?=
 =?us-ascii?Q?TvAE/XvE5k+CVadPNXG2Zdlij+fxeazjv75z9IhRi0uJpOyZGQe2kXx2sk5h?=
 =?us-ascii?Q?Jzp9003eN1+hlvaZ5B2iPuQtIc4Y++EQWBzKTJKw75nIjmqnL3Y3GKAeWNJw?=
 =?us-ascii?Q?Q6HuY2gK5jMRO3O6Mw5trQCRz3JgZ7lt3hXycdIA3e1903TqI3W4tp3gmlhK?=
 =?us-ascii?Q?o37AdcowHUHR4Bc4Z1ryey4Bd/9sBs+ux//ax8kteHtlUpk/SG5BigOSbYtS?=
 =?us-ascii?Q?yF4A1140cTe3Sp8psGM1Nm7cSlXTY0w3+JwWE7wbCPnq/QLhGh5gJvnadVwI?=
 =?us-ascii?Q?ONPcJISzppEA6O1mn4EP/ezJvcYdAhzswAtrhCZqCmkFPBNJCmYJzHfsd8Mm?=
 =?us-ascii?Q?nMRo+pHzbGJBvhs00RgqHPbopvCDRpp+Ydvf0lLJbE4AaiPeknmGmRe1CEl+?=
 =?us-ascii?Q?/CG2PPJ8T2ZGbo/4aGGsg5rLvpjp4wU3gvYiHgXx2+dVBPJ8VbWJ9H/9AZUV?=
 =?us-ascii?Q?y8Wy8U6D7Lg+4DkCgnQZ3UvTU+2Y/hQ6LUVa9vlPJTsW3L9PcfFqtGlBw46i?=
 =?us-ascii?Q?HsDiAB8In5g+fUeMzB1QOZYeSeh01YOkH3XFVcOfcsKpni5GOgpOz57ejRM2?=
 =?us-ascii?Q?kdCGHEcGavOufLh67KB6Bmrw4DD3gblDGXM1SvJrD/Zy23YPRT6/Snzwr2PY?=
 =?us-ascii?Q?p8FEp/Z6JKQCk9NeGo9tcnYNObGDKxU/QXXdPI8/y0FGwR5a1ThwPWbhYO0g?=
 =?us-ascii?Q?q1UoeI0F1qy52RKpHXQHUYWHNRCLRVZ8oSSEpiqj52yOUfcgiLQXJYW5PFGb?=
 =?us-ascii?Q?AiJKflo+Z3GH9VLVHRWC4vt+g2QYlwc91XJCxwE4eo/gbHS4YlYmkskf0tae?=
 =?us-ascii?Q?UQqhI2hX05PmFNjlAQHNfOdYJTtxCl1pTDSxKJA9rky+M/JZfOMU8lFKcvGP?=
 =?us-ascii?Q?aE+JBRwsrwISSmxc89AWC02Z2eg8JILlIfi6+2TWdhZtl3Wkj/pF9rSEHa+F?=
 =?us-ascii?Q?X0ZGcvY/u8GjP6jkeOfLJRpSL+IfefNQx0DarvO/nTZe/ub4qtbIVCuGkm3q?=
 =?us-ascii?Q?xuE9e3HA88QrpI9+ISkSiAM/6xQmcFUC7XJS59zdxoJVyElPWBVrlWuv/WBa?=
 =?us-ascii?Q?0nIKrS2aIE6hb0OUOVZfrCmJ164blTbnJZKSGMDn+DKPfJGuhQjvWj3QfsAc?=
 =?us-ascii?Q?6dRmGmCLiLunk9t797IB+l4p8UVsIOKPDHRHdUYbdFC86A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fFqqpv052UUz1WhxpsJF3jFeXYyt1FS4CA9pgToZdcBWeIxXBGm22fYsYG2y?=
 =?us-ascii?Q?lom3eqJqD0RRoks7lmWtSL4mf+yXVJ3MKdIejMd5oB1Td+u6daclvZM0R7Ze?=
 =?us-ascii?Q?vWpSS6Boe6/O73yiOR5nd7kVKisCNtmmj0Qd/uIX6GPaPgcECEY4PuQRYcc9?=
 =?us-ascii?Q?yTTrPzv2+T5cyfkLaEw5y/0Rk+uS7z3SsEoD3Am6egRoasEAUY/x6nLEZ+JP?=
 =?us-ascii?Q?PtyfWxSMmNrqPj3ZFKwztoHRo2HQU5Sx69eh0Nu4v74Gdy9D2P7Qv4cTym69?=
 =?us-ascii?Q?PoMdFoP99GX5a+ND5STveUGYpBYZfi5i8cnd/zrRRglBGBk/le988lbwI5Jn?=
 =?us-ascii?Q?yqrtp/rk/mnzucFsAVIQanr75PqwG/I54BgmG4tG/N/WM84/WCog7QaaKpuS?=
 =?us-ascii?Q?sxwofSZ1xVGImEcKnWK+1QCt6t163VNQm1vQml+m1vGF8I7ymXAd3qrzT+qE?=
 =?us-ascii?Q?V0o5GxHkxxpz09NQKEviziIzgIL/VAKL+PD75ceGOQ1IW0Q6ARIhuAePXZGs?=
 =?us-ascii?Q?usOzNAWZTG2Ay1ezLQ2DVF4Se7yVGxuyApzPzPkgF4PZqDH85SUr270alITj?=
 =?us-ascii?Q?GsU7DEqbEOTSdPgGCdEu6jCL+3rPzdhHSFgt0nQBMzo7LCN6f14HNB5g3urG?=
 =?us-ascii?Q?TDyqMrMrxuz6R1BB5uVs/ywDYc0Uhptye6NnHIpNzkEmRmRL3zFdViqWliSI?=
 =?us-ascii?Q?CGTMsxe1dzoXBs+jLFAMoPUtncYUUsCqqQZAfIkCHrBjuu73zMruLQorjZWr?=
 =?us-ascii?Q?N3kaIEs/j+zPk3TedmgCufEsitYaN+KDttOOGV8daVKMIwmgScYzkL6gFCB3?=
 =?us-ascii?Q?bRP6iVpn2/gDntearZIqLwFjOu3b25BZW1u52Q5uyuROoWe9K6yO43wEUVp0?=
 =?us-ascii?Q?rCebbPsHVdq7lpMnWDIRVqVudJeD8hcKu8gPGZPsTecFV1zwa9EWYhBk1RQ2?=
 =?us-ascii?Q?/egnVFdFIA2F7td4SX6J0c5NsLR9m4RW9qIHfPCdkeCnpNB9ZMstcThvaKmj?=
 =?us-ascii?Q?MouCEGLi2xTGzo09F2WkTABYf1qwxVYBb8+N8pupg50L3rrCqvK4J9TPRJNA?=
 =?us-ascii?Q?6k2rItMZRiZU8gRAAAuY0M3FAlCkDmFWf4yc4Y/VNw/+4b3LEOZuRdrNBL3L?=
 =?us-ascii?Q?izt0mctFwg8g/d8D7GLAB6m0lsadlQKI+EX0DQAdHUb0GNRs4ShK040CLWFO?=
 =?us-ascii?Q?1wwNmjHp1GUtLzGc2/gcR4VQtxhzi/2MsCb1zYMUyy5kxmtCc7f/h4aacaKC?=
 =?us-ascii?Q?7bAPlV8wyDveo4Hh0o+n5RixPa3JMSwCCeUBdPpaBghpJLXH9b7sEdYXEx4P?=
 =?us-ascii?Q?O5oR9C4kLY3RpNCYG6vVc8TQjc2HAQd9GLqQ/WHR468Bfm0Ch+jaxpG6Q4YV?=
 =?us-ascii?Q?01aiPuflnQtTALnMFoJrzSMAVeYlzIUNi67OpnIhX1vh/AlASPesXScPsagw?=
 =?us-ascii?Q?Q6THNyeO9cDIG73ry+yIUVuuQcrbnVfhaGw+ylEw3CkK+FAiGvp8AoN26EbC?=
 =?us-ascii?Q?U/ChcERZEWTf1zgoVuSvRxKLtREQMUFGwNL3oxvAUacGr56pOPob1HYXAStp?=
 =?us-ascii?Q?ke7LQtjL3IUngOVfpsEYmRUlZp96PwmhVWZ7hamJIXBvM1Nr5q6nQrh1uE9j?=
 =?us-ascii?Q?tti3G4/bNaEtS5cj57mfctg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16de1a6d-ab50-401a-a379-08dcdef432ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 12:59:18.2933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KFCYoaGQyxB9RaIFUWv8pRE/xakAOwLk5Sq+gis4Go7TLDxuEf6CLHqlKNU8agDSm+F3RKWkdmJrvjaa9gwp30hD5FoxXl7Z4uvNEDMkGaDQ4LgQTLbB0AWzJmHv18yk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10898

Hi Daniel,

Thank you for the patch.

> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer data an=
d
> output it into the CRU's 64-bit packed pixel format.
>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 ++++
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 72 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 9609ca2a2f67..6b83f317919f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -192,6 +192,18 @@ static const struct rzg2l_csi2_format
> rzg2l_csi2_formats[] =3D {
>  	{ .code =3D MEDIA_BUS_FMT_SGBRG8_1X8, .bpp =3D 8, },
>  	{ .code =3D MEDIA_BUS_FMT_SGRBG8_1X8, .bpp =3D 8, },
>  	{ .code =3D MEDIA_BUS_FMT_SRGGB8_1X8, .bpp =3D 8, },
> +	{ .code =3D MEDIA_BUS_FMT_SBGGR10_1X10, .bpp =3D 10, },
> +	{ .code =3D MEDIA_BUS_FMT_SGBRG10_1X10, .bpp =3D 10, },
> +	{ .code =3D MEDIA_BUS_FMT_SGRBG10_1X10, .bpp =3D 10, },
> +	{ .code =3D MEDIA_BUS_FMT_SRGGB10_1X10, .bpp =3D 10, },
> +	{ .code =3D MEDIA_BUS_FMT_SBGGR12_1X12, .bpp =3D 12, },
> +	{ .code =3D MEDIA_BUS_FMT_SGBRG12_1X12, .bpp =3D 12, },
> +	{ .code =3D MEDIA_BUS_FMT_SGRBG12_1X12, .bpp =3D 12, },
> +	{ .code =3D MEDIA_BUS_FMT_SRGGB12_1X12, .bpp =3D 12, },
> +	{ .code =3D MEDIA_BUS_FMT_SBGGR14_1X14, .bpp =3D 14, },
> +	{ .code =3D MEDIA_BUS_FMT_SGBRG14_1X14, .bpp =3D 14, },
> +	{ .code =3D MEDIA_BUS_FMT_SGRBG14_1X14, .bpp =3D 14, },
> +	{ .code =3D MEDIA_BUS_FMT_SRGGB14_1X14, .bpp =3D 14, },
>  };
>=20
>  static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd) diff
> --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index f2fea3a63444..65b1cf9e553f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -42,6 +42,78 @@ static const struct rzg2l_cru_ip_format
> rzg2l_cru_ip_formats[] =3D {
>  		.datatype =3D MIPI_CSI2_DT_RAW8,
>  		.icndmr =3D 0,
>  	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.format =3D V4L2_PIX_FMT_CRU_SBGGR10,
> +		.datatype =3D MIPI_CSI2_DT_RAW10,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.format =3D V4L2_PIX_FMT_CRU_SGBRG10,
> +		.datatype =3D MIPI_CSI2_DT_RAW10,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.format =3D V4L2_PIX_FMT_CRU_SGRBG10,
> +		.datatype =3D MIPI_CSI2_DT_RAW10,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.format =3D V4L2_PIX_FMT_CRU_SRGGB10,
> +		.datatype =3D MIPI_CSI2_DT_RAW10,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.format =3D V4L2_PIX_FMT_CRU_SBGGR12,
> +		.datatype =3D MIPI_CSI2_DT_RAW12,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.format =3D V4L2_PIX_FMT_CRU_SGBRG12,
> +		.datatype =3D MIPI_CSI2_DT_RAW12,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.format =3D V4L2_PIX_FMT_CRU_SGRBG12,
> +		.datatype =3D MIPI_CSI2_DT_RAW12,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.format =3D V4L2_PIX_FMT_CRU_SRGGB12,
> +		.datatype =3D MIPI_CSI2_DT_RAW12,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> +		.format =3D V4L2_PIX_FMT_CRU_SBGGR14,
> +		.datatype =3D MIPI_CSI2_DT_RAW14,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> +		.format =3D V4L2_PIX_FMT_CRU_SGBRG14,
> +		.datatype =3D MIPI_CSI2_DT_RAW14,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> +		.format =3D V4L2_PIX_FMT_CRU_SGRBG14,
> +		.datatype =3D MIPI_CSI2_DT_RAW14,
> +		.icndmr =3D 0,
> +	},
> +	{
> +		.code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> +		.format =3D V4L2_PIX_FMT_CRU_SRGGB14,

With comments clarified on patch 1/4

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> +		.datatype =3D MIPI_CSI2_DT_RAW14,
> +		.icndmr =3D 0,
> +	},
>  };
>=20
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int
> code)
> --
> 2.34.1


