Return-Path: <linux-media+bounces-41328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1733FB3B924
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 12:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 391891BA4342
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D7030ACE1;
	Fri, 29 Aug 2025 10:44:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020115.outbound.protection.outlook.com [52.101.227.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBAE1A0BD0;
	Fri, 29 Aug 2025 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464299; cv=fail; b=V/dKfC+1dmillYqtRQlWOWvcd1pCoAI+mMMGyet7+n385EKaBN/nSaSgf33Tz4R0Bs+cPG2vI3xo9o6T5y5nNn9EdbE45zBjcSd5GxNsa3efEUqaK7zczb1jqy98eSO2bpsv+9MRFUOqXnO+3ITHBRndaAQWylO2y3L22aKhX1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464299; c=relaxed/simple;
	bh=G5neloyMDNAMvMrgV8D3RAZoLp1kUka0g2ywzssNEwM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jgjghU9Ht3oMjVqN9c8mX41uT6BoTISz8yzZ98kZPTwuCB3qmJifwniORoxiHwWQq5ThzVk59TbRzpZHBifkfSR7Emt2VQGWqLopNp6HX+0QOjQ6NWbwR4r9wlnlTaHRVAFSf7jEOQIwm5KP8y+SWXU0n4sRmRqH5gUcRio/GXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5mfU2Uxu+AGCI8VQqf8oJ48R7zhtAs6U/LviZ1dor+SrqGmwfBpKKLnAz2HHgA789HJDtoMr/W+9seRFjyqqtfygPDS08usiT9xOeF29/MWdSYz2+PQu3JVpljwIwNwuix4OCEM0pZx0BwnKPd9eoSn/1uToqL81eoW4w7N96bLjyQK/Mxf8lKmeuFtSF1iun/CXboTZ5iaA34aO9M6uON2ju8GM5ye/G6MEeGuW57AA9QpvVQ9+0em4TACZLbVrxRFtFWmmu+J0aL/APQCSW4rdJ18N7cVCUQTeG2qPoJqs2c1/dtMqfamv4UAfEmPeR/RHuwRuO3ieGoBqwFapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=useqExhPEuKi3qjL2MlN4QeYHo+RdHGaiqGK+v8zpk0=;
 b=pdeMRInYCa1mgxpxmmuhfBuraVaGiMWsvdXc+O/OCKmSWspBYKHkU/dngHqUet6kuW4vi/HtSIIkgB64HJ072NHVbttJ5/PR/rBPACMsYFJOD1LAJwC+90pRq0uGq6XVphsrdBbRVuEr44ZPRAav8vr8UVpjwiqFDXnLUpFH9nb6WyeU1B4Cy6hPmuVc8MA/qWUP+64oZ/u7RRlOF0f6fq17BYzNRaa+tCGoWdLRu6rKzFEmBJ4PCmR/u7vi54gNSNtcTLpBaRbEPY5E6un29UwGg8pyUzObVUtv0GZ0q2SQbGOfcZY2WPDalecea6HpLCcuIbrzXyZKsYGOk/OifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN3P287MB1799.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 10:44:53 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 10:44:52 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Silicon-Signals <siliconsignalsforgit@gmail.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Hans de Goede
	<hansg@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain
 Petinot <sylvain.petinot@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Matthias Fend <matthias.fend@emfend.at>,
	Dongcheng Yan <dongcheng.yan@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Jingjing
 Xiong <jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 0/2] media: i2c: Add ov2735 camera sensor driver
Thread-Topic: [PATCH v9 0/2] media: i2c: Add ov2735 camera sensor driver
Thread-Index: AQHcGMTDl1gJ9FEZA0i6mStswZ/a97R5bc+AgAAEU/c=
Date: Fri, 29 Aug 2025 10:44:52 +0000
Message-ID:
 <PN3P287MB35197CD7CCF22F941F19F684FF3AA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
 <aLGA0zbWz_th4tzC@kekkonen.localdomain>
