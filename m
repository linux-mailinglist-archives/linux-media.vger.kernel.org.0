Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C0A3829E9
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 12:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbhEQKgn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 06:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236273AbhEQKgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 06:36:42 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885DAC061573;
        Mon, 17 May 2021 03:35:26 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1C8ABC636F; Mon, 17 May 2021 11:35:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1621247723; bh=v/8gXw5Cj9Xq11dRr0knFVx9DBwN4fdOcBnPqowPfgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jZXxSQ92yhWFK4iSw3OPBMK/m4Ep5Q3CkSQGg/tRCMjqrzTxE/RyR5wmuWljmTphl
         yvJvXaULA1H/g83q4pRtSrivnKqj1NWtv9EDVakn07OhhLsGJ3z5IaIsQfHU+qVcNR
         HhqYFTTXWlA+GSbEHctX97Sxl8uMS1IsEVK7mktZF/LFU8E36nTxUTAddS4lk1+Abd
         XQeXF6vOjM0AFnSGdTcHAeWI6jxCPA1sZD2MKEE//aJ8XoKthamXVx60fTBMM48LwQ
         v3Svly3Bgt44lT3gN5IUxni2fGU9907PkPleYjBpV/MvyeW8+9MmJSpTjpYgVUkHvI
         o/sba3sTGkJFQ==
Date:   Mon, 17 May 2021 11:35:22 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <20210517103522.GA4644@gofer.mess.org>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
 <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 17, 2021 at 11:30:39AM +0200, Johan Hovold wrote:
> On Sat, May 15, 2021 at 10:22:26AM +0100, Sean Young wrote:
> > On Fri, May 14, 2021 at 01:16:47PM +0200, Johan Hovold wrote:
> > > On Tue, May 11, 2021 at 11:32:19AM +0100, Sean Young wrote:
> > > > On Mon, May 10, 2021 at 10:15:14AM +0200, Johan Hovold wrote:
> > > > > On Thu, May 06, 2021 at 01:44:52PM +0100, Sean Young wrote:
> > > > > > This is a new rc-core driver for the USB-UIRT which you can see here
> > > > > > http://www.usbuirt.com/
> > > > > > 
> > > > > > This device is supported in lirc, via the usb serial kernel driver. This
> > > > > > driver is both for rc-core, which means it can use kernel/BPF decoding
> > > > > > ec. Also this implement is superior because it can:
> > > > > >  - support learning mode
> > > > > >  - setting transmit carrier
> > > > > >  - larger transmits using streaming tx command
> > > > > 
> > > > > This looks like something which should have been implemented as a
> > > > > line-discipline or serdev driver instead of reimplementing a minimal
> > > > > on-off ftdi driver and tying it closely to the RC subsystem.
> > > > 
> > > > The device is an infrared device, I'm not sure what it is lost by
> > > > doing it this way. The "minimal on-off ftdi driver" is super trivial.
> > > 
> > > It's still code duplication (and I meant to say "one-off" above").
> > > 
> > > What is preventing you from supporting the above functionality through
> > > lirc?
> > 
> > I guess you mean the userspace lirc daemon, as opposed to the /dev/lirc
> > chardev. If you use the lirc daemon, you don't use rc-core which comes with
> > IR decoding using BPF IR decoding or in-kernel decoders, automatic setup of
> > rc keymaps via udev. None of the modern ir-ctl/ir-keytable tooling will
> > work, including the IRP encoder/BPF compiler I'm working on (very slowly).
> 
> Ok, but apart from BPF that sound like other stuff and not the three
> items you list above? Is there anything preventing those items from
> being implemented in user space?

Well, after IR is decoded, you want to send decoded scancodes/key codes
to any input device, so your remote works just like any input device.

> Obviously a user-space implementation (e.g. accessing the device through
> /dev/ttyUSB0) is not going to be able to use in-kernel RC functionality.
> For that you'd need to use either a line-discipline or serdev driver,
> that is, a kernel driver, but not everything has to live in the kernel.

No, of course not. A lot of kernel functionality could live in user space,
for sure. But it doesn't.

