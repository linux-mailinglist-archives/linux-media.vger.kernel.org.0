Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE8D979DE
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfHUMsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:48:06 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55998 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728049AbfHUMsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:48:05 -0400
Received: from [192.168.4.242] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1i0Q1w-0007B2-CJ; Wed, 21 Aug 2019 13:48:00 +0100
Received: from ben by deadeye with local (Exim 4.92.1)
        (envelope-from <ben@decadent.org.uk>)
        id 1i0Q1v-0006i7-Ue; Wed, 21 Aug 2019 13:47:59 +0100
Message-ID: <fcae86f2137822d7658d2bbd4bd8dd35bfb319b0.camel@decadent.org.uk>
Subject: Re: [PATCH] dvb: usb: fix use after free in dvb_usb_device_exit
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Oliver Neukum <oneukum@suse.com>, mchehab@kernel.org
Cc:     Anton Vasilyev <vasilyev@ispras.ru>, linux-media@vger.kernel.org
Date:   Wed, 21 Aug 2019 13:47:55 +0100
In-Reply-To: <1566375500.2611.6.camel@suse.com>
References: <20190430130736.9191-1-oneukum@suse.com>
         <fe983331d14442a96db3f71066ca0488a8921840.camel@decadent.org.uk>
         <1566375500.2611.6.camel@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-dK1HuylAfjFCCfud9xmh"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-dK1HuylAfjFCCfud9xmh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-08-21 at 10:18 +0200, Oliver Neukum wrote:
> Am Dienstag, den 20.08.2019, 19:55 +0100 schrieb Ben Hutchings:
> > On Tue, 2019-04-30 at 15:07 +0200, Oliver Neukum wrote:
> > > dvb_usb_device_exit() frees and uses the device name in that order
> > > Fix by storing the name in a buffer before freeing it
> > >=20
> > > v2: fixed style issues
> > > v3: strscpy used and variable names changed
> > > v4: really use strscpy everywhere
> > >=20
> > > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > > Reported-by: syzbot+26ec41e9f788b3eba396@syzkaller.appspotmail.com
> >=20
> > This doesn't fix that bug (and I don't think it fixes a bug at all).=
=20
> > The name string is static and doesn't get freed until the module it's
> > in is freed.
>=20
> I see.
>=20
> > Look again at the stack traces in
> > <https://syzkaller.appspot.com/bug?extid=3D26ec41e9f788b3eba396>;:
> >=20
> > > Allocated by task 21:
> >=20
> > [...]
> > >  kmemdup+0x23/0x50 mm/util.c:118
> > >=20
> >=20
> >  kmemdup include/linux/string.h:428 [inline]
> > >  dw2102_probe+0x62c/0xc50
> >=20
> > drivers/media/usb/dvb-usb/dw2102.c:2375
> > [...]
> > > Freed by task 21:
> >=20
> > [...]
> >=20
> >  kfree+0xce/0x290 mm/slub.c:3958
> > >  dw2102_probe+0x876/0xc50
> >=20
> > drivers/media/usb/dvb-usb/dw2102.c:2409
> >=20
> > So, d->desc was freed during probe, and is a dangling pointer before
> > dvb_usb_device_exit() runs at all.
>=20
> In that case KASAN would have reported a double free in testing, which
> it did not.

So far as I could see, the descriptors are normally static data in the
driver and nothing in the DVB core frees them.

dw2102 is unusual in that it heap-allocated descriptors, which is why
this patched fixes a leak:

> > The bug seems to have been introduced by:
> >=20
> > commit 299c7007e93645067e1d2743f4e50156de78c4ff
> > Author: Anton Vasilyev <vasilyev@ispras.ru>
> > Date:   Mon Jul 23 13:04:54 2018 -0400
> >=20
> >     media: dw2102: Fix memleak on sequence of probes
>=20
> AFAICT this patch only does anything if probe() succeeds, which it does
> not. Something is strange.

How did you determine that it doesn't succeed?

Ben.

--=20
Ben Hutchings
Quantity is no substitute for quality, but it's the only one we've got.



--=-dK1HuylAfjFCCfud9xmh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl1dPXsACgkQ57/I7JWG
EQnW6Q//agyBqDH4uOQKcZXEdJ/3x1G/wGaXZL/cWAKkI2DJ/fwIHhKohMNpJ2Ez
4yHVRbsbij2SiCTZUKnOGl2nnOKXyIc2Kj3oKC6VYEX9yoqmk14cCAbloy+B6YmP
VKY7wXmwtFFUdHk1GSbjA76P4f+C1yacjEm75Ej5vGlIMe+xCoE7hPg20/d1d25/
kEHOMLlIdORKUzVL5GA3MPLLt1oSRZBOyUls476QfJkUfG25wiAtw5k6Il8lr2wH
2WPvyosKGZ/zHfGCFQ8FLWq5vFZaRs9e/3Ce3C1mdjKepSgZ3L5dKDOXCKlg80gA
pNlZCp3QB6kUCJhi+5XWIr4hcGJPgLVnZR3qDYi6N4RbMLqv/FT5cIihJt242xEx
kOczVuSyCG6REYpVa/cuzD5kIWy56rJugGDJC1r2bOdsqtv76MzYRPzm09mGI9yT
+bft1G3HGVWC9lQjEPUUZQKfAfkk9smUPfzvRkuXugDYRI3gm0Am4F2c7uceqKEc
PJNSm9j0JktFGOk0btZhPeSl+mpc5xIffLk7Mj9rZ2hqCPtQuZxZ+BuftvzSVExg
hBI6ft0EcEr3REnQvDHu0BFj7WmDNn/E8Qlr9s9aQLNng66oNU/1KdIQ323FZtIs
UXjHx6K2Gev9w3ybff1JAto1zs55xxJLnwnCeTWeUsTLnw2nUsM=
=3zok
-----END PGP SIGNATURE-----

--=-dK1HuylAfjFCCfud9xmh--
