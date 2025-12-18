Return-Path: <linux-media+bounces-49055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 76529CCADB1
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E01513029B63
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 08:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BED330663;
	Thu, 18 Dec 2025 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="UVsEE+AB"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021096.outbound.protection.outlook.com [40.107.57.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771033065E
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046310; cv=fail; b=hthl+OE789881TF6I+LkszHaiMs2kjoX9TH+jcZdxi7G9TXntxi381/MeHdgN78i5tsCcLj92NBwwIXQmyw2Q7rR3FP/+gXNYYQzfrkJzNErW5agWW3Lyca9PCpuOPY6PnEOiG3aXGULW23okLs4FIXvsrK+RwK4foS2RHX1yy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046310; c=relaxed/simple;
	bh=xptkJlwTw1MoSz3DDUfbsg2cMK5aefzkEAhWaFPJXFM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rVAGFcywygKIAZX7gW0OKoFeY/hiaVxK2XgLmezwbZE1vYZn79kXZhuzJD4xJs69VX/Edl6hNYxmU22XVGN8pAgavuCkySvGHJi2oTdzaqc8JXyEBqnSI0ffA/5R4iJflIiKh+chG/TXUKhu1Y+NFJbwVBbUkc29KmxmOHmaf34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=UVsEE+AB; arc=fail smtp.client-ip=40.107.57.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeT6U2hawPqj+gRf7oG0cl2Pxbe9moh0ccE603W80up466LMU4KQfjkFoYfWg/EirjY58u04cnY2yMB3+rK14IkchPILEIVmlV0pVpUedI35Kw2JmC4HdUmv6JUKUcJlrroTLR/57sHaLbXZXJr5BQd2j574YmvQLNVS7N9rF1Cr6HBcr6oo92kGud+Ngz/sVDQtxRVbJIwgaZ0MwwI96wNj9JRAp3X65qojgY+dPpNjkFjNyoCbmNA0DzXMF5ZDhUTaR6O+CaZtSBgPfycRifUtvopv8IXBY7T0syokD6zcJeQdRT+atOQVHKbpq44VmkwMO6RnRwvibPQitkkaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xptkJlwTw1MoSz3DDUfbsg2cMK5aefzkEAhWaFPJXFM=;
 b=wqMkUqO39N5kUOcDNWR3kt6hPX7VKfz9/js7ICYRMxuZJK9SS7GNdaEZ+WuNE95aojnNrOH1l8qC8dyS060ym7Xrh4iz8I5l188Zs8bjZDtJx4VbdFLq3R5CU6W9ug9ctlarrxTqhyJXTrSDU6LuzBVDqzwLLD8NaUesaccWrQgQ9Nf8dlBfLyYsr9eG5qvfU7ZoXuPZ3ivzZfKwWaLtRpUhKUqm46TDmhYIHH+HRxH1AMz2c05S1WKeDMZM3gkEyKlbRdz7tBwOjbLUEBZX12ERz+nvHmI+G+JgJ2Ug7pQLHhAdO0O/kGtzmkK5G86kV5mB1uckQfL4GlEl9ufuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xptkJlwTw1MoSz3DDUfbsg2cMK5aefzkEAhWaFPJXFM=;
 b=UVsEE+ABJ3PYmyHl01+aNEdjIlMvfMt7DrLK9BXaXTOJM5KjjlaCcXhUTtiR59ahQK6CI+HATRVvgx7G8hLThZ32adLPmWlh7lROctBVTWPUGL8JDzBPdFPJQgBY7t7aUKMwA9at1yBy9qbkK+9k4zk6VWOmSroaWNoyJDHGJPbroXVBFeZIv7XSKWgGSeEDoF/S2cPmwLCxyYM0oJYjMzDr2YpLr3E0BABdaCKqp3hqh7k1z8mriRJCwY6T9ZBLcTtjXEO2/oQT1AROYdcWlqxlQAePVjR75rhHhnq7q0CigNIZWgE4XyWSVK8i5HVDDhlExJO3XNPbc3h2FN+pZw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3840.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:257::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 05:50:03 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:50:03 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: i2c: ov6211: make configurable vblank control
 of the sensor
Thread-Topic: [PATCH 1/2] media: i2c: ov6211: make configurable vblank control
 of the sensor
Thread-Index: AQHcb7+ZTcqmjM+YMU2BfbVB0oKk2rUm3zSK
Date: Thu, 18 Dec 2025 05:50:02 +0000
Message-ID:
 <PN3P287MB18295BB7CB246E9A3C9AA5408BA8A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251218014155.3265999-1-vladimir.zapolskiy@linaro.org>
 <20251218014155.3265999-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251218014155.3265999-2-vladimir.zapolskiy@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN1P287MB3840:EE_
x-ms-office365-filtering-correlation-id: 07e2d204-ffd2-4b9d-ff35-08de3df949f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d66OFXrQvOcGf+lxxSs/UkZTkbX6SVFgbeNlDE6QUX8GdsQDAMbm/OlpQj?=
 =?iso-8859-1?Q?9JusNQTETZbfYZ3aDRSf6ElpPO0A5AOQPEfZyRGm2QRTvtEliwhqpWTt8P?=
 =?iso-8859-1?Q?8+ym5A/VmIG3w9z3ZVMnEjrxVOf+QKlpV33VLdWGb7VTcj2V9zKFrtYeKx?=
 =?iso-8859-1?Q?pUL9ZdLI8Xz5mYHcR/1SXHC9bX7QHd11HKz+OLe4ienANdtUywRuraykZG?=
 =?iso-8859-1?Q?I2jOAcfiVO5cYAzwFJtfuifIkxxCbask9Thk9BC5/kVXtlSZ4SFrpc1mUB?=
 =?iso-8859-1?Q?1AU0t3YPq6X1yUvubNDU9HxI9a9OHO9PDGpxs8cgV7ZmPlDfkTBKlD5mN0?=
 =?iso-8859-1?Q?GTyGwvrI7S1GwctvZSuqqCi6bslHzK/wZIqDgKZLwqu8l2rxxYxA6xWE21?=
 =?iso-8859-1?Q?4R23B/OJvfASEX3nDqSylopJxZ50QgGmn4FBYgCN5PG2s9OXZWRjZdFLRc?=
 =?iso-8859-1?Q?+MQc7DMGaR+GIjqFSLfollzfvAL8UbSlNKsUt0lKrbWvaQgl9vdGAUOk1p?=
 =?iso-8859-1?Q?dwj0iBkfYy0u1FllIYFD5qSX2C1J2fnTaDfq5e87imUhpyGKFD/KM1/BNt?=
 =?iso-8859-1?Q?tYmgz0+Upb2NeqFAfuySbzrJLq7Mg4UBD5mNRzXm5wQVW/UbKLUNN2ZL01?=
 =?iso-8859-1?Q?yqNQuzKy+LtgOnURTzl/5tBN42yJVfz9ZV//relX2vdPQaIMKL5RVf77IM?=
 =?iso-8859-1?Q?y1EozsIOtc5J8cnAC3RLsNoLxOZn22Vu1NiV6NWBzN8T5C8D9YaL0hY0pX?=
 =?iso-8859-1?Q?CCS8c+uJgn+qRrFim9xS0NCCMmnOOvLUOXYRgpdj/wAM2yzS+BjwI+6aR7?=
 =?iso-8859-1?Q?FASrb4vDHatNg0iTb0if5cQFXJulhUF4r68aXvycPUaedUZnPhxm/kJCT8?=
 =?iso-8859-1?Q?uCFMvYYN6C3ZWpK8Huu/s9PITP6r3e8RccaVdu39KdR1+Y+01SFXOYbYu7?=
 =?iso-8859-1?Q?thHtVnVCkcq1N40xqBomOFbewimnIcRd7TuBsAxltphFrff6rplsynhJ4z?=
 =?iso-8859-1?Q?HbDdmPF482MJbj/A68AjNiNIr5t2c6LQyPrz4WOHsGI5MoekyNn5rYWiP2?=
 =?iso-8859-1?Q?SjJ8+Neos4C/ryUxX0KGu7q7u8j79K16t5QdbATVo0txtKz90bSgrMLnao?=
 =?iso-8859-1?Q?n920gbbGEZHKGoGtpHrjGK4YFYeS//115XnNhIOywqWdAQtv567AJ0muzZ?=
 =?iso-8859-1?Q?/69Frt2HNKkniDyxIY0oFdQUTfxCwcUb6TCHRlGpROC+hCMYVfSasxhMmC?=
 =?iso-8859-1?Q?T3KQFOKq0OjE6GbkC1o8lQ0XoVnrRvr3aRrQ4pwyIqh0NdYDsSFK1fw6t2?=
 =?iso-8859-1?Q?C4kEzvtj63SJrcffx3Om3GTxgt9KjAUEMMi/j/d350Auz/xZevQwgvm+y/?=
 =?iso-8859-1?Q?92zR3b7q+9Mc0qOQDaQi8HGCprhdBMA3Qhx9RkgR/w1HAdf2YYXnzyE1gt?=
 =?iso-8859-1?Q?48HuyOvUcUPkmlBA366KseZMr3Qag91JuTfZWMrWPviZkSH8+xVBDtJBY0?=
 =?iso-8859-1?Q?3hyoTWmsk5Q6BoWMRTgOgzeSCSJQ6LApuSGZUNYBkHpuWyaTkzjNEzgw8X?=
 =?iso-8859-1?Q?WPZiWFSuw31Mr1FXALZFrQyalX8a?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5eAiz9nwdQIiNOO6AjORsuoVr8g/nBL5mszFfMxBf27PLv52Ve5Eqh2+Hj?=
 =?iso-8859-1?Q?KWSJCDNrMpoD5ZPENlqXYZELT2KcKm5uN0syP+qOkCaXndKWBeopYKWilN?=
 =?iso-8859-1?Q?UTV5OX0yJAS1Ct7D7p2VNz5IKUA3fXstoLUnQODTz6JH3hnDT9D06aOlUe?=
 =?iso-8859-1?Q?nTA1LvEju+iRL8biq6SbvAZLdaS9e0QfUIiYoi8K2SIL8mS0iGAXZgpdu+?=
 =?iso-8859-1?Q?aL6pw5yNKc9ytPuzDfSqJZ5R/uRm0sRziPqBTRji92MeM6NwTgkyc/FyQH?=
 =?iso-8859-1?Q?2yYgr0ZMXI0YGYV/DVEx6ur3o4aJskCYDlMKABQlo5vphd9DJ+JX2nAbCP?=
 =?iso-8859-1?Q?vUaD45f+a5mRAh0r0iSpLZXbcrUb4gpUAQ/K0C0Jpr05sxgw5jsApSu+51?=
 =?iso-8859-1?Q?cYOZlsOtqJWgs3EmdVHS8leU+eGM+HEz2BvYjXPmQDN5SoQVpdLUAOOpXb?=
 =?iso-8859-1?Q?kEfkgiOcWUn20Y2pegod5mcRVxyGnDTMt9HYJhagMIB9FLxIB+eqYkD+zF?=
 =?iso-8859-1?Q?l3TDg6lx/JNCPwmg6H7H+JK+rMQHXwjNcKMX19a4v8XoK9FyOZ5R7+0xP/?=
 =?iso-8859-1?Q?gb5EkHs2H+CqCnncLPCSRAYcQnX57GBWfckJu2VElhUc9iuzl5F7ebDWDG?=
 =?iso-8859-1?Q?k1EFbzmQM8Fbr+YU9XKyJ+6dWjvyM1mum4yQqMnA/yYwkn8lfTpm3ds/6k?=
 =?iso-8859-1?Q?OWs6nAB9nJMIjeW7hHnOgjT7PMRbTiQj0EXIIKlXUYg102b7OQZPpC5reL?=
 =?iso-8859-1?Q?KYxVfntgXcy5lRPD8l0pzrqidf/ouR6xrq6lXZ7feZ2i8i7lWAm4roFyo/?=
 =?iso-8859-1?Q?2rVzssD4aemhnF6HJvEVKibD4aSkRzoWvoHLePXtbILQZfAtOCdALgrNEQ?=
 =?iso-8859-1?Q?oh0KNgmuz00MWHbtxSNChFGdvmAUFxv0XDEkMKiusopJH20RXR2xO0ftvi?=
 =?iso-8859-1?Q?/WTq90vIWNqP/MyuFEJO2FVM92R8XQpi3endg2Phq0tt1xhAN9mJx69akL?=
 =?iso-8859-1?Q?lDRYQd7TlU+uzY8IY+v7SaVv5pjdltQz5Gb/n/csYRSl7raKxxS0F+3ATj?=
 =?iso-8859-1?Q?aKrI2TA0/uTSJ8Xx3gEIgQb8C9l7rekSRKqssU5M7fCf4QehMSpjk8XVxk?=
 =?iso-8859-1?Q?S+bDPwgwYASpkD3q0h3VE9cW3kEVqLcZQWEPj4qL10JwBxklcViApfK6uz?=
 =?iso-8859-1?Q?crd/O4ia0DRtmvp+NqWyTUeqrVkopLQWtmYOVcL85Ji9eQ/52rUQGJaVKp?=
 =?iso-8859-1?Q?12gOd8uIjoj2HJ8QA+2D76Nqlr8egRvdU80GTo0ficx/uw/752XEbMARCX?=
 =?iso-8859-1?Q?cexRJrqsQ4N5AIN1fXxXeU+XD54jBGiEC7MJ23NLFzEx4uwfrwKFat77Ci?=
 =?iso-8859-1?Q?vvi3QebbiLs4kSgOPy205qnBJh0CDKn5ao2EW2kOL0p2u4vnf/45WqA3Od?=
 =?iso-8859-1?Q?TvkcKf0swHjXi2AK9kkMCQxKpBmIsJXK8BRNYD69buv8O8HNzTLIVNU4aI?=
 =?iso-8859-1?Q?OAzIc/AS+YTk6EQWk7z62Pfrw9DWyzUvLXH4HYKk6xq/an4zFLtM991XiA?=
 =?iso-8859-1?Q?JWWMnW0+rfsUYAYx6wqigI1Y+JCd5zQH4kzIbYTEZeWQ4ncxv/z7iAkhfy?=
 =?iso-8859-1?Q?BXdnDp+7dXyKrywME+CgTAngcbpP+xyJr8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e2d204-ffd2-4b9d-ff35-08de3df949f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 05:50:02.9796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 36FN8nyR3qM4SNHN7eZeoceT8K8sr3PD1UunVopDh3CO7f/Zd0kk/wVbTnPg/iC/3HKIcc/Da6yQf8VuVeswRY+KBo4S3yIfQU78CjawXwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3840

Hi Vladimir,=0A=
=0A=
Small nit, please see the response inline.=0A=
=0A=
> Configurable vertical blanking size control allows users to set a wanted=
=0A=
> image frame rate.=0A=
>=A0=0A=
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
> ---=0A=
> =A0drivers/media/i2c/ov6211.c | 54 +++++++++++++++++++++++++++-----------=
=0A=
> =A01 file changed, 39 insertions(+), 15 deletions(-)=0A=
>=A0=0A=
> diff --git a/drivers/media/i2c/ov6211.c b/drivers/media/i2c/ov6211.c=0A=
> index e3ac5ecf27d1..5c784b1b3c84 100644=0A=
> --- a/drivers/media/i2c/ov6211.c=0A=
> +++ b/drivers/media/i2c/ov6211.c=0A=
> @@ -41,6 +41,10 @@=0A=
> =A0#define OV6211_ANALOGUE_GAIN_STEP=A0=A0=A0=A0=A0 1=0A=
> =A0#define OV6211_ANALOGUE_GAIN_DEFAULT=A0=A0 160=0A=
>=A0=0A=
> +/* Vertical timing size */=0A=
> +#define OV6211_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 C=
CI_REG16(0x380e)=0A=
> +#define OV6211_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
xffff=0A=
> +=0A=
> =A0/* Test pattern */=0A=
> =A0#define OV6211_REG_PRE_ISP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG=
8(0x5e00)=0A=
> =A0#define OV6211_TEST_PATTERN_ENABLE=A0=A0=A0=A0 BIT(7)=0A=
> @@ -89,6 +93,8 @@ struct ov6211 {=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
>=A0=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *vblank;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *exposure;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler ctrl_handler;=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* Saved register values */=0A=
> @@ -167,8 +173,6 @@ static const struct cci_reg_sequence ov6211_400x400_1=
20fps_mode[] =3D {=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380b), 0x90 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380c), 0x05 },=A0=A0=A0=A0 /* horizont=
al timing size */=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380d), 0xf2 },=0A=
> -=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380e), 0x01 },=A0=A0=A0=A0 /* vertical t=
iming size */=0A=
> -=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380f), 0xb6 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3810), 0x00 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3811), 0x04 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3812), 0x00 },=0A=
> @@ -251,8 +255,24 @@ static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D container_of(ctrl->handle=
r, struct ov6211,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl_handler);=
=0A=
> +=A0=A0=A0=A0=A0=A0 const struct ov6211_mode *mode =3D &supported_modes[0=
];=0A=
> +=A0=A0=A0=A0=A0=A0 s64 exposure_max;=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=A0=0A=
> +=A0=A0=A0=A0=A0=A0 /* Propagate change of current control to all related=
 controls */=0A=
