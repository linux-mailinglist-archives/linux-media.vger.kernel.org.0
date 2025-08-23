Return-Path: <linux-media+bounces-40809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC7FB32710
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 08:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9519AE5EFF
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 06:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7D81FC0EA;
	Sat, 23 Aug 2025 06:31:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021088.outbound.protection.outlook.com [40.107.51.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B504A1FF1AD
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 06:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755930705; cv=fail; b=kd7O4FyrMS1mZx4QdZIyC29REiRF2VelgyWBxZQ82dce40qdLJDQy/pjYgYhuBWfiOf0i/xi27cVqZMm1FRcuK/7ClYRASQQMY3Ur5SfYcqhh1pKhEl9SsdEDP5N/yYRU2wNJIaEOTe950nGGuFwm4WQSR5TpD+VEardizI5wVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755930705; c=relaxed/simple;
	bh=o+f5Tq3Ne9/Uy45a7e2SnXSObdGTwM2IpCZ51lqnFPY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=umjn7jHWp55D+50e1JPmthD4lZum5knNZ1dcucucT6Iz0gxWIzm8zoR4Qby4WLbrb2rnpQ/aYqqlz+8Y1NqOMUF45e5VqLmU/aV4xYWFKyz1Kr5dQv1WxB+sH7d4+w5S0w3PH4Yzh1bTKNSr6wct/CgSuvMxqhmcEG/HRukc7Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDA/zLp6z04P52aZ1GAjMFJMmi7qWOHqoHX0qeTsHNW7d2Nt3p4REP8yxHr7SA+kSy897yR9YbD+3G2XJ02OHUVQBLZpeDVu+QYPHRS3sLdEFna0OlaHfLgH3+G2zZvFgYGdQp6M60gOQizXM8KoVYIBHGo/gAC+l47Ck0iUX9Y2qkbWl5Dp6+sVFNEPxypkBSaTu7iZBdUz1+0c+uSbu+EbZVERnOVlG8Ey1pD76VdwQLVv1UZS8HnqhJgzK/hNr5Ahv3lgwvHHgWa2E+HOWnklwXpaDFscIOvBIeSpEefb+QYaTaUdRIJOKnS1bnFOkLzP9IsOk5VCdGvjsSITKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+f5Tq3Ne9/Uy45a7e2SnXSObdGTwM2IpCZ51lqnFPY=;
 b=uFIwkqx566Pp75JuGbtSfyXIZWsL83lJLnu6qDDRQQ90ImC94rQHRLLSdweiYjsLxrwOyW+Ib5icEQhoq9O5griWIcMR4BLon/6RbxiZwxuKCy0p/RANukj+FcOCw8niAvhbwkTrqHkNVUUyhVBb8QdyOh5J5rasGiidM0FFW63QslL3RbGVNcj6X1O33ejhdbsNHEGCGGonnlaXTCGDu0jy3bi9tyTNXjE9BFswrACCcW7+k7I56w0/21+CQ1Z3q3XeqLM3ceFJncCNpxlImxDafJzkNlhsmI5I4xdz8k6mndYoUg7JgcwAl68Z60shdYiL1xcYich7EtHbfNroUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1130.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sat, 23 Aug
 2025 06:31:32 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.9052.017; Sat, 23 Aug 2025
 06:31:32 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: i2c: og01a1b: Change I2C interface controls to
 V4L2 CCI
Thread-Topic: [PATCH] media: i2c: og01a1b: Change I2C interface controls to
 V4L2 CCI
Thread-Index: AQHcE6R3Mlr3RBAs+0mm+8gxoSLNFrRvtz0+
Date: Sat, 23 Aug 2025 06:31:31 +0000
Message-ID:
 <PN3P287MB182948539FAD0BCE7E105B838B3CA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250822203632.159005-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250822203632.159005-1-vladimir.zapolskiy@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1130:EE_
x-ms-office365-filtering-correlation-id: 2de7f2cd-c07c-4d4a-e4f4-08dde20eb328
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?wzoo3iOy8A0QsNqgBIdeI1BzHNyfzQOXGa3g/X7EBMD5PrvDf/fnTLtG4w?=
 =?iso-8859-1?Q?ijSsf/jYXIAhl/t3oWcXLF5cAOIsW08wbT2cYo28vq6cSwudVarF4OTnNu?=
 =?iso-8859-1?Q?3mMrP1Qqvp+jcN6CeNEJHK7vpVvf3gdtQvisv/5jo5b/YLTUZ+BfiXSIoX?=
 =?iso-8859-1?Q?p2zQTaxFgBOPk+L5Pt2U2It+jmtyb/0FjwctMGznQJ9KsalHJ9pwOb0UpC?=
 =?iso-8859-1?Q?5DBTHmp4LIQ2YSfjr71GHRB2qvnqOdqR4AbBOaRLKeg8sVWgA8vvQaGq9p?=
 =?iso-8859-1?Q?msjjxO2E5aZQb7Mnxsc9P1koZmHOaeaYKKuoRGKxlBn70ama3b35z9lgQp?=
 =?iso-8859-1?Q?insnXt4Z30lz0kqbK69f4Uuo1gcNOegVkby+CsBLd4f4Ju7E3kYd5WCEjz?=
 =?iso-8859-1?Q?WiJPm2uqIGalJqIZO2sqSdGvkxBnpM0uARadyGtqBB/aMlzGA+ggTbjM5a?=
 =?iso-8859-1?Q?FPZq6X6uBRHoWLdZ+/PKDUT17JT5wCPQu4cshiL/BI2pPwAAev3hCrhfnN?=
 =?iso-8859-1?Q?OuvrqH09Hb3jdM5E6D2evm/bs9kUu1qBVqvp+ermN1EyzHE50rm8Ec5o5g?=
 =?iso-8859-1?Q?QJGDwQuuWIgA/nXsC0QhArChbTgL5q102CDh8lfxQZ7ByHqQsxCd1wiJkx?=
 =?iso-8859-1?Q?buYJ5GyscyHTAFq16tv0wNiOMQf6zKTqGjSzto5Gx1sy25eG8ojLzokRWe?=
 =?iso-8859-1?Q?umsVH+ByEbj0oRHc28Y9o5hznSx3wzGabIj6jyZwPWIDWGkOCQxQLAIO//?=
 =?iso-8859-1?Q?W0PjhW9JLikU1VABRcCHoMEcnAxm06jzlMfwXPEbC8jwbuXgAYYWB51DgE?=
 =?iso-8859-1?Q?rJMZf0fgy6lj1rBGyfdRxUS63XZuAGCwtaScELkADJmOqQbUCZ38YDDmBN?=
 =?iso-8859-1?Q?MtheziTbsBoc+gCmtrxVeH0iM9xiifSpDzedy0iZd1tSJtr8EuL2CWgRjS?=
 =?iso-8859-1?Q?TEUC9ag/Ga0KEWwhoyFvMk60v0t6N8WZ5F+jw1CfyIKlktyfVEwwCEyltf?=
 =?iso-8859-1?Q?Xw2vUXwgy/fv4f7H3WrdDutwTCdGvMHFxqDLJ/p6MnaniiAcCmr2XEXR/3?=
 =?iso-8859-1?Q?A5dL9+w6N7ROKjhdd9lk3u5egLfNxTHux8aoJA2lcGyqUmfTCvH+iDNQAG?=
 =?iso-8859-1?Q?iR7VFEr+vwdApKyJJKFbSEQlnwE9wJpYUyTUDSkQu7kUvuyfGoBm3qrpKW?=
 =?iso-8859-1?Q?qneDSnHMwehc3uWzX65FJjeeWodK6wbZA0M/xkTTQUj2EvlMj8Dso4WYrq?=
 =?iso-8859-1?Q?2bHYBNyqzfAQKxb9RQwucMOE4qUkGFKFlNE/CW/t8a6anZ89qVx+O0eNKi?=
 =?iso-8859-1?Q?/Yjh35vNSeGari/MnyxCAHSmzaKOvhYYoYvt7uzHBo/7IoeQRe+8KAXjeA?=
 =?iso-8859-1?Q?l64Xtk8tyr2l5+NTOIG6VP9Q9b5JXIzRSpGvsvIvcGw1mvC8O5SWDsNdLg?=
 =?iso-8859-1?Q?NK4rG/LNkf9N8z77lr8Gs6WULZsJJ5OpHESpz5380EejxW1kkUkLGj5RTu?=
 =?iso-8859-1?Q?1Sbf3lhqNEf9Rp9x7bF7dZ2EkIV/7XSwvMpyiSzrVyYw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pfoabXCxtPFSYjSCIgkC05r5yB6v4CdKLQ1PyfhqyA5awu+4tbaYU0HKBZ?=
 =?iso-8859-1?Q?4ldnTRZ8U2nrtn6LEcRzyPsxch6d4A352cHdo4zh2YZa36Gf8w0IBSnMuj?=
 =?iso-8859-1?Q?xPP577CWqh2XykSQqyqKFfMKTW5UppeGuzxEHoJXHZmPnfC4myWntkJPM6?=
 =?iso-8859-1?Q?S7CXkWy1m42V2FMbL79kYxFH82HeUczAc+d9wZlYWHTBstBkJZT+lLxORd?=
 =?iso-8859-1?Q?6ayUSvVyPutd78cQUTqjRziw5P5s7Bv6ARI/qvMTisA7LSDnrs2ptrEy0i?=
 =?iso-8859-1?Q?fCacOXD3n79ey1+WPhj23A8Ftvspt0ChB+j0GeDC7gYyh0KPuMHJFj/jky?=
 =?iso-8859-1?Q?wdKni+l5ddJUJA8Umh+vBqfE5DRP/4Ec3AeXSZtX7j9NPTB0jFJ54yPJye?=
 =?iso-8859-1?Q?8vS87oeZ1B8HMlj4RrlB1zSagRhdnMKv2ykpkZkWB2w2UN16mC3ac3ytm7?=
 =?iso-8859-1?Q?3+Nfeibuu7b8mIFrgHzBIhVpMXOoK+++PXPhs1Om+d/6vP7VITnLouQSrh?=
 =?iso-8859-1?Q?N3/goa3BRPW1LGLxg8EIjpl7mwKXQfDPSpB/TqOy0PvkZR6VjFuSdWluUi?=
 =?iso-8859-1?Q?oaFxePe+coJwp2d/tqkLLXMJmdeWluw/L/bYPUIFcqTxR27ZyktAKwPNLA?=
 =?iso-8859-1?Q?gWccLqV9XOgKZ+2jPx3Sqqt5JXnuZ/pPF2U45psW84tMhvOxbfM6wLfAs+?=
 =?iso-8859-1?Q?jaw9+4XkGMTDH0VccqEXguuWclWcheHxFPVRdc0jx5aCa9If3RJUcrt+ES?=
 =?iso-8859-1?Q?546cUB+g6HYvnCqcpXu5LjjRFUp8rFtk5xOaZobGIGbM4qga70QkDAqjOV?=
 =?iso-8859-1?Q?EsZG+RDLUn789qar4KlgVhQzNOy9zGlEEjUp7uDXGqQOmh0kcPaqJroctU?=
 =?iso-8859-1?Q?xPWqI0iCgiwsBuIFfAYcG+B91Nupr+RtyfoUZT0Mp7deMTpoFKSjUaglIO?=
 =?iso-8859-1?Q?o6dth/ERBPk26sBFCji9rQTZdd3MWdcVjspHiGWo7BlS3nVLEIziM/cCG+?=
 =?iso-8859-1?Q?vBI7h7C9dRerIbONT43E2BKtESVlOLTIh+cw+N5xbFlx+F0gc7JVefrjbK?=
 =?iso-8859-1?Q?NQ9+aB9LBtqp8EQ+k1IM2ZPiDE7d9LCJKcIWJ5voPyfIv/5egzX9fBQqSt?=
 =?iso-8859-1?Q?Nk6txnBrigmwFJY0NcuSWy7VhjWTuwSF+pxEbbI6bHb0iqH0unh25mbrWA?=
 =?iso-8859-1?Q?xV1+vE/nRDAVd3PBIl854pR/H0fx94q5j+GSbWsqw2IuaWakOAjVuNzcde?=
 =?iso-8859-1?Q?yASZN2vhJTDAyafIYdpJd0MynGabZnJ9Wh5GH0VhzNr7icwCpZYnfUom1t?=
 =?iso-8859-1?Q?HReQ70gQwin54uQWwLZc/Yvlx1us/lfxOpSGvtMzc5AC7Fzjo+y3YnpQSW?=
 =?iso-8859-1?Q?aTdepOFdEObHEPuoqxSdnDg5P9a3TUeTTeN6dsCZgMXSyyk/z2aip0EDe8?=
 =?iso-8859-1?Q?FnSMd28nrY/y+EReSRNprDVwpzMD3rfAQHsusheuaA0KSSIYTFeps7ZvQK?=
 =?iso-8859-1?Q?S4ffYa19HkLmw8+Va1Cn/NKqOzlpMKoAq1sbW+8EOTn3MwfEiY2lxx4Ubv?=
 =?iso-8859-1?Q?1Q7tG9XsazBCmiZR8TlxYvot4RMLk8kDlXlr6O2pDQt7+cVtCVAo3nIwvq?=
 =?iso-8859-1?Q?ucyYtyL+M/AxaGV6IK82QnSMjk7hpD1Q5pWcdr7ckE5OpnzWmBBhx78w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de7f2cd-c07c-4d4a-e4f4-08dde20eb328
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2025 06:31:31.9462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUW4Ab9Kh5conbfzH/gMUVOdJ0MDZe1sOF1R0oW5P1dzK4kMANEzyKlQyHEa9JYsM/OjhsS2Frru+WtHJvHDqLK58gEMcBOcaLTL+N5gv6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1130

Hi Vladimir=0A=
=0A=
> Switch the sensor driver to exploit V4L2 CCI helper interfaces instead=0A=
> of driver specific wrappers over I2C read/write functions.=0A=
> =0A=
> The change is intended to be non-function, on the conversion two=0A=
> register defines were removed as unused ones.=0A=
> =0A=
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
> ---=0A=
> =A0drivers/media/i2c/Kconfig=A0=A0 |=A0=A0 1 +=0A=
> =A0drivers/media/i2c/og01a1b.c | 684 ++++++++++++++++--------------------=
=0A=
> =A02 files changed, 304 insertions(+), 381 deletions(-)=0A=
> =0A=
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
> index 1f5a3082ead9..389461d3a37a 100644=0A=
> --- a/drivers/media/i2c/Kconfig=0A=
> +++ b/drivers/media/i2c/Kconfig=0A=
> @@ -333,6 +333,7 @@ config VIDEO_MT9V111=0A=
> =0A=
> =A0config VIDEO_OG01A1B=0A=
> =A0=A0=A0=A0=A0=A0=A0 tristate "OmniVision OG01A1B sensor support"=0A=
> +=A0=A0=A0=A0=A0=A0 select V4L2_CCI_I2C=0A=
> =A0=A0=A0=A0=A0=A0=A0 help=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for the =
OmniVision=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 OG01A1B camera.=0A=
> diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c=0A=
> index 78d5d406e4b7..8c62d0903426 100644=0A=
> --- a/drivers/media/i2c/og01a1b.c=0A=
> +++ b/drivers/media/i2c/og01a1b.c=0A=
> @@ -1,7 +1,6 @@=0A=
> =A0// SPDX-License-Identifier: GPL-2.0=0A=
> =A0// Copyright (c) 2022 Intel Corporation.=0A=
> =0A=
> -#include <linux/unaligned.h>=0A=
> =A0#include <linux/acpi.h>=0A=
> =A0#include <linux/clk.h>=0A=
> =A0#include <linux/delay.h>=0A=
> @@ -10,6 +9,7 @@=0A=
> =A0#include <linux/module.h>=0A=
> =A0#include <linux/pm_runtime.h>=0A=
> =A0#include <linux/regulator/consumer.h>=0A=
> +#include <media/v4l2-cci.h>=0A=
> =A0#include <media/v4l2-ctrls.h>=0A=
> =A0#include <media/v4l2-device.h>=0A=
> =A0#include <media/v4l2-fwnode.h>=0A=
> @@ -24,49 +24,40 @@=0A=
> =A0#define OG01A1B_DATA_LANES=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2=0A=
> =A0#define OG01A1B_RGB_DEPTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 10=0A=
> =0A=
> -#define OG01A1B_REG_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x300a=0A=
> +#define OG01A1B_REG_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG24(0=
x300a)=0A=
> =A0#define OG01A1B_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0x470141=0A=
> =0A=
> -#define OG01A1B_REG_MODE_SELECT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x0100=0A=
> +#define OG01A1B_REG_MODE_SELECT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 CCI_REG8(0x0100)=0A=
> =A0#define OG01A1B_MODE_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x00=0A=
> =A0#define OG01A1B_MODE_STREAMING=A0=A0=A0=A0=A0=A0=A0=A0 0x01=0A=
> =0A=
> =A0/* vertical-timings from sensor */=0A=
> -#define OG01A1B_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x380e=0A=
> +#define OG01A1B_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x380e)=0A=
> =A0#define OG01A1B_VTS_120FPS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0498=
=0A=
> =A0#define OG01A1B_VTS_120FPS_MIN=A0=A0=A0=A0=A0=A0=A0=A0 0x0498=0A=
> =A0#define OG01A1B_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0x7fff=0A=
> =0A=
> -/* horizontal-timings from sensor */=0A=
> -#define OG01A1B_REG_HTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x380c=0A=
=0A=
Please do not remove this macro. You should keep it and use the =0A=
macro OG01A1B_REG_HTS in the mode_1280x1024_regs configuration.=0A=
=0A=
> =A0/* Exposure controls from sensor */=0A=
> -#define OG01A1B_REG_EXPOSURE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3501=0A=
> +#define OG01A1B_REG_EXPOSURE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x3=
501)=0A=
> =A0#define=A0=A0=A0=A0=A0=A0=A0 OG01A1B_EXPOSURE_MIN=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 1=0A=
> =A0#define OG01A1B_EXPOSURE_MAX_MARGIN=A0=A0=A0 14=0A=
> =A0#define=A0=A0=A0=A0=A0=A0=A0 OG01A1B_EXPOSURE_STEP=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 1=0A=
> =0A=
> =A0/* Analog gain controls from sensor */=0A=
> -#define OG01A1B_REG_ANALOG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x3508=0A=
> +#define OG01A1B_REG_ANALOG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 CCI_REG16(0x3508)=0A=
> =A0#define=A0=A0=A0=A0=A0=A0=A0 OG01A1B_ANAL_GAIN_MIN=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 16=0A=
> =A0#define=A0=A0=A0=A0=A0=A0=A0 OG01A1B_ANAL_GAIN_MAX=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 248 /* Max =3D 15.5x */=0A=
> =A0#define=A0=A0=A0=A0=A0=A0=A0 OG01A1B_ANAL_GAIN_STEP=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 1=0A=
> =0A=
> =A0/* Digital gain controls from sensor */=0A=
> -#define OG01A1B_REG_DIG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x350a=0A=
> +#define OG01A1B_REG_DIG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG24(0x3=
50a)=0A=
> =A0#define OG01A1B_DGTL_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 1024=0A=
> =A0#define OG01A1B_DGTL_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 16384 /* Max =
=3D 16x */=0A=
> =A0#define OG01A1B_DGTL_GAIN_STEP=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> =A0#define OG01A1B_DGTL_GAIN_DEFAULT=A0=A0=A0=A0=A0 1024=0A=
> =0A=
> -/* Group Access */=0A=
> -#define OG01A1B_REG_GROUP_ACCESS=A0=A0=A0=A0=A0=A0 0x3208=0A=
> -#define OG01A1B_GROUP_HOLD_START=A0=A0=A0=A0=A0=A0 0x0=0A=
> -#define OG01A1B_GROUP_HOLD_END=A0=A0=A0=A0=A0=A0=A0=A0 0x10=0A=
> -#define OG01A1B_GROUP_HOLD_LAUNCH=A0=A0=A0=A0=A0 0xa0=0A=
> -=0A=
> =A0/* Test Pattern Control */=0A=
> -#define OG01A1B_REG_TEST_PATTERN=A0=A0=A0=A0=A0=A0 0x5100=0A=
> +#define OG01A1B_REG_TEST_PATTERN=A0=A0=A0=A0=A0=A0 CCI_REG8(0x5100)=0A=
> =A0#define OG01A1B_TEST_PATTERN_ENABLE=A0=A0=A0 BIT(7)=0A=
> =A0#define OG01A1B_TEST_PATTERN_BAR_SHIFT 2=0A=
=0A=
...=0A=
 =0A=
