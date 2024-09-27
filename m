Return-Path: <linux-media+bounces-18697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380D988581
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 14:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDDF71F21A30
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA04B18C919;
	Fri, 27 Sep 2024 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Uo5avwSe"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730BC18BC04
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441491; cv=fail; b=AwhjLFoB4oAAekbzLl3c1kOjcCJS1ggNQyJyPDYV0jOFu7PowSDDUkq8OpEcRkO3NFDJOEQv0eKdfzy5FKiOvKtovj61/iRiop3/82iTPW+9J+9ltBxZSixYsiWQ0NHWMqjkAghpX9ztfD0h1uNC4fWioET9EQmyP52mU25Ay6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441491; c=relaxed/simple;
	bh=KwKrtLIHVzfezgBAmf/27MMOVSKo5pUNZHfolGqk+cw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LrjinY0oJWJL6XTZZ202qF0+ouPSyxIctzedFwBO65KDmUIAEeZcQHvS1dGjOzdhd2DOch2bDnAJEbdCu/9nD01i+2Qu3rCDarJEf8QBVunurn8JOu/bcZzhfUw5BqRZ4j2hwRGN38lB7+J+DkSDmANsFsqhNRweHqSjdYAr5Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Uo5avwSe; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oo3UIuFy2F0AhGFyIoJ1TzgHel24OqWC0p8cetUpWyIw7WqC/ZZG3lYDeWHyt/yndfxo8INKEvfXz0sxrogre/akt/6ccE1/M9XrWS0GmfFUdtS2TdCrrf+jJCE/0EI0P+oDHCakj9Aoxone4lVGP+bvUkYiXGu944PCldZT8JxgyVXS4nwbEUvE71qRMyqwo6qsP50nu5yfBwBMUzxCgwTjFByHt23QiFd69s/NRVFbdd0zMKpFhzmL8h1ibcY7UcWoz3X4c4oXPImnJX3jUqjev07QeqSn6tFdFJNCYaD9N2YarDAn53JVeyh2uQuiiZLC9auu6mO3Eaonj7iKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T9ENEWJapanmoKrJpC8YNn2g26VJW3d+q7bbibHKEo=;
 b=UFmUG5+0I2pgb7HH5qy52Lfb2AlmB0fs1ZqKd2AQPKROUsy9JdD+rebHKwc9p9tD4hQiE2jXAcyjJvPLwsRdy0Ts7bErFtsDkRMyG4cUe5HSlUF7Gzl1gfkaDqxvjhld+E/1gr63qO+Vpz1E8kxco4QqepYwso6iQveQ7nv1YXPoSnvrY5d11zSorynd1fafOY5Wa5UTzCc/3sSSCSkueDuOCt3nrTSCREtEPizYccTMtY5pRGKVRpCfwHtpz4CD1tBxelii8bDnKTlBAuvXvnmBcIQ4uMifqk/UsSGK6QbR650a9H9ElfR8bWCiRvF/2TSo0vKiFmfo5Nz0aefyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T9ENEWJapanmoKrJpC8YNn2g26VJW3d+q7bbibHKEo=;
 b=Uo5avwSedIgPUq2DdpwuwlLrcrMxtpWs736bzxec7jyqWlVgnw/WCTheeNp0guM/sEJ6uped3EUWIl7MccR+NNFJ0E19Ogf7nlPWtkIm6pZBhut8fZWuJ3UandX0GxFszsiPVH8aup450CnTDv6i3Tpu1e8b9cBG2sW/8pkUZ8k=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSCPR01MB13142.jpnprd01.prod.outlook.com (2603:1096:604:354::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 12:51:24 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 12:51:24 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
Subject: RE: [PATCH 3/4] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
Thread-Topic: [PATCH 3/4] media: platform: rzg2l-cru: Use v4l2_fill_pixfmt()
Thread-Index: AQHbC1py7oOe6pC5J0W7wMikXZsGTLJroEIA
Date: Fri, 27 Sep 2024 12:51:24 +0000
Message-ID:
 <OSZPR01MB7019254D2E2BC702CE6222ACAA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-4-dan.scally@ideasonboard.com>
In-Reply-To: <20240920124115.375748-4-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|OSCPR01MB13142:EE_
x-ms-office365-filtering-correlation-id: 7c804045-4e59-4cd7-fbbb-08dcdef31838
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hIrlEZYlrMLJvosyR1OoYJ5/e2bWQplTrnTELbxi9243V3/6RjhLrVs0B7qq?=
 =?us-ascii?Q?zaC/S5qhAKUhLRPeO8w2mpQDViyawI7gOXx3+ynhsg3lI0RoT4VFu41jNhs3?=
 =?us-ascii?Q?gPAH+9sLQbcJn5jHw3IZeHcCi9pBq3EfK9+FDFUw+SiQpdEeBWUFYgdloSFI?=
 =?us-ascii?Q?XRuvFdgJkK8omNUDk1AL6Y40r9m/4xOpNiKhTTcdqtTUsko7X9wMgD5ShnHo?=
 =?us-ascii?Q?QtTcYp7BiCJyOscT4G0+o2Wap2PgbpNGQC0fZMfQWNezjKvlN46o+Ej0WCd/?=
 =?us-ascii?Q?BNZ6zOcKDcd+NTQheTN8Hg2E+eOc1zwR0FkUyYUOSEN/5wNv/HoZw+ItCrbB?=
 =?us-ascii?Q?jAihBpdHX5n5i3B2T3drd2wuECYZHoXVX+2+giBePvH1GaTP1U24awW7XW3r?=
 =?us-ascii?Q?TSI7bV/lMnfNMxA8HlT4xabRxLsx6p3C9eD7ICxn6RDx/bxzxRQTg2qPIr5m?=
 =?us-ascii?Q?6gvRG46G1sRfveVp7W7B0PvKWi4yQ0trZSlSfrPD8MuO7zOpKPHo1Kq9wSNq?=
 =?us-ascii?Q?x/nAzMLuMtSAvuBgCR6V6wH5Zvfmbw6P4ny7ASFtycf28GM1JKMyxgDpS4QC?=
 =?us-ascii?Q?gvTBbsPOXtX1Y1jmBIuFqeJ6Ne/1QyPQzZbFogArXGcNIfCTsSLToXtir0cY?=
 =?us-ascii?Q?tEipLGs+zC5e1g7Y2DXM1n9f1XvkhsSzAEiR9J5ODyuuoZ200Ebxb3AY5+N8?=
 =?us-ascii?Q?Gz3b6PMgfzXpIJDbxvItaQBEBCvSFksizqlfziZM+L8X34lY3xbZLADD5RSN?=
 =?us-ascii?Q?+Or9KeVT8C1yfne06XdZQr3hg6nb24Y6ra3c1KOksXSLBu5m3XzHMGljStE7?=
 =?us-ascii?Q?iItoML48dOJWcToYEjUNRLoJTT2roSFbmTPzzaYoyEXqtY9tUzGKtO+kdjki?=
 =?us-ascii?Q?QSaCVMzN0e53MOsyrYR1uvhs8/v6adhygcOcCusr4ClhrMIADatpTjUFco1v?=
 =?us-ascii?Q?SpZ/lgCVTZmJMXoQ7S0g/Ruw3aCwj003T7+Yarr1QUoY8XDDi+/dggJPbH/X?=
 =?us-ascii?Q?B2ZSn1heTHgjdCVNLv3k6MVBTucUaxz0LlBqq1xSt5/+lY+N6NWdRdIjento?=
 =?us-ascii?Q?nKwjp06g7P40iYqyPQDMV1i0hxc4Xh+XrgYEAIm/WNj/fWKgxGCY7Wdp5/js?=
 =?us-ascii?Q?4vQfRHZMCB7eDztmfi04a8C+97GSspCWVh2Gk9LWnVAwNh0OIFyq0+aLY1Z7?=
 =?us-ascii?Q?cMdgVvUuQK2wJgWchquXXC/tFy+kgGrwBZmcE1WpJ6FM3p/WR7Oas8Om2dDl?=
 =?us-ascii?Q?Jeoc0AzYbdoVMstdW0Ku5q/fKE8nr8ZhOR/dsXF0hlcMXnt3Rybw3g2VLv+4?=
 =?us-ascii?Q?B7uC4FwTniONPLbUM1Unex+F5prxzpbfApDPJmRe848JYQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zJJFeLRca3VSKxaElFhlA0ARwjw6GhDkS70RW6ApWib5/LdcS7xeJJ1xcl+s?=
 =?us-ascii?Q?njG1rb1MyExNPtC4gGlUYjqwzuDe0FbmRgY6va9Y4cSomKA47jQDS89tAS2/?=
 =?us-ascii?Q?3QFU1qPOii3+VG1N+Um2VLF5JNGH+boOE87T8swGOr14skTwyRsQeZfmXu9O?=
 =?us-ascii?Q?yaFd7gQNesYxCjdxXyJqoykZHE71IPasA3V9BCJauwx9U5vksnivhjIgFJXf?=
 =?us-ascii?Q?wHrwF8i7Sf4ySq1g3svyhWiI1GDfOLCg1x/DTOmubXt23pNJq0XFhH+IGQbh?=
 =?us-ascii?Q?0lpxudSeK1E9d88bFgW5uHBCntdg/Gm29fk/1Jb5g9l/Us5NdKMAJ7mRrOJw?=
 =?us-ascii?Q?K844nla2Y5dIpMxAmvhEcYSfklYSBXfXcHC77gSCo0lPK5xaPTEyzuoaOihO?=
 =?us-ascii?Q?jGB0KRTGoUys0B6sY1/1e35Y3HBwjjazrHAhiEU+9GuFPOFb4k7K2DQ3EpkZ?=
 =?us-ascii?Q?JGqRecxJ9/61uY9m6Ig1g3iJiTTrs/HB9mdClGxpjS2umXEoGmFXMC6p5+dJ?=
 =?us-ascii?Q?KMtA4tAkcDbxxGubL0GQhSmTWSC633aeZ9zyZTuHxm8+5tuy8GDsjDEZaBiI?=
 =?us-ascii?Q?PtQkdjinxPVePWeAFoK2R03k+JdoT9AIi6JSWM2oUBdFOcgBMKn+8o7boGLS?=
 =?us-ascii?Q?Z5GUX/d+pvEjOK2nQX3XJYzSMtd/2r+JEq23UZ/DRIrLX2d3aXn1uFX/Xw9o?=
 =?us-ascii?Q?PI8xaEixgWMEka6Ze6QF0o27dsLGyWa50HP0VPpS/bdK6tVJDyVKF+/Qtg3x?=
 =?us-ascii?Q?o2Z/UBwU+ZKA4HqPW8P5iBcxIFJJs/4QHMTcQ+9RZ8zVsjkqb/UoDn3kYN8G?=
 =?us-ascii?Q?DZn62mUcFYkkFIMpuUiZJekA+aBGQ+p84TsNZJYlL9mXxaq5jDdA22y53/e1?=
 =?us-ascii?Q?NQJcKPVkm0WlZu5Sd8SoP+arPjInaqJwBkIjgUZKHQHBBbsBJTRnXhZ8uOAW?=
 =?us-ascii?Q?q2z7fcV/U8MEWOkDwXk8leJ6oS2nrA0SiZUhK8cBvLmcqvwPONkweKSKNpto?=
 =?us-ascii?Q?Q/kE1BOyV08gbP6qL66hSNkrRRdYT+0cl7iws6YIyfk7cOs+lsLvMwDrz4Oi?=
 =?us-ascii?Q?dxpy0Nh4psXgPH9NRJ1KZzilWZUPrsO0jOiEIVJg8+NpRS546moBJktlSFB4?=
 =?us-ascii?Q?IW5r02m7nGmQUf43Vc+CrPXWM1/pMF5kaN95AdS9jNLjuMWkOXGpd3yDYzco?=
 =?us-ascii?Q?3Rhydb8yBxlcAHpwlYYOkPrcyNXvMEGIXOSxA4YcM23fF4iIlhmDJUyxUONz?=
 =?us-ascii?Q?ZInxkree7TGntVzXj29r8A43w/SYfheG3U7gYE3N8HafFo07X3VX/9oksKQn?=
 =?us-ascii?Q?1YBjL6TNDoJnAVDlQL98dw3TsUflQMiybCqWu3mMCQnqmgJr1HEEvnmw4Gvv?=
 =?us-ascii?Q?hsrFhbRTU/DxFijRPSIYMrULQEtNrJGteF8WGvRS6nqY8BPLgvkEVSDbn+r2?=
 =?us-ascii?Q?t4lBVbvyDzXy9n3kWNwDiKoX3E6XkGo/XU98Qf65xRCTmLBuWHXWa88P0TiJ?=
 =?us-ascii?Q?iVJPtkcdKgblTgliRlvbGoeFr9UDnVkLShzTheAnZUmvVEU6BEeRJ9I1iuTU?=
 =?us-ascii?Q?FCm5EOdUwGkQeLQ9ahmSFA7CbXj00gvagyWEsh85FY2vX3w5yB77YqYz8W0l?=
 =?us-ascii?Q?cadE4LhflZD8alWooIEH12g=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c804045-4e59-4cd7-fbbb-08dcdef31838
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 12:51:24.4335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZ/jsXM205r+z8/UVsCCnYnWXBKO+49qEPBwOx+cE71jYvhJUDXxeGzsoc/MEiwxx04RvI+Yr/ee1NZ9Hvnhs3ojX4Ek1SCnbc83BGTxMCBTz1evBUemZzgGCKjnFtvr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13142

Hi Daniel,

Thank you for the patch.


> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> Rather than open-code a calculation of the format's bytesperline and
> sizeimage, use the v4l2_fill_pixfmt() helper. This makes it easier to
> support the CRU packed pixel formats without over complicating the driver=
.
>=20
> This change makes the .bpp member of struct rzg2l_cru_ip_format and the
> rzg2l_cru_ip_pix_fmt_to_bpp() function superfluous - remove them both.
>=20
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 ---
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 16 --------------
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 21 ++-----------------
>  3 files changed, 2 insertions(+), 38 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch doesn't apply cleanly on top of media-stage + [0]

[0] https://lore.kernel.org/all/20240910175357.229075-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar
=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index dc50a5feb3de..858098b8a13f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -68,14 +68,12 @@ struct rzg2l_cru_ip {
>   * @code: Media bus code
>   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
>   * @datatype: MIPI CSI2 data type
> - * @bpp: bytes per pixel
>   * @icndmr: ICnDMR register value
>   */
>  struct rzg2l_cru_ip_format {
>  	u32 code;
>  	u32 format;
>  	u32 datatype;
> -	u8 bpp;
>  	u32 icndmr;
>  };
>=20
> @@ -169,7 +167,6 @@ void rzg2l_cru_ip_subdev_unregister(struct
> rzg2l_cru_dev *cru);  struct v4l2_mbus_framefmt
> *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
>=20
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int
> code);
> -u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format);  int
> rzg2l_cru_ip_index_to_pix_fmt(u32 index);  int
> rzg2l_cru_ip_pix_fmt_to_icndmr(u32 format);
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 9bb192655f25..f2fea3a63444 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -16,35 +16,30 @@ static const struct rzg2l_cru_ip_format
> rzg2l_cru_ip_formats[] =3D {
>  		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
>  		.format =3D V4L2_PIX_FMT_UYVY,
>  		.datatype =3D MIPI_CSI2_DT_YUV422_8B,
> -		.bpp =3D 2,
>  		.icndmr =3D ICnDMR_YCMODE_UYVY,
>  	},
>  	{
>  		.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.format =3D V4L2_PIX_FMT_SBGGR8,
>  		.datatype =3D MIPI_CSI2_DT_RAW8,
> -		.bpp =3D 1,
>  		.icndmr =3D 0,
>  	},
>  	{
>  		.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.format =3D V4L2_PIX_FMT_SGBRG8,
>  		.datatype =3D MIPI_CSI2_DT_RAW8,
> -		.bpp =3D 1,
>  		.icndmr =3D 0,
>  	},
>  	{
>  		.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.format =3D V4L2_PIX_FMT_SGRBG8,
>  		.datatype =3D MIPI_CSI2_DT_RAW8,
> -		.bpp =3D 1,
>  		.icndmr =3D 0,
>  	},
>  	{
>  		.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.format =3D V4L2_PIX_FMT_SRGGB8,
>  		.datatype =3D MIPI_CSI2_DT_RAW8,
> -		.bpp =3D 1,
>  		.icndmr =3D 0,
>  	},
>  };
> @@ -60,17 +55,6 @@ const struct rzg2l_cru_ip_format
> *rzg2l_cru_ip_code_to_fmt(unsigned int code)
>  	return NULL;
>  }
>=20
> -u8 rzg2l_cru_ip_pix_fmt_to_bpp(u32 format) -{
> -	unsigned int i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(rzg2l_cru_ip_formats); i++)
> -		if (rzg2l_cru_ip_formats[i].format =3D=3D format)
> -			return rzg2l_cru_ip_formats[i].bpp;
> -
> -	return 0;
> -}
> -
>  int rzg2l_cru_ip_index_to_pix_fmt(u32 index)  {
>  	if (index >=3D ARRAY_SIZE(rzg2l_cru_ip_formats)) diff --git
> a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 61e2f23053ee..01b39a2395df 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -800,27 +800,11 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev
> *cru)
>   * V4L2 stuff
>   */
>=20
> -static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix) -{
> -	u8 bpp;
> -
> -	bpp =3D rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat);
> -
> -	if (WARN_ON(!bpp))
> -		return 0;
> -
> -	return pix->width * bpp;
> -}
> -
> -static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix) -{
> -	return pix->bytesperline * pix->height;
> -}
>=20
>  static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
>  				   struct v4l2_pix_format *pix)
>  {
> -	if (!rzg2l_cru_ip_pix_fmt_to_bpp(pix->pixelformat))
> +	if (rzg2l_cru_ip_pix_fmt_to_icndmr(pix->pixelformat) < 0)
>  		pix->pixelformat =3D RZG2L_CRU_DEFAULT_FORMAT;
>=20
>  	switch (pix->field) {
> @@ -840,8 +824,7 @@ static void rzg2l_cru_format_align(struct
> rzg2l_cru_dev *cru,
>  	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH,
> 1,
>  			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2,
> 0);
>=20
> -	pix->bytesperline =3D rzg2l_cru_format_bytesperline(pix);
> -	pix->sizeimage =3D rzg2l_cru_format_sizeimage(pix);
> +	v4l2_fill_pixfmt(pix, pix->pixelformat, pix->width, pix->height);
>=20
>  	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
>  		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
> --
> 2.34.1


