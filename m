Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D87381722
	for <lists+linux-media@lfdr.de>; Sat, 15 May 2021 11:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhEOJXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 05:23:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:52233 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230448AbhEOJXl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 05:23:41 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 06689C641E; Sat, 15 May 2021 10:22:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1621070547; bh=eaVK0UPMHnlljMwNTYy/QtgLnXiQVW5cgFw4TKsZcCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D9rKn/5e9nKC2Uhk+K9FS5bLIQi8yx5ge7mRYb3eD21UZtO/vPa6Pm6WBYlivnQh4
         EjF+RW80aUP2q8qA26tS41WlV7HnESJbsJsWLTATuB+JNmsiq8mVGzhpqx+Ze1hg8d
         o2sr/SEX/78VpaoquMlivwVR0KJ9Rq17wYRhc2aH4Fp/CIqTd4qT+CEBWFNk2n+zMa
         lURRkd5sgFtLfJZm9sPQ2nqX5y5vep5lVRf9dMc/faEEXwSWCbxdtIVEoXrI6ehmCz
         aHgYX2XxSXTEy5kGgSQt6MTSXDqVyd+81ozLJIWQ7yrmIgSvbu6gdotSq+v66IJVTy
         dLUQBwgQLl7sg==
Date:   Sat, 15 May 2021 10:22:26 +0100
From:   Sean Young <sean@mess.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <20210515092226.GA31801@gofer.mess.org>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 14, 2021 at 01:16:47PM +0200, Johan Hovold wrote:
> On Tue, May 11, 2021 at 11:32:19AM +0100, Sean Young wrote:
> > On Mon, May 10, 2021 at 10:15:14AM +0200, Johan Hovold wrote:
> > > On Thu, May 06, 2021 at 01:44:52PM +0100, Sean Young wrote:
> > > > This is a new rc-core driver for the USB-UIRT which you can see here
> > > > http://www.usbuirt.com/
> > > > 
> > > > This device is supported in lirc, via the usb serial kernel driver. This
> > > > driver is both for rc-core, which means it can use kernel/BPF decoding
> > > > ec. Also this implement is superior because it can:
> > > >  - support learning mode
> > > >  - setting transmit carrier
> > > >  - larger transmits using streaming tx command
> > > 
> > > This looks like something which should have been implemented as a
> > > line-discipline or serdev driver instead of reimplementing a minimal
> > > on-off ftdi driver and tying it closely to the RC subsystem.
> > 
> > The device is an infrared device, I'm not sure what it is lost by
> > doing it this way. The "minimal on-off ftdi driver" is super trivial.
> 
> It's still code duplication (and I meant to say "one-off" above").
> 
> What is preventing you from supporting the above functionality through
> lirc?

I guess you mean the userspace lirc daemon, as opposed to the /dev/lirc
chardev. If you use the lirc daemon, you don't use rc-core which comes with
IR decoding using BPF IR decoding or in-kernel decoders, automatic setup of
rc keymaps via udev. None of the modern ir-ctl/ir-keytable tooling will
work, including the IRP encoder/BPF compiler I'm working on (very slowly).

The other nice thing is that IR TX feeds data from an urb interrupt handler,
so you don't need to rely userspace being scheduled quickly enough to feed
more data before the device runs out.

> 
> > > Why can't you just add support for the above features to whatever
> > > subsystem is managing this device today?
> > > 
> > > Serdev still doesn't support hotplugging unfortunately so that route may
> > > take a bit more work.
> > 
> > There seems to be at least three ways of attaching drivers to serial
> > devices: serio, serdev, and line-discipline. All seem to have limitations,
> > as you say none of them provide a way of hotplugging devices without
> > user-space attaching them through an ioctl or so.
> 
> serio is also a line-discipline driver, which unlike serdev needs to be
> set up by user space.

serio is unusable for this case. serio does not allow more than one byte
to be written nor does it have callbacks for CTS readiness.

> And the problem with serdev is that it does not (yet) support
> hotplugging (specifically hangups) so it can't be enabled for USB serial
> just yet.
> 
> > If you want to go down this route, then ideally you'd want a quirk on
> > fdti saying "attach usb-uirt serdev device to this pid/vid". Considering
> > module dependencies, I don't know how that could work without again
> > userspace getting involved.
> 
> We'd just reuse or add another matching mechanism for USB devices. This
> can be handled without user-space interaction just fine as long as you
> have a dedicated device id as you do here.

Right, ok. I don't quite follow what you have in mind. If at all possible
keep me in the loop for any patches for this, I'm happy to test/re-write
this driver and the drivers/media/rc/ir_toy.c driver on top of any such
patches.

There are a bunch old serial usb device IR devices and even older non-usb
serial devices that would be nice to have supported, if anyone is still
using them.

> > Getting userspace involved seem like a big song and dance because the
> > device uses an fdti device, even though it's not a serial port because
> > it's hardwired for infrared functions, no db9 connector in sight.
> 
> Far from every USB serial device have a db9 connector (e.g. modems,
> barcode scanners, development board consoles, etc.) and you still have a
> UART in your device.
> 
> In principle reimplementing a one-off ftdi driver is wrong but since
> parts of the infrastructure needed to avoid this is still missing it may
> be acceptable, especially if you can't get this to work with lirc.

Thanks -- that's a good compromise.


Sean

