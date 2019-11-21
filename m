Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75D6E10543E
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 15:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKUOTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 09:19:39 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35690 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfKUOTi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 09:19:38 -0500
Received: by mail-oi1-f195.google.com with SMTP id n16so3328881oig.2
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2019 06:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SMm41nTIaMQffcIgHthh0dggNuMk91SqgsY4cnQTp1w=;
        b=Gy+ghJkcQHgGrYnh0tjzR1lao8HeCcHDw1usexBEu2Z34w3+CplT0hbcnBqxk2lIqz
         0I0iSBpVlIb0U3FoxfAO28gPEoRi+DjG0iHM19218isUGk7Fu9Az+jk2Dt4qRHOE+xei
         RHADPfDxHZKWi1Sg0eu1RSTEFWhYLjmGkLcCqSDOrohrKbpAoiJc0HYetxFCiiVLRx/Y
         A4yPqWgMl3U6wWV/rt7WP1mgQCXP/rhidHqY5VjIML8JW6wS7UEI9t+2qZrVls9d/c+s
         86BLDg9nGAxtlhokrTlYqA47pvvkXMz5R9oTtaO5x/1J68CqYdm0Astcq+J/HeXhlBvU
         xGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SMm41nTIaMQffcIgHthh0dggNuMk91SqgsY4cnQTp1w=;
        b=n2YyTPgje2qWYEOo8zRTeHVxh2L5lD8fZNTCViWS2UsMQ6S9wGILYYb3gPIZ4CWAG8
         qD6UCxrxcgvgBOms+z/NqYSSUncxWplMfHEqrXGGkyCMhh4Pmbmi0cmMjOmKcB/JnQdT
         6FQevD45pufkDyfn/jXdwjWw7OR8r32i/hKgEKJ/sLNqYrkXLjQTlXWX5D7HZHSQewZo
         ibqFf/XUqAXlANRjqUXJu5BjUmBVS+LlYW7XaKWjGUegp4lU7UOcHrHwA+ZaOiWFXRp6
         P5IMR19X67+/NIFnTuHks0njU6c8AZdou/AT1734TowwUhf7CKMHIbb4txd5zkhswbuc
         nwhw==
X-Gm-Message-State: APjAAAWd5NVDLWnDancui8gKX0ExfspJjUIew+uJcewigwMIYjVAayav
        a6wfB2qjaHzJNwHUcdusrdtSsP8BsEMXX60c3To=
X-Google-Smtp-Source: APXvYqyPIxK1VR5gbVokhcDUf1h/RByg34vC3WMmHT4eKNJmK43OU2pcpFMgaN/e7YRwfW4E/Qxjk1GxtFSLU0N0chg=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr7961471oia.129.1574345976795;
 Thu, 21 Nov 2019 06:19:36 -0800 (PST)
MIME-Version: 1.0
References: <CABdg0zG8KzOBWMNDU8eDcjW_FA3zrdJBR7Fu_YQz-uwu1Gfwcg@mail.gmail.com>
 <CABdg0zGzR=2Qt5d+VR18j-gR-5vu0=QgnjKvcDW9g4g_ceGV_w@mail.gmail.com> <20191121102455.GA30519@gofer.mess.org>
In-Reply-To: <20191121102455.GA30519@gofer.mess.org>
From:   Nick French <nickfrench@gmail.com>
Date:   Thu, 21 Nov 2019 08:19:25 -0600
Message-ID: <CABdg0zETXD82WQu8idAciDwkLT+RFaR1tHY8otrYXaPNexgiBg@mail.gmail.com>
Subject: Re: ir_kbd_i2c oops
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, kraxel@bytesex.org,
        mkochano@pld.org.pl, lirc@bartelmus.de, ulrich.mueller42@web.de,
        jarod@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 21, 2019 at 4:24 AM Sean Young <sean@mess.org> wrote:
