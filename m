Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C69D270CEB
	for <lists+linux-media@lfdr.de>; Sat, 19 Sep 2020 12:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgISKWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Sep 2020 06:22:42 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:23908 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgISKWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Sep 2020 06:22:41 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 06:22:40 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600510960;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=2e5bS7HUKAuRsZ7DA4blqvpCT1A3HDUCiJ2p/OUARMw=;
        b=CoUr22iIycaXpP5RtaGRIsRYLF+PkTmsvknHHmmJHiYGbbTYiugVJIvoUfj59V5paC
        OuoBOAhljn9ZIXX2qOlyfubQJh5zWgJzMs/j83xOLc9roiRQxzFAGW+NMfQtbHrAMxaA
        1eI8oV2ex5Y91D6D9cW7KyLoxmZ9HWcpObilZsn0N+p34QBd1KT/UaPC8TBF8QnvkmYT
        s5ooTZvH/IkI4QXHJniBHz83Og2+GbeUKeSQLv3WWlbGAcCAosrqfnj7C8pehEFTL3gy
        Zm+aKzWmKm+i3DvenakDrudTeLhxpept1DxaMMpU9KqwPGrGFXXbRwMnnLgDdy973NkH
        hxmQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/87J3I0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.7 AUTH)
        with ESMTPSA id e0624aw8JAGZ6B9
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 19 Sep 2020 12:16:35 +0200 (CEST)
Date:   Sat, 19 Sep 2020 12:16:35 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <550226752.1109881.1600510595455@webmail.strato.com>
In-Reply-To: <20200915230140.1201187-2-niklas.soderlund+renesas@ragnatech.se>
References: <20200915230140.1201187-1-niklas.soderlund+renesas@ragnatech.se>
 <20200915230140.1201187-2-niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 1/2] rcar-csi2: Extend RAW8 support to all RGB layouts
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev21
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On 09/16/2020 1:01 AM Niklas S=C3=B6derlund <niklas.soderlund+renesas@rag=
natech.se> wrote:
>=20
> =20
> Extend the list of supported formats to include all RGB layouts of RAW8.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/=
platform/rcar-vin/rcar-csi2.c
> index 511cd4984777ad99..c21501ce8980000f 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -320,6 +320,9 @@ static const struct rcar_csi2_format rcar_csi2_format=
s[] =3D {
>  =09{ .code =3D MEDIA_BUS_FMT_YUYV8_1X16,=09.datatype =3D 0x1e, .bpp =3D =
16 },
>  =09{ .code =3D MEDIA_BUS_FMT_UYVY8_2X8,=09.datatype =3D 0x1e, .bpp =3D 1=
6 },
>  =09{ .code =3D MEDIA_BUS_FMT_YUYV10_2X10,=09.datatype =3D 0x1e, .bpp =3D=
 20 },
> +=09{ .code =3D MEDIA_BUS_FMT_SBGGR8_1X8,     .datatype =3D 0x2a, .bpp =
=3D 8 },
> +=09{ .code =3D MEDIA_BUS_FMT_SGBRG8_1X8,     .datatype =3D 0x2a, .bpp =
=3D 8 },
> +=09{ .code =3D MEDIA_BUS_FMT_SGRBG8_1X8,     .datatype =3D 0x2a, .bpp =
=3D 8 },
>  =09{ .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype =3D 0x2a, .bpp =
=3D 8 },
>  };
> =20
> --=20
> 2.28.0

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
