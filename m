Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF8E104AD1
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2019 07:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfKUGo5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Nov 2019 01:44:57 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:40216 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKUGo5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Nov 2019 01:44:57 -0500
Received: by mail-oi1-f193.google.com with SMTP id d22so2223128oic.7
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 22:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b1NWuEHKT/ZKVyznzXe6dqG/WmSBtWXohc3JHKwitvU=;
        b=Kc0neAm2vhnvqidEsp0GbAvbv7gTpTawsmpphNDS6lWipgx2WF84f8HKl7nmhSPkON
         rMa9o5nF4U3GaBkSVOg2AeiD84kQNXUTC5JJwBXqO45CiZOrJkpdyu5DgSPZSbGGsFe+
         y5F1K/1/rdCz2ptjtZbG8lRNMPfjZCtEzTG152n+YantyYN44TmLIddaE4fcRE+zrdaa
         i6SoxSfQ9rLAx+/eoH8lqynhhZKVWPafWliw+/V1f3+vHR9qyVklJlscmE5ZAFeBSjY1
         CblJF3AC6QwICU2VVHFwPA/q6yDEWi0YYK0I1l1T5/WHCAelRvc0DHR5lehphKG6YnB3
         DqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b1NWuEHKT/ZKVyznzXe6dqG/WmSBtWXohc3JHKwitvU=;
        b=rCdb53ab1p4Q+LF8KgH6KppMWSuc/wCsogaejQ3tPmBcmZ+3XISEbEM2bhCaYzbFc9
         3NvxNQD34+aclWRMm3DGjLOilajqW+5Z9HoJ2XkO9RNFXBRL5vaSisf6uZ2YWrxEmin5
         96Om+dCq4bnpt8/36n/w3LuHVdk11ccDgxO8GCWB6STWvIa4hUGQDuLQnsmsII1Bhfx0
         9zG9cEEgrfgOOu6rchAMHdjPska4SMIDA8KTNhaOCJjll+Vty0CbLUld9wmTICQz6mZw
         PaFZlNNbE9EuwfMOgpSilu/5vAKggGkmKNWvjjMxKiBWCFbNk6q2Z0jBcCzx/5pj+RE6
         vYew==
X-Gm-Message-State: APjAAAXTvK2mUt+uGlbtltZFXRnCH3/4JwCQP7YK0O3nBRRbocqjjE+l
        OVmrAAvh/VIRrCWGztHXjImEDW26tEjSZ2H4Z3L3yymiCuKqpQ==
X-Google-Smtp-Source: APXvYqzzAYi0F/fPfcesVjUyNbNzJQsZ6yU9eNtCO0lcvZEJQNstgSZkhRV7tSqmdmqqBaIi3dGM1iNnqQIfqePo6+c=
X-Received: by 2002:aca:2811:: with SMTP id 17mr6044582oix.46.1574318693766;
 Wed, 20 Nov 2019 22:44:53 -0800 (PST)
MIME-Version: 1.0
References: <CABdg0zG8KzOBWMNDU8eDcjW_FA3zrdJBR7Fu_YQz-uwu1Gfwcg@mail.gmail.com>
In-Reply-To: <CABdg0zG8KzOBWMNDU8eDcjW_FA3zrdJBR7Fu_YQz-uwu1Gfwcg@mail.gmail.com>
From:   Nick French <nickfrench@gmail.com>
Date:   Thu, 21 Nov 2019 00:44:42 -0600
Message-ID: <CABdg0zGzR=2Qt5d+VR18j-gR-5vu0=QgnjKvcDW9g4g_ceGV_w@mail.gmail.com>
Subject: Re: ir_kbd_i2c oops
To:     linux-media@vger.kernel.org
Cc:     kraxel@bytesex.org, mkochano@pld.org.pl, lirc@bartelmus.de,
        ulrich.mueller42@web.de, jarod@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 18, 2019 at 10:21 AM Nick French <nickfrench@gmail.com> wrote:
>
> Hello all,
>
> I'm about to start trying to track down an intermittent oops in
> ir_kbd_i2c that I've been having for a long time over various recent
> kernels. It must be some kind of timing/race condition at startup,
> because I only get it about 5% of boots.
>
> Here's the relevant snippet from the log, if anyone has any smart
> ideas let me know. I should have better debugging data within the next
> week or so.
>
> ...
> Registered IR keymap rc-hauppauge
> rc rc0: Hauppauge WinTV PVR-350 as
> /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
> input: Hauppauge WinTV PVR-350 as
> /devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
> BUG: kernel NULL pointer dereference, address: 0000000000000038
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
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
> ...
>
> - Nick

I haven't been able to recreate with a debug build yet, but I think I
see the problem:

ir_kbd_i2c calls rc_register_device(), where the ordering of calls is this:
  dev->registered = true;
  rc_setup_rx_device(dev); <--calls rc_open()
  ir_lirc_register(dev); <--initializes lirc_fh/lirc_fh_lock

however, ir_kbd_i2c's rc_open() callback schedules work whose
call-stack looks like:
ir_work()
ir_key_poll()
rc_keydown()
ir_do_keydown()
ir_lirc_scancode_event() <-- uses lirc_fh/lirc_hf_lock

So basically if there is a keydown detection *during* ir_kbd_i2c
initialization, its going to oops accessing the uninitialized
lirc_fh_lock, I think?

Not sure what to do with that info though, even if correct.
An 'is registered' check does no good, because the device is marked
registered before rc_setup_rx_device() happens. In fact rc_open()
already checks this.

Hoping someone smarter than me can weigh in here...

Thanks,
Nick