>
> Hi Nick,
>
> On Thu, Nov 21, 2019 at 12:44:42AM -0600, Nick French wrote:
> > On Mon, Nov 18, 2019 at 10:21 AM Nick French <nickfrench@gmail.com> wrote:
> > > I'm about to start trying to track down an intermittent oops in
> > > ir_kbd_i2c that I've been having for a long time over various recent
> > > kernels. It must be some kind of timing/race condition at startup,
> > > because I only get it about 5% of boots.
> > >
> > > Here's the relevant snippet from the log, if anyone has any smart
> > > ideas let me know. I should have better debugging data within the next
> > > week or so.
> > >
> > > ...
> > > Registered IR keymap rc-hauppauge
> > > rc rc0: Hauppauge WinTV PVR-350 as
> > > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
> > > input: Hauppauge WinTV PVR-350 as
> > > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
> > > BUG: kernel NULL pointer dereference, address: 0000000000000038
> > > #PF: supervisor read access in kernel mode
> > > #PF: error_code(0x0000) - not-present page
> > > PGD 0 P4D 0
> > > Oops: 0000 [#1] SMP PTI
> > > CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.11-300.fc31.x86_64 #1
> > > Hardware name:  /DG43NB, BIOS NBG4310H.86A.0096.2009.0903.1845 09/03/2009
> > > Workqueue: events ir_work [ir_kbd_i2c]
> > > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > > Call Trace:
> > > ir_do_keydown+0x8e/0x2b0
> > > rc_keydown+0x52/0xc0
> > > ir_work+0xb8/0x130 [ir_kbd_i2c]
> > > process_one_work+0x19d/0x340
> > > worker_thread+0x50/0x3b0
> > > kthread+0xfb/0x130
> > > ? process_one_work+0x340/0x340
> > > ? kthread_park+0x80/0x80
> > > ret_from_fork+0x35/0x40
> > > Modules linked in: rc_hauppauge tuner msp3400 saa7127 saa7115 ivtv(+)
> > > tveeprom cx2341x v4l2_common videodev mc i2c_algo_bit ir_kbd_i2c
> > > ip_tables firewire_ohci e1000e serio_raw firewire_core ata_generic
> > > crc_itu_t pata_acpi pata_jmicron fuse
> > > CR2: 0000000000000038
> > > ---[ end trace c67c2697a99fa74b ]---
> > > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > > rc rc0: lirc_dev: driver ir_kbd_i2c registered at minor = 0, scancode
> > > receiver, no transmitter
> > > tuner-simple 0-0061: creating new instance
> > > tuner-simple 0-0061: type set to 2 (Philips NTSC (FI1236,FM1236 and
> > > compatibles))
> > > ivtv0: Registered device video0 for encoder MPG (4096 kB)
> > > ivtv0: Registered device video32 for encoder YUV (2048 kB)
> > > ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
> > > ivtv0: Registered device video24 for encoder PCM (320 kB)
> > > ivtv0: Registered device radio0 for encoder radio
> > > ivtv0: Registered device video16 for decoder MPG (1024 kB)
> > > ivtv0: Registered device vbi8 for decoder VBI (64 kB)
> > > ivtv0: Registered device vbi16 for decoder VOUT
> > > ivtv0: Registered device video48 for decoder YUV (1024 kB)
> > > ...
> > >
> > > - Nick
> >
> > I haven't been able to recreate with a debug build yet, but I think I
> > see the problem:
> >
> > ir_kbd_i2c calls rc_register_device(), where the ordering of calls is this:
> >   dev->registered = true;
> >   rc_setup_rx_device(dev); <--calls rc_open()
> >   ir_lirc_register(dev); <--initializes lirc_fh/lirc_fh_lock
> >
> > however, ir_kbd_i2c's rc_open() callback schedules work whose
> > call-stack looks like:
> > ir_work()
> > ir_key_poll()
> > rc_keydown()
> > ir_do_keydown()
> > ir_lirc_scancode_event() <-- uses lirc_fh/lirc_hf_lock
> >
> > So basically if there is a keydown detection *during* ir_kbd_i2c
> > initialization, its going to oops accessing the uninitialized
> > lirc_fh_lock, I think?
> >
> > Not sure what to do with that info though, even if correct.
> > An 'is registered' check does no good, because the device is marked
> > registered before rc_setup_rx_device() happens. In fact rc_open()
> > already checks this.
> >
> > Hoping someone smarter than me can weigh in here...
>
> I think you have figured it out exactly. That's a highly unlikely race
> condition; in rc_register_device(), in between rc_setup_rx_device()
> and ir_lirc_register() user space must open the input device, and the
> ir_work must be scheduled and execute as well.
>
> The comment on ir_lirc_register() alludes to the same problem, which
> I considered for raw IR devices, but obviously not for scancode devices.
>
> It would be very useful to have this patch tested, I have never seen
> this race condition.
>
> Thanks!
>
> Sean
>
> From d14f6695982b86b383063e74fc6a4febf29248f3 Mon Sep 17 00:00:00 2001
> From: Sean Young <sean@mess.org>
> Date: Thu, 21 Nov 2019 10:10:47 +0000
> Subject: [PATCH] media: rc: ensure lirc is initialized before registering
>  input device
>
> Once rc_open is called on the input device, lirc events can be delivered.
> Ensure lirc is ready to do so else we might get this:
>
> Registered IR keymap rc-hauppauge
> rc rc0: Hauppauge WinTV PVR-350 as
> /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
> input: Hauppauge WinTV PVR-350 as
> /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
> BUG: kernel NULL pointer dereference, address: 0000000000000038
> PGD 0 P4D 0
> Oops: 0000 [#1] SMP PTI
> CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.11-300.fc31.x86_64 #1
> Hardware name:  /DG43NB, BIOS NBG4310H.86A.0096.2009.0903.1845 09/03/2009
> Workqueue: events ir_work [ir_kbd_i2c]
> RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> Call Trace:
> ir_do_keydown+0x8e/0x2b0
> rc_keydown+0x52/0xc0
> ir_work+0xb8/0x130 [ir_kbd_i2c]
> process_one_work+0x19d/0x340
> worker_thread+0x50/0x3b0
> kthread+0xfb/0x130
> ? process_one_work+0x340/0x340
> ? kthread_park+0x80/0x80
> ret_from_fork+0x35/0x40
> Modules linked in: rc_hauppauge tuner msp3400 saa7127 saa7115 ivtv(+)
> tveeprom cx2341x v4l2_common videodev mc i2c_algo_bit ir_kbd_i2c
> ip_tables firewire_ohci e1000e serio_raw firewire_core ata_generic
> crc_itu_t pata_acpi pata_jmicron fuse
> CR2: 0000000000000038
> ---[ end trace c67c2697a99fa74b ]---
> RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> rc rc0: lirc_dev: driver ir_kbd_i2c registered at minor = 0, scancode
> receiver, no transmitter
> tuner-simple 0-0061: creating new instance
> tuner-simple 0-0061: type set to 2 (Philips NTSC (FI1236,FM1236 and
> compatibles))
> ivtv0: Registered device video0 for encoder MPG (4096 kB)
> ivtv0: Registered device video32 for encoder YUV (2048 kB)
> ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
> ivtv0: Registered device video24 for encoder PCM (320 kB)
> ivtv0: Registered device radio0 for encoder radio
> ivtv0: Registered device video16 for decoder MPG (1024 kB)
> ivtv0: Registered device vbi8 for decoder VBI (64 kB)
> ivtv0: Registered device vbi16 for decoder VOUT
> ivtv0: Registered device video48 for decoder YUV (1024 kB)
>
> Cc: stable@vger.kernel.org
> Reported-by: Nick French <nickfrench@gmail.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/rc-main.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 7741151606ef..f29def4f35d8 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -1891,23 +1891,23 @@ int rc_register_device(struct rc_dev *dev)
>
>         dev->registered = true;
>
> -       if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
> -               rc = rc_setup_rx_device(dev);
> -               if (rc)
> -                       goto out_dev;
> -       }
> -
>         /* Ensure that the lirc kfifo is setup before we start the thread */
>         if (dev->allowed_protocols != RC_PROTO_BIT_CEC) {
>                 rc = ir_lirc_register(dev);
>                 if (rc < 0)
> -                       goto out_rx;
> +                       goto out_dev;
> +       }
> +
> +       if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
> +               rc = rc_setup_rx_device(dev);
> +               if (rc)
> +                       goto out_lirc;
>         }
>
>         if (dev->driver_type == RC_DRIVER_IR_RAW) {
>                 rc = ir_raw_event_register(dev);
>                 if (rc < 0)
> -                       goto out_lirc;
> +                       goto out_rx;
>         }
>
>         dev_dbg(&dev->dev, "Registered rc%u (driver: %s)\n", dev->minor,
> @@ -1915,11 +1915,11 @@ int rc_register_device(struct rc_dev *dev)
>
>         return 0;
>
> +out_rx:
> +       rc_free_rx_device(dev);
>  out_lirc:
>         if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
>                 ir_lirc_unregister(dev);
> -out_rx:
> -       rc_free_rx_device(dev);
>  out_dev:
>         device_del(&dev->dev);
>  out_rx_free:
> --
> 2.23.0
>

(re-sending to list)

Hey Sean,

Thanks for the amazingly quick response.

I built that patch and did a few reboots. Everything remains
functional in my setup (1 pvr350 + 1 pchdtv5500).
Obviously I can't verify the intermittent oopses are gone since I
cannot intentionally recreate them, but your patch certainly passes
the eyeball test.

Tested-by: Nick French <nickfrench@gmail.com>

On Thu, Nov 21, 2019 at 4:24 AM Sean Young <sean@mess.org> wrote:
>
> Hi Nick,
>
> On Thu, Nov 21, 2019 at 12:44:42AM -0600, Nick French wrote:
> > On Mon, Nov 18, 2019 at 10:21 AM Nick French <nickfrench@gmail.com> wrote:
> > > I'm about to start trying to track down an intermittent oops in
> > > ir_kbd_i2c that I've been having for a long time over various recent
> > > kernels. It must be some kind of timing/race condition at startup,
> > > because I only get it about 5% of boots.
> > >
> > > Here's the relevant snippet from the log, if anyone has any smart
> > > ideas let me know. I should have better debugging data within the next
> > > week or so.
> > >
> > > ...
> > > Registered IR keymap rc-hauppauge
> > > rc rc0: Hauppauge WinTV PVR-350 as
> > > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
> > > input: Hauppauge WinTV PVR-350 as
> > > /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
> > > BUG: kernel NULL pointer dereference, address: 0000000000000038
> > > #PF: supervisor read access in kernel mode
> > > #PF: error_code(0x0000) - not-present page
> > > PGD 0 P4D 0
> > > Oops: 0000 [#1] SMP PTI
> > > CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.11-300.fc31.x86_64 #1
> > > Hardware name:  /DG43NB, BIOS NBG4310H.86A.0096.2009.0903.1845 09/03/2009
> > > Workqueue: events ir_work [ir_kbd_i2c]
> > > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > > Call Trace:
> > > ir_do_keydown+0x8e/0x2b0
> > > rc_keydown+0x52/0xc0
> > > ir_work+0xb8/0x130 [ir_kbd_i2c]
> > > process_one_work+0x19d/0x340
> > > worker_thread+0x50/0x3b0
> > > kthread+0xfb/0x130
> > > ? process_one_work+0x340/0x340
> > > ? kthread_park+0x80/0x80
> > > ret_from_fork+0x35/0x40
> > > Modules linked in: rc_hauppauge tuner msp3400 saa7127 saa7115 ivtv(+)
> > > tveeprom cx2341x v4l2_common videodev mc i2c_algo_bit ir_kbd_i2c
> > > ip_tables firewire_ohci e1000e serio_raw firewire_core ata_generic
> > > crc_itu_t pata_acpi pata_jmicron fuse
> > > CR2: 0000000000000038
> > > ---[ end trace c67c2697a99fa74b ]---
> > > RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> > > Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> > > e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> > > 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> > > RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> > > RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> > > RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> > > RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> > > R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> > > R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> > > FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> > > rc rc0: lirc_dev: driver ir_kbd_i2c registered at minor = 0, scancode
> > > receiver, no transmitter
> > > tuner-simple 0-0061: creating new instance
> > > tuner-simple 0-0061: type set to 2 (Philips NTSC (FI1236,FM1236 and
> > > compatibles))
> > > ivtv0: Registered device video0 for encoder MPG (4096 kB)
> > > ivtv0: Registered device video32 for encoder YUV (2048 kB)
> > > ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
> > > ivtv0: Registered device video24 for encoder PCM (320 kB)
> > > ivtv0: Registered device radio0 for encoder radio
> > > ivtv0: Registered device video16 for decoder MPG (1024 kB)
> > > ivtv0: Registered device vbi8 for decoder VBI (64 kB)
> > > ivtv0: Registered device vbi16 for decoder VOUT
> > > ivtv0: Registered device video48 for decoder YUV (1024 kB)
> > > ...
> > >
> > > - Nick
> >
> > I haven't been able to recreate with a debug build yet, but I think I
> > see the problem:
> >
> > ir_kbd_i2c calls rc_register_device(), where the ordering of calls is this:
> >   dev->registered = true;
> >   rc_setup_rx_device(dev); <--calls rc_open()
> >   ir_lirc_register(dev); <--initializes lirc_fh/lirc_fh_lock
> >
> > however, ir_kbd_i2c's rc_open() callback schedules work whose
> > call-stack looks like:
> > ir_work()
> > ir_key_poll()
> > rc_keydown()
> > ir_do_keydown()
> > ir_lirc_scancode_event() <-- uses lirc_fh/lirc_hf_lock
> >
> > So basically if there is a keydown detection *during* ir_kbd_i2c
> > initialization, its going to oops accessing the uninitialized
> > lirc_fh_lock, I think?
> >
> > Not sure what to do with that info though, even if correct.
> > An 'is registered' check does no good, because the device is marked
> > registered before rc_setup_rx_device() happens. In fact rc_open()
> > already checks this.
> >
> > Hoping someone smarter than me can weigh in here...
>
> I think you have figured it out exactly. That's a highly unlikely race
> condition; in rc_register_device(), in between rc_setup_rx_device()
> and ir_lirc_register() user space must open the input device, and the
> ir_work must be scheduled and execute as well.
>
> The comment on ir_lirc_register() alludes to the same problem, which
> I considered for raw IR devices, but obviously not for scancode devices.
>
> It would be very useful to have this patch tested, I have never seen
> this race condition.
>
> Thanks!
>
> Sean
>
> From d14f6695982b86b383063e74fc6a4febf29248f3 Mon Sep 17 00:00:00 2001
> From: Sean Young <sean@mess.org>
> Date: Thu, 21 Nov 2019 10:10:47 +0000
> Subject: [PATCH] media: rc: ensure lirc is initialized before registering
>  input device
>
> Once rc_open is called on the input device, lirc events can be delivered.
> Ensure lirc is ready to do so else we might get this:
>
> Registered IR keymap rc-hauppauge
> rc rc0: Hauppauge WinTV PVR-350 as
> /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
> input: Hauppauge WinTV PVR-350 as
> /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
> BUG: kernel NULL pointer dereference, address: 0000000000000038
> PGD 0 P4D 0
> Oops: 0000 [#1] SMP PTI
> CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.11-300.fc31.x86_64 #1
> Hardware name:  /DG43NB, BIOS NBG4310H.86A.0096.2009.0903.1845 09/03/2009
> Workqueue: events ir_work [ir_kbd_i2c]
> RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> Call Trace:
> ir_do_keydown+0x8e/0x2b0
> rc_keydown+0x52/0xc0
> ir_work+0xb8/0x130 [ir_kbd_i2c]
> process_one_work+0x19d/0x340
> worker_thread+0x50/0x3b0
> kthread+0xfb/0x130
> ? process_one_work+0x340/0x340
> ? kthread_park+0x80/0x80
> ret_from_fork+0x35/0x40
> Modules linked in: rc_hauppauge tuner msp3400 saa7127 saa7115 ivtv(+)
> tveeprom cx2341x v4l2_common videodev mc i2c_algo_bit ir_kbd_i2c
> ip_tables firewire_ohci e1000e serio_raw firewire_core ata_generic
> crc_itu_t pata_acpi pata_jmicron fuse
> CR2: 0000000000000038
> ---[ end trace c67c2697a99fa74b ]---
> RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
> Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
> e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
> 38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
> RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
> RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
> RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
> RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
> R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
> R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
> FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
> rc rc0: lirc_dev: driver ir_kbd_i2c registered at minor = 0, scancode
> receiver, no transmitter
> tuner-simple 0-0061: creating new instance
> tuner-simple 0-0061: type set to 2 (Philips NTSC (FI1236,FM1236 and
> compatibles))
> ivtv0: Registered device video0 for encoder MPG (4096 kB)
> ivtv0: Registered device video32 for encoder YUV (2048 kB)
> ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
> ivtv0: Registered device video24 for encoder PCM (320 kB)
> ivtv0: Registered device radio0 for encoder radio
> ivtv0: Registered device video16 for decoder MPG (1024 kB)
> ivtv0: Registered device vbi8 for decoder VBI (64 kB)
> ivtv0: Registered device vbi16 for decoder VOUT
> ivtv0: Registered device video48 for decoder YUV (1024 kB)
>
> Cc: stable@vger.kernel.org
> Reported-by: Nick French <nickfrench@gmail.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/rc-main.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 7741151606ef..f29def4f35d8 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -1891,23 +1891,23 @@ int rc_register_device(struct rc_dev *dev)
>
>         dev->registered = true;
>
> -       if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
> -               rc = rc_setup_rx_device(dev);
> -               if (rc)
> -                       goto out_dev;
> -       }
> -
>         /* Ensure that the lirc kfifo is setup before we start the thread */
>         if (dev->allowed_protocols != RC_PROTO_BIT_CEC) {
>                 rc = ir_lirc_register(dev);
>                 if (rc < 0)
> -                       goto out_rx;
> +                       goto out_dev;
> +       }
> +
> +       if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
> +               rc = rc_setup_rx_device(dev);
> +               if (rc)
> +                       goto out_lirc;
>         }
>
>         if (dev->driver_type == RC_DRIVER_IR_RAW) {
>                 rc = ir_raw_event_register(dev);
>                 if (rc < 0)
> -                       goto out_lirc;
> +                       goto out_rx;
>         }
>
>         dev_dbg(&dev->dev, "Registered rc%u (driver: %s)\n", dev->minor,
> @@ -1915,11 +1915,11 @@ int rc_register_device(struct rc_dev *dev)
>
>         return 0;
>
> +out_rx:
> +       rc_free_rx_device(dev);
>  out_lirc:
>         if (dev->allowed_protocols != RC_PROTO_BIT_CEC)
>                 ir_lirc_unregister(dev);
> -out_rx:
> -       rc_free_rx_device(dev);
>  out_dev:
>         device_del(&dev->dev);
>  out_rx_free:
> --
> 2.23.0
>
