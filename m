Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45242100919
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2019 17:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRQVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Nov 2019 11:21:21 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44379 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbfKRQVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Nov 2019 11:21:21 -0500
Received: by mail-ot1-f68.google.com with SMTP id c19so14981823otr.11
        for <linux-media@vger.kernel.org>; Mon, 18 Nov 2019 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=lwYyts7IR31JntCPJY2iIx3Yo8EegCwmIT2zsSl2Ef0=;
        b=OKEbPmRhJ3i7rFStuog5LA0yGAvANB63HonQXly4rNXdxgmmxYYrBDi1L6htvHCPbK
         Pdaos7KntWI8G8WxNKu5lV6tFLqP3DaKdfuNgOUycaSwWO7+IDxbyda3Wyoh5VR2BMaj
         Y3LExIWFTDhRVYoQN0KA+CJebPRO5p+FflwWBC6pEh5EQMJ5zDn5jxcGLRwbF6Ltv1DI
         UFuNRb+NpSYte9MUAe1uGLhj0iVvJTyREFRf/3jzBJ2MslI84mDhIvV0dgIN0ITQ/HgX
         rCYtA6lvt8ao+zHwFpUSlJEVXPOTIUnqvrYwj/j0FGFsJdlsUAzuceypC1HNDT/PdGD5
         wa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lwYyts7IR31JntCPJY2iIx3Yo8EegCwmIT2zsSl2Ef0=;
        b=OnIBVsizKbU3uk619H4uhPbAkW7KyAlNgEp+Q12H3Ou1S7Ap04Eoj6VK1WokgEUaYu
         3zyfG8IiKJBST2tDCRLtvfLHLEpOK9Nse76L46le3nzZHWKhUqsbhUwJLFHHetDNQE+9
         u5K6aIXvaRZPZw56i1/MUg+F3bOIXlYTh9pEmZh0OqC1IGg2/rwnqJRGIcMoEHWnMyuu
         Bz/fcpUwf/Nn6NmPMGQvElvMHCmtBHCpYQxa+Xav3sE4mwbV8hHp1KKCnCcA/Su01KIU
         xU7xV1IllaktTVhyJXvm2SIH2Ny4QS1F51fEtDMqquOf7Ad/WHsw7/twBCHz/dZtnQVh
         4Y5g==
X-Gm-Message-State: APjAAAVkARgelI8MR+6pSCIBWlHSYNBsgs4FYKAUDlzkSCKGUbZ9VvPF
        7SwpIFcxsMd/F9KvOfUg3aw9rdgoLBNUc7UjBlGEH8V2UNo=
X-Google-Smtp-Source: APXvYqy+H7GPIHey823bHM4/Si+MO5icJsZnbNqJLGWovEbyj92EZ+SQ+X9HOS+OHI8zZJ3EO1+aWBWPxFd2gon1t64=
X-Received: by 2002:a05:6830:4a2:: with SMTP id l2mr92675otd.192.1574094078825;
 Mon, 18 Nov 2019 08:21:18 -0800 (PST)
MIME-Version: 1.0
From:   Nick French <nickfrench@gmail.com>
Date:   Mon, 18 Nov 2019 10:21:07 -0600
Message-ID: <CABdg0zG8KzOBWMNDU8eDcjW_FA3zrdJBR7Fu_YQz-uwu1Gfwcg@mail.gmail.com>
Subject: ir_kbd_i2c oops
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all,

I'm about to start trying to track down an intermittent oops in
ir_kbd_i2c that I've been having for a long time over various recent
kernels. It must be some kind of timing/race condition at startup,
because I only get it about 5% of boots.

Here's the relevant snippet from the log, if anyone has any smart
ideas let me know. I should have better debugging data within the next
week or so.

...
Registered IR keymap rc-hauppauge
rc rc0: Hauppauge WinTV PVR-350 as
/devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0
input: Hauppauge WinTV PVR-350 as
/devices/pci0000:00/0000:00:1e.0/0000:04:00.0/i2c-0/0-0018/rc/rc0/input9
BUG: kernel NULL pointer dereference, address: 0000000000000038
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] SMP PTI
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.11-300.fc31.x86_64 #1
Hardware name:  /DG43NB, BIOS NBG4310H.86A.0096.2009.0903.1845 09/03/2009
Workqueue: events ir_work [ir_kbd_i2c]
RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
Call Trace:
ir_do_keydown+0x8e/0x2b0
rc_keydown+0x52/0xc0
ir_work+0xb8/0x130 [ir_kbd_i2c]
process_one_work+0x19d/0x340
worker_thread+0x50/0x3b0
kthread+0xfb/0x130
? process_one_work+0x340/0x340
? kthread_park+0x80/0x80
ret_from_fork+0x35/0x40
Modules linked in: rc_hauppauge tuner msp3400 saa7127 saa7115 ivtv(+)
tveeprom cx2341x v4l2_common videodev mc i2c_algo_bit ir_kbd_i2c
ip_tables firewire_ohci e1000e serio_raw firewire_core ata_generic
crc_itu_t pata_acpi pata_jmicron fuse
CR2: 0000000000000038
---[ end trace c67c2697a99fa74b ]---
RIP: 0010:ir_lirc_scancode_event+0x3d/0xb0
Code: a6 b4 07 00 00 49 81 c6 b8 07 00 00 55 53 e8 ba a7 9d ff 4c 89
e7 49 89 45 00 e8 5e 7a 25 00 49 8b 1e 48 89 c5 4c 39 f3 74 58 <8b> 43
38 8b 53 40 89 c1 2b 4b 3c 39 ca 72 41 21 d0 49 8b 7d 00 49
RSP: 0018:ffffaae2000b3d88 EFLAGS: 00010017
RAX: 0000000000000002 RBX: 0000000000000000 RCX: 0000000000000019
RDX: 0000000000000001 RSI: 006e801b1f26ce6a RDI: ffff9e39797c37b4
RBP: 0000000000000002 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000001 R12: ffff9e39797c37b4
R13: ffffaae2000b3db8 R14: ffff9e39797c37b8 R15: ffff9e39797c33d8
FS:  0000000000000000(0000) GS:ffff9e397b680000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000038 CR3: 0000000035844000 CR4: 00000000000006e0
rc rc0: lirc_dev: driver ir_kbd_i2c registered at minor = 0, scancode
receiver, no transmitter
tuner-simple 0-0061: creating new instance
tuner-simple 0-0061: type set to 2 (Philips NTSC (FI1236,FM1236 and
compatibles))
ivtv0: Registered device video0 for encoder MPG (4096 kB)
ivtv0: Registered device video32 for encoder YUV (2048 kB)
ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
ivtv0: Registered device video24 for encoder PCM (320 kB)
ivtv0: Registered device radio0 for encoder radio
ivtv0: Registered device video16 for decoder MPG (1024 kB)
ivtv0: Registered device vbi8 for decoder VBI (64 kB)
ivtv0: Registered device vbi16 for decoder VOUT
ivtv0: Registered device video48 for decoder YUV (1024 kB)
...

- Nick
