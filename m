Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D8C968CC
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2019 20:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbfHTS4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Aug 2019 14:56:06 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50232 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728185AbfHTS4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Aug 2019 14:56:06 -0400
Received: from [167.98.27.226] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1i09IY-0000YP-0r; Tue, 20 Aug 2019 19:56:02 +0100
Received: from ben by deadeye with local (Exim 4.92.1)
        (envelope-from <ben@decadent.org.uk>)
        id 1i09IX-0005oX-MC; Tue, 20 Aug 2019 19:56:01 +0100
Message-ID: <fe983331d14442a96db3f71066ca0488a8921840.camel@decadent.org.uk>
Subject: Re: [PATCH] dvb: usb: fix use after free in dvb_usb_device_exit
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Oliver Neukum <oneukum@suse.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, Anton Vasilyev <vasilyev@ispras.ru>
Date:   Tue, 20 Aug 2019 19:55:55 +0100
In-Reply-To: <20190430130736.9191-1-oneukum@suse.com>
References: <20190430130736.9191-1-oneukum@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-ZWpd9A6I0Eza0gxDWHWm"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-ZWpd9A6I0Eza0gxDWHWm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-30 at 15:07 +0200, Oliver Neukum wrote:
> dvb_usb_device_exit() frees and uses the device name in that order
> Fix by storing the name in a buffer before freeing it
>=20
> v2: fixed style issues
> v3: strscpy used and variable names changed
> v4: really use strscpy everywhere
>=20
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: syzbot+26ec41e9f788b3eba396@syzkaller.appspotmail.com

This doesn't fix that bug (and I don't think it fixes a bug at all).=20
The name string is static and doesn't get freed until the module it's
in is freed.

Look again at the stack traces in
<https://syzkaller.appspot.com/bug?extid=3D26ec41e9f788b3eba396>:

> Allocated by task 21:
[...]
>  kmemdup+0x23/0x50 mm/util.c:118
>
 kmemdup include/linux/string.h:428 [inline]
>  dw2102_probe+0x62c/0xc50
drivers/media/usb/dvb-usb/dw2102.c:2375
[...]
> Freed by task 21:
[...]
>
 kfree+0xce/0x290 mm/slub.c:3958
>  dw2102_probe+0x876/0xc50
drivers/media/usb/dvb-usb/dw2102.c:2409

So, d->desc was freed during probe, and is a dangling pointer before
dvb_usb_device_exit() runs at all.

The bug seems to have been introduced by:

commit 299c7007e93645067e1d2743f4e50156de78c4ff
Author: Anton Vasilyev <vasilyev@ispras.ru>
Date:   Mon Jul 23 13:04:54 2018 -0400

    media: dw2102: Fix memleak on sequence of probes

Ben.

> ---
>  drivers/media/usb/dvb-usb/dvb-usb-init.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb=
/dvb-usb/dvb-usb-init.c
> index 99951e02a880..dd063a736df5 100644
> --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> @@ -287,12 +287,15 @@ EXPORT_SYMBOL(dvb_usb_device_init);
>  void dvb_usb_device_exit(struct usb_interface *intf)
>  {
>  	struct dvb_usb_device *d =3D usb_get_intfdata(intf);
> -	const char *name =3D "generic DVB-USB module";
> +	const char *default_name =3D "generic DVB-USB module";
> +	char name[40];
> =20
>  	usb_set_intfdata(intf, NULL);
>  	if (d !=3D NULL && d->desc !=3D NULL) {
> -		name =3D d->desc->name;
> +		strscpy(name, d->desc->name, sizeof(name));
>  		dvb_usb_exit(d);
> +	} else {
> +		strscpy(name, default_name, sizeof(name));
>  	}
>  	info("%s successfully deinitialized and disconnected.", name);
> =20
--=20
Ben Hutchings
Experience is what causes a person to make new mistakes
instead of old ones.


--=-ZWpd9A6I0Eza0gxDWHWm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl1cQjsACgkQ57/I7JWG
EQkQORAAs8Xj65gEVvBlrFCVf8XkKQsRhIqfF+eagGKI0yNS0xBIBYtjfLrtyzLV
gp7JaKEAx+1T4p6FFrapPh/wrJ6L7EMf1ykd066dVlG1VxnRN5bYR7tZgUMgHAaS
gOhTSw2FM0WSn5amLmmKewqMCMQrQKcMdIwWWDszQD+JEHCSjWaHTY3qTwtO6d8s
tizGZX3LMYEp+8MHJj+B/voPv5uBL3haRe75tf+YMOfvVryGUw6IEmL/t+582yZt
Zr/bVadOHjwQpk9C4PdcpSd85mGqjHwjamiprCLckGtvpm6nswKkxhHPQUnlmibO
yJV7BE+p4aPPFc9HF/X5v9bjYAzEvt1oN/5tTwdgztb0dp4uIPE2lgWjaQqiunH0
OWnE/i7m6/WCAPMPEOVLheUm1f8p4POGfzfF80pzI496jPBG5y+Y37nMFt194wAR
3f6O3lz5M1Es0Q2Kcyk4uhGY/N7aLL92jWw+Z1etKEPNHsLEVAI2RnpMbojOM3k0
ZZWae+2RhShVr4JXWZXltOblUWhcaArd3Tsn+4OvGZFMnQ+6EAmJd1l7QI7APGoZ
XgquW3D7awVIEMCND1g/DHRThdnKlsGUO81ocKgqCR4r9aT9wTTbpRmrXc6e7V+K
QPvzjW/ADrwro+V5W/1tNxduIzBBnzvv8PMfTeAAwW1beU0f8YY=
=Ay6V
-----END PGP SIGNATURE-----

--=-ZWpd9A6I0Eza0gxDWHWm--
