Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB4411908C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 20:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLJT0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 14:26:16 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39083 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfLJT0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 14:26:16 -0500
Received: by mail-oi1-f195.google.com with SMTP id a67so10913164oib.6
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2019 11:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WVHVkfcvfgpQqMRQujPWSRu4i8i1Sky9CuD1MxlO2TM=;
        b=Fm7Zf5V93aR4mkGweA2dDD5nHLL8tAYMiTQ2JTjwMz2U3VNDQiyAFlGIrfbwSOJJ5W
         06A6+RnJWYGf3vmm8ztvJSLjnY0/Wx5EmeNcSu2h/wy4d++HsxTa/ifspVqxI5ts6FtV
         oPy6oMUuiOaaw/cLyGhKANcpyI4iti9pk3r28Aq8xRHJ0hefmW2SvZKF2GDnOi6PGo1S
         jx+zCYJLXCbdtarmjeW/3JF9NRuzR+CUDKQek0Zs4xLm6vo+FdxX2h9WFrfF8uKx31V5
         RjzdFEibZKqjt7XAwM7BB457USLGxPa8Avrf2xV/6pRfIYVRofQ5isHy2kYb/5ddtei5
         jnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WVHVkfcvfgpQqMRQujPWSRu4i8i1Sky9CuD1MxlO2TM=;
        b=Lg8CELjyKeMr+8/EK8y0ZVPGZmnLAEsKNCs7AHpOIjMQ8yPZoKJVJUypW5Nq57QBUP
         hCSjyquFsJ+di+DwpDcnO/a+mGdoB0dm9pMYcLHH9PwPTeiDQilhbZbAlJZ96qNXxW0q
         7m8YU3DtWLXT/0KdPh5c6RWMZrYhI2/053BadzUB0tYkHlN/1g8t8WBO3j4LGYvQz8hO
         yKKqmpdd69jyUl/J+qr9VKV5pcNgWuphZCL03Os9eW5RFvxPw5ARAFp2LsilukEjaRuw
         OBoqtPbDAp+oLhSeZPllx/j2Y+eZcPhvnKX+yE8cqfzWlR3UgqPBEWpPIufwgT6PZyIg
         eTjg==
X-Gm-Message-State: APjAAAW9ACgDO19+TQZK/5rjqTB6yEVGp0W613AQDKJ2FLIpWDHnCeho
        1wBsUT711b2/uFC5yNkMmXWVSOGWXGsGJf95JW0WipUmOZjIXw==
X-Google-Smtp-Source: APXvYqzy9L5FKzu4dAmV9kL8pFKaF0/9q135c5psvtplqYwDKXI8tIxsoqgL1Rf2nnPySj41JlV4zY97sPDlU8qajyE=
X-Received: by 2002:aca:4ad1:: with SMTP id x200mr424833oia.104.1576005975009;
 Tue, 10 Dec 2019 11:26:15 -0800 (PST)
MIME-Version: 1.0
References: <CABdg0zG8KzOBWMNDU8eDcjW_FA3zrdJBR7Fu_YQz-uwu1Gfwcg@mail.gmail.com>
 <CABdg0zGzR=2Qt5d+VR18j-gR-5vu0=QgnjKvcDW9g4g_ceGV_w@mail.gmail.com>
 <20191121102455.GA30519@gofer.mess.org> <CABdg0zETXD82WQu8idAciDwkLT+RFaR1tHY8otrYXaPNexgiBg@mail.gmail.com>
