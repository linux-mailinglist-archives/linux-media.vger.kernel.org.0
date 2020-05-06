Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23DA1C706C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 14:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgEFMff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 08:35:35 -0400
Received: from mout.gmx.net ([212.227.15.18]:56115 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727874AbgEFMfe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 08:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1588768533;
        bh=Xr73ktNkjrePF5k3GOiYt3sracbmXo63lGYpQ3kxqFk=;
        h=X-UI-Sender-Class:From:Subject:To:Date;
        b=goWzY+scUKGXw2z2KubaKGX13/uvPaY2o4PL5nQDOF7EyrD1b6A5ha80pDz2wf9Nw
         yGrRekUXJd4zX/xmn/gkhJie914LXaBbkPkunFdxiCzBDXbbvE3/hj6uSFW+IA5H23
         bxIM+4r/goQeD6HM4J5qQ+ivsI2Oe2FP6BZOR0RQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.3.30] ([94.134.178.247]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1jjJiA0AsN-00Ms3M for
 <linux-media@vger.kernel.org>; Wed, 06 May 2020 14:35:33 +0200
From:   Ralf Schmidt <rds2@gmx.de>
Subject: Missing Protocols ir-keytable Ubuntu 20.04
To:     linux-media@vger.kernel.org
Autocrypt: addr=rds2@gmx.de; keydata=
 mDMEXmI+rRYJKwYBBAHaRw8BAQdAMZmjltwddqAQIWnu46pOsr+sDv7iGnUY/y8qXfpMo8y0
 GlJhbGYgU2NobWlkdCA8cmRzMkBnbXguZGU+iJYEExYIAD4WIQToE+t1HMFpCOJl7IMzIKaO
 jba7PAUCXmI+rQIbAwUJCWYBgAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAzIKaOjba7
 PKAoAQC3bbGpRrEi6QfXWIF0RHT0mp4PxxvQa1/3M4ZORcnumwD+NbHApFKsBbiX8alsyooD
 kuSkDz16T+IeULB8gofDgwG4OAReYj6tEgorBgEEAZdVAQUBAQdAurRbg5xadJIy/jGayb+3
 lTguVCjmf/wwBv+7zI45UD8DAQgHiH4EGBYIACYWIQToE+t1HMFpCOJl7IMzIKaOjba7PAUC
 XmI+rQIbDAUJCWYBgAAKCRAzIKaOjba7PKPhAQDukCryEBly3Q8pHlUtvb9AILf/0qAxS7ik
 MmvAyGgBXwEAplVs7fPFA5ADvNPW8HlWhXpVdjsCmhKC10xS8oXG/AE=
Message-ID: <6446b77c-e6de-9d0a-2ed3-691481917b80@gmx.de>
Date:   Wed, 6 May 2020 14:35:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE
X-Provags-ID: V03:K1:yMHl4j6GcATHfDrADRUSbnNfbGYBg0IwNOc3bE1KMU9yi88B9Tw
 Srxu9vhrF5XTa70XCw0NwJ6Da8wq/n656ZIGWVtYPlFS+Y/ll1ZX8GwOSRbKtNKRhQhzviU
 7Cy2ys3ipeSn0XE5n48NRLwhgK2a1eet9t+J9TI65Gmt2XYxb1quBkZzX2Ke3f2rbxuFBjO
 khmavIUrRsaxkmIBGPfIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TcFDVfVVMtU=:wXx7wN1+hd0EypjXp2Xbl2
 JWdSjigKTNcWWx23X8ErsJYRDRY0jgedDHZs/W5+GfHG3apBLQU1ILfkv7dqrgX9T2+UCqoTy
 5ZCIrGVwUlzBOdUF7nCuzPlXCb6ZFFD1iRFqKZ5R/VsIZYXIKEmxdxtgSYr8POR39ZQTAdCyj
 nGePTxHU92u1TMawhR4FMi8GArwt3eywq97XiAOg4y72XzcXKCtUT5HJ1LioeIDFWWCwCITG3
 2QAmeJV4LLvbVzikNMvrCWtQvRgH1AmRWvo0velrALCdrblkFmj0+F2CtIN33qK6gE5RuGjOu
 crqVYc25S2uA4fgzPOLCmhpDEP+8UpecQmnslx0c4Fk2rJoaoslG5LiKhzp9XuCWKnnx9BUWl
 Tcbd8PaNUerU0dl1JUEW6A8kM35ojuT5acHNYvwLv1Cfmpregb1VOHVKNTr04oCn8LEyYG/tH
 mbc8rY/fpUtOueah5/Gc/8sRuI1LnqyieyCReuQyUW48xj3U09Ya+Aqa8V/UHgUa0WUVxfZpO
 Ab2+Gt+fI0Z+ZYoPfCVr791ErRL1NV4Lzepv5sMIx16WPMmwJ/zMIuuDOS5CS0DgjqwA4iYVa
 hD/e2o7/qc3No2vYilQuIAj3deh1n+vqdFCNFTMmj8GapflhuC3hcLf8niIC+CedtJeAo591x
 SVo2+yuu3e/zJ9zElMGyA0iQqtxcpbzlLGp1QMze9h7aWxvgNqrTsb0Ykigypn2v+ffnUzDB9
 IeARHY2eNKEjWybOCR8EimgYBUj8O556xiOw8mZKJqjXEfUt4RjECFk0gyepUgvuJuiAeL+vJ
 jMKl+cBs8jK/ziy3lWVSiqutcJea4JgcS1XCHkjzySBeoPTu2XsKICbWeGHREqcFctFwajYYz
 oXnYoWCGZoAaCJAPBS+qFcRcN6bGcnwZcdwv/xE7RyCove7ZRDs9bxDUrfaCik1KgnGkPt00+
 iWgGC7pZraE1ROFJynD6RqzUyqie5CVoEEovkggzIQVRr6lX+HayVVIawL+XK02qS7axJRVBT
 IaPI4Hk0ZdDizo2yM2meRxGZc3MvnPPFC3ZDA69y1ItkndtWPod9pEfLAg8AvIPtVK7gHuQLr
 KnpnDzjSQe0tI3shJBO5brQ9vqDAMLy9y1dcYII8x+horDg+X4o/LOWpaYg8NA8sISPizK3aM
 byS/lY5UaSEd+ILlRSDVFVmH3ChJMib/VdjFVRxsxr3Q+it8yMrw9j1jCEF93Afaw/JmE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only working Receiver: all RF X10 Wireless Receiver
All Outputs with just upgraded 5.4.0-29-generic Kernel (Ubuntu 20.04LTS)
and newly installed ir-keytable

ralf@nexus:~$ ir-keytable --version
IR keytable control version 1.18.0

ralf@nexus:~$ sudo ir-keytable -p all
[sudo] Passwort f=C3=BCr ralf:
Die Protokolle f=C3=BCr das Ger=C3=A4t k=C3=B6nnen nicht ge=C3=A4ndert we=
rden
Protokolle ge=C3=A4ndert in other
/dev/lirc0: kein Empfangsger=C3=A4t f=C3=BCr unverarbeitetes Infrarot
BPF-Protokoll rc-mm konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll imon konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll cec konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll xmp konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll sharp konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll rc-6 konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll mce_kbd konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll sanyo konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll nec konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll sony konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll jvc konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll rc-5-sz konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll rc-5 konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll lirc konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll unknown konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden

ralf@nexus:~$ sudo ir-keytable
/sys/class/rc/rc0/ gefunden mit:
=C2=A0=C2=A0=C2=A0 Name: X10 WTI RF receiver
=C2=A0=C2=A0=C2=A0 Treiber: ati_remote
=C2=A0=C2=A0=C2=A0 Standardschl=C3=BCsselcodeabbildung: rc-medion-x10-or2=
x
=C2=A0=C2=A0=C2=A0 Eingabeger=C3=A4t: /dev/input/event11
=C2=A0=C2=A0=C2=A0 LIRC Ger=C3=A4t: /dev/lirc0
=C2=A0=C2=A0=C2=A0 Unterst=C3=BCtzte Kernel-Protokolle: other
=C2=A0=C2=A0=C2=A0 Kernelprotokolle aktivieren: other
=C2=A0=C2=A0=C2=A0 bus: 3, Anbieter/Produkt: 0bc7:0006, Version: 0x0100
=C2=A0=C2=A0=C2=A0 Wiederholungsverz=C3=B6gerung =3D 500 ms, Wiederholung=
speriode =3D 125 ms

Another Remote, without problem in Ubuntu 18.04:

ralf@nexus:~$ ir-keytable
/sys/class/rc/rc0/ gefunden mit:
=C2=A0=C2=A0=C2=A0 Name: cx88 IR (TeVii S464 DVB-S/S2)
=C2=A0=C2=A0=C2=A0 Treiber: cx88xx
=C2=A0=C2=A0=C2=A0 Standardschl=C3=BCsselcodeabbildung: rc-tevii-nec
=C2=A0=C2=A0=C2=A0 Eingabeger=C3=A4t: /dev/input/event9
=C2=A0=C2=A0=C2=A0 LIRC Ger=C3=A4t: /dev/lirc0
=C2=A0=C2=A0=C2=A0 Angehangene BPF-Protokolle: Keine Berechtigung
=C2=A0=C2=A0=C2=A0 Unterst=C3=BCtzte Kernel-Protokolle: lirc
=C2=A0=C2=A0=C2=A0 Kernelprotokolle aktivieren: lirc
=C2=A0=C2=A0=C2=A0 bus: 1, Anbieter/Produkt: d464:9022, Version: 0x0001
=C2=A0=C2=A0=C2=A0 Wiederholungsverz=C3=B6gerung =3D 500 ms, Wiederholung=
speriode =3D 125 ms
ralf@nexus:~$ sudo ir-keytable -p all
[sudo] Passwort f=C3=BCr ralf:
Protokolle ge=C3=A4ndert in lirc
bpf_load_program() err=3DDas Argument ist ung=C3=BCltig
BPF-Protokoll rc-mm konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll imon konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll cec konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll xmp konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll sharp konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll rc-6 konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll mce_kbd konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll sanyo konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll nec konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll sony konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll jvc konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll rc-5-sz konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll rc-5 konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll other konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden
BPF-Protokoll unknown konnte weder in /etc/rc_keymaps/protocols noch in
/lib/udev/rc_keymaps/protocols gefunden werden

ralf@nexus:/lib/udev/rc_keymaps/protocols$ ls -Al
insgesamt 48
-rw-r--r-- 1 root root 3192 M=C3=A4r 24 15:11 grundig.o
-rw-r--r-- 1 root root 4296 M=C3=A4r 24 15:11 imon_rsc.o
-rw-r--r-- 1 root root 6376 M=C3=A4r 24 15:11 manchester.o
-rw-r--r-- 1 root root 4336 M=C3=A4r 24 15:11 pulse_distance.o
-rw-r--r-- 1 root root 4256 M=C3=A4r 24 15:11 pulse_length.o
-rw-r--r-- 1 root root 3280 M=C3=A4r 24 15:11 raw.o
-rw-r--r-- 1 root root 3688 M=C3=A4r 24 15:11 rc_mm.o
-rw-r--r-- 1 root root 3320 M=C3=A4r 24 15:11 xbox-dvd.o


But all the protocols are available

ralf@nexus:/lib/modules/5.4.0-29-generic/kernel/drivers/media/rc$ ls -l
insgesamt 716
-rw-r--r-- 1 root root 25664 Mai=C2=A0 5 01:48 ati_remote.ko
-rw-r--r-- 1 root root 33984 Mai=C2=A0 5 01:48 ene_ir.ko
-rw-r--r-- 1 root root 24896 Mai=C2=A0 5 01:48 fintek-cir.ko
-rw-r--r-- 1 root root 10936 Mai=C2=A0 5 01:48 igorplugusb.ko
-rw-r--r-- 1 root root 17160 Mai=C2=A0 5 01:48 iguanair.ko
-rw-r--r-- 1 root root 61240 Mai=C2=A0 5 01:48 imon.ko
-rw-r--r-- 1 root root 10008 Mai=C2=A0 5 01:48 imon_raw.ko
-rw-r--r-- 1 root root=C2=A0 8496 Mai=C2=A0 5 01:48 ir-imon-decoder.ko
-rw-r--r-- 1 root root=C2=A0 9248 Mai=C2=A0 5 01:48 ir-jvc-decoder.ko
-rw-r--r-- 1 root root 14192 Mai=C2=A0 5 01:48 ir-mce_kbd-decoder.ko
-rw-r--r-- 1 root root=C2=A0 8712 Mai=C2=A0 5 01:48 ir-nec-decoder.ko
-rw-r--r-- 1 root root=C2=A0 9008 Mai=C2=A0 5 01:48 ir-rc5-decoder.ko
-rw-r--r-- 1 root root 11848 Mai=C2=A0 5 01:48 ir-rc6-decoder.ko
-rw-r--r-- 1 root root=C2=A0 7472 Mai=C2=A0 5 01:48 ir-rcmm-decoder.ko
-rw-r--r-- 1 root root 10056 Mai=C2=A0 5 01:48 ir-sanyo-decoder.ko
-rw-r--r-- 1 root root=C2=A0 8984 Mai=C2=A0 5 01:48 ir-sharp-decoder.ko
-rw-r--r-- 1 root root=C2=A0 8976 Mai=C2=A0 5 01:48 ir-sony-decoder.ko
-rw-r--r-- 1 root root 11984 Mai=C2=A0 5 01:48 ir-xmp-decoder.ko
-rw-r--r-- 1 root root 43944 Mai=C2=A0 5 01:48 ite-cir.ko
drwxr-xr-x 2 root root 12288 Mai=C2=A0 5 01:48 keymaps
-rw-r--r-- 1 root root 60640 Mai=C2=A0 5 01:48 mceusb.ko
-rw-r--r-- 1 root root 30384 Mai=C2=A0 5 01:48 nuvoton-cir.ko
-rw-r--r-- 1 root root 78616 Mai=C2=A0 5 01:48 rc-core.ko
-rw-r--r-- 1 root root 11776 Mai=C2=A0 5 01:48 rc-loopback.ko
-rw-r--r-- 1 root root 35664 Mai=C2=A0 5 01:48 redrat3.ko
-rw-r--r-- 1 root root 26528 Mai=C2=A0 5 01:48 serial_ir.ko
-rw-r--r-- 1 root root 16216 Mai=C2=A0 5 01:48 sir_ir.ko
-rw-r--r-- 1 root root 15056 Mai=C2=A0 5 01:48 streamzap.ko
-rw-r--r-- 1 root root 13840 Mai=C2=A0 5 01:48 ttusbir.ko
-rw-r--r-- 1 root root 21880 Mai=C2=A0 5 01:48 winbond-cir.ko
-rw-r--r-- 1 root root 11936 Mai=C2=A0 5 01:48 xbox_remote.ko

Is there anything i can do, to get the protocols available in system,
but missing by ir-keytable, working?

On more thing: because off the removed -d parameter, Remotes like the
Technisat TTS35AI are no longer supported, such Type of Remotes are not
recognized in /sys/class/rc/.


Sorry for my bad English


Kind Regards

Ralf Schmidt