In-Reply-To: <aLGA0zbWz_th4tzC@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN3P287MB1799:EE_
x-ms-office365-filtering-correlation-id: 1db37351-6693-47c4-8234-08dde6e91618
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HnWuii+3tnDZPFstDojBF2yCeZs8hbr7TTohz8BjsnQjgES12P9PiLFvzY?=
 =?iso-8859-1?Q?AynvYQoUJTNWfxySENB9QsZP4mt+bSOnyjpylMlBb0BeZG4ZOiLYRxLQG+?=
 =?iso-8859-1?Q?T/3K+f2m/XL2LrWxwfhE5e+Ccft9vEXZfVW042VF3m2b1tpxWXQ2IERil5?=
 =?iso-8859-1?Q?zQs29IGqvHZsqq04lELS0X6tKscVYRgppe1Iz1MP1zOUAXfMcccbsPAIEQ?=
 =?iso-8859-1?Q?iWVZDj6Ide80GqRAlvF3rkS735h28p54YlQtMTjjVeu7iGCwHuDhhge7fT?=
 =?iso-8859-1?Q?tEer18//D1amiavyHwAy2KYObGKBlrgKbOqo4d4x9mqoIqCZeAwWo6aJH4?=
 =?iso-8859-1?Q?iEroHiYMbppYd/DQOcwT2j3uv+kaG6XV2ff7N0y36ZyF9OAm0StCe+Zion?=
 =?iso-8859-1?Q?HAMKQL0cvcI6SiLSHT4nzR2bN5EHm7exT4Jqnd7xj5+EAvuZ5p4OxJuEs5?=
 =?iso-8859-1?Q?0RYg8BtmRJqSYQkFZaOCEl1+95C8Jucv7cZczPOmU+DLr00o6b1iwpk/E9?=
 =?iso-8859-1?Q?TCiexfxSpyrO0+Bq+fblwE2pQEhz0lsTfvrweHGlTLwMtnvJtqfuETP6ZM?=
 =?iso-8859-1?Q?UZfyaZrQ2iocdpGOo0iRJQBNatqbuENAiLB6Q9q8sCaz+ItfJ5QB3xqPWX?=
 =?iso-8859-1?Q?We9LGCei9ZMWUbD5KDTZBdgin+cHvgPcryJqE5yofX6rB4uOyr09/QgvV8?=
 =?iso-8859-1?Q?ELXSfUhHafioXCF2rEw9DJN72YBaADGxY+dSU5m/Tte+N0VnWKlVyn/YZj?=
 =?iso-8859-1?Q?MWwTRYcejiTVG35cROQWGZkRS5esjYX/ssy5BXkH5814Dvelz4PYs4WHky?=
 =?iso-8859-1?Q?rv7diAiVufBegfkw2mDpACWH8z9rzZvxRqJMQAh7Qu6NMsW0H177suM0Vl?=
 =?iso-8859-1?Q?uPumgdb5nR/ckvvf9hPpdEThadfDOn9YQFHA3w9/swwp5m6E37ZQFmAKtV?=
 =?iso-8859-1?Q?o42aN6rgbu43at/rnpyKhOk1/6V6hOm2BgxyssiDmUnF+T8gYpJnJi8lBZ?=
 =?iso-8859-1?Q?nKtiv4gkWR5SkeMLAVPgyMbAVmRhZwGsjt41Wrg27KxSWEA2+iLLGSYPCh?=
 =?iso-8859-1?Q?5NJEa7eUkEoV9H5PbGBxGbOvr7FkbIAAJgeK0xOA7ns0gST29982ISwqxO?=
 =?iso-8859-1?Q?PzKoJlynTHNEYbNSQiM2wlrMOqwQuYAC19ZhQGafxaIKnW1EDVsbTmxtIz?=
 =?iso-8859-1?Q?83l0tcWclmz/q6pJFscmzV2HVwc10r8lv95wbdM9l6yag6ZlBW0PsETskD?=
 =?iso-8859-1?Q?nh/7u0n+SWtQiBBY4cgP7AjYcz2pH2yHvGsY98bN37+CMhL4HjtNtbVP4Q?=
 =?iso-8859-1?Q?9T2EOc6S9LzLA0mfj31L0ZzC/oK3WhNCxUGQFK6BaDy7gle+5JhocfCUpZ?=
 =?iso-8859-1?Q?6Rn6D/Db0lpWiu9h5vgffBY5RSLAojm4gpomqQIGbMXfcJ8C8ForbUkxSE?=
 =?iso-8859-1?Q?YUA5WEHvpGXKfF6zaRu6DjmndMRL5tngVNeiNa6jCX7Wmxu4+8Le4wgoMp?=
 =?iso-8859-1?Q?aJB2k+6EGsls7iQUi/Yy4JGAuG3wFcA55X/AMcSnujMg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wGAtnQirCB4tJKv691w9Lzl4oHnjoXc2Tpv0zUuiOAjeO9jH/Lir1TAiJO?=
 =?iso-8859-1?Q?vPSaZRW0YTaYzm3FD5NbsIqbTZde6jXt5V1M+iGUKtZ++NPmxwPcj1T4+l?=
 =?iso-8859-1?Q?DyJTbZk6IrtKziNM2Wwwb/4kSalmBLIBR0p4xDr/2dXzu2Aj2giJEOIphn?=
 =?iso-8859-1?Q?Hz/JiI4LrZASVTh1YpuRJbQKyUhhYcNU4tUy59hsbyNA3q04unXfnxBdrE?=
 =?iso-8859-1?Q?Bzg/Cx1GLix6GziEJhorwKacnE4qfrO5OJ6G2k0zDRW7QzLAjgP2795Ecp?=
 =?iso-8859-1?Q?b5KT1DuhY3r8B5jiF/wT2W0NdvdR9kXEyDLHNClizFjlCqORU5FxnZbhBF?=
 =?iso-8859-1?Q?q533zf/GgeDbf+Y1BPFdtscjBt3XYs6w8EqWsQv+1r3mDwyROTrcrsYTSt?=
 =?iso-8859-1?Q?C303sQ/MXBDxEGyUlLiLI0ustcW9Na/dOLEmmAOjamUU3gfRDPOlQ/nDVq?=
 =?iso-8859-1?Q?7eqgH/ngktpj0Tlb3Wj99RmGVfx86pJsqmm4phohUFJbjoab4uLQZH803j?=
 =?iso-8859-1?Q?FuKARNK6itoXwcN/yFf8koaV6Bsvq0yz9HeTl3Kk0AYaxx3qzRBoE/BuP4?=
 =?iso-8859-1?Q?599k7XLkXXjLbdpIjK8zOZ/T4dytqE7b6c+V6E2xiQVc+cFo169+83lvO3?=
 =?iso-8859-1?Q?6FtXGey0Af260lCeEWzsjDVuWL8QAK/Wbjk44ZDyZz3THHdfMq5CQPxCT4?=
 =?iso-8859-1?Q?K2UrxfXoEvfJix8TwmBN9esHSDR/SEoER/tJBW6dR4aifOgQ71hF/WL5jf?=
 =?iso-8859-1?Q?NuJzodG6pxhWg3Io9saMwWaIJXW+iiSWfsc6NagxP9LxertLiQkdbOeN9u?=
 =?iso-8859-1?Q?FOt2nrtcskQRMs+7KQVmoFLCJT/Oj3FHcKNyJqjfqX6h7fNTsnqVVPOCZa?=
 =?iso-8859-1?Q?Oa3Q9tfqffi0D66TC/sSRK5QkwNVfBpKS0eVpRwKVDlTvsO9ZKIL23DSAr?=
 =?iso-8859-1?Q?g6gKtLJQ6PgTvXlwZr/6sqRZr2WrWl/IqqtCXPW54mPuG1mxNXpyDVRtR7?=
 =?iso-8859-1?Q?tuShXAvgTdSvIEKddaqRVxqRMl4EuUjkj/RqpN+fyWcx5B7++LlBnWMWq2?=
 =?iso-8859-1?Q?EcozX4q5az1APROJOYoXktC6m8qmTWhe+IkkFvUXY54UWmE45VoiYTKUaC?=
 =?iso-8859-1?Q?NCWuBMzRpk3wrYUJ9iPhtoE8gTNnp1vhBNoobIxv+jiZrisY23VBYl0ml8?=
 =?iso-8859-1?Q?IjVHkiJ+JhCAWdc+qwZdI+7gv5nWZ/bLbRIRKIEmgmLXq+WaqVduy/2ihd?=
 =?iso-8859-1?Q?gcdizqTwh8aaF7YTYhqWdSvo3QJ0t9d/zeXAQCG4ngiD0NKs4ZE26x+Mg1?=
 =?iso-8859-1?Q?ZgI9mUJvjo6hVnhz7DA4zVE8C1kevHQoGqQfzdG64yc6qe4SzIeLTTkDu2?=
 =?iso-8859-1?Q?O//WnF8upkZ3/INrYnUtmF6Hh8Ws2kPOQPdgfrU+w37fh8gzsQJq6piOJ3?=
 =?iso-8859-1?Q?ffJYpoPIRSd28Y0BPz4Z8UFx4dkM2gEktUVMciCMSOnf8LcMM0VkZ/QMs9?=
 =?iso-8859-1?Q?gojBJesBXWtC/20zsjbV6d5/xyATV6fhkXyAwXm3xixU4FOE0l7FDhUq9n?=
 =?iso-8859-1?Q?NH8eA9dBTLxvVZyLUkOX+w0/FBKkQUtNO9he4gekqxc2EfcUbtR4uiA4Yv?=
 =?iso-8859-1?Q?8hEqa2fRYvk5/f4ojy56ddVZ36vyg2LKMkjBatqJzCBj3jqH9dcp0Ngw?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db37351-6693-47c4-8234-08dde6e91618
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 10:44:52.8446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cemN1q7Cpj0sDPDlwKj0NnFBCTtLLiGa0z1i5BcTxdGE6Mo91gTT9eSgvv9xCOiB5v5fRMpMohW25mTgELtA309qjY67G9QjAppLbxou3xCan0yCWJD5Gw9iKOXR8CFS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1799

