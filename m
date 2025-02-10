Return-Path: <linux-media+bounces-25909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86181A2EBEF
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0207E166A88
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FA01F7066;
	Mon, 10 Feb 2025 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NZ2hCdB0"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55621F55E0;
	Mon, 10 Feb 2025 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188457; cv=fail; b=pt89VC0DpmuKPBRWgId+0M0KMEDxGMjhw30TnCntsM/Tv0jv6wiL82/WYpVxeRdS13vxyZi8sYq2nnFgrJLGMWhZ+BpOBWiu6F6R7hLrARXxU/nq4rPjhaIaPa89gwL4Mcp3n+xAAsglYw4z8wqjp9ZcvZ3oCKiMg+rMhaap8Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188457; c=relaxed/simple;
	bh=YW51Wp4xMMQ/uEFsgvyGYUsiiXahqdPZosFffXkUkdA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hqq68zaoDhSskyCZvPHfIFDQhP3zDrKYBmELv0VhR63lIvRO/1VrCR+LSYT7XTU+oMTDNYsr7ECSRCvyaBvdWzak7JFllWa45auZ7TTsjsgPiCouFgYEJz08bi268ZCFehQaHU3b386v3Y/+ezfZCdgN4mJFaEgs1WPuwHfoheo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NZ2hCdB0; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjr54Kp1WT0TZNmb2+F+zRY1GqS9gm2k/5hVVGMzL2Vpj75GnpzlaA8dmIyr6u7QVKsgl83dms952cJBU36NnSFATLbPve9o8/h5ArNU3TaqzAXsyuln9ZCbkL0sa4NCY0SjE44Rkkdyta3Ajj2LYHJhEhY5iUnklMOAABvH2tuKr60EGiz1cYJR9djEzsW57U+V/oX58u6htFN1r7auXUvsnUuAYkuf84hV10PVI53nrIGCY8vADcET2YjWeGrgtjs6ssYr5+NwrwXPooP9q5iId2ztpO/Fp+iArK83jZH9HTcTvthSIle4YZqWHUZhJCH7IZ2c0b+VnBGGj5nfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hjFYYrAjylg6p/1x/nXxfWG/iek+gR5watc3fQVNvA=;
 b=t6pg82q0Y3k7QsDJqDGCIumrlZe3bt8MFdZxJWSS8M0ME3PSltH/BBg8uAr51IE9kDzBATLZN7gGgXBOfJttmeP+l9hU3HG1Sw/ucJzRi0GztR3IKFYBqYhlrSHsUZmH3s5u4zcD7pTvnsr1w+32Bosn61/w6jjvEj78Kvzos1p22cVrSUtIQGYcyThzWu0L5Jd+rB+ObyUw7wCbEHn/A8XMFo+Btl+SprSXM+st/DA7s3q5ADusFOWfVbVgVAoNgKcqx3A+XvuZkdg+4leeUt2+TgEHnES5uEd/KydNuLe7dcEnVPHa75XhQo/lZ828BrpRsVjN3DEwFtsR95qCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hjFYYrAjylg6p/1x/nXxfWG/iek+gR5watc3fQVNvA=;
 b=NZ2hCdB0Hz8B5y+MRDPldv40f+7h+fDJljxu/7mIG8ikmIdG43JoK2smFJh2E6sinxbZF6yhoXFrLqpYau/FAq0ZyoPOk4Y0LX60GiweOFTeksi5ftydgj7MJda8MHdSlaSmNsEVTIUVaoWUgiaQVpvLcw6uQSvBnSQ3G2oIxOU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14590.jpnprd01.prod.outlook.com (2603:1096:405:23d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:54:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:54:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/8] clk: renesas: r9a09g047: Add support for CRU0 clocks,
 and resets
Thread-Topic: [PATCH 1/8] clk: renesas: r9a09g047: Add support for CRU0
 clocks, and resets
Thread-Index: AQHbe7Fqt2rrojJRP0e9kTkSqoMSeLNAbJ+Q
Date: Mon, 10 Feb 2025 11:54:05 +0000
Message-ID:
 <TY3PR01MB1134607367DA9D2B689E6562986F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-2-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250210114540.524790-2-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14590:EE_
