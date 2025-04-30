Return-Path: <linux-media+bounces-31419-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD0AA47B1
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80BC64A5747
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2280423A994;
	Wed, 30 Apr 2025 09:54:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020120.outbound.protection.outlook.com [52.101.227.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43293238145;
	Wed, 30 Apr 2025 09:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006848; cv=fail; b=gMnOhKMPsxADXZKHIv4q6hcumEOtr2jzVP3mEknyBgnmEumB8qHXzXlRpEIRPO+61sXkHYyw7thv8XUIb7Ht86OXHv7i7XZcfg+EbAC+/eKr38ozWrjV5jzoOujRR12p6dlXRB1mDVLJbCyEQQ6XARe3bxGBT1Varnh++97UtEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006848; c=relaxed/simple;
	bh=2VbiFoeV4AIXwsIT0vvcYQ3DFUqLaLCxVxVyqAWRfi8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RVPiFDosTAJPs0AieHS5H6L7wRQW5gaMcXaWcGzElIU+t6dg9UCP/XU36m6eunexmxlxfvkGGawCxnmpewra3igt+1CedfDiqOwznhkQ/85PDAPlZxyoiBCc+pZd/SKkBV05WzNfATmlE+EtSNdarvUiwGC8iazsMphaf/ITXwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZcVKtMFeg7yTnKal+z7mASFOMF2PC/6WChzoVWhj0xiV8DiZmgvx7yIvRYtVG96Fh+2yrgupBbR8b1CtW9vXFaWT6Uak1ZS/Cf8OXZgKwSQbKmVUJ4aDguzPSn70y/dhKeu8u3WUi2TYp+A/S64iJGNEyea+5oevv4yjfwug/OPgM0ndbw9qh9PABQgxkmy2TPJo44nVomvn1Mc61t7qJ8Qqubpj1h6O8sI/hfnw4b6lN+HNZY48FqSnV2dM1KbkIxY9qlz4g7TP9iXHJ+fl5BlLNQBHIPz0ypTvNtD8TinLiudjWfRT+mJswm8e0LBtNQMwvX04+1LuJZVhABChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2qH7r/66hq7CkmEm67no2rlWRtj+gCZWiGMJrRyo/0=;
 b=e9O8PrIBPf29eEBwHfq0b1YsXlmky+C0BFljJrafbfNaXC27XGiUztneAWt4hGSPhmNTJVHLB8sZeOFPt0pqV2qIc08rS6tYzAkkQVDW4xaazerndEICFM/3kni0bFtn/WjUXPIcbGgIYbDFgCRsywOvQ7If0ZWs4vmu1Yy8mAaue58nhkrokdXK7c4LYXNezExx5FgwmntJ5qq3ZQbV5aqNgOaqJJWAry/9Wve8gSc88Zrb246uBCPPAjQn51HvQ716LtgUVkwkKcAORwBRaMPeCKaygUBZdEMwRmvzz5+al1pUXAFL7nB+QzTSTFd/niQMXnPCFWwP6uU9kLbEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0917.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:176::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 09:54:03 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 09:54:03 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>, Jai Luthra
	<jai.luthra@ideasonboard.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Shravan Chippa
	<Shravan.Chippa@microchip.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 0/3] media: i2c: Fix some uninitialized return values
Thread-Topic: [PATCH 0/3] media: i2c: Fix some uninitialized return values
Thread-Index: AQHbuam3609pgF2cAkiyNDiRZSzOCLO79xvE
Date: Wed, 30 Apr 2025 09:54:03 +0000
Message-ID:
 <PN3P287MB18293419D4F8EE72BD2E141C8B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1746001540.git.dan.carpenter@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0917:EE_
