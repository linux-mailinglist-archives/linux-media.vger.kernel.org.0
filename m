Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EF057F030
	for <lists+linux-media@lfdr.de>; Sat, 23 Jul 2022 18:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236274AbiGWQCP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jul 2022 12:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbiGWQCP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jul 2022 12:02:15 -0400
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 23 Jul 2022 09:02:12 PDT
Received: from static.213-239-213-133.clients.your-server.de (luckmann.name [213.239.213.133])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 9DE301F2DD
        for <linux-media@vger.kernel.org>; Sat, 23 Jul 2022 09:02:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
  (uid 502)
  by static.213-239-213-133.clients.your-server.de with local
  id 0000000000E62056.0000000062DC1A53.000045BF; Sat, 23 Jul 2022 17:57:07 +0200
Date:   Sat, 23 Jul 2022 17:57:07 +0200
From:   Helge Kreutzmann <debian@helgefjell.de>
To:     linux-media@vger.kernel.org
Subject: DVB: Unable to find symbol m88ds3103_attach() [Kernel 5.18.13]
Message-ID: <20220723155707.GA17564@Debian-50-lenny-64-minimal>
Mail-Followup-To: Helge Kreutzmann <debian@helgefjell.de>,
        linux-media@vger.kernel.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256; protocol="application/pgp-signature"; boundary="=_luckmann.name-17855-1658591827-0001-2"
Content-Disposition: inline
X-Public-Key-URL: http://www.helgefjell.de/data/debian_neu.asc
X-homepage: http://www.helgefjell.de/debian
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,CK_HELO_GENERIC,
        HELO_DYNAMIC_IPADDR,SPF_HELO_NONE,SPF_NONE,URIBL_SBL_A autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_luckmann.name-17855-1658591827-0001-2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,
I want to operate a Hauppauge WinTV-HR-5524 HD [1]. Despite numerous
attempts / searches /trials, I'm unable to get the sattelite part
operating, I always get (during boot):

Jul 23 08:37:19 twentytwo kernel: [    6.632755] DVB: Unable to find symbol=
 m88ds3103_attach()

The full related boot log is below [2], I can provide more additional=20
lines as necessary of course.

I listed the (related) loaded modules below [3], again I can provide
the full list of course.

Based on grep'ing through the kernel sources[4], I also modprobed =E2=80=A6
but this did not improve the satellite detection[5].

According to the vendor satellite should work.

I can provide more details (also tried applications, ..) as needed.

Thanks for any pointer to get the satellite tuner working!

Greetings

           Helge


-------------------------------------
[1] Hard-/Software:
Hauppauge WinTV-HR-5524 HD
04:00.0 Multimedia video controller: Conexant Systems, Inc. CX23887/8 PCIe =
Broadcast Audio and Video Decoder with 3D Comb (rev 04)
Kernel: Numours, e.g. 5.17.14, currently 5.18.13
CPU: 12 AMD Ryzen

-------------------------------------
[2] Error message during boot
Jul 23 08:37:19 twentytwo kernel: [    6.632755] DVB: Unable to find symbol=
 m88ds3103_attach()

These are the related messages:

Jul 23 08:37:19 twentytwo kernel: [    5.895497] tveeprom: Hauppauge model =
150329, rev C3I6, serial# 4036170902
Jul 23 08:37:19 twentytwo kernel: [    5.895499] tveeprom: MAC address is 0=
0:0d:fe:93:14:96
Jul 23 08:37:19 twentytwo kernel: [    5.895500] tveeprom: tuner model is S=
iLabs Si2157 (idx 186, type 4)
Jul 23 08:37:19 twentytwo kernel: [    5.895501] tveeprom: TV standards PAL=
(B/G) PAL(I) SECAM(L/L') PAL(D/D1/K) ATSC/DVB Digital (eeprom 0xf4)
Jul 23 08:37:19 twentytwo kernel: [    5.895502] tveeprom: audio processor =
is CX23888 (idx 40)
Jul 23 08:37:19 twentytwo kernel: [    5.895502] tveeprom: decoder processo=
r is CX23888 (idx 34)
Jul 23 08:37:19 twentytwo kernel: [    5.895503] tveeprom: has radio, has I=
R receiver, has no IR transmitter
Jul 23 08:37:19 twentytwo kernel: [    5.895503] cx23885: cx23885[0]: haupp=
auge eeprom: model=3D150329
Jul 23 08:37:19 twentytwo kernel: [    5.898744] cx25840 7-0044: cx23888 A/=
V decoder found @ 0x88 (cx23885[0])
Jul 23 08:37:19 twentytwo kernel: [    6.548909] cx25840 7-0044: loaded v4l=
-cx23885-avcore-01.fw firmware (16382 bytes)
Jul 23 08:37:19 twentytwo kernel: [    6.631014] cx23885: cx23885[0]: regis=
tered device video0 [v4l2]
Jul 23 08:37:19 twentytwo kernel: [    6.631032] cx23885: cx23885[0]: regis=
tered device vbi0
Jul 23 08:37:19 twentytwo kernel: [    6.631154] cx23885: cx23885[0]: alsa:=
 registered ALSA audio device
Jul 23 08:37:19 twentytwo kernel: [    6.631157] cx23885: cx23885_dvb_regis=
ter() allocating 1 frontend(s)
Jul 23 08:37:19 twentytwo kernel: [    6.631159] cx23885: cx23885[0]: cx238=
85 based dvb card
Jul 23 08:37:19 twentytwo kernel: [    6.632755] DVB: Unable to find symbol=
 m88ds3103_attach()
Jul 23 08:37:19 twentytwo kernel: [    6.632768] cx23885: cx23885[0]: front=
end initialization failed
Jul 23 08:37:19 twentytwo kernel: [    6.632773] cx23885: cx23885_dvb_regis=
ter() dvb_register failed err =3D -22
Jul 23 08:37:19 twentytwo kernel: [    6.632779] cx23885: cx23885_dev_setup=
() Failed to register dvb adapters on VID_B
Jul 23 08:37:19 twentytwo kernel: [    6.632784] cx23885: cx23885_dvb_regis=
ter() allocating 1 frontend(s)
Jul 23 08:37:19 twentytwo kernel: [    6.632785] cx23885: cx23885[0]: cx238=
85 based dvb card
Jul 23 08:37:19 twentytwo kernel: [    6.639292] i2c i2c-5: Added multiplex=
ed i2c bus 8
Jul 23 08:37:19 twentytwo kernel: [    6.639295] si2168 5-0064: Silicon Lab=
s Si2168-B40 successfully identified
Jul 23 08:37:19 twentytwo kernel: [    6.639296] si2168 5-0064: firmware ve=
rsion: B 4.0.2
Jul 23 08:37:19 twentytwo kernel: [    6.641012] si2157 6-0060: Silicon Lab=
s Si2157 successfully attached
Jul 23 08:37:19 twentytwo kernel: [    6.641017] dvbdev: DVB: registering n=
ew adapter (cx23885[0])
Jul 23 08:37:19 twentytwo kernel: [    6.641018] cx23885 0000:04:00.0: DVB:=
 registering adapter 0 frontend 0 (Silicon Labs Si2168)...
Jul 23 08:37:19 twentytwo kernel: [    6.641216] cx23885: cx23885_dev_check=
revision() Hardware revision =3D 0xd0
Jul 23 08:37:19 twentytwo kernel: [    6.641220] cx23885: cx23885[0]/0: fou=
nd at 0000:04:00.0, rev: 4, irq: 33, latency: 0, mmio: 0xfc600000

-------------------------------------
[3] List of by default loaded modules (exceprt, can provide the entire list)

Module                  Size  Used by
uas                    32768  0
usb_storage            81920  1 uas
si2157                 32768  1
nft_chain_nat          16384  4
si2168                 28672  1
hid_generic            16384  0
cx25840                86016  1
intel_rapl_msr         20480  0
intel_rapl_common      32768  1 intel_rapl_msr
cx23885               278528  1
altera_ci              28672  1 cx23885
tda18271               53248  1 cx23885
altera_stapl           36864  1 cx23885
videobuf2_dvb          16384  1 cx23885
m88ds3103              40960  1 cx23885
edac_mce_amd           61440  0
i2c_mux                16384  2 m88ds3103,si2168
tveeprom               28672  1 cx23885
cx2341x                36864  1 cx23885
snd_hda_codec_realtek   167936  1
dvb_core              180224  4 m88ds3103,altera_ci,cx23885,videobuf2_dvb
snd_hda_codec_generic    98304  1 snd_hda_codec_realtek
rc_core                53248  1 cx23885
ledtrig_audio          16384  1 snd_hda_codec_generic
videobuf2_dma_sg       20480  1 cx23885
snd_hda_codec_hdmi     81920  1
videobuf2_memops       20480  1 videobuf2_dma_sg
kvm                  1052672  0
videobuf2_v4l2         40960  1 cx23885
videobuf2_common       77824  5 videobuf2_v4l2,videobuf2_dma_sg,cx23885,vid=
eobuf2_dvb,videobuf2_memops
snd_hda_intel          57344  6
snd_intel_dspcfg       20480  1 snd_hda_intel
crct10dif_pclmul       16384  1
crc32_pclmul           16384  0
ghash_clmulni_intel    16384  0
videodev              303104  5 cx2341x,videobuf2_v4l2,videobuf2_common,cx2=
3885,cx25840
snd_hda_codec         180224  4 snd_hda_codec_generic,snd_hda_codec_hdmi,sn=
d_hda_intel,snd_hda_codec_realtek
mc                     65536  6 videodev,si2157,videobuf2_v4l2,dvb_core,vid=
eobuf2_common,cx25840
snd_hda_core          110592  5 snd_hda_codec_generic,snd_hda_codec_hdmi,sn=
d_hda_intel,snd_hda_codec,snd_hda_codec_realtek
regmap_i2c             16384  1 m88ds3103
aesni_intel           380928  0
snd_hwdep              16384  1 snd_hda_codec
snd_pcm_oss            69632  0
snd_mixer_oss          28672  1 snd_pcm_oss
snd_pcm               151552  7 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_co=
dec,snd_pcm_oss,cx23885,snd_hda_core
snd_timer              49152  1 snd_pcm
efi_pstore             16384  0
pcspkr                 16384  0
sr_mod                 28672  0
snd                   118784  24 snd_hda_codec_generic,snd_hda_codec_hdmi,s=
nd_hwdep,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek,snd_timer,snd_pc=
m_oss,cx23885,snd_pcm,snd_mixer_oss
soundcore              16384  1 snd
ccp                   126976  0
i2c_piix4              36864  0
k10temp                16384  0
video                  57344  0
button                 24576  0
fuse                  155648  5
configfs               53248  1
linear                 20480  0
amdgpu               8110080  4
drm_ttm_helper         16384  1 amdgpu
ttm                    90112  2 amdgpu,drm_ttm_helper
gpu_sched              49152  1 amdgpu
i2c_algo_bit           16384  1 amdgpu
evdev                  28672  3
drm_kms_helper        299008  3 amdgpu
crc32c_intel           24576  21
serio_raw              20480  0
drm                   548864  8 gpu_sched,drm_kms_helper,amdgpu,drm_ttm_hel=
per,ttm

-------------------------------------
[4] Grepping the kernel sources for m88ds3103_attach:

grep: debian/linux-image-dbg/usr/lib/debug/lib/modules/5.18.13/kernel/drive=
rs/media/dvb-frontends/m88ds3103.ko: =C3=9Cbereinstimmungen in Bin=C3=A4rda=
tei
grep: debian/linux-image/lib/modules/5.18.13/kernel/drivers/media/pci/cx238=
85/cx23885.ko: =C3=9Cbereinstimmungen in Bin=C3=A4rdatei
grep: debian/linux-image/lib/modules/5.18.13/kernel/drivers/media/pci/smipc=
ie/smipcie.ko: =C3=9Cbereinstimmungen in Bin=C3=A4rdatei
grep: debian/linux-image/lib/modules/5.18.13/kernel/drivers/media/dvb-front=
ends/m88ds3103.ko: =C3=9Cbereinstimmungen in Bin=C3=A4rdatei
debian/linux-image/lib/modules/5.18.13/modules.symbols:alias symbol:m88ds31=
03_attach m88ds3103
grep: drivers/media/pci/cx23885/cx23885.ko: =C3=9Cbereinstimmungen in Bin=
=C3=A4rdatei
grep: drivers/media/pci/cx23885/cx23885-dvb.o: =C3=9Cbereinstimmungen in Bi=
n=C3=A4rdatei
drivers/media/pci/cx23885/cx23885-dvb.c:                        fe0->dvb.fr=
ontend =3D dvb_attach(m88ds3103_attach,
drivers/media/pci/cx23885/cx23885-dvb.c:                fe0->dvb.frontend =
=3D dvb_attach(m88ds3103_attach,
drivers/media/pci/cx23885/cx23885-dvb.c:                        fe0->dvb.fr=
ontend =3D dvb_attach(m88ds3103_attach,
grep: drivers/media/pci/cx23885/cx23885.prelink.o: =C3=9Cbereinstimmungen i=
n Bin=C3=A4rdatei
grep: drivers/media/pci/smipcie/smipcie.ko: =C3=9Cbereinstimmungen in Bin=
=C3=A4rdatei
grep: drivers/media/pci/smipcie/smipcie.prelink.o: =C3=9Cbereinstimmungen i=
n Bin=C3=A4rdatei
drivers/media/pci/smipcie/smipcie-main.c:       port->fe =3D dvb_attach(m88=
ds3103_attach,
drivers/media/pci/smipcie/smipcie-main.c:       port->fe =3D dvb_attach(m88=
ds3103_attach,
grep: drivers/media/pci/smipcie/smipcie-main.o: =C3=9Cbereinstimmungen in B=
in=C3=A4rdatei
grep: drivers/media/dvb-frontends/m88ds3103.ko: =C3=9Cbereinstimmungen in B=
in=C3=A4rdatei
grep: drivers/media/dvb-frontends/m88ds3103.o: =C3=9Cbereinstimmungen in Bi=
n=C3=A4rdatei
drivers/media/dvb-frontends/.m88ds3103.o.cmd:    $(wildcard include/ksym/m8=
8ds3103_attach) \
drivers/media/dvb-frontends/m88ds3103.c:struct dvb_frontend *m88ds3103_atta=
ch(const struct m88ds3103_config *cfg,
drivers/media/dvb-frontends/m88ds3103.c:EXPORT_SYMBOL(m88ds3103_attach);
grep: drivers/media/dvb-frontends/m88ds3103.prelink.o: =C3=9Cbereinstimmung=
en in Bin=C3=A4rdatei
drivers/media/dvb-frontends/m88ds3103.h: * m88ds3103_attach - Attach a m88d=
s3103 demod
drivers/media/dvb-frontends/m88ds3103.h: * Note: Do not add new m88ds3103_a=
ttach() users! Use I2C bindings instead.
drivers/media/dvb-frontends/m88ds3103.h:extern struct dvb_frontend *m88ds31=
03_attach(
drivers/media/dvb-frontends/m88ds3103.h:static inline struct dvb_frontend *=
m88ds3103_attach(

-------------------------------------
[5] Frequency scanning e.g. with w_scan:

w_scan
w_scan version 20170107 (compiled for DVB API 5.11)
guessing country 'DE', use -c <country> to override
using settings for GERMANY
DVB aerial
DVB-T Europe
scan type TERRESTRIAL, channellist 4
output format vdr-2.0
output charset 'UTF-8', use -C <charset> to override
Info: using DVB adapter auto detection.
        /dev/dvb/adapter0/frontend0 -> TERRESTRIAL "Silicon Labs Si2168": v=
ery good :-))

Using TERRESTRIAL frontend (adapter /dev/dvb/adapter0/frontend0)
-_-_-_-_ Getting frontend capabilities-_-_-_-_
Using DVB API 5.11
frontend 'Silicon Labs Si2168' supports
DVB-T2
INVERSION_AUTO
QAM_AUTO
TRANSMISSION_MODE_AUTO
GUARD_INTERVAL_AUTO
HIERARCHY_AUTO
FEC_AUTO
BANDWIDTH_AUTO not supported, trying 6/7/8 MHz.
FREQ (48.00MHz ... 870.00MHz)
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
Scanning DVB-T...
Scanning 8MHz frequencies...
474000: (time: 00:00.707)
=E2=80=A6
858000: (time: 01:38.459)
Scanning DVB-T2...
474000: (time: 01:40.475)
=E2=80=A6
858000: (time: 03:18.418)

ERROR: Sorry - i couldn't get any working frequency/transponder
 Nothing to scan!!

--=20
      Dr. Helge Kreutzmann                     debian@helgefjell.de
           Dipl.-Phys.                   http://www.helgefjell.de/debian.php
        64bit GNU powered                     gpg signed mail preferred
           Help keep free software "libre": http://www.ffii.de/

--=_luckmann.name-17855-1658591827-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEbZZfteMW0gNUynuwQbqlJmgq5nAFAmLcGksACgkQQbqlJmgq
5nD/tw/8CUnrI0RzBIHAPnjVqT5KW8PNM9+y704H1ptu6MUH4UFRZV137PMu/gKx
S8Z+edFdv/f99SnOW/yNZiZK4WpXvWHHYohDgiDg2BEDH7AKv17U4Z+VASI/OXoh
jspX4r56BHrpKj6fkgi3l4DXexZZsQZx/cYAe8NGW9GfZyqat42rXsM2/zzkdvAc
z0NBh1WFFY2Ha5MU2DllEaaOMAwSC0oEtA9OgtKpl5fSlkwCFq7z1da8JbpkmjbU
XBcBZhcvUN7mzUesZoaipfnZe6qUbPKT4JaP1nnin+xEY+z+g2Xe365g01o8YB+a
LnQHMFAMgw4/9rHrDlKaDiQ2gtkxVQIaz4aZw8yazUA+Y0mAwXq6HC4RdPQOTWPX
AzmCdMTdbiyUMpCGxOX1sTS+sqTwzz3TmPeLi3QtNoXBQuiPVotSlu2gkcsSqb7e
DhKMYTcC8vsOt7tirT/JLy3GMzmJ2Yl1kBMuIXzXqEecshRCUqzSeQH9+Iy1jGK3
Nu2c2Jf0LU7u4lOiIYLE5KnA4illsgsZLScg4dWHTcLokDlQ+Q4yC6zKoXVKADHb
PYLpfk0aW3vrF5sjWO1roY0MbKHWz2yOMSZmjPsDs1nlSyu0sntJ2vvzWmr+D6Wp
ZjDCjlbBh5pfo9SnBN4cl3LaHQAMA4tf2yYBFeFLptX9Q3346BQ=
=EGUh
-----END PGP SIGNATURE-----

--=_luckmann.name-17855-1658591827-0001-2--
