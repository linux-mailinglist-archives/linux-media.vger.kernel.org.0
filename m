Return-Path: <linux-media+bounces-18695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA4988352
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 13:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88FA728161D
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 11:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D5C189BA2;
	Fri, 27 Sep 2024 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iP2BDn+K"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0EA188A19
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727436559; cv=fail; b=VhOVXIbMQ+T+jbyxzN7JZmOCSh9MgZ5jkKrlv8htYztSiEnG30oI9mOBcKxckksSDwptR/brXfYkYOcx7rHyA29mH3PE/Pa/JuIwJEZOzQ+h8clVCVJgb83yWP5hQfQ1aYiV8M28nwDYpDf0CRxiusA2cv82hj7wpuHFpAvII5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727436559; c=relaxed/simple;
	bh=lvNDzgb7lq938jYGyikUR2bNq/+cldoxOxU2klzXILc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CB1H3FpmKtQfhEI07VVyvbqEvjfQXPwhUDRJRup92D2F9qI4HEIlhjZYTDxygQ+sTAJHAWME3ab7jtzxO1EDRIumUrTf+3757JmcT4ZeBDGW09KW+pZ7moEeDPRz4tuG8LpY1YmmJQR68DkvKGq1w8ffF9Cocxq4ynSfqU5PoRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iP2BDn+K; arc=fail smtp.client-ip=40.107.74.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiGUASnQKZYemvyCFF+nMUtpzs9GQVXRI6RDNvOAUyem/q6c6/OikWQJu0dq5AH0tNn80M5g4/q7ELaGfKECYank1WIXckt4/GzekXaaAFt+SRugHJ1X2jRXKJO7sgDL1mdGGEZaFGI1Q3CK0aGkfaWvl8G32HdqM4BaBOkrSrzAWmQxAAOgpRa8tngWOyFsIHmVL2jPi7yUx6JAu8PrdWn9y/kcu4gtVSNQSsfP6lU7TqHB63uO8Rcg48XUdjXCAJY5hPWyKbSDwHTWsT0IYSQxwpbiaQIZTYipSGYYGlPIjADwwCz7O54pzLjG3Xr5pzzfu+Nm1QVEHn8TKegb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpyWpa/mLY4w6goLS71YDLyOhYdH03gLIaL8P5itL0Q=;
 b=DubOwy8mf0KMsFsBSDwIx5E1T+UdOKGnFUuYEU6IATaK/wwZaKwm2eHo5o4V7bertEflS4sjfnu48GkpYhe4HMNghJCZ4wqpVr/LjxycmgKgc2cEzr8aSL6QR68BdCjK4tlJatR7J5CdT86NTw5ZF5dwGMvbaMvd9yslgowoagrXE1cZlQ5dFBl92cUTZYSlIBj0KdBJEiGUT9q0yKU9mKTHG9QnUBccbJoj4n29nBRtX0jmuJCBFgZodGPLcVR9uXa+Jug8NIXmKf5iUW7DvLP2mssbKVa0t+KVXk5ksjt20yIN0/DezpWY/AzeIQHwjC7mCj/cHzng62l9atTn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpyWpa/mLY4w6goLS71YDLyOhYdH03gLIaL8P5itL0Q=;
 b=iP2BDn+KQGJirFnvzowTQL5FRMEzAoaCXj/1Et6l7Wt9AlYW4dNOPRXd/z6vqAWnZFJTajAav6Tvxh8+GTC3zLMlIj+DIbMfWqxcADnXJmq7gU6CCV3El6gliKkZV33yqbwrABgxSxR1rOmk/FkOkZxlgiVLm4VpbO43G0utg/s=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by TYCPR01MB8208.jpnprd01.prod.outlook.com (2603:1096:400:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Fri, 27 Sep
 2024 11:29:11 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::8a27:ee0d:d7a4:9d10%5]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 11:29:06 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
Subject: RE: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
Thread-Topic: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
Thread-Index: AQHbC1pw3yTJ3fpyRU+5tzgnHD6U6bJrezwg
Date: Fri, 27 Sep 2024 11:29:06 +0000
Message-ID:
 <OSZPR01MB701939FF3C646166076B7AD8AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-2-dan.scally@ideasonboard.com>
