Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806D358AEB4
	for <lists+linux-media@lfdr.de>; Fri,  5 Aug 2022 19:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237545AbiHERO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Aug 2022 13:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235425AbiHERO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Aug 2022 13:14:28 -0400
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 61FD51571B
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 10:14:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E62055.0000000062ED4FF0.00002D24; Fri, 05 Aug 2022 19:14:24 +0200
Date:   Fri, 5 Aug 2022 19:14:24 +0200
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: DVB: Unable to find symbol m88ds3103_attach() [Kernel 5.18.13]
Message-ID: <20220805171423.GA11481@Debian-50-lenny-64-minimal>
Mail-Followup-To: Helge Kreutzmann <debian@helgefjell.de>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
References: <20220723155707.GA17564@Debian-50-lenny-64-minimal>
 <YuBDIEUokV5vxD6n@valkosipuli.retiisi.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256; protocol="application/pgp-signature"; boundary="=_luckmann.name-11556-1659719664-0001-2"
Content-Disposition: inline
In-Reply-To: <YuBDIEUokV5vxD6n@valkosipuli.retiisi.eu>
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,CK_HELO_GENERIC,
        HELO_DYNAMIC_IPADDR,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_luckmann.name-11556-1659719664-0001-2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sakari,
On Tue, Jul 26, 2022 at 10:40:16PM +0300, Sakari Ailus wrote:
> On Sat, Jul 23, 2022 at 05:57:07PM +0200, Helge Kreutzmann wrote:
> > Hello,
> > I want to operate a Hauppauge WinTV-HR-5524 HD [1]. Despite numerous
> > attempts / searches /trials, I'm unable to get the sattelite part
> > operating, I always get (during boot):
> >=20
> > Jul 23 08:37:19 twentytwo kernel: [    6.632755] DVB: Unable to find sy=
mbol m88ds3103_attach()
> >=20
> > The full related boot log is below [2], I can provide more additional=
=20
> > lines as necessary of course.
> >=20
> > I listed the (related) loaded modules below [3], again I can provide
> > the full list of course.
> >=20
> > Based on grep'ing through the kernel sources[4], I also modprobed =E2=
=80=A6
> > but this did not improve the satellite detection[5].
> >=20
> > According to the vendor satellite should work.
> >=20
> > I can provide more details (also tried applications, ..) as needed.
> >=20
> > Thanks for any pointer to get the satellite tuner working!
>=20
> Looking at the problem, I guess this looks like something that shouldn't
> generally happen.
>=20
> Have you tried removing cx23885 module and loading it again? It would seem
> lake in lsmod listing the module is there but somehow the symbol isn't
> found. I can't immediately think what else could cause this, than not bei=
ng
> able to load the needed module when the symbol is looked up.

As stated, I cannot remove it. Therefor I blacklisted and manually
loaded it afterwards using modprobe:

[16978.826717] DVB: Unable to find symbol m88ds3103_attach()
[16978.826969] cx23885: cx23885[0]: frontend initialization failed
[16978.827179] cx23885: cx23885_dvb_register() dvb_register failed err =3D =
-22
[16978.827392] cx23885: cx23885_dev_setup() Failed to register dvb adapters=
 on VID_B

In the system logs I get the follwing output:
[16977.733011] cx23885: cx23885 driver version 0.0.4 loaded
[16977.733043] cx23885 0000:04:00.0: enabling device (0000 -> 0002)
[16977.733115] cx23885: CORE cx23885[0]: subsystem: 0070:f038, board: Haupp=
auge WinTV-HVR5525 [card=3D52,autodetected]
[16978.082968] tveeprom: Hauppauge model 150329, rev C3I6, serial# 40361709=
02
[16978.082972] tveeprom: MAC address is 00:0d:fe:93:14:96
[16978.082973] tveeprom: tuner model is SiLabs Si2157 (idx 186, type 4)
[16978.082975] tveeprom: TV standards PAL(B/G) PAL(I) SECAM(L/L') PAL(D/D1/=
K) ATSC/DVB Digital (eeprom 0xf4)
[16978.082977] tveeprom: audio processor is CX23888 (idx 40)
[16978.082978] tveeprom: decoder processor is CX23888 (idx 34)
[16978.082978] tveeprom: has radio, has IR receiver, has no IR transmitter
[16978.082979] cx23885: cx23885[0]: hauppauge eeprom: model=3D150329
[16978.090677] cx25840 7-0044: cx23888 A/V decoder found @ 0x88 (cx23885[0])
[16978.739631] cx25840 7-0044: loaded v4l-cx23885-avcore-01.fw firmware (16=
382 bytes)
[16978.821857] cx23885: cx23885[0]: registered device video0 [v4l2]
[16978.821897] cx23885: cx23885[0]: registered device vbi0
[16978.822115] cx23885: cx23885[0]: alsa: registered ALSA audio device
[16978.822117] cx23885: cx23885_dvb_register() allocating 1 frontend(s)
[16978.822119] cx23885: cx23885[0]: cx23885 based dvb card
[16978.826717] DVB: Unable to find symbol m88ds3103_attach()
[16978.826969] cx23885: cx23885[0]: frontend initialization failed
[16978.827179] cx23885: cx23885_dvb_register() dvb_register failed err =3D =
-22
[16978.827392] cx23885: cx23885_dev_setup() Failed to register dvb adapters=
 on VID_B
