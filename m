Return-Path: <linux-media+bounces-29051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CECBDA765E9
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08E118899D6
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85BB1E9B1F;
	Mon, 31 Mar 2025 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K2ZFPViL"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E68D1E7C09;
	Mon, 31 Mar 2025 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424096; cv=fail; b=WjkQWs8LdL0lUUs6jKJcJASGpCju64JDLLra6KQsWAdVfziCR/6S8P6p5oxkojFEUWghB9D2sfHSsMNRV6Y9Fwbciiv+tzdjC2UAdOagDLo5cLuXJnvVnSNagO6yWEnTZUDTOquze5i7ggdYqrnOPB8lCy1I4eD5oZt5nlXW+ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424096; c=relaxed/simple;
	bh=2p4mpb2x6JkbSZgwW9sZbDE93FXZZMndvL5ZdYEfcy8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=blN3dc/IzUTwQIFOgMUsd9/nxRyc98FSJ74mblHkFLkH8RLlZS9WUD8OwHlK2ovZS8E0RafzCeJoXl+vMTKt1nj8pFe+Ov/KwOGfLD57KZ5Qgbms3+vTBWsqtf9x44fTRVFCk0nUN+ZDbYG3+98LGqtHB6K0RTxFIGxe6i6gDi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K2ZFPViL; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIhE1t3zcVJJ3AjlERdR/Ywma/g1DJHME1uWMvfamsJCzL/t2zqDJwTkaCpb9j/lRmYZowUIUl07IIMQwk/OJfp28rLr17imJdfMGBLxKS7dj/eVVghw+AchYMyKu0Ha1RE9a1Okahrq/yRcirQQ8yzUrY9ehHzPxidJPctNO1I8K0pQnE8nJYen1x8nU/OyzpKnwSfwINE8r29KXVwuF9m8kzxnbLYuL4KYfHwmEq/TvY4ErLLQKz6cVXQlq7JGdgROBviqUP2BZlkpFE48D1yiLQan0wh35Hg+FAiLhw83pgmsfNMK/9MenuHYSGOMvhuH1aIA2j1cGrTUjzVSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAVnHMBmgOlxbKLolCt8tRJO1HJJmXYqaiK+usBDTVs=;
 b=xu83FgX9msBMXHV9pTlcAijSPrx1+ZUJPDeIKgk6n44IYp2a6W8P/gp6xNSdpJo+31OUK+RDX2sbjSBgeVSnLbfb6PrXwC73gd1L9mypWS7gUrsnzJnwiLjFAcxk8DTcm4vfqDsYViI8Hz1B7MpsR24JdDCTlioKwR+vOOvhbl37QyWYoDVy5cY/HZFfGL5ZpAlWIovdwKkXJNL3mPL5W/sTbVboQqAnal3y6Rkj1zrWSI22B5t3kJHIU9fLbEGazASYQZb98mAZRZ4oDFlYVLCu08yLQ7SRjf8f8LnJubWyM223ir3z9lOLC4FQPZAzXlFA5hzUPv/OZ595sa9qUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAVnHMBmgOlxbKLolCt8tRJO1HJJmXYqaiK+usBDTVs=;
 b=K2ZFPViLPAbBDfeU72bP/gopCnQK3v8J4KNvgmR7AjmJ2RLVPNqgdsdlWuH6XoEn1V9CjKps2miDQ+/gDhZOG1JDaWeGGWAmovbOB9+BmsxDk0NSnIY+e4/95rQCi06LXbDETWMjRnsIx1IMiJjFXAuqjs7U/nNobJW0JOSwUpw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY1PR01MB10707.jpnprd01.prod.outlook.com (2603:1096:400:31c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 12:28:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 12:28:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 09/17] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Thread-Topic: [PATCH 09/17] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ
 calculation
Thread-Index: AQHbobfcHcJfXgQAOUWAWej9fOprQLONLM9g
Date: Mon, 31 Mar 2025 12:28:11 +0000
Message-ID:
 <TY3PR01MB11346FE7A28E0377BA80B98FD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250330210717.46080-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY1PR01MB10707:EE_
