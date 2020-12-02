Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA232CB855
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 10:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388084AbgLBJPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 04:15:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:42940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387797AbgLBJPJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 04:15:09 -0500
Date:   Wed, 2 Dec 2020 10:14:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606900467;
        bh=Dgt5iTIMY/iaz1ayoRftdg3/8nGajSnAFc/aevYTjvw=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=qnqILMc4ytoUITNsS0gmbJHa9tu6ig4VupgIeTuyE8ETdo31ihEi6cXwMUScCMoTa
         w8UR6LqM4K3Ex+jVlb+bZidVX0B+pd7NLW1td5CnSp3uf2s+iaCRp07ChMJU3YTaDV
         sB1O5UUvmGcx4QLeXY7E8fZdB5Jx+HG6LJ5KgK20=
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andry Zinoviev <airmanhip@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: Forward of moderated message
Message-ID: <20201202101423.3ccc5f47@coco.lan>
In-Reply-To: <mailman.0.1606897876.415996.media-workshop@linuxtv.org>
References: <mailman.0.1606897876.415996.media-workshop@linuxtv.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andry,

Em Wed, 02 Dec 2020 08:31:16 +0000
media-workshop-bounces@linuxtv.org escreveu:


FYI,
The right mailing list for those things is linux-media@vger.kernel.org.

