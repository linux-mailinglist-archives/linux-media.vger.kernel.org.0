Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A21819E744
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 21:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgDDTSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 15:18:48 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42590 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgDDTSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 15:18:48 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id BC6B41C3C34; Sat,  4 Apr 2020 21:18:46 +0200 (CEST)
Date:   Sat, 4 Apr 2020 21:18:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, samr7@cs.washington.edu,
        gerard@gkall.hobby.nl
Cc:     linux@rainbow-software.org, kilgota@auburn.edu, moinejf@free.fr
Subject: Re: gspca webcam: need to plug it 5 times before it works
Message-ID: <20200404191846.GA20044@duo.ucw.cz>
References: <20200404184732.GA17534@duo.ucw.cz>
 <20200404191530.GA19753@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
In-Reply-To: <20200404191530.GA19753@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > ..but if I'm patient enough, it eventually starts working... somehow.
> >=20
> > Incoming data seems to go in reliably. Outgoing commands (such as
> > change gain) don't seem to be unreliable.
> >=20
> > Any idea how to debug / what could be wrong?
>=20
> And I can force it to probe like this: which... makes it work, but
> does not fix the outgoing commands.
>=20
> Any ideas?

(Adding people from module_authors to the list.)

 								Pavel
=20
> diff --git a/drivers/media/usb/gspca/sq930x.c b/drivers/media/usb/gspca/s=
q930x.c
> index c3610247a90e..c9756c0a78df 100644
> --- a/drivers/media/usb/gspca/sq930x.c
> +++ b/drivers/media/usb/gspca/sq930x.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2007 Sam Revitch <samr7@cs.washington.edu>
>   */
> =20
> +#define DEBUG
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #define MODULE_NAME "sq930x"
> @@ -446,7 +447,7 @@ static void reg_w(struct gspca_dev *gspca_dev, u16 va=
lue, u16 index)
>  			USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>  			value, index, NULL, 0,
>  			500);
> -	msleep(30);
> +	msleep(90);
>  	if (ret < 0) {
>  		pr_err("reg_w %04x %04x failed %d\n", value, index, ret);
>  		gspca_dev->usb_err =3D ret;
> @@ -635,19 +636,25 @@ static void cmos_probe(struct gspca_dev *gspca_dev)
>  		SENSOR_MT9V111,
>  	};
> =20
> +	printk("CMOS Probing...\n");
>  	for (i =3D 0; i < ARRAY_SIZE(probe_order); i++) {
> +	  printk("Probing type %d...\n", i);
> +	 =20
>  		sensor =3D &sensor_tb[probe_order[i]];
>  		ucbus_write(&sd->gspca_dev, sensor->cmd, sensor->cmd_len, 8);
>  		gpio_init(sd, sensor->gpio);
> -		msleep(100);
> +		msleep(200);
>  		reg_r(gspca_dev, (sensor->i2c_addr << 8) | 0x001c, 1);
> -		msleep(100);
> -		if (gspca_dev->usb_buf[0] !=3D 0)
> +		msleep(200);
> +		if (gspca_dev->usb_buf[0] !=3D 0) {
> +		  printk("#### LUCKY! Have type %d\n", i);
>  			break;
> +		}
>  	}
>  	if (i >=3D ARRAY_SIZE(probe_order)) {
> -		pr_err("Unknown sensor\n");
> -		gspca_dev->usb_err =3D -EINVAL;
> +		printk("Unknown sensor ... hmm?\n");
> +		sd->sensor =3D probe_order[i-1];
> +		//gspca_dev->usb_err =3D -EINVAL;
>  		return;
>  	}
>  	sd->sensor =3D probe_order[i];
>=20
>=20
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXojdlgAKCRAw5/Bqldv6
8jgxAJ45jA6fWJnjJpNTrEsVgcfAB/mD7QCglzd/dqk8xOHI6OywNYejUNUroVA=
=84F5
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