x-ms-office365-filtering-correlation-id: 92dfada7-e0f1-4b2e-26f3-08dd704f805c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HLf8XUVLYTeNbFWa9AzcwnnxibGX3knMnHLQkpsslrqcROjoKvccGkIymRB6?=
 =?us-ascii?Q?GGWIyTNEzRznQWbHSTRXUzEsWCuCdTUIY3WtCdCytPae2kasQndfy8BGUHIa?=
 =?us-ascii?Q?AjufGzeYnj5QT9FVA1AEyBNLSP1eTasN3EaFg5ucmGM3+3wbL51YEfKndPUS?=
 =?us-ascii?Q?gYnDj/T30lgaLoYiqzFfYyq97NUpfgNsdadsXq1igbPesGhRt7oZkmoBk7hu?=
 =?us-ascii?Q?vwPy3VPRN4lCLFQqbwZFM+XdQe9A4sOsuc6rHc0wtIpGGqHm5EdDllEM0fJK?=
 =?us-ascii?Q?/sWDioNOQ+yPFDT23OeWy1mkzkutslqsnDYocFKshAqIgDoBCiHSxyByj/CS?=
 =?us-ascii?Q?mAxqsEve+dKDWEeoiLUNNNczfh+VaZ+wNKWdSS4qNXsEzFWTNXpALvhF2kW+?=
 =?us-ascii?Q?32/LBJtYPvhfGvlKIVPkXXUO20vtJNEr688Laxo7rzNsOWht6DkKCXAWH7b1?=
 =?us-ascii?Q?KWBK4eMRwJFSXLTLeH4jQkI4l+njdJI4eu3xhue5n1wVkNq2zfNLUCU6qcQV?=
 =?us-ascii?Q?pKv8EdTe29JxoUIOhX3Pm9BMQTubiodAnapVPjIfQtbOly9KV6YWwaO9QNTH?=
 =?us-ascii?Q?bqpqqoLiy+JwnFH1/PPD+SHstF86ErvnxTeUYR2lWb7UzNWrqVdTFAkp195V?=
 =?us-ascii?Q?3UvGik1tXM22X39nVSTRvhXtcmwlPwRlSlWkv2nEuG3fpL+gUH4fSl8zCX3g?=
 =?us-ascii?Q?tNk+uT50uavNMs+noZDaXRtaSDLoOL155roG2jqO1tY3bJXjoB2yskH35lSi?=
 =?us-ascii?Q?JlQMklSoPnWpy1UwUOB+hrfv4YFoHNb/hVJeB+/D5X4ElBK3vRZUi/ZiIoeY?=
 =?us-ascii?Q?dSKzhHwvv8SEp41DaPVFkqp+Ukg4aqBMseC8KiP8rNoMoQpsbJLKNpxR9BoX?=
 =?us-ascii?Q?huYRYlEy/k19RmF6mmv7/mK+dZDLXGaLsenW/VNukF1fLir/5/CYT96P1NXa?=
 =?us-ascii?Q?z4B/V/3lJuW1v/jJVhmAt9p8dqb7cCrPVMH73GF1Z/Dllh8KpNwY2dm4PwQ5?=
 =?us-ascii?Q?K2YGkD39bq0/jSLpiifEysWRkWJ+CUrrZVwpVfeeuE3oWWxx7R07PPTjG5qm?=
 =?us-ascii?Q?1R45zpVJflWWIdD3PKlXLyUoh7Z1DTzbkzg9LWdCM8npEg7QZ02HgvrrmZtG?=
 =?us-ascii?Q?SgHIEWdwy3AHMfpFtOTwEk/LEkvmYXxzB8oN6NN+tKFNR96ZD4lC9RQ2nR2H?=
 =?us-ascii?Q?DTdKH1UewGM5D64dceiD79R+49z3dPGm3RVXGL1fMklsqgmC65juV/MMv/NN?=
 =?us-ascii?Q?cSDkwvAgd7ZyBR6J5rJpqnNuligSNO1zf8T92/+5TDXxKz6K8OCQVOf/cHuH?=
 =?us-ascii?Q?BmoD4UxOVDyPV/eTQ5FjzdX2u4nji1qbB3vIs8nh/VQpXF8Z6ZHlTppVQJsw?=
 =?us-ascii?Q?CvHJG/mEwj+Pd6zc2kWhnSPcZQJ7m5zxKGbpPLpZewJvSj13Dnx1VaFycqjz?=
 =?us-ascii?Q?EA4mkKadzXWJJFgjvKZ+Yc8Dn4X05qoEg3H/yqdDNo3FSEtOODBQ6Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SKBIiclSCsXSGhs2sbdd/FMlikUhYr5hYwBSoRepcMbHjyfHjdSdvgsfGjFm?=
 =?us-ascii?Q?Q92Jl8x+Wi91rj0cz0qvcqkKcT7OZwzOo6bQIE/5Jb7Fu93rsFevwg+T+PT3?=
 =?us-ascii?Q?Jbqn96WI937oc2TDr4eOQ3pML99V+9NCY/yrv4EyuQ8jW2uK/0ib4yb6OToW?=
 =?us-ascii?Q?WnuB6WSLnGcpNqH0dOG5StHWUqkL7KEwcWMD5u+wr83ucdeDc0k3f2Sd+Mki?=
 =?us-ascii?Q?Oxy5tA2lsB954O3olWTHZEnX2j0bZk6zU4QwLoX+aTTymKez9LaqKGyq+bD5?=
 =?us-ascii?Q?aYyC+yIuKqSFlXYQTywcA1wpK1nxsEoc3VZakTIgiLao57AGld9FDYiAFhFc?=
 =?us-ascii?Q?zQp2vdCHrsGHEtvXpsr3U2Q9hBYEIogX4KOEeaWWDu3I0kQlfoGW4j0JJfbM?=
 =?us-ascii?Q?yLT1Yoz3kUgPaWjFNC6pneUOtW3S3PRhddrlmb4F5Saf11VU9RbOUzMZGUvo?=
 =?us-ascii?Q?rFaAfVg8ldOOjIdayeXDZtCP/uvV1tjQjlSH1iCJQoy5+HvNxzAJZkqvpYJK?=
 =?us-ascii?Q?WP5ZiFUynQErjxxz106SQiLgB+ye6K+6HdgtgnQARg9Mb/0lh2TzUSCZjn8F?=
 =?us-ascii?Q?7XLgzEiXu6Akocj+6aBKMFXEtGxnotDDvkUPhEjCA3G7pHBSqbdoY1lDIewz?=
 =?us-ascii?Q?O/LssaQM94LEJ/2qTry8Lvq3fjO0AztOqTG0sNrsAXE4zwI1ZsiCO938MgY0?=
 =?us-ascii?Q?La3ww36erTdVNMGIy7SMxVnvzZBdARqpfeehDnkcCi7efuVpoNEyFoma6MCp?=
 =?us-ascii?Q?YtyAS2gS9hMKYWj3AfE9QIKDyp1Uw0wYTO4gib86XSGVXSYJ9zH2CZDvSMx8?=
 =?us-ascii?Q?hHXxhJb+we/v+XY/0GKmNwrR5qRcZETrvTqINUCPbMDDuDNS4O4LxEebEKG+?=
 =?us-ascii?Q?P0Gsh2Wrp7F3X2vZpgpuyZHM4IOLPiIGD1Uw35/XoJwD1pYFugrQQ/5fMGcM?=
 =?us-ascii?Q?da1KE+BfbpZ+WipIZWYkSpTP0ZWNCPHsX/m5QMqYyo28Hd0Xgkfvg8uR18Oc?=
 =?us-ascii?Q?utuVbjm7Gm9ZPkClhsIP68TAJ1aBw3Zw8k7DkS/5l2WxPoLdSW51BTeKPBdI?=
 =?us-ascii?Q?bp5Bksp4OCNjMHwdwrOnj+FeCHetTmz7i6ZXElqO4WIFHIxeJg6vxA+BX/iO?=
 =?us-ascii?Q?TFKOTIXLKdLPad2q5+z8KeB4NRSaZDjtQP+Tfp92T5BOS+HzUCiQZdQ5YbMu?=
 =?us-ascii?Q?rHnZb2ZqA7KeQkjwtIXcr13yDdKn2EQ4P2j1GycsrcCHTeJA4xpLiq3xZgQr?=
 =?us-ascii?Q?nLheN4K2y28jFolsezlCZ0HtvMZ41wPymlTcZD2FK2X92o2NFjYCjdrjBM8e?=
 =?us-ascii?Q?quC6Qm28+46X4Dj+aRpSiCtxM8X/yuDhiwwSR0YbxWCPpvymwdZ1DYfhH56q?=
 =?us-ascii?Q?14WlPo6M0eMjI7Z8Bf2aoLUTqNa2NadKBhuz32cQ2/yQhv59kiVpY9u+i8AP?=
 =?us-ascii?Q?9RrJDgpkdTz7Uwg2Q3yvXigLKMpYLP8vdZWpZ1Po73rA9Hy00HD29JQkYBX6?=
 =?us-ascii?Q?teeOODoer+AZp/R2xIW5CZQPUzlnUh4fi334ZNOCBMwgENbPPGLol3Y5Fl/y?=
 =?us-ascii?Q?1pQPLH8fUknjJuFjpbPzr1UDSvD9/T5ybgM6bTTsl2/PiSZ4ae4J+IpPtvvN?=
 =?us-ascii?Q?kw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dfada7-e0f1-4b2e-26f3-08dd704f805c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 12:28:11.4512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIWMSiMLZh775dCPmDHOIJaHRlRxgDTDwNKNqr9+/EfBOTJzYrbTcFGMuQWA85wjmvhN5aC1r8j4ZKh/yO3Tzx/5cw5JPC9mr0Y2UNPlrr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10707

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 March 2025 22:07
> Subject: [PATCH 09/17] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ cal=
culation
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Simplify the high-speed clock frequency (HSFREQ) calculation by removing =
the redundant multiplication
> and division by 8. The updated equation:
>=20
>     hsfreq =3D (mode->clock * bpp) / (dsi->lanes);
>=20
> produces the same result while improving readability and clarity.
>=20
> Additionally, update the comment to clarify the relationship between HS c=
lock bit frequency, HS byte
> clock frequency, and HSFREQ.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index c6f60b7f203b..746f82442c01 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -277,10 +277,10 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
>  	 *       hsclk: DSI HS Byte clock frequency (Hz)
>  	 *       lanes: number of data lanes
>  	 *
> -	 * hsclk(bit) =3D hsclk(byte) * 8
> +	 * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
>  	 */
>  	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> -	hsfreq =3D (mode->clock * bpp * 8) / (8 * dsi->lanes);
> +	hsfreq =3D (mode->clock * bpp) / dsi->lanes;
>=20
>  	ret =3D pm_runtime_resume_and_get(dsi->dev);
>  	if (ret < 0)
> --
> 2.49.0