> hello I have never encountered problems in Linux so I don=E2=80=99t know =
where to
> write or where to create tickets.
>=20
> I have a TV tuner on Windows, there are no problems with it - all
> frequencies are found and shown, but in Linux it cannot find all
> frequencies (
>=20
> https://linuxtv.org/wiki/index.php/Astrometa_DVB-T2
> with Sony CXD2837ER
>=20
> finds from 722000 frequencies to 778000, but from 786000 to 858000 writes=
 -
> no signal
> DVB-=D0=A1
>=20
> $ uname -a
>=20
> Linux hs0 5.4.0-47-generic #51-Ubuntu SMP Fri Sep 4 19:50:52 UTC 2020
> x86_64 x86_64 x86_64 GNU/Linux
>=20
>=20
> $ sudo w_scan -fc -S3 -Q1 -a /dev/dvb/adapter0/frontend1

FYI, w_scan is nice, but:

- its logic tries to check different options for symbol rate and other
  parameters. So, it is possible that some of the warnings it got are
  due to some tests that it does with wrong parameters, in order to check
  for a signal that it might be on some channel;
- it is slow, as it does a deep scan, testing several different possible
  combinations, with the hope to get "hidden" channels.
- it was not maintained anymore. Its latest version was in Sept, 2017;

-

In the specific case of DVB-C, usually if you have just one frequency
with the correct parameters, the other frequencies will be automatically
recognized by modern scanning tools, as the full set of frequencies,
and their corresponding parameters will be stored on some tables that
are transmitted on all channels (they are at NIT - Network Information=20
Table).

So, you could, for instance, use dvbv5-scan, using a file with just a
single frequency you got from w_scan.

It is worth mentioning that most DVB-C broadcasters will have some
frequencies assigned for bi-directional data transmissions.
Those are used, among other things, for doing firmware updates at
the CATV set top boxes. Such frequencies may via reported the NIT=20
tables, but they won't work, as the drivers and the hardware found=20
on PC won't support it.

>=20
> w_scan -fc -S3 -Q1 -a /dev/dvb/adapter0/frontend1
>=20
> w_scan version 20170107 (compiled for DVB API 5.10)
>=20
> WARNING: could not guess your country. Falling back to 'DE'
>=20
> guessing country 'DE', use -c <country> to override
>=20
> using settings for GERMANY
>=20
> DVB cable
>=20
> DVB-C
>=20
> scan type CABLE, channellist 7
>=20
> output format vdr-2.0
>=20
> WARNING: could not guess your codepage. Falling back to 'UTF-8'
>=20
> output charset 'UTF-8', use -C <charset> to override
>=20
> -_-_-_-_ Getting frontend capabilities-_-_-_-_
>=20
> Using DVB API 5.11
>=20
> frontend 'Sony CXD2837ER DVB-T/T2/C demodulator' supports
>=20
> INVERSION_AUTO
>=20
> QAM_AUTO
>=20
> FEC_AUTO
>=20
> FREQ (42.00MHz ... 1002.00MHz)
>=20
> SRATE (0.870MSym/s ... 11.700MSym/s)
>=20
> -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
>=20
> 73000: sr6956 (time: 00:00.219)
>=20
> 81000: sr6956 (time: 00:05.063)
>=20
> 113000: sr6956 (time: 00:09.671)
>=20
> 121000: sr6956 (time: 00:14.275)
>=20
> 129000: sr6956 (time: 00:18.855)
>=20
> 137000: sr6956 (time: 00:23.483)
>=20
> 145000: sr6956 (time: 00:28.119)
>=20
> 153000: sr6956 (time: 00:32.719)
>=20
> 161000: sr6956 (time: 00:37.327)
>=20
> 169000: sr6956 (time: 00:42.007)
>=20
> 314000: sr6956 (time: 00:46.607)
>=20
> 322000: sr6956 (time: 00:51.243)
>=20
> 330000: sr6956 (time: 00:55.859)
>=20
> 338000: sr6956 (time: 01:00.491)
>=20
> 346000: sr6956 (time: 01:05.107)
>=20
> 354000: sr6956 (time: 01:09.735)
>=20
> 362000: sr6956 (time: 01:14.331)
>=20
> 370000: sr6956 (time: 01:19.015)
>=20
> 378000: sr6956 (time: 01:23.615)
>=20
> 386000: sr6956 (time: 01:28.215)
>=20
> 394000: sr6956 (time: 01:32.847)
>=20
> 402000: sr6956 (time: 01:37.471)
>=20
> 410000: sr6956 (time: 01:42.095)
>=20
> 418000: sr6956 (time: 01:46.723)
>=20
> 426000: sr6956 (time: 01:51.331)
>=20
> 434000: sr6956 (time: 01:55.911)
>=20
> 442000: sr6956 (time: 02:00.515)
>=20
> 450000: sr6956 (time: 02:05.115)
>=20
> 458000: sr6956 (time: 02:09.715)
>=20
> 466000: sr6956 (time: 02:14.342)
>=20
> 474000: sr6956 (time: 02:18.978)
>=20
> 482000: sr6956 (time: 02:23.622)
>=20
> 490000: sr6956 (time: 02:28.214)
>=20
> 498000: sr6956 (time: 02:32.798)
>=20
> 506000: sr6956 (time: 02:37.426)
>=20
> 514000: sr6956 (time: 02:42.054)
>=20
> 522000: sr6956 (time: 02:46.674)
>=20
> 530000: sr6956 (time: 02:51.298)
>=20
> 538000: sr6956 (time: 02:55.926)
>=20
> 546000: sr6956 (time: 03:00.542)
>=20
> 554000: sr6956 (time: 03:05.142)
>=20
> 562000: sr6956 (time: 03:09.790)
>=20
> 570000: sr6956 (time: 03:14.446)
>=20
> 578000: sr6956 (time: 03:19.090)
>=20
> 586000: sr6956 (time: 03:23.714)
>=20
> 594000: sr6956 (time: 03:28.350)
>=20
> 602000: sr6956 (time: 03:32.974)
>=20
> 610000: sr6956 (time: 03:37.594)
>=20
> 618000: sr6956 (time: 03:42.222)
>=20
> 626000: sr6956 (time: 03:46.890)
>=20
> 634000: sr6956 (time: 03:51.486)
>=20
> 642000: sr6956 (time: 03:56.102)
>=20
> 650000: sr6956 (time: 04:00.726)
>=20
> 658000: sr6956 (time: 04:05.366)
>=20
> 666000: sr6956 (time: 04:09.974)
>=20
> 674000: sr6956 (time: 04:14.598)
>=20
> 682000: sr6956 (time: 04:19.222)
>=20
> 690000: sr6956 (time: 04:23.858)
>=20
> 698000: sr6956 (time: 04:28.457)
>=20
> 706000: sr6956 (time: 04:33.049)
>=20
> 714000: sr6956 (time: 04:37.661)
>=20
> 722000: sr6956 (time: 04:42.289)         signal ok: QAM_AUTO f =3D 722000=
 kHz
> S6956C999  (0:0:0)
>=20
>         QAM_AUTO f =3D 722000 kHz S6956C999  (0:0:0) : updating network_i=
d ->
> (0:100:0)
>=20
>         already known: (QAM_AUTO f =3D 722000 kHz S6956C999  (0:100:0)), =
but
> not found by pids
>=20
>         QAM_AUTO f =3D 722000 kHz S6956C999  (0:100:0) : updating tp ids =
->
> (100:100:25)
>=20
>         updating transponder:
>=20
>            (QAM_AUTO f =3D 722000 kHz S6956C999  (100:100:25)) 0x0000
>=20
>         to (QAM_256  f =3D 722000 kHz S6956C0  (100:100:25)) 0x4044
>=20
>         new transponder: (QAM_256  f =3D 730000 kHz S6956C0  (100:100:26))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 738000 kHz S6956C0  (100:100:27))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 746000 kHz S6956C0  (100:100:29))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 754000 kHz S6956C0  (100:100:30))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 762000 kHz S6956C0  (100:100:31))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 770000 kHz S6956C0  (100:100:33))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 778000 kHz S6956C0  (100:100:34))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 786000 kHz S6956C0  (100:100:35))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 794000 kHz S6956C0  (100:100:37))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 802000 kHz S6956C0  (100:100:38))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 810000 kHz S6956C0  (100:100:39))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 818000 kHz S6956C0  (100:100:41))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 826000 kHz S6956C0  (100:100:42))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 834000 kHz S6956C0  (100:100:43))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 842000 kHz S6956C0  (100:100:45))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 850000 kHz S6956C0  (100:100:46))
> 0x4044
>=20
>         new transponder: (QAM_256  f =3D 858000 kHz S6956C0  (100:100:47))
> 0x4044
>=20
> 730000: skipped (already known transponder)
>=20
> 738000: skipped (already known transponder)
>=20
> 746000: skipped (already known transponder)
>=20
> 754000: skipped (already known transponder)
>=20
> 762000: skipped (already known transponder)
>=20
> 770000: skipped (already known transponder)
>=20
> 778000: skipped (already known transponder)
>=20
> 786000: skipped (already known transponder)
>=20
> 794000: skipped (already known transponder)
>=20
> 802000: skipped (already known transponder)
>=20
> 810000: skipped (already known transponder)
>=20
> 818000: skipped (already known transponder)
>=20
> 826000: skipped (already known transponder)
>=20
> 834000: skipped (already known transponder)
>=20
> 842000: skipped (already known transponder)
>=20
> 850000: skipped (already known transponder)
>=20
> 858000: skipped (already known transponder)
>=20
> tune to: QAM_256  f =3D 722000 kHz S6956C0  (100:100:25) (time: 04:46.489)
>=20
> service =3D 001) info (H)
>=20
> service =3D 002) Perviy (H)
>=20
> service =3D 003) Russia_1 (H)
>=20
> service =3D 004) Match! (H)
>=20
> service =3D 005) NTV (H)
>=20
> service =3D 006) Peterburg_5ch (H)
>=20
> service =3D 007) Russia_K (H)
>=20
> service =3D 008) Russia_24 (H)
>=20
> service =3D 009) Karusel (H)
>=20
> service =3D 010) OTR (H)
>=20
> service =3D 011) TVCI (H)
>=20
> service =3D 012) REN (H)
>=20
> service =3D 013) Spas (H)
>=20
> tune to: QAM_256  f =3D 730000 kHz S6956C0  (100:100:26) (time: 04:59.773)
>=20
> service =3D 014) CTC (H)
>=20
> service =3D 015) Domashniy (H)
>=20
> service =3D 016) TV-3 (H)
>=20
> service =3D 017) PYATNICA (H)
>=20
> service =3D 018) Zvezda (H)
>=20
> service =3D 019) Mir (H)
>=20
> service =3D 020) THT (H)
>=20
> service =3D 021) Muz TV (H)
>=20
> service =3D 022) Telekanal 360 (H)
>=20
> service =3D 023) Tv Mytishi (H)
>=20
> tune to: QAM_256  f =3D 738000 kHz S6956C0  (100:100:27) (time: 05:12.769)
>=20
> service =3D 024) YOU (H)
>=20
> service =3D 025) Disney (H)
>=20
> service =3D 026) Leomax 24 (H)
>=20
> service =3D 027) TV 1000 (H)
>=20
> service =3D 028) TV1000 Ru Kino (H)
>=20
> service =3D 029) Yuvelirochka (H)
>=20
> service =3D 030) TV1000 Action (H)
>=20
> service =3D 031) KINO TV (H)
>=20
> service =3D 032) Russkiy Roman (H)
>=20
> service =3D 033) Komedia  (H)
>=20
> service =3D 034) Eurokino (H)
>=20
> service =3D 035) Liubimoe Kino (H)
>=20
> service =3D 036) Shopping live (H)
>=20
> tune to: QAM_256  f =3D 746000 kHz S6956C0  (100:100:29) (time: 05:25.769)
>=20
> service =3D 037) Russkij illuzio (H)
>=20
> service =3D 038) Illuzion + (H)
>=20
> service =3D 039) AMEDIA 1 (H)
>=20
> service =3D 040) AMEDIA 2 (H)
>=20
> service =3D 041) HCTB (H)
>=20
> service =3D 042) Cinema (H)
>=20
> service =3D 043) Mir Seriala (H)
>=20
> service =3D 044) CTC Love (H)
>=20
> service =3D 045) Kinokomediya (H)
>=20
> service =3D 046) Kinomiks (H)
>=20
> service =3D 047) Rodnoe kino (H)
>=20
> service =3D 048) 8 kanal (H)
>=20
> tune to: QAM_256  f =3D 754000 kHz S6956C0  (100:100:30) (time: 05:38.781)
>=20
> service =3D 049) Indiyskoe kino (H)
>=20
> service =3D 050) Kinoseriya (H)
>=20
> service =3D 051)  Nashe novoe ki (H)
>=20
> service =3D 052) Kinoujas (H)
>=20
> service =3D 053) Myjskoe kino (H)
>=20
> service =3D 054) NTV Serial (H)
>=20
> service =3D 055) Fenix + Kino (H)
>=20
> service =3D 056) Opros 56 (H)
>=20
> service =3D 057) KINOSAT (H)
>=20
> service =3D 058) Rysskiy bestsel (H)
>=20
> service =3D 059) Zee Russia (H)
>=20
> service =3D 060) Detsky (H)
>=20
> tune to: QAM_256  f =3D 762000 kHz S6956C0  (100:100:31) (time: 05:51.769)
>=20
> service =3D 061) Ryzhiy (H)
>=20
> service =3D 062) Detsky Mir (H)
>=20
> service =3D 063) Ani (H)
>=20
> service =3D 064) Malish (H)
>=20
> service =3D 065) Multilandia (H)
>=20
> service =3D 066) Mult muz (H)
>=20
> service =3D 067) KHL (H)
>=20
> service =3D 068) MATCH! STRANA (H)
>=20
> service =3D 069) Matc! Boec (H)
>=20
> service =3D 070) MATCH! IGRA (H)
>=20
> service =3D 071) MATCH! ARENA (H)
>=20
> service =3D 072) Auto plus (H)
>=20
> tune to: QAM_256  f =3D 770000 kHz S6956C0  (100:100:33) (time: 06:04.781)
>=20
> service =3D 073) Viasat Sport (H)
>=20
> service =3D 074) Jivi (H)
>=20
> service =3D 075) Tochka Otryva (H)
>=20
> service =3D 076) Football (H)
>=20
> service =3D 077) M1 Global (H)
>=20
> service =3D 078) Vegetarianskiy (H)
>=20
> service =3D 079) Muzhskoi (H)
>=20
> service =3D 080) Zagorodnaya ziz (H)
>=20
> service =3D 081) Nauka 2.0 (H)
>=20
> service =3D 082) 24 Techno (H)
>=20
> service =3D 083) Viasat Explorer (H)
>=20
> service =3D 084) Dikiy (H)
>=20
> tune to: QAM_256  f =3D 778000 kHz S6956C0  (100:100:34) (time: 06:17.773)
>=20
> WARNING: received garbage data: crc =3D 0x04e7f1d2; expected crc =3D 0x9b=
1462c5
>=20
> increasing filter timeout to 31 secs (pid:0 table_id:0 table_id_ext:-1).
>=20
> service =3D 085) CHE (H)
>=20
> service =3D 086) NTV Pravo (H)
>=20
> service =3D 087)  Moya Planeta (H)
>=20
> service =3D 088)  Viasat Nature (H)
>=20
> service =3D 089) ZOOpark (H)
>=20
> service =3D 090) RTG TV (H)
>=20
> service =3D 091) Ocean TV (H)
>=20
> service =3D 092) Jivaya planeta (H)
>=20
> service =3D 093) 365 Dney TV (H)
>=20
> service =3D 094) Viasat History (H)
>=20
> service =3D 095) Istoriya (H)
>=20
> service =3D 096) Doctor (H)
>=20
> WARNING: received garbage data: crc =3D 0x776b71b8; expected crc =3D 0x64=
3c495e
>=20
> increasing filter timeout to 40 secs (pid:16 table_id:64 table_id_ext:-1).
>=20
> tune to: QAM_256  f =3D 786000 kHz S6956C0  (100:100:35) (time: 06:31.781)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 786000 kHz S6956C999  (100:100:35) (time: 06:42.3=
29)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 794000 kHz S6956C0  (100:100:37) (time: 06:49.968)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 794000 kHz S6956C999  (100:100:37) (time: 06:57.6=
64)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 802000 kHz S6956C0  (100:100:38) (time: 07:05.316)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 802000 kHz S6956C999  (100:100:38) (time: 07:12.9=
64)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 810000 kHz S6956C0  (100:100:39) (time: 07:20.548)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 810000 kHz S6956C999  (100:100:39) (time: 07:28.1=
76)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 818000 kHz S6956C0  (100:100:41) (time: 07:35.836)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 818000 kHz S6956C999  (100:100:41) (time: 07:43.4=
72)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 826000 kHz S6956C0  (100:100:42) (time: 07:51.136)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 826000 kHz S6956C999  (100:100:42) (time: 07:58.8=
28)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 834000 kHz S6956C0  (100:100:43) (time: 08:06.504)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 834000 kHz S6956C999  (100:100:43) (time: 08:14.1=
88)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 842000 kHz S6956C0  (100:100:45) (time: 08:21.900)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 842000 kHz S6956C999  (100:100:45) (time: 08:29.5=
72)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 850000 kHz S6956C0  (100:100:46) (time: 08:37.192)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 850000 kHz S6956C999  (100:100:46) (time: 08:44.8=
40)  (no
> signal)
>=20
> ----------no signal----------
>=20
> tune to: QAM_256  f =3D 858000 kHz S6956C0  (100:100:47) (time: 08:52.456)
>=20
> ----------no signal----------
>=20
> tune to: QAM_AUTO f =3D 858000 kHz S6956C999  (100:100:47) (time: 09:00.0=
76)  (no
> signal)
>=20
> ----------no signal----------
>=20
> (time: 09:07.744) dumping lists (96 services)
>=20
> ..
>=20
> 001) info;H:722000:M256:C:6956:663=3D27:664=3Drus@4:0:0:1:100:25:0
>=20
> 002) Perviy;H:722000:M256:C:6956:650=3D27:651=3Drus@3:652:0:2:100:25:0
>=20
> 003) Russia_1;H:722000:M256:C:6956:657=3D27:658@3:659:0:3:100:25:0
>=20
> 004) Match!;H:722000:M256:C:6956:2001=3D27:2002=3Drus@3:2003:0:4:100:25:0
>=20
> 005) NTV;H:722000:M256:C:6956:2021=3D27:2022=3Drus@3:2023:0:5:100:25:0
>=20
> 006) Peterburg_5ch;H:722000:M256:C:6956:2041=3D27:2042=3Drus@3:2043:0:6:1=
00:25:0
>=20
> 007) Russia_K;H:722000:M256:C:6956:38=3D27:39=3Drus@3:40:0:7:100:25:0
>=20
> 008) Russia_24;H:722000:M256:C:6956:44=3D27:45@3:0:0:8:100:25:0
>=20
> 009) Karusel;H:722000:M256:C:6956:50=3D27:51=3Drus@3:52:0:9:100:25:0
>=20
> 010) OTR;H:722000:M256:C:6956:56=3D27:57@3:0:0:10:100:25:0
>=20
> 011) TVCI;H:722000:M256:C:6956:62=3D27:63=3Drus@3:64:0:11:100:25:0
>=20
> 012) REN;H:722000:M256:C:6956:68=3D27:69@3:70:0:12:100:25:0
>=20
> 013) Spas;H:722000:M256:C:6956:74=3D27:75@3:0:0:13:100:25:0
>=20
> 014) CTC;H:730000:M256:C:6956:80=3D27:81@3:0:0:14:100:26:0
>=20
> 015) Domashniy;H:730000:M256:C:6956:86=3D27:87@3:88:0:15:100:26:0
>=20
> 016) TV-3;H:730000:M256:C:6956:92=3D27:93@3:94:0:16:100:26:0
>=20
> 017) PYATNICA;H:730000:M256:C:6956:98=3D27:99@3:100:0:17:100:26:0
>=20
> 018) Zvezda;H:730000:M256:C:6956:104=3D27:105@3:0:0:18:100:26:0
>=20
> 019) Mir;H:730000:M256:C:6956:110=3D27:111@3:0:0:19:100:26:0
>=20
> 020) THT;H:730000:M256:C:6956:116=3D27:117@3:118:0:20:100:26:0
>=20
> 021) Muz TV;H:730000:M256:C:6956:123=3D27:124@3:0:0:21:100:26:0
>=20
> 022) Telekanal 360;H:730000:M256:C:6956:128=3D27:129=3Drus@3:0:0:22:100:2=
6:0
>=20
> 023) Tv Mytishi;H:730000:M256:C:6956:134=3D27:135=3Drus@3:0:0:23:100:26:0
>=20
> 024) YOU;H:738000:M256:C:6956:140=3D27:141@4:0:0:24:100:27:0
>=20
> 025) Disney;H:738000:M256:C:6956:146=3D27:147=3Drus@3:0:0:25:100:27:0
>=20
> 026) Leomax 24;H:738000:M256:C:6956:152=3D27:153=3Drus@4:0:0:26:100:27:0
>=20
> 027) TV 1000;H:738000:M256:C:6956:158=3D2:159=3Drus@4:0:0:27:100:27:0
>=20
> 028) TV1000 Ru Kino;H:738000:M256:C:6956:164=3D2:165=3Drus@4:0:0:28:100:2=
7:0
>=20
> 029) Yuvelirochka;H:738000:M256:C:6956:171=3D2:172=3Drus@3:0:0:29:100:27:0
>=20
> 030) TV1000 Action;H:738000:M256:C:6956:177=3D2:178@4:0:0:30:100:27:0
>=20
> 031) KINO TV;H:738000:M256:C:6956:183=3D2:184@4:0:0:31:100:27:0
>=20
> 032) Russkiy Roman;H:738000:M256:C:6956:189=3D2:190@4:0:0:32:100:27:0
>=20
> 033) Komedia ;H:738000:M256:C:6956:195=3D2:196@4:0:0:33:100:27:0
>=20
> 034) Eurokino;H:738000:M256:C:6956:201=3D2:202=3Drus@4:0:0:34:100:27:0
>=20
> 035) Liubimoe Kino;H:738000:M256:C:6956:207=3D2:208=3Drus@3:0:0:35:100:27=
:0
>=20
> 036) Shopping live;H:738000:M256:C:6956:213=3D2:214@4:0:0:36:100:27:0
>=20
> 037) Russkij illuzio;H:746000:M256:C:6956:219=3D2:220=3Drus@4:0:0:37:100:=
29:0
>=20
> 038) Illuzion +;H:746000:M256:C:6956:225=3D2:226=3Drus@4:0:0:38:100:29:0
>=20
> 039) AMEDIA 1;H:746000:M256:C:6956:231=3D27:232=3Drus@4:0:0:39:100:29:0
>=20
> 040) AMEDIA 2;H:746000:M256:C:6956:237=3D2:238@4:0:0:40:100:29:0
>=20
> 041) HCTB;H:746000:M256:C:6956:243=3D2:244@3:0:0:41:100:29:0
>=20
> 042) Cinema;H:746000:M256:C:6956:249=3D2:250=3Drus@4:0:0:42:100:29:0
>=20
> 043) Mir Seriala;H:746000:M256:C:6956:255=3D27:256=3Drus@4:0:0:43:100:29:0
>=20
> 044) CTC Love;H:746000:M256:C:6956:261=3D27:262=3Drus@4:263:0:44:100:29:0
>=20
> 045) Kinokomediya;H:746000:M256:C:6956:267=3D27:268=3Drus@4:0:0:45:100:29=
:0
>=20
> 046) Kinomiks;H:746000:M256:C:6956:272=3D27:273@3:0:0:46:100:29:0
>=20
> 047) Rodnoe kino;H:746000:M256:C:6956:278=3D27:279@3:0:0:47:100:29:0
>=20
> 048) 8 kanal;H:746000:M256:C:6956:284=3D27:285@3:0:0:48:100:29:0
>=20
> 049) Indiyskoe kino;H:754000:M256:C:6956:290=3D27:291=3Drus@4:0:0:49:100:=
30:0
>=20
> 050) Kinoseriya;H:754000:M256:C:6956:296=3D27:297@3:0:0:50:100:30:0
>=20
> 051)  Nashe novoe ki;H:754000:M256:C:6956:302=3D27:303=3Drus@4:0:0:51:100=
:30:0
>=20
> 052) Kinoujas;H:754000:M256:C:6956:308=3D27:309=3Drus@4;310:311:0:52:100:=
30:0
>=20
> 053) Myjskoe kino;H:754000:M256:C:6956:314=3D27:315=3Drus@4:0:0:53:100:30=
:0
>=20
> 054) NTV Serial;H:754000:M256:C:6956:320=3D27:321=3Drus@3
> ,321=3Drus:0:0:54:100:30:0
>=20
> 055) Fenix + Kino;H:754000:M256:C:6956:326=3D2:327=3Drus@4:0:0:55:100:30:0
>=20
> 056) Opros 56;H:754000:M256:C:6956:332=3D27:333@3:0:0:56:100:30:0
>=20
> 057) KINOSAT;H:754000:M256:C:6956:338=3D27:339=3Drus@3:0:0:57:100:30:0
>=20
> 058) Rysskiy bestsel;H:754000:M256:C:6956:344=3D2:345=3Drus@4:0:0:58:100:=
30:0
>=20
> 059) Zee Russia;H:754000:M256:C:6956:350=3D27:351=3Drus@4:0:0:59:100:30:0
>=20
> 060) Detsky;H:754000:M256:C:6956:356=3D2:357@3:0:0:60:100:30:0
>=20
> 061) Ryzhiy;H:762000:M256:C:6956:362=3D27:363@3:0:0:61:100:31:0
>=20
> 062) Detsky Mir;H:762000:M256:C:6956:368=3D27:369@3:0:0:62:100:31:0
>=20
> 063) Ani;H:762000:M256:C:6956:374=3D2:375@3:0:0:63:100:31:0
>=20
> 064) Malish;H:762000:M256:C:6956:380=3D27:381=3Drus@4:0:0:64:100:31:0
>=20
> 065) Multilandia;H:762000:M256:C:6956:386=3D27:387@4:0:0:65:100:31:0
>=20
> 066) Mult muz;H:762000:M256:C:6956:392=3D2:393=3Drus@4:0:0:66:100:31:0
>=20
> 067) KHL;H:762000:M256:C:6956:398=3D27:399=3Drus@4:0:0:67:100:31:0
>=20
> 068) MATCH! STRANA;H:762000:M256:C:6956:404=3D27:405=3Drus@4:0:0:68:100:3=
1:0
>=20
> 069) Matc! Boec;H:762000:M256:C:6956:410=3D27:411=3Drus@4:0:0:69:100:31:0
>=20
> 070) MATCH! IGRA;H:762000:M256:C:6956:416=3D27:417=3Drus@4:0:0:70:100:31:0
>=20
> 071) MATCH! ARENA;H:762000:M256:C:6956:422=3D27:423=3Drus@4:0:0:71:100:31=
:0
>=20
> 072) Auto plus;H:762000:M256:C:6956:428=3D27:429=3Drus@4:0:0:72:100:31:0
>=20
> 073) Viasat Sport;H:770000:M256:C:6956:434=3D2:435=3Drus@4:0:0:73:100:33:0
>=20
> 074) Jivi;H:770000:M256:C:6956:440=3D27:441=3Deng@4:0:0:74:100:33:0
>=20
> 075) Tochka Otryva;H:770000:M256:C:6956:445=3D2:446@4:0:0:75:100:33:0
>=20
> 076) Football;H:770000:M256:C:6956:452=3D27:453@3:0:0:76:100:33:0
>=20
> 077) M1 Global;H:770000:M256:C:6956:457=3D27:458=3Drus@4,459=3Deng:0:0:77=
:100:33:0
>=20
> 078) Vegetarianskiy;H:770000:M256:C:6956:463=3D27:464=3Drus@4:0:0:78:100:=
33:0
>=20
> 079) Muzhskoi;H:770000:M256:C:6956:469=3D2:470=3Drus@4:0:0:79:100:33:0
>=20
> 080) Zagorodnaya ziz;H:770000:M256:C:6956:475=3D2:476=3Drus@4:0:0:80:100:=
33:0
>=20
> 081) Nauka 2.0;H:770000:M256:C:6956:482=3D2:484=3Drus@4:0:0:81:100:33:0
>=20
> 082) 24 Techno;H:770000:M256:C:6956:488=3D2:489@4:0:0:82:100:33:0
>=20
> 083) Viasat Explorer;H:770000:M256:C:6956:494=3D2:495@3:0:0:83:100:33:0
>=20
> 084) Dikiy;H:770000:M256:C:6956:500=3D27:501@4:0:0:84:100:33:0
>=20
> 085) CHE;H:778000:M256:C:6956:506=3D27:507@4:508:0:85:100:34:0
>=20
> 086) NTV Pravo;H:778000:M256:C:6956:512=3D27:513=3Drus@4:0:0:86:100:34:0
>=20
> 087)  Moya Planeta;H:778000:M256:C:6956:518=3D2:519=3Drus@3:0:0:87:100:34=
:0
>=20
> 088)  Viasat Nature;H:778000:M256:C:6956:524=3D2:525@3:0:0:88:100:34:0
>=20
> 089) ZOOpark;H:778000:M256:C:6956:530=3D2:531=3Drus@3:0:0:89:100:34:0
>=20
> 090) RTG TV;H:778000:M256:C:6956:536=3D27:537=3Drus@4
> ,538=3Deng,539=3Dtur:0:0:90:100:34:0
>=20
> 091) Ocean TV;H:778000:M256:C:6956:542=3D27:543=3Drus@4:0:0:91:100:34:0
>=20
> 092) Jivaya planeta;H:778000:M256:C:6956:548=3D2:549=3Drus@4:0:0:92:100:3=
4:0
>=20
> 093) 365 Dney TV;H:778000:M256:C:6956:554=3D27:555=3Drus@4:0:0:93:100:34:0
>=20
> 094) Viasat History;H:778000:M256:C:6956:560=3D2:561=3Drus@4
> ,562=3Deng:0:0:94:100:34:0
>=20
> 095) Istoriya;H:778000:M256:C:6956:566=3D2:567=3Drus@4:0:0:95:100:34:0
>=20
> 096) Doctor;H:778000:M256:C:6956:572=3D2:573@3:0:0:96:100:34:0
>=20
> Done, scan time: 09:07.744



Thanks,
Mauro
