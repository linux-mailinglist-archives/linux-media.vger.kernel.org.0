Return-Path: <linux-media+bounces-48005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FD4C99D4A
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 03:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02DE03A574C
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 02:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477442206B1;
	Tue,  2 Dec 2025 02:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="DcoRn792"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021108.outbound.protection.outlook.com [40.107.42.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08A213254;
	Tue,  2 Dec 2025 02:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764641196; cv=fail; b=J9Fx3XgasSx0KpqbxRREpTB9OsazIbnCMcoiUPFMlJZp16cXSlanVDXauaswA6Dwt/WWMKe7Vk4iqS2KBQ4Q886Y57WhiusyHricSfqwP06inzSCQIaCTdgtH7kxKliHHxQUky3p7Kkylh7SdowhEI9YY6Wi5OTQk20c1qb43ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764641196; c=relaxed/simple;
	bh=Uaix7GttS6fMuE85G3xaIAxnl8wyqhF32+aWDAKE3hY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HcGZf3udNRbFj18sWML/ml30bVDsMnw4B8x/A5ZdJ96HdKng7Scwoc7o+RRCJ+rdY9W/1rbGP6/FaH5RPlcg2WzPmiVkJtGPBVTXiFFIuLbrIEgeyrI18dzUUhPDUQLn88P7u1QxvXuBzAnf7uCYkME6ZgeET4CTZRTMHLDm2hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DcoRn792; arc=fail smtp.client-ip=40.107.42.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JG04rZ6AQbGgbL9gAtIKWtfVt2I8skffQbtIOnjPuSwFNkoJIdAF7p1gTcODvDVQ+5ERakXS5KMiMW4hz0oy2Ydun4GwmZm/CH770yJnGpsZeuz+eilc3KAl92HU5c7qskAvGjQ7kzn07+wLuffNn484P4haT8/1Y0Gr2KAC0jHvWDpbI1G/vtuNBAGaZ0dxoHynU8EblAlQ5wFAYNEny0dE2qeA5w/02Ts4qa1CQaY4SKqGAEQ6pOJ6I3caJszLU5xMU/qEVfe99oKeqSfIBGKSSUtN4mxIoVbq5OznzvNSD1RfFcmBEEPSI+O3i0uO98QkZxKAUwIIMgxfBRklsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrUjWiMEI4aZkacpGKI2qz8Ceq5vdLU0YmoiF06f5sE=;
 b=Q26gL7AsyPeRLuPm7Y14o8wJ1HqrZYRU6a7XublEC1bbR8g6gVXU4BjY2tUEbw9THha+26LVtfuQcjdWxlgZbYBwASyXKEMANBTvVExjMw5fcQw54AzRNBkVsWu2eERiC/w8fRsWSkEkZ3hD8mEt0ZMu/zlscEqC5MkBM1TkBplPrLWUYVyDN1PIeST0xBEQ7/5Ov1pwBnaeqbHs92qo3IDpFN9sw/YplGaR5dUX2QrZNKqntfiUd6BGEPKy7yGlU6jc8tqLGN6cIZhBYInNlkuYzInoWJfiOSj8hIunzpaY1y/23qLiFeHNAKiTDRFIkdGJCuzNIctRqu3tsOW59w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrUjWiMEI4aZkacpGKI2qz8Ceq5vdLU0YmoiF06f5sE=;
 b=DcoRn792ewjPRTdgaVF9pEFRZ1oxAKoM1jF3znvy0mTsLH3bNubyPwPEcJG2ww3FgW21CiEJ8i569H2u6U9MhAm2Axo8i1IPg/RDI2Np5vzPNVAnbcz9j1Gt/ysYSSYzikaZ2BALq1R2Y1Lp3xTG3mAyyEceexq9NABHtGYDnCE=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB1441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 02:06:30 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:06:30 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Brandon Brnich <b-brnich@ti.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
CC: Darren Etheridge <detheridge@ti.com>
Subject: RE: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource
 Leak
Thread-Topic: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource
 Leak
Thread-Index: AQHcWZv5HY0m0b5oXkC/wiLrCDfHdLUNqwqA
Date: Tue, 2 Dec 2025 02:06:30 +0000
Message-ID:
 <SLXP216MB1148CE2E7ABF4280D6C27B44EDD8A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20251119213152.1442329-1-b-brnich@ti.com>
In-Reply-To: <20251119213152.1442329-1-b-brnich@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE2P216MB1441:EE_
x-ms-office365-filtering-correlation-id: f03dea2f-36ea-406c-95df-08de314768ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fsKwRVH0ke+7xtjLToRZi/xfTvKvTaYJ6XulIpYxM1jHOCSxGf9P+xlALTyx?=
 =?us-ascii?Q?a+o2i6paCvcgsGC/Yvg9eoEzTqp7egFhWiVCKN0Xgmm/Nug29IQ5Z/sOGSaj?=
 =?us-ascii?Q?QM5F66FmTq51ef6k0TybzgMYRYUYgVllZ/O1aSkz7lDB1dRY6GAyZPWA5how?=
 =?us-ascii?Q?wU0a41fsx7Vt6wsBfc2mzm1PZG6aOUI3GbdPJCW0XDGZZGxtFnDTEnZGLWWN?=
 =?us-ascii?Q?0zvN3/hSY1xKM/xzUDqTLy7O2n1hA/WQVx1f5YILC8p/zOS0pKThRFkrJR49?=
 =?us-ascii?Q?Iu+iTHq2tfr957zXK20LcdN1AGOCHPqOcraPbwrM5U19yKuZ+iJ7iuwhS7p7?=
 =?us-ascii?Q?NKV9UstruvPQ929fay016q8wte9VPKjm6XBQ//7F/9qovJGHExQpaKsYMEBa?=
 =?us-ascii?Q?X5c+AJLVChT0DF+PTE9N5ir25rgof5i7KC4saLwmYsH9ga4bHKjDQoYCOVSj?=
 =?us-ascii?Q?2AaeSzlRfuVBvuvAe5D7hTDGUrRxOJiIf4g0LGciO4px8oN2xhF1hfO1gSzH?=
 =?us-ascii?Q?XfaakkZBTT4GEej2ds/OtJtUV/Ci74yurHHxiUSF4grdFdepIORxwEjXbtoU?=
 =?us-ascii?Q?xFB9B30MiJf9A7z3gsMOOrzP19gkkOE44KCGD9jx7ZGD3BHbmeTblKog8wX2?=
 =?us-ascii?Q?yGMVnq0ygXclB1cCMQJeGUsq1+z7cEXQyc+Zoa7UyXaw7sP+Twtkk0+GhQ8K?=
 =?us-ascii?Q?x1G+57fggo7VbN6zvFrIH+e6gDOzUqd0DssvdUw5CcYFfkJZ0Vn8osUJi5bA?=
 =?us-ascii?Q?+Rep+TBe9dbF7Wsl32wZQH3Dv/bP4l2kIfa0DPGlqs/PNjor1+PLqoSWapUW?=
 =?us-ascii?Q?f8foQJdtX8vSg91SPiOZhp5xWV5aya/sEj9Uff8czs4q9mGjDRj5ZHaRvMZd?=
 =?us-ascii?Q?FNq87qAnvQnQV4zMyK9d4EUq6S/mf01JzRajKFb7cqAT0dwwULKv8oOHbTei?=
 =?us-ascii?Q?KtiLiCuXujjeof/BragvEqALyHtd9vDwtZjDPY3UN2OxD7Flb22om527oYgo?=
 =?us-ascii?Q?H01vCDktfoTlD3u6WG+vhRGTPl+785MdYUbHfFDrzV07FdUmaEFe1vpW3Nlv?=
 =?us-ascii?Q?yxUosUfs3XCxKFQnXoJO6SdDEvk4Ax8wMh1pYcFs3sYKqlWEo+rBiLw+08Qf?=
 =?us-ascii?Q?06f9H8QjWEStnGxXROFWSKKlB8RQoEhsFt/Qye+y3HTb7xJUzqHtkeRFAN/4?=
 =?us-ascii?Q?GVFHOYrRgGlPrVHp83d3Smjg9fUKVAOHpeX9F3mXC8IVxUAKtYdO4On0Rob3?=
 =?us-ascii?Q?KBNhtmQjn68A1EE4J2+daAoHA2W9L3nc6H4fFW78hX28bNBMNTn6AyBToGcP?=
 =?us-ascii?Q?pIAr2E6e0/Hv/g5sGmPEzdn/xkmScfgf3VCn7BObkq8cF4G9unZ6uW7ah5M8?=
 =?us-ascii?Q?M7PpgGNa+J+tihvnan9CtfBHzkToxtNQD4sjSUe6/HqIxt/NuAp0vqo0j7Wq?=
 =?us-ascii?Q?8rXY+zKdierNGh3+U3E8RXs8Z1P/kezOen4+aY9u/gtaW6eZ90i1k8+pfUTE?=
 =?us-ascii?Q?TYGzKrsAp5QEWJ/VQpQWxuIL/rOJDY7RwyGp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8LkaXPyOyWmBiuC+XZLgaXMPStintbkT+LYhjRc1rBVvRjmPq22xvxfJJuB1?=
 =?us-ascii?Q?0fI9hk1nVtw2KkFfwWqGj/cjJzblOcG/nA0VatPxdM6waThLxINk9khjX+NA?=
 =?us-ascii?Q?72HdAh2NMKc3q49+jpy2Q3sQZr5IZ6wg61fNOkzaNjVrxedguB/r9S/5zWuI?=
 =?us-ascii?Q?5AqL6oPbZM3zqUq0f3n8pB9gPrDED4jOsTN4xBnAgMP0N8pvIaGxi1UX18lQ?=
 =?us-ascii?Q?TcoIqqpZgzc7SjNMs2VTdIbAByjpmDosPPnfx41TN3aVCv40yMR+i7o1UwHX?=
 =?us-ascii?Q?RnvCkyZswTevFroF2KMFgDuCb1o5A35w/nebv3s1XJNxCvzyIe/r90OXKkgD?=
 =?us-ascii?Q?hv8lnBGZJ6wWQr9ax/yfob0grMtd/x+don/sUgPmwEkjK7c7vc8L/x8ZLPZ/?=
 =?us-ascii?Q?dkcFmW0A3yuDcj5pOpmO+tUJtRjjfdFI+6yXVaN+kpR14yH6y63hGhMQWO8x?=
 =?us-ascii?Q?3BP+TzHfDZTiYtt8ihbtMJbO4BQRzepbk4GPHFpaLAa4o3hjxNzu4On0O7Jx?=
 =?us-ascii?Q?6kEiGOFj7O+Nc81sCbw53cu+1GKogQ9qQAVNR428GzWkXJ5DA8u5DiuRTcuy?=
 =?us-ascii?Q?gTm0nFFPNlfFRYx1seztntvnSVL7XRTIKnTxDjnTsMSYeaJYd+J4tig1xQXO?=
 =?us-ascii?Q?yxqXOtiZmMoaMSeQc8ON1NZh03i2Z3BY0rywx9QIj0yxabZZrOarVp/+bJ41?=
 =?us-ascii?Q?lEKmkqTjcr3hH4fBf374/WrH6ViyHN6KofcrIFAgeoK11+zTiWxVqFWhi2cK?=
 =?us-ascii?Q?mRgige5+s1ROOAzqcx9cQTTAh/5cK9JZQT35Occ0fRhMm2WhuI1WwLng2/Hg?=
 =?us-ascii?Q?BqoVC7Ocma9bj4FatP15qUIltTg5xAQ47CKzpToGx6s+5KYEN5onLwcpHWn8?=
 =?us-ascii?Q?CYb4xBAUdO2sR5i7fhb7xUJxEKQ6c2tZOfAdPkAWfCQBwGu+TbQMSfq9cp0y?=
 =?us-ascii?Q?T5h/7pSoix+2mm1jD+O3V29fweYxNOluQpIez2kqNF9YC/QLLePcOpK35+LQ?=
 =?us-ascii?Q?JRgEmevGqx1mPrbcU8CyX887uEo44fZF+lGy4WKYhumlpVyJdL6j0tuXV1bL?=
 =?us-ascii?Q?YQbu0voaL0adI63xF+iD2IJhJ+ZpW3YZhbyELaMatz94u5r666MvcJHHpgLj?=
 =?us-ascii?Q?DE3DdnGPeCQYdqzdo1Zd4YLx2mYZ3+hjq/i1bSAyX6TJWfdHwmKAB6pSf/dI?=
 =?us-ascii?Q?EYWD3Oyq2waGFXqAMrqUYnAm6Zmlsb5BMb0X4PKQIsmtzY+QtxrkvnLRxf4/?=
 =?us-ascii?Q?lJhpmBf085t6jRuFiKKaZBuKOnjxucn0hFaDq3pepNzv3fdN36jnPDcAEkT/?=
 =?us-ascii?Q?dClsGLMa6iQRQpVMGW4mBAJqWghhoQp5yFhGJy9q9WcDI8YTVtDiqPQxAr+U?=
 =?us-ascii?Q?rQUKgVTCfojpQZzuj7TwxI8g3fNM1NY57Bi4aIpVz+DO5O1GrvfXEI2cGZd/?=
 =?us-ascii?Q?yXr1hVetB/tyk2j9obDEqwKwFmNzB8WvhvLMXP9rijaLet6IWVUfRipZuoP5?=
 =?us-ascii?Q?WP0xJ2UjoewItd/WoZkcQPx8qZ9NxpRPN1FNPotJtmt560wwlLhwv3FidrS4?=
 =?us-ascii?Q?BCto0jPwZfZAWRS5FV0hrb2LkIiIA4Rlv1tvFGMv08fhFD+Be9KFnsmDDS0N?=
 =?us-ascii?Q?CA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f03dea2f-36ea-406c-95df-08de314768ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 02:06:30.1588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KH2QIOfhoDRZXmVAxCYtAJqXeN9TMJET+OLTzBaE7ozMdl1OBWWxmQ9mO+CUjHrVaZ2RmfkwikrrkUtmXta5KYRPRqH1zWMGVl1OHQCe9YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1441

Hi Brandon


> -----Original Message-----
> From: Brandon Brnich <b-brnich@ti.com>
> Sent: Thursday, November 20, 2025 6:32 AM
> To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
> <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kernel.org>=
;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Nicolas
> Dufresne <nicolas.dufresne@collabora.com>
> Cc: Darren Etheridge <detheridge@ti.com>; Brandon Brnich <b-brnich@ti.com=
>
> Subject: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource
> Leak
>=20
> After kthread creation during probe sequence, a handful of other failures
> could occur. If this were to happen, the kthread is never explicitly
> deleted which results in a resource leak. Add explicit cleanup of this
> resource.
>=20
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>=20
> I am aware that all the dev attributes would be freed since it is
> allocated using the devm_* framework. But I did not believe that this
> framework would recursively free the thread and stop the timer. These
> would just be dangling resources unable to get killed unless deliberately
> removed in the probe function.
>=20
>  drivers/media/platform/chips-media/wave5/wave5-vpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> index e1715d3f43b0..f027b4ac775a 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
> @@ -339,6 +339,11 @@ static int wave5_vpu_probe(struct platform_device
> *pdev)
>  	v4l2_device_unregister(&dev->v4l2_dev);
>  err_vdi_release:
>  	wave5_vdi_release(&pdev->dev);
> +
> +	if (dev->irq < 0) {
> +		kthread_destroy_worker(dev->worker);
> +		hrtimer_cancel(&dev->hrtimer);
> +	}

I'd like to change the above to as below.
I think we have to distinguish failure between registering IRQ handler and =
registering v4l2_device_register.

err_irq_release:
	if (dev->irq < 0) {
		kthread_destroy_worker(dev->worker);
		hrtimer_cancel(&dev->hrtimer);
	}
err_vdi_release:

thanks
Jackson


>  err_clk_dis:
>  	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
>  err_reset_assert:
> --
> 2.34.1


