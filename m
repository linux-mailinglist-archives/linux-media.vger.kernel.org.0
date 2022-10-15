Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E712D5FFB8F
	for <lists+linux-media@lfdr.de>; Sat, 15 Oct 2022 19:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiJORxS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Oct 2022 13:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiJORxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Oct 2022 13:53:17 -0400
X-Greylist: delayed 315 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 15 Oct 2022 10:53:16 PDT
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A390F43E58
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 10:53:16 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E62052.00000000634AF24F.00004403; Sat, 15 Oct 2022 19:47:59 +0200
Date:   Sat, 15 Oct 2022 19:47:59 +0200
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>
Subject: Solved: Re: DVB: Unable to find symbol m88ds3103_attach() [Kernel
 5.18.13]
Message-ID: <20221015174759.GA17155@Debian-50-lenny-64-minimal>
Mail-Followup-To: Helge Kreutzmann <debian@helgefjell.de>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Ben Hutchings <ben@decadent.org.uk>
References: <20220723155707.GA17564@Debian-50-lenny-64-minimal>
 <YuBDIEUokV5vxD6n@valkosipuli.retiisi.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256; protocol="application/pgp-signature"; boundary="=_luckmann.name-17411-1665856079-0001-2"
Content-Disposition: inline
In-Reply-To: <YuBDIEUokV5vxD6n@valkosipuli.retiisi.eu>
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,CK_HELO_GENERIC,
        HELO_DYNAMIC_IPADDR,SPF_HELO_NONE,SPF_NONE,URIBL_SBL_A autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_luckmann.name-17411-1665856079-0001-2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Skari,
hello list members,

the solution is, that CONFIG_TRIM_UNUSED_KSYMS *must not* be enabled.
The error occurs if it is, and vanishes, if it is not (e.g. module
loading works).

I tried to whitelist "m88ds3103_attach", however, the build dies[1] if I
do this (many other builds to find this out suceeded).=20

I'm now on 6.0.2.

So either CONFIG_TRIM_UNUSED_KSYMS is broken (the help referes to=20
possible issues with external modules, not internal) or cx23885 needs
to depend on this option to be off (possibly as workaround).

Please tell me, what else you need to fix the kernel. Is reporting
here sufficient or should I do this elsewhere?

Thanks

        Helge

For reference, below the last mail:

On Tue, Jul 26, 2022 at 10:40:16PM +0300, Sakari Ailus wrote:
> On Sat, Jul 23, 2022 at 05:57:07PM +0200, Helge Kreutzmann wrote:
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

[1] with the following:
  CC [M]  drivers/iio/industrialio-triggered-event.o
  LD [M]  drivers/iio/industrialio.o
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  CC      .vmlinux.export.o
BTF: .tmp_vmlinux.btf: pahole (pahole) is not available
Failed to generate BTF for vmlinux
Try to disable CONFIG_DEBUG_INFO_BTF
make[3]: *** [Makefile:1169: vmlinux] Fehler 1
make[2]: *** [debian/rules:7: build-arch] Fehler 2
dpkg-buildpackage: Fehler: Unterprozess debian/rules binary lieferte Exitst=
atus 2
make[1]: *** [scripts/Makefile.package:83: bindeb-pkg] Fehler 2
make: *** [Makefile:1558: bindeb-pkg] Fehler 2
Version string is: twentytwo.03


--=20
      Dr. Helge Kreutzmann                     debian@helgefjell.de
           Dipl.-Phys.                   http://www.helgefjell.de/debian.php
        64bit GNU powered                     gpg signed mail preferred
           Help keep free software "libre": http://www.ffii.de/

--=_luckmann.name-17411-1665856079-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEbZZfteMW0gNUynuwQbqlJmgq5nAFAmNK8kQACgkQQbqlJmgq
5nBkDw//UtPdcCNV9MwIgbUI6HccNunpRrompANz++3kRmQgqVqjW5AYAZzdTh/0
e4srFvNh0XwEJPcH458G+Mk+r6zcizXwzvsOZVnq7LOcE7UoR7iM7CIFw/HTAB9q
DhuNCMWAWe9AuM/hbcTPzKUXv8pYDaDApD87eciXWV3IY+/G+PUOyhd1M1QOfKDm
1ZjqJB9/iIyHGr5t4a+JyagR99gJRkL5Eo8aSO/IhITyoUXqLu9QeCP4Noz5BVM4
CTVNT4kE4/o1opPBPviQo4iWRPA7CU1MiDtFs6ti/R0wtOzcDEEHDPIb0rJmpZ4K
eqGfIa1snZPwChzQWW09CBJY7z5MJRickyyhyixXJsW87w6L4VfSGhS+eQ16rl2a
Q7NYZbnM2q5IC0O9ve1VJBAkgZBVDilfW6c22iV+7pbg7kjRxPri/qkBuaWyxeWe
oA4rLusmTqrQ1BKwEe6jbkvuR2A2risGiqVhmcd0OGrc7KWASeHewcKyA+2z7z+D
BUIzKulQ+agCcY1bc5qLDOtvzGrG8TYb4neCAO2xggnBrSXpsTScPcjQTN5ijQ5R
uRWg+dWoJLdAecdioQ9jzmzKLyjOSFozRVYU3K/NuOnMeZ0errDsvShoaWFP5adW
3wgA1J4HLSPcUcaa3UycxE1bThK1noM19JNDxM3M9xRMsxKCm9Y=
=8e9R
-----END PGP SIGNATURE-----

--=_luckmann.name-17411-1665856079-0001-2--