x-ms-office365-filtering-correlation-id: 5710b322-9e15-4fac-68de-08dd49c99eb7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?znk5t/jbOceqVkVaNlMGFslcN+2OgMsxc4sJKcluQqhVPYUOwchFN7NA3Qg3?=
 =?us-ascii?Q?rye/TU0yFSUuEhOGOYNM4UTsg6X1JlLmymOK7ZIsJvOGWkEjLpl7xaXBFAJ/?=
 =?us-ascii?Q?QN6gEQNhLTxWs4Y1YKbZPWPwMgLAG1UOqNHDZDc64B6+Z7cbXMSyHvAlnDBS?=
 =?us-ascii?Q?uaEzNjvcdMSKjuipnwGuPxJZARyj9e++YlHIhPiRmyuBh719HqAwqAeVS/cI?=
 =?us-ascii?Q?O5Nnj4BzVInkT/chaecX18V+JYdFy/9Kfb+UjenLuIh6ZTtH9qzsDf2wwAzU?=
 =?us-ascii?Q?l6XQxE0PAXwpeJGpKKTM4NJOIJg1AxjEc5+o+KPs5vIr3k9BpS00vJDA/Ck8?=
 =?us-ascii?Q?lauBC4y891V7tkqxcA2JWV5I49BFK0pS8zoZnqWCoOAOFs3LpQRiynDef61J?=
 =?us-ascii?Q?UZKdGw5pkMF9FMsltUpUhTEVqqngVHSL8qzs9BY0A/7lzkF+KXgv7+r8B7mW?=
 =?us-ascii?Q?A9WatpyQmt8zAbhulI74GIoNUkc2IZHYXbRWcRAM9oHguWxXRgwt+7M8E7tm?=
 =?us-ascii?Q?9dB288+pvD9kbhhd2H2sbSZ4J318sIX0VXTrhx3mMO88ZHN2S+V+cz5yzJJJ?=
 =?us-ascii?Q?Y2H5as3K2RzPiOjQR2QTWn+7/XY8RijQsJF94MI0wGPL0ZT1/0JSFjMDkicM?=
 =?us-ascii?Q?IEGg4u4e4zFPDpx8/Xmqs5ermL7/CWxhw/zz8EMTGQhoHn0MT0a0dwEvpbbb?=
 =?us-ascii?Q?v2KgC4bXkankq0N5XLObfTnayufMHEDiLcZ2UcwqCUS0nGjXrto8A6pWvyl7?=
 =?us-ascii?Q?RjvTBtMXxBKfNANpZieD6+XThEIEAfSyDBjpoyE/uTfDK3yTNhHiPYKVXIhM?=
 =?us-ascii?Q?gATst5XlrRf8rAi4AkxLVXFaHDu9UxIP5IJII/UAUyhd/euc1BMI7SGdCCOF?=
 =?us-ascii?Q?46Qfoi0/ts0KuxqV9LNhSLB8m5khvpsNVrvzSti5oZaI+0wmK+sVYdQY5WWi?=
 =?us-ascii?Q?jLYsk6RGTvitMPbi8nAQK2DvrqsYjwh4aBQVV+OYit5gXO6KgMxcTY9kLjbP?=
 =?us-ascii?Q?Disel8M5btmzepVyHCvuU+jmodUZ/+8Mx0K6RVoYovLJkMYvwx1p6ZR9Wirg?=
 =?us-ascii?Q?nEO8P/qcWDvXefT37pjNYzwgMUTGWeSOh0wfgAXQNxN9bjA1UcWKvLGavcJF?=
 =?us-ascii?Q?h1D5qA4Flv0tS5F+koXTn8km+Y+rYp6L23foq6AGWDCCscYnwOzScTenLPoU?=
 =?us-ascii?Q?PWh6RRNom9mFvlzVROS7iFMZUO+puoVVhj1/DG15giuk8NdPc6jyU8mPRyBi?=
 =?us-ascii?Q?u66MW9cctsGDbbcU7YNs2a8aQ0++JJO+wHbs9hO9BWgChyBkK8nRcaWjHjZr?=
 =?us-ascii?Q?SuYne+yo3eda54mibxRqqyMvxr8VW9YYzyG2ItLFruZaarxQ1XkQMBPWFWRZ?=
 =?us-ascii?Q?1L+XB7joJ96YB/Ap0+34n+GIlaPyDcOl5+bAC+JfHTacF6qn0fccv+Vt6lkq?=
 =?us-ascii?Q?oCkpm5XSdfZ5/0bmB6ifLXcwpHb1rIoL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/kpl4R9/QrDz8GkkNgij24gilO3FLSjOrjiNLrDjWw9lfSzCWy8CeIqIShKS?=
 =?us-ascii?Q?1Sp0fLUjI/9Gf/wkHdakIZ6OEwTrg0rgrLl5xNhjnIveKIBoGGg2jPcSodXq?=
 =?us-ascii?Q?detTgw1ou/dZL8PsgTvGm5jn8UNtwMhADxZ/3nB1BgdHFE+dLway9l19vhBk?=
 =?us-ascii?Q?kf2VO/JE6ZuqpvCXJPL1yACqCdGgBsu8FNyAwiXft+HBHRpFYQQOSznjPvlj?=
 =?us-ascii?Q?Sqi2qINRwfMXCzT12BWjmv2XDPh9Q+MVoA8EHrAq64pjh4eItnpMfhOywVS6?=
 =?us-ascii?Q?Bg0A4ph2RuBOrVKyEWByqmWWTuDDQ8P0AMX0pCVOAQPfnTSehxZJZH3fq037?=
 =?us-ascii?Q?iM+X07OoCqLhF0ERhiBCXj08DNXSrRrrFRQb1QfIfv7pq6BO4YZnjhW1ZeGc?=
 =?us-ascii?Q?EQFnLlrubZH7DoFqw6HfsjyN1h03U2mFy+srjtAhwOJ61Q+2E/SuNCw3OoIV?=
 =?us-ascii?Q?lP6GWKy31rwWCi6x9UBzihwvdktsNi6C3f2zX2988fzosMRNHifEH9YhcBju?=
 =?us-ascii?Q?99MzUeOaf0V7io/wIjreFEGhAqaUerQHVULhJkAjp1MDRRqabyy8sJ/Q4sSZ?=
 =?us-ascii?Q?CGBbUSqVPCHNn0SLyZZX7fL64/k2LXeoAB9GCWv2QLOGXZGMIODG54qaNKio?=
 =?us-ascii?Q?cIvjWpwBO7Evir3/u253pcn94zCjgyLTE52M/8hGCah40ZAYFvD4npUIO9SI?=
 =?us-ascii?Q?sjXEq8kdMkjvchEfjGLJ/XYV6qwAJjX+PwH9iY6DzNrtYZAjwm4UjcsT6GZ2?=
 =?us-ascii?Q?FnyeZIXKIaTzNxBnTwaiFOJlpi3iJCCEaRPyIXwWf3y3qpKkQZKHTzKHHw8f?=
 =?us-ascii?Q?Qy818EwPmusnS45TgoBNzyjF09iuNfHWYYVmlXsawBSLv6AwBt2Suyc0okUY?=
 =?us-ascii?Q?Wz0IMqakAnBG4UoiUadkYPgKris8IqM0WUCfAko8OK6fadT/jxNI1Z0o9Pxj?=
 =?us-ascii?Q?2tMvs+NkLQX4BAG6sebRWhvf5iOhtlQgzPxauTAWH6LtVfAzXCmKSnxJMXv1?=
 =?us-ascii?Q?2xSJUFXL1oOnakZT1DD8qFAWu3fu7UaTRbOnH5NDJrxLmxen44MkqHIiT2JQ?=
 =?us-ascii?Q?5vyQx5YlLtoXeBkVTkfgDLJ6GUJs+wvL3xY16H7aePTNx6OB96Uag/SvI+JD?=
 =?us-ascii?Q?59g9nrqgjSURHCsbm+GgNi46ygoC4i8irLEf/5Kus2XGFg7pLa+/RvQim2pk?=
 =?us-ascii?Q?st/l0F+UbsqISVIGhAM4apbJwLcitD2Dt6M6FnnOzQo6Cn6Of2RhiSG+c7Mr?=
 =?us-ascii?Q?Hxs1ae+ZjaXVVx87i1eNrPnikF5rUNPBGEPpP2NdtPRXelqQanUkja9Y0Qol?=
 =?us-ascii?Q?qcjk9KiI92q2M3nFcudZiGh/VGyu+UVMulgCN28JHtDfIUNn+hUVx3DQOBRV?=
 =?us-ascii?Q?J8+DnjgrHPFnDW4JB9hQPs41zyzrtkO+lbhVOqng8v4Rfl1IHtVFe8HjEXeS?=
 =?us-ascii?Q?cAFDip01+NABpEJpS5uqCFcOqEtvLtBVZovjOsI4RwbWei4ROknt5Z3k3DzJ?=
 =?us-ascii?Q?Q061Lq0YY7bHgTuFMuPupGFKSjl7aTeNJzdgaAF6OWyVYNoNadu3D6pwW6qO?=
 =?us-ascii?Q?sBDhAPWlxLpLk93yWXg2S2OvVDFdoMn+tOPvO3m5o/Zn9+AHXR0UJOx4jJ+F?=
 =?us-ascii?Q?9Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5710b322-9e15-4fac-68de-08dd49c99eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:54:05.6236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrmOwnk7eaf6JMWrjhyJETYdFKMoK/5l+zznkYrxJW1TVAQIMcz4hiXssaPi4ruDKc8G3y4CsxFlOV61fJMfv76fB1/R84zC+eLTF4RZYDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14590