Even if the input problem can be resolved, the lirc daemon is pretty outdated.
All the existing functionality in-kernel would have to be re-written for
userspace, and it would be total duplication of code, which you do not like.
You end up with a userspace implementation and a kernel space implementation.

There are many other IR devices that can be controlled through libusb in
userspace, which could work entirely in userspace. Same for i2c IR
devices, those could work entirely from userspace too. I don't know what
the state is of pci userspace drivers, but there certainly have been patches
for that; the line is not so clear.

I do think that the monolithic approach to kernels necessarily invokes
discussions like these, and there are no perfect answers. 

> > The other nice thing is that IR TX feeds data from an urb interrupt handler,
> > so you don't need to rely userspace being scheduled quickly enough to feed
> > more data before the device runs out.
> 
> The tty layer and tty drivers provide write buffering so that need not
> be an issue.
 
Ok. I don't know what the size of the write buffer is or what the maximum
TX size is; the IR device supports infinite streaming.

> > > > > Why can't you just add support for the above features to whatever
> > > > > subsystem is managing this device today?
> > > > > 
> > > > > Serdev still doesn't support hotplugging unfortunately so that route may
> > > > > take a bit more work.
> > > > 
> > > > There seems to be at least three ways of attaching drivers to serial
> > > > devices: serio, serdev, and line-discipline. All seem to have limitations,
> > > > as you say none of them provide a way of hotplugging devices without
> > > > user-space attaching them through an ioctl or so.
> > > 
> > > serio is also a line-discipline driver, which unlike serdev needs to be
> > > set up by user space.
> > 
> > serio is unusable for this case. serio does not allow more than one byte
> > to be written nor does it have callbacks for CTS readiness.
> 
> Ok, but you could still implement this as an rc-core line-discipline or
> serdev driver. And when you use hardware flow control as you do here,
> you shouldn't need any callbacks for CTS events either, right?

I like the idea of serdev, but like you say it's not ready yet because of
absence of hotplugging. See above about streaming.

> > > And the problem with serdev is that it does not (yet) support
> > > hotplugging (specifically hangups) so it can't be enabled for USB serial
> > > just yet.
> > > 
> > > > If you want to go down this route, then ideally you'd want a quirk on
> > > > fdti saying "attach usb-uirt serdev device to this pid/vid". Considering
> > > > module dependencies, I don't know how that could work without again
> > > > userspace getting involved.
> > > 
> > > We'd just reuse or add another matching mechanism for USB devices. This
> > > can be handled without user-space interaction just fine as long as you
> > > have a dedicated device id as you do here.
> > 
> > Right, ok. I don't quite follow what you have in mind. If at all possible
> > keep me in the loop for any patches for this, I'm happy to test/re-write
> > this driver and the drivers/media/rc/ir_toy.c driver on top of any such
> > patches.
> 
> Thanks for that pointer. Judging from a quick look, the new driver
> appears to based on this one. By abstracting the serial interface bits
> in a generic RC serdev/ldisc driver you may be able reuse more code,
> even if I'm not in a position to judge how much of the IR protocol bits
> that can be shared.

Yes, I agree. Once hotplugging is in place. If you have patches for that,
please CC me and I can see if will work for IR drivers.

> > There are a bunch old serial usb device IR devices and even older non-usb
> > serial devices that would be nice to have supported, if anyone is still
> > using them.
> 
> I noticed that drivers/media/rc/serial_ir.c also appears to use a
> similar approach of implementing a minimal one-off serial (8250?) driver
> and tying it closely to RC core. This one might also benefit from using
> the standard serial drivers for the transport and having an RC layer on
> top.
> 
> Currently it appears to use module-parameters for configuration instead
> of devicetree or some to-be-implemented interface for instantiating
> serdev devices from user space.

serial_ir.c (called lirc_serial in the past) is a bit special. It uses
an IR sensor connected directly to DCD and an output led connected to DTR,
(depending on the configuration used). I don't think this can be done with
a standard serial port driver. If it is possible, I'd like to know.

It's a bit of an insane way of doing things, but it's super cheap to build.


Sean
