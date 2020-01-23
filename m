Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 669411460F2
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 04:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgAWDcy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 22:32:54 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:41686 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAWDcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 22:32:54 -0500
Received: by mail-ua1-f49.google.com with SMTP id f7so516847uaa.8
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 19:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6VNtG7pA5QtAlibxXm7AT6M5uPRpWCVj3oBjxFAroOg=;
        b=TmusAS88aeR6f17sf4QCMAI2B5Zax9P9j3e97nw70oVh/xhktUzytJ80CNihZBjFN7
         hJjG7t0czme0mU7rPoEr4riYgigqjsDHJ6MBNcliHPtFWSqYHyjGDDxC4RotFX88/xtK
         +ofHBmtQ2X7UDght9waYPH8uZOnhBCoqsukCLpvwFfljaezFcVJYQGZZaDvoBg7bMySC
         /miozAJYE/lUZQCGwebUTj/mj5Ah42CoxkDHkwIDw6FALzZgO9NclJMl7D1gHUP5xxsn
         WOMSvZ0aOJCC7OP+WZWqNweMxJw9N7gSSikT8hZmySZvhb3WpzfsyCrwObdL/J6g83Mf
         6qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6VNtG7pA5QtAlibxXm7AT6M5uPRpWCVj3oBjxFAroOg=;
        b=bTgHCH5hszO7/ucfxlSPBL7HeaEdwiCJYH/L+4szfzmxl8htF7bxd1cWZpIFYsVEsG
         QWLZ/OM4f6FIDzZsM7l36xhZqsb2BMEAGPZWU+5CTKrG+gN36ryPGFsNyGniKj7UfMFP
         GXEKWxom72AlBHmIS/vhWFdLxHMerZkL+Goj/i+K7VWYSfGbX+Do4IqpM6Ipr+J8qfKI
         5OmeaINSA1EWRS0Ec0P7WPm5uj/ODhmMgRXq7vod0QcFx1h4zJZTxWFFZLyRsemqCRd2
         MYV07euXwM2vXjHf20YLy/DBBgpBVNY6Vau3y8TWfEKN037JhZmsn03Ah5RioAhnHbL6
         wFQQ==
X-Gm-Message-State: APjAAAWuunctSOrR1kw2bkgJVasKNkcqNyaYM8vWZkopI3+Ot/3EqVvJ
        YmWTYXqLUl2gAG2vn8N/+yCP0tqRPLNunFbOMNWZaN0=
X-Google-Smtp-Source: APXvYqwHX8duX0MqdrUlSUdAUvi7KTMgIt3J7AWPiXXdJarmx9pqkFVrGJqFE+MvMYx2Ky83ByqEpQjKhjzRQxEFfck=
X-Received: by 2002:a9f:226d:: with SMTP id 100mr8632633uad.107.1579750372950;
 Wed, 22 Jan 2020 19:32:52 -0800 (PST)
MIME-Version: 1.0
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
 <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
 <20200121092021.GA25590@gofer.mess.org> <CABkW7JNsiMPU9SP+pvojWDrDm7ckdrEaOnUmtRw-bhe5iKigsg@mail.gmail.com>
 <20200121164939.GA32565@gofer.mess.org> <CABkW7JNPtB9oyEzZ13dDfdqSbeskTY38z0qTBpNodmRhzxxyzA@mail.gmail.com>
 <20200121192943.GA2797@gofer.mess.org> <CABkW7JOMEKbRSJqrjShfis03MJHjoYGd_T4Cd+2QffzXMWKiaw@mail.gmail.com>
 <20200122091640.GA14036@gofer.mess.org>
