Return-Path: <linux-media+bounces-20471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F809B4194
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 05:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAAC52835F6
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 04:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA361DD543;
	Tue, 29 Oct 2024 04:31:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2099.outbound.protection.outlook.com [40.107.239.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF9219E0
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 04:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730176309; cv=fail; b=Kt6KzPrpRRncNBKoTBGtNWM00wyGfP94WJE3EFEM7Pfmoo2E+JkPdNVfxxrLR6uW7vDZMtY1W6M66DwIQge+0oOOG93xkMNWCdjdurZ4/BzTFth25Z4oZ4ufUkAlE3JZyyiJh1y5AFX0PMv+uxjTQK4el+DLDPLlrZixAEun5hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730176309; c=relaxed/simple;
	bh=Y2d8a1RuTkZ6HItzQ6SoqzjBe2k8FEbemAFq2jE3pKc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j22VsBCpRBpX5e1yuyj2djqB2HS2MxOnMfwREBpzPoR1rsgvwf643aGxbZhe6rD5O2icIw83hd0vGSVfy3Tly9QMrUPoiKwNvVgrRD8H02OxtErPkqfaJC0f4IU5qbZZbl2xCcNkBMDitko1jkc9pDox8EAhB5oq67EPLZfRfq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpSm6jIR3yVGIfb7yYBebLVLrVy/JyCzonwcvO7+GKIwwP5GliqzVUHl3GfZzxqOyCEPCevZVIhdKT21zvfzxOtbqr5izqlI2dwQFcRkMoWxqUQsK+8WFENcysr7K15pk219QursYvqbB0l1IJ4i12oANlkP5JVLJIauCt5lcYpjlhMYlqCqQLyuRDSbPggR//IA8KcMMgpixvgMN1CR6BImQy4LmA4PryrC8rzHDfzCLRn+rwUdMAvqdMBWt+hIlGRIh+/FmxEStAaQ5/4VFoN+WyeQK4rdDCDQI+Ea6N7gwzloP7Onqq2yL4m1YNg+KO6Uer0HjTLa1u4DyEVK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2d8a1RuTkZ6HItzQ6SoqzjBe2k8FEbemAFq2jE3pKc=;
 b=JXhgvcD+6wu+AubW+6e7dRvDC1jlsYYconp2YRNQ706mSnzKdzvZDcIhUXvXy9uO8xMUynYquOk9mQ/QIa8RfJPP1Y/hYPcImcRMb65++6tvWFwsWURfDiQ8QCcxTIjAYVhki+S7lECbCkFHjU5X6I4u+KxUOH2Tn6D53SyIqgc9Jk7NGp0Th3rCj3Bf3qD5d8BCKWfPP+S9BI5abp/JUnGChg6+Lud6m/SDu8ZH+xTKljHXnAy4V2jvki8Dnvx1fVWUzNSMSVG+6FCFrO7ZrV0BBJBEHwkPR6Y1E6FVfBujJK/Jf2lzmLaaWPcOUwbiX2CymFcFWOzDipLFSv4K7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0236.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 04:31:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 04:31:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@iki.fi>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] media: mt9p031: Drop legacy platform data
Thread-Topic: [PATCH v2 0/3] media: mt9p031: Drop legacy platform data
Thread-Index: AQHbKXo+L6Fa+rT3UUe8fO9uw/Z/q7KdIdXo
Date: Tue, 29 Oct 2024 04:31:38 +0000
Message-ID:
 <PN3P287MB182997D0A042915D1D8184068B4B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20241028204443.22426-1-laurent.pinchart@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0236:EE_
