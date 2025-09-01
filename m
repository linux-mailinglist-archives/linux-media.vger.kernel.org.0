Return-Path: <linux-media+bounces-41394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B34C3B3DA24
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA5317A621F
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 06:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9E4259CAC;
	Mon,  1 Sep 2025 06:44:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020079.outbound.protection.outlook.com [52.101.225.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EC618EB0;
	Mon,  1 Sep 2025 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756709093; cv=fail; b=czmoJRNgtGYl5IC/Aa8ZchaeS6I8vuc8nyLCGtHSnFIml7r0vq10BkWa5T+Vhp+WPVq8JicNmi7huei89lbUf3ux7sZIb884bagdgwcjIEX1VJNFeZIFNXp3HVDPCSGdviAUKeU+7MaNSxcMYBf+yakFyMrcllICUnQ5xyhNtxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756709093; c=relaxed/simple;
	bh=pafIvLBB7XQ+MxQfOV7Cam2UbKVW+T0jFBJYbQsNppg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oidf+W9svkq7hmXGlUhMwNrTUf4OwTzK1w+XLJwxJ157pflTMFcztRJIrS/IbnUEwKT90EqfxizFVOmIq2iwF2SrsNggqigIYgpelWVPoNXr+vdsy00u02MBWWyEw2KWiiGdAE97sGbfDK9uYUlLnH5uLD84tv0TF4xL8eq7muQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cc3tmltMBJLTb7PSu21dweROuh7UOfMG35YIDJohw/WCf2n/f/r5CR559IasN/s5YB6FpWb3bpEFvyvgbwd9ICX9CuAOlnqg4RVCTDf+kbDNUJ83W6jP+7cffPPzJkqUOh3aLk/4E1t0msNjf31E+PWT295RfmRjWbz12BBmjN5JxkEnOCCdE1TSslX8bL8ZsTwZQdsdiek+b0KppQTdVzJvYMrtgAlCGkp8+vZ2VVBc1tQLC9/8fK4YwptHANr8nF8+e1JtCJ9goPjowLvVJVwD0IKQwc+1ienmM0vHp9jrElZIgzG+E54DrDSqg+2yOcstAK8nJkhsoXI4UoQG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pafIvLBB7XQ+MxQfOV7Cam2UbKVW+T0jFBJYbQsNppg=;
 b=cdrTsvsRqF1pFfCaysm3DD22/SkmarT0IKZG+Ba6cdx03JU2rwDO6BWSXJE5+xvUrmaK1gOlSwk2VuwUhd75sl8+TkedsVzRZq0m2tiVscaO9IxKtr152Zj2+D9XX0MtC0QOMWShAGhEEhoisDymQ+2UMlzECe+q2Ur6fJipzzZ/nA/QKazjeM5yyIx0RXsJ0jSiqX8+TCsqEYbE2a4pRWP1M+NFqRMGsHAtgIxpkDQgDT9uMXn9/Ok8D881lQ9WdTRgzjSYJxBuKgB0uw/ipmsmMhxgRdZOEPXzx2c8hJrY0Wvns6QGzhBWrJfDJGxLQaFplBD3StmRDOT7jXWsAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2PPF63CA987B2.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::121) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 06:44:46 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 06:44:46 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Matthias Fend
	<matthias.fend@emfend.at>, Dongcheng Yan <dongcheng.yan@intel.com>, Sylvain
 Petinot <sylvain.petinot@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v9 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHcGMTj/Rv/OrGdGEGuAw4X2ccUPLR95bMD
Date: Mon, 1 Sep 2025 06:44:46 +0000
Message-ID:
 <PN3P287MB18298FB93EDC498572742B2A8B07A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
 <20250829090959.82966-3-hardevsinh.palaniya@siliconsignals.io>
