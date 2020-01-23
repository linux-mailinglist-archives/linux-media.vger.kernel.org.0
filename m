Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C707C146425
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 10:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgAWJJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 04:09:07 -0500
Received: from gofer.mess.org ([88.97.38.141]:60395 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAWJJH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 04:09:07 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1500F11A001; Thu, 23 Jan 2020 09:09:06 +0000 (GMT)
Date:   Thu, 23 Jan 2020 09:09:05 +0000
From:   Sean Young <sean@mess.org>
To:     camden lindsay <camden.lindsay+kernel@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: ir-keytable segfault when writing keymap from file
Message-ID: <20200123090905.GA6195@gofer.mess.org>
References: <CABkW7JNg-7PNwSH2CsZVFHpqHdnaH5Ha4VS83r8_CaMox3wfQQ@mail.gmail.com>
 <CABkW7JNw2vzijzPuUVTOEC7oZ-opSgRp7YdpEdmhJrKc=GX7Ow@mail.gmail.com>
 <20200121092021.GA25590@gofer.mess.org>
 <CABkW7JNsiMPU9SP+pvojWDrDm7ckdrEaOnUmtRw-bhe5iKigsg@mail.gmail.com>
 <20200121164939.GA32565@gofer.mess.org>
 <CABkW7JNPtB9oyEzZ13dDfdqSbeskTY38z0qTBpNodmRhzxxyzA@mail.gmail.com>
 <20200121192943.GA2797@gofer.mess.org>
 <CABkW7JOMEKbRSJqrjShfis03MJHjoYGd_T4Cd+2QffzXMWKiaw@mail.gmail.com>
 <20200122091640.GA14036@gofer.mess.org>
 <CABkW7JNKq3N39pzmMJJ5B05V0fHZBqxmd68XThuDs6f+QC41Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABkW7JNKq3N39pzmMJJ5B05V0fHZBqxmd68XThuDs6f+QC41Nw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 22, 2020 at 07:32:41PM -0800, camden lindsay wrote:
> Did this, and found that all of the remote commands were nec-x and I
> must have been mapping the others for some other device.  Included my
> mappings for the other device to test the toml file with multiple
> protocols, and it all seems to work correctly
> 
> [kodiuser@kodiarch ~]$ sudo ir-keytable -c
> Old keytable cleared
> [kodiuser@kodiarch ~]$ sudo ir-keytable -w /etc/ir-keytable/test.toml
> Read AVR54 Remote table
> Wrote 64 keycode(s) to driver
> Protocols changed to nec rc-6
> [kodiuser@kodiarch ~]$ grep 0x /etc/ir-keytable/test.toml | wc -l
> 64
> [kodiuser@kodiarch ~]$
> 
> 
> Now have the toml file as attached, and seems to work for what I need
> and load properly.
> 
> One question; the format  as called out in the man page seems strange-
> that we set a name to the first [[protocols]] entry, which appears to
> be for the entire file- but we don't in subsequent [[protocols]]
> entries.   Is that by design/purposeful?  Or am I reading the man page
> example wrong?

That man page could do with some re-wording. I'm not great at writing
documentation.

Your attached keymap looks like:

       [[protocols]]
       name = "AVR54 Remote"
       protocol = "nec"
       variant = "necx"
       [protocols.scancodes]
        0x847490 = "KEY_ENTER"
        0x84748a = "KEY_FASTFORWARD"
        0x84747e = "KEY_REWIND"
        0x84747f = "KEY_PLAY"
        0x847499 = "KEY_RECORD"
        0x84748c = "KEY_PAUSE"
        0x84747c = "KEY_X"
        0x84747d = "KEY_NEXTSONG"
        0x84747b = "KEY_PREVIOUSSONG"
        0x84748e = "KEY_UP"
        0x847492 = "KEY_DOWN"
        0x84748f = "KEY_LEFT"
        0x847491 = "KEY_RIGHT"
        0x847497 = "KEY_BACKSPACE"
        0x847496 = "KEY_MENU"
        0x80d864 = "KEY_POWER"

       [[protocols]]

Here is the second [[protocols]] entry. Is that what you mean?

       protocol = "rc-6"
       [protocols.scancodes]
        0x800f0400 = "KEY_NUMERIC_0"
        0x800f0401 = "KEY_NUMERIC_1"
        0x800f0402 = "KEY_NUMERIC_2"
        0x800f0403 = "KEY_NUMERIC_3"
        0x800f0404 = "KEY_NUMERIC_4"
        0x800f0405 = "KEY_NUMERIC_5"
        0x800f0406 = "KEY_NUMERIC_6"
        0x800f0407 = "KEY_NUMERIC_7"
        0x800f0408 = "KEY_NUMERIC_8"
        0x800f0409 = "KEY_NUMERIC_9"
        0x800f040a = "KEY_DELETE"
        0x800f040c = "KEY_SLEEP"
        0x800f040d = "KEY_MEDIA"
        0x800f040e = "KEY_MUTE"
        0x800f040f = "KEY_INFO"
        0x800f0410 = "KEY_VOLUMEUP"
        0x800f0411 = "KEY_VOLUMEDOWN"
        0x800f0412 = "KEY_CHANNELUP"
        0x800f0413 = "KEY_CHANNELDOWN"
        0x800f041c = "KEY_NUMERIC_POUND"
        0x800f041d = "KEY_NUMERIC_STAR"
        0x800f0424 = "KEY_DVD"
        0x800f0425 = "KEY_TUNER"
        0x800f0426 = "KEY_EPG"
        0x800f0427 = "KEY_ZOOM"
        0x800f0432 = "KEY_MODE"
        0x800f0433 = "KEY_PRESENTATION"
        0x800f0434 = "KEY_EJECTCD"
        0x800f043a = "KEY_BRIGHTNESSUP"
        0x800f0446 = "KEY_TV"
        0x800f0447 = "KEY_AUDIO"
        0x800f0448 = "KEY_PVR"
        0x800f0449 = "KEY_CAMERA"
        0x800f044a = "KEY_VIDEO"
        0x800f044c = "KEY_LANGUAGE"
        0x800f044d = "KEY_TITLE"
        0x800f044e = "KEY_PRINT"
        0x800f0450 = "KEY_RADIO"
        0x800f045a = "KEY_SUBTITLE"
        0x800f045b = "KEY_RED"
        0x800f045c = "KEY_GREEN"
        0x800f045d = "KEY_YELLOW"
        0x800f045e = "KEY_BLUE"
        0x800f0465 = "KEY_POWER2"
        0x800f046e = "KEY_PLAYPAUSE"
        0x800f046f = "KEY_PLAYER"
        0x800f0480 = "KEY_BRIGHTNESSDOWN"
        0x800f0481 = "KEY_PLAYPAUSE"

> Many thanks for helping me getting this sorted- i can use my remote again!! :)

No problem, glad it is working.


Sean