In-Reply-To: <20240920124115.375748-2-dan.scally@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|TYCPR01MB8208:EE_
x-ms-office365-filtering-correlation-id: d0db6549-442f-4bee-9d1a-08dcdee798fb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AnWcpWZIAE8QAGv+AexT70CqOE/8FaT3fYRyHmIxys9eVhdL2+n8FUDKg0Kp?=
 =?us-ascii?Q?Elm8N63tlADvJrx4ySeEi1jriMU40H5hPjw7Fw0y9dc1l2ei2EvZH7XEZqf3?=
 =?us-ascii?Q?L/Ot7NXRj9bGEs/cEtK47L8CaIGVG4meyyiMX3pb7Pl058AdT8D7UbkNcgWN?=
 =?us-ascii?Q?9rrk2TfM1jEAxQANWbOxtbXQR+sjWQph863DRL4EH5Q5a8kdcVcGjXmCI1ue?=
 =?us-ascii?Q?eCRrgAt1CAwxw3vkmlPI96rjvmDlqTS58SGh60AQu1PmgWaVbsf0o4VRRTe4?=
 =?us-ascii?Q?FQjN1/kRLYSAaHHfa1Pz2w1IxaG+9TyQQYRIfgJ0H3G7mEPxKJ2+9k7rbyJX?=
 =?us-ascii?Q?Zp0qYk9Cw16KvbU488EjlIFrHRtFcyZUccRsx0Y3ClC1zBKANcX6WuakNglF?=
 =?us-ascii?Q?pvQw9Y+uy26hyXd5n0txCFIDNY/J0fXiskDP4Hk0RiBPqEk2F0Yn9zanbqoS?=
 =?us-ascii?Q?GezVeyLamuyuNVIr4vHDJwYh4TT8zFn2YfXPURTa9+iWCJ7a6uc4kZyGdRvD?=
 =?us-ascii?Q?Cgkl1W9v+Pl7DaPrR/El5oOnzfTn0ugcFeA2xa1Arcgdv4K43HEHDUQmhWzc?=
 =?us-ascii?Q?3qDN3CTfevN9nZqhUxeA5blYCO2vONJLuUXJj2h9j2ezkT34ksBERePIzpvX?=
 =?us-ascii?Q?Iqodu1hBBV2E/ZZynxsoGNRpK4qR3eW6Q5lDnm/uYCdV1v0kHUDnUZu05fDC?=
 =?us-ascii?Q?SBTKiyhOrHxY2KQNWOnxZeNcSLUGcUX4Q44NpbFZNjQLvm3dr27Ux/0tZlmK?=
 =?us-ascii?Q?DyBYQXLhTgewXkje+fdMK7eHQu2GdofoGAd/HIS0u2ymY/f4Mw9VKU1+moDN?=
 =?us-ascii?Q?9RjvifS8DS7u8S7leEIzF8WVtgZMTxrQUrLUETSsEk/YRS+THUYKNQUoUUhy?=
 =?us-ascii?Q?XJQzkMQJxiQ7MJ6iFDQoWRwFb/BqvpSq9TFl+GRAi7LVFa1Mf8Ecq7jUdSqm?=
 =?us-ascii?Q?M8IhbczxSmsMl2pheDOCpN0MUXREo+aTSJucqsriCGjvQpRd3ejMo07lK8on?=
 =?us-ascii?Q?6YbbgmNYxaOmdt2bmSd2VtLb6ntH6vzz/CLrHqu/pce96CbAsAy0zCEhr9dk?=
 =?us-ascii?Q?Tqy1qhTOdpz/phfMFBZzgY8ERR0jUaJ2rKmfMdXi0u40plQNRIqThjmzwWPT?=
 =?us-ascii?Q?OyOjiROrDn9nmPxAqFjM0NIiopRDQlK8+MbMpn4noAUtgOaVdbaSUS2T4DdJ?=
 =?us-ascii?Q?9RxmNZn995+wUNk6gDf6armdoI7IGn84Cr80Pt5Pym/dPJKHQaSCRLXgtcm1?=
 =?us-ascii?Q?klHN6otr73QzDYllj1CDfvQI/ErvTsJJ8f22zLgS4EFVvDWkzS1gw7LCpV7y?=
 =?us-ascii?Q?IIca/JJY2ATwMnmPhrRVKtOT/oDZAZrvyfSOz2PAIFakE93CDpr0SQVQl65x?=
 =?us-ascii?Q?UEdc8zxcO+023IPNAG2qaEcp1hE3EkIv6jSo5nYmcyoDwW1D1w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4o1L2oMjgfXbn+vn8UsY8rvKWGQpnjEYfDiiJN0qzWCfVdBdyYTIvJxZqlpu?=
 =?us-ascii?Q?NrHCnMIn9oMqNr/GFHSUkEdkcqP+A9cqV7IWoIJLrdIsPA6OhgJrukxIlfuG?=
 =?us-ascii?Q?H6psGAGpesIx9E47VBrvJfbxvyqA8DFR/sRV3dablKrW3Ux1c5nAv8CQ2tAD?=
 =?us-ascii?Q?IJw7ZXOax6w938kuySNdKVGqVMIxGJ3SMpfThG+c7W0RgNsAkVlbZghcQ46X?=
 =?us-ascii?Q?aSuTHiGNUWDb6zgTuBs9VwqBR2j2eVXJDa+B0HiY0EveUOpSFaqB6dqU5B1N?=
 =?us-ascii?Q?sixqGNJrtRyYnFMbJpEseO0iZZOL4Z+aAwzL0T0i08T5+Yoj9Ib6QFXQR6ws?=
 =?us-ascii?Q?TCsi7/VlXWK6KjNIiMTyfL6VM3RqNPFtWR41iQioVYIiY1l75JnsuDezKy/c?=
 =?us-ascii?Q?Z4Ll3MJfQ83bc0flYOIj+/x/w1M/FiqOVsjndVPA/+LNjIcBy5O1Pw7KgRwu?=
 =?us-ascii?Q?OB+PiBHTM7NwKfL3CHcJx1jK1d61ITP0q7pw3Onqn6iHyJf1v3HAHxmINdCR?=
 =?us-ascii?Q?m6Qt7gAv65N9CJMfHa2ZlMw0+N4TJjST7kP1bsBgN0pOj/NEZS/IifzQ6vjc?=
 =?us-ascii?Q?5eprkj1/Skbyk9Id+QEX0iT6zB+DAuujk8yUUtFXlvfEZMPsluRL7tAHscqa?=
 =?us-ascii?Q?5tH7DaHgFy7a+hIdSICsjp3WaMLsTRk6H/rT++iGyEz6O6fy6Dt6mIRggj1J?=
 =?us-ascii?Q?vkyNQA+wIs86uo01beobkUtNhypVvdPx8/O9jzq8DLOI5Q2J9tVUZrpRfM2W?=
 =?us-ascii?Q?7DEZ5sip23Q5ydrtndRnBk9jL7vLZHz/dMg0AT8KD7LjAhA8XkkySIFWXAZ/?=
 =?us-ascii?Q?+xhVYBjeKtOS5MjuMOnhXIUgWy8OCwyYVgzef5cc9QodYcRsbGfjtiCRZ7ve?=
 =?us-ascii?Q?rGCaYc5aNXfJledRnwyaOtjVHapf8aC0Xhk1kf6UGvXLxGC3v74d+BYvAtQc?=
 =?us-ascii?Q?2jZhl8voJyyUM2oFjztggVIPZDzF6FttnvqUIBTAs66hBZ01QH0Arigg772u?=
 =?us-ascii?Q?Z0PXUk6VzYIB3vqNtkDji1EzFbk6EFWcjxhPIEOMu9Jd3NSaBsn4FbRqpCg/?=
 =?us-ascii?Q?a7RVVku4eJGC7SwF/yGPQ8aC5kfdI0eioTwTCnU2PPGh7akYPhPQZCfCu0b/?=
 =?us-ascii?Q?NE2HLAuBrbFdNOGp0TYnHDVXRks73/wZRc6Wp39l+12AQii4IyJJmME4Qx1v?=
 =?us-ascii?Q?xdnbBwVLMBcmVyJAvKNfxuwZrm/d8K+ihLySU7YWRfFOKfCZiSo4QjtrPetn?=
 =?us-ascii?Q?1NHYUj+p+yJ/fokGRcB2oTedIM0f4gOC2hokSaeQy9U6EBYusJhcnErSczjD?=
 =?us-ascii?Q?h7e263v5UeKePoHMqyudvDsrf0j8pKxUcEIGxlGQ9seX2/kdLqUA1JmabMON?=
 =?us-ascii?Q?qbxDk5QxT/0tBBr75OBrYR56FFXR36JNUNl0/haXOKl6GLMBDJsfUfyEq5YZ?=
 =?us-ascii?Q?9VWJDKFgE8+nRfM3hd7vJZaJvr8yYo09e1wbMNqqR0LG5Szvc3lyRMVc8doc?=
 =?us-ascii?Q?ePARZude8OBaBRnvs5XjKF08EGXmW2rQsKsPYppSp4gAEs4hx/4qgXQDlDcI?=
 =?us-ascii?Q?xqKT4AKjNjQ6su5YFv326hKNvnU18Dp7972ogowNwUQPI2P+xnughuaGrZ/G?=
 =?us-ascii?Q?3PvbRKUZWnDWpDKTPvmPynI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0db6549-442f-4bee-9d1a-08dcdee798fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 11:29:06.5163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCLN39dS7Cvq2J9S7ZpJFLJvwOB5WoFuvWP5E2gb6k9qz26rbabYEjwFKZP62+7LEhmAIEpHJv+lUBuV0RYdOFGcgqyT/1xKyuu74zzO4omlrhjR8VtfpQ8XalbMxrhe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8208