In-Reply-To: <20250829090959.82966-3-hardevsinh.palaniya@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2PPF63CA987B2:EE_
x-ms-office365-filtering-correlation-id: 20672fb3-029b-4a6e-c3f3-08dde9230a90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?od1GN0bVkSrux7RVBa67/OOwkL3IYeRS7bkIwMW/19K9msM7fbb5n/Wlyt?=
 =?iso-8859-1?Q?DO5z5osQogoDlCI+LFahwPMEdK4gmAVTY5Vzcqg/WYpn8VRSstLGfVNdA1?=
 =?iso-8859-1?Q?6hZOWVALZKhaTdwvQA/mSRi4sJDtUfWZUMC7x35RIQXu+QmhLJ8r8uFKfx?=
 =?iso-8859-1?Q?Sy1WmoU8t/v9nYesMFRruFbJ7lIA009WQ3zQYHzcf+6ddp8OaN4ypcu+Qj?=
 =?iso-8859-1?Q?UiIoKoAqvFguZ251N/FFBMSiKm2LO0h9qFS/5OZBuZDFwAdEP4UTLrJV/A?=
 =?iso-8859-1?Q?H81Mj2BGXNc9tNPndCxa82OZ3W1wfYiHefurXLDy3kcvb6WxI+xPU8myAH?=
 =?iso-8859-1?Q?kMnEWsnAzVJf+nRW/Gx2hVmLmJd0t6trJeoJCvS5Vr9XhPjDrosZX86kea?=
 =?iso-8859-1?Q?0vEtJ+7E+KskCxA4FwvlmbKc2zJRTdbxFI2KUEQaH289A6zo4S2B+QF7yx?=
 =?iso-8859-1?Q?+nAZwbEHkFwCQDMdpZx3T9pkXTJZSo/isaf0bZrFYClesUNPNJ/LEiuxxN?=
 =?iso-8859-1?Q?Yw06GI6fybNrDw4AcYuPOHmSJAFcvWRRvF2pqCvKYHQN5dwYicAT2JbmPr?=
 =?iso-8859-1?Q?k+DcWi2+yW8NKR2ae7zVHi3otmkl35SzJUVJRlX7RImxgc4DEFdhMDq5l9?=
 =?iso-8859-1?Q?dStdLt49Q99fcwkIteZVO+dW+2FG9CfRwRI+qhpTP3gE/zGP/nTWKpqlHr?=
 =?iso-8859-1?Q?0jDNC28iJW1nsnxaKZCXz7hAc2Bn5MVbwtZ8YgoGH8ByV4OBUKzUQtJvvH?=
 =?iso-8859-1?Q?RvVa1uzOResxVucikviJw4T/giwviRH7tuPwobwrdJ4o0UEd/hfpqrvOEW?=
 =?iso-8859-1?Q?gUuJcDToCW/jdxmx92BYTQ2GFs0PTJA1k2HwpCGOjYUh5q0XzcUov27JHf?=
 =?iso-8859-1?Q?RPbo+KdGZjgrIm/NZrKz9MVoGofcWqMKzkbNSSKQJlFJCUWg+0kqC6A0Cu?=
 =?iso-8859-1?Q?bbdcsxnh36lNlGJahdKF7TbzdBZlD7ykC8WCB0OcDe7WCcIlR1FfQx6mY0?=
 =?iso-8859-1?Q?gtsbGF+nu/79ucmaoBpbjKvYXJlARWhaofpot4pLO41aBjewg03E5Ro4O7?=
 =?iso-8859-1?Q?/43mLV3B9nNIap4fGg1LfZ/4dCRmShUzfezJJze1g97VXDiIgTWMnExzJ6?=
 =?iso-8859-1?Q?t2CkET0Jv1GjoE4VTLruJyEPKgqwoztoDohKoD1y/9hwfn1e/6JyaRTT17?=
 =?iso-8859-1?Q?tAmGx/FvH3luT5yZ66zfdaxMYqGeKqPJ4eCEAROzW6nSoplfgF3VJ5Wv/x?=
 =?iso-8859-1?Q?Q2CSZJs5z+UBXydwj4bJzbcu8R2UU+JQQtIqZovpZ2XNw0QnhPy9MesMAf?=
 =?iso-8859-1?Q?GraIPpe6gyFGKEXPJeFm9jC3BecUI/FVEdycM7R+WxyFzwmKkiMBtBwJ/z?=
 =?iso-8859-1?Q?Ut3Nw8Zr4Koip4fZXHU7u0600T4YkpqUQp15XMBdhb3NnFwfw/9lPhPQhn?=
 =?iso-8859-1?Q?DaHCVdm0YFC01tPEiHpjcfWABb/emvaxsZMayaKeLN0ZVRWu5mc9kHJOwU?=
 =?iso-8859-1?Q?68Q2fVLuNFm84pRSdkG+nQWlwRnQ2G/rkhCsq2hrA9FA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rPKSHPY5g1R0DEVJshc4hJs2H406jGtvIrdZ2S6Ej+ejRjDqH0osULFBqs?=
 =?iso-8859-1?Q?jq91e59Yq28rDFZ+pDALZzJZNFIjEP82aTQ1lN+HGRGNflmkOdZLR9g4IS?=
 =?iso-8859-1?Q?KKz6xNeIriwxi6fEHe4uMYq138HxEyDW0ikoaS5XpPBtk4ha0FjAKjT7d7?=
 =?iso-8859-1?Q?tizP6cDNpeIG9aoglknClSP1aeKwgcoqiLcyAWx/eSDWtDsCu3d8wk7dbE?=
 =?iso-8859-1?Q?qUz1cC6gV22K4Y1BDoyvJVd+uuzfn7QxcNd5Im2EdndYinmAKpAH25QVDw?=
 =?iso-8859-1?Q?zdvEktNy/pcw30gsitfVDZ5QAkTOWVHmkcVXlo3n0aG1FQiIOPCoh9GbhP?=
 =?iso-8859-1?Q?Io50nzgNWjVIfnSYr+dRGA6ROXM15U9xYz2rZlvvwwcrWSs32vpZASdkzg?=
 =?iso-8859-1?Q?sbZzeSrreYkdiYhmkVu8IEGNFaiH84EBDjRnPYVrxPMC7l5dpUVtDUTlqG?=
 =?iso-8859-1?Q?7mzG0BLjOjFxpPODt5lzblPL7nN510zRqbYkyUDgX7R3824AvXcm4/AkFT?=
 =?iso-8859-1?Q?caSBEf9PsJqvdvkII7kSEBvPeV24bYuF9yuiTE04xe9LJC9QPY2hL6ZRrv?=
 =?iso-8859-1?Q?FboOuStF1lmgu6JFdko4Q8FXkPPmD8/CdjfhoMRVIK1IesEt+CKYMFoCpS?=
 =?iso-8859-1?Q?mZqh+CCD7ouhVDdSQ5YJR/iTC4WVLJ8sMTCGQM/B3rLRZm8tce8Vkz8Z5H?=
 =?iso-8859-1?Q?k/dPF524E67udXSMIz69wOiqg87AnMX5EJSV1JxfKDeUrZpR04dY1TVMjn?=
 =?iso-8859-1?Q?nxUaFOS2K9Z4U2JxzzgCcEoLLkPMOPPaHrrqlcO/PWsVP8nkHbJwzNjR1k?=
 =?iso-8859-1?Q?K+3rr7gYasDBTbsEm/NcQH9LWFFNtL7QR7kSwFl9rjMZgbrGbDkjxVvpFZ?=
 =?iso-8859-1?Q?ecnRpa40gO5RmzmghTqhQWVUXLFZI4Vf3l4fA7K7jXljNste6b6HPELQ75?=
 =?iso-8859-1?Q?zAXh6xxLfhxOKzRsLRssXy0UAXJZvWTGcU6//LZRrZAyIJGq3kHtHWL8IB?=
 =?iso-8859-1?Q?1kOn8xNmD6ZwsUBKrzvg6uK/OXnfod2rkKsh0UY+ZZuHf5vNRZqacVGk9F?=
 =?iso-8859-1?Q?6SECdJebJKadApFgglIXtCRMFmzDWHmqQRc8BtKAt6npEB2CckMG5gK2FU?=
 =?iso-8859-1?Q?5iOeKl0GRIpL1tUF/C6R/vAMJssDMyArhoWXXQGZIIyH7FnfFNX8v72HqJ?=
 =?iso-8859-1?Q?GsdJBASpJoz8ae+yx81ygpDz8MBi49/bo+AmEMMKgtf9Xum5/q3KrF7Zy3?=
 =?iso-8859-1?Q?FBjnHvCloddJIird4+0VGpQ7DfBkKO0CQVuBwNKv2qIUvvmmXoxiqRYR/z?=
 =?iso-8859-1?Q?eNlxvL+hNEhOeV8MSI8BsmrJXpl/SfwcLndRA6m3UTovoblTS/+bzH45g6?=
 =?iso-8859-1?Q?lFEDvfrsAreH+tRKh934bVZneXKHoYO7bbt0ZBqiM4d5XGESNaK66DDHe3?=
 =?iso-8859-1?Q?A7v3W/OkYjbn/fzrSU7JnWTUzTOg1+QuD/+pOiRrALOBhFjpitOknUr5AY?=
 =?iso-8859-1?Q?TBnu1nRuQ4e27WH5izYWe8JZSwW7i0Cqh/sGWc/xTQVm9NEXgJXKbHb38B?=
 =?iso-8859-1?Q?fbXofSvoCOGJwataN/IawMF5N+NxiY1lwUpYIyTjjyuSN8xtxFCxM8ZPyf?=
 =?iso-8859-1?Q?kQ5lqM8D8LpiQ02H2n4PDw7HVpqbdtQ1CCxuhMtIvMBQWoog2BxWzoHw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 20672fb3-029b-4a6e-c3f3-08dde9230a90
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 06:44:46.6577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OicGYOx79qszpX9P144f7RfLr5Uvzc6Kx6JiY/4yR8wPaZomIgzd0at2DqyAm13+noO9X4BjgpO+78OWgYIa7YfIMKpys3Pe8lJUKL9uNko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF63CA987B2

