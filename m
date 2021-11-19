Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D464457298
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 17:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbhKSQTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 11:19:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:33220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231173AbhKSQTT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 11:19:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02F0861B1E;
        Fri, 19 Nov 2021 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637338578;
        bh=DbyFG980UjgDc0Eo4ZdzZ0DrMVHoyUPbMFz2sbyZPbo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=at1/MQeMeZXCD/1cKxeuG2gAvE+1fHs7SNg1xUcIoO+IICAY8i1xNAP/Aj4X2FRVL
         eAPAo7qz5422vGaLNNaYN/c+BO6FEvrwSJLJ+SrPRHDBsPqIQ3bhyq4mj+ynbZQEmv
         0zQe7duaX6FnyRMqiSePrCSpBbWSB+3v76Bw/zJfzUi9uM2PjQEk60oXi8fPjdZm7a
         GDhu8NddQd//3wtGFfUNKQ8PNZS9yjXmGJE6/+jA9H8qGVFuh4rK+IBPy8A0DvKnr3
         Mo2OrOeICrgl2hnv8aCgMYydPMBY+Mgp/+b+eO36VNAF/6ey7SErHLP6BDBuxCCyQp
         U9/xo5IkrV5jw==
Date:   Fri, 19 Nov 2021 16:16:12 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     rkardell <rkardell@mida.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb: mt352, change i2c read buffer from stack,
 to kernel space
Message-ID: <20211119161612.1e5eb32a@sal.lan>
In-Reply-To: <cdb8ea1d-0bd6-ec1d-e72f-0298f286170a@mida.se>
References: <cdb8ea1d-0bd6-ec1d-e72f-0298f286170a@mida.se>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 7 Oct 2021 13:44:06 +0200
rkardell <rkardell@mida.se> escreveu:

> Solve problem with initialization of Mega Sky 580 USB DVB (and other=20
> using mt352), error when reading i2c id.

This patch is full of 0xa0 characters instead of spaces, causing it
to be rejected. Probably either your e-mailer of your text editor is doing
something wrong. Please fix and resend.

Thanks!
Mauro

>=20
>=20
> Signed-off-by: rkl099 <rkardell@mida.se>
> ---
>  =C2=A0drivers/media/dvb-frontends/mt352.c | 9 ++++++---
>  =C2=A01 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/dvb-frontends/mt352.c=20
> b/drivers/media/dvb-frontends/mt352.c
> index 399d5c519..d7f33558d 100644
> --- a/drivers/media/dvb-frontends/mt352.c
> +++ b/drivers/media/dvb-frontends/mt352.c
> @@ -69,7 +69,7 @@ static int mt352_read_register(struct mt352_state*=20
> state, u8 reg)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 b0 [] =3D { reg };
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 b1 [] =3D { 0 };
> +=C2=A0=C2=A0=C2=A0 u8 *b1=3Dkmalloc(1,GFP_KERNEL);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct i2c_msg msg [] =3D { {=
 .addr =3D state->config.demod_address,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D =
0,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .buf =3D b0=
, .len =3D 1 },
> @@ -82,12 +82,15 @@ static int mt352_read_register(struct mt352_state*=20
> state, u8 reg)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret !=3D 2) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 printk("%s: readreg error (reg=3D%d, ret=3D=3D%i)\n",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__, reg,=
 ret);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 kfree(b1);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return ret;
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return b1[0];
> +=C2=A0=C2=A0=C2=A0 ret=3Db1[0];
> +=C2=A0=C2=A0=C2=A0 kfree(b1);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>  =C2=A0}
>=20
> +
>  =C2=A0static int mt352_sleep(struct dvb_frontend* fe)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static u8 mt352_softdown[] =
=3D { CLOCK_CTL, 0x20, 0x08 };