Hi Tommaso Merciai,

> -----Original Message-----
> From: Tommaso Merciai <tomm.merciai@gmail.com>
> Sent: 10 February 2025 11:46
> Subject: [PATCH 1/8] clk: renesas: r9a09g047: Add support for CRU0 clocks=
, and resets
>=20
> Add support for CRU0 clocks and resets along with the corresponding divid=
er.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/clk/renesas/r9a09g047-cpg.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9=
a09g047-cpg.c
> index 51fd24c20ed5..5d02031219d8 100644
> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -28,6 +28,7 @@ enum clk_ids {
>  	CLK_PLLCLN,
>  	CLK_PLLDTY,
>  	CLK_PLLCA55,
> +	CLK_PLLVDO,
>=20
>  	/* Internal Core Clocks */
>  	CLK_PLLCM33_DIV16,
> @@ -35,7 +36,10 @@ enum clk_ids {
>  	CLK_PLLCLN_DIV8,
>  	CLK_PLLCLN_DIV16,
>  	CLK_PLLDTY_ACPU,
> +	CLK_PLLDTY_ACPU_DIV2,
>  	CLK_PLLDTY_ACPU_DIV4,
> +	CLK_PLLDTY_DIV16,
> +	CLK_PLLVDO_CRU0,
>=20
>  	/* Module Clocks */
>  	MOD_CLK_BASE,
> @@ -49,6 +53,12 @@ static const struct clk_div_table dtable_1_8[] =3D {
>  	{0, 0},
>  };
>=20
> +static const struct clk_div_table dtable_2_4[] =3D {
> +	{0, 2},
> +	{1, 4},
> +	{0, 0},

Not sure {0, 2}, {1, 4}, {0, 0}, to make lines shorter?

Cheers,
Biju

> +};
> +
>  static const struct clk_div_table dtable_2_64[] =3D {
>  	{0, 2},
>  	{1, 4},
> @@ -69,6 +79,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] =
__initconst =3D {
>  	DEF_FIXED(".pllcln", CLK_PLLCLN, CLK_QEXTAL, 200, 3),
>  	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
>  	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
> +	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
>=20
>  	/* Internal Core Clocks */
>  	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16), @@ =
-78,7 +89,11 @@ static
> const struct cpg_core_clk r9a09g047_core_clks[] __initconst =3D {
>  	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
>=20
>  	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, d=
table_2_64),
> +	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU,
> +1, 2),
>  	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1=
, 4),
> +	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
> +
> +	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3,
> +dtable_2_4),
>=20
>  	/* Core Clocks */
>  	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1), @@ -15=
4,6 +169,12 @@ static
> const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst =3D {
>  						BUS_MSTOP(8, BIT(4))),
>  	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
>  						BUS_MSTOP(8, BIT(4))),
> +	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
> +						BUS_MSTOP(9, BIT(4))),
> +	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
> +						BUS_MSTOP(9, BIT(4))),
> +	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
> +						BUS_MSTOP(9, BIT(4))),
>  };
>=20
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst =3D { @@ =
-177,6 +198,9 @@ static const
> struct rzv2h_reset r9a09g047_resets[] __initconst =3D {
>  	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
>  	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
>  	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
> +	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
> +	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
> +	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
>  };
>=20
>  const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst =3D {
> --
> 2.34.1


