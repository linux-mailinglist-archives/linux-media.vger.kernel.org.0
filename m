Return-Path: <linux-media+bounces-38654-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E753B1597A
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 09:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A2E318A79BD
	for <lists+linux-media@lfdr.de>; Wed, 30 Jul 2025 07:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF28228642A;
	Wed, 30 Jul 2025 07:17:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021085.outbound.protection.outlook.com [40.107.57.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6858D285C93;
	Wed, 30 Jul 2025 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859874; cv=fail; b=eWQZRm4F0y/upmJczY7Q7M/qrZvmFQ7gW40TE6zG2y6YYoVX0GlXS3Mv6QEOdZRdd5LOCgzG2P7ARToD8Qn9tWKaTz1dd1qvpcmmYBRvHN2iTzp/B2aMLI4glo7CcwHglC6zGV6vCQ7lnM7kFQ/myPpQQe4gkS9uYj8e6LCdAQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859874; c=relaxed/simple;
	bh=ZfNq8tiUs8Uz6LJK1YuMkkfN+B1Aa4WTjUx6n0jHmn4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s3ByZrf4NpOkAvboJJJGeD4wP1GoWohYZzFi9QOUKzHomwOVQpRlH0B0PspuBZ0AAea2sgXqb6Q94mZJ6A68Z/zKVgVcewq8PCxpHF7HksDs88ImffvmiBeGLXtvcqPqZWYh8paqxwaBv2D1lFVfcqoM8ZW+WW6pGWk7YEsqkyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvNn28pDxiS3nZpeT/yAAsbmDDCPpY7QYci/8YlAQE7jUvANiJxX15635YmsKQfW16Ib5iSLxTrby3Wei4ALxWfyO7R7sYXuGO/4nDOi2o8aEjxdvPvthkbPjuiHRausFk3o0qdSbSc4TgHbOvnQbmvX5/SBr88FQMFr1vHU5+MfIb6EtLsDX23md8o6mNBZar5ODoIntZhuZNep8YXm45ZS/lOPTtk+PAwKj75891xpa3D83NvZ/ZinmgjHXrxmx4oqGgkJTqvtoAWOk/oizyri7i03Sk+0GmyWACaPgSvMKwxeEmio1Kcu7ruRi6mPD6+qvbImGxuSyqjAexJewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBRVbcxnDyI6IVOypDGnq5G942cB1Dm45OycJxvrS9g=;
 b=DCvnLKIct9uQpsiPOnevoH0LEO0cRjEfXwpD4CVM0QNykFQpsiG4qLiogdFQA9WkEwfQcxU9xL/ZCWWaJ7x6TYZRhj+bqpxSMx23w49nQknV/sdBvKjgJXerSWdaiFYcXnr0WehDt+FePCyRvvCpbn907xGnqEOmJcZ+rzR48595YNBq5r7hMw53AeULcucEH86xbgkcPx3VxOnGffrRnYkgJuQ8o3EyeA3hQmHZws+Ih0KK2q2orH/u2WkCuVe+/Wy6pMbc9AERSAJsX/6HJo9cGxUSxhGfJ/bYYAeNUOei8kXjamSbntDqYgZmT3JRi3JltDHKviN6j2+6mtgnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3711.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:257::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 07:17:42 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 07:17:41 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Thread-Topic: [PATCH v2 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Thread-Index: AQHcAN6qVwNQ7sYEFk682hfFPrQM0LRKQBCz
Date: Wed, 30 Jul 2025 07:17:41 +0000
Message-ID:
 <PN3P287MB1829E5EBEC8D250E704737788B24A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250729231454.242748-1-vladimir.zapolskiy@linaro.org>
 <20250729231454.242748-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250729231454.242748-3-vladimir.zapolskiy@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN1P287MB3711:EE_
x-ms-office365-filtering-correlation-id: 0ab5ddb5-620f-4899-95ac-08ddcf392c3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0v6r7KAN+xMid/4g/NfWOyfknDEudNaMq5bPBUmYkT50iIyU0x3PUvWDj0?=
 =?iso-8859-1?Q?S7b2Lvp7V0hhLmsLVX3hOfePbLpuOdpIzP3bXcVFTfN+zOLY236thCujr0?=
 =?iso-8859-1?Q?Vohj3neWJNyaQVO2B0Y8RjtZlvev2Odg8/afYC7uuhFDOue/jsWSfW+5AU?=
 =?iso-8859-1?Q?WwE6HPPJ0RrcTj4hI9HQogrJAzJrUtzRpCZcT4Ep0AIsVvmwG0rNHGnKmI?=
 =?iso-8859-1?Q?9l5iK+N8z9HjKWRM3wvPXe+zJ3fuYSqY/paSqBX/gLctxJ8yaJpuuHdtwO?=
 =?iso-8859-1?Q?+RJKKkkq/rYWWUcd/7F25p07xxo2lOCCdl6zTVJatpJ3a+8+u1qwaSqypc?=
 =?iso-8859-1?Q?RE6KrcsnTO23zHHRqVEsyvspO5op2TFVVG7IroT5BYVdXt3oyXHofpB1S2?=
 =?iso-8859-1?Q?b9nWCH/mHzimYoYerSOm8EWRj4qmTPCmTNU1LisaUGetg3m7CtjCBx4t0Z?=
 =?iso-8859-1?Q?bSv2qHI5hqgxgv00+rKMwhx0IJ1GdEdbJxYSdjHWdpnwlui7GsesNjtI7C?=
 =?iso-8859-1?Q?Qfe3xyIJbj89u6EA9ZTcTEss9z2/5/eXToE6qE7hwATIbCY4wwzSZVBGBL?=
 =?iso-8859-1?Q?fC/f5lk+2KUGUezkn+L4FA5Iw/LRHkMAntOFKXMtdXGtvFFSnNSD6O8Eq0?=
 =?iso-8859-1?Q?pRtmympaTPqNZ7UJ9oNRZpkosGIBUVgQEILKM+DcTrhPF8HNOIj3rr8qTF?=
 =?iso-8859-1?Q?UvAzbcgFLhlLFH6vqXRlUdaUDKH5sxuD122ty6g8D7F9k4E6+fIxI+kEwd?=
 =?iso-8859-1?Q?AMX2VZLiUY/i6wz0On9flXelcK+GgkPl08sNrrnGcz3QnEaF+j+9YkYneu?=
 =?iso-8859-1?Q?X8jk9IkRQ/8oOPUtiJZSuD9kAupaVVqXeeTUax3/6Vivi37DircRHgQEZz?=
 =?iso-8859-1?Q?2CFmEUNt5FAiga0AkBUXE7agHMEXL/9RtRyT4HaAQ9UKwb6ziRDe6MDADv?=
 =?iso-8859-1?Q?Ym3wBxEGBP3YvgHM00PEOEGQ0MwGqZ/Ui8dMtcvXaFPd7mNrkdH5SsrmSr?=
 =?iso-8859-1?Q?QqSAJQokjhxPo/+nNBJgB4DnibyNlHIbFfV30LCcjjkh5GBRWhs++NSC2B?=
 =?iso-8859-1?Q?L5iT+gkRgO4zZWlnZaoJdt7LnTeDL/N9kJCHR0Pe+ZF0ihAdeayckdEnQb?=
 =?iso-8859-1?Q?Rs6s5j9gMl11Iwx/popszaYbg/gDvfoPBXScXbRfyX3D7uo7nVRYOWPuZN?=
 =?iso-8859-1?Q?w8+gkIJVUeUXW9mynsDIdHFJqszToPyij11Yz+bhtWfZEe6K6ytV5KIOm/?=
 =?iso-8859-1?Q?yRgOXLHpZXlfyWTkn+Ozth80VbB2rbAndqPiG8uGy8zLglOYjM6ZytXUWX?=
 =?iso-8859-1?Q?dz87ggZ1r0avNsaOl7ZAWuQFAcIQvJZTWRQp/xcabSNOLdVVreOjPl8c2l?=
 =?iso-8859-1?Q?hWCHlMM44rJafUwGTrRaeaVBN3wOpTfFly6RHGnmIczTReUFR98Ij1Lont?=
 =?iso-8859-1?Q?hw5MHXbQIRRa/vk/p99uWbA8C1pBolrq1nTlVrHjegKOGRHU59AvJmP2OJ?=
 =?iso-8859-1?Q?zDryUCaFAxOvQGGovRDPYu1R6S9TABha6kAPpQw7G71w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Xe6IlGdpPJfH1hBl+h2itdVerR+Kf5of1WPlE5OlYbjZLH9+VR6s7UwHCR?=
 =?iso-8859-1?Q?/6R3P+G7ZX8uQmLtVRO3qXClFyKkbCdqA4kZWQkF3XM/HMtd2gdenFgPuc?=
 =?iso-8859-1?Q?Cp5CQab34N3z9ETpACm9hVDSP3hs5Rr2Jg3FUj+cN2ws7inERWeiz6KDpC?=
 =?iso-8859-1?Q?hKoTbvU8Ve3rshpp+iMfCwRx5Dc+imEbNiknHbmvpEy4KAwxiip5ZncUJM?=
 =?iso-8859-1?Q?JJkQwwz6t9Mr+8X5/Jcx1MwuGd1RsPrl2lMJQGdsreduOx2Ong5bOlnrB5?=
 =?iso-8859-1?Q?pg6tTiAxnSPtfVXaQhQokFpWCv703Txrf3mOnp30sy8giCe8EUxhvWl10p?=
 =?iso-8859-1?Q?9LroEAjItfg6sBlYqsX0eV6zunNKNlDRvEOAwIdkbnRcNo+tiA8R+0Nqk2?=
 =?iso-8859-1?Q?dlXo+5vSqDyv78E1x/DG8fSv0/SrrgFK3LqgG4Q4mYn3edcQoVsjZ/35Cq?=
 =?iso-8859-1?Q?boBnoeE0vioN3skIOxCBCyJJpxE9LUU6dFWPoVX9KgWtAvLBpU6JiJQAoS?=
 =?iso-8859-1?Q?vebAK2fvN9FWZf9xEnBiUvCaaR8j1o3VIWLqGzCQoqjAEdblQ0XETO4Jjq?=
 =?iso-8859-1?Q?NuFtED/PyoRubO1uLsQcEnqV9d/KOLczFvpsKyssrxyd7NtcAw9jvg7izS?=
 =?iso-8859-1?Q?AvBQUn89TDQBn6EXpsF4MlUL6iL+NM80pW2HZ8O+KzEOAS2LwDOuX8bgqE?=
 =?iso-8859-1?Q?pYuAJrPuQHPpdjcCOU8vTDA4xv1fWKnmGusMR7KNEU941E+tWwceO7kb0a?=
 =?iso-8859-1?Q?fYrtcKOjF5gztnbXRhhzhkkEVHEIJ7gAHgoHtlIa5TRbHQR2q481W+dGct?=
 =?iso-8859-1?Q?5HSTRPCI+413Dzz6/N/al4Mc2t8KV2wbJ9KrE4uyqbOv5slJAHT2fRBp+m?=
 =?iso-8859-1?Q?Z8i0I5mOrz1IGSK+DFHwFixbY+Z9/mrPdFoQ0435H+mVSyvug9phm/vl25?=
 =?iso-8859-1?Q?oMREOwrFdLp0bN4x7M4F3bNrD0qqXIEd/rc5jDu1Q6hR6qp5nMZeIJIBeq?=
 =?iso-8859-1?Q?++o+8PCW/HUMAO/oLFux5STVuRaR5LJImy31XHsL2d00ANv7KyH1wB0D5f?=
 =?iso-8859-1?Q?7OOae7cpwP9WeYrhXZmWh+IJHArwpIx4jlQ1k7A4O86LdYY53dJKSLQd4F?=
 =?iso-8859-1?Q?33qcD5kwvrYjLWwx61PnQFFPvljT9mFO8/l3rha8VMYkGxheGLMqAOZnu4?=
 =?iso-8859-1?Q?iIIpg4hg0aHkJn02fPciYSG/dtol89NbFuhfE/JvRdQTiT1GDh4wQfiaJs?=
 =?iso-8859-1?Q?5krcBAxtUqtkw4lr2LE4X0/XLCRHu5otCbFIFWbms2rWT+BF+vHWe5zCI6?=
 =?iso-8859-1?Q?OVos+Prjo1PwaLzJBfr1cxwpTbHoaz/kpqadnXLDDpKHCvYR/F06ymjt+d?=
 =?iso-8859-1?Q?S8HZrHfleEjYzJv81JgjL8bXYROWcPMVjBQccLLQ160VVdR1JOpqpotCZN?=
 =?iso-8859-1?Q?2fmcnonexxdxuivEMDTypmcU2cAgnxkLJ17Z+AOKy8WcRnXEuRoKFX6ewz?=
 =?iso-8859-1?Q?ihYqvMenlSiyDzhfeEKmQVzMYfAMjhc1gigq2oPp87dtKwgl7FIaroXfNE?=
 =?iso-8859-1?Q?wm6GVRLQmHBrPj/TX+5V0tm+ZdxdgMU6cVtlQod+zXeIo5kRIPyMj7aLla?=
 =?iso-8859-1?Q?Ri21SZKxikN+4ZsBagch7pAvbYIfD3mzSl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab5ddb5-620f-4899-95ac-08ddcf392c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 07:17:41.8463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjM9LI3eDARduwxZQ+8YVyLS036kdB2htdzYOgC0A5OGEEl8iEUrxSoYhZyA+nRQMVl4pr/warphFVHox4KwM1vo0WxFXYrjpnfAQ+8wdfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3711

Hi Vladimir,=0A=
=0A=
> OmniVision OV6211 is a monochrome image sensor, which produces frames in=
=0A=
> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100=0A=
> output image resolution modes.=0A=
> =0A=
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
> ---=0A=
> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 8 +=
=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0 10 +=0A=
> =A0drivers/media/i2c/Makefile |=A0=A0 1 +=0A=
> =A0drivers/media/i2c/ov6211.c | 821 +++++++++++++++++++++++++++++++++++++=
=0A=
> =A04 files changed, 840 insertions(+)=0A=
> =A0create mode 100644 drivers/media/i2c/ov6211.c=0A=
=0A=
...=0A=
=0A=
> +struct ov6211 {=0A=
> +=A0=A0=A0=A0=A0=A0 struct regmap *regmap;=0A=
> +=A0=A0=A0=A0=A0=A0 struct clk *xvclk;=0A=
> +=A0=A0=A0=A0=A0=A0 struct gpio_desc *reset_gpio;=0A=
> +=A0=A0=A0=A0=A0=A0 struct regulator *avdd;=0A=
> +=A0=A0=A0=A0=A0=A0 struct regulator *dovdd;=0A=
> +=A0=A0=A0=A0=A0=A0 struct regulator *dvdd;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
> +=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler ctrl_handler;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 const struct ov6211_mode *cur_mode;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* To serialize asynchronous callbacks */=0A=
> +=A0=A0=A0=A0=A0=A0 struct mutex mutex;=0A=
> +};=0A=
> +=0A=
> +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D container_of(ctrl->handler,=
 struct ov6211,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl_handler);=0A=
> +=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&ov=
6211->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
=0A=
Consider adding struct i2c_client *client to struct ov6211 to avoid=0A=
repeatedly retrieving it via v4l2_get_subdevdata().=0A=
=0A=
or i think adding struct device *dev might be more generic=0A=
  =0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* V4L2 controls values will be applied only when pow=
er is already up */=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(&client->dev))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->reg=
map, OV6211_REG_ANALOGUE_GAIN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ctrl->val, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_EXPOSURE:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->reg=
map, OV6211_REG_EXPOSURE,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ctrl->val << 4, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 default:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(&client->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static void ov6211_stop_streaming(struct ov6211 *ov6211)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&ov=
6211->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->regmap, OV6211_REG_MODE_SEL=
ECT,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV621=
1_MODE_STANDBY, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed=
 to stop streaming: %d\n", ret);=0A=
> +}=0A=
> +=0A=
> +static int ov6211_set_stream(struct v4l2_subdev *sd, int enable)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(sd)=
;=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D to_ov6211(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_lock(&ov6211->mutex);=0A=
=0A=
Instead of using a custom mutex, you can switch to the subdev state lock.=
=0A=
This requires calling v4l2_subdev_init_finalize() in probe.=0A=
=0A=
You can take referance from imx219. =0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 if (enable) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D pm_runtime_resume_and=
_get(&client->dev);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mutex=
_unlock(&ov6211->mutex);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n ret;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ov6211_start_streamin=
g(ov6211);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mutex=
_unlock(&ov6211->mutex);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211_stop_streaming(ov6211);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(&client->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov6211->mutex);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int ov6211_set_format(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D to_ov6211(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 const struct ov6211_mode *mode;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mode =3D v4l2_find_nearest_size(supported_modes,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(supported_modes),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 width, height,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fmt->format.width,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fmt->format.height);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_lock(&ov6211->mutex);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211_update_pad_format(mode, &fmt->format);=0A=
> +=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *v4l2_subdev_state_get_format=
(sd_state, fmt->pad) =3D fmt->format;=0A=
> +=A0=A0=A0=A0=A0=A0 else=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211->cur_mode =3D mode;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov6211->mutex);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int ov6211_get_format(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_format *fmt)=0A=
=0A=
You should use v4l2_subdev_get_fmt().=0A=
=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D to_ov6211(sd);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_lock(&ov6211->mutex);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fmt->format =3D *v4l2_subdev_=
state_get_format(sd_state, fmt->pad);=0A=
> +=A0=A0=A0=A0=A0=A0 else=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211_update_pad_format(ov62=
11->cur_mode, &fmt->format);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_unlock(&ov6211->mutex);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static int ov6211_probe(struct i2c_client *client)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211;=0A=
> +=A0=A0=A0=A0=A0=A0 unsigned long freq;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211 =3D devm_kzalloc(&client->dev, sizeof(*ov6211)=
, GFP_KERNEL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (!ov6211)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->regmap =3D devm_cci_regmap_init_i2c(client, 1=
6);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov6211->regmap))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(&client-=
>dev, PTR_ERR(ov6211->regmap),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to init CCI\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_sub=
dev_ops);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->xvclk =3D devm_v4l2_sensor_clk_get(&client->d=
ev, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov6211->xvclk))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(&client-=
>dev, PTR_ERR(ov6211->xvclk),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get XVCLK clock\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 freq =3D clk_get_rate(ov6211->xvclk);=0A=
> +=A0=A0=A0=A0=A0=A0 if (freq && freq !=3D OV6211_MCLK_FREQ_24MHZ)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(&client-=
>dev, -EINVAL,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 "XVCLK clock frequency %lu is not supported\n",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 freq);=0A=
=0A=
Wrong indentation=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D ov6211_check_hwcfg(ov6211);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(&client-=
>dev, ret,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to check HW configuration\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->reset_gpio =3D devm_gpiod_get_optional(&clien=
t->dev, "reset",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 GPIOD_OUT_HIGH);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov6211->reset_gpio))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(&client-=
>dev, PTR_ERR(ov6211->reset_gpio),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "cannot get reset GPIO\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->avdd =3D devm_regulator_get_optional(&client-=
>dev, "avdd");=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov6211->avdd)) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR(ov6211->avdd)=
;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret !=3D -ENODEV)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n dev_err_probe(&client->dev, ret,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Failed to get av=
dd regulator\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211->avdd =3D NULL;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->dovdd =3D devm_regulator_get_optional(&client=
->dev, "dovdd");=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov6211->dovdd)) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR(ov6211->dovdd=
);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret !=3D -ENODEV)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n dev_err_probe(&client->dev, ret,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Failed to get do=
vdd regulator\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211->dovdd =3D NULL;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->dvdd =3D devm_regulator_get_optional(&client-=
>dev, "dvdd");=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(ov6211->dvdd)) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR(ov6211->dvdd)=
;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret !=3D -ENODEV)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n dev_err_probe(&client->dev, ret,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Failed to get dv=
dd regulator\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211->dvdd =3D NULL;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* The sensor must be powered on to read the CHIP_ID =
register */=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D ov6211_power_on(&client->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D ov6211_identify_module(ov6211);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(&client->dev, r=
et, "failed to find sensor\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto power_off;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_init(&ov6211->mutex);=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->cur_mode =3D &supported_modes[0];=0A=
=0A=
Since only one mode is supported, you can remove cur_mode from struct ov621=
1.  =0A=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D ov6211_init_controls(ov6211);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(&client->dev, r=
et, "failed to init controls\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto mutex_destroy;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->sd.internal_ops =3D &ov6211_internal_ops;=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->sd.entity.ops =3D &ov6211_subdev_entity_ops;=
=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR=
;=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D media_entity_pads_init(&ov6211->sd.entity, 1,=
 &ov6211->pad);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(&client->dev, r=
et,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "failed to init media entity pads\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto v4l2_ctrl_handler_free;=
=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&ov6211->sd=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(&client->dev, r=
et,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "failed to register V4L2 subdev\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto media_entity_cleanup;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Enable runtime PM and turn off the device */=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_set_active(&client->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_enable(&client->dev);=0A=
=0A=
Runtime PM should fully initialized before calling =0A=
v4l2_async_register_subdev_sensor(), so you need to move both lines above=
=0A=
the subdevice registration.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_idle(&client->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +media_entity_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&ov6211->sd.entity);=0A=
> +=0A=
> +v4l2_ctrl_handler_free:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(ov6211->sd.ctrl_handler);=0A=
> +=0A=
> +mutex_destroy:=0A=
> +=A0=A0=A0=A0=A0=A0 mutex_destroy(&ov6211->mutex);=0A=
> +=0A=
> +power_off:=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211_power_off(&client->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static void ov6211_remove(struct i2c_client *client)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(client)=
;=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D to_ov6211(sd);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_async_unregister_subdev(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&sd->entity);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_disable(&client->dev);=0A=
=0A=
Runtime PM usage here is incomplete. You should also set the =0A=
device status to suspended. =0A=
=0A=
Refer to the imx219 implementation.=0A=
=0A=
Best Regards,=0A=
Tarang=

