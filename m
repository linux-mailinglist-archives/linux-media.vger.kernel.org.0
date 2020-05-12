Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19FE1CF10A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgELJH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728854AbgELJH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:07:28 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84648C061A0C
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:07:28 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 09A1EC63B0; Tue, 12 May 2020 10:07:24 +0100 (BST)
Date:   Tue, 12 May 2020 10:07:24 +0100
From:   Sean Young <sean@mess.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] input: serio: allow more than one byte to be sent at
 once
Message-ID: <20200512090724.GA31990@gofer.mess.org>
References: <20200507135337.2343-1-sean@mess.org>
 <20200507135337.2343-2-sean@mess.org>
 <20200507202546.GM89269@dtor-ws>
 <20200507205918.GA13370@gofer.mess.org>
 <20200511065118.GA1293993@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511065118.GA1293993@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 11, 2020 at 08:51:18AM +0200, Greg KH wrote:
> On Thu, May 07, 2020 at 09:59:18PM +0100, Sean Young wrote:
> > On Thu, May 07, 2020 at 01:25:46PM -0700, Dmitry Torokhov wrote:
> > > On Thu, May 07, 2020 at 02:53:36PM +0100, Sean Young wrote:
> > > > serio drivers can only send one byte at a time. If the underlying tty
> > > > is a usb serial port, then each byte will be put into separate usb
> > > > urbs, which is not efficient.
> > > > 
> > > > Additionally, the Infrared Toy device refuses to transmit IR if the
> > > > IR data is sent one byte at a time. IR data is formatted in u16 values,
> > > > and the firmware expects complete u16 values in the packet.
> > > > 
> > > > https://github.com/DangerousPrototypes/USB_IR_Toy/blob/master/Firmware-main/IRs.c#L240
> > > 
> > > Ummm, serial protocol data size is at most 9 bits so I have no earthly
> > > idea how they expect to get 16.
> > 
> > serio is a layer on top several serial protocols, including ttys. ttys allow
> > more than one byte to be written at a time, see struct tty_operations:
> > 
> >         int  (*write)(struct tty_struct * tty,
> >                       const unsigned char *buf, int count);
> > 
> > ttys would be very inefficient if you could only write one byte at a time,
> > and they are very serial.
> > 
> > This patch exposes the underlying tty write() functionality to serio. When
> > the underlying tty is a usb serial port this makes for far fewer usb packets
> > being used to send the same data, and fixes my driver problem, and it
> > would reduce the number of calls in a few other cases too.
> > 
> > I'm happy to rework the patch if there are comments on the style or
> > approach.
> 
> Why not just use the ir-usb.c driver for this device instead?

So this device is the infrared kind which rc-core (in drivers/media/rc/)
supports, remotes and such things (not for serial IR). So by using a 
rc-core driver, it can use kernel IR decoding, BPF decoding, lirc chardev
and rc keymaps, etc.

This device is a PIC18F2550 type device, which is a usb serial port
microcontroller type with some firmware and IR diodes:
	http://dangerousprototypes.com/docs/USB_IR_Toy_v2

serio supports a whole bunch of usb serial devices which can be attached
via inputattach(1). Not all of these are input devices, for example there
are two cec devices too.

Now, in many of these drivers, multiple bytes need to be written to the
device in order to send it a command, for example in
drivers/input/touchscreen/elo.c:

        for (i = 0; i < ELO10_PACKET_LEN; i++) {
                csum += packet[i];
                if (serio_write(elo->serio, packet[i]))
                        goto out;
        }

So if serio had an interface for sending a buffer, that would be less
call overhead. In fact, if the underlying serio is a serial usb port,
that would much more efficient on the usb layer too (one usb roundtrips in
stead of ELO10_PACKET_LEN roundtrips), like so:

	serio_write_buf(elo->serio, packet, ELO10_PACKET_LEN);

So what I'm suggesting is extending the serio interface to allow sending
a buffer of bytes. Of course serio isn't just usb serial ports. There quite
a few instances of serio_register_port() in the kernel. Many of them
can be extended to support sending a buffer rather than a single byte,
if this makes sense. For example the ps2 serio port takes a mutex for every
byte, so this could be more efficient by reducing it to one mutex lock
per buffer.

Now it would be nice to have a discussion about this rather than being
dismissed with:

> > > Ummm, serial protocol data size is at most 9 bits so I have no earthly
> > > idea how they expect to get 16.

Which is just a tad insulting.


Sean
