Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4F0382C41
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 14:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhEQMga (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 08:36:30 -0400
Received: from gofer.mess.org ([88.97.38.141]:55903 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229734AbhEQMg1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 08:36:27 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2B944C636F; Mon, 17 May 2021 13:35:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1621254909; bh=kQhGPXwHPGI7TIeTXNntlHj7K3KlzzzSKHQppMIgTAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SU0sLp8wCvyPUG7UnVSAWkKJnYysQLMVOYWrsLHxGEC3Bc80LhcCxOPGetf5tLXtt
         VOE6k1wBk34mp089/hJj8LKFNVzpZQ9gjMSb9ZweVphzPvpN7EyfSRgsovlWzNdZgh
         AwWPp06f+6YahYegvqQi/lgsVApDBXTg1AaxMjAJUFJlkIPvdTaWk0IBVkcwVh7sJx
         tUpBoV1lqDYMrx/NLVONqnSGLCsMltWIJNrQEcUPhpkfEN6RUbgH44NGBftaPLtDxu
         TY0tThqUmvUKLoeySCkWfet4TKv5zmu2sC6z2o51sXdhImK7PZ/A3n0nHgB98pwlPe
         gkNI+f6Iw6/mw==
Date:   Mon, 17 May 2021 13:35:09 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <20210517123509.GA6597@gofer.mess.org>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
 <20210517103522.GA4644@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517103522.GA4644@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 11:35:22AM +0100, Sean Young wrote:
> On Mon, May 17, 2021 at 11:30:39AM +0200, Johan Hovold wrote:
> > On Sat, May 15, 2021 at 10:22:26AM +0100, Sean Young wrote:
> > > On Fri, May 14, 2021 at 01:16:47PM +0200, Johan Hovold wrote:
> > > > On Tue, May 11, 2021 at 11:32:19AM +0100, Sean Young wrote:
> > > > > On Mon, May 10, 2021 at 10:15:14AM +0200, Johan Hovold wrote:
> > > > > > On Thu, May 06, 2021 at 01:44:52PM +0100, Sean Young wrote:
> > > > > > > This is a new rc-core driver for the USB-UIRT which you can see here
> > > > > > > http://www.usbuirt.com/
> > > > > > > 
> > > > > > > This device is supported in lirc, via the usb serial kernel driver. This
> > > > > > > driver is both for rc-core, which means it can use kernel/BPF decoding
> > > > > > > ec. Also this implement is superior because it can:
> > > > > > >  - support learning mode
> > > > > > >  - setting transmit carrier
> > > > > > >  - larger transmits using streaming tx command
> > > > > > 
> > > > > > This looks like something which should have been implemented as a
> > > > > > line-discipline or serdev driver instead of reimplementing a minimal
> > > > > > on-off ftdi driver and tying it closely to the RC subsystem.
> > > > > 
> > > > > The device is an infrared device, I'm not sure what it is lost by
> > > > > doing it this way. The "minimal on-off ftdi driver" is super trivial.
> > > > 
> > > > It's still code duplication (and I meant to say "one-off" above").
> > > > 
> > > > What is preventing you from supporting the above functionality through
> > > > lirc?
> > > 
> > > I guess you mean the userspace lirc daemon, as opposed to the /dev/lirc
> > > chardev. If you use the lirc daemon, you don't use rc-core which comes with
> > > IR decoding using BPF IR decoding or in-kernel decoders, automatic setup of
> > > rc keymaps via udev. None of the modern ir-ctl/ir-keytable tooling will
> > > work, including the IRP encoder/BPF compiler I'm working on (very slowly).
> > 
> > Ok, but apart from BPF that sound like other stuff and not the three
> > items you list above? Is there anything preventing those items from
> > being implemented in user space?
> 
> Well, after IR is decoded, you want to send decoded scancodes/key codes
> to any input device, so your remote works just like any input device.

There is another advantage. IR decoding in userspace involves a lot more
context switches/scheduling, and it can feel laggy when the cpu is under
load (e.g. video decoding on the CPU). When you press pause/play/stop or
so you expect the response the instantatiously. A 100ms delay is noticable.

Alternatively the key-up events get delayed and you end up with multiple
un-intended button repeats. None of this happens with kernel decoding and
it feels very snappy.


Sean