In-Reply-To: <CABdg0zETXD82WQu8idAciDwkLT+RFaR1tHY8otrYXaPNexgiBg@mail.gmail.com>
From:   Nick French <nickfrench@gmail.com>
Date:   Tue, 10 Dec 2019 13:26:02 -0600
Message-ID: <CABdg0zHh8WFxui36F5SQaB8yBu4iWvNOk-NntbVoKxw0R5Ssog@mail.gmail.com>
Subject: Re: ir_kbd_i2c oops
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 21, 2019 at 8:19 AM Nick French <nickfrench@gmail.com> wrote:
>
> On Thu, Nov 21, 2019 at 4:24 AM Sean Young <sean@mess.org> wrote:
> >
> > Hi Nick,
> >
> > On Thu, Nov 21, 2019 at 12:44:42AM -0600, Nick French wrote:
> > > On Mon, Nov 18, 2019 at 10:21 AM Nick French <nickfrench@gmail.com> wrote:
> > > > I'm about to start trying to track down an intermittent oops in
> > > > ir_kbd_i2c that I've been having for a long time over various recent
> > > > kernels. It must be some kind of timing/race condition at startup,
> > > > because I only get it about 5% of boots.
> > > >
> > > > Here's the relevant snippet from the log, if anyone has any smart
> > > > ideas let me know. I should have better debugging data within the next
> > > > week or so.
> > > >
> > > > ...
> > > > Registered IR keymap rc-hauppauge
> > > > rc rc0: Hauppauge WinTV PVR-350 as
> > > > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
> > > > input: Hauppauge WinTV PVR-350 as
> > > > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
> > > > BUG: kernel NULL pointer dereference, address: 0000000000000038
> > > > #PF: supervisor read access in kernel mode
> > > > #PF: error_code(0x0000) - not-present page
> > > > PGD 0 P4D 0
> > > > Oops: 0000 [#1] SMP PTI
> > > > CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.11-300.fc31.x86_64 #1
> > > > Hardware name:  /DG43NB, BIOS NBG4310H.86A.0096.2009.0903.1845 09/03/2009
> > > > Workqueue: events ir_work [ir_kbd_i2c]
> > > > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > > > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > > > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > > > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > > > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > > > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > > > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > > > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > > > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > > > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > > > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > > > Call Trace:
> > > > ir_do_keydown+0x8e/0x2b0
> > > > rc_keydown+0x52/0xc0
> > > > ir_work+0xb8/0x130 [ir_kbd_i2c]
> > > > process_one_work+0x19d/0x340
> > > > worker_thread+0x50/0x3b0
> > > > kthread+0xfb/0x130
> > > > ? process_one_work+0x340/0x340
> > > > ? kthread_park+0x80/0x80
> > > > ret_from_fork+0x35/0x40
> > > > Modules linked in: rc_hauppauge tuner msp3400 saa7127 saa7115 ivtv(+)
> > > > tveeprom cx2341x v4l2_common videodev mc i2c_algo_bit ir_kbd_i2c
> > > > ip_tables firewire_ohci e1000e serio_raw firewire_core ata_generic
> > > > crc_itu_t pata_acpi pata_jmicron fuse
> > > > CR2: 0000000000000038
> > > > ---[ end trace c67c2697a99fa74b ]---
> > > > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > > > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > > > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > > > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > > > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > > > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > > > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > > > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > > > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > > > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > > > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > > > rc rc0: lirc_dev: driver ir_kbd_i2c registered at minor = 0, scancode
> > > > receiver, no transmitter
> > > > tuner-simple 0-0061: creating new instance
> > > > tuner-simple 0-0061: type set to 2 (Philips NTSC (FI1236,FM1236 and
> > > > compatibles))
> > > > ivtv0: Registered device video0 for encoder MPG (4096 kB)
> > > > ivtv0: Registered device video32 for encoder YUV (2048 kB)
> > > > ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
> > > > ivtv0: Registered device video24 for encoder PCM (320 kB)
> > > > ivtv0: Registered device radio0 for encoder radio
> > > > ivtv0: Registered device video16 for decoder MPG (1024 kB)
> > > > ivtv0: Registered device vbi8 for decoder VBI (64 kB)
> > > > ivtv0: Registered device vbi16 for decoder VOUT
> > > > ivtv0: Registered device video48 for decoder YUV (1024 kB)
> > > > ...
> > > >
> > > > - Nick
> > >
> > > I haven't been able to recreate with a debug build yet, but I think I
> > > see the problem:
> > >
> > > ir_kbd_i2c calls rc_register_device(), where the ordering of calls is this:
> > >   dev->registered = true;
> > >   rc_setup_rx_device(dev); <--calls rc_open()
> > >   ir_lirc_register(dev); <--initializes lirc_fh/lirc_fh_lock
> > >
> > > however, ir_kbd_i2c's rc_open() callback schedules work whose
> > > call-stack looks like:
> > > ir_work()
> > > ir_key_poll()
> > > rc_keydown()
> > > ir_do_keydown()
> > > ir_lirc_scancode_event() <-- uses lirc_fh/lirc_hf_lock
> > >
> > > So basically if there is a keydown detection *during* ir_kbd_i2c
> > > initialization, its going to oops accessing the uninitialized
> > > lirc_fh_lock, I think?
> > >
> > > Not sure what to do with that info though, even if correct.
> > > An 'is registered' check does no good, because the device is marked
> > > registered before rc_setup_rx_device() happens. In fact rc_open()
> > > already checks this.
> > >
> > > Hoping someone smarter than me can weigh in here...
> >
> > I think you have figured it out exactly. That's a highly unlikely race
> > condition; in rc_register_device(), in between rc_setup_rx_device()
> > and ir_lirc_register() user space must open the input device, and the
> > ir_work must be scheduled and execute as well.
> >
> > The comment on ir_lirc_register() alludes to the same problem, which
> > I considered for raw IR devices, but obviously not for scancode devices.
> >
> > It would be very useful to have this patch tested, I have never seen
> > this race condition.
> >
> > Thanks!
> >
> > Sean
> >
> > From d14f6695982b86b383063e74fc6a4febf29248f3 Mon Sep 17 00:00:00 2001
> > From: Sean Young <sean@mess.org>
> > Date: Thu, 21 Nov 2019 10:10:47 +0000
> > Subject: [PATCH] media: rc: ensure lirc is initialized before registering
> >  input device
> >
> > Once rc_open is called on the input device, lirc events can be delivered.
> > Ensure lirc is ready to do so else we might get this:
> >
> > Registered IR keymap rc-hauppauge
> > rc rc0: Hauppauge WinTV PVR-350 as
> > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
> > input: Hauppauge WinTV PVR-350 as
> > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
> > BUG: kernel NULL pointer dereference, address: 0000000000000038
> > PGD 0 P4D 0
> > Oops: 0000 [#1] SMP PTI
> > CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.11-300.fc31.x86_64 #1
> > Hardware name:  /DG43NB, BIOS NBG4310H.86A.0096.2009.0903.1845 09/03/2009
> > Workqueue: events ir_work [ir_kbd_i2c]
> > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > Call Trace:
> > ir_do_keydown+0x8e/0x2b0
> > rc_keydown+0x52/0xc0
> > ir_work+0xb8/0x130 [ir_kbd_i2c]
> > process_one_work+0x19d/0x340
> > worker_thread+0x50/0x3b0
> > kthread+0xfb/0x130
> > ? process_one_work+0x340/0x340
> > ? kthread_park+0x80/0x80
> > ret_from_fork+0x35/0x40
> > Modules linked in: rc_hauppauge tuner msp3400 saa7127 saa7115 ivtv(+)
> > tveeprom cx2341x v4l2_common videodev mc i2c_algo_bit ir_kbd_i2c
> > ip_tables firewire_ohci e1000e serio_raw firewire_core ata_generic
> > crc_itu_t pata_acpi pata_jmicron fuse
> > CR2: 0000000000000038
> > ---[ end trace c67c2697a99fa74b ]---
> > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > rc rc0: lirc_dev: driver ir_kbd_i2c registered at minor = 0, scancode
> > receiver, no transmitter
> > tuner-simple 0-0061: creating new instance
> > tuner-simple 0-0061: type set to 2 (Philips NTSC (FI1236,FM1236 and
> > compatibles))
> > ivtv0: Registered device video0 for encoder MPG (4096 kB)
> > ivtv0: Registered device video32 for encoder YUV (2048 kB)
> > ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
> > ivtv0: Registered device video24 for encoder PCM (320 kB)
> > ivtv0: Registered device radio0 for encoder radio
> > ivtv0: Registered device video16 for decoder MPG (1024 kB)
> > ivtv0: Registered device vbi8 for decoder VBI (64 kB)
> > ivtv0: Registered device vbi16 for decoder VOUT
> > ivtv0: Registered device video48 for decoder YUV (1024 kB)
> >
> > Cc: stable@vger.kernel.org
> > Reported-by: Nick French <nickfrench@gmail.com>
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> >  drivers/media/rc/rc-main.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> > index 7741151606ef..f29def4f35d8 100644
> > --- a/drivers/media/rc/rc-main.c
> > +++ b/drivers/media/rc/rc-main.c
> > @@ -1891,23 +1891,23 @@ int rc_register_device(struct rc_dev *dev)
> >
> >         dev->registered = true;
> >
> > -       if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
> > -               rc = rc_setup_rx_device(dev);
> > -               if (rc)
> > -                       goto out_dev;
> > -       }
> > -
> >         /* Ensure that the lirc kfifo is setup before we start the thread */
> >         if (dev->allowed_protocols != RC_PROTO_BIT_CEC) {
> >                 rc = ir_lirc_register(dev);
> >                 if (rc < 0)
> > -                       goto out_rx;
> > +                       goto out_dev;
> > +       }
> > +
> > +       if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
> > +               rc = rc_setup_rx_device(dev);
> > +               if (rc)
> > +                       goto out_lirc;
> >         }
> >
> >         if (dev->driver_type == RC_DRIVER_IR_RAW) {
> >                 rc = ir_raw_event_register(dev);
> >                 if (rc < 0)
> > -                       goto out_lirc;
> > +                       goto out_rx;
> >         }
> >
> >         dev_dbg(&dev->dev, "Registered rc%u (driver: %s)\n", dev->minor,
> > @@ -1915,11 +1915,11 @@ int rc_register_device(struct rc_dev *dev)
> >
> >         return 0;
> >
> > +out_rx:
> > +       rc_free_rx_device(dev);
> >  out_lirc:
> >         if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
> >                 ir_lirc_unregister(dev);
> > -out_rx:
> > -       rc_free_rx_device(dev);
> >  out_dev:
> >         device_del(&dev->dev);
> >  out_rx_free:
> > --
> > 2.23.0
> >
>
> (re-sending to list)
>
> Hey Sean,
>
> Thanks for the amazingly quick response.
>
> I built that patch and did a few reboots. Everything remains
> functional in my setup (1 pvr350 + 1 pchdtv5500).
> Obviously I can't verify the intermittent oopses are gone since I
> cannot intentionally recreate them, but your patch certainly passes
> the eyeball test.
>
> Tested-by: Nick French <nickfrench@gmail.com>

Sean,

A quick update: still no oops after ~2.5 weeks of running with above patch.

The ~2.5 weeks is a significant amount of time without an oops
compared to previous unpatched kernels at ~3 oops/week (the box powers
on/off multiple times per day so it gets lots of bootup-timing
samples), so I'm personally convinced your patch is indeed a stability
improvement.

- Nick
