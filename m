Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA1B14426E
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 17:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgAUQtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 11:49:41 -0500
Received: from gofer.mess.org ([88.97.38.141]:50735 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729030AbgAUQtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 11:49:41 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AA6E4C635E; Tue, 21 Jan 2020 16:49:39 +0000 (GMT)
Date:   Tue, 21 Jan 2020 16:49:39 +0000
From:   Sean Young <sean@mess.org>
To:     camden lindsay <camden.lindsay+kernel@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: ir-keytable segfault when writing keymap from file
Message-ID: <20200121164939.GA32565@gofer.mess.org>
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
 <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
 <20200121092021.GA25590@gofer.mess.org>
 <CABkW7JNsiMPU9SP+pvojWDrDm7ckdrEaOnUmtRw-bhe5iKigsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABkW7JNsiMPU9SP+pvojWDrDm7ckdrEaOnUmtRw-bhe5iKigsg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Camden,

On Tue, Jan 21, 2020 at 07:57:35AM -0800, camden lindsay wrote:
> On Tue, Jan 21, 2020 at 1:20 AM Sean Young <sean@mess.org> wrote:
> > On Mon, Jan 20, 2020 at 06:47:17PM -0800, camden lindsay wrote:
> > > And this shows that the segfault still occurs even if i don't clear
> > > the keytable first (but of course the existing contents of the table
> > > still exist)
> > > [kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
> > > Enabled kernel protocols: lirc nec
> > > scancode 0x800f041f = KEY_DOWN (0x6c)
> > > [kodiuser@kodiarch ~]$ cat /etc/ir-keytable/keymap.txt
> > > scancode 0x800f041f = KEY_DOWN (0x6c)
> > > [kodiuser@kodiarch ~]$ sudo ir-keytable -w /etc/ir-keytable/keymap.txt
> > > Segmentation fault
> > > [kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
> > > Enabled kernel protocols: lirc nec
> > > scancode 0x800f041f = KEY_DOWN (0x6c)
> > > [kodiuser@kodiarch ~]$
> >
> > I suspect ir-keytable is segfaulting in the code that reads the file; would
> > you be able to share the keymap.txt file please? That way I can see if I
> > can reproduce the problem.
> >
> > Parsing of the keymap is done in C which can be prone to these sorts of
> > problems.
> >
> > > Here is the example syslog output of the segfault:
> > > Jan 20 18:15:33 kodiarch kernel: ir-keytable[817]: segfault at 0 ip
> > > 00007f1a958436f5 sp 00007ffe039a5aa8 error 4 in
> > > libc-2.30.so[7f1a95707000+14d000]
> > > Jan 20 18:15:33 kodiarch kernel: Code: 00 00 0f 1f 00 31 c0 c5 f8 77
> > > c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 89 f9 48 89 fa c5 f9 ef
> > > c0 83 e1 3f 83 f9 20 77 2b <c5> fd 74 0f c5 fd d7 c1 85 c0 0f 85 eb 00
> > > 00 00 48 83 c7 20 83 e1
> > > Jan 20 18:15:33 kodiarch systemd[1]: Started Process Core Dump (PID 818/UID 0).
> > > Jan 20 18:15:34 kodiarch systemd-coredump[819]: Process 817
> > > (ir-keytable) of user 0 dumped core.
> > >
> > >                                                 Stack trace of thread 817:
> > >                                                 #0  0x00007f1a958436f5
> > > __strlen_avx2 (libc.so.6 + 0x1616f5)
> > >                                                 #1  0x00007f1a95770be3
> > > __strdup (libc.so.6 + 0x8ebe3)
> > >                                                 #2  0x0000563150aa43b7
> > > n/a (ir-keytable + 0x83b7)
> > >                                                 #3  0x0000563150aa44c6
> > > n/a (ir-keytable + 0x84c6)
> > >                                                 #4  0x00007f1a957edfc0
> > > argp_parse (libc.so.6 + 0x10bfc0)
> > >                                                 #5  0x0000563150aa2099
> > > n/a (ir-keytable + 0x6099)
> > >                                                 #6  0x00007f1a95709153
> > > __libc_start_main (libc.so.6 + 0x27153)
> > >                                                 #7  0x0000563150aa325e
> > > n/a (ir-keytable + 0x725e)
> > > Jan 20 18:15:34 kodiarch systemd[1]: systemd-coredump@3-818-0.service:
> > > Succeeded.
> >
> > This would have to be done a in debug build.
> >
> > Thanks
> > Sean
> 
> 
> 
> Hello, Sean-
> I'd be happy to share the files, I greatly appreciate you looking into
> this.  I'll try attaching them to this email.
> There are two files- one was my original file, the other was my
> attempt to make the most basic file based on a single line of
> ir-keytable -r.

Ok, ir-keytable segfaults because there is no protocol specified. You'll
need something like "# table foobar, type: RC6-MCE" as a first line. Of
course, ir-keytable should not segfault if this is missing. I'll write
a fix for this.

Secondly, there is a new format for rc keymaps written in toml. A new format
was needed to support BPF keymaps and keymaps with multiple protocols
are better supported. See man rc_keymap

It looks like the keymap you are trying to load contains two different
protocols, rc6-mce and something else (nec-x?). Please let me know what
you are trying to do so I can help write a toml keymap.


Sean

