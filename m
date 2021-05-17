Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35B8382858
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 11:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbhEQJcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 05:32:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:44308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235863AbhEQJb6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 05:31:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBB1E611CC;
        Mon, 17 May 2021 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621243841;
        bh=0isyKzJBz2glDSCHaGYr98WTCKtZiZtdG2mRXWGAAOU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J4FsMlugZne44eq4ZjgLA+C1wedd8PEfxhaKxTOthJgGVzZlWAYBVfknafkY7aBWr
         ADND+ji7nUN0jFEM5h/Ptlz5E9gFIm2KDOQK7PEIG4gqsLpP4exm5flIBPfP3Ytqg/
         fT/29azLXdLvmhkBn5rMWlmujSPePevsfztJCYl4RqFCYZRZV369pXk1JmUXTpOFTC
         wIxRE8PSLO0f8CSwOKltZD/4jU8Mw0+mFOhaEFlmolc4g9bn2bClN1e/gH+x1uq6xH
         EXgD9eZncoZeARHVnGliDNnvnzN6mmyy9Sddj8PzBFA5CL6zzVbaTVbbJzK6d7oxQo
         /AwEKInP7h0vQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1liZaB-0003iT-6j; Mon, 17 May 2021 11:30:39 +0200
Date:   Mon, 17 May 2021 11:30:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 0/3] IR driver for USB-UIRT device
Message-ID: <YKI3vyOE8XmpNAuC@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <YJjrkhfN9Sgq6UX8@hovoldconsulting.com>
 <20210511103219.GA13769@gofer.mess.org>
 <YJ5cH1Z5MdZHE8HU@hovoldconsulting.com>
 <20210515092226.GA31801@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515092226.GA31801@gofer.mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 15, 2021 at 10:22:26AM +0100, Sean Young wrote:
> On Fri, May 14, 2021 at 01:16:47PM +0200, Johan Hovold wrote:
> > On Tue, May 11, 2021 at 11:32:19AM +0100, Sean Young wrote:
> > > On Mon, May 10, 2021 at 10:15:14AM +0200, Johan Hovold wrote:
> > > > On Thu, May 06, 2021 at 01:44:52PM +0100, Sean Young wrote:
> > > > > This is a new rc-core driver for the USB-UIRT which you can see here
> > > > > http://www.usbuirt.com/
> > > > > 
> > > > > This device is supported in lirc, via the usb serial kernel driver. This
> > > > > driver is both for rc-core, which means it can use kernel/BPF decoding
> > > > > ec. Also this implement is superior because it can:
> > > > >  - support learning mode
> > > > >  - setting transmit carrier
> > > > >  - larger transmits using streaming tx command
> > > > 
> > > > This looks like something which should have been implemented as a
> > > > line-discipline or serdev driver instead of reimplementing a minimal
> > > > on-off ftdi driver and tying it closely to the RC subsystem.
> > > 
> > > The device is an infrared device, I'm not sure what it is lost by
> > > doing it this way. The "minimal on-off ftdi driver" is super trivial.
> > 
> > It's still code duplication (and I meant to say "one-off" above").
> > 
> > What is preventing you from supporting the above functionality through
> > lirc?
> 
> I guess you mean the userspace lirc daemon, as opposed to the /dev/lirc
> chardev. If you use the lirc daemon, you don't use rc-core which comes with
> IR decoding using BPF IR decoding or in-kernel decoders, automatic setup of
> rc keymaps via udev. None of the modern ir-ctl/ir-keytable tooling will
> work, including the IRP encoder/BPF compiler I'm working on (very slowly).

Ok, but apart from BPF that sound like other stuff and not the three
items you list above? Is there anything preventing those items from
being implemented in user space?

Obviously a user-space implementation (e.g. accessing the device through
/dev/ttyUSB0) is not going to be able to use in-kernel RC functionality.
For that you'd need to use either a line-discipline or serdev driver,
that is, a kernel driver, but not everything has to live in the kernel.

> The other nice thing is that IR TX feeds data from an urb interrupt handler,
> so you don't need to rely userspace being scheduled quickly enough to feed
> more data before the device runs out.

The tty layer and tty drivers provide write buffering so that need not
be an issue.

> > > > Why can't you just add support for the above features to whatever
> > > > subsystem is managing this device today?
> > > > 
> > > > Serdev still doesn't support hotplugging unfortunately so that route may
> > > > take a bit more work.
> > > 
> > > There seems to be at least three ways of attaching drivers to serial
> > > devices: serio, serdev, and line-discipline. All seem to have limitations,
> > > as you say none of them provide a way of hotplugging devices without
> > > user-space attaching them through an ioctl or so.
> > 
> > serio is also a line-discipline driver, which unlike serdev needs to be
> > set up by user space.
> 
> serio is unusable for this case. serio does not allow more than one byte
> to be written nor does it have callbacks for CTS readiness.

Ok, but you could still implement this as an rc-core line-discipline or
serdev driver. And when you use hardware flow control as you do here,
you shouldn't need any callbacks for CTS events either, right?
 
> > And the problem with serdev is that it does not (yet) support
> > hotplugging (specifically hangups) so it can't be enabled for USB serial
> > just yet.
> > 
> > > If you want to go down this route, then ideally you'd want a quirk on
> > > fdti saying "attach usb-uirt serdev device to this pid/vid". Considering
> > > module dependencies, I don't know how that could work without again
> > > userspace getting involved.
> > 
> > We'd just reuse or add another matching mechanism for USB devices. This
> > can be handled without user-space interaction just fine as long as you
> > have a dedicated device id as you do here.
> 
> Right, ok. I don't quite follow what you have in mind. If at all possible
> keep me in the loop for any patches for this, I'm happy to test/re-write
> this driver and the drivers/media/rc/ir_toy.c driver on top of any such
> patches.

Thanks for that pointer. Judging from a quick look, the new driver
appears to based on this one. By abstracting the serial interface bits
in a generic RC serdev/ldisc driver you may be able reuse more code,
even if I'm not in a position to judge how much of the IR protocol bits
that can be shared.

> There are a bunch old serial usb device IR devices and even older non-usb
> serial devices that would be nice to have supported, if anyone is still
> using them.

I noticed that drivers/media/rc/serial_ir.c also appears to use a
similar approach of implementing a minimal one-off serial (8250?) driver
and tying it closely to RC core. This one might also benefit from using
the standard serial drivers for the transport and having an RC layer on
top.

Currently it appears to use module-parameters for configuration instead
of devicetree or some to-be-implemented interface for instantiating
serdev devices from user space.

Johan
