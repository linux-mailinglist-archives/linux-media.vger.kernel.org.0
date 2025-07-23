Return-Path: <linux-media+bounces-38279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3AB0F4E5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 16:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAEEE1893005
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80B42E888B;
	Wed, 23 Jul 2025 14:08:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020133.outbound.protection.outlook.com [52.101.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C514678F3E;
	Wed, 23 Jul 2025 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279690; cv=fail; b=beAcALRCzB29pAMQYfIciBYqigm3mrhPd1CCYSlvY3qIz7VqjEcTHxI7UoTT2tm1ZYO0pq2BIgNkMGncbrQbDsi1PuO0zVTQt8xAkItUiJR0iwR72Q+D+6+fTEacIH8yHt63wCetOnVfCXrinct5t8/QhI0DHEB/aFr3SqTp++o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279690; c=relaxed/simple;
	bh=iWETiR5McRlour6IkC7z8B9IpxpdoOK80c31Fa0Ilxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IRZtwP39KwMjzEYJrFtV8dDbdMCqsO4ztipBAICzXdqUwk15i1eEm3c+M0AnSVrb40PiMknQoO+9Bdqn4CmyfM/3QiGsNH+erI38HrnVTpGeeLV4kmIzobtO9c914NQP7MEyFvPnaI3Nh0VULSH35awaiA4pvOSsXrFYu985evE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lw/5wMfRUpy+nGtThDdDBWt7EOcTsP6AODwf0AqWdvXF5AbMFo2ZFpEOTD1S0q/I3AWHdRppJhdc3G9YFxA0a2DyOdczPqABiMU29r37amnH2hCtNThijRnKVv3JBGE+pOng/vYo23bVQcXR0eABdfwVDdYkZ3b1aAlcbA9Fvvhj2YpfHQF8bLBtcEA/+hdGbFjH7PcHhlTDdl9GUjwBj+254kGCPJ9yImatcV2XnobArdvgEjr9NC1qnQWYMvTUjdusPK6zZ7SFUDCdJGkRxBbs7Gl27XW7qhY/Eom8JzP0b8FBOoYkH9ErXgay8tBUiDyUSS6i/7+jSsyAT+KoGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWETiR5McRlour6IkC7z8B9IpxpdoOK80c31Fa0Ilxc=;
 b=XRhX9okIZ7AxhS7xqdotiet5NgtLKe+l/dFj1jqSNnbMdMuUqejQoqUiH+nPjkcUJIJLuHSZ7ZzdS+x1hJxMJTz8hdsk749+TJLuV4tahADY8+WN3L77nn/OM6jZVuXPcmUwh9lQ66ccPF0J5wbV43Ms4cmetu4M9z1ePA2PclHFF2KRFo2ckyoXevV7O1VhZZ0G4neQE+OcQokBq+zAZgHm/TzWOM4AwQr6CZ8VMvOfrIcdLtEapPvmoif5TlLeeJ6x501OKf1lPilTsaIiCq9u8W35E2fFbS8n06MDVg4dz9LPrXtbMjRMqbg7eLbV1JkygapGTPUy/r0Aby7Xqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1799.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 14:08:05 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 14:08:03 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, Hans de Goede
	<hansg@kernel.org>, James Cowgill <james.cowgill@blaize.com>, Yunke Cao
	<yunkec@google.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] media: Add devm-managed helper functions for media
 and V4L2 subsystems
Thread-Topic: [PATCH 0/4] media: Add devm-managed helper functions for media
 and V4L2 subsystems
Thread-Index: AQHb+7wspgWenQXG40WzeExCZRMFgLQ/qp4AgAASocg=
Date: Wed, 23 Jul 2025 14:08:03 +0000
Message-ID:
 <PN3P287MB1829D71FB3C2B41FF28D6A198B5FA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
 <20250723125520.GB6719@pendragon.ideasonboard.com>