Hi Sakari,=0A=
=0A=
> On Fri, Aug 29, 2025 at 02:39:49PM +0530, Hardevsinh Palaniya wrote:=0A=
> > From: Silicon-Signals <siliconsignalsforgit@gmail.com>=0A=
> >=0A=
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > active array size of 1920 x 1080.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support.=0A=
> > - vblank/hblank control support.=0A=
> > - Test pattern support control.=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).=0A=
> >=0A=
> > The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model=
 a.=0A=
> >=0A=
> > v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t=0A=
> > v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22=0A=
> >=0A=
> > Compliance test for rkisp1 device /dev/video0:=0A=
> =0A=
> Could you run this on the sensor sub-device, using -u option (currently=
=0A=
> /seems to be dev/v4l-subdev3)?=0A=
=0A=
Yes I have tested=0A=
=0A=
debix@imx8mp-debix:~$ v4l2-compliance -u /dev/v4l-subdev3=0A=
v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t=0A=
v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22=0A=
=0A=
Compliance test for device /dev/v4l-subdev3:=0A=
=0A=
Driver Info:=0A=
        Driver version   : 6.14.0=0A=
        Capabilities     : 0x00000000=0A=
        Client Capabilities: 0x0000000000000002=0A=
interval-uses-which =0A=
Required ioctls:=0A=
        test VIDIOC_SUDBEV_QUERYCAP: OK=0A=
        test invalid ioctls: OK=0A=
