Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C60121435C2
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 03:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgAUCra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 21:47:30 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:41680 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgAUCra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 21:47:30 -0500
Received: by mail-ua1-f67.google.com with SMTP id f7so424812uaa.8
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2020 18:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=RgBqxo2OvtGmjVfv3Kepx7wDj7JQ7KQZOP1cmzOYSpc=;
        b=OXh9Zw1GS5ZXxgN86ruk9d42o3UB+ICDimid4ab7M9Y7BhGlJcXFe1OLXdbJ0dgXGT
         vIAUHfJkaDWC2CeSs12bzoKdoqCb2bgrfasj3dOeqUYfkj0oOlx777LpOvQ/Qn/7lKgr
         NSkdajfNHdkCxTLIRVBohZ9hHtxB9RAsLZ8H10+/q2osW4S2PZSSAeLDVzJIfAT8QvtB
         5SohaTeRX6bdmDKzlpK0Wt6wlgn6XeI7IZ3v4uqkQUWBHIVjNMWoBFPswfYH+EYwZVGK
         B8tfE8+j+7/4X4n3gqR0KtjJ8+aMolsPnNDQisAhaFP3oikIBOMKRltX5lE9HE3B3bT/
         JsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=RgBqxo2OvtGmjVfv3Kepx7wDj7JQ7KQZOP1cmzOYSpc=;
        b=FFh2ROdXVV906rfna4Bdi8JjzcVmXUEw3dgxr5Lm/qikf8ScEjZGMyeldldahlmP7y
         i29OpgYklcqNRgy19b3ep+2u3JdYHJFOh6E1mw2UBz85/vrimgR4npWcVAqu/QiBK2C1
         RiSHWYWBmtUuOkHvMLA8qJ3VAANUNGMHTZvxscdr24KIxgPzP1ZzYixP8CQyiUbYRvEp
         /idmo1oe4kLRAtDRxirA3fJC4DuSA6zN7oErjcOPC8PlfrAm+8QTv28aJhcADfWD1kiA
         JgR57QljHcG9D+wo+YTxp4blWdf17x/LhgJlcSur//sZOiUm2/IMekj1Pn7G6mEixA4e
         lVMw==
X-Gm-Message-State: APjAAAVZGWgP3xkKLC8pFyOiLPUVJyHUo8BMJIuqTrf7vhgu1DxRl+B1
        SFifrWA5OAyhuYmcJuImGwlfLXQMOMrc28XWnioR
X-Google-Smtp-Source: APXvYqwys2B8mxg842m/gqzut9g7DQaQZIKmRTIOuvNqZ84Hcvr/YFEcTcbiDhzDsyll66e2xaEcmizi9ugarJXvNfg=
X-Received: by 2002:ab0:3085:: with SMTP id h5mr1690000ual.110.1579574849117;
 Mon, 20 Jan 2020 18:47:29 -0800 (PST)
MIME-Version: 1.0
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
In-Reply-To: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
From:   camden lindsay <camden.lindsay+kernel@gmail.com>
Date:   Mon, 20 Jan 2020 18:47:17 -0800
Message-ID: <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
Subject: ir-keytable segfault when writing keymap from file
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello-
I had a working ir-keytable script that stopped working the other day.
Investigation led to finding that ir-keytable was segfaulting whenever
trying to write a keymap from a file.

[kodiuser@kodiarch ~]$ uname -a
Linux kodiarch 5.4.13-arch1-1 #1 SMP PREEMPT Fri, 17 Jan 2020 23:09:54
+0000 x86_64 GNU/Linux
[kodiuser@kodiarch ~]$

[kodiuser@kodiarch ~]$ ir-keytable -V
IR keytable control version 1.18.0
[kodiuser@kodiarch ~]$

Here's an example of grabbing an existing keytable entry, putting it
in a file, but showing that after clearing and trying to load that
file the segfault.  Segfault also occurs if not clearing first.

[kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r | grep KEY_DOWN
Enabled kernel protocols: lirc nec
scancode 0x800f041f = KEY_DOWN (0x6c)
[kodiuser@kodiarch ir-keytable]$ cat /etc/ir-keytable/keymap.txt
scancode 0x800f041f = KEY_DOWN (0x6c)
[kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -c
Old keytable cleared
[kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -w /etc/ir-keytable/keymap.txt
Segmentation fault
[kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r | grep KEY_DOWN
Enabled kernel protocols: lirc nec
[kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r
Enabled kernel protocols: lirc nec
[kodiuser@kodiarch ir-keytable]$



And this shows that the segfault still occurs even if i don't clear
the keytable first (but of course the existing contents of the table
still exist)
[kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
Enabled kernel protocols: lirc nec
scancode 0x800f041f = KEY_DOWN (0x6c)
[kodiuser@kodiarch ~]$ cat /etc/ir-keytable/keymap.txt
scancode 0x800f041f = KEY_DOWN (0x6c)
[kodiuser@kodiarch ~]$ sudo ir-keytable -w /etc/ir-keytable/keymap.txt
Segmentation fault
[kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
Enabled kernel protocols: lirc nec
scancode 0x800f041f = KEY_DOWN (0x6c)
[kodiuser@kodiarch ~]$


Here is the example syslog output of the segfault:
Jan 20 18:15:33 kodiarch kernel: ir-keytable[817]: segfault at 0 ip
00007f1a958436f5 sp 00007ffe039a5aa8 error 4 in
libc-2.30.so[7f1a95707000+14d000]
Jan 20 18:15:33 kodiarch kernel: Code: 00 00 0f 1f 00 31 c0 c5 f8 77
c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 89 f9 48 89 fa c5 f9 ef
c0 83 e1 3f 83 f9 20 77 2b <c5> fd 74 0f c5 fd d7 c1 85 c0 0f 85 eb 00
00 00 48 83 c7 20 83 e1
Jan 20 18:15:33 kodiarch systemd[1]: Started Process Core Dump (PID 818/UID 0).
Jan 20 18:15:34 kodiarch systemd-coredump[819]: Process 817
(ir-keytable) of user 0 dumped core.

                                                Stack trace of thread 817:
                                                #0  0x00007f1a958436f5
__strlen_avx2 (libc.so.6 + 0x1616f5)
                                                #1  0x00007f1a95770be3
__strdup (libc.so.6 + 0x8ebe3)
                                                #2  0x0000563150aa43b7
n/a (ir-keytable + 0x83b7)
                                                #3  0x0000563150aa44c6
n/a (ir-keytable + 0x84c6)
                                                #4  0x00007f1a957edfc0
argp_parse (libc.so.6 + 0x10bfc0)
                                                #5  0x0000563150aa2099
n/a (ir-keytable + 0x6099)
                                                #6  0x00007f1a95709153
__libc_start_main (libc.so.6 + 0x27153)
                                                #7  0x0000563150aa325e
n/a (ir-keytable + 0x725e)
Jan 20 18:15:34 kodiarch systemd[1]: systemd-coredump@3-818-0.service:
Succeeded.


Thoughts/troiubleshooting suggestions?

Many thanks
Camden
