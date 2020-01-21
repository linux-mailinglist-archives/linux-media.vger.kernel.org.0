Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510C7144112
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 16:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgAUP5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 10:57:48 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:37466 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbgAUP5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 10:57:48 -0500
Received: by mail-vk1-f196.google.com with SMTP id b129so1032828vka.4
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WerSTyCJTi2PVdYBpz6Wrp2NxkGJWJCngvQ+bK96Om8=;
        b=XEwV0EdTn/LhAzlNyhcM4sVSA5aOp9buTylxYAMDLxaQnFfASUmBldnj4Z24amefiC
         Oe+ijXFFUNgb4Kz/b1ZvaP+dbIHlSov9QQrzf2KvcSgWhppdIl+cpuFCVMvPrkOv9aC6
         mNIzJg9C4Xd9rQw6KDsDW78i7n/dNbF5wryW33dzf7cP26buAIuF/Hq9viHQIAjOq5jR
         wEVGjKbJnTeBgG9gJ+g4eVI7SaZXJzO3csaeYFu6PWiPNBUQ2L8SR9xWF6po7e8eo0gg
         JASdlnCOjaSXgYCqzEArIRamT66TVo19K4LI3Q2Vo4ja28lE5A6v1SLsuxiCMnqc0NAL
         CooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WerSTyCJTi2PVdYBpz6Wrp2NxkGJWJCngvQ+bK96Om8=;
        b=tr4F/E6bLh15a4q8XOGxlGo/97U2Xtqwf2Da2huppdjSjA8eI9/Ib6A0Qo3139JsVx
         KKzYdIjABAYBXe7Hh0iQISevCCwhpUwnRUDBGwZ7q1KV6EV9ocin2svx9bFbjAEXZG6j
         0uZCeU3ABbQwD5zcKa4ZvW8K8snWzeaqt4oJzBUyPOKY1k05rpLlSeYww7/vTcx8RvD7
         JFRdMmSc3zVG7Uqu+1CPZtS4ioPC+rmte45StAbyyArVJQcG3jA1qOhPznfLWR5gqx+I
         uizzoBdX0vR9SfosGb/+nW1ttR/WOtYHbg+PciTvOhz0iDILWdn8seOQTwxJcJHELK5r
         d3OA==
X-Gm-Message-State: APjAAAXxsGVXdSOxJjkn0tK51to4FhPgjAYmGRbReJCljS+DOoaO7eSJ
        MC9bI9rXdBlesPXY1FNEh6KNTYB77aUs+UOJBQ3d
X-Google-Smtp-Source: APXvYqw1RkgemXeoRp6lROX8w4lbUl9fwMaf47NY0jZVx4zoF004azgVjbCQ5oFMu/aZLCY0BBI+SK264b8hK7E+onw=
X-Received: by 2002:a1f:264b:: with SMTP id m72mr3291081vkm.51.1579622266906;
 Tue, 21 Jan 2020 07:57:46 -0800 (PST)
MIME-Version: 1.0
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
 <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com> <20200121092021.GA25590@gofer.mess.org>
