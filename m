Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74631291E6
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 09:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388959AbfEXHkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 03:40:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:43713 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388944AbfEXHkp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 03:40:45 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C8E6160DD0; Fri, 24 May 2019 08:40:43 +0100 (BST)
Date:   Fri, 24 May 2019 08:40:43 +0100
From:   Sean Young <sean@mess.org>
To:     =?iso-8859-1?Q?Fr=E9d=E9ric?= Deghetto 
        <frederic.deghetto@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: rc rc0: two consecutive events of type space & strange
 ir-keytable behaviour
Message-ID: <20190524074043.2c7zns4urhkxran6@gofer.mess.org>
References: <ff3cbf92-3f43-2a85-68d3-35f9086aa393@gmail.com>
 <63e2ee50-6ba0-c231-2062-ad892b037bac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63e2ee50-6ba0-c231-2062-ad892b037bac@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 24, 2019 at 07:31:03AM +0200, Frédéric Deghetto wrote:
> Probably related to this issue; ir-keytable -a /etc/rc_maps.conf -v gives:
> 
> /sys/class/rc/rc0/protocols protocol rc-5 (disabled)
> /sys/class/rc/rc0/protocols protocol nec (disabled)
> /sys/class/rc/rc0/protocols protocol rc-6 (enabled)
> /sys/class/rc/rc0/protocols protocol jvc (disabled)
> /sys/class/rc/rc0/protocols protocol sony (disabled)
> /sys/class/rc/rc0/protocols protocol rc-5-sz (disabled)
> /sys/class/rc/rc0/protocols protocol sanyo (disabled)
> /sys/class/rc/rc0/protocols protocol sharp (disabled)
> /sys/class/rc/rc0/protocols protocol mce_kbd (disabled)
> /sys/class/rc/rc0/protocols protocol xmp (disabled)
> /sys/class/rc/rc0/protocols protocol imon (disabled)
> /sys/class/rc/rc0/protocols protocol lirc (enabled)
> Table for gpio_ir_recv, rc-rc6-mce not found. Keep as-is
> 
> like if rc-rc6-mce was not available anymore ?

This looks like ir-keytable could not match up your /etc/rc_maps.conf with
your rc device. Please can you provide:

1) output of "ir-keytable" no (arguments)
2) output of "cat /etc/rc_maps.conf"
3) output of "ir-keytable --version"

> 
> Have a good day,
> 
> Frederic
> 
> 
> Le 24/05/2019 à 06:12, Frédéric Deghetto a écrit :
> > Good day,
> > 
> > Information on the system:
> > 
> > - Raspberry 3b+
> > 
> > - Updated yesterday to 4.19.42-v7+
> > 
> > 
> > Before the update the remote control was working well with:
> > 
> > - gpio-rc-recv    rc-rc6-mce    kodi (into the file rc_maps.cfg)
> > 
> > - And the following data into /etc/rc_keymaps/kodi:
> > 
> > # table kodi, type: NEC
> > 0x140 KEY_POWER
> > 0x1ff KEY_TAB
> > 0x143 KEY_RED
> > 0x10f KEY_GREEN
> > 0x110 KEY_MINUS
> > 0x118 KEY_VOLUMEUP
> > 0x111 KEY_ESC
> > 0x119 KEY_BACKSPACE
> > 0x116 KEY_UP
> > 0x151 KEY_LEFT
> > 0x113 KEY_ENTER
> > 0x150 KEY_RIGHT
> > 0x11a KEY_DOWN
> > 0x14c KEY_EPG
> > 0x100 KEY_C
> > 0x14e KEY_1
> > 0x10d KEY_2
> > 0x10c KEY_3
> > 0x14a KEY_4
> > 0x109 KEY_5
> > 0x108 KEY_6
> > 0x146 KEY_7
> > 0x105 KEY_8
> > 0x104 KEY_9
> > 0x141 KEY_F8
> > 0x101 KEY_0
> > 0x142 KEY_DELETE
> > 
> > 
> > Since the kernel update I get this message from dmesg: "rc rc0: two
> > consecutive events of type space", and the remote control doesn't work.

This is a warning message about the driver and should not affect
functionality,

> > I tried to force the protocol NEC with ir-keytable -t -p NEC and I can
> > this some events. Something strange, when I push a button I can get the
> > event of the previous pushed button. By insisting I get the right one.

That's very odd. This sounds like a problem with trailing spaces/timeouts,
which should work fine in v4.19. 

What distribtion are you using and what version?

Thanks

Sean

> > 
> > I went to google and didn't see any workaround.
> > 
> > Many thanks for your support,
> > 
> > Frederic
> > 
