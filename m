Return-Path: <linux-media+bounces-37099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A01C3AFC991
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1A41BC3FB0
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 11:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD7B2D97AA;
	Tue,  8 Jul 2025 11:28:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021106.outbound.protection.outlook.com [40.107.51.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D490F1C6FEC;
	Tue,  8 Jul 2025 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751974121; cv=fail; b=E799lA8qHxyI7dWqvgPOqlMKDuoCLMTaqhcd3rMjXiWCo/tRs+RiG4h9GNgb4J5rhuJQrc6k5ZnDfNjurnLXX5ex6ONWIsJEQpdGgq2+yo/jdjUMgZoJ5wCxEhQm8RC3oCKg07pIqY5OkkV0IFDyQfN46KlhfPXYQjz9tEF9LEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751974121; c=relaxed/simple;
	bh=O4zHele0GtLAOpM26qBwcrTLEWiB8wZbN6Xpb3bnhJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bC7VedzrZaauoRjAqTPH6H0Je0Ab3hAKstdErustioSMkL50wllh6inyFXHJkCqgePcfdBOjJtvyqiUq7/F00fcshHZpznt07lS3jN2YR8tirPxsR4F5LYoVp4P/sq/Dpx+V5LhFa2l7wMy4nkkwaY2yYt9CBArFMl9rfROjDlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKcWH35yAn7H0VR2IT44txS543/1/ZWbMNgys8QSsS7RwZecrNI63CaSPIaAyRIeSt+KHovLxaUNgmV3HLK7E3I+k/6APHQY3GvQRRtu+mL0fhiR51ls5oh0WLqSc3sAUFBVZKi+ZEo/2e4ri6qV5g5oERZl2DsKSd/48B+vxM8FM3ctZGko9cus7vsOBYfAExQ4Nwf6GpGRvLpF066+9NlMycMmPdmWtlZnh9CpYKiHO851m66McSEy7Jd4nrCyGUWSSqHuktu99lfKQD4dEFIlTmDQQXhWtC25MRrTSLXv3nEkUv7H1Fjoh7YbHbEYnJkE83mWUIsvkpI3Qf2+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=377/OBExlDNyMqtXLLDlor0+YmG8K/dsHsox2K/wKeE=;
 b=qwS7C1cPmkTH1qasukO1ndjdbBiM3fTPOIUkJaPGa7ObxUV97lcQ7QcVtGZYYmTXJFLrzC7rNQGK53YfnHu+gqPv7DY7kjo+ywMgkmZEXoeAnTo3iQtv1mbkAVO9TpflBPf51JFy9iYH9J8znVN9yPcreuTcL1bDbfUPVNvwTPTh/b4YmYYr6dAWNB46KYlhiPfHxylzdFJ+Ycj3tKr7z1+QjLpgQbHe0murt+SvkMXEOGfl/A6LrPx76PnTo9X7qmZfqc+aVvRAuCPp/LwarGA/AwRLPUimE4UGd8qd25MGrPWsqCZOHlyqVjdfpoICcTGNfGUJT15PIyLSV1tfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB1681.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 11:28:31 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 11:28:30 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Hans de Goede
	<hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, Heimir Thor
 Sverrisson <heimir.sverrisson@gmail.com>, Matthias Fend
	<matthias.fend@emfend.at>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, Arnd
 Bergmann <arnd@arndb.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHb7/Lbhm2ANFrrHkeTdayzLntl/7QoCjqAgAAMQ0A=
Date: Tue, 8 Jul 2025 11:28:30 +0000
Message-ID:
 <PN3P287MB35199F4D8EA9F384660A337DFF4EA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250708102604.29261-1-hardevsinh.palaniya@siliconsignals.io>
 <20250708102604.29261-3-hardevsinh.palaniya@siliconsignals.io>
 <ca6d8433-6ce7-46a9-8c16-11845f87402b@kernel.org>
In-Reply-To: <ca6d8433-6ce7-46a9-8c16-11845f87402b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN2P287MB1681:EE_
x-ms-office365-filtering-correlation-id: 424123ac-7e86-48cb-2278-08ddbe129101
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dskH8UkLebs41xG1VjglRBOx9yuK37LqUuIPcklP85Mu/3ytdFo9erlNXl?=
 =?iso-8859-1?Q?0Q8wNwuFRf2+hlnW3Gr6CTIaoSdTnBV4ANc4+s2sYiYgcHxrefqSevZakW?=
 =?iso-8859-1?Q?hjVhGtGMlU7uIzgZa95pi4XnZTHvjig4osdfEKCEvuT/nb1gZwYhp+SDUC?=
 =?iso-8859-1?Q?5PFF+WXMMRYCUg1gJht7Fmjm7fuED9x9QyvtPQGmE8MXkCZAtJh3Men6nh?=
 =?iso-8859-1?Q?3c4dkNsMHqpWDsv6kzuG16K4iFYRME3uhH5sKTN0cBSTIk3CfIns+FWqEh?=
 =?iso-8859-1?Q?mnQQjwvPjmHDM7LZzKtncX3I5sGXv95CJjJ9rX8wmwebv7J6mQN4G2vHQ3?=
 =?iso-8859-1?Q?8t++d5hCZd720O+I749yAMHbWBtsNNK1HSc8BMxnr5RWNI9PgMhXbqN96R?=
 =?iso-8859-1?Q?oBSiGWTlOXe0ePPdq+jWMFPgT4BBy1YFWBJSOaK6QnGXMkEENGQmaGIuhS?=
 =?iso-8859-1?Q?SrMTxdr/UOX5eSnuxanmspvDwmzcuhdwQXMnDPZ1x+GahmkdmFcg7NeQI3?=
 =?iso-8859-1?Q?Z4bBNsapLxhkeiCesX7eyVvaSqYqGZIi1DKuRwrPCM5U+witosjrPdIDxV?=
 =?iso-8859-1?Q?d0tyDA2Je1bzupP5vXRgan3mUwbl0N9rqSUVxnsaMsRmRIjl7AW4j/quzs?=
 =?iso-8859-1?Q?GN9K5ctXF0TH9WOzqc6+RWSLuUw66qL20z9VYpJz/sKczZ+UGQmkFF1tEf?=
 =?iso-8859-1?Q?Sh0k9vacLDb4UQEPQ/tg4xCKF5id27SdN9qh6YTI4fnYbozCDzLeIf0C0m?=
 =?iso-8859-1?Q?FNWr2duK1/PA8OuAbVdFsi4bei7sVbTvfkEBGTn+I88P5FryStoX0C2GIa?=
 =?iso-8859-1?Q?0fHJRY1+yaZK4XCHwrKcl5Sh9Ofjk75ybCX1vfqGUeAytKSetlBCP2fgav?=
 =?iso-8859-1?Q?jTcN3CzriLnKIzgIgsF5dgbOIR2XaPNGLRm62XPw9lVKfOnHxFAzuB4wah?=
 =?iso-8859-1?Q?rSqbzcByUKVYSiIQfy5GbBPTYDMiSdCpuhJ8D4sq6jQr+QRLWuD8FpKyU2?=
 =?iso-8859-1?Q?k56Sa6L1WKm8Rl9yk8mtspPTNSIpMxtrXMb5rIrKrCaUY8P/CtdTwCcG93?=
 =?iso-8859-1?Q?UECnz8TF+0CvYHZXLTv3eGnC7p6BfjCPpD8/sYVQTrBtCH72UnPgpiKAh/?=
 =?iso-8859-1?Q?vUTxshPNdwOoJFtNZJEIXOBwz4Vbcdm0TBrOoreOvQoW3aslkOSonWDyq3?=
 =?iso-8859-1?Q?1YtSDevx7njyIHcWBkxI9tjRE9AKGpQG/Q0urg28lCYmmx/XIMOCYZzEla?=
 =?iso-8859-1?Q?OfMVzAdPcWXVZ7aHUB2v/WQYAOTVfhiYTMQ10EzWl1UJCa0pdB7TnIzN66?=
 =?iso-8859-1?Q?u24hUdNYbRXmjcJJRMulvMDX4dwVxr3Nl2nLoS7QVaJLN6F1cJcUvV8cNZ?=
 =?iso-8859-1?Q?YBSJ4gNpg16aqA4XmdODjPXRnhyx6g106QKMREuMh5IKrdNZC02BnvbbeW?=
 =?iso-8859-1?Q?WyINcexfCy44NvKbfCBElz1tDuZVyP/MHd1FwLGKz63rDSwzF4zHgAQZZa?=
 =?iso-8859-1?Q?9Kk1NFTtbztJAg9c/kk2usGhRjhvptRFSCnowXGnWNPg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?boL3O5aT/TWK9ATjJb8h7Y5LBiwLw11oWr+nCV+DfChLWCQGTx5fc67v0e?=
 =?iso-8859-1?Q?V8T+rb/xX/uX1hu9grejNeN6f9zzj/leWZX1Ae3MWGH1ctNGGk+XF1iA5p?=
 =?iso-8859-1?Q?u7VPpGqxolAzf0u3J/YC3ADy5w/IOYQjBBrdprEroySrMoMfPLrI8oaC8C?=
 =?iso-8859-1?Q?/lHSexp9+n9iklI5+igK0p+PK0Idx7oESXe6zFRd+NmnfmWZ1jT/BD1Olk?=
 =?iso-8859-1?Q?18DMowjnfuGKXoUU0f+V6FlLbzzqZoYRtAbStPqeFFoK4IOs0EQ/+2+QI2?=
 =?iso-8859-1?Q?GSqoFGk6+K7Bf7ODahywtyMlCptxEzuteTgSDFoZ2ceP6L1D+CmCzyV9+Y?=
 =?iso-8859-1?Q?yX09NRYUCkuD8Tl0Niq2eU8DjZGgq66hWaYX2n46sL6NF7clbT8M5ihJDX?=
 =?iso-8859-1?Q?c8jlyKPxIU5tcu3D9vRJZypUnL9o+7KLy5rHBHEL+DwH7LV7VwwE+lOqYy?=
 =?iso-8859-1?Q?G9pNzFavdgOvrYFIRBAEnqA73rrguDzFNtlvbkZMh7BznjxuzwCSkYbE0q?=
 =?iso-8859-1?Q?iGmTASpK/MdhXIx2KnvPZVGt6hpmd2LDRi6OVuz81531QoHmY9OKG3qcN9?=
 =?iso-8859-1?Q?Wr3fvPcDlDcrpEEsrik8NoW99YdW3Sb0IX2n3e37dl9w+hzruTs1IjhFSr?=
 =?iso-8859-1?Q?3v78T59fWzX75dkPRB+bVa2isfxeANW2VD4/2TeBmw2i/z4eaKVYjXNALw?=
 =?iso-8859-1?Q?aKH2BXKd0f0QiXOPL789NWkbdwniZmD4Lkuq9Am873hCKmb+InX41vxJtf?=
 =?iso-8859-1?Q?IqCpaud6qe5CpIRo3WrqALdQ32oKqnoZ+9yObfqirjXRvUd+Y0YJUK4iDc?=
 =?iso-8859-1?Q?jGqt92TNefKoMDxgL/PCA80H+dpCg8yqdVqxbEW/N+6rwgpbCP3QgblrO+?=
 =?iso-8859-1?Q?VIzVOgqK5XGWu23HM1RaEGAYvukghMUdJLZNntqMv8mXUmj/btOVqcG6uD?=
 =?iso-8859-1?Q?B25vl+paLEOh+DpLmXrjk4+nd4cVEABSgzw2l+pziU2EJp52EZCyFOfLLG?=
 =?iso-8859-1?Q?YJYzZ8iP/pcks9Pm4rUsJerwWgjWxM2xvVreRKfI2yM2ITGst88NtLrWZf?=
 =?iso-8859-1?Q?2FQds2ajrLmSm71fSd2q+szVrMOJjV2eTKhBnDM/BENMc3ichvXXcJxShY?=
 =?iso-8859-1?Q?qlFCVIwud3Z2VfcTS6AC5Auk6LjWBOQL+1OwhxpuYzWRKX9PQRqkJO+bIv?=
 =?iso-8859-1?Q?pa1AXrvwKt+B+ATbv3hGqLdhaV7yKgTpTTopMSx5HcHoGWLgl886h2jm8Q?=
 =?iso-8859-1?Q?2xhzr4Q3WGKfgw0vUN4aZkcZWhAoPJ1RnqM+5OPxjUXm+yP5wyp0GTK0L/?=
 =?iso-8859-1?Q?VNX3mJfy5pQZC51TDL1MAVYIlDrs7c2ARU4ANakOIfgGUG7VP4HkOA5Jh7?=
 =?iso-8859-1?Q?JvRMj3gzuG9NBIL5XpSos5irE8BulDxpWi9gGzkY15JdAMTHIohh8kMKfw?=
 =?iso-8859-1?Q?OTLGrcThE6F8pmAquHMn7k4BEv5L3f2AK3OAahH1hX0TC7c4TQwsSB6hU7?=
 =?iso-8859-1?Q?X84pSe6ge7GHH+FC07af+hY132bMEXy6MbLoVY7KFeDyr6LHM5LFkSnzPh?=
 =?iso-8859-1?Q?Ygvn0+21nQ1gkgtETluIz0oC5Zcs5sryASFL2Terup3h0+6ikqeBBXnhB7?=
 =?iso-8859-1?Q?sBJuR09zUsMw9CtZioRE/EHhFUfxotOdp/yo4ZxeFR3d/AMrpJPhjXzg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 424123ac-7e86-48cb-2278-08ddbe129101
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 11:28:30.7679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: olX53JboqqqT/JIBY0VlJTmzJUX6+bu1x1KDixlJJtL6I31SeeiDVFfM8X+F4FyofQIp0F4tDIXokkf2i7xp0kFcqpvn7140CXOdP2ja1Zisx4gLQzj8l+L1FiONpbAY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1681

> On 08/07/2025 12:25, Hardevsinh Palaniya wrote:=0A=
> > +=0A=
> > +static const struct v4l2_subdev_ops ov2735_subdev_ops =3D {=0A=
> > +     .video =3D &ov2735_video_ops,=0A=
> > +     .pad =3D &ov2735_pad_ops,=0A=
> > +};=0A=
> > +=0A=
> > +static const struct v4l2_subdev_internal_ops ov2735_internal_ops =3D {=
=0A=
> > +     .init_state =3D ov2735_init_state,=0A=
> > +};=0A=
> > +=0A=
> > +static int ov2735_power_on(struct device *dev)=0A=
> > +{=0A=
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> > +     struct ov2735 *ov2735 =3D to_ov2735(sd);=0A=
> > +     unsigned long delay_us;=0A=
> > +     int ret;=0A=
> > +=0A=
> > +     gpiod_set_value_cansleep(ov2735->pwdn_gpio, 0);=0A=
> =0A=
> So you power up here...=0A=
> =0A=
> > +     fsleep(3000);=0A=
> > +=0A=
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_name),=0A=
> > +                                 ov2735->supplies);=0A=
> > +     if (ret) {=0A=
> > +             dev_err(ov2735->dev, "failed to enable regulators\n");=0A=
> > +             return ret;=0A=
> > +     }=0A=
> > +=0A=
> > +     gpiod_set_value_cansleep(ov2735->pwdn_gpio, 1);=0A=
> =0A=
> And here you power down your device. This makes no sense... unless this=
=0A=
> is not a power down GPIO.=0A=
 =0A=
In Datasheet =0A=
Power-up sequence:=0A=
=0A=
	  |--------------------------------------=0A=
avdd  ----|=0A=
	   <-t1->=0A=
		|--------------------------------=0A=
dovdd  ---------|=0A=
		  <-T2->=0A=
			|--------------------------=0A=
dvdd  ------------------|=0A=
			 <-T3->=0A=
          |---------------------|=0A=
pwdn -----|			|-------------------=0A=
				  <-T4->=0A=
					|-------------=0A=
rst ------------------------------------| =0A=
=0A=
Best Regards,=0A=
Hardev=

