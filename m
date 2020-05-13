Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A161D0AA8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 10:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732080AbgEMIQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 04:16:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730127AbgEMIQu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 04:16:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B14F320673;
        Wed, 13 May 2020 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589357809;
        bh=rsI2U+x4/Gm7XrR6f6K48fiAR9xJmXIbk7lQHBey9NY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KckMHzdeYY8VBZ9gq5pTkCg8Zsv1VTSYRlHTSJ383KMas0WwCVioNSPh/LXgwlIwS
         HiB+Bq+4rNBRXejqNLQsWAtbItGmEAhwMlG3N6m1uX/PF6jYRBFmCDmNXAV7ZNxCwa
         rzlnGyzn5nA407CH51kAb1L3TVbvStXwaiKJgfrg=
Date:   Wed, 13 May 2020 10:16:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sean Young <sean@mess.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] input: serio: allow more than one byte to be sent at
 once
Message-ID: <20200513081646.GA770255@kroah.com>
References: <20200507135337.2343-1-sean@mess.org>
 <20200507135337.2343-2-sean@mess.org>
 <20200507202546.GM89269@dtor-ws>
 <20200507205918.GA13370@gofer.mess.org>
 <20200511065118.GA1293993@kroah.com>
 <20200512090724.GA31990@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512090724.GA31990@gofer.mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 12, 2020 at 10:07:24AM +0100, Sean Young wrote:
> On Mon, May 11, 2020 at 08:51:18AM +0200, Greg KH wrote:
> > On Thu, May 07, 2020 at 09:59:18PM +0100, Sean Young wrote:
> > > On Thu, May 07, 2020 at 01:25:46PM -0700, Dmitry Torokhov wrote:
> > > > On Thu, May 07, 2020 at 02:53:36PM +0100, Sean Young wrote:
> > > > > serio drivers can only send one byte at a time. If the underlying tty
> > > > > is a usb serial port, then each byte will be put into separate usb
> > > > > urbs, which is not efficient.
> > > > > 
> > > > > Additionally, the Infrared Toy device refuses to transmit IR if the
> > > > > IR data is sent one byte at a time. IR data is formatted in u16 values,
> > > > > and the firmware expects complete u16 values in the packet.
> > > > > 
> > > > > https://github.com/DangerousPrototypes/USB_IR_Toy/blob/master/Firmware-main/IRs.c#L240
> > > > 
> > > > Ummm, serial protocol data size is at most 9 bits so I have no earthly
> > > > idea how they expect to get 16.
> > > 
> > > serio is a layer on top several serial protocols, including ttys. ttys allow
> > > more than one byte to be written at a time, see struct tty_operations:
> > > 
> > >         int  (*write)(struct tty_struct * tty,
> > >                       const unsigned char *buf, int count);
> > > 
> > > ttys would be very inefficient if you could only write one byte at a time,
> > > and they are very serial.
> > > 
> > > This patch exposes the underlying tty write() functionality to serio. When
> > > the underlying tty is a usb serial port this makes for far fewer usb packets
> > > being used to send the same data, and fixes my driver problem, and it
> > > would reduce the number of calls in a few other cases too.
> > > 
> > > I'm happy to rework the patch if there are comments on the style or
> > > approach.
> > 
> > Why not just use the ir-usb.c driver for this device instead?
> 
> So this device is the infrared kind which rc-core (in drivers/media/rc/)
> supports, remotes and such things (not for serial IR). So by using a 
> rc-core driver, it can use kernel IR decoding, BPF decoding, lirc chardev
> and rc keymaps, etc.

So why do you want to user serio for this?  serio should only be for
input devices with a serial protocol.

> This device is a PIC18F2550 type device, which is a usb serial port
> microcontroller type with some firmware and IR diodes:
> 	http://dangerousprototypes.com/docs/USB_IR_Toy_v2
> 
> serio supports a whole bunch of usb serial devices which can be attached
> via inputattach(1). Not all of these are input devices, for example there
> are two cec devices too.
> 
> Now, in many of these drivers, multiple bytes need to be written to the
> device in order to send it a command, for example in
> drivers/input/touchscreen/elo.c:
> 
>         for (i = 0; i < ELO10_PACKET_LEN; i++) {
>                 csum += packet[i];
>                 if (serio_write(elo->serio, packet[i]))
>                         goto out;
>         }
> 
> So if serio had an interface for sending a buffer, that would be less
> call overhead. In fact, if the underlying serio is a serial usb port,
> that would much more efficient on the usb layer too (one usb roundtrips in
> stead of ELO10_PACKET_LEN roundtrips), like so:
> 
> 	serio_write_buf(elo->serio, packet, ELO10_PACKET_LEN);
> 
> So what I'm suggesting is extending the serio interface to allow sending
> a buffer of bytes. Of course serio isn't just usb serial ports. There quite
> a few instances of serio_register_port() in the kernel. Many of them
> can be extended to support sending a buffer rather than a single byte,
> if this makes sense. For example the ps2 serio port takes a mutex for every
> byte, so this could be more efficient by reducing it to one mutex lock
> per buffer.
> 
> Now it would be nice to have a discussion about this rather than being
> dismissed with:

I think a custom usb driver that exposes the interfaces as input devices
is going to be the simplest thing for you to do here as you will have
full control over the packet size and format much easier.  Odds are it
will be less work overall for this.

thanks,

greg k-h
