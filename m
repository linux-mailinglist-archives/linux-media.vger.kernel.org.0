Return-Path: <linux-media+bounces-42479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA06B55FC6
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 11:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC9701B2803B
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 09:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71F12EA484;
	Sat, 13 Sep 2025 09:11:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020125.outbound.protection.outlook.com [52.101.225.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494E230BDF;
	Sat, 13 Sep 2025 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757754719; cv=fail; b=gD3OoaRHFJdV0eNBOTylAq/oRWAHS+I59VwpcREpItZ/33DwK9qO5JnX5slGbNuWc73kJFIAEEYFom0mgAD2fG07GswNUfH3a4fy0NbxOy8vAIsK0Q5lJ5gQein86w9SDGhp2XfR8umzcw/RjRD+67dOTALkqAe2ZL6dx3aHl84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757754719; c=relaxed/simple;
	bh=6NlWAnnexiM2OIGJTgsU2cLZj0uOgzEmRHIMc9tEiz4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pDM0k+u0hmGeoyObtzKe2tmGSGJRKUlMR4q5H0KeYbgdPiGQSyeDsproFt6atx10bqyJwNe3Ou1X9vhCFWhjUxxHXoYsEif3yOxsb2ifUvOuXiB+R/OHLIR2tfLI0TcqdTFF5JlxA9SA6nYeWB5N27jzio5OrTggNK1YkwjZXPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnZgXmrkjgH1sBAAWQXw1DPvQms86L3A/na06QZdAMm/KJEk5HrUdFrJz8m9V5pOxOV5EN3f0jjYTWTLI34uNf0U8SVJVqTjomMryrXcRThm3wZ/5ukzavUj99bbVZPazsL5FFrgBvgaM+DZlQQskSjncjQQcLHEgDp+VDPrYWJFrs4qf4Oo+PtOjLjLCByYMZJ8SAaqoA40sqdUsHPpZMnpm3GsXu1z8Xaq6Qj29/vvMnIlqFl3fOJWYqRHwuYQm+t/2d3cOhk5cCCFA+vjfnn0fN1FDnj5xtg+LnCfMRG/tW+9VHLmLoxqms2K01vz/aSLGizW39Lq5/krahfTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF1KSjC9WdaE72Ypxt4x9+tkI6CutfmnpXQ39WMRsVs=;
 b=x4AiPbGIq8sw5zz5gTln7RgsXXOnJxvPDJUxWK8xfON30CTSucLQ6xGfj7AFD8UAe73XZ79u237JJz21r1isRFbQkyb37cN84LoDvT+p/H7CL+eOjAbQDBpk3MT0tMQfpIBnl2WNypRF2f3cd84LnBK6rDqEz5LEil/8LHBRimAq7vBHixw8ZvBh4319A5XfR/Ni+Qa7uPnorOJR55sbZBNm5+AZcI5IBPDidrXJclRrMGFtdd387/NGLRVf0R0lyC7vS3kZKa5EoHN6Oj0+5nsV/+VnZw069naNUZRf93MAEpbgoUz/gxuvjyZgD1V6npkaSbzAOpreVnicihqigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0131.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 09:11:52 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 09:11:52 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de
 Goede <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Alan Stern
	<stern@rowland.harvard.edu>, Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hao Yao
	<hao.yao@intel.com>, "bsp-development.geo@leica-geosystems.com"
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH v3 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Topic: [PATCH v3 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Index: AQHcI7gdKhBm3ur8gEeLLZE98I8rULSQw4Fn
Date: Sat, 13 Sep 2025 09:11:52 +0000
Message-ID:
 <PN3P287MB18290018941BE6A227431C818B0BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250912-hm1246-v3-0-3b89f47dfa43@emfend.at>
 <20250912-hm1246-v3-2-3b89f47dfa43@emfend.at>
In-Reply-To: <20250912-hm1246-v3-2-3b89f47dfa43@emfend.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0131:EE_
x-ms-office365-filtering-correlation-id: 645260a7-2fb3-45a4-7997-08ddf2a5942d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|10070799003|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?+8JEbLvGSJm1MhIZgxEet78j5Eb5wqBUJjPxhJIv8wd7IADhiwazOo4e?=
 =?Windows-1252?Q?VRGfJa4wLhVunF+BNv/JSi+uilZAU6N7LoPrRLSreWTjEV0NEdGtrAep?=
 =?Windows-1252?Q?jBj/YWAGqaKe+bo6RBDoWknwzmoreSHVbNEYZueStYRPrNTnwg49HbDy?=
 =?Windows-1252?Q?fwc1c7c0ItyyCaVYqU5+1h6XvNRL65LGEbzVV6evM/jQ7h0xf/bJIdR4?=
 =?Windows-1252?Q?zi+D7U0XBGC8PTVtQNQDv0A8l74bGOQg7w1jrvy4CO30dUPfc6UG+Aw3?=
 =?Windows-1252?Q?Rsus3FjyHfNaamc/SfrIwRt6AhpcxPpmm+9N1y8jXi65wstKSfczShYO?=
 =?Windows-1252?Q?Fx42OxoQpk1pbBn1TAMM8aNwWu6Ol274zV1bh86Y/XcGiINYtfwPK6cS?=
 =?Windows-1252?Q?F3HYM6j4tc457VCROB/RCmgQ9BD2slW7eLEGmWQ6Y0CKEjnB0S+uwb5c?=
 =?Windows-1252?Q?37tQrOTMOkcllHM/kq2MJidzkcTEecIhV54mlIPXRZLDReJFg1Asc05g?=
 =?Windows-1252?Q?24GBUwEuLzi3Tsf/aCYDjOCNxuzAEVNXpYiBwlbJFJapWr/eROpVB65H?=
 =?Windows-1252?Q?UBV3qVDg6vvTwBpoT2wfK9nP1kFdl2Py02+meqd8lW6Yi3njla7aFNrK?=
 =?Windows-1252?Q?j3Mo7dUFgw8N8KsE0IlY8CrNtMBq4FtcsdxInIsYcY2PZYU+ivLOIFzr?=
 =?Windows-1252?Q?Fly9UgO9eQ2h0dAvBbj9PEcvZIM/R149YrAQHXYjHmW1at4H2lW6Kcp8?=
 =?Windows-1252?Q?ydLVD5GuPxD8V/rdRL1MInfqpNwlz8ni33soX0/oG+rvqaV3b3VvZOO+?=
 =?Windows-1252?Q?ZySuxGrN49o3QgiR+GD60+E4X3j2Zcyxf9DZ4iL6TtcACw++GmZWWNVd?=
 =?Windows-1252?Q?fBtmo84Cm5mJxSTseF3Al/Jw3On7XRhKEQsJgGvWL4pJFOGqQHP5v37A?=
 =?Windows-1252?Q?AQaM3a0Q2wJNADqTnWSVpbJMgd/LU5Ctbkmzd68441ZbZGjnDUAgR020?=
 =?Windows-1252?Q?blyscw5qmM6Z3jHvr5aBl/PNn+Gagh37qDSoTCkVdTV4Y6QywwFK8esH?=
 =?Windows-1252?Q?0+KkWOn1RVgxbWRBJQC7hOjKZBUh+zYs+pfZ/BlmE4GLCDlzFQ0ePFId?=
 =?Windows-1252?Q?L3FLyYizwgavHmdHoG70zp0Wy1MEI/68IogLsXih5ga6vXXPMMzYecv+?=
 =?Windows-1252?Q?xZj40wmBG3WUtb+7rS4ZrVY+91uamO0Zkz33i4lSEJAWVupymHNaT2lo?=
 =?Windows-1252?Q?tCG0sjnh7tgRYLLw4AqmLwGAdJ3HrtmyvJHGHtdfAY0r0rPJJI8/Wt12?=
 =?Windows-1252?Q?Qx9cpidqeSjJbn3WQTbMTvnkGIZ/SruzPmoYmvmhZdJXM0S5QImWyvmL?=
 =?Windows-1252?Q?ePhnTT6gYRyA6M0I0jc7aVgYcZ2e4/c5ojRxuWXpZcxyhdVYipu9oT68?=
 =?Windows-1252?Q?c3PtpthY8AVv2sATkkwUEaL8LQm5YF+9WEJnwFeAfVWEexQM8foD4/f/?=
 =?Windows-1252?Q?m1w97ljKfjNvZwgda9G9N7Eh4bS9lxg/XaZtE1STFgNqJJp3quj3AFWR?=
 =?Windows-1252?Q?ZUm4L4SGRaeDv9Wrpg/3ZkRuTtFTxxyt87CzfzAV6w3eicU8UCqOLhj6?=
 =?Windows-1252?Q?Eiw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(10070799003)(366016)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?ly2PGHjX94U0VaagnQpe8dLA07rFFBSult4GgC6fEMEhyWbOamwpiFHw?=
 =?Windows-1252?Q?VcX4FVvqNYiO04V9TANDLPadkpCfi7m5hen0Q8ln8mKyuatBDVTs3Mca?=
 =?Windows-1252?Q?eYIJnAxlAcgP4WIFsw+Iy3wwSr8YcUQ8FkJuzJo7ZVBOErTdTUF7qgE2?=
 =?Windows-1252?Q?YHEEQIHieDC/jGkXbLvilKOw+DGOLJDy4ld9a1C1zhBa2eHBFmvi4K+k?=
 =?Windows-1252?Q?JNZ9LYR5fRdilgzTplV5nRE5+JRvqrbgZZzGcKZ9xxdIJE4qZiV3onwR?=
 =?Windows-1252?Q?8cLgU+RdStekOoZHDnfHShJlc0sJLaZhkI91/moDhjx82M5cLRgzVt0r?=
 =?Windows-1252?Q?GpyLNYxcaGSE8HS0RzU30Asyw2zsmoe8pB7jzXH4FWn8kPLvhh9dRiSg?=
 =?Windows-1252?Q?1NUo18qHUgDytTvIocXS2CycjGEBNtjjqzEL9moayMcx2UStJf5FuhOy?=
 =?Windows-1252?Q?cewjfEbSzoVtmRrecekUs9QU14NZvw7degvi4YXanEJE9RLbISGwpxR7?=
 =?Windows-1252?Q?kiD2gvLFpiCaD2zCQV/xPQ+2fGHHG/jWP8uOLz5/b8cWMmb7cKdO0tXw?=
 =?Windows-1252?Q?q6EHC3CQWWbQcaMeqLMP+xL0gS4ZWdxvFv4XssMgfCd3VXW/V7b68EYF?=
 =?Windows-1252?Q?X1cqgs/LJIj/JM9lEa4jNTojo2NVID/zpTQ1x3SxDMI19yqNVBhWEsGm?=
 =?Windows-1252?Q?G00H1tvoxXkAPC+UCNredXrG3C4sun65ZmJSjIAUbwVTJhwux2ZZV3oI?=
 =?Windows-1252?Q?pYEFxrNU1L6DtyeqVJGW9Guny6lQ5ISTYZVTs0+OZV4PFZUl4cUD2BZ4?=
 =?Windows-1252?Q?IzOLh4xLagjLInBBLspJ8pdixyBg95czVFCN1T9fZprM/8BTsJ4W9dXZ?=
 =?Windows-1252?Q?PVcY5NghQb1/DEzcANqwCAO+FbzGKNkpcI/k4y180SWCT3h+T58h085+?=
 =?Windows-1252?Q?NLDFIONUiu666amkrIZQbXuBEMEKbLSGgWdqo6TCMZrxYcR7xwYdo7EY?=
 =?Windows-1252?Q?zV8Jsknlu+dTj1acEMDqnYJ72oq5uDI5U9TH3rDxKyfC3MT85er5f2cv?=
 =?Windows-1252?Q?4tsjRddIAHLFHhIqNBWRK1cic8Iho2EWc/T1hTagKXq0LOzJLWXPX9X9?=
 =?Windows-1252?Q?HXU2WULnIwity6rsSx3JUmUHUNp0uxncgSpGcw3vfsZz/kNWrdDQWKWc?=
 =?Windows-1252?Q?OmcoABk6OaOYz4HmM4nfmI5UUBSQgvv1BcYPvCwXgv5AwogYbN2CIE08?=
 =?Windows-1252?Q?V5V2gQtBXtviBz1t3Att7Ey06iqk25yL27gsdRab/QaKiJp0FmXTfttO?=
 =?Windows-1252?Q?98oBgB42uOzCEKcEjV3h3ufVsGKUxzA4lJ3J1um5fTmUXr4bi2JCDVZ/?=
 =?Windows-1252?Q?+NJDz5Z72XlcXVUaimW7HmZ44dO3FOzGt7En9p+2dLjUCSC8lcYjg7WJ?=
 =?Windows-1252?Q?XUPAEQ0JG8KnMLYV5+fFH/XtdXC9T/3K2LnoKAd7cqvJxECc64/tSOax?=
 =?Windows-1252?Q?FlzLkDHeGfmoRBZbF3L1+XEX06CQXfHn/SsnfAVZfq/B7Jus1d3oAGGh?=
 =?Windows-1252?Q?uSVJxWiUhewe+63RXiV2a/2MS7XGe1p48DA5aiuyAyi0KwbEoFQmBCF6?=
 =?Windows-1252?Q?NMzxR5piLvBdgj2Ai7ieKZMoOzbp20pNOr//hM2Da+tJ4X4skdNs2vF3?=
 =?Windows-1252?Q?AKid03o+bf9JvAW2aMQn0Fl/f202Tu5jPa/sbudLECmsG/KS5aendY7y?=
 =?Windows-1252?Q?Pxn1u/5hEAaqBSrsKJRUb/yDctwCE9nAkdXxhPg76+XfiGNf5DCydqOy?=
 =?Windows-1252?Q?Hk8QTw=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 645260a7-2fb3-45a4-7997-08ddf2a5942d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2025 09:11:52.5539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WIUdHp+y28ZPCGpYB3Mc1nYW8suJAiAV6rUS9wv0K/lrVhIvl5Xt0iOX1oLwFvusyzOB2ykjsuNiYBotQRjIJD0n3quQquKLKqGxUa2UU9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0131

Hi Matthias,=0A=
=0A=
> Add a V4L2 sub-device driver for Himax HM1246 image sensor.=0A=
>=A0=0A=
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active=
=0A=
> array size of 1296 x 976. It is programmable through an I2C interface and=
=0A=
> connected via parallel bus.=0A=
>=A0=0A=
> The sensor has an internal ISP with a complete image processing pipeline=
=0A=
> including control loops. However, this driver uses the sensor in raw mode=
=0A=
> and the entire ISP is bypassed.=0A=
>=A0=0A=
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>=0A=
> ---=0A=
> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 8 =
+=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0=A0 10 +=0A=
> =A0drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> =A0drivers/media/i2c/hm1246.c | 1427 ++++++++++++++++++++++++++++++++++++=
++++++++=0A=
> =A04 files changed, 1446 insertions(+)=0A=
>=A0=0A=
=0A=
...=0A=
=0A=
> +#define FLIP_FORMAT_INDEX(v, h) ((v ? 2 : 0) | (h ? 1 : 0))=0A=
> +=0A=
> +/* Get the format code of the mode considering current flip setting. */=
=0A=
> +static u32 hm1246_get_format_code(struct hm1246 *hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *hm1246_mode)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 return hm1246_mode->codes[FLIP_FORMAT_INDEX(hm1246->v=
flip_ctrl->val,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 hm1246->hflip_ctrl->val)];=0A=
> +}=0A=
> +=0A=
> +static const struct hm1246_mode hm1246_modes[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .codes =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(0, 0)] =3D MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(0, 1)] =3D MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(1, 0)] =3D MEDIA_BUS_FMT_SGRBG10_1X10,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(1, 1)] =3D MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
=0A=
Instead of defining four mbus codes per mode, you can keep a single=A0=0A=
global Bayer-format table and derive the active code based on the=A0=0A=
H/V flip controls. This makes the code simpler and easier to maintain.=0A=
=0A=
You can refer to the imx319 or imx219  driver for implementation.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .link_freq_index =3D 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .clocks_per_pixel =3D 1,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .top =3D 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .left =3D 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .width =3D 1296,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .height =3D 976,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hts =3D 1420,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_min =3D 990,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .reg_list =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .num_=
of_regs =3D ARRAY_SIZE(mode_1296x976_raw),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .regs=
 =3D mode_1296x976_raw,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 },=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static int hm1246_update_controls(struct hm1246 *hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 s64 pixel_rate, exposure_max, vblank, hblank;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl, mo=
de->link_freq_index);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "link_fr=
eq ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pixel_rate =3D div_u64(hm1246_link_freqs[mode->link_f=
req_index],=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mode->clocks_per_pixel);=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->pixel_rate_c=
trl, pixel_rate,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pixel_rate, 1, pixel_rate);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "pixel_r=
ate ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 vblank =3D mode->vts_min - mode->height,=0A=
=0A=
With the comma, the driver won=92t compile.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->vblank_ctrl,=
 vblank,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_VTS_MAX - mode->height, 1,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vblank);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "vblank =
ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hblank =3D mode->hts - mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->hblank_ctrl,=
 hblank, hblank, 1,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hblank);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "hblank =
ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts_min - HM1246_COARSE_INTG_M=
ARGIN;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->exposure_ctr=
l,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_MIN, exposure_ma=
x,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_STEP, exposure_m=
ax);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "exposur=
e ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_fre=
q,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 const u8 pclk_div_table[] =3D { 4, 5, 6, 7, 8, 12, 14=
, 16 };=0A=
> +=A0=A0=A0=A0=A0=A0 const u8 sysclk_div_table[] =3D { 1, 2, 3, 4 };=0A=
> +=A0=A0=A0=A0=A0=A0 const u8 post_div_table[] =3D { 1, 2, 4, 8 };=0A=
> +=A0=A0=A0=A0=A0=A0 const int sysclk_pclk_ratio =3D 3; /* Recommended val=
ue */=0A=
> +=A0=A0=A0=A0=A0=A0 u32 pclk, vco_out, best_vco_diff;=0A=
> +=A0=A0=A0=A0=A0=A0 int pclk_div_index, sysclk_div_index, post_div_index;=
=0A=
> +=A0=A0=A0=A0=A0=A0 u8 pre_div =3D 0, multiplier_h =3D 0, multiplier_l =
=3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0 bool sysclk_pclk_ratio_found =3D false;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (link_freq < HM1246_PCLK_MIN || link_freq > HM1246=
_PCLK_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /*=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * In raw mode (1 pixel per clock) the pixel clock =
is internally=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * divided by two.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> +=A0=A0=A0=A0=A0=A0 pclk =3D (2 * link_freq) / clocks_per_pixel;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Find suitable PCLK and SYSCLK dividers. */=0A=
> +=A0=A0=A0=A0=A0=A0 for (pclk_div_index =3D 0; pclk_div_index < ARRAY_SIZ=
E(pclk_div_table);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pclk_div_index++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (sysclk_div_index =3D 0;=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div_ind=
ex < ARRAY_SIZE(sysclk_div_table);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div_ind=
ex++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (s=
ysclk_div_table[sysclk_div_index] *=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio =3D=3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 pclk_div_table[pclk_div_index]) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio_found =3D true;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sysclk_pclk_ratio_found)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!sysclk_pclk_ratio_found)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Determine an appropriate post divider. */=0A=
> +=A0=A0=A0=A0=A0=A0 for (post_div_index =3D 0; post_div_index < ARRAY_SIZ=
E(post_div_table);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 post_div_index++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out =3D pclk * (pclk_div_=
table[pclk_div_index] *=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 post_div_table[post_div_index]);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (vco_out >=3D HM1246_PLL_V=
CO_MIN &&=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out <=3D HM12=
46_PLL_VCO_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0 if (post_div_index >=3D ARRAY_SIZE(post_div_table))=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Find best pre-divider and multiplier values. */=0A=
> +=A0=A0=A0=A0=A0=A0 best_vco_diff =3D U32_MAX;=0A=
> +=A0=A0=A0=A0=A0=A0 for (u32 div =3D DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_=
MAX);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 div <=3D (xclk / HM1246_PLL_INCLK_MIN)=
; div++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 multi, multi_h, multi_l, =
vco, diff;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi =3D DIV_ROUND_CLOSEST_U=
LL((u64)vco_out * div, xclk);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (multi < HM1246_PLL_MULTI_=
MIN ||=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi > HM1246_PL=
L_MULTI_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 conti=
nue;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_h =3D multi / (HM1246_P=
LL_MULTI_H_MIN *=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL_MULTI_L_MAX) +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 2;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_l =3D multi / multi_h;=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco =3D div_u64((u64)xclk * m=
ulti_h * multi_l, div);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 diff =3D abs(vco_out - vco);=
=0A=
=0A=
Here vco_out is always higher than vco??=0A=
=0A=
because vco_out & vco are u32.=0A=
=0A=
abs is for signed int so if vco is higher than vco_out abs()=A0=0A=
can misbehave on wrap.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (diff < best_vco_diff) {=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 best_=
vco_diff =3D diff;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pre_d=
iv =3D div;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi=
plier_h =3D multi_h;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi=
plier_l =3D multi_l;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!diff)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (best_vco_diff =3D=3D U32_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 *pll1 =3D HM1246_PLL1CFG_MULTIPLIER(multiplier_l - 1)=
;=0A=
> +=A0=A0=A0=A0=A0=A0 *pll2 =3D HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL2CFG_MULTIPLIER(mul=
tiplier_h - 2);=0A=
> +=A0=A0=A0=A0=A0=A0 *pll3 =3D HM1246_PLL3CFG_POST_DIV(post_div_index) |=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_SYSCLK_DIV(sys=
clk_div_index) |=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_PCLK_DIV(pclk_=
div_index);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D container_of_const(ctrl->ha=
ndler, struct hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 ctrls);=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct v4l2_mbus_framefmt *format;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 val;=0A=
> +=A0=A0=A0=A0=A0=A0 bool needs_cmu_update =3D false;=0A=
=0A=
I think you missed my last response here.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 state =3D v4l2_subdev_get_locked_active_state(&hm1246=
->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(state, 0);=0A=
> +=A0=A0=A0=A0=A0=A0 mode =3D v4l2_find_nearest_size(hm1246_modes, ARRAY_S=
IZE(hm1246_modes),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 width, height, format->width,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 format->height);=0A=
=0A=
No need for mode. In vblank you can directly use format->height.=0A=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s64 exposure_max;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max =3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 forma=
t->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_ra=
nge(hm1246->exposure_ctrl,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->exp=
osure_ctrl->minimum,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_ma=
x,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->exp=
osure_ctrl->step,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_ma=
x);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_e=
rr(hm1246->dev, "exposure ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n ret;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_active(hm1246->dev))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_EXPOSURE:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1=
246_COARSE_INTG_REG, ctrl->val,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 &ret);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1=
246_ANALOG_GLOBAL_GAIN_REG,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 ctrl->val, &ret);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D mode->height + ctrl->=
val;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1=
246_FRAME_LENGTH_LINES_REG, val,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 &ret);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_HFLIP:=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VFLIP:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->hflip_ctrl->val)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val |=
=3D HM1246_IMAGE_ORIENTATION_HFLIP;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->vflip_ctrl->val)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val |=
=3D HM1246_IMAGE_ORIENTATION_VFLIP;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1=
246_IMAGE_ORIENTATION_REG, val,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 &ret);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_TEST_PATTERN:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_test_pattern(h=
m1246, ctrl->val);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 default:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (needs_cmu_update)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1=
246_CMU_UPDATE_REG, 0, &ret);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int __maybe_unused hm1246_g_register(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_dbg_regi=
ster *reg)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 u64 val;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(hm1246->dev))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, CCI_REG8(reg->reg), =
&val, NULL);=0A=
=0A=
Many of your registers are 16-bit, so is it fine to use CCI_REG8?=0A=
I think you should use simple regmap_read.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 reg->val =3D val;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int __maybe_unused hm1246_s_register(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct v4l2_db=
g_register *reg)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(hm1246->dev))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(hm1246->regmap, CCI_REG8(reg->reg),=
 (u64)reg->val,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL)=
