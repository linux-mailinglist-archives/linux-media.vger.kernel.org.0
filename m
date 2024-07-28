Return-Path: <linux-media+bounces-15379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E093E4B3
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 13:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C49281C14
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 11:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727563B1AC;
	Sun, 28 Jul 2024 11:10:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C437147
	for <linux-media@vger.kernel.org>; Sun, 28 Jul 2024 11:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722165007; cv=none; b=ZF3rHkcbRW2sLuyLazS7oGNE9KcMn5TqhtjLeMa/3teGRYWj67CYZQJ0bdqM1bAs97011z4jYZcXxr3IOwlSK/s/jKi5BrU3BW7xSjIqLBbNFPco4RUkf+L4IccOkRpKDwcOjJx2h6d5GAPaBUGTlh55cbI4VqRgr5AVcpTKdNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722165007; c=relaxed/simple;
	bh=Z2pr3hswnOxug8eRznQLN7nyeiNc94yVvI63upS2yxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=GoUl9EZE5tP99KZNAwfRz8/01S++KipLfhFrh1zR8Y+XtAsMWbpUt7Vp8KRg248QFRrrbtM+vqRBCUbaAnMla1FKIDZN3tEeisqUeDBl7FBalyu83PmKnlWGZvh8KhHcJCKNTQQSMDEMP5qONwvAyhPPWdeh9HTTWqoGscObqk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-34-sYAO-MeaOZ6O1kPukl5G1A-1; Sun, 28 Jul 2024 12:09:52 +0100
X-MC-Unique: sYAO-MeaOZ6O1kPukl5G1A-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jul
 2024 12:09:08 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jul 2024 12:09:08 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe JAILLET' <christophe.jaillet@wanadoo.fr>, Hans de Goede
	<hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
Subject: RE: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
Thread-Topic: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
Thread-Index: AQHa4COzK6M+vFHXWEyyKjE8PmiWvrIL/Fqg
Date: Sun, 28 Jul 2024 11:09:07 +0000
Message-ID: <cc34afdcb96444779f0ccae6d47ef5f4@AcuMS.aculab.com>
References: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
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

From: Christophe JAILLET
> Sent: 27 July 2024 13:52
>=20
> Using clamp_t() instead of min_t(max_t()) is easier to read.

It shouldn't need to be clamp_t(), a plain clamp() looks to be ok.
(dew_enhance_seg_x is s32).

=09David

>=20
> It also reduces the size of the preprocessed files by ~ 193 ko.
> (see [1] for a discussion about it)
>=20
> $ ls -l ia_css_eed1_8.host*.i
>  4829993 27 juil. 14:36 ia_css_eed1_8.host.old.i
>  4636649 27 juil. 14:42 ia_css_eed1_8.host.new.i
>=20
> [1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.a=
culab.com/
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_=
eed1_8.host.c
> b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host=
.c
> index e4fc90f88e24..96c13ebc4331 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.=
host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.=
host.c
> @@ -172,25 +172,25 @@ ia_css_eed1_8_vmem_encode(
>  =09=09base =3D shuffle_block * i;
>=20
>  =09=09for (j =3D 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
> -=09=09=09to->e_dew_enh_x[0][base + j] =3D min_t(int, max_t(int,
> -=09=09=09=09=09=09=09     from->dew_enhance_seg_x[j], 0),
> -=09=09=09=09=09=09=09     8191);
> -=09=09=09to->e_dew_enh_y[0][base + j] =3D min_t(int, max_t(int,
> -=09=09=09=09=09=09=09     from->dew_enhance_seg_y[j], -8192),
> -=09=09=09=09=09=09=09     8191);
> +=09=09=09to->e_dew_enh_x[0][base + j] =3D clamp_t(int,
> +=09=09=09=09=09=09=09       from->dew_enhance_seg_x[j],
> +=09=09=09=09=09=09=09       0, 8191);
> +=09=09=09to->e_dew_enh_y[0][base + j] =3D clamp_t(int,
> +=09=09=09=09=09=09=09       from->dew_enhance_seg_y[j],
> +=09=09=09=09=09=09=09       -8192, 8191);
>  =09=09}
>=20
>  =09=09for (j =3D 0; j < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); j++=
) {
> -=09=09=09to->e_dew_enh_a[0][base + j] =3D min_t(int, max_t(int,
> -=09=09=09=09=09=09=09     from->dew_enhance_seg_slope[j],
> -=09=09=09=09=09=09=09     -8192), 8191);
> +=09=09=09to->e_dew_enh_a[0][base + j] =3D clamp_t(int,
> +=09=09=09=09=09=09=09       from->dew_enhance_seg_slope[j],
> +=09=09=09=09=09=09=09       -8192, 8191);
>  =09=09=09/* Convert dew_enhance_seg_exp to flag:
>  =09=09=09 * 0 -> 0
>  =09=09=09 * 1...13 -> 1
>  =09=09=09 */
> -=09=09=09to->e_dew_enh_f[0][base + j] =3D (min_t(int, max_t(int,
> -=09=09=09=09=09=09=09      from->dew_enhance_seg_exp[j],
> -=09=09=09=09=09=09=09      0), 13) > 0);
> +=09=09=09to->e_dew_enh_f[0][base + j] =3D (clamp_t(int,
> +=09=09=09=09=09=09=09        from->dew_enhance_seg_exp[j],
> +=09=09=09=09=09=09=09        0, 13) > 0);
>  =09=09}
>=20
>  =09=09/* Hard-coded to 0, in order to be able to handle out of
> --
> 2.45.2

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


