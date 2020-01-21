Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA90143959
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 10:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgAUJUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 04:20:23 -0500
Received: from gofer.mess.org ([88.97.38.141]:47485 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUJUX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 04:20:23 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F097311A001; Tue, 21 Jan 2020 09:20:21 +0000 (GMT)
Date:   Tue, 21 Jan 2020 09:20:21 +0000
From:   Sean Young <sean@mess.org>
To:     camden lindsay <camden.lindsay+kernel@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: ir-keytable segfault when writing keymap from file
Message-ID: <20200121092021.GA25590@gofer.mess.org>
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
 <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Jan 20, 2020 at 06:47:17PM -0800, camden lindsay wrote:
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

I suspect ir-keytable is segfaulting in the code that reads the file; would
you be able to share the keymap.txt file please? That way I can see if I
can reproduce the problem.

Parsing of the keymap is done in C which can be prone to these sorts of
problems.

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

This would have to be done a in debug build.

Thanks
Sean
