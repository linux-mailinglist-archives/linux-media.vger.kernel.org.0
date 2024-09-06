Return-Path: <linux-media+bounces-17732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8581A96ECF8
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 09:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9D1281262
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 07:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CA1155CBD;
	Fri,  6 Sep 2024 07:57:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D541534E9
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609455; cv=none; b=JMUYpJgqDe06QULKuKpS1K/5wdcnh5+Wth7XNOS8VV4dAgLYqC6Nw+MnLgtXSplYXM1w9GI17JnTO1JdL7laHBWCZl3ub5teDJLxd/8NABu5U7qdMjnj5vNlayELHdDi6hy+cRrQZsnhu63gOy6TII0Fl9gxEO+o35mxyU2WFRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609455; c=relaxed/simple;
	bh=If1Z3ucK+BshlFAuR4+9cyHkrKZMcAXU5BabL5q1yY4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=JN/QECfBuEIBHo+sQJ9LqOJr+Bq1vOlzivyqqKwxeMrZzz4tqpnWkgOvU5zYmSvJdoryzVd6OTgMEYCyTVMQTeONYnijz50rYnIuss1HkNbDrv3XnefkGgFH8MrVVSRXvLEvmJ9oujvEDUaErZHBXFGAbigYsh4Qw4yS7YnhzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-272-62-3r_aIMM6qyocEmmOHaQ-1; Fri, 06 Sep 2024 08:57:28 +0100
X-MC-Unique: 62-3r_aIMM6qyocEmmOHaQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 6 Sep
 2024 08:56:44 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 6 Sep 2024 08:56:44 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mauro Carvalho Chehab' <mchehab+huawei@kernel.org>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Hans de Goede <hdegoede@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject: RE: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
Thread-Topic: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
Thread-Index: AQHbACQzagH7UmA9AUeCwJRVG1DaELJKYshg
Date: Fri, 6 Sep 2024 07:56:44 +0000
Message-ID: <8c8b5727abf44e429727b70365cc3048@AcuMS.aculab.com>
References: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
 <20240906081542.5cb0c142@foz.lan>
In-Reply-To: <20240906081542.5cb0c142@foz.lan>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Mauro Carvalho Chehab
> Sent: 06 September 2024 07:16
>=20
> Em Sat, 27 Jul 2024 14:51:56 +0200
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> escreveu:
>=20
> > Using clamp_t() instead of min_t(max_t()) is easier to read.
> >
> > It also reduces the size of the preprocessed files by ~ 193 ko.
> > (see [1] for a discussion about it)
> >
> > $ ls -l ia_css_eed1_8.host*.i
> >  4829993 27 juil. 14:36 ia_css_eed1_8.host.old.i
> >  4636649 27 juil. 14:42 ia_css_eed1_8.host.new.i
> >
> > [1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS=
.aculab.com/
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 24 +++++++++----------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_cs=
s_eed1_8.host.c
> b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host=
.c
> > index e4fc90f88e24..96c13ebc4331 100644
> > --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_=
8.host.c
> > +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_=
8.host.c
> > @@ -172,25 +172,25 @@ ia_css_eed1_8_vmem_encode(
> >  =09=09base =3D shuffle_block * i;
> >
> >  =09=09for (j =3D 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
> > -=09=09=09to->e_dew_enh_x[0][base + j] =3D min_t(int, max_t(int,
> > -=09=09=09=09=09=09=09     from->dew_enhance_seg_x[j], 0),
> > -=09=09=09=09=09=09=09     8191);
> > -=09=09=09to->e_dew_enh_y[0][base + j] =3D min_t(int, max_t(int,
> > -=09=09=09=09=09=09=09     from->dew_enhance_seg_y[j], -8192),
> > -=09=09=09=09=09=09=09     8191);
> > +=09=09=09to->e_dew_enh_x[0][base + j] =3D clamp_t(int,
> > +=09=09=09=09=09=09=09       from->dew_enhance_seg_x[j],
> > +=09=09=09=09=09=09=09       0, 8191);
> > +=09=09=09to->e_dew_enh_y[0][base + j] =3D clamp_t(int,
> > +=09=09=09=09=09=09=09       from->dew_enhance_seg_y[j],
> > +=09=09=09=09=09=09=09       -8192, 8191);
>=20
> Such change introduces two warnings on smatch:
>=20
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c=
:
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c=
:177
> ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable =
'to->e_dew_enh_y[0][base +
> j]'
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c=
:
> drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c=
:182
> ia_css_eed1_8_vmem_encode() warn: assigning (-8192) to unsigned variable =
'to->e_dew_enh_a[0][base +
> j]'
>=20
> Should dew_enhance_seg_x and dew_enhance_seg_y be converted to signed?

Someone clearly needs to read the code and work out what it is doing.

First stage is to use clamp() (not clamp_t) to get warnings from the
compiler for the RHS.
The snippet implies that the _x values are unsigned but the _y ones
can be negative.
Holding negative values in unsigned variables is a recipe for disaster.

=09David


>=20
>=20
> Thanks,
> Mauro

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