x-ms-office365-filtering-correlation-id: fcd21ad9-cdb5-45df-9afc-08dcf7d29476
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jP9DeQVO6f5biHbyADHBozRWkWxHr5k1op7pg7cjavTW7FBdgPmsAwqt7P?=
 =?iso-8859-1?Q?4ERevkx6F95DU1RWmnv+SY1/M2aD7Lh63MB2gjhVrMWaqAzOJXuVv10VMc?=
 =?iso-8859-1?Q?bl2pIBEeHtLxzh8l4DyxkUddxu70yR/NSlAsaFSVADJPDk8rcoowasevP9?=
 =?iso-8859-1?Q?XoqcD+edLeowp7Wn9PdzSMBxhUnRy1TnwlzBBLp6JdvCorvZkR2gt/89q5?=
 =?iso-8859-1?Q?F3Q9dCRGjE/WL0/7DI9uvbTuNWXIXGiflsooVpKarvNoqVnvvorqPJC0Zk?=
 =?iso-8859-1?Q?dzjQ6iifwEVndjRPM+X0Dbd0C+pJR4VXBqMCN/qrvX8Lx3zVxtuEvptV4n?=
 =?iso-8859-1?Q?zIPuiWMb9MCo5D9zsnxZdMozKV1du7q9X2J4jFRkY6785nn2L46Cdr0XWF?=
 =?iso-8859-1?Q?zuoQznwfnu4nB17Fa4e0r90TMQswW48VwcoVOcFFWItoCgX+5YqBg05WYZ?=
 =?iso-8859-1?Q?FrM4sLWFa01fSsVMSYLmzG/Vu2sv3o3VvEBMKz53zrglx0btyJZ3H6VpJE?=
 =?iso-8859-1?Q?uwG9NmddgF8h9s4MzE8POI3FYTUljIml7yLxysD0F3O+MyggcVhtp6JNBL?=
 =?iso-8859-1?Q?Es0SyOEU5JNs6uSzVuzzvC4aoYllUPpnIsPN/u4p/435taw2ZFrcxYAhoW?=
 =?iso-8859-1?Q?CtId12LT4cGgK2gELHjFih235WCOHxbyA4u9fFJAG2jY3/jbHmqFZ9TqEX?=
 =?iso-8859-1?Q?cPyvZ3M5Jh9FhyH0/v+rOdRLrRA+zUZfCmIc+mkzRdhYOCf04/Db9vIN9w?=
 =?iso-8859-1?Q?UVfK0bBvhu7VaESvCNHjgvSX43z3FuO4HuJa2Qwr7/BFLJIn9iYw+Ifzb7?=
 =?iso-8859-1?Q?jwp5/NsM6uRyr8EKbvK3Zam1/qBpUy195p/vkw4Dh7n2Oy1IbrVPNyQJjS?=
 =?iso-8859-1?Q?rNhCqUIPNCz9hOh2OSNar/FhdZVkTdVRAZZPHFkGZFYC/R0DsPmROTiqyO?=
 =?iso-8859-1?Q?0g6rWqNVD2Drr9Y+xJNkD9/Ngc6nu1LX9v5mc+bQA+jwVuCbaaHFvtQf+T?=
 =?iso-8859-1?Q?PltxsSVsykyV8/BdG/NV2b8ccj5El1qB/7OgJ8qSWZ9unXvAb2etlIwUCY?=
 =?iso-8859-1?Q?Fxmws1ZgstwHsxOi7Sqh2b8YedWYz+z5I4lhlguCUd0qaOTJGpWXOfC+yB?=
 =?iso-8859-1?Q?pf55MKzGvuTJrXtubMpeKenoI0pHEMbE2K2NPunYJnexVX/y78zoEi+fmI?=
 =?iso-8859-1?Q?XXyStTAgXiIHTzDc1QZx/PiqBi78WC1cJLAVtpCsFMuaSxBk3azb1X3yez?=
 =?iso-8859-1?Q?5K6PH+SbanW/TPnvNY+qYvbwEfdCIHpj8a+JimwVuU5LVkoD6ZYyJPv5rC?=
 =?iso-8859-1?Q?ND/E59pR5RmJUmhgS48rsViOVYsr01VsoUOUKWMHDt4/bOTaPZnzkmwZyw?=
 =?iso-8859-1?Q?LTsey2g0qK1L4qi5tIFMV4FVbNh4lCdLOnXyg2kBjO+SQjI51yMuE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?soN+vuioQDWu8BjuLNu06h/YIDwW96CvTPnvZHm5/Xf9d05E+tviCdTPEu?=
 =?iso-8859-1?Q?fMuB5E2LQPezjKJMnhvDPDQosgoHZoUmYMf13pqylv4PFSRWRciqlYxug+?=
 =?iso-8859-1?Q?dfc+MNzNVe2i5F/ZzRH0OexNR6zVNZvjJX1B1oX1YhQB2M9NfNNWduZq/J?=
 =?iso-8859-1?Q?0fSvFMYNzw3sFUURLKZm+xmq0Cr9w8Sks/tpZwi88Phi79O1FKFuRLVaoF?=
 =?iso-8859-1?Q?tq37FecbmI8J0+UEemPI4SX/f4uokD6iU/Vv3Pd1UxAU6zowrFKCdYUS/Z?=
 =?iso-8859-1?Q?86U/V/VxI2vvN4qa3Fm/JUhl3WYvNtr7XQr7emWaeMctXgVyXnAEUGXbkW?=
 =?iso-8859-1?Q?BtdWTSUbE+RV9TdQmfE1Pcws2RdC/k+6BCimQ6TCBBvYqrAYdKNQ+LM0pK?=
 =?iso-8859-1?Q?thoKvyH6NTqmZSAwA518MONwh4qw8a8oxLhpVdQRB7Ng76m7XwvPbvKDeC?=
 =?iso-8859-1?Q?cD0YTF9ITLQ0tQq2CVj7g7NAWrRLEJrcTNk44MZgWeyrVlwy9lPy4NQXuU?=
 =?iso-8859-1?Q?C3wyeDEUwIprMoxS3ZxxwZdF0DLHYQ31Vuv3dBbKC+9zlVwxu1xPhgWrSC?=
 =?iso-8859-1?Q?kTLao/J8yY5NIYD/EkH18Earu5N5XSOiz11mIBafUhqp4icX7x2jizOPH2?=
 =?iso-8859-1?Q?2i+CTdgADsJz5YvMc5H8rYdqX9MN8VGciKPd3KjFCMwLkdznxK8DpXRkjb?=
 =?iso-8859-1?Q?VpY/eoJX3yuCSgKIWbhgBwaF52CwgwRHqn+CTW/4z9lg9n2RfXxKKAmbsS?=
 =?iso-8859-1?Q?iipSO09q2QLRsW8dAk7p4jId7GdaTec6mU1AmlELLyEnRwEloN0Tr030eJ?=
 =?iso-8859-1?Q?6lKMxomDXaIvhwUOXun+GVv8vDamdfZVugX9GT0zFMRj3EUOqF/67mB5zw?=
 =?iso-8859-1?Q?kFU95jC0cUzFywm+lzJUCg2tAw5Qmj/5LzdOY5DQOi8NW6r98IECfL29eg?=
 =?iso-8859-1?Q?ERlHWbtBaq9MTkA0i7YPRWkdgG6H1qyDL6GfWKOSaTzwbcT3bpd5ywUSrq?=
 =?iso-8859-1?Q?8/Ox2kg5XnVd/YULJdv+uQuW5C+sfybNksz6Vb5TKEC7zBxfakGkiD/biP?=
 =?iso-8859-1?Q?akeXFDkS55RNjnaN7DG9e2uAWGyV3hYCDT0vhSVRtYlqTtxAs1fkl4S0/E?=
 =?iso-8859-1?Q?qevO4/sRwCY3uziQT3EMuscOwlLjLGy6dvOOTBoHtBylWGSRCZotvZ6463?=
 =?iso-8859-1?Q?PNbuJL32JMmcF+4kTIyZu/ClsUylxJAyCoQUDoIx9ChqNfASVfpT0Souvn?=
 =?iso-8859-1?Q?7qd0OyRH24hFthN4M8vsY4giodo9hBTZb1WicAYV/UInCfafLuPvHtd8GL?=
 =?iso-8859-1?Q?9iM/wS7wSxOGp39uXkj/ZErpKv912UdwtHob4QvsocxxlzU4DDPL7FKwfn?=
 =?iso-8859-1?Q?ss/aUFvZqr8fYzkRRq5YKzlu+utjJiDXaCBERwssq0pjhhqczG5zPxZZ/c?=
 =?iso-8859-1?Q?TUc7S7ZcB4yj3DSVoKNll9dNCSZI/bhCaheuFUoGOqj2YaUSfDqD7PrcPO?=
 =?iso-8859-1?Q?j74FJl/o4HiM4muFHgA4lrdVKrkmDyTWo3Twn46Prix4aX7GiJaOunj8N1?=
 =?iso-8859-1?Q?KwFsZoQM2AQAJ6cH7cjlr7rOJZJW5LRJUOZWa02E7520B0n++aZ+bNj2NP?=
 =?iso-8859-1?Q?OYD3CLWjevAfx9oddJ3dYtgXdu23hfvict4w6xefht9qgOypXPsNYjaw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd21ad9-cdb5-45df-9afc-08dcf7d29476
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 04:31:38.5167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYPm62LMT0wwubT1AsUP/KsRqeNP3d/+bPRlqvNgn92HstghwlsPo45n25tj57c5VYqMp4pvLlWQp6YuJ/2cAl9GFhfymujqNqwA9W3k8rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0236

