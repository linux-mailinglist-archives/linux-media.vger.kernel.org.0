Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43C31CFC53
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 19:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730021AbgELRhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 13:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729583AbgELRhb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 13:37:31 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD742C061A0C;
        Tue, 12 May 2020 10:37:30 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id a4so6474217pgc.0;
        Tue, 12 May 2020 10:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mF3zM7DhrrKYo8fPBJUmFWHaEp8ZgiUqVWZDdjfP8EA=;
        b=UvAjbsDtM+eHXX5ax4LqffM7L/5Xq+FzLfDHIWEqqddK+2uVi4s6bL9BMLLFjLJKrP
         8wJsUO4dVpi6sv0gcbo/SSR69hwuOhPXzdBVZlVyfoXWnTBhwB4BYudZcNCoDfAMCCwC
         jukGPK172sa3aiFaxbVi+1DSLkdnE/B62Smegov8yZGJn4woOPyRkTF9MdGCwyUU1TV7
         Hj+r4elv+d6U6fMy1hwrJ4pLKqqZMh3lfH4x23mOhIndFWQSsKle3NUSWdhSGemJV8Jy
         VC8II7BfqWKh1oKGMMNHIQ9VY325rIbns9Uz6WMtJRlVv953dZ0HRV4bxQyz90AP/KJr
         CoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mF3zM7DhrrKYo8fPBJUmFWHaEp8ZgiUqVWZDdjfP8EA=;
        b=NLARMRzcnlfE0RCC2gDMi74o1Kwt1qDQGyvinO1COv2IoOYIki83JSjNmBFGKUBPu0
         omXL22x7ITEgJl8YHOVWj//xsqbFPPVQM906KhM8aHx5nQbMqy+jOznzXabFLKsjgzsU
         OqTPkrWbxwCzGP74h2+smhfXXymGREQx6w0kM7SZNHuA/t/Rpz3wTMSi4vouXa1HtBU3
         CaDi5Z3PjkD77KHy9CC6nTuuX8HIQnAq82Dq6HhDhT8ElWBVIpscZKO384hj31/O/Zf0
         /RgvV8Id7qgA4Rjyoli1kmj4FXblKnMyqexl1hYvRQzaCZY2DIZTgPVQnobP0S7XXOjd
         NVlQ==
X-Gm-Message-State: AGi0PuZbPhe+F1fHzYF494EqWzwGwtzD+AAHvSLHqIWscfHkrt9swFLc
        iNaopxPdu+bEIzt7Xdwa5Ag=
X-Google-Smtp-Source: APiQypJQAaLWOPYFbOyHRW289VI02mzFUNboy7l7mm7GIlYwSF8U+4IFpD5KlkLZ3mL7AEHEmPAzog==
X-Received: by 2002:aa7:8f2c:: with SMTP id y12mr23315202pfr.80.1589305050040;
        Tue, 12 May 2020 10:37:30 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 141sm12753685pfz.171.2020.05.12.10.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 10:37:29 -0700 (PDT)
Date:   Tue, 12 May 2020 10:37:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sean Young <sean@mess.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] input: serio: allow more than one byte to be sent at
 once
Message-ID: <20200512173727.GC89269@dtor-ws>
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
> 
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
> 
> > > > Ummm, serial protocol data size is at most 9 bits so I have no earthly
> > > > idea how they expect to get 16.
> 
> Which is just a tad insulting.

That was not meant to be insulting, however serial protocol defines that
the data size is at most 9 bits, so expecting that one can transmit
anything more than that _atomically_ is wrong. If your device/firmware
requires 16 bits to be transferred as indivisible units, then serial
port abstraction is wrong one to be used.

Now serio is layer "above" serial ports (but does not have to have
an underlying serial port) that provides byte-oriented communication
that is expected to mostly flow into host. Its does not expect heavy
data flows coming from the host and into the device (if you look at all
the touchscreens, psmouse, etc, they all send initialization sequences
to the device, and then all the data flows into the host). Therefore
there is little benefit in optimizing serio writes.

You are using performance clams as a clutch for the requirement of
sending u16s, but as I mentioned it is wrong if you use serial ports
abstraction layer. Greg mentioned ir-usb. You can maybe enhance it, or
create a similar driver that connects USB to rc-core and ensures that
you can communicate with the device with exact format it needs.

Thanks.

-- 
Dmitry
