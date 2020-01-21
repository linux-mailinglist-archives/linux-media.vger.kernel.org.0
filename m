Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3C614384C
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 09:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgAUIdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 03:33:31 -0500
Received: from mxa2.seznam.cz ([77.75.76.90]:1402 "EHLO mxa2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgAUIdb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 03:33:31 -0500
Received: from email.seznam.cz
        by email-smtpc5b.ng.seznam.cz (email-smtpc5b.ng.seznam.cz [10.23.13.135])
        id 1cf4d65dcb4f6f381c5cc89a;
        Tue, 21 Jan 2020 09:33:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=beta;
        t=1579595607; bh=EMm9l0ASgO14KkYjhj0wD039JCmK1na7KVJCd0Q+zPQ=;
        h=Received:From:To:Date:MIME-Version:Subject:Message-ID:Priority:
         In-reply-to:References:X-mailer:Content-type:
         Content-transfer-encoding:Content-description;
        b=KqvA7T2iciqjDLXcEfPK+pfY+m4boLT5f+AxnLUlkX2SuFiYsPldyYwl6S7C/IKIp
         DZW6NMWmjp8tpDs2qr3N/UMb2+JZPJgKe1WpCw0UHMheub0TuuUSsT4M7SrUBN9K68
         ksQEzTS4w4QFTV44kVivBjjHYoPDZko4MVAWh8WA=
Received: from [192.168.2.14] (250.68.pool1.tetanet.cz [109.202.68.250])
        by email-relay2.ng.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Tue, 21 Jan 2020 09:33:24 +0100 (CET)  
From:   "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To:     camden lindsay <camden.lindsay+kernel@gmail.com>,
        linux-media@vger.kernel.org
Date:   Tue, 21 Jan 2020 09:33:19 +0100
MIME-Version: 1.0
Subject: Re: ir-keytable segfault when writing keymap from file
Message-ID: <5E26B74F.31588.1CB7D4B3@Frantisek.Rysanek.post.cz>
In-reply-to: <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>, <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
X-mailer: Pegasus Mail for Windows (4.73.639)
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20 Jan 2020 at 18:47, camden lindsay wrote:

> Hello-
> I had a working ir-keytable script that stopped working the other day.
> Investigation led to finding that ir-keytable was segfaulting whenever
> trying to write a keymap from a file.
> 
> [kodiuser@kodiarch ~]$ uname -a
> Linux kodiarch 5.4.13-arch1-1 #1 SMP PREEMPT Fri, 17 Jan 2020 23:09:54
> +0000 x86_64 GNU/Linux
> [kodiuser@kodiarch ~]$
> 
> [kodiuser@kodiarch ~]$ ir-keytable -V
> IR keytable control version 1.18.0
> [kodiuser@kodiarch ~]$
> 
> Here's an example of grabbing an existing keytable entry, putting it
> in a file, but showing that after clearing and trying to load that
> file the segfault.  Segfault also occurs if not clearing first.
> 
> [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r | grep KEY_DOWN
> Enabled kernel protocols: lirc nec
> scancode 0x800f041f = KEY_DOWN (0x6c)
> [kodiuser@kodiarch ir-keytable]$ cat /etc/ir-keytable/keymap.txt
> scancode 0x800f041f = KEY_DOWN (0x6c)
> [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -c
> Old keytable cleared
> [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -w /etc/ir-keytable/keymap.txt
> Segmentation fault
> [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r | grep KEY_DOWN
> Enabled kernel protocols: lirc nec
> [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r
> Enabled kernel protocols: lirc nec
> [kodiuser@kodiarch ir-keytable]$
> 
> 
> 
> And this shows that the segfault still occurs even if i don't clear
> the keytable first (but of course the existing contents of the table
> still exist)
> [kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
> Enabled kernel protocols: lirc nec
> scancode 0x800f041f = KEY_DOWN (0x6c)
> [kodiuser@kodiarch ~]$ cat /etc/ir-keytable/keymap.txt
> scancode 0x800f041f = KEY_DOWN (0x6c)
> [kodiuser@kodiarch ~]$ sudo ir-keytable -w /etc/ir-keytable/keymap.txt
> Segmentation fault
> [kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
> Enabled kernel protocols: lirc nec
> scancode 0x800f041f = KEY_DOWN (0x6c)
> [kodiuser@kodiarch ~]$
> 
> 
> Here is the example syslog output of the segfault:
> Jan 20 18:15:33 kodiarch kernel: ir-keytable[817]: segfault at 0 ip
> 00007f1a958436f5 sp 00007ffe039a5aa8 error 4 in
> libc-2.30.so[7f1a95707000+14d000]
> Jan 20 18:15:33 kodiarch kernel: Code: 00 00 0f 1f 00 31 c0 c5 f8 77
> c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 89 f9 48 89 fa c5 f9 ef
> c0 83 e1 3f 83 f9 20 77 2b <c5> fd 74 0f c5 fd d7 c1 85 c0 0f 85 eb 00
> 00 00 48 83 c7 20 83 e1
> Jan 20 18:15:33 kodiarch systemd[1]: Started Process Core Dump (PID 818/UID 0).
> Jan 20 18:15:34 kodiarch systemd-coredump[819]: Process 817
> (ir-keytable) of user 0 dumped core.
> 
>                                                 Stack trace of thread 817:
>                                                 #0  0x00007f1a958436f5
> __strlen_avx2 (libc.so.6 + 0x1616f5)
>                                                 #1  0x00007f1a95770be3
> __strdup (libc.so.6 + 0x8ebe3)
>                                                 #2  0x0000563150aa43b7
> n/a (ir-keytable + 0x83b7)
>                                                 #3  0x0000563150aa44c6
> n/a (ir-keytable + 0x84c6)
>                                                 #4  0x00007f1a957edfc0
> argp_parse (libc.so.6 + 0x10bfc0)
>                                                 #5  0x0000563150aa2099
> n/a (ir-keytable + 0x6099)
>                                                 #6  0x00007f1a95709153
> __libc_start_main (libc.so.6 + 0x27153)
>                                                 #7  0x0000563150aa325e
> n/a (ir-keytable + 0x725e)
> Jan 20 18:15:34 kodiarch systemd[1]: systemd-coredump@3-818-0.service:
> Succeeded.

Initially I was wondering if the format of the keytable file was 
correct for your version of ir-keytable (because I believe I've seen 
two different formats in the recent past) but looking at that stack 
trace, currently I'm wondering about two possible theories:

a) either ir-keytable is using strlen (by calling strdup(), actually) 
in an unsafe way, trying to find a null character in a buffer that is 
not null-terminated for some reason

b) or, avx2 sounds like something rather hot off the press. Sounds 
like the libc contains several versions of the strlen function and 
patches the fastest flavour in at runtime, depending on the hardware 
it finds itself running on. But... is this avx2-based strlen() 
variant the culprit here? Who knows... I am assuming that your CPU is 
capable of avx2 = that the CPU feature detection in libc works 
fine... And I'm assuming that strlen() is so ubiquitous throughout 
the user space, that it's hardly the culprit here. Your distro 
probably wouldn't be able to boot if this was the problem.

Unfortunately I have no hard data :-) just guesses.

Also, at a more superficial level, what distro is this? Arch? I don't 
know Arch, I'm conservative, most of my machines run Debian oldstable 
:-)  You seem to be using a pretty new kernel, that's why I'm asking. 
Not that the kernel would seem to be implicated in this misbehavior.
But if you're using some bleeding-edge "rolling release", that might 
be a part of the explanation (= perhaps not as thoroughly tested as 
my favourite late-adopter relics).

Frank

