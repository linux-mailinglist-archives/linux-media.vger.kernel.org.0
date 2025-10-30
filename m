Return-Path: <linux-media+bounces-45965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA3C1EA1C
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 07:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F4B1888C48
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 06:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C803074BA;
	Thu, 30 Oct 2025 06:52:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021119.outbound.protection.outlook.com [40.107.51.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442337A3D9;
	Thu, 30 Oct 2025 06:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807173; cv=fail; b=aK7qnlOlJQpw2TcMxQfo5MCUFJcNyXFLetUKE9Y/tmGnpuytF4NeWokMvCQDGB1xZ4whW5tVQ9rYW7Onyr8TARupYsd0LfEMQ7Iyonn+usNwlF4cWncLUHVn4dPMAESlRWesq18cQMF+6R6NkjPRROYgzzYfkPaIZJ14NbkiSe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807173; c=relaxed/simple;
	bh=KorEsefGxCWlbntk9UmUKQkyS8SmGZ1XDu3v3ndU1dk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U2nivh0dFBkbo3soTWm9sbjarQwNxD9UgpwfsFSRNtesTGHKJHckVKgX/tow7lnG+L+9Ne45CgbWIp/pzj9yI4ia1rj+jjUgl/3fvP8lsjfPr0Dn6ytqNSDFMXpcHy8dADiaatMQ8OXGexwPC9Rt6Kp/aF9vi/964glVgtSB9Z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWMJxdGJr9bAeqqJ1iStzgimkyhISgqcp214y091esmr+iF72gNSb55mXOC/8UG3C2uspcnOXjB+Vz41t/YzFexK5QlSyFFbZtn32lfRDV/GbgufzUdMSxzVgVDk3Cq74i0OWfl0NI5OPFky7mW6OMZHxzWmE3OmJpcLPpiMcKlAL9KY7bzZtFn5jLqji5qFQEC+TiHFRzcO3H8Vla0qs6MJPjJTYNe7cg0gsGQiH/INyfX6zMlv+3JHh5ihGj6NMt1H6j5GamJBW7bp0uDC95Zqx0oqQR0I8K1dmyVGJvmsxzFbk2eje7ytOFlzc8vPfR40dRg8cngQprQuv31khw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6H3qBIK/Mz3kxQ2FhPtx3PvZQBAYTy7IpBJIbWPSTQ=;
 b=UoscpNHkcPZnVOK7LRCHUboxEBUrb6eemjmjIq9lAu9kR5UsHuXdrqMqztYzP0iV6CZ6G2kDLZjGHk+aWjhWiObxSMAGhsRW1UF4vwayxrH5XpdXbVjx5UsqG5F8Lo0CxiBLPvJ7XxewEJItHn1dEiQupLA5YDY0LbOgUevgp72aaRdrF7hlLMNmS5vYHKYg3k1j1O4r7JkFcOilBxs6874qXl/qqWLYFKqQQHep2wCXsSFaoItZBWqTnuLlHVdZIyUsGfz37t5EuCDPQoiqyv1EnguXyYZOsYYV4w0bn0KpZ4NIwZHKnSZ3xXOglrBorjzgJke4eKTQsLnOkcaLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1701.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 06:52:43 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 06:52:43 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Svyatoslav Ryhel <clamor95@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Dongcheng Yan <dongcheng.yan@intel.com>,
	=?Windows-1252?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2 RESEND] media: i2c: add Sony IMX111 CMOS camera
 sensor driver
Thread-Topic: [PATCH v2 2/2 RESEND] media: i2c: add Sony IMX111 CMOS camera
 sensor driver