x-ms-office365-filtering-correlation-id: 632ff4f9-d8c0-4786-12b6-08dd87ccf098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8O2Wa80pwSbn4egWfKdrGW6pfh3WLgywu8yqxJFivLhaPH91mR4/CgHjCS?=
 =?iso-8859-1?Q?DchaLMaznQEVJ/kG5z6TuiVWq0uVqYiFFvOAW5mcn0s1pH8M+R3quIFCdq?=
 =?iso-8859-1?Q?swyYuUpcnIroYmpbIjqiUKzmg60Xw+AjZDcKkPdpKymGe1Nfzl8OAaCaCV?=
 =?iso-8859-1?Q?q+nLeYmSkWLL04ioeq0ofsxyuXTN9tGbScMCKVSTrrHbNC3l99WIYMaODP?=
 =?iso-8859-1?Q?VxqLSXtjwlD0SkzffK8AM/kFKJK43j39U1BHNnHL57G+0DKgQTvmTYVpMF?=
 =?iso-8859-1?Q?U5joDJQiybkO2acjmQIp+HNl8t5HpWZgWavagHmj8MbuB7lpXOZxhwcZrS?=
 =?iso-8859-1?Q?9b7YoBYtiKDmlR6JvpaL28RpnoQCr4obPlKKsKQDA/1rslGGNj8z3C4xb+?=
 =?iso-8859-1?Q?ZVd3qSsIr6iphdXexlCHWYQ51p1MKh0+OKxmh6Ms8qmJXy0fbsjrhXleL1?=
 =?iso-8859-1?Q?q95cTMW8dJPs8HV3pKt9TUk2BRcrJFeDshFUb7xUkoJ6UvdKSEJEo2Y3b9?=
 =?iso-8859-1?Q?VOati/nPR6Abs2DBL5AymjKIoKscovbQhCu6kazdGNLdYfzxKK2uSnd/rN?=
 =?iso-8859-1?Q?Nm+/54OzuuRdHHSQP2ArJPDPkMSMyznlkBNOpg7B5tIN2j0sWy/Z/0fkSj?=
 =?iso-8859-1?Q?/4XCXdSo5xLnzL3lB5kf3UsY7AC/6lwcsV3VCJ4jYr7VDBGNA8E6tPPWHy?=
 =?iso-8859-1?Q?JSKaALDh/SkQ5rNwovnB8oZ/+ru8nJ+fnzdTaIP4KfWpRtNmhK8IOVatdZ?=
 =?iso-8859-1?Q?byNPU0KUBiKCkDo9URCQPr1m2fGLhPrUJEIe6OkH9agEMPcbnjn7h06yLj?=
 =?iso-8859-1?Q?SJnJCSFohRaKt4mLU44InLEvxZKoJSm337SBudEZZMrN3y5ppB1U5H8bh2?=
 =?iso-8859-1?Q?NK04sIh1dRNaSwvRVFEHkMnSBCsov/f3E8xZdHBtoAvuJZJlmj2361N9bE?=
 =?iso-8859-1?Q?RvL+WAqNeV7Rsnce5BPOO7D1W/SoBPpM12PIwRyoh1UrZPwGLbFRtUicn7?=
 =?iso-8859-1?Q?5769KQBxccP7MNf+4AbADtm83T0yZ7PfgPCIZQmfxy2quK+zhZFIopOGMb?=
 =?iso-8859-1?Q?m1q1iC+eiWEyBEk8vQkZc9oFd9TCqMKgIB5SKufTNqvHeNdqGnVuoVcSBW?=
 =?iso-8859-1?Q?sSzAdlhHDdfJJ2C4D3Fl7KG8zvqkuLX2hA/L2HGSzvHpB5zIxi99oFE7cm?=
 =?iso-8859-1?Q?rT2H6qgTuZPuEB+6jmLMAzocjqQietP/cxxl/7Sb+/6z5HMl/HPJWfi3hU?=
 =?iso-8859-1?Q?+i3Mz+x1tr5eLnPCWRde60432tQyS+gSpd9tskT3TUhfi6hK3l/ITlUTaI?=
 =?iso-8859-1?Q?E/vl0kfNd9Ki5k0kef334Peg00v+Zk31kG4GERAqsXfWpNEVieKjNDZ7N7?=
 =?iso-8859-1?Q?dBszhLiyewUZ3s3cghuNASyUifXlYVTUaTOJfqD6iFMK092+rAX2GLSUBj?=
 =?iso-8859-1?Q?I7IqdNKxNfSs3G6cd8BbYqzMKMyrFC4mmqHvVg7KH18rwMvMEfY8kUjKxW?=
 =?iso-8859-1?Q?1SoVh9W7nHnXrNoY5SL3oOJXzSFgbrAbg1sWydbvX8Gw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KID0TFR+SmmT+eL/jaqCm/dFMjF2dWdybdej18sOCOe9vLINpiUvhLz4Ch?=
 =?iso-8859-1?Q?kPXI1gfSiqxAsnqeJ1uQM7cGSBG0EC4OewjGETij3tfQ4kxmtgOhSWPxxW?=
 =?iso-8859-1?Q?5Oz3C72rEPYKzp8tafvvjOQ4D3qsw88nz7EOKmKQxsfy1QmOrxenW69+2I?=
 =?iso-8859-1?Q?2xFxGOlHgDs+sIWJtMWUxTsimXn1bQPG1ygkRr6ZSaOaY8GfLRczq4Ij4w?=
 =?iso-8859-1?Q?t6bGTvvbNXwmtJTvT67ScHuzgqhVbtWflfs5A7saQaI/gMPq5Kr6/Yqcgf?=
 =?iso-8859-1?Q?/cQ0soUh+ItF8eyomQ/r/Gxh4PErIGh1SBrI0paGOrYGHTTtotkmyT9H3a?=
 =?iso-8859-1?Q?VeZQd2unwwyQToTfyhIhMpWzapFFz+U4bho07AUK+EBRd8ynJwAn6x6Of8?=
 =?iso-8859-1?Q?Fv8R5yCb1Hs5eUN9fo61zeav8Bz3jzKLttoFfO0kEwcq1H8ImNN16xSvzg?=
 =?iso-8859-1?Q?yXgij5YV6pRg0s91Dk+tQdqAvmyR95raNJbrssnBVAqLTywZwrvmbSKO5e?=
 =?iso-8859-1?Q?HDZzhZmzOZaUn1zgU45vHjH2f8hk3j1hDiQVnaqdN7InF27qc7c31K+cNO?=
 =?iso-8859-1?Q?pX6PRsTj20UvDPkhNC26DS8wbjefXTcLpsi17PDnhBMqFANoFADT3Jg+ap?=
 =?iso-8859-1?Q?W8pdZGWm0/DxEAKfsDKUsWW0KS5wWJg17iSqahwk75jNhks5T36cWTHNMv?=
 =?iso-8859-1?Q?JQNeFqdu/2PfIAdcnE9389nkjwdqJuTwdWJKPnPzo03N1kcEQg6wilQKoW?=
 =?iso-8859-1?Q?eSCKNJXwpmgwKfLfzXE4AwmQKd6ZGjETeoD5ciA9eSeCcUa1ZS9tNVCD18?=
 =?iso-8859-1?Q?hx55XaooH3ZvzWDqMBFdRYRUrtk12K3ATlaSCMGmpETlKUVC7uquBfYIfK?=
 =?iso-8859-1?Q?S/FLWETQ/AJKOLLFHfHKwDaT4JAB03Maw10Zubiu9ABN4VTYRxDP6sLYk/?=
 =?iso-8859-1?Q?0RiaBH3UAXgJZeJTS0qESJLzgoXFpVHg5VCJ9bXTBBYv+tWoeqwqSwIE+j?=
 =?iso-8859-1?Q?A6lPdpMPhZlPP4lN7pjvPf32ZfHfvDKoybm3PLH37jtKEGn5JycgDaNqzP?=
 =?iso-8859-1?Q?k0AVb4qNes+UrFWIzrtnqHEnOKtLk9RVg34ylusxfh4d8m79c7Mfm+pLr6?=
 =?iso-8859-1?Q?uLkyNP99YFx+XbR2xnOQfhsUXolxmCxuWQp2FERCIH05OaE9liiqXiYPiZ?=
 =?iso-8859-1?Q?hxaL+gy+Kp0XFI+Pdxrd2SW1p0Bf6vOqL2EQNqwWLOOeP0p66Z7YjzTGTf?=
 =?iso-8859-1?Q?UQcDbg7lwe+V0HTYERvUZgmCi+q2K0/tcWXUlDv0lekJZ4sH1MjphlAUDn?=
 =?iso-8859-1?Q?RnM0HtiRDnPYmCo5mUrMYLMTD/QEWTxv5DamFZFJjL+yvwMaRzLAo9GMeP?=
 =?iso-8859-1?Q?xOS8dAmh3JK9315a2FqgH8Mt6Aw3p2ZDnOxaD0SWYuHWWdRFcVOhdD4X6/?=
 =?iso-8859-1?Q?llTKpSl20NUwV5jGd8uS8RwV70G78IJffnACQBnLB34Shs3rvSBNVosaHb?=
 =?iso-8859-1?Q?aPyn87ZcO4V2hOiKizR10ci4ox4VoEUQNxtOMPaKFkMnrKZ3nXzqDmdaWc?=
 =?iso-8859-1?Q?U7Po4DaYxgHQuE4XhY/pnZnhlinFQ4i7kE+OODLkKhpRHzO2H6nsAESpxt?=
 =?iso-8859-1?Q?MrnNcJqUuT3hnLq6yz0SyfLlO/fwLvy+/SGtV9y0JCcClnSaA6kfk8Xg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 632ff4f9-d8c0-4786-12b6-08dd87ccf098
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 09:54:03.5479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: //nCra/suHiAME+RxSx4u2GU8f1vQkC2Mw1Stqd2ExTunAUBZtWINOJAzbOhvitfUdK+QeWwhiGh+XzjnImvAYxWscImjN6klrosEnjB/Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0917

Hi Dan,=0A=
=0A=
> These were a couple uninitialized variable bugs detected by Smatch.=0A=
>=0A=
> Dan Carpenter (3):=0A=
> =A0 media: i2c: imx334: uninitialized variable in imx334_update_exp_gain(=
)=0A=
> =A0 media: i2c: ds90ub960: Fix uninitialized variable in=0A=
> =A0 =A0 ub960_serializer_temp_ramp()=0A=
> =A0 media: i2c: ds90ub960: Fix uninitialized variable in=0A=
> =A0 =A0 ub960_rxport_bc_ser_config()=0A=
=0A=
Regarding patches 2/3 and 3/3, I believe these are also similar cases.=0A=
=0A=
Best Regards,=0A=
Tarang   =0A=
=0A=
> =A0drivers/media/i2c/ds90ub960.c | 4 ++--=0A=
> =A0drivers/media/i2c/imx334.c =A0 =A0| 3 ++-=0A=
> =A02 files changed, 4 insertions(+), 3 deletions(-)=0A=
>=0A=
> -- =A0 =A0=0A=
> 2.47.2=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0=A0=0A=