In-Reply-To: <20250723125520.GB6719@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB1799:EE_
x-ms-office365-filtering-correlation-id: 669ca710-0000-4e71-e50e-08ddc9f25716
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?TufsLjxR2SWms/7prOeESOIf/KkCpC+E1uPsL5Nh5qfQGyZqpGdvyMrh?=
 =?Windows-1252?Q?mNUBrN4IRcCYsm2eE35RYDQ/IUaOzReb8UuzqPSymDDgknhrxpvxfYK8?=
 =?Windows-1252?Q?bQmoEC/ZJUCA6kJh2Hsy0eth3OCbm/D1Ago3j7jBFCG/kxZxU3Hl0u6k?=
 =?Windows-1252?Q?Q7tUCIg19gsBSEUdnO2RQNRgGr1S3D7UUmpu6py4ENwtKJX7geOt3H21?=
 =?Windows-1252?Q?spWcBgYykUyZWXvBynPppFfesqkdCZy3kkBWYHd59fDIjkCcsIn28g1M?=
 =?Windows-1252?Q?1ZO1LAca2uF4op8y12LjPoimHRQDzgVpaeAHbtr+EC2L3c5OheTbtYZx?=
 =?Windows-1252?Q?QNIaIzFDIIj5qzey9PrxvIA9WPZhRh6BDYX1gDRGaeLS+bHM0s18ye40?=
 =?Windows-1252?Q?aHmJ4R+Mbk70eH57dQqG2KftPThwsD3+Mxq1QdmZGuu/DVX759IkIr1N?=
 =?Windows-1252?Q?F7TK+jmGfJ6YPnwitHWWGiRSm2qEhzfM1Ji1L/7MDN19LAubrvlCFZiB?=
 =?Windows-1252?Q?DQl4vxoSLiDOQCSFbglpZh4GcUVlolJWeT1f8qduBMteYnNEgW9IhDzU?=
 =?Windows-1252?Q?/aeq4WAr4wJvLrLw+EAQrD6qTfibk+GIa3HNeFPaawXsHXNaIbylsbu7?=
 =?Windows-1252?Q?rTHHcr7PWVqLQv8KijayPEw184xNJmOjKcJkgHCk/CDIeVGHdbzcTNUp?=
 =?Windows-1252?Q?pknEt1p1/vDQts7ttiIdEiFS4PfX2FU7xP/VBpBBUFPYXK/6O00fufDe?=
 =?Windows-1252?Q?j5ZCvxiOFG7Khv1Adus8Fhz4/Cvg/5N0NTaI354MRf9ns7lV8q9KkKeM?=
 =?Windows-1252?Q?CSUkuxFj3UMqbZaGCR+Xc7AT1TAMimpDKyMGSvE5QMuzQ2kyjETaj7OC?=
 =?Windows-1252?Q?Ni8zQfQoCF6SsBqZYXZ9Rvehf1RigwizDpMI364xFRfsvDf/JHpZJ6hv?=
 =?Windows-1252?Q?UAR+CN2kJA70CItpfoedvQzgrCBX95KE0TNo4VjT5unPECmZDd1jJaGQ?=
 =?Windows-1252?Q?sK2sbL3YiijUBR9M9Tl2ZDqy/k//4apCBOijWxWTmJyYBYncAuFkIEEX?=
 =?Windows-1252?Q?2FAUskycm0WndI5rkegIsJNAspEv5cQqm+9crLlEIX2zt85dD01m7JcK?=
 =?Windows-1252?Q?BcFhAFoBvZFa5PAHMO+U4pJsvNsP+QLF3/chRKlydU8wAAhGxkk9HDvv?=
 =?Windows-1252?Q?jOqN+f1HxgRxTy7nSe1xKoa5gQ93tokAatkgszzWvsaeDeIX9cFibW0Z?=
 =?Windows-1252?Q?95/m5pMeKprN4PPnTvLDOiNryJsns4JKrnCvo9cj15uY1iOJgronUz0O?=
 =?Windows-1252?Q?8/zbJhTiys9dbk+tWRER+PkiYIbc8MRkHw5EhJBhSyirN/JTeZlSNMQV?=
 =?Windows-1252?Q?UoBe4BbjTJW7pYlzGC+xivIlOFXHGzZJsPDmTsUHGsFOUZvvpKv/n7Kx?=
 =?Windows-1252?Q?/S3kqEhCf5WkVZBIlPHkVIPWAPJG3TH3VpLFDkD6RWEBNAABNwBXCHNc?=
 =?Windows-1252?Q?Is8oc5EyZyvmDA//ZUW15NwuoaoAoq6tYzkhspcBUH5GvBsZD4u11Z5n?=
 =?Windows-1252?Q?zYKFxfv0DYF4QQqZ99JttuuItlMqppnPnnKqLA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?BsLIcldieH6hv3CSDz52zhqLvmFIbWERPhrz9JlUdK1Q56AaC+fMKHIJ?=
 =?Windows-1252?Q?ewqU41V2YND4LVd9v6tNJcGp+u9kewt77QZYkgVHGtDLItt+BIlvZGUp?=
 =?Windows-1252?Q?tJmf78OdGlx0tB93WuK/2aemEVndH6Il61iYLFWbKtw40ug9qo/z+g/3?=
 =?Windows-1252?Q?CDcbl15chrZ64gg9C7h49vXjYb1/32Ol4HsXEhJH/Uv45F3Y5pbV7BEn?=
 =?Windows-1252?Q?vcaXNfkG4Y4vY4nxtYdCtd03m56z976YFNLAKwj8arYVCIhydiA9I0tR?=
 =?Windows-1252?Q?IHY3o7VXE8d75h1u5s260kk5oK7wEmO1DWg2KkXSDpEFyaJMZYw9Drtf?=
 =?Windows-1252?Q?2bMNcbVvat2xx4xOxjnlCZsI858tguGVvzlP5ydjJnENBdALsPEtrRlI?=
 =?Windows-1252?Q?G5S4MFqQwTYo3EfdnVs5pVz6Dr2UDGcSH/ud0r3hzI2RA5DONq5tiUw2?=
 =?Windows-1252?Q?Y8hZzpSgoDG3erPeqOFJN85JS7YhPPA/J+tX+SytKiAWIt/hhMuhnvRT?=
 =?Windows-1252?Q?UK8925zIxoPtEX1KkjsxeyspbPKNUyeD4R3zPzjXgYapUo/2+LS8EwuH?=
 =?Windows-1252?Q?X8sZ06RXWwnasvxHT79DhmJioVpdSwCP8ohAqWlKt0tUNendDKimpTFo?=
 =?Windows-1252?Q?KqWibfB+Ibbw6XwbyC0F5feWvFxCZ2jy1KDwxl+2w/loYYdSN/y3BRCC?=
 =?Windows-1252?Q?7oETnPvrVcK7Hj3RxGP6k100Af7IpQwGKSKncEKXWxrUC35gBh1xlApt?=
 =?Windows-1252?Q?QhXBw8/ftRlWtFPli7UnIPFuZ8CF1wujCCqYq5nWQhQzr1Wx8YnBb5im?=
 =?Windows-1252?Q?TZnqBDk7NYh1YK6kxBmwlOI33a8L8guI3XjgG3ZFWNEbFSPZ6eFfUglX?=
 =?Windows-1252?Q?o8X9YCbsY0Z8FSAsu1UgTjqemRlzaV1qk3beZMN8VuZT2v+ADhLR0U1S?=
 =?Windows-1252?Q?IJJ70JB56W+8vN1yFxWwBbhPAZmesh0MFo2KxYPHd2oGvZVyiHfXY7Ti?=
 =?Windows-1252?Q?vXXBVWKOO87EQ+OrJrJKfeQR/3cc/LvDqf3RC1mDUFyDukrG+XUq/+XG?=
 =?Windows-1252?Q?OE7l0OujECptUIywTRFbxOFiGUGB6GvuyvkpXXOeF6mNyPC8RH6doCGt?=
 =?Windows-1252?Q?iZOFsGuTHLV1CTgapYJHPiDWUR/Vwkxv+krz8p4E4ISQ6SdZejqOGyVm?=
 =?Windows-1252?Q?5xlMEzgRFBuBpyXVYVInla7ko+66/D0/C4vOHgoIsHkmSE1qlV3kEllq?=
 =?Windows-1252?Q?G1BtrWm5egMX1bptC8vYzhC2a0yrzFu8i8b5IAh/QTnFz2WEe88n818G?=
 =?Windows-1252?Q?Aj9HpDuVk7nw23YgZw7lMYeB1YAG/ilAl49AnRDv2AhKdCyqcits3TGL?=
 =?Windows-1252?Q?sZET3yhJkULO/ilztoS+l495q+1YH86awbAIF+i9jD9ZI5GMiKCuTLAt?=
 =?Windows-1252?Q?EQJZUOuws++fm8woTtsNQtiujhFbENd0Rtfd501+eUTxs3c5+gemxBHh?=
 =?Windows-1252?Q?VnqqnXF4zGEYRRo0e1CiPU8/Gm6m7N0TGArAByC86MC0hfP/c40LcZlf?=
 =?Windows-1252?Q?fHs5anPGggOexjJHlHa+9G0oGXwxo9zYgx9Y1f29hn/ZMA7tWz7nm/6o?=
 =?Windows-1252?Q?edSI2wrA1MQlm3qx6goxS8Q4nnDhvLOLoxO4SjkDQ1mlaVBrO0lrWFpC?=
 =?Windows-1252?Q?YGSW8vD+MB1zNv1Zcld7o2r3RMQPu7l0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 669ca710-0000-4e71-e50e-08ddc9f25716
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 14:08:03.6482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: idhBFDR4wEunFF39afO13qRUgjqaNJMiFBMHmeP3xzZ3WTo7088u+gz4VtYZp3soTN+BQFuhstFPSQsg9tcQjrxq6mxUpBjBiNyADVhxzCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1799

