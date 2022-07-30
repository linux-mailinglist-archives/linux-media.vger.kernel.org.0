Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B71585B31
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 17:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbiG3P7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 11:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbiG3P7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 11:59:01 -0400
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 0F061DF5E
        for <linux-media@vger.kernel.org>; Sat, 30 Jul 2022 08:58:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E62056.0000000062E55540.00004CCC; Sat, 30 Jul 2022 17:58:56 +0200
Date:   Sat, 30 Jul 2022 17:58:56 +0200
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: DVB: Unable to find symbol m88ds3103_attach() [Kernel 5.18.13]
Message-ID: <20220730155856.GA15746@Debian-50-lenny-64-minimal>
Mail-Followup-To: Helge Kreutzmann <debian@helgefjell.de>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
References: <20220723155707.GA17564@Debian-50-lenny-64-minimal>
 <YuBDIEUokV5vxD6n@valkosipuli.retiisi.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256; protocol="application/pgp-signature"; boundary="=_luckmann.name-19660-1659196736-0001-2"
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

--=_luckmann.name-19660-1659196736-0001-2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sakari,
thanks for the reply and sorry for the delay in answering.

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

root@twentytwo:~# modprobe -r cx23885
modprobe: FATAL: Module cx23885 is in use.

root@twentytwo:~# lsmod | grep cx23885
cx23885               278528  1
altera_ci              28672  1 cx23885
altera_stapl           36864  1 cx23885
videobuf2_dvb          16384  1 cx23885
m88ds3103              40960  1 cx23885
cx2341x                36864  1 cx23885
tveeprom               28672  1 cx23885
rc_core                53248  1 cx23885
videobuf2_dma_sg       20480  1 cx23885
videobuf2_v4l2         40960  1 cx23885
videobuf2_common       77824  5
videobuf2_v4l2,videobuf2_dma_sg,cx23885,videobuf2_dvb,videobuf2_memops
snd_pcm               151552  6
snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_pcm_oss,cx23885,snd_hda_=
core
snd                   118784  21
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_co=
dec,snd_hda_codec_realtek,snd_timer,snd_pcm_oss,cx23885,snd_pcm,snd_mixer_o=
ss

However, I cannot see any open file which might be related:
root@twentytwo:~# lsof | grep dev|grep video
root@twentytwo:~# lsof | grep dev|grep v4l
root@twentytwo:~# lsof | grep dev|grep vbi

So I'm unable to unload cx23885.

I searched around, but I could not find any other idea to unload this
module.

Greetings

         Helge

--=20
      Dr. Helge Kreutzmann                     debian@helgefjell.de
           Dipl.-Phys.                   http://www.helgefjell.de/debian.php
        64bit GNU powered                     gpg signed mail preferred
           Help keep free software "libre": http://www.ffii.de/

--=_luckmann.name-19660-1659196736-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEbZZfteMW0gNUynuwQbqlJmgq5nAFAmLlVTcACgkQQbqlJmgq
5nAbpQ//Y+eD7oVSFGGUbOzrIvHGOdoKmxUq/5akRUjgSI4HhaHP6hCRvxyZQOxe
xtyQptNfdyeanQWXmKkJM2jC5m4gipe1m/+YwsqLscGVJk10IN52U5WMZgaT/vGD
TOPZSf25ej7jz+ZVBT9mWrLLW3Ouhzxlb+rQbhkbTLnC0tqQEQXcDnnZk345s93s
iGRGaCmWjBkYc35mvynwdkYMqsn/ee7PNgkkphAwJ41lx7UPlF07FaFKpMnGeXtL
QmXZ06qEtk5V9s4Pj/aK+nErJTHvNxbmKDv45BpHz//2IoKiXZw1jcaNu8eGpK2v
TrFwiY5yfwcNVAsspc+duLfDk+o0ImA1UItnDMRby79GX7nVV7Fv0Z6hNVrpfMyO
ql3ezOLx5hUvZw74NdLX8SJfz18RZ7OQFv6xNpV47ouiMVNFYFifRNkouFL5bMLp
fckLKhHTh4gVAX77w935vEqnP/4iAfdNPGPHzd/NAwCUh78wnW90QHws+7BB/1QZ
7YYf8itDxCa5ukTr4uy47flyeOKZ8+VrT+H7KOIxdffmXl7KOAv99iX/v/n9yFnO
N/SQrrENJoB9j+/8BNwxOAqw6EbyI5ZVWBHb+bY3z3+bJrC+TyZ8Gluj72+LezLF
fFWoYN/0QGnpX7fBeXlbhi7kGoQeaMcryREkowQ6cpHd4qEInpc=
=/ASI
-----END PGP SIGNATURE-----

--=_luckmann.name-19660-1659196736-0001-2--
