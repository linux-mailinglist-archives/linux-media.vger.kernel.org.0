Return-Path: <linux-media+bounces-49647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B70CE7216
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 15:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B272300C294
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFA532A3D8;
	Mon, 29 Dec 2025 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="bf0H6b1Z"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020093.outbound.protection.outlook.com [52.101.227.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552C3329E66;
	Mon, 29 Dec 2025 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019972; cv=fail; b=CS/VR6cc6WRBi6ngclxxYkXO8emQhx1DeyhUjnIijaZfjx9/9kF25YsLfiO+qaE2OkqGkDJc6BMEGZhuL7hOxajVKOWUIv+oVGFCsBHTNI3vP4EfVYxlIm2mE1IofUCpjH9JLlGDl+qsf04AeTOybtPxQBWqV/GYj6nMDrUGvI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019972; c=relaxed/simple;
	bh=I3fmtUTtCKB3OXL2VelLbjAxQubwQ6CTftNzDl21h7c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GZ6SkUk4ZFQsTbi4RJK4ED+b2aFz8eq3tZ/awWA78TWx2SVgjVq7qG2QPu2m8ZyaXv7R3pQPhBVdDk/CCtPpF/TK3+a52Cxio6zmqrgxz9hYJ2ifHLHZbT1U8+fOP4DeHdKhSLZb8kU6/cIUyPCE6r2i5pxJAizNtXFEIu0Sikg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=bf0H6b1Z; arc=fail smtp.client-ip=52.101.227.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O90E3zKp3AA97QKvm2BKo5/8wXy+dZAlEupaKMlWOCUyCfMM2zsh6P0v3eVY1VpjChfcc2ojFh5CVG6RHI3z+N8xIh4o3+g4Ay9lkAEOk1JIZaBSdElKgBcMxb/h7p0ll1P/BHqp1LjANGQaK7yyJ+jjZl/J/YIcnoBhHpeOLhp97bexBb3brob5Hl4jpIPbK3YPBY6mO7MP12oKsKss1kiQA4713DBNt2RcJpYnGQ27yun86yHIvcZwPTs8eH4bbK6Wr7UQLYM+8uwQNZZvm7ZFcAIxktCnd3QyTwtE6MAO15VDg7+IAWBih/vmsnGxVQK4FGgwQOLBA/dWvwSpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3fmtUTtCKB3OXL2VelLbjAxQubwQ6CTftNzDl21h7c=;
 b=kuC+o2TMpY5R6AibLwRsElCjh0X6Vin4BsVkOR14rWMiPdE+aU9cbd8Sy97nZGQQcmJVkpIlMpAoVCGqSs3IKdFx6zSObDUSwxiO4PDR5/zxdOS97fsVPUxWGGUagtBB+iP7X20eOSosa9F6ZiOoYOkOSPfOMWYZA7RrUyuWcRSAYOxIHnVWqn/9U7pSzctF34LtiSSx8P3CZdXKh+QhjtVdb29T/2M4tWzquoKHxaSltSN6ZKyXmYzqFhN/SN9qa3wo2KQOI92iWZI6e42fA2v4VerjrPtO/xWeFjoUnrx8ZENK3xsKPNFeRSssK5yKCDwIU+itJLyXOAmukyRpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3fmtUTtCKB3OXL2VelLbjAxQubwQ6CTftNzDl21h7c=;
 b=bf0H6b1ZVWDAbPnAhh2cIHIHff872Hzplpf1qGQUYZravCB0FHBlDmnh00XjMCvGwSnG6k3UbQDga58BZ8psCqDji2L74kIe71/U7tyfWhMbH0SkkZpm/m0GdFvWcLegAuAHIzSoDLwsMsBBrzMfsk7eSTJsl/fRnVneANorpxvVY0TR48szLiaaq4BdgYlS9T8MoWH9O5eiW/ck0HJTIbnNKLSbnGH2NoYYtCQo/a3EDa3ivpu+FBfb9sLup8cgoxNegDs1KJZkEluaQMynJp77wYnweQuTHAa7UaqWQdDvN9w2DrMheEbbPip1kVorfwjMHQaJqogku8J4yIv1vw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4020.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:27d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:52:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:52:45 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Xiaolei Wang <xiaolei.wang@windriver.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "johannes.goede@oss.qualcomm.com"
	<johannes.goede@oss.qualcomm.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
Thread-Topic: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register
 access helpers
Thread-Index: AQHceGtVPBdG+t2I+kKz5/UzjeME2LU4r5fk
Date: Mon, 29 Dec 2025 14:52:45 +0000
Message-ID:
 <PN3P287MB18298EF36CFD5CECF6D266528BBFA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-2-xiaolei.wang@windriver.com>
In-Reply-To: <20251229023018.2933405-2-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNXP287MB4020:EE_
x-ms-office365-filtering-correlation-id: 12e8efe1-cf6e-4e84-c777-08de46e9ed18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?kZEnDS6u84JDgcKxnvnufdMt3ntHAijXnXW8Lpnf2xyLeBDYVT8naBY8r+?=
 =?iso-8859-1?Q?p2P/Ktxz6MLWszYOLNJ3Wy8DBpidDuKuFbupgtDfZTPLh6yOzG77lIXZnz?=
 =?iso-8859-1?Q?nqeg2wehmoKPOe1qEvBiHBMXNsGDx7LoNl+40y0xBb10SnsxAE8q+IBL/X?=
 =?iso-8859-1?Q?ALbcCMRDYgwqtY73ZhJj1YNPVhskKPynbqnV6BsfzDlXsbqbIH038X/5+h?=
 =?iso-8859-1?Q?tLthPChNYSsEY6Tj+nz6IIr8a81AlCfj59Yx0PayK7zBqFMn2ydRpR10XF?=
 =?iso-8859-1?Q?jzv8IhUb9uv9CnY9rO+QljuIWvuWAnSx12i/C0d46XfULJpdTZuB9npwwT?=
 =?iso-8859-1?Q?Geev92ATxL+7Ibt5Uk5ZR6su0PVkiUk7y0nWrYigvHrh4Y9LPJDj6qg6IS?=
 =?iso-8859-1?Q?BUld/7Gh8kqrgGwMZOwasgg+lDWxB/rehG8asZbFE4CxDae8LYcbmbLAnB?=
 =?iso-8859-1?Q?Kqko/Ef/p16uFf5CN0m6QrFdqFFE+MaK8SFlvtWCZbrZx03XxE63AF3KpO?=
 =?iso-8859-1?Q?2rEfXw0OtPERf0XUQjq9sjQC/nw9iEojJRj9CGuznPsJj8mKeNORR/jEft?=
 =?iso-8859-1?Q?H4dA9kG3MwJHyhOeZspGtEWOyDes7X5jCaS74G+l1DN4SdWuii+Ud54vdN?=
 =?iso-8859-1?Q?QxCSZi3PBlQABpRgyRCvbLnRjAKhe55412HNKcqL2tT31KGhxfsF3cDfxH?=
 =?iso-8859-1?Q?B7AmYzmfHqkmt57wIh0J8Ou5bB5rU9u1T58IgG/BYgxZWvBVpxYbgeTtOf?=
 =?iso-8859-1?Q?dkealwQw3IzjK44F8oX46hF7T/YFWYpvUyl43X9p2nLI3xDsJQn9F68+dy?=
 =?iso-8859-1?Q?yFjvmH6gSSVYQf1C57JR92M9EmR3z7UdlmhfAUKOqw6xPMfoPGtX3zx94N?=
 =?iso-8859-1?Q?A4sr2FQYZOz+2/o3kDt5/nN4IGy5qk7ufONDfUYLL43YrFpxtz+MYkBfUv?=
 =?iso-8859-1?Q?y1pMw9gXvybRem9dla2uv9zOM/TRmnIMnBUnisSsWn8m6A6evYgZaTiwys?=
 =?iso-8859-1?Q?3D1m3tfUiLzNrI4QE02EUBqQw+tfGiP5alevYiclrMc2ZgG+rnuBGQ7tZl?=
 =?iso-8859-1?Q?Gh3zi1rS1D8Afet426jcUiMXwkqMrFLf5B8CwzkawkothdmT6VR1jCT3kJ?=
 =?iso-8859-1?Q?/Q2y1AeT2vMC5QE6XaJPV60fZNkgMSQmSSaZAjf4xPU6snKlnh0Ac9qn1f?=
 =?iso-8859-1?Q?Ul8nvhWTit60ueWj88CiGj3RlITQNa4EQ9Xm50lbCHxeqsw/nqqechlqYB?=
 =?iso-8859-1?Q?xGSx3m+bJDVItNGEIVpfvurWdcqDgt89lkN6YdDU0eJKGoWRCnFBxXmTeZ?=
 =?iso-8859-1?Q?iMBmAPEoAYpQPLRMy/A93YKsjp9OwpBLV1GMpC8877jjc9yz76nfOhzeQo?=
 =?iso-8859-1?Q?IMVJ/AzFSFlyZqheQOwKhjF6GR4g66fk88/6wMmQBJ5x8ceD9Fd8dOQARf?=
 =?iso-8859-1?Q?mHA9M/YzzUwRJ6AzyFntaZ0j0XAPyEG8ZlEaPeAlKVHCbvXEfiiY5T/2zC?=
 =?iso-8859-1?Q?F+9llJGqyXu8oXTprhaHrZFoz9+IGrGiiA05KWZg0ZkB8Mpg9ZGbWQ6k6+?=
 =?iso-8859-1?Q?x3ggxF31X8Hs4/mQesPCeh2Cf5cRZmpo9X21XyzKP8AM4c99Ag=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dMIzUm74g346xVCmMUqEcHUTki0/FkRsa4FU8mL/xbM2qrAbsDstu9n0Od?=
 =?iso-8859-1?Q?Zo1HYmlXlccSx+fExPT8C5ENlerEykwUux3kXONDHnuvjUlnPks0tK8yeS?=
 =?iso-8859-1?Q?y5nXrNAl/kFEBYHj9dY/rqnweqGlPCK84YOvdp70dKHKUuDqGfBN7OTVfG?=
 =?iso-8859-1?Q?wT2nugFvDB65BMr4Oz//DjtwPw00SnTtBluLBMfjuVvtfnufOa2C6uDVmj?=
 =?iso-8859-1?Q?cbI9O1yNVIzh6lT+5rkj1NWOUc/h+njPaAMZmAP/IjEAp/hhAVTKzG6wGs?=
 =?iso-8859-1?Q?QoflVFOOq4/Gq73QXzsO11C0tCOHsG08W+l2b+rkoImM8EYC9aX8WEuwdm?=
 =?iso-8859-1?Q?DL88asNVto9jh7Flr6eVkbCwueB2sKZ/z/bIgGPvXPVz80IyNmn59xiGq+?=
 =?iso-8859-1?Q?/new0SrIlJUhDcRkASad6vI04vIzHMU39h1on5B6wCQ3ZjKb5v+mZ1I1GH?=
 =?iso-8859-1?Q?/7PxY1QZ1NPYLA9kJeR4YpO57JSYCChbXPftWZjZKR2zPDFhcKKJRWsaDm?=
 =?iso-8859-1?Q?Dmmhmt58NCGVGuHkblyuqCiI9aAxBZUBmSQMjVauZKTlqoHlRx8gU8BvG1?=
 =?iso-8859-1?Q?H5k0q8jOogYqwSjoxUbVb7WNUx+cPkoabVoaz9eVotYM7eyoeNPvEkFIQ7?=
 =?iso-8859-1?Q?5U0b0RLggaUbYay9BZzwC+6K2BEg0sibe5rFyzDr7cxYdjFt9aVxMFP1Mc?=
 =?iso-8859-1?Q?gZvuYmriEdhnOXBwDDy88tRrKSItMbdl9GdeCZwi2k2oNchrsQ8fAYUT03?=
 =?iso-8859-1?Q?06HV9XE4AWrrT2mMUil+KpI1ew2WsXYdd7uYB6unLztuVLvl6MPWZNnD8l?=
 =?iso-8859-1?Q?0gKnJopUTB2TPZOk8V3lQ6ujB9wl4X82XfItQvgiHkBOMbnc6gpQLjCrlZ?=
 =?iso-8859-1?Q?QWY3B6Ac+0JE7eGwv2cOP0GEmEGo12CzeDpztugJN6vTe/35/vY+EeQ8+p?=
 =?iso-8859-1?Q?MJe1G0ERYFYU8R5PfkEpX0usUHOTmEff2SDUtAf3Rm5vKWEsFtq9s3Ex2O?=
 =?iso-8859-1?Q?RALp+WtmoU1Dse6z/smWKbDYTdO4mzTPC6HIl9BDfrel7LOYzLXln0iOT1?=
 =?iso-8859-1?Q?DrpbVwEXHzBjAMG5ikKp2UU5hDVmaCm+lZpCTS/eDDYKe6JcifMtmvlrse?=
 =?iso-8859-1?Q?PrQIy5hKj7SZn5mVHXLG4ykzsM09w04BRuGQQKKKAypBTfYkMbgmXXYD0C?=
 =?iso-8859-1?Q?lHmgIcI9m76h6b+rUq6FE6+FXMuN9n2eRWxcbIEHo+GEPHxrGs3kCVmnt2?=
 =?iso-8859-1?Q?iMXSeqNPiDCPjP4qsEuCt7Uqr+tSNIM4jxDFU3CC9NXE/gMSBCEwTzkCPN?=
 =?iso-8859-1?Q?j9U5m4aWbrwiDy5LeXlfindSeYLI6VfhQnvzkr2owdGk3xpjnJJNjoutBP?=
 =?iso-8859-1?Q?7DQAE4EK/riDYGKqpTY4cPGh131/dcL56h3DTGFOl/dQOHEl/xKWCSH476?=
 =?iso-8859-1?Q?LG1mLxB8tBKDlKZb9guSYUcc1DNGSqxPom8QuAiWn4c7+NjXqxXLqeyRxe?=
 =?iso-8859-1?Q?3GpSPOCjIPVysnS5QjpcX2eAnJsqb1RvihaNYb0CLDhTzAMifHYh6P9xJA?=
 =?iso-8859-1?Q?DemDCGKQS9RZ1ToZu1409hEgCOhCt4JFOVGCI6sHWIgDNhFS4sP81wVGF4?=
 =?iso-8859-1?Q?7g/1T8Tyrkk4yfzDH+cTEruiOUw8CVItMPSzTNuVuHRaYtnC0xJh/7+zPG?=
 =?iso-8859-1?Q?RnH5dK7Y2Z7wUyFJQe1fuzEzodV6sWukOxe7mDRyR2iMlTTR5qS/bINOd5?=
 =?iso-8859-1?Q?vBylqubTTsIdZvZl/jhe4k3BBCFjQd2Yh0MmG+P8cgdBDs4Jt0TlQkRUrd?=
 =?iso-8859-1?Q?jGZG86zRtg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e8efe1-cf6e-4e84-c777-08de46e9ed18
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2025 14:52:45.2120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkSiSFdB5x7gEJlcc5pZQk2V3Oaj0romfNujMb3GlAbZRZtIQzRMSZ2yeFUDMkLPSK1DSo0s5rt0DvvG+G/O3DoilKw6rc9aOKVJC4VADvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4020

> =A0static int ov5647_set_mode(struct v4l2_subdev *sd)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(s=
d);=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct ov5647 *sensor =3D to_sensor(sd);=0A=
> -=A0=A0=A0=A0=A0=A0 u8 resetval, rdval;=0A=
> +=A0=A0=A0=A0=A0=A0 u64 resetval, rdval;=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D ov5647_read(sd, OV5647_SW_STANDBY, &rdval);=
=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(sensor->regmap, OV5647_SW_STANDBY, &=
rdval, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D ov5647_write_array(sd, sensor->mode->reg_list=
,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 sensor->mode->num_regs);=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_multi_reg_write(sensor->regmap, sensor->m=
ode->reg_list,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 sensor->mode->num_regs, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "writ=
e sensor default regs error\n");=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> @@ -706,13 +624,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D ov5647_read(sd, OV5647_SW_STANDBY, &resetval)=
;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(sensor->regmap, OV5647_SW_STANDBY, &=
resetval, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
=0A=
Are both read operations in ov5647_set_mode() really needed?=0A=
=0A=
Every mode table already ends with writing 0x0100 =3D> 0x01.=0A=
=0A=
Does anyone know the purpose of these reads, or are they unused?=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (!(resetval & 0x01)) {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "Devi=
ce was in SW standby");=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ov5647_write(sd, OV56=
47_SW_STANDBY, 0x01);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(sensor->reg=
map, OV5647_SW_STANDBY, 0x01, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret=
urn ret;=0A=
> =A0=A0=A0=A0=A0=A0=A0 }=