Hi Laurent,=0A=
=0A=
>This small series drops support for legacy platform data from the mt9p031=
=0A=
>driver. Patch 1/3 removes support for platform data as it has not been=0A=
>used for a long time, and patch 2/3 follows by dropping the then=0A=
>unneeded I2C device ID table. Patch 3/3 is new in this version and=0A=
>switches from the OF API to the fwnode API, making the driver usable on=0A=
>non-OF platforms.=0A=
>=0A=
>I can't easily test the series at the moment. Would anyone know of an=0A=
>MT9P031 camera module available off-the-shelf with a Raspberry=0A=
>Pi-compatible connector ?=0A=
>=0A=
>Tarang, would you be able to test the series ? I would like to make sure=
=0A=
>patch 3/3 doesn't break anything.=0A=
=0A=
Sorry, I have no MT9P031 camera availability=0A=
=0A=
Best Regards,=0A=
Tarang =0A=
________________________________________=0A=
From:=A0Laurent Pinchart <laurent.pinchart@ideasonboard.com>=0A=
Sent:=A0Tuesday, October 29, 2024 2:14 AM=0A=
To:=A0linux-media@vger.kernel.org <linux-media@vger.kernel.org>=0A=
Cc:=A0Sakari Ailus <sakari.ailus@iki.fi>; Tarang Raval <tarang.raval@silico=
nsignals.io>=0A=
Subject:=A0[PATCH v2 0/3] media: mt9p031: Drop legacy platform data=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
Hello,=0A=
=0A=
This small series drops support for legacy platform data from the mt9p031=
=0A=
driver. Patch 1/3 removes support for platform data as it has not been=0A=
used for a long time, and patch 2/3 follows by dropping the then=0A=
unneeded I2C device ID table. Patch 3/3 is new in this version and=0A=
switches from the OF API to the fwnode API, making the driver usable on=0A=
non-OF platforms.=0A=
=0A=
I can't easily test the series at the moment. Would anyone know of an=0A=
MT9P031 camera module available off-the-shelf with a Raspberry=0A=
Pi-compatible connector ?=0A=
=0A=
Tarang, would you be able to test the series ? I would like to make sure=0A=
patch 3/3 doesn't break anything.=0A=
=0A=
Laurent Pinchart (3):=0A=
=A0 media: i2c: mt9p031: Drop support for legacy platform data=0A=
=A0 media: i2c: mt9p031: Drop I2C device ID table=0A=
=A0 media: i2c: mt9p031: Switch from OF to fwnode API=0A=
=0A=
=A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 1 -=0A=
=A0drivers/media/i2c/mt9p031.c | 82 +++++++++++++++----------------------=
=0A=
=A0include/media/i2c/mt9p031.h | 18 --------=0A=
=A03 files changed, 32 insertions(+), 69 deletions(-)=0A=
=A0delete mode 100644 include/media/i2c/mt9p031.h=0A=
=0A=
=0A=
base-commit: d020ca11a816a99f87f2d186e137a9fb2341adb3=0A=
--=0A=
Regards,=0A=
=0A=
Laurent Pinchart=0A=