In-Reply-To: <20200121092021.GA25590@gofer.mess.org>
From:   camden lindsay <camden.lindsay+kernel@gmail.com>
Date:   Tue, 21 Jan 2020 07:57:35 -0800
Message-ID: <CABkW7JNsiMPU9SP+pvojWDrDm7ckdrEaOnUmtRw-bhe5iKigsg@mail.gmail.com>
Subject: Re: ir-keytable segfault when writing keymap from file
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000195a53059ca87816"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000195a53059ca87816
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 21, 2020 at 1:20 AM Sean Young <sean@mess.org> wrote:
>
> Hello,
>
> On Mon, Jan 20, 2020 at 06:47:17PM -0800, camden lindsay wrote:
> > Hello-
> > I had a working ir-keytable script that stopped working the other day.
> > Investigation led to finding that ir-keytable was segfaulting whenever
> > trying to write a keymap from a file.
> >
> > [kodiuser@kodiarch ~]$ uname -a
> > Linux kodiarch 5.4.13-arch1-1 #1 SMP PREEMPT Fri, 17 Jan 2020 23:09:54
> > +0000 x86_64 GNU/Linux
> > [kodiuser@kodiarch ~]$
> >
> > [kodiuser@kodiarch ~]$ ir-keytable -V
> > IR keytable control version 1.18.0
> > [kodiuser@kodiarch ~]$
> >
> > Here's an example of grabbing an existing keytable entry, putting it
> > in a file, but showing that after clearing and trying to load that
> > file the segfault.  Segfault also occurs if not clearing first.
> >
> > [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r | grep KEY_DOWN
> > Enabled kernel protocols: lirc nec
> > scancode 0x800f041f = KEY_DOWN (0x6c)
> > [kodiuser@kodiarch ir-keytable]$ cat /etc/ir-keytable/keymap.txt
> > scancode 0x800f041f = KEY_DOWN (0x6c)
> > [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -c
> > Old keytable cleared
> > [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -w /etc/ir-keytable/keymap.txt
> > Segmentation fault
> > [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r | grep KEY_DOWN
> > Enabled kernel protocols: lirc nec
> > [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -r
> > Enabled kernel protocols: lirc nec
> > [kodiuser@kodiarch ir-keytable]$
> >
> >
> >
> > And this shows that the segfault still occurs even if i don't clear
> > the keytable first (but of course the existing contents of the table
> > still exist)
> > [kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
> > Enabled kernel protocols: lirc nec
> > scancode 0x800f041f = KEY_DOWN (0x6c)
> > [kodiuser@kodiarch ~]$ cat /etc/ir-keytable/keymap.txt
> > scancode 0x800f041f = KEY_DOWN (0x6c)
> > [kodiuser@kodiarch ~]$ sudo ir-keytable -w /etc/ir-keytable/keymap.txt
> > Segmentation fault
> > [kodiuser@kodiarch ~]$ sudo ir-keytable -r | grep KEY_DOWN
> > Enabled kernel protocols: lirc nec
> > scancode 0x800f041f = KEY_DOWN (0x6c)
> > [kodiuser@kodiarch ~]$
>
> I suspect ir-keytable is segfaulting in the code that reads the file; would
> you be able to share the keymap.txt file please? That way I can see if I
> can reproduce the problem.
>
> Parsing of the keymap is done in C which can be prone to these sorts of
> problems.
>
> > Here is the example syslog output of the segfault:
> > Jan 20 18:15:33 kodiarch kernel: ir-keytable[817]: segfault at 0 ip
> > 00007f1a958436f5 sp 00007ffe039a5aa8 error 4 in
> > libc-2.30.so[7f1a95707000+14d000]
> > Jan 20 18:15:33 kodiarch kernel: Code: 00 00 0f 1f 00 31 c0 c5 f8 77
> > c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 89 f9 48 89 fa c5 f9 ef
> > c0 83 e1 3f 83 f9 20 77 2b <c5> fd 74 0f c5 fd d7 c1 85 c0 0f 85 eb 00
> > 00 00 48 83 c7 20 83 e1
> > Jan 20 18:15:33 kodiarch systemd[1]: Started Process Core Dump (PID 818/UID 0).
> > Jan 20 18:15:34 kodiarch systemd-coredump[819]: Process 817
> > (ir-keytable) of user 0 dumped core.
> >
> >                                                 Stack trace of thread 817:
> >                                                 #0  0x00007f1a958436f5
> > __strlen_avx2 (libc.so.6 + 0x1616f5)
> >                                                 #1  0x00007f1a95770be3
> > __strdup (libc.so.6 + 0x8ebe3)
> >                                                 #2  0x0000563150aa43b7
> > n/a (ir-keytable + 0x83b7)
> >                                                 #3  0x0000563150aa44c6
> > n/a (ir-keytable + 0x84c6)
> >                                                 #4  0x00007f1a957edfc0
> > argp_parse (libc.so.6 + 0x10bfc0)
> >                                                 #5  0x0000563150aa2099
> > n/a (ir-keytable + 0x6099)
> >                                                 #6  0x00007f1a95709153
> > __libc_start_main (libc.so.6 + 0x27153)
> >                                                 #7  0x0000563150aa325e
> > n/a (ir-keytable + 0x725e)
> > Jan 20 18:15:34 kodiarch systemd[1]: systemd-coredump@3-818-0.service:
> > Succeeded.
>
> This would have to be done a in debug build.
>
> Thanks
> Sean



Hello, Sean-
I'd be happy to share the files, I greatly appreciate you looking into
this.  I'll try attaching them to this email.
There are two files- one was my original file, the other was my
attempt to make the most basic file based on a single line of
ir-keytable -r.

many thanks
Camden

--000000000000195a53059ca87816
Content-Type: text/plain; charset="US-ASCII"; name="keymap.txt"
Content-Disposition: attachment; filename="keymap.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k5o2a9mm1>
X-Attachment-Id: f_k5o2a9mm1

c2NhbmNvZGUgMHg4MDBmMDQxZiA9IEtFWV9ET1dOICgweDZjKQo=
--000000000000195a53059ca87816
Content-Type: application/octet-stream; name="keymap.txt.wasworking"
Content-Disposition: attachment; filename="keymap.txt.wasworking"
Content-Transfer-Encoding: base64
Content-ID: <f_k5o2a9m60>
X-Attachment-Id: f_k5o2a9m60

c2NhbmNvZGUgMHg4MDBmMDQwMCA9IEtFWV9OVU1FUklDXzAgKDB4MjAwKQpzY2FuY29kZSAweDgw
MGYwNDAxID0gS0VZX05VTUVSSUNfMSAoMHgyMDEpCnNjYW5jb2RlIDB4ODAwZjA0MDIgPSBLRVlf
TlVNRVJJQ18yICgweDIwMikKc2NhbmNvZGUgMHg4MDBmMDQwMyA9IEtFWV9OVU1FUklDXzMgKDB4
MjAzKQpzY2FuY29kZSAweDgwMGYwNDA0ID0gS0VZX05VTUVSSUNfNCAoMHgyMDQpCnNjYW5jb2Rl
IDB4ODAwZjA0MDUgPSBLRVlfTlVNRVJJQ181ICgweDIwNSkKc2NhbmNvZGUgMHg4MDBmMDQwNiA9
IEtFWV9OVU1FUklDXzYgKDB4MjA2KQpzY2FuY29kZSAweDgwMGYwNDA3ID0gS0VZX05VTUVSSUNf
NyAoMHgyMDcpCnNjYW5jb2RlIDB4ODAwZjA0MDggPSBLRVlfTlVNRVJJQ184ICgweDIwOCkKc2Nh
bmNvZGUgMHg4MDBmMDQwOSA9IEtFWV9OVU1FUklDXzkgKDB4MjA5KQpzY2FuY29kZSAweDgwMGYw
NDBhID0gS0VZX0RFTEVURSAoMHg2ZikKc2NhbmNvZGUgMHg4NDc0OTAgPSBLRVlfRU5URVIgKDB4
MWMpCnNjYW5jb2RlIDB4ODAwZjA0MGMgPSBLRVlfU0xFRVAgKDB4OGUpCnNjYW5jb2RlIDB4ODAw
ZjA0MGQgPSBLRVlfTUVESUEgKDB4ZTIpCnNjYW5jb2RlIDB4ODAwZjA0MGUgPSBLRVlfTVVURSAo
MHg3MSkKc2NhbmNvZGUgMHg4MDBmMDQwZiA9IEtFWV9JTkZPICgweDE2NikKc2NhbmNvZGUgMHg4
MDBmMDQxMCA9IEtFWV9WT0xVTUVVUCAoMHg3MykKc2NhbmNvZGUgMHg4MDBmMDQxMSA9IEtFWV9W
T0xVTUVET1dOICgweDcyKQpzY2FuY29kZSAweDgwMGYwNDEyID0gS0VZX0NIQU5ORUxVUCAoMHgx
OTIpCnNjYW5jb2RlIDB4ODAwZjA0MTMgPSBLRVlfQ0hBTk5FTERPV04gKDB4MTkzKQpzY2FuY29k
ZSAweDg0NzQ4YSA9IEtFWV9GQVNURk9SV0FSRCAoMHhkMCkKc2NhbmNvZGUgMHg4NDc0N2UgPSBL
RVlfUkVXSU5EICgweGE4KQpzY2FuY29kZSAweDg0NzQ3ZiA9IEtFWV9QTEFZICgweGNmKQpzY2Fu
Y29kZSAweDg0NzQ5OSA9IEtFWV9SRUNPUkQgKDB4YTcpCnNjYW5jb2RlIDB4ODQ3NDhjID0gS0VZ
X1BBVVNFICgweDc3KQpzY2FuY29kZSAweDg0NzQ3YyA9IEtFWV9YICgweDJkKSAKc2NhbmNvZGUg
MHg4NDc0N2QgPSBLRVlfTkVYVFNPTkcgKDB4MTk3KQpzY2FuY29kZSAweDg0NzQ3YiA9IEtFWV9Q
UkVWSU9VU1NPTkcgKDB4MTljKQpzY2FuY29kZSAweDgwMGYwNDFjID0gS0VZX05VTUVSSUNfUE9V
TkQgKDB4MjBiKQpzY2FuY29kZSAweDgwMGYwNDFkID0gS0VZX05VTUVSSUNfU1RBUiAoMHgyMGEp
CnNjYW5jb2RlIDB4ODQ3NDhlID0gS0VZX1VQICgweDY3KQpzY2FuY29kZSAweDg0NzQ5MiA9IEtF
WV9ET1dOICgweDZjKQpzY2FuY29kZSAweDg0NzQ4ZiA9IEtFWV9MRUZUICgweDY5KQpzY2FuY29k
ZSAweDg0NzQ5MSA9IEtFWV9SSUdIVCAoMHg2YSkKc2NhbmNvZGUgMHg4MDBmMDQyNCA9IEtFWV9E
VkQgKDB4MTg1KQpzY2FuY29kZSAweDgwMGYwNDI1ID0gS0VZX1RVTkVSICgweDE4MikKc2NhbmNv
ZGUgMHg4MDBmMDQyNiA9IEtFWV9FUEcgKDB4MTZkKQpzY2FuY29kZSAweDgwMGYwNDI3ID0gS0VZ
X1pPT00gKDB4MTc0KQpzY2FuY29kZSAweDgwMGYwNDMyID0gS0VZX01PREUgKDB4MTc1KQpzY2Fu
Y29kZSAweDgwMGYwNDMzID0gS0VZX1BSRVNFTlRBVElPTiAoMHgxYTkpCnNjYW5jb2RlIDB4ODAw
ZjA0MzQgPSBLRVlfRUpFQ1RDRCAoMHhhMSkKc2NhbmNvZGUgMHg4MDBmMDQzYSA9IEtFWV9CUklH
SFRORVNTVVAgKDB4ZTEpCnNjYW5jb2RlIDB4ODAwZjA0NDYgPSBLRVlfVFYgKDB4MTc5KQpzY2Fu
Y29kZSAweDgwMGYwNDQ3ID0gS0VZX0FVRElPICgweDE4OCkKc2NhbmNvZGUgMHg4MDBmMDQ0OCA9
IEtFWV9QVlIgKDB4MTZlKQpzY2FuY29kZSAweDgwMGYwNDQ5ID0gS0VZX0NBTUVSQSAoMHhkNCkK
c2NhbmNvZGUgMHg4MDBmMDQ0YSA9IEtFWV9WSURFTyAoMHgxODkpCnNjYW5jb2RlIDB4ODAwZjA0
NGMgPSBLRVlfTEFOR1VBR0UgKDB4MTcwKQpzY2FuY29kZSAweDgwMGYwNDRkID0gS0VZX1RJVExF
ICgweDE3MSkKc2NhbmNvZGUgMHg4MDBmMDQ0ZSA9IEtFWV9QUklOVCAoMHhkMikKc2NhbmNvZGUg
MHg4MDBmMDQ1MCA9IEtFWV9SQURJTyAoMHgxODEpCnNjYW5jb2RlIDB4ODAwZjA0NWEgPSBLRVlf
U1VCVElUTEUgKDB4MTcyKQpzY2FuY29kZSAweDgwMGYwNDViID0gS0VZX1JFRCAoMHgxOGUpCnNj
YW5jb2RlIDB4ODAwZjA0NWMgPSBLRVlfR1JFRU4gKDB4MThmKQpzY2FuY29kZSAweDgwMGYwNDVk
ID0gS0VZX1lFTExPVyAoMHgxOTApCnNjYW5jb2RlIDB4ODAwZjA0NWUgPSBLRVlfQkxVRSAoMHgx
OTEpCnNjYW5jb2RlIDB4ODAwZjA0NjUgPSBLRVlfUE9XRVIyICgweDE2NCkKc2NhbmNvZGUgMHg4
MDBmMDQ2ZSA9IEtFWV9QTEFZUEFVU0UgKDB4YTQpCnNjYW5jb2RlIDB4ODAwZjA0NmYgPSBLRVlf
UExBWUVSICgweDE4MykKc2NhbmNvZGUgMHg4MDBmMDQ4MCA9IEtFWV9CUklHSFRORVNTRE9XTiAo
MHhlMCkKc2NhbmNvZGUgMHg4MDBmMDQ4MSA9IEtFWV9QTEFZUEFVU0UgKDB4YTQpCnNjYW5jb2Rl
IDB4ODQ3NDk3ID0gS0VZX0JBQ0tTUEFDRSAoMHgwZSkKc2NhbmNvZGUgMHg4NDc0OTYgPSBLRVlf
TUVOVQpzY2FuY29kZSAweDgwZDg2NCA9IEtFWV9QT1dFUgo=
--000000000000195a53059ca87816--