In-Reply-To: <20200122091640.GA14036@gofer.mess.org>
From:   camden lindsay <camden.lindsay+kernel@gmail.com>
Date:   Wed, 22 Jan 2020 19:32:41 -0800
Message-ID: <CABkW7JNKq3N39pzmMJJ5B05V0fHZBqxmd68XThuDs6f+QC41Nw@mail.gmail.com>
Subject: Re: ir-keytable segfault when writing keymap from file
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d0d0dc059cc64b2a"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000d0d0dc059cc64b2a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 22, 2020 at 1:16 AM Sean Young <sean@mess.org> wrote:
>
> Hi Camden,
>
> On Tue, Jan 21, 2020 at 02:48:45PM -0800, camden lindsay wrote:
> > Will do.
> >
> > To do a quick test, i copied the sample config file out of the man
> > page and tried loading it:
> > [kodiuser@kodiarch ir-keytable]$ sudo ir-keytable -w /etc/ir-keytable/test.toml
> > Read iMON Station RSC table
> > /etc/ir-keytable/test.toml: keycode `KEY_MAX' not recognised, no
>
> The KEY_MAX problem is fixed in master.
>
> > mapping for scancode 8392834
> > Wrote 42 keycode(s) to driver
> > Protocols changed to nec
> > Can't find imon_rsc bpf protocol in /etc/rc_keymaps/protocols or
> > /usr/lib/udev/rc_keymaps/protocols
> > [kodiuser@kodiarch ir-keytable]$
> >
> >
> > Looks like perhaps i should file a bug against arch for the missing
> > protocol file?
>
> That would be great, however I don't think it affects the problem you are
> having.

Understood, and agreed.


>
> > I have no idea what IR BPF decoding does.. but the pages i have
> > skimmed about it (including running across your ramblings and  bpf man
> > page description) seem to indicate it is more complex that what i'll
> > need, given i'll be using the kernel IR decoders.  I think? heh.
>
> For the most common IR protocols, the kernel includes a set of hand-written
> decoders. There are many more protocols, or slight variants. So rather
> than having a decoder for each, we use BPF for those. BPF decoders are
> stored in /usr/lib/udev/rc_keymaps/protocols
>
> Having said all of that, it's likely that you can make do with the kernel
> decoders (non-BPF).
>
> I would suggest you try the "ir-keytable -p all -t" and see if you can
> identify all the protocols and scancodes of your remote.

Did this, and found that all of the remote commands were nec-x and I
must have been mapping the others for some other device.  Included my
mappings for the other device to test the toml file with multiple
protocols, and it all seems to work correctly

[kodiuser@kodiarch ~]$ sudo ir-keytable -c
Old keytable cleared
[kodiuser@kodiarch ~]$ sudo ir-keytable -w /etc/ir-keytable/test.toml
Read AVR54 Remote table
Wrote 64 keycode(s) to driver
Protocols changed to nec rc-6
[kodiuser@kodiarch ~]$ grep 0x /etc/ir-keytable/test.toml | wc -l
64
[kodiuser@kodiarch ~]$


Now have the toml file as attached, and seems to work for what I need
and load properly.

One question; the format  as called out in the man page seems strange-
that we set a name to the first [[protocols]] entry, which appears to
be for the entire file- but we don't in subsequent [[protocols]]
entries.   Is that by design/purposeful?  Or am I reading the man page
example wrong?




Many thanks for helping me getting this sorted- i can use my remote again!! :)
c
>
>
> Sean

--000000000000d0d0dc059cc64b2a
Content-Type: application/octet-stream; name="keymap.toml"
Content-Disposition: attachment; filename="keymap.toml"
Content-Transfer-Encoding: base64
Content-ID: <f_k5q6jq8n0>
X-Attachment-Id: f_k5q6jq8n0

ICAgICAgIFtbcHJvdG9jb2xzXV0KICAgICAgIG5hbWUgPSAiQVZSNTQgUmVtb3RlIgogICAgICAg
cHJvdG9jb2wgPSAibmVjIgogICAgICAgdmFyaWFudCA9ICJuZWN4IgogICAgICAgW3Byb3RvY29s
cy5zY2FuY29kZXNdCiAgICAgICAgMHg4NDc0OTAgPSAiS0VZX0VOVEVSIgogICAgICAgIDB4ODQ3
NDhhID0gIktFWV9GQVNURk9SV0FSRCIKICAgICAgICAweDg0NzQ3ZSA9ICJLRVlfUkVXSU5EIgog
ICAgICAgIDB4ODQ3NDdmID0gIktFWV9QTEFZIgogICAgICAgIDB4ODQ3NDk5ID0gIktFWV9SRUNP
UkQiCiAgICAgICAgMHg4NDc0OGMgPSAiS0VZX1BBVVNFIgogICAgICAgIDB4ODQ3NDdjID0gIktF
WV9YIgogICAgICAgIDB4ODQ3NDdkID0gIktFWV9ORVhUU09ORyIKICAgICAgICAweDg0NzQ3YiA9
ICJLRVlfUFJFVklPVVNTT05HIgogICAgICAgIDB4ODQ3NDhlID0gIktFWV9VUCIKICAgICAgICAw
eDg0NzQ5MiA9ICJLRVlfRE9XTiIKICAgICAgICAweDg0NzQ4ZiA9ICJLRVlfTEVGVCIKICAgICAg
ICAweDg0NzQ5MSA9ICJLRVlfUklHSFQiCiAgICAgICAgMHg4NDc0OTcgPSAiS0VZX0JBQ0tTUEFD
RSIKICAgICAgICAweDg0NzQ5NiA9ICJLRVlfTUVOVSIKICAgICAgICAweDgwZDg2NCA9ICJLRVlf
UE9XRVIiCgogICAgICAgW1twcm90b2NvbHNdXQogICAgICAgcHJvdG9jb2wgPSAicmMtNiIKICAg
ICAgIFtwcm90b2NvbHMuc2NhbmNvZGVzXQogICAgICAgIDB4ODAwZjA0MDAgPSAiS0VZX05VTUVS
SUNfMCIKICAgICAgICAweDgwMGYwNDAxID0gIktFWV9OVU1FUklDXzEiCiAgICAgICAgMHg4MDBm
MDQwMiA9ICJLRVlfTlVNRVJJQ18yIgogICAgICAgIDB4ODAwZjA0MDMgPSAiS0VZX05VTUVSSUNf
MyIKICAgICAgICAweDgwMGYwNDA0ID0gIktFWV9OVU1FUklDXzQiCiAgICAgICAgMHg4MDBmMDQw
NSA9ICJLRVlfTlVNRVJJQ181IgogICAgICAgIDB4ODAwZjA0MDYgPSAiS0VZX05VTUVSSUNfNiIK
ICAgICAgICAweDgwMGYwNDA3ID0gIktFWV9OVU1FUklDXzciCiAgICAgICAgMHg4MDBmMDQwOCA9
ICJLRVlfTlVNRVJJQ184IgogICAgICAgIDB4ODAwZjA0MDkgPSAiS0VZX05VTUVSSUNfOSIKICAg
ICAgICAweDgwMGYwNDBhID0gIktFWV9ERUxFVEUiCiAgICAgICAgMHg4MDBmMDQwYyA9ICJLRVlf
U0xFRVAiCiAgICAgICAgMHg4MDBmMDQwZCA9ICJLRVlfTUVESUEiCiAgICAgICAgMHg4MDBmMDQw
ZSA9ICJLRVlfTVVURSIKICAgICAgICAweDgwMGYwNDBmID0gIktFWV9JTkZPIgogICAgICAgIDB4
ODAwZjA0MTAgPSAiS0VZX1ZPTFVNRVVQIgogICAgICAgIDB4ODAwZjA0MTEgPSAiS0VZX1ZPTFVN
RURPV04iCiAgICAgICAgMHg4MDBmMDQxMiA9ICJLRVlfQ0hBTk5FTFVQIgogICAgICAgIDB4ODAw
ZjA0MTMgPSAiS0VZX0NIQU5ORUxET1dOIgogICAgICAgIDB4ODAwZjA0MWMgPSAiS0VZX05VTUVS
SUNfUE9VTkQiCiAgICAgICAgMHg4MDBmMDQxZCA9ICJLRVlfTlVNRVJJQ19TVEFSIgogICAgICAg
IDB4ODAwZjA0MjQgPSAiS0VZX0RWRCIKICAgICAgICAweDgwMGYwNDI1ID0gIktFWV9UVU5FUiIK
ICAgICAgICAweDgwMGYwNDI2ID0gIktFWV9FUEciCiAgICAgICAgMHg4MDBmMDQyNyA9ICJLRVlf
Wk9PTSIKICAgICAgICAweDgwMGYwNDMyID0gIktFWV9NT0RFIgogICAgICAgIDB4ODAwZjA0MzMg
PSAiS0VZX1BSRVNFTlRBVElPTiIKICAgICAgICAweDgwMGYwNDM0ID0gIktFWV9FSkVDVENEIgog
ICAgICAgIDB4ODAwZjA0M2EgPSAiS0VZX0JSSUdIVE5FU1NVUCIKICAgICAgICAweDgwMGYwNDQ2
ID0gIktFWV9UViIKICAgICAgICAweDgwMGYwNDQ3ID0gIktFWV9BVURJTyIKICAgICAgICAweDgw
MGYwNDQ4ID0gIktFWV9QVlIiCiAgICAgICAgMHg4MDBmMDQ0OSA9ICJLRVlfQ0FNRVJBIgogICAg
ICAgIDB4ODAwZjA0NGEgPSAiS0VZX1ZJREVPIgogICAgICAgIDB4ODAwZjA0NGMgPSAiS0VZX0xB
TkdVQUdFIgogICAgICAgIDB4ODAwZjA0NGQgPSAiS0VZX1RJVExFIgogICAgICAgIDB4ODAwZjA0
NGUgPSAiS0VZX1BSSU5UIgogICAgICAgIDB4ODAwZjA0NTAgPSAiS0VZX1JBRElPIgogICAgICAg
IDB4ODAwZjA0NWEgPSAiS0VZX1NVQlRJVExFIgogICAgICAgIDB4ODAwZjA0NWIgPSAiS0VZX1JF
RCIKICAgICAgICAweDgwMGYwNDVjID0gIktFWV9HUkVFTiIKICAgICAgICAweDgwMGYwNDVkID0g
IktFWV9ZRUxMT1ciCiAgICAgICAgMHg4MDBmMDQ1ZSA9ICJLRVlfQkxVRSIKICAgICAgICAweDgw
MGYwNDY1ID0gIktFWV9QT1dFUjIiCiAgICAgICAgMHg4MDBmMDQ2ZSA9ICJLRVlfUExBWVBBVVNF
IgogICAgICAgIDB4ODAwZjA0NmYgPSAiS0VZX1BMQVlFUiIKICAgICAgICAweDgwMGYwNDgwID0g
IktFWV9CUklHSFRORVNTRE9XTiIKICAgICAgICAweDgwMGYwNDgxID0gIktFWV9QTEFZUEFVU0Ui
Cg==
--000000000000d0d0dc059cc64b2a--