Thread-Index: AQHcR+0Fayu+hKxvfky9xbTbKg+987TX2SMAgAAQdoCAAUP1BoAAE+UAgAD+8eU=
Date: Thu, 30 Oct 2025 06:52:42 +0000
Message-ID:
 <PN3P287MB18291DD344424C8F45790FC18BFBA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251028092200.7003-1-clamor95@gmail.com>
 <20251028092200.7003-3-clamor95@gmail.com>
 <aQEEUpgW8nmZ3ZCl@kekkonen.localdomain>
 <CAPVz0n2SuOcoDn4KZ_zb4NCuaes6nppHRgffWC4yTHmOsbe1vw@mail.gmail.com>
 <PN3P287MB18291BB4CCC68C8BA1260A628BFAA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <CAPVz0n2ELC-Lc7-kO5DV-8pabBueMnXe3YY9-k+zoaxracASKQ@mail.gmail.com>
In-Reply-To:
 <CAPVz0n2ELC-Lc7-kO5DV-8pabBueMnXe3YY9-k+zoaxracASKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB1701:EE_
x-ms-office365-filtering-correlation-id: 9ca695d5-9cbe-444a-0903-08de1780ecd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?TUji06Kud4JA47l/u/Yi2Hf89SqOWH2EngBDSDdBsHP2L7hkr3F3iexR?=
 =?Windows-1252?Q?12DhnPfop3O/H5xka3qjkdKyOiT+NTacDp+UAWTOSQ+h8xBNOPf5pxJj?=
 =?Windows-1252?Q?olnRiwv/2gaHg+oQ/UPeR/FogJLCOj8puweG0+hfXFiVJx1iGn4yvfX4?=
 =?Windows-1252?Q?udSQkzCufLK41IkL97YSDsrd3NVqTjrbtqsBrqD/xenQRmMzW/Hl8EeZ?=
 =?Windows-1252?Q?9Eb1jyJg+xiJotEIpDDH6Ioh11R0ZxYqplllWXAe4Jgn8VzimWoo6l/M?=
 =?Windows-1252?Q?L3yeQGFlHj+rLXrgzYMEdxu2m9oR680gGeVzpzSY02+dR6Htsu6GwOXH?=
 =?Windows-1252?Q?6/B1tNtoaK0tDtoVZJlqiAe+pLnXx5ECdj6vsu4AAmXIPgHUtitaMT48?=
 =?Windows-1252?Q?ajSmqjqBhpaY3hw6SXXFH+NzbtfEiLYWdsEiZCZH98kwKW6OC6uQLZSF?=
 =?Windows-1252?Q?VhVTye1Ak7AvWdWY8ZmuFih4+fxf6dcODymMv0ypmX2cIZ80QWqsD4eo?=
 =?Windows-1252?Q?ipe+sE93O1yqg6NMtB2nQ1L1hb+IzCB2ftiWYFQjLlDFVlKKlaVVPwTX?=
 =?Windows-1252?Q?yfpvk3BP3YJQEaYMMncv37Tnh7pRSxlPjeay2SzvN2ghYr80Uivd0dqo?=
 =?Windows-1252?Q?519qB1SZxjZaV33jYnTduA9j6aG8eQI3iAYDSZ/KfX1gasHwv6xCfXfh?=
 =?Windows-1252?Q?zPVoOhh1PGs+/T4O2vrRk7vyfNH85iASJvmnoCo40tZhmGDYEHmhkese?=
 =?Windows-1252?Q?4+I4VNkam1kBkHpwD/Z/XAfNtrQ1QwIvQpMPm4TbayO0HBTqxJ6CaT0f?=
 =?Windows-1252?Q?KDPHmhC4YAceo+cfpm19KklEx70h08KsKlGzJOMar8TWk4t0H31d9+Dh?=
 =?Windows-1252?Q?MZ6qBzxeEw+ejHnEnOrwLF9fVWZHaJk+uOMrnUn7zQ+4f/MKxiYt3lPQ?=
 =?Windows-1252?Q?SgzntTbxlVQUseaqri6zixBvsp2T5BmGykhCbcDhpOYifQv3yVLq2Mj3?=
 =?Windows-1252?Q?Bmgyzd35NQ9NDE5eruOzJqLnqoxDYCrAcGs8B+hGA4qTfnPNfsraqqio?=
 =?Windows-1252?Q?iS9bwjcJ+cMInT0QRhHtSwvlyRVpZNeUiBbt4Idu7wCNII79RG/cxruX?=
 =?Windows-1252?Q?ICR9HYBNwkvlKMZCvzFatJash+TpMqP40jTPd60oBNBvV+f7w0SYewz8?=
 =?Windows-1252?Q?4CMMNoNVfgc2Y01KNmgMypPRQNiUGa/9siaU0v2IGrADjw92nuV4AjL8?=
 =?Windows-1252?Q?N0n94ZkoIwnn5XsgTPk9ZJvU56wj7BiOkuvXjLpEIdjWTcAta6KtFveX?=
 =?Windows-1252?Q?Ro4odWjo4kQlORVUX3F7tm23KbnODApF33I7Ft3pO7fHFYFYFamgKwR4?=
 =?Windows-1252?Q?OFR7kdTUUh99CdIsxmf8CV+8brhcDkV+YdQaD6w1smc4AwVd3OMtqmMA?=
 =?Windows-1252?Q?2AAt4pexh1ebLwJHwQiH8zk/9M4qGQdqZHwLq9GdH/3e+BtwvuOUckaK?=
 =?Windows-1252?Q?RlrjjzQZ82aWIqO6ZvfyzevqPpfPsZ+VsZU7nSPsOqDcnB8YeLQUozM0?=
 =?Windows-1252?Q?Wp1Mu7DzNvqbIhieDfEvvt+QCLtyu3hzv8Lz+blEmN3sxQ7mxNuyb/sP?=
 =?Windows-1252?Q?ycYAXF/SEZ80NiYQ70V1uCJK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?5O8wLgKAeojXEce0kz6o30l8IyjqliidjrGz3sZiwAAkglv5WEfR8tlK?=
 =?Windows-1252?Q?3TwdunR5199wFC6k/QlBNvFC97aymOSqN01YfmKaHIa532i+7NuL1wVs?=
 =?Windows-1252?Q?tJum7HVLCBKMqlED+NXqPfWtp+V+5IKXvuIjcP+NTLptkI90HG9QhMGa?=
 =?Windows-1252?Q?p1tT150z/8d8/Rcjdj9ObSNgaPidCfdLlSt0o6n0ttLWjf327JwLYG0U?=
 =?Windows-1252?Q?JuSEnQhTGVOPoJLQPBNNAJBWpwCnfP5xHnr4M0Jpn3yJUOcrUEWDNNyE?=
 =?Windows-1252?Q?1ogTageiNLhyF9xX8J7VT7y9gGJV5ej6/unB1TtPoyPI2FHrAvvXparp?=
 =?Windows-1252?Q?rKd9omQSWTQpRK1KzXeVTXCo2wyw9YrVpAp6/Y/cCgcHvkSAMKtYfbry?=
 =?Windows-1252?Q?4hgdV1dHLvZOFmCa2J7L4eDrCnRuXJGwxjnqFQLQr8iyjhyBcgZxQnME?=
 =?Windows-1252?Q?dGmUSPdrrXV2JZHYu2TA+hHx7FEGx6/3ZJbl34s5Ous9GtdwjIX4/u2u?=
 =?Windows-1252?Q?RSgj2FgDQcLRhS14AKK9PH1t5Y+1cGjicijxQXdjyeCf3GTe1OjeVKdC?=
 =?Windows-1252?Q?cZVbQtEJ37gJKo3TwjNy0wXG/lshxQQLZyHDA4LTZk8x5yhktuWaBnYZ?=
 =?Windows-1252?Q?7c8+3cSqznc3IlW68gKyczZ2PiWfY+YLeFsqOjSN4arL6cllQo2unVBe?=
 =?Windows-1252?Q?8hvMv8+cD5nZB55N3xxoHAzk5rGBGAG4R5XD4hqkQ5TRSMXG5m+uS3FO?=
 =?Windows-1252?Q?0GpFA6SGKkJEnkULYQSchB8Vvxf9tzcbUppFTY719sZaMR38M0/Ss+v7?=
 =?Windows-1252?Q?jHc2xtSrRLaY+mlV6NIkQ4R074/h/wgDtyr+RGSP+s0DAtX3HAPz23bT?=
 =?Windows-1252?Q?d7EgwFIYiFD3usnbX9/0m5+CicDQsQ0LZIcdpWCE+2UBtKrBtMLi257I?=
 =?Windows-1252?Q?VwqWuYh3c3lyjOUdXccfrJHdBYkXoUwAbH+2+MuhKuY6+GyoyPhK7riX?=
 =?Windows-1252?Q?E1ETFFWOK186N015bLdhmhQ9qsCDuXpCIw7Z3eNCp/8kYxkB3e48lF3W?=
 =?Windows-1252?Q?5B8HzL3/wcyKoW93r3tbNZKqFr3qCkrXBdS/Z0FiD1DS8rET5XDRKXhB?=
 =?Windows-1252?Q?o8HMcwzKK5T058e8vxhdVKqvkxAsay1EHvv4XIMOC7fppqxB7ayp7DjT?=
 =?Windows-1252?Q?VRFyTINcrTVYYv/kyy8bU89XtbcU2jiFXKKM5OLoFirxhEAesD1AoROM?=
 =?Windows-1252?Q?poIQYRbQmG66XTVtzhnKrwSgHHgqsnucUi9gnQZz0RMkYdnSy7GMz3Br?=
 =?Windows-1252?Q?QFy9o2tEJjfVADDF3TNlACA8PDsfdZp1ZMP/cIyZWjruifT3ojIuEhKs?=
 =?Windows-1252?Q?bzUXT+9IP+1uvYefheRD9ade1LAXGiU/Bsv9UuTt3VlOuMX34oLBtqs6?=
 =?Windows-1252?Q?fz4RTIPUtye3iV3wAbKMeZiDukQGodpvr2JBwfQmeMHH8ITnLiGsOy3H?=
 =?Windows-1252?Q?QLiDD16ISdhjkMY5f9jU7G8HuU4tZ8cLQ3ry4KylW1vB6FseWUD4eDvu?=
 =?Windows-1252?Q?PjWaNglmYK/17oyspDSuDgzwO/dx2V5Bf/0x/1H2dK2piWCsm4DIMUF9?=
 =?Windows-1252?Q?GwAejrLKweaDASZ822pnE6IX4oDAqqutDodCUJXizW8O5Jd8LUK+OKC6?=
 =?Windows-1252?Q?lWyzQqdjpXEAsUsAFlZ5XIBUltwiRuQBDkhvGDX60MebynsiaZkUtQ?=
 =?Windows-1252?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca695d5-9cbe-444a-0903-08de1780ecd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 06:52:42.9249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZzhYox5Olb+tjjPeGKLQAnYVqewWC91e5VMeUZ1E1C8xDs56CZtAa0GhSWneehTYl2Ug6Iadi2QkUOiSMyrYoINrk4sFNqgPzbmTt/gpNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1701

