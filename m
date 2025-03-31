Return-Path: <linux-media+bounces-29056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BCA76646
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1461889766
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2454202998;
	Mon, 31 Mar 2025 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GD0SYndx"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3C35966;
	Mon, 31 Mar 2025 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425074; cv=fail; b=uOF4A2JxNxFCgoWqfUUcaz44MPWhtNw7guQyvNZlHuKI9z6RkBn5gKg4Ca8PFMFHXKzEfrjjJlISbRit+CF9UDn0JewH/HjIIbYSfl7gKoSZFkQFK6jOsi599y7AXPyJwYwPFpRHX5tx1L4hFsI3oWFpCaO0WtUXf4VpuMEKte4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425074; c=relaxed/simple;
	bh=z23PExweeOujSp5c8Mduk4giXHekRzLXC3RP9XyYkIs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kgIAwuJoAq4w4C+YmOzNowWJqrXuG0q8m/xYfyGEQP6GaI225zCNzI/Soy+nUCHkWxi0P0XQnir4n6Byl8L6ENLvPlF3PqL3FRaoo5jexfiA9iijSk31no9Dodl+ZdXkHBgU+hbTm7NUvjwL6BAmOMe7Tk5PBE/aA2z1TqTbH1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GD0SYndx; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sh3QJlmYqetKQdyCC2SRPx8Y3q4h6nLy8UiXBvNw/2dznVq69oI43H19TSyWElob0+NCXgv5j2ncYhrUdGaKS/L3415CW8w4RIyy4s9AyIeGw/HYvOrzo6zVluQbP6zHoMyDqjUK2mIPHgrj0/hyaY1a+1FIeCs4LVaq/FYtCfK8udWG5uXZqH5FAuC05fF4P56hIl4DMY1a2AI8buh92Ha6wcVqqNkFmvIElkvyq9v/15QiwKj6eMCGfimKSPQa92Vd11T6KuNYwK6Kr3Gxmy9AGx9Fp0/gK6jaQs7Lx6fb/NeX5/KGt8zZXwwgZfWFQGQ9mGKKq1y/Rabh1yrtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsAZZONnVkgSR5zfJYN2UMTu+SVProZGGoe+cjYH2go=;
 b=c2aJkble6y7TxosVGC0v3I/q8h+cUbjyJaBtdW4Bo3jUF2gJw5aR3ACRxpu5fqQlAU/rQyYA4dFv8yBqK2aDkzNZnDG0519cF9IHv0m55dXBttTNSBeTMnnJtg7dSU8u0o/4ZtyEmXque74hkloNz16/1OzPEDky/D/t2KpxT5iVbuzraflX5u2O7jC9k5tDDk5ysb8uBqyUsZJcyjpPPMP70KXMNXqSTSX16PKPi1oCJ7GSx/J2MN0JmuOFR2ycM75KprNAH5WcqGA5HG49s8CQgLlaiM7USdNNbU3ooogZjhW6+rKuvoRUTv7DI79Y93S3/QmzFkVYdNQeUkU4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsAZZONnVkgSR5zfJYN2UMTu+SVProZGGoe+cjYH2go=;
 b=GD0SYndxewOHD+IAAcuJtzl3JyATq+HTcUejruGA7QN2AY/GOJHXwt1RiJ61fiper9ud4rO6RxVTls+mlDzIWGCjCK1aUrHxqe7iWxLfYGvGy5N/eZc53YtD8eCMWVBVuTrrgHQ/zSODT5q8X4Jkj4by7wUr8GOUeRk5okOkwXc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8046.jpnprd01.prod.outlook.com (2603:1096:400:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 12:44:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 12:44:28 +0000
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
Subject: RE: [PATCH 16/17] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK handling
Thread-Topic: [PATCH 16/17] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK handling
Thread-Index: AQHbobfkgzKMjxffpEKUq5Dp2VtvhbONMTzQ
Date: Mon, 31 Mar 2025 12:44:28 +0000
Message-ID:
 <TY3PR01MB11346216346EE729F1E5B200F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250330210717.46080-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8046:EE_
x-ms-office365-filtering-correlation-id: a21953f4-8244-4811-2cf5-08dd7051c6a4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0NMT22H62bX8ivtrJRBw/2cnwXeGopv+kDsI6psVDiT+utNNWVAVqF+FHhEt?=
 =?us-ascii?Q?K/cfmltriRfFehqDgiQR3OjtvmVJa5Z+EGFwMkZaHXxQ9MM9or5RSnT9/O4M?=
 =?us-ascii?Q?ToBMfeWFnzvBmvjXuZpSOeGvVH2q7ywQMN4UhkpgyhBxh1XQ59NRyinDQD/F?=
 =?us-ascii?Q?fbHxa7K9w4DASm+Ejbv/+HudwZQe/e/kYFxZmVnzI8iHrUwjKUmGSXK61lfs?=
 =?us-ascii?Q?s5sPEYhVUOD6eowl788fiy16WARWEreGqAhFp1CGmGkXVwaRKYYzEHzXUguf?=
 =?us-ascii?Q?nW3iv/FLy+WAAQKak9hna1YeU09HM/nQaw3s1gtT2x/8IxLEpbd+P9a6WRLI?=
 =?us-ascii?Q?bJ7/l4GjzA6BBj+LdczdmsYweOvISUMEc7c7gcSO7dbGkHsGRD6qBDcRd6C6?=
 =?us-ascii?Q?spnglQhdI5sOIyO7SIOIYHl1A0rpGJOH2+BEbZ0Whrhwg/uwxXbxzCFXSahg?=
 =?us-ascii?Q?+zxWYwet+6kTdhsApkZNtxCtHdSvrN1dkOOV8dL4clQO32Apkcju28NeTYlE?=
 =?us-ascii?Q?473Dv1zVXn7ysEEH+RoGSop/iHpiL4EIMJ8Q28bLEPjlAV4WNv3LVupMEU0e?=
 =?us-ascii?Q?OhfOrbV0RJmRE15BQQqau04M4iTl7N7pl/PituO9Y2zRDosb0Dn8px/1h+M8?=
 =?us-ascii?Q?yxh8aJVGROV6Eow0q33hPFQZqe/ys0FsKZXT8Qu4cmpRnVl/OffbkRRFTHSN?=
 =?us-ascii?Q?JcV7kKdDE4LmS0EvkwL+qhS1HRQopRoo9Q7hdJA1sDaw4CQjNM/NyXiVs1is?=
 =?us-ascii?Q?P1t8/ND5EKPhQ+SwdafapHhrpraCAlgUcrIt7EPqo93T1Czx7UT7NDwZLRCb?=
 =?us-ascii?Q?xAf/IykCetpLX1fXVlarBYz6+yKbsuuO5zO4f7IFd8hSQXRInbvw6r6v7/hp?=
 =?us-ascii?Q?uJgQKoAkgptPVMNxjd7waWaU0AElYTbr+/XkNvUEgD2fnzf9PNPFVF1iseKv?=
 =?us-ascii?Q?lG1EKzJbSBHFG0ddPw25F2Fo4ayQP6Yuk1zv8iBvwheuhF9zy8Uw9pOf6RE4?=
 =?us-ascii?Q?f0xGXeB3CmRavz6oCkGCCwJEtL5Jz/KYr6hIHc9e/Paj1yw6016KEUVUhZn7?=
 =?us-ascii?Q?I7lO59GXl8COY66JLkR8kxlr5zN96Jp0Hk6KhKiuv+r/BwGuNy8KZC8X7rZE?=
 =?us-ascii?Q?OAy62+hWq+6jGm0wPeZbdSCPAHGN3ANPztyZyZIzNpvWEoVhhQDUrNguz8q/?=
 =?us-ascii?Q?pWS8BgSkVPWfAhLHHDtKyO/XQrh8c9jvSgVHecG/Y13JgGQVcyTwyaGh3Kt6?=
 =?us-ascii?Q?9h/Lxw9+xa5+vLM4rlFiee7yMsLT+ZCEIC34X3c6CPyaw4HOQkKGmonAvdpD?=
 =?us-ascii?Q?x+eU5UAMTshpgIcz10f9neBOxU5peziE3lgDrqADRi/qRIVX3ION4RR6hCrC?=
 =?us-ascii?Q?EB/YJ45iCiO8ae7MzsbdfDN+wa8XLTMZYQLRzTzs7u3xoD5GJdNP2sL6NtVI?=
 =?us-ascii?Q?27sD0J93koukkVYhA3rPR14c/QT0rSD/lKdr4EveSn1pYMg9fxc9jg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mKonuUy4pz0okVZ49h3z/NJEW9kAnh8MXsjcHWCmZsrvhZtPZdh26ajgx5bO?=
 =?us-ascii?Q?Yo8e6wsQ0Ay3cjxMdYabljL+5cSton5Oz2/RXOMSsZxZaN/ebk9HuSXD58QA?=
 =?us-ascii?Q?MKRZN4EplYWqZCMr/gbUVzlp+YV7dDe8b13DhMATOPSKtQ/etBHuBMnYIthG?=
 =?us-ascii?Q?YrD3t3+lxctCSzigXyHcrIuJIufMd6Fcer9mi1fIIawnx4P+gaWoWHtMEnKU?=
 =?us-ascii?Q?u1XTcK5dMZCAIlmPuB4vV946/46PVkkodEIE78oQcbgxDAyBfYz6KrknpZAm?=
 =?us-ascii?Q?zNaQPDkqVd+H/uJMkL4D/jFURUGP83lBVEUjNykprSXjXxV+ROaqqAqanOnR?=
 =?us-ascii?Q?KtoOqJxxlPrfF6yyBz2fWPH8i+Cm66GoF4vvM8tpc5nbxmseM2DTvvvqJGJU?=
 =?us-ascii?Q?rH0uqMm23/nenCwtcHEwVd7TRKFuSM3K7NYx1jdiqG2VUy9JYYOINACeATSD?=
 =?us-ascii?Q?fzrTKIh+v+TwAB+OvzKrFkyzUIswGESQ74dl7DfrLmLfv+EH/Yquf4FuEJkv?=
 =?us-ascii?Q?fbifvQdfhEm2dHOGj9FiFoSkhsGVQjlHtXjZfUCad5y4RXJJmfJjhpj9VHnB?=
 =?us-ascii?Q?TgBQOkfhzm9EOegq6fYJD/h+kRW22lwmSQMNOnjXDB135o4uZnNCc8IDf1Wi?=
 =?us-ascii?Q?tUqeRvMyDrGNQf7cKAEE8OFsntRBGAYTgISe3ly9VfIm7PBhEA9Gb8eg+Go6?=
 =?us-ascii?Q?uK225cVqHh/iXrgPALHlhZTf5Bv+fz1r+pdH7IJuLtWZ1hSLgZ91y6+CETEF?=
 =?us-ascii?Q?FuoBYk5NS7DxHcvFKBGBgPJtQBW8+o9NHvb+mIYNOg93bkr80bBhJlO2GHX4?=
 =?us-ascii?Q?yAm3oa1LSLdwbCoQ9lz6YS9uOWPc/Hrk0LthsJ8Nh7l3iEGxIlKWFDIV7WIB?=
 =?us-ascii?Q?h4GTJ5HEXj7vOYw0HIwBISJ+NrwZIL/JUAL2n3TpDpvNABqaRULUOeMUfAue?=
 =?us-ascii?Q?DNMGasxdbLQuYVlis/L4D2VUonYwsYVCN/ZBaSP2ztofZB+kP2kNh6OLaKJZ?=
 =?us-ascii?Q?vqAKT0mc7RvQpD0tHa/t+28m2khO9DaQeS/zrnq1qIZ61+jkgb/hF8T8TLOw?=
 =?us-ascii?Q?PkPRILuzOgt7qn/iJuptVpU92ad45HAtWqz7eV21RPMfNMNW45Hj/eIs6TcQ?=
 =?us-ascii?Q?8jPZYJrH1j8hGv0m2O5eL20D9lJ8a4Nasz9zQ+RjLtU3TaY4AakldjkPV0th?=
 =?us-ascii?Q?V56xiIKzZcXZ634Vk8LPMAoKpNDJYQ+DICT+LQk9of80bCQ2fots5j4TpQrd?=
 =?us-ascii?Q?EksgaQb+ZptstgTiSBbETZuJM5hUqGBQoRIYW2B6uCmue6eYlP3QRXFlI6Cx?=
 =?us-ascii?Q?F844ohlWoT1NqiNqLPfdWVM85oiTqtmhuRxuIrphnq0dbCtut5cJX+uIzRHV?=
 =?us-ascii?Q?hcGr7QxAnw7LmIu0y2QBVg2if7iHetIrOqWOL1qthMzF91zzBzD8fjH53Twt?=
 =?us-ascii?Q?1/TnTZQVRt4+lnCI7AZzWdXus7qvB1rafUQC7p8tu1xbE+neAyOKxSbO3zmW?=
 =?us-ascii?Q?zX+Nxv2qfVFqwWTKCohT3dVbDtPJJA3e84RLhdvJwe90f0ecyPGc4hn4anJS?=
 =?us-ascii?Q?eGSCZnbnsD75Vn+digXchd5QgMYlpXe9jHIA2JubF13V5KgnYGAtbViaz8xb?=
 =?us-ascii?Q?Vg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a21953f4-8244-4811-2cf5-08dd7051c6a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 12:44:28.3389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkIAx8oALV8CjwFpJH5WDGyddH+aJpxv5NHa5GvimjC/kOn0ekFl3g0zcNJpZIaU+HXBNK0TAM3zq1veLqJ2oyB72hQZ2fmHjL9glPAa7M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8046

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 March 2025 22:07
> Subject: [PATCH 16/17] drm: renesas: rz-du: mipi_dsi: Add support for LPC=
LK handling
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Introduce the `RZ_MIPI_DSI_HASLPCLK` feature flag in `rzg2l_mipi_dsi_hw_i=
nfo` to indicate the need for
> LPCLK configuration.
>=20
> On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required DPHY r=
egister configuration,
> whereas on the RZ/G2L SoC, this clock is not present. To accommodate this=
 difference, add an `lpclk`
> clock handle in `rzg2l_mipi_dsi` and update the probe function to conditi=
onally acquire LPCLK if the
> SoC supports it.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 2ca725a2ccaf..26ec0f5d065a 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -31,6 +31,7 @@
>  struct rzg2l_mipi_dsi;
>=20
>  #define RZ_MIPI_DSI_16BPP	BIT(0)
> +#define RZ_MIPI_DSI_HASLPCLK	BIT(1)
>=20
>  struct rzg2l_mipi_dsi_hw_info {
>  	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_=
mhz); @@ -63,6 +64,7 @@
> struct rzg2l_mipi_dsi {
>  	struct drm_bridge *next_bridge;
>=20
>  	struct clk *vclk;
> +	struct clk *lpclk;
>=20
>  	enum mipi_dsi_pixel_format format;
>  	unsigned int num_data_lanes;
> @@ -792,6 +794,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>=20
> +	if (dsi->info->features & RZ_MIPI_DSI_HASLPCLK) {
> +		dsi->lpclk =3D devm_clk_get(dsi->dev, "lpclk");

Maybe use devm_clk_get_optional and drop the check.

Cheers,
Biju

> +		if (IS_ERR(dsi->lpclk))
> +			return PTR_ERR(dsi->lpclk);
> +	}
> +
>  	if (dsi->info->has_dphy_rstc) {
>  		dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
>  		if (IS_ERR(dsi->rstc))
> --
> 2.49.0