Hi Daniel,

Thank you for the patch.

> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>=20
> The Renesas Camera Receiver Unit in the RZ/G2L and RZ/V2H SoCs can output
> RAW data captured from an image sensor without conversion to an RGB/YUV
> format. In that case the data are packed into 64-bit blocks, with a
> variable amount of padding in the most significant bits depending on the
> bitdepth of the data. Add new V4L2 pixel format codes for the new formats=
,
> along with documentation to describe them.
>=20

Which path are you referring here?

In the full bypass mode, the data will be stored according to MIPI standard=
 so 32bit.

In (non)-Image Processing case the data is packed into 256-bits.

I maybe misunderstanding here can you please clarify.

> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
>  .../media/v4l/pixfmt-srggbnn-cru.rst          | 143 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |  12 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  12 ++
>  include/uapi/linux/videodev2.h                |  16 ++
>  5 files changed, 184 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-
> cru.rst
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index ed3eb432967d..658068364ea1 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-srggbnn-cru
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
> b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
> new file mode 100644
> index 000000000000..a169b7bbef79
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
> @@ -0,0 +1,143 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +***********************************************************************
> +*******************************************************************
> +V4L2_PIX_FMT_CRU_SBGGRnn ('CnnB'), V4L2_PIX_FMT_CRU_SGBRGnn ('CnnG'),
> +V4L2_PIX_FMT_CRU_SGRBGnn ('Cnng'), V4L2_PIX_FMT_CRU_SRGGBnn ('CnnR')
> +***********************************************************************
> +*******************************************************************
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +Renesas Camera Receiver Unit 64-bit packed pixel formats
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +| V4L2_PIX_FMT_CRU_SBGGR10 (C10B)
> +| V4L2_PIX_FMT_CRU_SGBRG10 (C10G)
> +| V4L2_PIX_FMT_CRU_SGRBG10 (C10g)
> +| V4L2_PIX_FMT_CRU_SRGGB10 (C10R)
> +| V4L2_PIX_FMT_CRU_SBGGR12 (C12B)
> +| V4L2_PIX_FMT_CRU_SGBRG12 (C12G)
> +| V4L2_PIX_FMT_CRU_SGRBG12 (C12g)
> +| V4L2_PIX_FMT_CRU_SRGGB12 (C12R)
> +| V4L2_PIX_FMT_CRU_SBGGR14 (C14B)
> +| V4L2_PIX_FMT_CRU_SGBRG14 (C14G)
> +| V4L2_PIX_FMT_CRU_SGRBG14 (C14g)
> +| V4L2_PIX_FMT_CRU_SRGGB14 (C14R)
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +These pixel formats are some of the available output formats for the
> +Camera Receiver Unit in the Renesas RZ/G2L and V2H SoCs. They are raw
> +sRGB / Bayer formats which pack pixels contiguously into 64-bit units,
> +with the 4 or 8 most significant bits padded.
> +
> +The packing format is similar to the IPU3 packing formats defined in
> +:ref:`v4l2-pix-fmt-ipu3-sbggr10`, albeit with the packing performed
> +over a much shorter window.
> +
> +**Byte Order**
> +
> +.. flat-table:: RGB formats
> +    :header-rows:  2
> +    :stub-columns: 0
> +    :widths: 36 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 =
2
> 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
> +    :fill-cells:
> +
> +    * - :rspan:`1` Pixel Format Code
> +      - :cspan:`63` Data organization
> +    * - 63
> +      - 62
> +      - 61
> +      - 60
> +      - 59
> +      - 58
> +      - 57
> +      - 56
> +      - 55
> +      - 54
> +      - 53
> +      - 52
> +      - 51
> +      - 50
> +      - 49
> +      - 48
> +      - 47
> +      - 46
> +      - 45
> +      - 44
> +      - 43
> +      - 42
> +      - 41
> +      - 40
> +      - 39
> +      - 38
> +      - 37
> +      - 36
> +      - 35
> +      - 34
> +      - 33
> +      - 32
> +      - 31
> +      - 30
> +      - 29
> +      - 28
> +      - 27
> +      - 26
> +      - 25
> +      - 24
> +      - 23
> +      - 22
> +      - 21
> +      - 20
> +      - 19
> +      - 18
> +      - 17
> +      - 16
> +      - 15
> +      - 14
> +      - 13
> +      - 12
> +      - 11
> +      - 10
> +      - 9
> +      - 8
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * - V4L2_PIX_FMT_CRU_SBGGR10
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`9` P5
> +      - :cspan:`9` P4
> +      - :cspan:`9` P3
> +      - :cspan:`9` P2
> +      - :cspan:`9` P1
> +      - :cspan:`9` P0
> +    * - V4L2_PIX_FMT_CRU_SBGGR12
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`11` P4
> +      - :cspan:`11` P3
> +      - :cspan:`11` P2
> +      - :cspan:`11` P1
> +      - :cspan:`11` P0
> +    * - V4L2_PIX_FMT_CRU_SBGGR14
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - :cspan:`13` P3
> +      - :cspan:`13` P2
> +      - :cspan:`13` P1
> +      - :cspan:`13` P0
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-
> core/v4l2-common.c
> index 0a2f4f0d0a07..ca78d26071c7 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -329,10 +329,22 @@ const struct v4l2_format_info *v4l2_format_info(u32
> format)
>  		{ .format =3D V4L2_PIX_FMT_SGBRG10DPCM8,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1=
, 0, 0,
> 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SGRBG10DPCM8,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1=
, 0, 0,
> 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SRGGB10DPCM8,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1=
, 0, 0,
> 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SBGGR10,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 6, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SGBRG10,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 6, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SGRBG10,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 6, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SRGGB10,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 6, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SBGGR12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2=
, 0, 0,
> 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SGBRG12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2=
, 0, 0,
> 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SGRBG12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2=
, 0, 0,
> 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_SRGGB12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2=
, 0, 0,
> 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SBGGR12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 5, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SGBRG12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 5, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SGRBG12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 5, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SRGGB12,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 5, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SBGGR14,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 4, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SGBRG14,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 4, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SGRBG14,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 4, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_CRU_SRGGB14,	.pixel_enc =3D
> V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 8=
, 0, 0,
> 0 }, .bpp_div =3D { 4, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  	};
>  	unsigned int i;
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> core/v4l2-ioctl.c
> index e14db67be97c..9db0ec4a5d77 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1408,6 +1408,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
> *fmt)
>  	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr =3D "8-bit Bayer GBGB/RGRG
> (DPCM)"; break;
>  	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr =3D "8-bit Bayer GRGR/BGBG
> (DPCM)"; break;
>  	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr =3D "8-bit Bayer RGRG/GBGB
> (DPCM)"; break;
> +	case V4L2_PIX_FMT_CRU_SBGGR10:	descr =3D "10-bit Bayer BGGR CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SGBRG10:	descr =3D "10-bit Bayer GBRG CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SGRBG10:	descr =3D "10-bit Bayer GRBG CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SRGGB10:	descr =3D "10-bit Bayer RGGB CRU
> Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR12:	descr =3D "12-bit Bayer BGBG/GRGR";
> break;
>  	case V4L2_PIX_FMT_SGBRG12:	descr =3D "12-bit Bayer GBGB/RGRG";
> break;
>  	case V4L2_PIX_FMT_SGRBG12:	descr =3D "12-bit Bayer GRGR/BGBG";
> break;
> @@ -1416,6 +1420,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
> *fmt)
>  	case V4L2_PIX_FMT_SGBRG12P:	descr =3D "12-bit Bayer GBGB/RGRG
> Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG12P:	descr =3D "12-bit Bayer GRGR/BGBG
> Packed"; break;
>  	case V4L2_PIX_FMT_SRGGB12P:	descr =3D "12-bit Bayer RGRG/GBGB
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SBGGR12:	descr =3D "12-bit Bayer BGGR CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SGBRG12:	descr =3D "12-bit Bayer GBRG CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SGRBG12:	descr =3D "12-bit Bayer GRBG CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SRGGB12:	descr =3D "12-bit Bayer RGGB CRU
> Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR14:	descr =3D "14-bit Bayer BGBG/GRGR";
> break;
>  	case V4L2_PIX_FMT_SGBRG14:	descr =3D "14-bit Bayer GBGB/RGRG";
> break;
>  	case V4L2_PIX_FMT_SGRBG14:	descr =3D "14-bit Bayer GRGR/BGBG";
> break;
> @@ -1424,6 +1432,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
> *fmt)
>  	case V4L2_PIX_FMT_SGBRG14P:	descr =3D "14-bit Bayer GBGB/RGRG
> Packed"; break;
>  	case V4L2_PIX_FMT_SGRBG14P:	descr =3D "14-bit Bayer GRGR/BGBG
> Packed"; break;
>  	case V4L2_PIX_FMT_SRGGB14P:	descr =3D "14-bit Bayer RGRG/GBGB
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SBGGR14:	descr =3D "14-bit Bayer BGGR CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SGBRG14:	descr =3D "14-bit Bayer GBRG CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SGRBG14:	descr =3D "14-bit Bayer GRBG CRU
> Packed"; break;
> +	case V4L2_PIX_FMT_CRU_SRGGB14:	descr =3D "14-bit Bayer RGGB CRU
> Packed"; break;
>  	case V4L2_PIX_FMT_SBGGR16:	descr =3D "16-bit Bayer BGBG/GRGR";
> break;
>  	case V4L2_PIX_FMT_SGBRG16:	descr =3D "16-bit Bayer GBGB/RGRG";
> break;
>  	case V4L2_PIX_FMT_SGRBG16:	descr =3D "16-bit Bayer GRGR/BGBG";
> break;
> diff --git a/include/uapi/linux/videodev2.h
> b/include/uapi/linux/videodev2.h index 725e86c4bbbd..8f0e3d8215ab 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -828,6 +828,22 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B')
> /* PiSP 8-bit mode 2 compressed BGGR bayer */
>  #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M')
> /* PiSP 8-bit mode 2 compressed monochrome */
>=20
> +/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixel=
s
> */
> +#define V4L2_PIX_FMT_CRU_SBGGR10	v4l2_fourcc('C', '1', '0', 'B')
> +#define V4L2_PIX_FMT_CRU_SGBRG10	v4l2_fourcc('C', '1', '0', 'G')
> +#define V4L2_PIX_FMT_CRU_SGRBG10	v4l2_fourcc('C', '1', '0', 'g')
> +#define V4L2_PIX_FMT_CRU_SRGGB10	v4l2_fourcc('C', '1', '0', 'R')
> +
> +#define V4L2_PIX_FMT_CRU_SBGGR12	v4l2_fourcc('C', '1', '2', 'B')
> +#define V4L2_PIX_FMT_CRU_SGBRG12	v4l2_fourcc('C', '1', '2', 'G')
> +#define V4L2_PIX_FMT_CRU_SGRBG12	v4l2_fourcc('C', '1', '2', 'g')
> +#define V4L2_PIX_FMT_CRU_SRGGB12	v4l2_fourcc('C', '1', '2', 'R')
> +
> +#define V4L2_PIX_FMT_CRU_SBGGR14	v4l2_fourcc('C', '1', '4', 'B')
> +#define V4L2_PIX_FMT_CRU_SGBRG14	v4l2_fourcc('C', '1', '4', 'G')
> +#define V4L2_PIX_FMT_CRU_SGRBG14	v4l2_fourcc('C', '1', '4', 'g')
> +#define V4L2_PIX_FMT_CRU_SRGGB14	v4l2_fourcc('C', '1', '4', 'R')
> +
>  /* SDR formats - used only for Software Defined Radio devices */
>  #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ
> u8 */
>  #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ
> u16le */
> --
> 2.34.1

Cheers,
Prabhakar

