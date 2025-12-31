Return-Path: <linux-media+bounces-49798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E817CEBD1B
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 11:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8264E3031993
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 10:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC9F314D26;
	Wed, 31 Dec 2025 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="YAFjpcKz"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020123.outbound.protection.outlook.com [52.101.225.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E7E263F2D;
	Wed, 31 Dec 2025 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178486; cv=fail; b=mOCNgt2xqsfZ627wXXBSathCSphfNf9fJa1bUmtjucsHAebI0CHhu6DipL9Fa4o8kFWJn894dNEndiRPzOxGykQQgeP2IreEz+pYuJ193VP/htXPEosWAUJXEDZAeOsYGaC+E65blQgxWvbeeVYS1xT8bpP+Si73c7aIkBExB0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178486; c=relaxed/simple;
	bh=0RxKRowr/lO7+2rkww0cxRv1QqXDcmcZr8aiNk4DfSw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kcKxxrx++hQTTdYTeMd0odgaFDxHusjLe6I91FwVXxb/reKiFVlq+lHte+5s+QsWEjgddzEIrjcC9sNjIwAovKTAHFs5mnhFjub9HoX2aYOgjezzL3PEYwm/GYG769VYVlvdFgSQw7lk7brnp+5D9EJKm/0+nKH4Su784jmC68Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=YAFjpcKz; arc=fail smtp.client-ip=52.101.225.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwCUM9bpOwh9gFwTLFT7cqbBOwq20bDJhBTO/x7Hzv99tfGHz9GnUM2BV/BVyfvpS6wa7ucZArx95MDxkckD5VeIninu7HfvEyW61k4iSREIL069+2jGxS/QDnEfRUT5c6c0TARQzxb5COOFuA3p4AnCvRA15tLpAgIsBIIvcCy0yxQL0xcUVViz9Fi22327Uikmf/0sdoomPRbFxcNIehyYnO4ihGt0ByXeVb7grMTKSrQ7sFwt2D9Ztsa3obFtji4+dZ4mmhp+03ZCrYVgSWTSySFGogdOMvPSOC1ys+KL8Cbu9iu8J0Iz83LdCMZ7w5iJ777lZOoAPqzEl5uZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RxKRowr/lO7+2rkww0cxRv1QqXDcmcZr8aiNk4DfSw=;
 b=Od8EFwtxd6sRgWpUns6NuxFX1NlDQYSiXpphN6FhrAbOmqtnjDQO4x9ZnGJC2CIZiwJyfNsQj/CLtO6KsZJi9OMO7xydq/rvUF3JEvqJDbvfHElDAAfRLb8IN1Um6vFc1wn3xwb5R4hDnS/2K/4oZgV9wg+7TPWR7GssWWB0nvHJvN33Kf1URosb6d/YSfvivQMYp1pF3RK6tGOuAubdCRiG9rEtCcn7e3kUlErmfilwCubYLMZvdZc/OTxqzHhY+JC2R38gRxnroXAf5C/akejyM3k1dAmZB5shxlD+3pZ2izzdXxTLqMsyXrtddk0UM10B4LG3RH0FjptU0k8KMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RxKRowr/lO7+2rkww0cxRv1QqXDcmcZr8aiNk4DfSw=;
 b=YAFjpcKzchuf29XyOhZ/9NQlnall6IxLCgijp2chI1nt2ZdzfchXV+TroMjsn3EMvjQ8qpYSKB9aPc1cZLnUxxpZ/F62a3aWcBpkq66mkZQTVH7RWm91kfboWa/RnZxB5o4t+m28QM5Q35UVStbR6TGVUUkTjFwIoZNvCpR0e99S50lxhDDOTskLVhY+3q6Y5vechUZ6/9c6nHeyqli+ymJc87TxItcI6h1+MtkW1WIl0ty8KBriAGszpzd9UCo+BFtb6hRa8aPaaNEdtND+oiQd6syVmFRGmt3hU1nSB2jCXZap6hJvjCMTjq4zu1ovjUhaneL31ZUkEptvXHpfgA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB2038.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:123::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.15; Wed, 31 Dec
 2025 10:54:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:54:39 +0000
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
Subject: Re: [PATCH v3 2/3] media: i2c: ov5647: Switch to using the sub-device
 state lock
Thread-Topic: [PATCH v3 2/3] media: i2c: ov5647: Switch to using the
 sub-device state lock
Thread-Index: AQHcejEo64elMmiw5UKo7tStXZXvtLU7jAd6
Date: Wed, 31 Dec 2025 10:54:39 +0000
Message-ID:
 <PN3P287MB1829901790B279AFE53375408BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
 <20251231083924.2657165-3-xiaolei.wang@windriver.com>
In-Reply-To: <20251231083924.2657165-3-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB2038:EE_
x-ms-office365-filtering-correlation-id: cf1f01d9-f4b9-448e-2d71-08de485afef7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EvJJlmvpUGFiAd/0ZYPcOE0/b094uVTALA6Ju9xDlstf5K+l2oRe9yrt/H?=
 =?iso-8859-1?Q?5JyO4XKlztioH6LWXYGoZ7Uk3zXUI1MEIL/Ci9SieFa79Pdm45jCjH7uvk?=
 =?iso-8859-1?Q?I27zk6whQPZfwaqRbilZ4ulXbf9geXyyl2UZQ5p8UH0R3F24Ap/H9BW50R?=
 =?iso-8859-1?Q?gi/0LV2JtPzfOP+TmjuFpTNBrYTQ0CWyT/yhoAfHYvnp5W4u4JkZAoJDnf?=
 =?iso-8859-1?Q?XQ192OyuP2NLTTZPJOpvZx3GKW6ALD2iOuTkXkV1aBhLCJn6dO14JcU3bX?=
 =?iso-8859-1?Q?GoPWQyy2CbH4GUQWEE5mW5yqc1y4NnGEIJ45p9la5a7wrrI3GFC4POoHFv?=
 =?iso-8859-1?Q?NMIXnLaQQcWWAkOjPH4D91EVtaOgpyGRX0Tuekbcdr+W2mOphHsFY2enbs?=
 =?iso-8859-1?Q?/rCgSoqEOehk1m/0Gjd0rx6JTHpBV7iQMv8WAY2wMPvZK8qw42AtloJkVb?=
 =?iso-8859-1?Q?nowNS+aLAiX6Xd053+4mihv2rnKwaHoMXkutDljbQEqPGSYyFJqR00wKgJ?=
 =?iso-8859-1?Q?20v9iNIikwL7H84kUJDQpfvXVHO8AqrOT5S0AjAgcXajY+CMwdxLf8+A/K?=
 =?iso-8859-1?Q?Gqgk3zfZzwRlCxMLdyJqXyqnH1hV0vjCbbYyCrOh6WEhSTX2QphImnBQQe?=
 =?iso-8859-1?Q?4UUIk/FCm1/X1z+hnfg5rEhN2pZTxB50027zYWwhuRjCffnsRJIeo1T9mP?=
 =?iso-8859-1?Q?vDbvCuw8FfklWhYs8x1nf0b6tmGhilbASjXeItg2LOlIyrWSIzfleEbEVq?=
 =?iso-8859-1?Q?rxWGBT+iwnb3kB6b2cQThJ6XJaBO/Uyo8AgJ/bJnkfF9SuUEoSSZ9DgE2O?=
 =?iso-8859-1?Q?vEHD0dqwHo1QtvEHKN3SO5YZPViatvFpWbhBQw+kVqwbvdOC0Qom0awhPi?=
 =?iso-8859-1?Q?ha0MHxIWd0faxEfRJ0J/dFvU4nWiZEd22iUa95CGCf5+EYoQTGB6f/NHnJ?=
 =?iso-8859-1?Q?298DcaiGjh79zW86Sqr7RjyqPHUgQ+xpwaeuwgRTHS9BfW3ygOcBtJVpcF?=
 =?iso-8859-1?Q?exr/6Enxcr1cV2Ig2Lz7fvcg8XXAO6ymaAZg4N5OxDGy11mCg48134dGxw?=
 =?iso-8859-1?Q?aedMdSe65S8A9IA0oW2TAf+k7jfkPGgQvz5zH86IOv70t3QbY24G46OJzD?=
 =?iso-8859-1?Q?6xovsmqHrlQk75NaQACESRCU80DBCf7wegLXbKI0fvzu0W8GwlQ2UG7wgv?=
 =?iso-8859-1?Q?A3iQU6Wc2R1G9m/xETbcj4IQpWgKavGqCvHrrICHAjaZGAx34YwPQGRJw7?=
 =?iso-8859-1?Q?l7a28uTdlfg8XcUAP+K/+AKmCbBPYzTENefMdbfjK4jHzAh7PcAMY9uTQG?=
 =?iso-8859-1?Q?RIyDhd51L415coRnx7bbM86k1FkTjBuP3DBfxASeqmrelC5eye/XYEievV?=
 =?iso-8859-1?Q?M/QEYMfVaTPERVltX082QPkcW4retPaOytkVfRDQvK+sNK65KACjMu8ObK?=
 =?iso-8859-1?Q?2Mc1J+Kno7YcyxxV3583OwLOLGrjYl8TUr80ji865PnaW1fh9NESIj6xb1?=
 =?iso-8859-1?Q?kSxkyI+wO/UveyQAQuMLYyLoq8DUSC7RGXWGPJc51VptXcuULfPwGHiaeM?=
 =?iso-8859-1?Q?2hmqcM1kDRl7Fm3Kt8ExxaDXC3FH5eOS7pZ4iNrwQmsMRtmXEQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nIVmJG6V0bCkHKQpuESJCpKUQUzbM4w6+ewPdOgwsQC4YKtcAo3If/R8bp?=
 =?iso-8859-1?Q?ca6SWWwU6q/ZYIrWApYg0PmtyXGl7jfmbHsbC3H5CNBu6cI/b2DsiuIE5h?=
 =?iso-8859-1?Q?SuyyePs35EyFxJ4Zo3Ew3sYupMhUy/fcFAV0nfSFSgrnB4auntBEXHNcBS?=
 =?iso-8859-1?Q?djJUvv+V/4BHTtgN5ekyOeg7I+fSN/j4CtJFxX79h76/LUISOItCEw/2cX?=
 =?iso-8859-1?Q?UHbdDVrkbEO8lJNetOl0+2kBntGgAqLham989beKmOQlURDvNIQx5w2wSj?=
 =?iso-8859-1?Q?t4L+a25YeolaIIkxGav2VdIHa4npb7fA1ruCVjpsWzcFUzr/n5rxo4XcBt?=
 =?iso-8859-1?Q?5IuhOnsyZ0FCi4HLoPWfP/tgavCsviy6a/hwF3H89ME9rYgwe058CWF7dl?=
 =?iso-8859-1?Q?fCgHCrkMEVJ1oQuPYFCIpvXesj1+LwgCE9FIKQx3J6QWKX10zIwiOlVeSu?=
 =?iso-8859-1?Q?uylnF3Xcl3Fzzs6sA9NirlQ01zzWT0Hs6LIF9IFPNyqH/H+qG+abui43O8?=
 =?iso-8859-1?Q?XRMeTP2Dg8JsCEHlrRa/rRVjMdjWpioK3oncKqsayWp3+WkUjgUR6TK3oU?=
 =?iso-8859-1?Q?4otdseS38ZkvtVXk0e2izkoEcRRsqQ7v3OFtmxlLnO+vpMIKCDu4tRKksW?=
 =?iso-8859-1?Q?cxSz6AwiFUcAbz/gfoWbkBg/gMEQqs6g+2DzzCL9Nqe0RAhf/uvU007ezo?=
 =?iso-8859-1?Q?5u0z42Xl6QBWFJLMH4YlW5o9Aj6cWIqYrtDq2nJYKbk0H4Ucyi/+ysi0DE?=
 =?iso-8859-1?Q?J//76NYfAqpPFGy/7+584Les8kp5kUwCmelSU0oSi0zf2e7yBeOsjaAM4Z?=
 =?iso-8859-1?Q?zdNtQlvt8WWACmO6rh4PMpxNbm1dHFfbc5kNnf5F2+NfBpfAoh6jWEFQry?=
 =?iso-8859-1?Q?K1Vaz+Vfc9T06nBE2WGFc1ARgmeiRlQFlRqsrnnJZ71Uk5mct2b5Q8HoZ0?=
 =?iso-8859-1?Q?/mYcd+iw9WIv+oHA/Cu8qdD8YRmgrFSuPoLWpg0Yr8U40EMayQl4jLqIjS?=
 =?iso-8859-1?Q?vPviyEnU1LdU/xpDcs0f+4i18s49/8qJYCN6FmBEu+oihnoms3loA+utjC?=
 =?iso-8859-1?Q?1hzW9Cks8mBm2gLWOJWpUCuZkun1OtVnGF9PBO1ebIZazG2a93zuMuV2AN?=
 =?iso-8859-1?Q?7ofqjZoAuKJrYDc3XeWgK9hKSWCJFVe0LfQ9KKP5CXlQ+YGMV/8hSx47Ch?=
 =?iso-8859-1?Q?dvZWqYe8i4xMfeDwoWOG7z2kpDBGZhKyz3qDfr8TYDfiXPukCYYdjGbkaH?=
 =?iso-8859-1?Q?s0ExM/iezJPw9C5ZWhCz+SR+1YJ+/vEKNO0cN0ETxFfxMOuwh5hc/bP3Er?=
 =?iso-8859-1?Q?qXqSKC7UFzW0vo4pcY6v0NWyzdwLKC02pthXX02O9l9WweSBjr3wlAxPC3?=
 =?iso-8859-1?Q?DjaQ0oYZwpKV/18NpUp9RShOHr5hiulqphNbGCpg3Dk5bgQpdKPJRdx1u4?=
 =?iso-8859-1?Q?pV31eWwKtRsTpETwOrOh1TA9iLFDn2so4lS+H5GmA2VAbErn7fxabagO11?=
 =?iso-8859-1?Q?7/EEijme/zi3ke7ETFeIc+zHRnpv08hlsJNa+1e5G82ZuEFFIrZJFsKb99?=
 =?iso-8859-1?Q?Rf9SlL/kPrUML5CgBrsP/FEYEDk6VxDJE9jMljAhtwZXSqLkVjaNQcESZb?=
 =?iso-8859-1?Q?rLN3rY1lQq8UPdDhry+Yi4c0s77IU7NuAHbBiChf6vQzYvN0sDCvzlorvg?=
 =?iso-8859-1?Q?3Ou0BNI1xXzF3o8KQV1d/schTi5wZ+TIVgqeWS4F8pQiFurbbmd7NofX50?=
 =?iso-8859-1?Q?VBQP9H6HfILI4KQBl7myv2Ypfe6/EJjkyoZ5hZamNV08AOR7wl9a+S5mui?=
 =?iso-8859-1?Q?fyhhgLQlcw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1f01d9-f4b9-448e-2d71-08de485afef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 10:54:39.4581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q4DTjltWYnamzPxMkWG7yOUGWCY+7MYw6ktD2/OewA885l/MABEzd04wdLK0AmBT9kJLcyhUukXLJO2ahuZ/QxRrKZUeY/HJgs4HOPlGvyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2038

Hi Xiaolei,=0A=
=0A=
> Switch to using the sub-device state lock and properly call=0A=
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /=0A=
> remove().=0A=
>=A0=0A=
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>=0A=
> ---=0A=
> =A0drivers/media/i2c/ov5647.c | 37 ++++++++++++++++---------------------=
=0A=
> =A01 file changed, 16 insertions(+), 21 deletions(-)=0A=
>=A0=0A=
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c=0A=
> index cbcb760ba5cd..bc81f378436a 100644=0A=
> --- a/drivers/media/i2c/ov5647.c=0A=
> +++ b/drivers/media/i2c/ov5647.c=0A=
> @@ -92,7 +92,6 @@ struct ov5647 {=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 sd;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct regmap=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 *regmap;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct media_pad=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 pad;=0A=
> -=A0=A0=A0=A0=A0=A0 struct mutex=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 lock;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct clk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 *xclk;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct gpio_desc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 *pwdn;=0A=
> =A0=A0=A0=A0=A0=A0=A0 bool=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 clock_ncont;=0A=
> @@ -807,10 +806,10 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,=0A=
> =A0static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(s=
d);=0A=
> -=A0=A0=A0=A0=A0=A0 struct ov5647 *sensor =3D to_sensor(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_lock(&sensor->lock);=0A=
> +=A0=A0=A0=A0=A0=A0 state =3D v4l2_subdev_lock_and_get_active_state(sd);=
=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (enable) {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D pm_runtime_resume_a=
nd_get(&client->dev);=0A=
> @@ -831,14 +830,14 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, =
int enable)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_put(&client->dev=
);=0A=
> =A0=A0=A0=A0=A0=A0=A0 }=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_unlock(&sensor->lock);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_unlock_state(state);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>=A0=0A=
> =A0error_pm:=0A=
> =A0=A0=A0=A0=A0=A0=A0 pm_runtime_put(&client->dev);=0A=
> =A0error_unlock:=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_unlock(&sensor->lock);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_unlock_state(state);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> =A0}=0A=
> @@ -886,7 +885,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 const struct v4l2_mbus_framefmt *sensor_format;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct ov5647 *sensor =3D to_sensor(sd);=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_lock(&sensor->lock);=0A=
> =A0=A0=A0=A0=A0=A0=A0 switch (format->which) {=0A=
> =A0=A0=A0=A0=A0=A0=A0 case V4L2_SUBDEV_FORMAT_TRY:=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sensor_format =3D v4l2_subd=
ev_state_get_format(sd_state,=0A=
> @@ -898,7 +896,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 }=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 *fmt =3D *sensor_format;=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_unlock(&sensor->lock);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> =A0}=0A=
> @@ -916,7 +913,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fmt->width, fmt->height);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* Update the sensor mode and apply at it at stream=
on time. */=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_lock(&sensor->lock);=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *v4l2_subdev_state_get_form=
at(sd_state, format->pad) =3D mode->format;=0A=
> =A0=A0=A0=A0=A0=A0=A0 } else {=0A=
> @@ -945,7 +941,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_def);=0A=
> =A0=A0=A0=A0=A0=A0=A0 }=0A=
> =A0=A0=A0=A0=A0=A0=A0 *fmt =3D mode->format;=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_unlock(&sensor->lock);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> =A0}=0A=
> @@ -958,10 +953,8 @@ static int ov5647_get_selection(struct v4l2_subdev *=
sd,=0A=
> =A0=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP: {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct ov5647 *sensor =3D t=
o_sensor(sd);=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mutex_lock(&sensor->lock);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r =3D *__ov5647_get_pa=
d_crop(sensor, sd_state, sel->pad,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->=
which);=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mutex_unlock(&sensor->lock);=
=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> =A0=A0=A0=A0=A0=A0=A0 }=0A=
> @@ -1114,9 +1107,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(s=
d);=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
>=A0=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 /* v4l2_ctrl_lock() locks our own mutex */=0A=
> -=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int exposure_max, exposure_=
def;=0A=
>=A0=0A=
> @@ -1316,13 +1306,11 @@ static int ov5647_probe(struct i2c_client *client=
)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> =A0=A0=A0=A0=A0=A0=A0 }=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_init(&sensor->lock);=0A=
> -=0A=
> =A0=A0=A0=A0=A0=A0=A0 sensor->mode =3D OV5647_DEFAULT_MODE;=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 ret =3D ov5647_init_controls(sensor);=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto mutex_destroy;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 sd =3D &sensor->sd;=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops=
);=0A=
> @@ -1350,9 +1338,16 @@ static int ov5647_probe(struct i2c_client *client)=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto power_off;=0A=
>=A0=0A=
> +=A0=A0=A0=A0=A0=A0 sd->state_lock =3D sensor->ctrls.lock;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_subdev_init_finalize(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(&client->dev, "failed=
 to init subdev: %d", ret);=0A=
=0A=
Use dev_err_probe=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto power_off;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> =A0=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev(sd);=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto power_off;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto v4l2_subdev_cleanup;=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* Enable runtime PM and turn off the device */=0A=
> =A0=A0=A0=A0=A0=A0=A0 pm_runtime_set_active(dev);=0A=
> @@ -1363,14 +1358,14 @@ static int ov5647_probe(struct i2c_client *client=
)=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>=A0=0A=
> +v4l2_subdev_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(sd);=0A=
> =A0power_off:=0A=
> =A0=A0=A0=A0=A0=A0=A0 ov5647_power_off(dev);=0A=
> =A0entity_cleanup:=0A=
> =A0=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&sd->entity);=0A=
> =A0ctrl_handler_free:=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(&sensor->ctrls);=0A=
> -mutex_destroy:=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_destroy(&sensor->lock);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> =A0}=0A=
> @@ -1381,11 +1376,11 @@ static void ov5647_remove(struct i2c_client *clie=
nt)=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct ov5647 *sensor =3D to_sensor(sd);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_async_unregister_subdev(&sensor->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(sd);=0A=
> =A0=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&sensor->sd.entity);=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(&sensor->ctrls);=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_device_unregister_subdev(sd);=0A=
> =A0=A0=A0=A0=A0=A0=A0 pm_runtime_disable(&client->dev);=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_destroy(&sensor->lock);=0A=
> =A0}=0A=
>=A0=0A=
> =A0static const struct dev_pm_ops ov5647_pm_ops =3D {=0A=
> --=0A=
> 2.43.0=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
Best Regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=0A=
Tarang=

