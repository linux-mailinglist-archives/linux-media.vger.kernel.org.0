Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D978D3A445C
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhFKOvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 10:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbhFKOvT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 10:51:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DD7C061574
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 07:49:21 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lriTG-0007nJ-Pa; Fri, 11 Jun 2021 16:49:18 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lriTF-0008UL-RS; Fri, 11 Jun 2021 16:49:17 +0200
Date:   Fri, 11 Jun 2021 16:49:17 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tomasz Maciej Nowak <tmn505@gmail.com>, Sean Young <sean@mess.org>,
        Gon Solo <gonsolo@gmail.com>, Antti Palosaari <crope@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Logilink DVB-T2 stick VG0022A
Message-ID: <20210611144917.26rvhietmpbuuo5p@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6nq3d5fp5k6sact3"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6nq3d5fp5k6sact3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have a Logilink VG0022A stick and when I plug it in I get:

[  426.019171] usb 1-1.3: new high-speed USB device number 5 using xhci-hcd
[  426.171443] usb 1-1.3: New USB device found, idVendor=3D1d19, idProduct=
=3D0100, bcdDevice=3D 1.00
[  426.172184] usb 1-1.3: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[  426.172822] usb 1-1.3: Product: TS Aggregator
[  426.173205] usb 1-1.3: Manufacturer: ITE Tech., Inc.
[  426.173641] usb 1-1.3: SerialNumber: AF0102020700001
[  426.180314] dvb_usb_af9035 1-1.3:1.0: prechip_version=3D83 chip_version=
=3D01 chip_type=3D9306
[  426.181324] usb 1-1.3: dvb_usb_v2: found a 'Logilink VG0022A' in cold st=
ate
[  426.182034] usb 1-1.3: firmware: direct-loading firmware dvb-usb-it9303-=
01.fw
[  426.182666] usb 1-1.3: dvb_usb_v2: downloading firmware from file 'dvb-u=
sb-it9303-01.fw'
[  426.221915] dvb_usb_af9035 1-1.3:1.0: firmware version=3D1.4.0.0
[  426.222456] usb 1-1.3: dvb_usb_v2: found a 'Logilink VG0022A' in warm st=
ate
[  426.224991] usb 1-1.3: dvb_usb_v2: will pass the complete MPEG2 transpor=
t stream to the software demuxer
[  426.225998] dvbdev: DVB: registering new adapter (Logilink VG0022A)
[  426.226551] usb 1-1.3: media controller created
[  426.229845] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' re=
gistered.
[  426.454279] i2c i2c-9: Added multiplexed i2c bus 10
[  426.454726] si2168 9-0067: Silicon Labs Si2168-B40 successfully identifi=
ed
[  426.455377] si2168 9-0067: firmware version: B 4.0.2
[  426.458522] usb 1-1.3: DVB: registering adapter 0 frontend 0 (Silicon La=
bs Si2168)...
[  426.460236] dvbdev: dvb_create_media_entity: media entity 'Silicon Labs =
Si2168' registered.
[  426.469300] si2157 10-0063: Silicon Labs Si2147/2148/2157/2158 successfu=
lly attached
[  426.489642] usb 1-1.3: dvb_usb_v2: 'Logilink VG0022A' successfully initi=
alized and connected

which looks fine. But when I try to use it (using mumudvb2) I get:

[  479.915150] si2168 9-0067: firmware: direct-loading firmware dvb-demod-s=
i2168-b40-01.fw
[  479.915871] si2168 9-0067: downloading firmware from file 'dvb-demod-si2=
168-b40-01.fw'
[  480.436016] si2168 9-0067: firmware version: B 4.0.11
[  480.444089] si2157 10-0063: device is buggy, skipping firmware download
[  480.496756] si2157 10-0063: firmware version: =EF=BF=BD.=EF=BF=BD.255

and it fails to tune.

Do you have a hint?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6nq3d5fp5k6sact3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDDd+oACgkQwfwUeK3K
7AlG1QgAlbmD09EtnkzxLmG29f9cQ1cRNlZkUcMNiTF57xwSw+AZXXS1YogrCexG
73PY3mbHVWVAOK7FZnWwEBu7MXJhoGmuYB/bpPXWOT6mcL0MDdgZtDo5748u8Jxs
B3ruWng/VGF61o7sQdMk/3CumowICUhIRdSpAFgIVzDGgxibSWwLTa8XLQ+xxgaZ
3iHzewdkGmQvuzyrRxEgJD0lXt6DxV/tGgIbvDqqFewIJmikuzIgUH5uQ1eYB0MS
V95JZxk8vIqi02Isn7ixJAPYmkU3ogY1EeE7PKg8jKSNOIsAMe6Lzq/vxR6LFbWy
IgvnwugF22bnh0iK37x0gKhYodvu7w==
=pI7B
-----END PGP SIGNATURE-----

--6nq3d5fp5k6sact3--