> +=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Update max exposure while =
meeting expected vblanking */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max =3D ctrl->val + =
mode->height -=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV621=
1_EXPOSURE_MAX_MARGIN;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_modify_range(ov62=
11->exposure,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211->exposure->minimum,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211->exposure->step,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov6211->exposure->default_val=
ue);=0A=
=0A=
This control can fail, could you please add error checking.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* V4L2 controls are applied, when sensor is powere=
d up for streaming */=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_active(ov6211->dev))=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> @@ -266,6 +286,10 @@ static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->r=
egmap, OV6211_REG_EXPOSURE,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ctrl->val << 4, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->reg=
map, OV6211_REG_VTS,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ctrl->val + mode->height, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> =A0=A0=A0=A0=A0=A0=A0 case V4L2_CID_TEST_PATTERN:=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ov6211_set_test_pat=
tern(ov6211, ctrl->val);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> @@ -287,8 +311,8 @@ static int ov6211_init_controls(struct ov6211 *ov6211=
)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr =3D &ov6211->ct=
rl_handler;=0A=
> =A0=A0=A0=A0=A0=A0=A0 const struct ov6211_mode *mode =3D &supported_modes=
[0];=0A=
> +=A0=A0=A0=A0=A0=A0 s64 exposure_max, pixel_rate, h_blank, v_blank;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_device_properties props;=0A=
> -=A0=A0=A0=A0=A0=A0 s64 exposure_max, pixel_rate, h_blank;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *ctrl;=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=A0=0A=
> @@ -311,24 +335,24 @@ static int ov6211_init_controls(struct ov6211 *ov62=
11)=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ctrl)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->flags |=3D V4L2_CTRL_=
FLAG_READ_ONLY;=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_op=
s, V4L2_CID_VBLANK,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height, 1,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height);=0A=
> -=A0=A0=A0=A0=A0=A0 if (ctrl)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->flags |=3D V4L2_CTRL_FL=
AG_READ_ONLY;=0A=
> +=A0=A0=A0=A0=A0=A0 v_blank =3D mode->vts - mode->height;=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov62=
11_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_VBLANK, v_blan=
k,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV6211_VTS_MAX - mode->=
height, 1,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v_blank);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2=
_CID_ANALOGUE_GAIN,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 OV6211_ANALOGUE_GAIN_STEP,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 OV6211_ANALOGUE_GAIN_DEFAULT);=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 exposure_max =3D (mode->vts - OV6211_EXPOSURE_MAX_MAR=
GIN);=0A=
> -=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 V4L2_CID_EXPOSURE,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OV6211_EXPOSURE_MIN, exposure_max,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OV6211_EXPOSURE_STEP,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OV6211_EXPOSURE_DEFAULT);=0A=
> +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts - OV6211_EXPOSURE_MAX_MARG=
IN;=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov=
6211_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_EXPOSURE=
,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV6211_EXPOSURE_M=
IN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV6211_EXPOSURE_S=
TEP,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV6211_EXPOSURE_D=
EFAULT);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov6211_ctr=
l_ops,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_TEST_PATTERN,=0A=
> --=0A=
> 2.49.0=0A=
=0A=
With that change, it looks good to me.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=

