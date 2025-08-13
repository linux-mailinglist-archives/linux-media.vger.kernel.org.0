Return-Path: <linux-media+bounces-39737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32FB24164
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FC862A2956
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 06:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58AC2D2390;
	Wed, 13 Aug 2025 06:25:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021074.outbound.protection.outlook.com [40.107.51.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7016A2C08CC;
	Wed, 13 Aug 2025 06:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755066310; cv=fail; b=DW3mS64lxFh/TJjmWK7RGAB4kslnwQsFmXZqB/MZuZsmZYySmuvNjxb2rajsGZwM4PEaJfdVOu84UYC0pT+7p+GJP5FcUunbrGBY45ZbNEphQjZr6sbYDUYmYe8xxK2mVZsJsfwjcFJD5689tgtx1Ugy+97WDMqyzmGoz+FkSGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755066310; c=relaxed/simple;
	bh=sc/9C/RKMmyiJM7AWd4XDqXYtCkjKHyLWsIsoqGMdzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PEW3aFE4TYPtjGiwdrRJf4mX3+UmJYG4DuPp6quLxjpgldTfv4LyOus0MpqCiGUsTFMm4qHYy1qyRxjsQIbZkpr/GpNuKvwK99s29uhoSWjkfPSK7KuK/xDmXwqqNy8e8ijmmDUX06ORIiubBqcXG1u3HuqEvBHF6TzXbq6j9FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udFqWrZGY7s8IUPjcMEs1PJapmmNw8g0jn/K9IxRj+P9gtl4Fl6NqlicDXLs+gXJXgh3K3CGIAoUZXB1Bxd2bB6Gt4hAsVNiHUvvIyZ3l1hZ32kXH0lfPMmxdfghXCeC5UAGkgqVhAG08HxjbXSRWjd1u4gXSRL5pL189xKraHTNENkmqQlga8V+KRIzy1Mg6k1YG6bkOPl5vSKDfM24Ip0Hh05lslvbx0LYI3xwO7jc5rajWIGufhzn7r1Fppz3PaDQl8xmyDinb17X4nGnNOqg6e3cZOgly+2V1N42KXCTLw8SvFrFEN1cHaPLVnAgTzt7euXyEMSVQCoR1VLJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc/9C/RKMmyiJM7AWd4XDqXYtCkjKHyLWsIsoqGMdzI=;
 b=uWXjqrrE6APwAJlSJAosGG3RSONZkaFAcfrs1X+35AfTtu4/9GIRmHXu+N9sb+WublPRPbla569KfyH1XFxGiRzm9hmyRwMTRJO2yc1r0xILrAvxlUWJiuoixnhYyi9uh1X7Nb35XbAr1MrhX66WMj046mO1DpJ2tpnZqzFEpKpEeIrDeCiSUuyd97QhV2/aQmnq/sRrDSjaZGXMDVesRb6AYHRigGRGALkZeWLG8UP9Q4oKtUvcRpQ2Q5ysgl1KHZmR/xHOsjkuxN3lwuKXVK0k1vVLaip2wJLd5Gn0vXu85MWtMBF1yaO8RhtmbyOMNZUoJeXAqC79WPBGp2rJQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNZP287MB3945.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:289::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 06:25:03 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 06:25:03 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Thread-Topic: [PATCH v3 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Thread-Index: AQHcC9BaPrng8z1dmEW592ZufSvW+bRgEDW8
Date: Wed, 13 Aug 2025 06:25:03 +0000
Message-ID:
 <PN3P287MB18299C71BB7F2D80F04B9DE88B2AA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250812213024.361267-1-vladimir.zapolskiy@linaro.org>
 <20250812213024.361267-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250812213024.361267-3-vladimir.zapolskiy@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNZP287MB3945:EE_
x-ms-office365-filtering-correlation-id: 180f5002-febb-4d4a-c8a3-08ddda32239d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4kZj/cySr2OnZ0s5Y3cyUdsflcD3Zk1vzBLlE8GWeb/RDs1xA0aguNH+1X?=
 =?iso-8859-1?Q?ThpwhejQXxbmm2DHE8n22trep7vi04yxv18cNTq9XxOeXZq8Qs6RTyLRIk?=
 =?iso-8859-1?Q?cZxJtnTxXgZzCNE4ZAGd+Yi4u+8GNrCCALhzWfIlb0u6OeWCPtcRWvhWgN?=
 =?iso-8859-1?Q?Z0ShQ+CgiPGGB0WpNN0cGtolySescUxNDg/OhCXEzh2SwnAVW8qFiu9qmJ?=
 =?iso-8859-1?Q?2Oct9h2UPzRf9XfVfEf14rIwHDZRefix8dsvGp6MmKP9Ssi5KCiUoqHkrn?=
 =?iso-8859-1?Q?JZ+CTC6ik2JYZBmlKTPZVBvud4q4njjHe6xHK/94oJEC+wwxNsT+IADkcq?=
 =?iso-8859-1?Q?/BdY7HFC0gllYo/uD5cG+QpN+7jiYYzPAHYtmMLoBcJuZ0eUuvealz3nUQ?=
 =?iso-8859-1?Q?ScXYaEKHSvNfIlRzmnRPBLtPcBfoxDT0YCXk1aDjnzeaTzMAdgXvKPDUD7?=
 =?iso-8859-1?Q?XO/CANR/FfSfQZ1zBgN1NCLRUnwkpmPsbkxiYr6J6jvcIiZ2TWNz2Wqvuh?=
 =?iso-8859-1?Q?YKZRw/J3ZDtAdDAPJdLxy+OL03cOuWcCGzAcATin6bGH2F2j3j69T0vBm6?=
 =?iso-8859-1?Q?hmm3mfo3wU8Njx76oaH1meXawxVo82n5zqFpTGCoynMRooheGhKp5zjvyb?=
 =?iso-8859-1?Q?8bJFRKapAPpvfr3dia9CKbkIUGfxPfT1x5wDio+mApya3KsVm6MX3eC4Q6?=
 =?iso-8859-1?Q?8Y2Ubu0cCgYiMfzYbwo60HUAYzgKcrhNKLeUlZ4ihHQcCXtk808xkvSOZi?=
 =?iso-8859-1?Q?CsP9YsWtq0JxIKzhEZe6FZehIBgoTIT15kmdY02i7hQmUV62hmZAA1KRft?=
 =?iso-8859-1?Q?qC2QEQS1J6+2tPXdSAd6VZrJRYs/Yst3Fyaknah219DnKkrsIWVDdUbAcl?=
 =?iso-8859-1?Q?cjyRqepvY65yjV6aCkGsKQYWh8BY6P18J/sJ6kVe4L9T28UTE2gmo/vmeq?=
 =?iso-8859-1?Q?jqn8xywHD/m/6CBF3tzQjOzzzS8FlgR48SYq39czsxtcGP304YXUGPuQ2D?=
 =?iso-8859-1?Q?3rrSoGPTRVQD94SRj6aZklat+j1wrEq/JDuJFVPv1lNVDa9u1ydaVu0drw?=
 =?iso-8859-1?Q?qv1ha1aR/N2Q73cP5XohT2apXEEI+jgNGBCnSpBHytiJQB9kh1pst+aG5H?=
 =?iso-8859-1?Q?ta6sl14Mf9sRHT2oxC2dPxbEDjGcKYbEhpMexGP/S3zdUuYil28kGPncww?=
 =?iso-8859-1?Q?HHedI78/VMEgUo2sTXibfsmaz1pfDv+iZSArHlfD43scJsvEnCVcZVf9lG?=
 =?iso-8859-1?Q?esZlC/1aF4rIKT3cJN4ELPxR/AYK9vY/P1vNtGjgFTSJ3nCBq7+niBiXcO?=
 =?iso-8859-1?Q?SYFSbAmOk41qiHUQr2xqrIKUrL2KLvJ1CoWDORpvcf0Ea3KGkUxEL2I6om?=
 =?iso-8859-1?Q?6pzN2r8uJl7Pp1dBoUxdqxbhRkkIuLUUF9t/AJALUySSK6mztQxtO1RIub?=
 =?iso-8859-1?Q?YNnZVOwXMJsqYB8ACJZUTo8jCUudKk+YFJRUkW42RDxsfeEnJcqCRriJlH?=
 =?iso-8859-1?Q?TOh/hozlBeEqANcZJLpu50F5hrv9wXK9dCpjyC5BhGN7XEEHe4w4EnGypv?=
 =?iso-8859-1?Q?3mvTrGQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MDlO6/4wwdlLvH2sbPCePz1kMGr93DTJoHwx2ONHvEjSKRMWJ/mOuc0nul?=
 =?iso-8859-1?Q?v/GG40naHH2gL1GRGbEax7CCpm5pviMt0oQeCpi1U8ipxdqaWeMC2Y3f6K?=
 =?iso-8859-1?Q?KyG5XCmYquea1zxPwqDNCa7XST3z5viLS0eReB/+MjLIzdDz+bJQStEq3p?=
 =?iso-8859-1?Q?uBarPdtBt1pE8beg/jOtxdHg3RW2tZ7jnNW9NawaSk0ikZ98VUI4AWGjWR?=
 =?iso-8859-1?Q?GNIBHsaJSJ6MfIrijSL0OCC3oPZjjtmYU8gIQ0bJzFtBMi+jf+//+M3SGX?=
 =?iso-8859-1?Q?rKnUYOugxxkr2bKEgW0Gz8mIp/2nsWR61kXs+b9zVM1O/NUrrHIAnX0+X8?=
 =?iso-8859-1?Q?7dwYgm6goACc3NjdC5WtHA93RCW+mFXAjOznQEZg8D7CRhDocK9j+jGrbm?=
 =?iso-8859-1?Q?JacWf6RhnsJvPr1+eXCgcR1kYpFsMbbmFEiXixqhOoAWO8xZI60M7CjXcQ?=
 =?iso-8859-1?Q?ZwQ5ac7IArBXzN2o4IOUBiwK+AwukhH9iBc9dWkB5avooSmahjxtTWqBAp?=
 =?iso-8859-1?Q?+aQN103WqNlapkQaG9wGqh4TvJGzhLForTdgE7tKLjPpVQ4HVyCX3aE6JK?=
 =?iso-8859-1?Q?pEiUoLeax6VWrEzYwllvQ6hiF3P+eg7Ng2yDMDe4nizBGiC2k3GyUni5jH?=
 =?iso-8859-1?Q?pjLA5dPJfiaxji5Z1Y6ivr5jDeaH9ayl1TiNC/S45DAKg+u0nCH7UoB55b?=
 =?iso-8859-1?Q?8nJeXmg5CvWjx4vHkkSeOsJXPqSqY1BudBWpA/1WupzJ724TcNdERo0o+8?=
 =?iso-8859-1?Q?S2VqKBYspuAGInbQMOfCBP+Cb3DUB06S8r/t1iKntTffNdljjSlAskYOps?=
 =?iso-8859-1?Q?yI1k9fnNkiryIq1reDqBjhn/ezCGIBHtLrV9+gLiZQ0bHqaA6PIFEUTway?=
 =?iso-8859-1?Q?m9eEWlVznDpLPWNuVaPEtNCrLNhn0elxfMXls6s0dGv4l+8xgneFLOTeDV?=
 =?iso-8859-1?Q?3jn8n3tkD9QVnbbaa4BK5SAgkxaa/vHmc8mlJ8N+Jy2WUl5opfmlPa5LIJ?=
 =?iso-8859-1?Q?raa2lqMSeVZLwv9tfAT7zIeXtSipA0chgL7HA7mwFO4WbbR8ghOJp0gT6k?=
 =?iso-8859-1?Q?so2XSe1GSpV+V6IFzw55PKgqIOKUQfSSuEJ8ZoiDelVFwy3KgZQ2+XYyq2?=
 =?iso-8859-1?Q?PyqaTpe910oiGde0XSEqr2t9+FFPMrFEPa9PjyFFAlZRK0so67VYMvY0EU?=
 =?iso-8859-1?Q?0o53S2ms9Ht5zQPbbLUftLnMNWfxF4yBSAlsarPJn4Nc2EbgpfbCQxgH1i?=
 =?iso-8859-1?Q?P1IsVVqOkX1l38HeEOBrDq5mghw6XvCP4NC9PtxMhqlWU3KYkx+KjEfgSG?=
 =?iso-8859-1?Q?00PNnbCrLGLQGUgwFNUyzaLJ/E6/fzCAZqmopTsIp9fjAXER7xvq3LMiE1?=
 =?iso-8859-1?Q?IkWTvzmXlKJuTwPBQrkwtT3uvBSKTesKucKJXt3WBIMt23N57iSeessZjR?=
 =?iso-8859-1?Q?WHNYkMOLxBQfZ4UzAuUMpxcY+ny2iLrFfn94ZsHQ2+O+kG3LB/uiOhnfCj?=
 =?iso-8859-1?Q?FSwfSEUlYXnvdEql6TDruj2TNBG0n9k0soVrYF9A4vNhmoU9aRU/8xbKbS?=
 =?iso-8859-1?Q?2eK8doolLndgpZwLrk6E/uj7c6iLOawMbNEpHb2206oGhnwr9lFv8+HTV/?=
 =?iso-8859-1?Q?I7ZxMsKPqGpo2UkMyAbdvna7sZZgspzy1R?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f5002-febb-4d4a-c8a3-08ddda32239d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 06:25:03.6611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vRZyq0zdfHWbqVvH8b/rT4Lide5OXq+XKXTPPOb993jQywMzpo5qJKN0fyImySsDsO72O+qbfD1ZSmP/me9BDwfrz/gg1/BhIwwTwXra/v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZP287MB3945

Hi Vladimir,=0A=
=0A=
I have very small comments below, you can check them. Since these are minor=
,=0A=
you may want to wait for others review before making changes. With the belo=
w=0A=
changes, it looks good to me.=0A=
=0A=
> OmniVision OV6211 is a monochrome image sensor, which produces frames in=
=0A=
> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100=0A=
> output image resolution modes.=0A=
>=A0=0A=
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
> ---=0A=
> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 8 +=
=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0 10 +=0A=
> =A0drivers/media/i2c/Makefile |=A0=A0 1 +=0A=
> =A0drivers/media/i2c/ov6211.c | 809 +++++++++++++++++++++++++++++++++++++=
=0A=
> =A04 files changed, 828 insertions(+)=0A=
> =A0create mode 100644 drivers/media/i2c/ov6211.c=0A=
=A0=0A=
...=0A=
=0A=
> +static int ov6211_init_controls(struct ov6211 *ov6211)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr =3D &ov6211->ctrl=
_handler;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct ov6211_mode *mode =3D &supported_modes[0=
];=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_device_properties props;=0A=
> +=A0=A0=A0=A0=A0=A0 s64 exposure_max, pixel_rate, h_blank;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *ctrl;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 8);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
=0A=
No need to explicitly check the return value of v4l2_ctrl_handler_init() he=
re,=0A=
so this can be dropped.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 ctrl =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov6211_ct=
rl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_LINK_FREQ,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(link_freq_menu_items) - 1,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0, link_freq_menu_items);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ctrl)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->flags |=3D V4L2_CTRL_FL=
AG_READ_ONLY;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pixel_rate =3D link_freq_menu_items[0] / mode->bpp;=
=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_C=
ID_PIXEL_RATE,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 0, pixel_rate, 1, pixel_rate);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 h_blank =3D mode->hts - mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_op=
s, V4L2_CID_HBLANK,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 h_blank, h_blank, 1, h_blank);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ctrl)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->flags |=3D V4L2_CTRL_FL=
AG_READ_ONLY;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_op=
s, V4L2_CID_VBLANK,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height, 1,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ctrl)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->flags |=3D V4L2_CTRL_FL=
AG_READ_ONLY;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_C=
ID_ANALOGUE_GAIN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OV6211_ANALOGUE_GAIN_STEP,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OV6211_ANALOGUE_GAIN_DEFAULT);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 exposure_max =3D (mode->vts - OV6211_EXPOSURE_MAX_MAR=
GIN);=0A=
> +=A0=A0=A0=A0=A0=A0 ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_op=
s,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_EXPOSURE,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 OV6211_EXPOSURE_MIN, exposure_max,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 OV6211_EXPOSURE_STEP,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 OV6211_EXPOSURE_DEFAULT);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (ctrl_hdlr->error)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ctrl_hdlr->error;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_fwnode_device_parse(ov6211->dev, &props)=
;=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_free_hdlr;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &o=
v6211_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &props);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_free_hdlr;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ov6211->sd.ctrl_handler =3D ctrl_hdlr;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +error_free_hdlr:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int ov6211_enable_streams(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 const struct ov6211_reg_list *reg_list =3D &supported=
_modes[0].reg_list;=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D to_ov6211(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D pm_runtime_resume_and_get(ov6211->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Skip a step of explicit entering into the standby =
mode */=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->regmap, OV6211_REG_SOFTWARE=
_RST,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV621=
1_SOFTWARE_RST, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(ov6211->dev, "failed =
to software reset: %d\n", ret);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_multi_reg_write(ov6211->regmap, reg_list-=
>regs,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 reg_list->num_regs, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(ov6211->dev, "failed =
to set mode: %d\n", ret);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_handler_setup(ov6211->sd.ctrl_han=
dler);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->regmap, OV6211_REG_MODE_SEL=
ECT,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV621=
1_MODE_STREAMING, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(ov6211->dev, "failed =
to start streaming: %d\n", ret);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +error:=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_mark_last_busy(ov6211->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put_autosuspend(ov6211->dev);=0A=
=0A=
The call to pm_runtime_mark_last_busy() is now redundant, as it has been=A0=
=0A=
merged into pm_runtime_put_autosuspend().=0A=
=0A=
see: https://lore.kernel.org/all/20250616061212.2286741-3-sakari.ailus@linu=
x.intel.com/=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int ov6211_disable_streams(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct ov6211 *ov6211 =3D to_ov6211(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov6211->regmap, OV6211_REG_MODE_SEL=
ECT,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV621=
1_MODE_STANDBY, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(ov6211->dev, "failed =
to stop streaming: %d\n", ret);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_mark_last_busy(ov6211->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put_autosuspend(ov6211->dev);=0A=
=0A=
same here=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static const struct of_device_id ov6211_of_match[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 { .compatible =3D "ovti,ov6211" },=0A=
> +=A0=A0=A0=A0=A0=A0 { /* sentinel */ }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(of, ov6211_of_match);=0A=
> +=0A=
> +static struct i2c_driver ov6211_i2c_driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "ov6211",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D &ov6211_pm_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D ov6211_of=
_match,=0A=
> +=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 .probe =3D ov6211_probe,=0A=
> +=A0=A0=A0=A0=A0=A0 .remove =3D ov6211_remove,=0A=
> +};=0A=
> +=0A=
> +module_i2c_driver(ov6211_i2c_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");=0A=
> +MODULE_DESCRIPTION("OmniVision OV6211 sensor driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
> --=0A=
> 2.49.0=0A=
=0A=
Best Regards,=0A=
Tarang=

