Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E977438AFFF
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 15:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbhETNc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 09:32:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234765AbhETNc4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 09:32:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B4866108B;
        Thu, 20 May 2021 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621517495;
        bh=a3dwOLxH06q4Z9S2NwACojtAv/LxYoVTrGUj6pjNmt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cD2IUEPvUG4saun4D0Z6epBdYTaevNYr91+SQKfe9kRjX3hKvd0rRCi+CR3hDWP0c
         mNYN71C4CAG3WUjGikwt3jm419j6uAk937JkuNq41VcsCi2YYM9Ev1qYUL7Tal4Yws
         R+3ecf9ZC41FQU2+XZsjhC6sov1tyZo7vg38tNeatHZbifNkbCJhh11OKX8ky31qGl
         K3urQW+nJZ/aHXzUj/TkIvkv8Na/QK19fZvKUMM6ADOU1NU5R2+65EQSg9TaUe994z
         gxrkpV/2OoRg7M+TrcThcmTYXHvLqGsaS/JPHv2AUjpcXN9pk4y3tl1f8oHdAOAEbH
         o5IaBUuTb9GiA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ljily-00035w-PO; Thu, 20 May 2021 15:31:35 +0200
Date:   Thu, 20 May 2021 15:31:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YKZktqzkddh3amqX@hovoldconsulting.com>
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

Isn't that already handled by lircd using uinput?
 
> > Obviously a user-space implementation (e.g. accessing the device through
> > /dev/ttyUSB0) is not going to be able to use in-kernel RC functionality.
> > For that you'd need to use either a line-discipline or serdev driver,
> > that is, a kernel driver, but not everything has to live in the kernel.
> 
> No, of course not. A lot of kernel functionality could live in user space,
> for sure. But it doesn't.
> 
> Even if the input problem can be resolved, the lirc daemon is pretty outdated.
> All the existing functionality in-kernel would have to be re-written for
> userspace, and it would be total duplication of code, which you do not like.
> You end up with a userspace implementation and a kernel space implementation.
> 
> There are many other IR devices that can be controlled through libusb in
> userspace, which could work entirely in userspace. Same for i2c IR
> devices, those could work entirely from userspace too. I don't know what
> the state is of pci userspace drivers, but there certainly have been patches
> for that; the line is not so clear.
> 
> I do think that the monolithic approach to kernels necessarily invokes
> discussions like these, and there are no perfect answers. 

I hear you, but we still need to have those discussions from time to
time to make sure our architecture is sane. One of the problems today
with the kernel development process appears to be that too few questions
are asked. If it builds, ship it...

In this case the device in question can already be handled in user space
by lirqd (at least to some degree) and we have infrastructure for
writing in-kernel serial client drivers (i.e. ldisc/serdev). While
neither option may support everything we need today, adding further
one-off serial-device + client combo drivers is still a step in the
wrong direction.

But I think I've got that point across by now.

> > > The other nice thing is that IR TX feeds data from an urb interrupt handler,
> > > so you don't need to rely userspace being scheduled quickly enough to feed
> > > more data before the device runs out.
> > 
> > The tty layer and tty drivers provide write buffering so that need not
> > be an issue.
>  
> Ok. I don't know what the size of the write buffer is or what the maximum
> TX size is; the IR device supports infinite streaming.

Our tty drivers typically have at least a 4k buffer for transmission.
Surely that should be enough for a remote control but perhaps there are
other more demanding applications?

> > Thanks for that pointer. Judging from a quick look, the new driver
> > appears to based on this one. By abstracting the serial interface bits
> > in a generic RC serdev/ldisc driver you may be able reuse more code,
> > even if I'm not in a position to judge how much of the IR protocol bits
> > that can be shared.
> 
> Yes, I agree. Once hotplugging is in place. If you have patches for that,
> please CC me and I can see if will work for IR drivers.

Let's hope someone steps up to fund that work then.

> > > There are a bunch old serial usb device IR devices and even older non-usb
> > > serial devices that would be nice to have supported, if anyone is still
> > > using them.
> > 
> > I noticed that drivers/media/rc/serial_ir.c also appears to use a
> > similar approach of implementing a minimal one-off serial (8250?) driver
> > and tying it closely to RC core. This one might also benefit from using
> > the standard serial drivers for the transport and having an RC layer on
> > top.
> > 
> > Currently it appears to use module-parameters for configuration instead
> > of devicetree or some to-be-implemented interface for instantiating
> > serdev devices from user space.
> 
> serial_ir.c (called lirc_serial in the past) is a bit special. It uses
> an IR sensor connected directly to DCD and an output led connected to DTR,
> (depending on the configuration used). I don't think this can be done with
> a standard serial port driver. If it is possible, I'd like to know.
> 
> It's a bit of an insane way of doing things, but it's super cheap to build.

Heh, ok. Perhaps we'll just have to live with this one then.

Johan