Hi Hardev, Sakari=0A=
=0A=
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> =0A=
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> active array size of 1920 x 1080.=0A=
> =0A=
> The following features are supported:=0A=
> - Manual exposure an gain control support=0A=
> - vblank/hblank control support=0A=
> - Test pattern support control=0A=
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> =0A=
> Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io=
>=0A=
> ---=0A=
> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 1 =
+=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0=A0 10 +=0A=
> =A0drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> =A0drivers/media/i2c/ov2735.c | 1109 ++++++++++++++++++++++++++++++++++++=
=0A=
> =A04 files changed, 1121 insertions(+)=0A=
> =A0create mode 100644 drivers/media/i2c/ov2735.c=0A=
=0A=
...=0A=
 =0A=
> +static int ov2735_enum_mbus_code(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_mbus_code_enum *code)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 if (code->index >=3D 0)=0A=
=0A=
Hardev, I believe this condition is always true.=0A=
=0A=
You should write:=0A=
if (code->index > 0)=0A=
=0A=
Sakari, Could you please remove the equals sign when you apply the patch? =
=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
 =0A=
...=0A=
 =0A=
> +static const struct of_device_id ov2735_id[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 { .compatible =3D "ovti,ov2735" },=0A=
> +=A0=A0=A0=A0=A0=A0 { /* sentinel */ }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(of, ov2735_id);=0A=
> +=0A=
> +static struct i2c_driver ov2735_driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "ov2735",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D pm_ptr(&ov2735_pm_ops=
),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D ov2735_id=
,=0A=
> +=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 .probe =3D ov2735_probe,=0A=
> +=A0=A0=A0=A0=A0=A0 .remove =3D ov2735_remove,=0A=
> +};=0A=
> +module_i2c_driver(ov2735_driver);=0A=
> +=0A=
> +MODULE_DESCRIPTION("OV2735 Camera Sensor Driver");=0A=
> +MODULE_AUTHOR("Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.i=
o>");=0A=
> +MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");=
=0A=
> +MODULE_LICENSE("GPL");=0A=
> --=0A=
> 2.34.1=0A=
=0A=
Best Regards,=0A=
Tarang=

