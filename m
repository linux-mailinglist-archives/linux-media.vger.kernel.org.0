Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5573A4DBA
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 10:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhFLInJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 04:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFLInJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 04:43:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6265C061574
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 01:41:09 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lrzCV-0003jp-6G; Sat, 12 Jun 2021 10:41:07 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lrzCT-0003pj-S4; Sat, 12 Jun 2021 10:41:05 +0200
Date:   Sat, 12 Jun 2021 10:41:02 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Tomasz Maciej Nowak <tmn505@gmail.com>, Sean Young <sean@mess.org>,
        Gon Solo <gonsolo@gmail.com>, Antti Palosaari <crope@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: Logilink DVB-T2 stick VG0022A
Message-ID: <20210612084102.u3hvrlfudu3sz3vj@pengutronix.de>
References: <20210611144917.26rvhietmpbuuo5p@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rx3har6iggzjga4c"
Content-Disposition: inline
In-Reply-To: <20210611144917.26rvhietmpbuuo5p@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rx3har6iggzjga4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 11, 2021 at 04:49:17PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> I have a Logilink VG0022A stick and when I plug it in I get:
>=20
> [  426.019171] usb 1-1.3: new high-speed USB device number 5 using xhci-h=
cd
> [  426.171443] usb 1-1.3: New USB device found, idVendor=3D1d19, idProduc=
t=3D0100, bcdDevice=3D 1.00
> [  426.172184] usb 1-1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [  426.172822] usb 1-1.3: Product: TS Aggregator
> [  426.173205] usb 1-1.3: Manufacturer: ITE Tech., Inc.
> [  426.173641] usb 1-1.3: SerialNumber: AF0102020700001
> [  426.180314] dvb_usb_af9035 1-1.3:1.0: prechip_version=3D83 chip_versio=
n=3D01 chip_type=3D9306
> [  426.181324] usb 1-1.3: dvb_usb_v2: found a 'Logilink VG0022A' in cold =
state
> [  426.182034] usb 1-1.3: firmware: direct-loading firmware dvb-usb-it930=
3-01.fw
> [  426.182666] usb 1-1.3: dvb_usb_v2: downloading firmware from file 'dvb=
-usb-it9303-01.fw'
> [  426.221915] dvb_usb_af9035 1-1.3:1.0: firmware version=3D1.4.0.0
> [  426.222456] usb 1-1.3: dvb_usb_v2: found a 'Logilink VG0022A' in warm =
state
> [  426.224991] usb 1-1.3: dvb_usb_v2: will pass the complete MPEG2 transp=
ort stream to the software demuxer
> [  426.225998] dvbdev: DVB: registering new adapter (Logilink VG0022A)
> [  426.226551] usb 1-1.3: media controller created
> [  426.229845] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' =
registered.
> [  426.454279] i2c i2c-9: Added multiplexed i2c bus 10
> [  426.454726] si2168 9-0067: Silicon Labs Si2168-B40 successfully identi=
fied
> [  426.455377] si2168 9-0067: firmware version: B 4.0.2
> [  426.458522] usb 1-1.3: DVB: registering adapter 0 frontend 0 (Silicon =
Labs Si2168)...
> [  426.460236] dvbdev: dvb_create_media_entity: media entity 'Silicon Lab=
s Si2168' registered.
> [  426.469300] si2157 10-0063: Silicon Labs Si2147/2148/2157/2158 success=
fully attached
> [  426.489642] usb 1-1.3: dvb_usb_v2: 'Logilink VG0022A' successfully ini=
tialized and connected
>=20
> which looks fine. But when I try to use it (using mumudvb2) I get:
>=20
> [  479.915150] si2168 9-0067: firmware: direct-loading firmware dvb-demod=
-si2168-b40-01.fw
> [  479.915871] si2168 9-0067: downloading firmware from file 'dvb-demod-s=
i2168-b40-01.fw'
> [  480.436016] si2168 9-0067: firmware version: B 4.0.11
> [  480.444089] si2157 10-0063: device is buggy, skipping firmware download
> [  480.496756] si2157 10-0063: firmware version: =EF=BF=BD.=EF=BF=BD.255
>=20
> and it fails to tune.

Never mind. I use a different anntenna now, and it tunes in just fine
\o/

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rx3har6iggzjga4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDEcxwACgkQwfwUeK3K
7AnidAf8Dzw/P4P8BOyK+4NVnzNFHJzG2dSkkpXbjIFnxtoALQRWITk7PrGeOINI
ywe1eUc0PXbj9gFcyMIeR4GMN7j2jErNFEuFiFnyAfgw91krpHK7weGWyD5pLx/9
O06PxzmaDEoBkvAxaFdxW/YR0aiRyF8APC/Acs3U5GnL9dAjp2hwuhaAksCrpt8i
/1DrvfwtCLJmUJuV0Dcht/qsfZoNQfaLoS3jhCf6VZBs4bDVdqkAE0+mc0gzXCHB
3uIWQykpGOLutm/evRMdji+fW/VJVwnbAfiez30xpx79E8Y/SDA5+zO9TzRTNeWP
XR2LuNmrcFyFzn8Ljv6JuvJDR64Cgw==
=JqSB
-----END PGP SIGNATURE-----

--rx3har6iggzjga4c--