[16978.827605] cx23885: cx23885_dvb_register() allocating 1 frontend(s)
[16978.827606] cx23885: cx23885[0]: cx23885 based dvb card
[16978.834157] i2c i2c-5: Added multiplexed i2c bus 8
[16978.834160] si2168 5-0064: Silicon Labs Si2168-B40 successfully identifi=
ed
[16978.834161] si2168 5-0064: firmware version: B 4.0.2
[16978.836087] si2157 6-0060: Silicon Labs Si2157 successfully attached
[16978.836095] dvbdev: DVB: registering new adapter (cx23885[0])
[16978.836096] cx23885 0000:04:00.0: DVB: registering adapter 0 frontend 0 =
(Silicon Labs Si2168)...
[16978.836334] cx23885: cx23885_dev_checkrevision() Hardware revision =3D 0=
xd0
[16978.836339] cx23885: cx23885[0]/0: found at 0000:04:00.0, rev: 4, irq: 3=
3, latency: 0, mmio: 0xfc600000

Btw. I just upgraded to kernel 5.18.15, if that matters.

Thanks for any pointers / help.=20

Greetings
            Helge

--=20
      Dr. Helge Kreutzmann                     debian@helgefjell.de
           Dipl.-Phys.                   http://www.helgefjell.de/debian.php
        64bit GNU powered                     gpg signed mail preferred
           Help keep free software "libre": http://www.ffii.de/

--=_luckmann.name-11556-1659719664-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEbZZfteMW0gNUynuwQbqlJmgq5nAFAmLtT+oACgkQQbqlJmgq
5nCnEg//fWUiDjLM/ZunTjJvPBDr9EjgbEXeMpj8ATnSx/oTublk1W3L7tQ8oytI
r3g32fzt/Mrrjw7niMPKJJ7Ky0AC1oA8uFpvBd7FRC3aX+Io/nCvMJDuTN1BIaBp
OuzbsDBiz57aUGou8BXjPsnVJuTtYTXFXozcqwKs9kEt/nDlvhs/f0v75yklt1oq
lkkjs9UVtT30VQJt2g2pDxm/yeUKzMTB6NCfYcwoByzBgk0EbVHIZ2geAl4VcH0Z
jvwnJ2HAb6PTeeqdH9UdcV91x1W1AiErMnu30GB0qHWRfzQ+sGPecRup7SvKzME+
tarJnc7+hyfMsZoERAlkOTCPiyzfQHBuvju6qrWQ9OhrrfQBv2T/NhW9KescLae8
ZjEfsR/3Eq174TClPtREhKtTbmsm/CvC7bk5YqOCxcAZ4qfFqOCPgVFv+A341xpp
w3D/bn8bQbjXaWstkwSrple0yNCEUq+QV+Jsg2XOrSkbJUr34y5FhMKFbE8NG5kE
V6XJyHj6xcSCfzPTFv99RL7ikPaZWQeNwd7bPej+b4S1jlTi6e878o56qb8Ojoz/
69CP8FO3a8sLYCh2aKUCOvsgdZU9yDvHG2b7INTt7yUYJF/xbtEakt0sS2i9EUuu
jQVPjfk3eValS2fVAkkxMw9VWfmVGvXVheb/SBiE31OIXr0yKSA=
=HIRp
-----END PGP SIGNATURE-----

--=_luckmann.name-11556-1659719664-0001-2--