> +static const struct cci_reg_sequence mode_1280x1024_regs[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0300), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0301), 0x29 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0302), 0x31 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0303), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0304), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0305), 0xd2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0306), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0307), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0308), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0309), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0310), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0311), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0312), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0313), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0314), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0315), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0320), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0321), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0322), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0323), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0324), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0325), 0x77 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0326), 0xce },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0327), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0329), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x032a), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x032b), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x032c), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x032d), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x032e), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x300d), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x300e), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3021), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301e), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3103), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3106), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3107), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3216), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3217), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3218), 0xc0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3219), 0x55 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3500), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3501), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3502), 0x8a },=0A=
=0A=
You are already setting them using set_ctrl,=0A=
so you can remove these two lines. =0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3506), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3507), 0x72 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3508), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3509), 0x00 },=0A=
=0A=
Same here.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x350a), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x350b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x350c), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3541), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3542), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3605), 0xe0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3606), 0x41 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3614), 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3620), 0x0b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3630), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3636), 0xa0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3637), 0xf9 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3638), 0x09 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3639), 0x38 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x363f), 0x09 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3640), 0x17 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3662), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3665), 0x80 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3670), 0x68 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3674), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3677), 0x3f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3679), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x369f), 0x19 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x36a0), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x36a2), 0x19 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x36a3), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x370d), 0x66 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x370f), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3710), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3715), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3716), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3717), 0x06 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3733), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3778), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37a8), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37a9), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37aa), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37bd), 0x1c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37c1), 0x2f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37c3), 0x09 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37c8), 0x1d },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37ca), 0x30 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37df), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3800), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3801), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3802), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3803), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3804), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3805), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3806), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3807), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3808), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3809), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380a), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380c), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380d), 0x50 },=0A=
=0A=
You can use OG01A1B_REG_HTS=0A=
{ OG01A1B_REG_HTS, 0x0350 }=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380e), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380f), 0x98 },=0A=
=0A=
You can also remove these two lines.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3810), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3811), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3812), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3813), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3814), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3815), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3820), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3821), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3826), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3827), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x382a), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x382b), 0x52 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x382d), 0xba },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x383d), 0x14 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x384a), 0xa2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3866), 0x0e },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3867), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3884), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3885), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3893), 0x68 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3894), 0x2a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3898), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3899), 0x31 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389a), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389c), 0x0b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389d), 0xad },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x389f), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38a0), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38a1), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38a8), 0x70 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38ac), 0xea },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38b2), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38b3), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38bc), 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38c4), 0x0c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38c5), 0x3a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38c7), 0x3a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38e1), 0xc0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38ec), 0x3c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38f0), 0x09 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38f1), 0x6f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38fe), 0x3c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x391e), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x391f), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3920), 0xa5 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3921), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3922), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3923), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3924), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3925), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3926), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3927), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3928), 0x1a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3929), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x392a), 0xb4 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x392b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x392c), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x392f), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4000), 0xcf },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4003), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4008), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4009), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x400a), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x400b), 0x54 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x400c), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x400d), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4010), 0xc0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4012), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4014), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4015), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4017), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4042), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4306), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4307), 0x12 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4509), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x450b), 0x83 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4604), 0x68 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4608), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4700), 0x06 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4800), 0x64 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x481b), 0x3c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4825), 0x32 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4833), 0x18 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4837), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4850), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4860), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4861), 0xec },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4864), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4883), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4888), 0x90 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4889), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x488b), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f00), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f10), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f21), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f22), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f23), 0x44 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f24), 0x51 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4f25), 0x41 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5000), 0x1f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x500a), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5100), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5111), 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3020), 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3613), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38c9), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5304), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3620), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3639), 0x58 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x363a), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3674), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3780), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3781), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3782), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3783), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3798), 0xa3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37aa), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38a8), 0xf0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38c4), 0x09 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38c5), 0xb0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38df), 0x80 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38ff), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4010), 0xf1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4011), 0x70 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3667), 0x80 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4d00), 0x4a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4d01), 0x18 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4d02), 0xbb },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4d03), 0xde },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4d04), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4d05), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x4d09), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x37aa), 0x16 },=0A=
=0A=
Many registers are being written multiple times. I don't think this is =0A=
helpful, so we can remove=0A=
=0A=
Some repeated registers I found:=0A=
=0A=
0x37aa: 0x07 > 0x10 > 0x16 (written 3 times)=0A=
0x38a8: 0x70 > 0xF0 (written 2 times)=0A=
0x38c4: 0x0c > 0x09 (written 2 times)=0A=
=0A=
... there are likely many more.=0A=
=0A=
You can simply keep the last value and remove the other entries.=0A=
=0A=
Additionally, please check the mipi_data_rate_1000mbps registers. =0A=
It seems the same registers are repeated in mode_1280x1024_regs, =0A=
so remove those duplicates from mode_1280x1024_regs.=0A=
=0A=
If you have the datasheet, please also add the register names for =0A=
the known ones. =0A=
=0A=
Best Regards,=0A=
Tarang=

