Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563EF4572B7
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 17:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236349AbhKSQWU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 11:22:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:34226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236026AbhKSQWQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 11:22:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42B2E611C9;
        Fri, 19 Nov 2021 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637338754;
        bh=lwcEvE0bKHiNxS/t2LWOXv9OBO2ZngoDVv97kh9MYyE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HALPa31SYKYcotXHwDCwArTyCh1dIB1b/+Hd6O23dQj51A469mn83vTxy6XrLjUIn
         x1op1JnjXrXT7BL/6pxwHbSsMXSCfBjV2uUf5muqFjf6tjU55Pizmiw0t4HDTB85mT
         onMqx+q8Ey5OJT7OuLVVBGHYPT1bSYBTg5dZwPZzOt0ds+o7LsFfHsLag+4qbNgpXT
         b7hcI4JRnnWu3B0oiBxmCx5gyMlgmOnUmx4c5WbYjK16mfeJ0pqO4a1eENdCwcMJ8F
         SWJ2k5wQnJSOds9zJs08kIPfFVcY/anH027ifwpRhMOl7FY0yfWYXuVjkdE7FUmfkU
         o2NK0M+fuNNdg==
Date:   Fri, 19 Nov 2021 16:19:10 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     rkardell <rkardell@mida.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb: Solve problem with Terratec cinergyT2 when
 removed and reconnected, or after sleep.
Message-ID: <20211119161910.6cb3b37a@sal.lan>
In-Reply-To: <ad0a926e-8c5f-eed7-5c3a-96453915ea09@mida.se>
References: <ad0a926e-8c5f-eed7-5c3a-96453915ea09@mida.se>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 6 Oct 2021 22:39:29 +0200
rkardell <rkardell@mida.se> escreveu:

> Module used count is incremented 1 time but decremented 2 times by=20
> dvb_frontend.
> This patch inhibit module used count to go to -1.

Same problems of your previous patch:

	- utf8 "\xA0" does not map to Unicode=20
	- your SoB/From doesn't contain your name.

>=20
>=20
> Signed-off-by: rkl099 <rkardell@mida.se>
> ---
>  =C2=A0drivers/media/usb/dvb-usb/cinergyT2-core.c | 1 +
>  =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c=20
> b/drivers/media/usb/dvb-usb/cinergyT2-core.c
> index 23f1093d2..56f58b3f9 100644
> --- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
> +++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
> @@ -69,6 +69,7 @@ static int cinergyt2_frontend_attach(struct=20
> dvb_usb_adapter *adap)
>  =C2=A0=C2=A0=C2=A0=C2=A0 struct cinergyt2_state *st =3D d->priv;
>  =C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>=20
> +=C2=A0=C2=A0=C2=A0 try_module_get(THIS_MODULE);
>  =C2=A0=C2=A0=C2=A0=C2=A0 adap->fe_adap[0].fe =3D cinergyt2_fe_attach(ada=
p->dev);
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&d->data_mutex);
