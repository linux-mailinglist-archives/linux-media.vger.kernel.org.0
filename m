Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A4419E731
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 20:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgDDSrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 14:47:35 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38826 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgDDSrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 14:47:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7115C1C3C15; Sat,  4 Apr 2020 20:47:33 +0200 (CEST)
Date:   Sat, 4 Apr 2020 20:47:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux@rainbow-software.org, kilgota@auburn.edu, moinejf@free.fr
Subject: gspca webcam: need to plug it 5 times before it works
Message-ID: <20200404184732.GA17534@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

=2E.but if I'm patient enough, it eventually starts working... somehow.

Incoming data seems to go in reliably. Outgoing commands (such as
change gain) don't seem to be unreliable.

Any idea how to debug / what could be wrong?

Thanks,
								Pavel


[36790.733135] usb 2-1.1: USB disconnect, device number 30
[39686.814093] usb 2-1.1: new high-speed USB device number 33 using ehci-pci
[39686.853138] usb 2-1.1: New USB device found, idVendor=3D2770, idProduct=
=3D930c, bcdDevice=3D 1.00
[39686.853162] usb 2-1.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[39686.853178] usb 2-1.1: Product: USB 2.0 PC camera=20
[39686.853193] usb 2-1.1: Manufacturer: SQ Tech CO., LTD.
[39686.859210] gspca_main: sq930x-2.14.0 probing 2770:930c
[39688.769984] gspca_sq930x: Unknown sensor
[39688.770037] sq930x: probe of 2-1.1:1.0 failed with error -22
[39748.021772] usb 2-1.1: USB disconnect, device number 33
[39754.901755] usb 2-1.1: new high-speed USB device number 34 using ehci-pci
[39754.940668] usb 2-1.1: New USB device found, idVendor=3D2770, idProduct=
=3D930c, bcdDevice=3D 1.00
[39754.940688] usb 2-1.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[39754.940700] usb 2-1.1: Product: USB 2.0 PC camera=20
[39754.940710] usb 2-1.1: Manufacturer: SQ Tech CO., LTD.
[39754.944401] gspca_main: sq930x-2.14.0 probing 2770:930c
[39756.845672] gspca_sq930x: Unknown sensor
[39756.845750] sq930x: probe of 2-1.1:1.0 failed with error -22
[39759.797800] usb 2-1.1: USB disconnect, device number 34
[39763.349750] usb 2-1.1: new high-speed USB device number 35 using ehci-pci
[39763.389838] usb 2-1.1: New USB device found, idVendor=3D2770, idProduct=
=3D930c, bcdDevice=3D 1.00
[39763.389859] usb 2-1.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[39763.389871] usb 2-1.1: Product: USB 2.0 PC camera=20
[39763.389882] usb 2-1.1: Manufacturer: SQ Tech CO., LTD.
[39763.391369] gspca_main: sq930x-2.14.0 probing 2770:930c
[39765.297703] gspca_sq930x: Unknown sensor
[39765.297787] sq930x: probe of 2-1.1:1.0 failed with error -22
[39775.669563] usb 2-1.1: USB disconnect, device number 35
[39779.477651] usb 2-1.1: new high-speed USB device number 36 using ehci-pci
[39779.517205] usb 2-1.1: New USB device found, idVendor=3D2770, idProduct=
=3D930c, bcdDevice=3D 1.00
[39779.517227] usb 2-1.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[39779.517239] usb 2-1.1: Product: USB 2.0 PC camera=20
[39779.517250] usb 2-1.1: Manufacturer: SQ Tech CO., LTD.
[39779.519033] gspca_main: sq930x-2.14.0 probing 2770:930c

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXojWRAAKCRAw5/Bqldv6
8knuAJ9SVived2HfGdraT8vKHgIh3RiOtACgq3je1WDkSUk2wWjhg9/rirKWrl8=
=/iKo
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