Hi Svyatoslav,=0A=
=0A=
> > > > On Tue, Oct 28, 2025 at 11:22:00AM +0200, Svyatoslav=A0Ryhel wrote:=
=0A=
> > > > > Add a v4l2 sub-device driver for the Sony IMX111 image sensor. Th=
is is a=0A=
> > > > > camera sensor using the i2c bus for control and the csi-2 bus for=
 data.=0A=
> > > > >=0A=
> > > > > The following features are supported:=0A=
> > > > > - manual exposure, digital and analog gain control support=0A=
> > > > > - pixel rate/link freq control support=0A=
> > > > > - supported resolution up to 3280x2464 for single shot capture=0A=
> > > > > - supported resolution up to 1920x1080 @ 30fps for video=0A=
> > > > > - supported bayer order output SGBRG10 and SGBRG8=0A=
> > > > >=0A=
> > > > > Camera module seems to be partially compatible with Nokia SMIA bu=
t it=0A=
> > > > > lacks a few registers required for clock calculations and has dif=
ferent=0A=
> > > > > vendor-specific per-mode configurations which makes it incompatib=
le with=0A=
> > > > > existing CCS driver.=0A=
> > > > >=0A=
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > > > +#include <linux/clk.h>=0A=
> > > > > +#include <linux/delay.h>=0A=
> > > > > +#include <linux/gpio/consumer.h>=0A=
> > > > > +#include <linux/i2c.h>=0A=
> > > > > +#include <linux/kernel.h>=0A=
> > > > > +#include <linux/media.h>=0A=
> > > > > +#include <linux/module.h>=0A=
> > > > > +#include <linux/pm_runtime.h>=0A=
> > > > > +#include <linux/ratelimit.h>=0A=
> > > > > +#include <linux/regmap.h>=0A=
> > > > > +#include <linux/regulator/consumer.h>=0A=
> > > > > +#include <linux/slab.h>=0A=
> > > > > +#include <linux/string.h>=0A=
> > > > > +#include <linux/types.h>=0A=
> > > > > +#include <linux/videodev2.h>=0A=
> > > > > +#include <linux/units.h>=0A=
> > > > > +=0A=
> > > > > +#include <media/media-entity.h>=0A=
> > > > > +#include <media/v4l2-async.h>=0A=
> > > > > +#include <media/v4l2-cci.h>=0A=
> > > > > +#include <media/v4l2-ctrls.h>=0A=
> > > > > +#include <media/v4l2-device.h>=0A=
> > > > > +#include <media/v4l2-fwnode.h>=0A=
> > > > > +#include <media/v4l2-event.h>=0A=
> > > > > +#include <media/v4l2-image-sizes.h>=0A=
> > > > > +#include <media/v4l2-subdev.h>=0A=
> > > > > +#include <media/v4l2-mediabus.h>=0A=
> >=0A=
> > A few of those headers seem to be unused and can be removed=0A=
> >=0A=
> > Like:=0A=
> >=0A=
> > #include <linux/ratelimit.h>=0A=
> > #include <linux/slab.h>=0A=
> > #include <linux/string.h>=0A=
> > #include <media/v4l2-event.h>=0A=
> > #include <media/v4l2-image-sizes.h>=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > > > +/* product information registers */=0A=
> > > > > +#define IMX111_PRODUCT_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0000)=0A=
> > > > > +#define=A0=A0 IMX111_CHIP_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0x111=0A=
> > > > > +#define IMX111_REVISION=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0002)=0A=
> > > > > +#define IMX111_MANUFACTURER_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0003)=0A=
> > > > > +#define IMX111_SMIA_VER=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0004)=0A=
> > > > > +#define IMX111_FRAME_COUNTER=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 CCI_REG8(0x0005)=0A=
> > > > > +#define IMX111_PIXEL_ORDER=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0006)=0A=
> > > > > +=0A=
> > > > > +/* general configuration registers */=0A=
> > > > > +#define IMX111_STREAMING_MODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0100)=0A=
> > > > > +#define=A0=A0 IMX111_MODE_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=0A=
> > > > > +#define=A0=A0 IMX111_MODE_STREAMING=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> > > > > +#define IMX111_IMAGE_ORIENTATION=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 CCI_REG8(0x0101)=0A=
> > > > > +#define=A0=A0 IMX111_IMAGE_HFLIP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 BIT(0)=0A=
> > > > > +#define=A0=A0 IMX111_IMAGE_VFLIP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 BIT(1)=0A=
> > > > > +#define IMX111_SOFTWARE_RESET=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0103)=0A=
> > > > > +#define=A0=A0 IMX111_RESET_ON=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> > > > > +#define IMX111_GROUP_WRITE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0104)=0A=
> > > > > +#define=A0=A0 IMX111_GROUP_WRITE_ON=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> > > > > +#define IMX111_FRAME_DROP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0105)=0A=
> > > > > +#define=A0=A0 IMX111_FRAME_DROP_ON=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> > > > > +#define IMX111_CHANNEL_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0110)=0A=
> > > > > +#define IMX111_SIGNALLING_MODE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0111)=0A=
> > > > > +#define IMX111_DATA_DEPTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0112)=0A=
> > > > > +#define=A0=A0 IMX111_DATA_DEPTH_RAW8=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x08=0A=
> > > > > +#define=A0=A0 IMX111_DATA_DEPTH_RAW10=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x0a=0A=
> > > > > +=0A=
> > > > > +/* integration time registers */=0A=
> > > > > +#define IMX111_INTEGRATION_TIME=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0202)=0A=
> > > > > +#define IMX111_INTEGRATION_TIME_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
x1=0A=
> > > > > +#define IMX111_INTEGRATION_TIME_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
xffff=0A=
> > > > > +#define IMX111_INTEGRATION_TIME_STEP=A0=A0=A0=A0=A0=A0=A0=A0 1=
=0A=
> > > > > +=0A=
> > > > > +/* analog gain control */=0A=
> > > > > +#define IMX111_REG_ANALOG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0205)=0A=
> > > > > +#define IMX111_ANA_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 0=0A=
> > > > > +#define IMX111_ANA_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 240=0A=
> > > > > +#define IMX111_ANA_GAIN_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 1=0A=
> > > > > +#define IMX111_ANA_GAIN_DEFAULT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=0A=
> > > > > +=0A=
> > > > > +/* digital gain control */=0A=
> > > > > +#define IMX111_REG_DIG_GAIN_GREENR=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 CCI_REG16(0x020e)=0A=
> > > > > +#define IMX111_REG_DIG_GAIN_RED=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0210)=0A=
> > > > > +#define IMX111_REG_DIG_GAIN_BLUE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 CCI_REG16(0x0212)=0A=
> > > > > +#define IMX111_REG_DIG_GAIN_GREENB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 CCI_REG16(0x0214)=0A=
> > > > > +#define IMX111_DGTL_GAIN_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x0100=0A=
> > > > > +#define IMX111_DGTL_GAIN_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 0x0fff=0A=
> > > > > +#define IMX111_DGTL_GAIN_DEFAULT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0x0100=0A=
> > > > > +#define IMX111_DGTL_GAIN_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> > > > > +=0A=
> > > > > +/* clock configuration registers */=0A=
> > > > > +#define IMX111_PIXEL_CLK_DIVIDER_PLL1=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0301) /* fixed to 10 */=0A=
> > > > > +#define IMX111_SYSTEM_CLK_DIVIDER_PLL1=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0303) /* fixed to 1 */=0A=
> > > > > +#define IMX111_PRE_PLL_CLK_DIVIDER_PLL1=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG8(0x0305)=0A=
> > > > > +#define IMX111_PLL_MULTIPLIER_PLL1=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 CCI_REG8(0x0307)=0A=
> > > > > +#define IMX111_PLL_SETTLING_TIME=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 CCI_REG8(0x303c)=0A=
> > > > > +#define=A0=A0 IMX111_PLL_SETTLING_TIME_DEFAULT=A0=A0 200=0A=
> > > > > +#define IMX111_POST_DIVIDER=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG8(0x30a4)=0A=
> > > > > +#define=A0=A0 IMX111_POST_DIVIDER_DIV1=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 2=0A=
> > > > > +#define=A0=A0 IMX111_POST_DIVIDER_DIV2=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 0=0A=
> > > > > +#define=A0=A0 IMX111_POST_DIVIDER_DIV4=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 1=0A=
> > > > > +=0A=
> > > > > +/* frame timing registers */=0A=
> > > > > +#define IMX111_VERTICAL_TOTAL_LENGTH=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG16(0x0340)=0A=
> > > > > +#define IMX111_HORIZONTAL_TOTAL_LENGTH=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0342)=0A=
> > > > > +=0A=
> > > > > +/* image size registers */=0A=
> > > > > +#define IMX111_HORIZONTAL_START=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0344)=0A=
> > > > > +#define IMX111_VERTICAL_START=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0346)=0A=
> > > > > +#define IMX111_HORIZONTAL_END=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0348)=0A=
> > > > > +#define IMX111_VERTICAL_END=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG16(0x034a)=0A=
> > > > > +#define IMX111_IMAGE_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 CCI_REG16(0x034c)=0A=
> > > > > +#define IMX111_IMAGE_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 CCI_REG16(0x034e)=0A=
> >=0A=
> > In the mode register settings, you can use the above macros.=0A=
> >=0A=
> > > > > +static const struct cci_reg_sequence mode_820x614[] =3D {=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x0340), 0x04 },=A0=A0=A0=A0 { CCI_REG8(=
0x0341), 0xec },=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x0342), 0x0d },=A0=A0=A0=A0 { CCI_REG8(=
0x0343), 0xd0 },=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x0344), 0x00 },=A0=A0=A0=A0 { CCI_REG8(=
0x0345), 0x08 },=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x0346), 0x00 },=A0=A0=A0=A0 { CCI_REG8(=
0x0347), 0x34 },=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x0348), 0x0c },=A0=A0=A0=A0 { CCI_REG8(=
0x0349), 0xd7 },=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x034a), 0x09 },=A0=A0=A0=A0 { CCI_REG8(=
0x034b), 0xcb },=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x034c), 0x03 },=A0=A0=A0=A0 { CCI_REG8(=
0x034d), 0x34 },=0A=
> > > > > +=A0=A0=A0=A0 { CCI_REG8(0x034e), 0x02 },=A0=A0=A0=A0 { CCI_REG8(=
0x034f), 0x66 },=0A=
> >=0A=
> > Here, you can use those macros.=0A=
> >=0A=
> > Likewise, in every mode.=0A=
> >=0A=
> =0A=
> This is not as simple as a substitution, imx111 requires group write=0A=
> in order to write 16bit values to registers. I will see what I can do=0A=
> about this.=0A=
=0A=
It is straightforward, even if group writes are present. =0A=
=0A=
static const struct cci_reg_sequence mode_820x614[] =3D {=0A=
=0A=
	// group hold ON Register Write  =0A=
=0A=
	{ IMX111_VERTICAL_TOTAL_LENGTH, 0x04ec },=0A=
	.=0A=
 	.=0A=
	.=0A=
	{ IMX111_IMAGE_HEIGHT,		0x0266 },=0A=
=0A=
	// group hold OFF  Register write=0A=
};=0A=
=0A=
However, in your register settings, I do not find any group hold ON or OFF=
=0A=
register before or after these image size=96related registers. This appears=
 =0A=
to be a simple substitution.=0A=
=0A=
If I have misunderstood something, please let me know.=0A=
=0A=
One more suggestion: you can create a helper function for group writes=0A=
It is up to you, if you want, you can make this change.=0A=
=0A=
static int imx111_group_write(struct imx111 *sensor, bool enable)=0A=
{=0A=
	int ret;=0A=
	=0A=
	if (enable)=0A=
		cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, =0A=
				IMX111_GROUP_WRITE_ON, IMX111_GROUP_WRITE_ON, =0A=
				&ret); =0A=
	else=0A=
		cci_update_bits(sensor->regmap, IMX111_GROUP_WRITE, =0A=
				IMX111_GROUP_WRITE_ON, 0, &ret);=0A=
	 =0A=
	return ret;=0A=
}=0A=
=0A=
It removes the repeated cci_update_bits(... GROUP_WRITE ...) boilerplate.=
=0A=
	=0A=
Best Regards,=0A=
Tarang=

