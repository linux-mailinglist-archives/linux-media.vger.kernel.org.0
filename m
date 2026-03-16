Return-Path: <linux-media+bounces-55848-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBJyE7+kt2lTTwEAu9opvQ
	(envelope-from <linux-media+bounces-55848-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:35:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FB29530A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B1173013D6F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 06:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8302A34C124;
	Mon, 16 Mar 2026 06:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="lpLf14jA"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020099.outbound.protection.outlook.com [52.101.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F14223708;
	Mon, 16 Mar 2026 06:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642907; cv=fail; b=rhhHX/dEiHj1lsNBh5Saw8qRNc3PariXAqv8bHXni4x9FA6gOGmFZBAkNXjcS+vnI68HM9yVbL2D8zqodxnXLNrLno1Zb2b4LCCnVFgDW6ZRo09R7+GuJJpwo8k2oUgpLoSbHKp7tQC2Yh8C53XhNojCkb3oxYHjZ/gezbvivkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642907; c=relaxed/simple;
	bh=WX1GqIguMZnaC0xJaFRweHk7C0Y0fSyxUjK8FmSGqAk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7tlxAy6RA2mpRq0H3hSIhsXkXY0ApNzhGOpMiTpqENQRl6wiWKyjeeAwrNafMhmhqOHZXwhD9WCcogZq1iL9rDNZZzpjDKk+XTUM4wY/srcQAB9MB/ecbT7qz1sESvyF6hDdy9XkCpmiphrE4wlTXNgsX4Un9gAQFI/oK/7mSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=lpLf14jA; arc=fail smtp.client-ip=52.101.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HN2yHERwxZ1AnjFJ+aGyAvJhFp2w4ZEqyGBut/IUC0PP/eKDZx4DDrZyht7J/eDnCJ23+sSRnt/s+a35uAyjsSQuv+86QTpvaI50vWP9UXzmkyS8F6NAI0HLMy5iKjXfvNw0BOvBAB5urI1vrB+ZXERQkx5Jl97aWy2FnciGH9FmWh/p38l5Up64yH+atwyH6cVSYRvhFduJMXodsjxIQ8zKVTK17p48N0hnbABNklaoMUP0Odg7vuXfj/w8Ix0n2R7cCRHHheBlum5qfRZpESHtS4OPqZ3FointSPFY3mVMIsnH8OZO00LNvGG0Z8UJJYJXeERRN22mnXAkyv9+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WX1GqIguMZnaC0xJaFRweHk7C0Y0fSyxUjK8FmSGqAk=;
 b=tR58zazUUX96K+KPCgy8OPai+dkte1TEdTEtqAxgAwuJW1iqhSee1dbmRq7rCPbFo8eRtz4i35IAfk5xEP74zrKhq34nQZh3pFBjeiySA/u9gXFQti52hiFFzxMsWt2o3N/0Z85anBOyRumMQe9F25qAKJQr4omTNhVCCSt6bED07FV6l2lUCCytIrtpu0mPl19n21Rbbk69wytB8Cla0Ni+pQK2RJGrP9RxucIIqasp/QFTD1iTyspyTk6d/Pf7pTBx1fs2E/2Mqbtb8ILqXrMPIBuZ18IaKfjjJev9e5yhvsBuep151ujSOalX+OA771EfxPMh6wOS0FYcE356lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX1GqIguMZnaC0xJaFRweHk7C0Y0fSyxUjK8FmSGqAk=;
 b=lpLf14jA/voinul8Xvzo1sqe4dIFO7CcpmDqChn3W8iJcxdqLCiMSN2luhkG4WblxSdy/tlj6g7UkRHQHCpg0bT9Vil5jPpvpZ9yRB1mrpoHH6SX/omeVWi+WJ/AdJ8HCl1arDO71KrH568onCrDGJQdcKTh0cionQMGLPeMvfV73exVTAbhqOqeLn8vCkL8KFbNtnVm22PLPlqXjmZdVUTEUbrQIBRIKauep2RAdI2uumi2koLVViW6gP66ihi+/BwuuuqxWdJGD+QzsOZL4+ofddm2JoDfyW8NuRjy4tcXJCyeVqI27Xdf6pAhJ6zHhfAj8I7b5Rvc91iqmNZXWA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0644.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 06:35:02 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 06:35:02 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Xiaolei Wang
	<xiaolei.wang@windriver.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: i2c: imx412: Switch to using the sub-device
 state lock
Thread-Topic: [PATCH 2/3] media: i2c: imx412: Switch to using the sub-device
 state lock
Thread-Index: AQHcs62j4skw0lU2UkiAF77ncA02srWws+BT
Date: Mon, 16 Mar 2026 06:35:02 +0000
Message-ID:
 <PN3P287MB1829E7CAA5837218F35A22FE8B40A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
 <20260314122442.109356-3-elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260314122442.109356-3-elgin.perumbilly@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0644:EE_
x-ms-office365-filtering-correlation-id: 6cef7058-00f5-4967-179a-08de83262775
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 kj6qCCYoelvGKErHanSAwswpUOp4I4luSBk4Yngd/4zAyI3Co8EdIHdKIMlLFppjSYV98VI8fcKzjoBfJrFrbenRW769noyzHnwu/temZKLmW1zc+oiEmcaxrqahBEKxmZakRFaFjDCBRI0YQDe5Q6SfNweU1ufgmz2LHt1mAlMOa1IHne2sQAiwZnQ/3dzF3lUirdiQIfXD45CBkpszvGx0QmE2GBF8I/LSii/TT8kG7VmArqveA2ZhOscH+rytu9Y4+3gau7odOjQQmKw+0lVzY/ifEgBDvsTBWjwtD4D29m5agZCK5jlTr4vPIuED74jRKzMzvrUZA8NGSf9DYyRF6vzFUhk1TlQPtOIiLINoRW/+SY6K93nxR5Nz1voJInhRHqaK/r0ksiBTJ/DsTxXh/KLnhIGK4YZdCSMqXqq8LZxd9PN0JnrFA1DdKvdBFtLeG87o2/ioYhdcU2tH6q+vGHIkJSlLEEMVDdb12ARYjhCQEPD7uJwiR1ww+oFLNWl+VyTxzCZR+aMixTxLYfOMnM21RRUvguD4ZQ87p/bJeUK/2VwzPzCDrNwSRPwtWytoNH0ADKG+1hHGTGQj0w8J4SY++8cA6ottndQMb7sLjYL1JOJqD6sRQiVVoV7eAe1Xc9V9qtXAhevh0TUh3sCGXvlSIrm+uSXN3ZfYTUDWBNPwxpKUjezYvZ0h6slq039IsUguG5vxC8DWxo04RNgHNGuUMy1FvYzFOd2iBSU+OzSL6xRrNKlaiL/vQTzNv6Pe+8N7nMB2ELqjM7olBTKFpSxXAoHGl8LzwWhB770=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/OFAQnci3JTKdZ4LpOlr/f8/UzIfA7EPQ+bsb91L1n0pBfMu/Xo3Wq3MNQ?=
 =?iso-8859-1?Q?CMfxgFAh54R0ALXdgw8GyoIz/JeyRRScbEDzhPI+Y7nRn6ZRyqCdv+yW4V?=
 =?iso-8859-1?Q?u4exmULFV9J6ELdLteixpyHy14M/eD2yvK8LiXr3tExbyoBjAv0pq07Wmg?=
 =?iso-8859-1?Q?gwTh9UspFdMlRv/gJ5pHd4wQWHvuQ2vm93wnhAd9CIbBeRf8ZeMnxWUddf?=
 =?iso-8859-1?Q?eURZrYeyCccbD8FT6bFd0wa8kGF+jwWpWoQV1UyXhd4PzrxJ8ae3m85+t4?=
 =?iso-8859-1?Q?cb74ZjFh1u4XMKTDjr99SrnjkT81OayYN/N1nG+FPM7iqyxsEzCZHumJIp?=
 =?iso-8859-1?Q?PgLSl5mNNebZ15nJAY/ejD9JlXhkmIuDsZ+zTHrS1ls1V0PJ9X1HB6csf0?=
 =?iso-8859-1?Q?TiEEs3FDwk6RJO00HaD6LMIpfjmS1+gWMTECImuNhD8pIBi/VfssqfNHd4?=
 =?iso-8859-1?Q?yy5qJriqQmXe/JrnM/D4dk2X0MOkVa2nvYrzPagJpAUHDlJevUkOdfCHGB?=
 =?iso-8859-1?Q?yXo0ggpbC8idfhRFrx3mg3pdvcWqxbvk/8f836HTFW1O11giVMfrEtfME0?=
 =?iso-8859-1?Q?6g/bhX6oRWv3/CjzxgTEJxNUgARo1BIbneshsX9q7kcd3vfPK4IDL5k0ba?=
 =?iso-8859-1?Q?aMgi0M/GUWETs+aoAl8R+qUFqGkDw+g1VnRjeb77mIFUM7QvoLx3FR8TV7?=
 =?iso-8859-1?Q?Pe69d8hYLSzUs8tYvL8ez2oSpKewVKaIgIDHRz8Xe8p0MfiFdk6Svvy2/l?=
 =?iso-8859-1?Q?AUtDvU78hnbfWWWW2K6rlbPeE/LhTRLoxnJAzJEyBIjayCgwbIAXzB7SsQ?=
 =?iso-8859-1?Q?YLimgW8s4Q+zTJy0QGlrQgs39Ai1R9ISU3qw3heWjte2nR8GurdXZf5kR7?=
 =?iso-8859-1?Q?u2eQ/mHEtt9/jNIXBIUKg/221r4nVn+5KCl4AAofrOWTFnqrL8VRoK0vEt?=
 =?iso-8859-1?Q?dVKrTV5vbos9AUQ9xyVn92/WMIDAzEQgE60NGuN2Fxmq7Y+D7QQTlgojcO?=
 =?iso-8859-1?Q?hh1cmpWz6wl9mXwzoasdmwVFmwpN9D3SKdt42XNRD4f7AJZm1csvIuisAF?=
 =?iso-8859-1?Q?cDOSIKR5JL/uUCkhcJmzQ/aRd2l5X7TycaNkJcPBbCmAPmI5WpZKwLGVko?=
 =?iso-8859-1?Q?nFlmqIJk/YtWGuQ2ftZdk6JzbdTbnlDvUVYMkrvPHmIS4oRN9DEuNg6+QU?=
 =?iso-8859-1?Q?qwkBcaiz7K7K9p1KaPrbaColF89GuDhnyJIAgAN8x4AnJdQ/zYkik046Nk?=
 =?iso-8859-1?Q?p10OaotRSuaRY+sFy08i39sEwpa9BmHIgqq8thBVN/54psIlWUIo6PMinR?=
 =?iso-8859-1?Q?B6x4BdZHnR1CnipmtQCjChQpA1pnGRMYvN/Wn6IKdnxap404TYi0NpJYQz?=
 =?iso-8859-1?Q?vuGyP45dazlaeSZ693L3muj9Q21fLy7wxLMlBg36ydEfcvB9KKmhf/UMsV?=
 =?iso-8859-1?Q?GWxtoV4Pcr/tLcm9iFgIfwihALj1oFAC5aZuFcSMfgcn4U1a8RbxclgvOQ?=
 =?iso-8859-1?Q?O505dbEyUsAKU2X4t3wgcL7n4gE2AWr7GuZuL8h6tCFgawfVHL5E8dL+OK?=
 =?iso-8859-1?Q?WGoJ/IJcABj9yAH2CByMxhYNHO5nHu1u42qJseZs9FINj11ZtWTJztDJAF?=
 =?iso-8859-1?Q?8B3sLoALQJFfgom3rOM4FOzCCEjcD51A1OZ5IqG+1DdqES77l/1Ep9eY3C?=
 =?iso-8859-1?Q?w7+Q0g6Z88hPaVNq1PFhnV99C90Ckc2i1/gG8mmv66Flq3IBcKUau9aPko?=
 =?iso-8859-1?Q?MQ5lsPQjotmPPrda/F7iTGBKc01GwEIFdVDTDrONB0ARfg3v2qAuS/6Snc?=
 =?iso-8859-1?Q?r76uXYQjCw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cef7058-00f5-4967-179a-08de83262775
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 06:35:02.5939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jy5kRhMA7KlXAc0lFCtkmuXJWqHDzYtjmfCUzf7Gf5A6I4roU/cAhTmoWaQv+K3Gvwg/6oe4XBEiV3SykDE8Ab3Rf8MWbo/dCgDkJKF3a6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0644
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55848-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: AD5FB29530A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Elgin,=0A=
=A0=0A=
> Switch to using the sub-device state lock and properly call=0A=
> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /=0A=
> remove().=0A=
>=0A=
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> ---=0A=
=0A=
...=0A=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&imx412->sd=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret < 0) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(imx412->dev, re=
t,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "failed to register os05b10 sub-device\n");=0A=
=0A=
Hmm, os05b10?=0A=
=0A=
Please remove os05b10 from the error message.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_subdev_cleanup;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_idle(imx412->dev);=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
>=0A=
> +error_subdev_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(&imx412->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_disable(imx412->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_set_suspended(imx412->dev);=0A=
> =A0error_media_entity:=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&imx412->sd.entity);=0A=
> =A0error_handler_free:=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(imx412->sd.ctrl_handler);=
=0A=
> =A0error_power_off:=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 imx412_power_off(imx412->dev);=0A=
> -error_mutex_destroy:=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_destroy(&imx412->mutex);=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> =A0}=0A=
> @@ -1168,9 +1163,9 @@ static int imx412_probe(struct i2c_client *client)=
=0A=
> =A0static void imx412_remove(struct i2c_client *client)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(cl=
ient);=0A=
> -=A0=A0=A0=A0=A0=A0 struct imx412 *imx412 =3D to_imx412(sd);=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 v4l2_async_unregister_subdev(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(sd);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&sd->entity);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
>=0A=
> @@ -1178,8 +1173,6 @@ static void imx412_remove(struct i2c_client *client=
)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (!pm_runtime_status_suspended(&client->dev))=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 imx412_power_off(&client=
->dev);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_set_suspended(&client->dev);=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 mutex_destroy(&imx412->mutex);=0A=
> =A0}=0A=
>=0A=
> =A0static const struct dev_pm_ops imx412_pm_ops =3D {=0A=
> --=0A=
> 2.34.1=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=