;=0A=
=0A=
same here.=0A=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static const struct v4l2_subdev_core_ops hm1246_core_ops =3D {=0A=
> +#ifdef CONFIG_VIDEO_ADV_DEBUG=0A=
> +=A0=A0=A0=A0=A0=A0 .g_register =3D hm1246_g_register,=0A=
> +=A0=A0=A0=A0=A0=A0 .s_register =3D hm1246_s_register,=0A=
> +#endif=0A=
> +};=0A=
=0A=
...=0A=
=0A=
> +static int hm1246_probe(struct i2c_client *client)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246 =3D devm_kzalloc(&client->dev, sizeof(*hm1246)=
, GFP_KERNEL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (!hm1246)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->dev =3D &client->dev;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_parse_fwnode(hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->regmap =3D devm_cci_regmap_init_i2c(client, 1=
6);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->regmap))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(hm1246->=
dev, PTR_ERR(hm1246->regmap),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to init CCI\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->xclk =3D devm_v4l2_sensor_clk_get(hm1246->dev=
, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->xclk))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(hm1246->=
dev, PTR_ERR(hm1246->xclk),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get xclk\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq =3D clk_get_rate(hm1246->xclk);=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->xclk_freq < HM1246_XCLK_MIN ||=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq > HM1246_XCLK_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(hm1246->dev, -E=
INVAL,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "xclk frequency out of range: %luHz\n",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 hm1246->xclk_freq);=0A=
=0A=
return dev_err_probe(...)=0A=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_get_regulators(hm1246->dev, hm1246);=
=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(hm1246->=
dev, ret,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get regulators\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->reset_gpio =3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 devm_gpiod_get_optional(hm124=
6->dev, "reset", GPIOD_OUT_HIGH);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->reset_gpio))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(hm1246->=
dev, ret,=0A=
=0A=
error code ret ??=0A=
I think it should be PTR_ERR(hm1246->reset_gpio).=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get reset GPIO\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&hm1246->sd, client, &hm1246_sub=
dev_ops);=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.internal_ops =3D &hm1246_internal_ops;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_init_controls(hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(hm1246->=
dev, ret,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to init controls\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR=
;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D media_entity_pads_init(&hm1246->sd.entity, 1,=
 &hm1246->pad);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(hm1246->dev, re=
t, "failed to init media pads\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler_fr=
ee;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.state_lock =3D hm1246->ctrls.lock;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_subdev_init_finalize(&hm1246->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(hm1246->dev, re=
t, "failed to init v4l2 subdev\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_media_entity_cleanup=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_enable(hm1246->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_set_autosuspend_delay(hm1246->dev, 1000);=
=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_use_autosuspend(hm1246->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_idle(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&hm1246->sd=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(hm1246->dev, re=
t,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "failed to register v4l2 subdev\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_subdev_cleanup;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +err_subdev_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(&hm1246->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_disable(hm1246->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_set_suspended(hm1246->dev);=0A=
> +=0A=
> +err_media_entity_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&hm1246->sd.entity);=0A=
> +=0A=
> +err_v4l2_ctrl_handler_free:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(&hm1246->ctrls);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static struct i2c_driver hm1246_i2c_driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D hm1246_of=
_match,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D pm_ptr(&hm1246_pm_ops=
),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "hm1246",=0A=
> +=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 .probe =3D hm1246_probe,=0A=
> +=A0=A0=A0=A0=A0=A0 .remove =3D hm1246_remove,=0A=
> +};=0A=
> +module_i2c_driver(hm1246_i2c_driver);=0A=
> +=0A=
> +MODULE_DESCRIPTION("Himax HM1246 camera driver");=0A=
> +MODULE_AUTHOR("Matthias Fend <matthias.fend@emfend.at>");=0A=
> +MODULE_LICENSE("GPL");=0A=
>=A0=0A=
> --=0A=
> 2.34.1=0A=
=0A=
Best Regards,=0A=
Tarang=