Hi Laurent,=0A=
=0A=
> On Wed, Jul 23, 2025 at 03:55:04PM +0530, Tarang Raval wrote:=0A=
> > This patch series introduces devm-managed versions of several commonly =
used=0A=
> > media and V4L2 initialization functions. These helpers simplify resourc=
e=0A=
> > management by leveraging the devres infrastructure, ensuring automatic=
=0A=
> > cleanup when the associated device is detached or the driver is unloade=
d.=0A=
>=A0=0A=
> I'll let Sakari review this, but overall, I don't think we want to take=
=0A=
> this direction. Objects need to be refcounted instead of freed at remove=
=0A=
> time.=A0=0A=
=0A=
I agree that refcounting could provide more robust lifetime management,=0A=
especially for shared resources. I will think in this direction, explore=A0=
=0A=
implementing refcounting for these objects, and share an RFC for your=A0=0A=
feedback.=0A=
=0A=
> This patch series doesn't necessarily cause a regression as such,=0A=
> but it will make it more difficult to fix life time management issues in=
=0A=
> V4L2.=0A=
=0A=
Could you clarify how devm-managed helpers might complicate lifetime =0A=
management in V4L2? Understanding specific issues will help me design =0A=
a solution that aligns with the subsystem=92s needs while keeping cleanup =
=0A=
simple.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> > Tested with IMX219 and OV2735 camera sensors on an i.MX8MP-based platfo=
rm.=0A=
> >=0A=
> > Tarang Raval (4):=0A=
> > =A0 media: mc: Add devm_media_entity_pads_init() helper=0A=
> > =A0 media: v4l: async: Add devm_v4l2_async_register_subdev_sensor() hel=
per=0A=
> > =A0 media: v4l2: subdev: Add devm_v4l2_subdev_init_finalize() helper=0A=
> > =A0 media: v4l2-ctrls: Add devm_v4l2_ctrl_handler_init() helper=0A=
> >=0A=
> > =A0drivers/media/mc/mc-entity.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| 19 +++++++=
++++++++++++=0A=
> > =A0drivers/media/v4l2-core/v4l2-async.c =A0 =A0 =A0| 19 +++++++++++++++=
++++=0A=
> > =A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 20 ++++++++++++++++++++=
=0A=
> > =A0drivers/media/v4l2-core/v4l2-subdev.c =A0 =A0 | 18 +++++++++++++++++=
+=0A=
> > =A0include/media/media-entity.h =A0 =A0 =A0 =A0 =A0 =A0 =A0| 20 +++++++=
+++++++++++++=0A=
> > =A0include/media/v4l2-async.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| 18 +++++=
+++++++++++++=0A=
> > =A0include/media/v4l2-ctrls.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| 19 +++++=
++++++++++++++=0A=
> > =A0include/media/v4l2-subdev.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | 17 +++++++=
++++++++++=0A=
> > =A08 files changed, 150 insertions(+)=0A=
> >=0A=
>=A0=0A=
> --=0A=
> Regards,=0A=
>=A0=0A=
> Laurent Pinchart=