=0A=
Allow for multiple opens:=0A=
        test second /dev/v4l-subdev3 open: OK=0A=
        test VIDIOC_SUBDEV_QUERYCAP: OK=0A=
        test for unlimited opens: OK=0A=
=0A=
Debug ioctls:=0A=
        test VIDIOC_LOG_STATUS: OK (Not Supported)=0A=
=0A=
Input ioctls:=0A=
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)=0A=
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)=0A=
        test VIDIOC_ENUMAUDIO: OK (Not Supported)=0A=
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)=0A=
        test VIDIOC_G/S_AUDIO: OK (Not Supported)=0A=
        Inputs: 0 Audio Inputs: 0 Tuners: 0=0A=
=0A=
Output ioctls:=0A=
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)=0A=
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)=0A=
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)=0A=
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)=0A=
        Outputs: 0 Audio Outputs: 0 Modulators: 0=0A=
=0A=
Input/Output configuration ioctls:=0A=
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)=0A=
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)=0A=
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)=0A=
        test VIDIOC_G/S_EDID: OK (Not Supported)=0A=
=0A=
Control ioctls:=0A=
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK=0A=
        test VIDIOC_QUERYCTRL: OK=0A=
        test VIDIOC_G/S_CTRL: OK=0A=
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK=0A=
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK=0A=
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)=0A=
        Standard Controls: 10 Private Controls: 0=0A=
=0A=
Format ioctls:=0A=
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)=
=0A=
        test VIDIOC_G/S_PARM: OK (Not Supported)=0A=
        test VIDIOC_G_FBUF: OK (Not Supported)=0A=
        test VIDIOC_G_FMT: OK (Not Supported)=0A=
        test VIDIOC_TRY_FMT: OK (Not Supported)=0A=
        test VIDIOC_S_FMT: OK (Not Supported)=0A=
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)=0A=
        test Cropping: OK (Not Supported)=0A=
        test Composing: OK (Not Supported)=0A=
        test Scaling: OK (Not Supported)=0A=
=0A=
Codec ioctls:=0A=
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)=0A=
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)=0A=
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)=0A=
=0A=
Buffer ioctls:=0A=
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)=0A=
        test CREATE_BUFS maximum buffers: OK=0A=
        test VIDIOC_REMOVE_BUFS: OK=0A=
        test VIDIOC_EXPBUF: OK (Not Supported)=0A=
        test Requests: OK (Not Supported)=0A=
        test blocking wait: OK (Not Supported)=0A=
=0A=
Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: =
0=0A=
=0A=
Best Regards,=0A=
Hardev=0A=

