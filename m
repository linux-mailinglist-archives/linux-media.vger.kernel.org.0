Return-Path: <linux-media+bounces-21773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 505FE9D522E
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 18:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07E84283215
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 17:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6841BC9ED;
	Thu, 21 Nov 2024 17:55:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D1E84D2B
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732211728; cv=none; b=q92qQ3uCfZjeFspqkSKfk9OTN9m+DtfeByKzdl4MhvRbpyQBhvr4k4Ph3k/ErcicuECjeWTp4dVbkJ00/T6MUs0hBMZXdfhF2RMq+m/PvHsrj3P7gT4JZZsAr4SEEMb0oXkFcqISXjlJ0pIEu0FnZV/riWkYPLU8rkPpwa3naMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732211728; c=relaxed/simple;
	bh=qvSTtWhD+omkV7VikIZQkBvz1jy4lT7cGgCyhgq2SRg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P7zUqadepkirirJyNVVHEKJ9fi5B81yXztYkHodaoykBLC3x+e1mDvLg7mOsXsd0QmUuwLwURbe5D6fDb7gMhF0Q7GUQ7rjMXVR0mtZgLoZWNpTeLa965Jgl09ua/Jda1IAzdwLSOdO4l1WGorhv4KcS6GZ7QsGgyFRBQ7RS+pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a77085a3d7so11285195ab.1
        for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 09:55:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732211726; x=1732816526;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHhClMdGtDjT4X3yHnt9hiqF0G95yB3Wlf2mO5iKwdk=;
        b=UwLM8c5rUpUMOL7byGN4qb7gEnoITx8l1XvdAziAAgalgIPHzuj+ZWIiCbQ9ZlNkCf
         02xyDPg6++w8B2SP6Z+2CO96qsjRpGT4r4rBQHUBp1tJG0NXRFHjCC+9vR0I2dVgjhuU
         kPPgQOZh/cG5Al4PBhC68RpW97DTJDGEJdkGmg6gsT6E65xB7Tz6VOPzl0bvxahrttTX
         RXjspBD5YSLKiazO2mp4BIaACOAZbSIGmb+pQoSbapZGoeyGczO7I/XXyc6JKPfW12p3
         WweyK1PDsnjkvpPjh7sQqNb1uZWy77/MBVOg3mEK+eaJom5BB7NdrdErKRjLRSLwNdb8
         2RtA==
X-Forwarded-Encrypted: i=1; AJvYcCUWRBo7PtwZbogkVIu9cDnYWl5hM03c7lxoQSiSpl+C2hrO9e7g1GNYkea2rnHO3nmf3yUj7s/pjPHpBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXEXVEHgfnVzhI7jAXLxkS/GsI0eDXGnKNuN8IlKzDTFyxg2xD
	8ji30UHJ/qUtdKKireiAc5zVlYoX58/B4GJ6cJqs9BwmI8zdBDJLIe6ElSHAT8b0ScCdMSCnHZH
	SgEpEM6GPzs7TnenvHi5Qe8Ybkab04GgkRleGFFCqDpMIKw9Upu/IqeY=
X-Google-Smtp-Source: AGHT+IE9JpiwGVbhxMcc5IXOkF6NEgdJNfVFmwfRLV5n/WdTtgATVRnWcQK0e238cIpe9ztCzHMjHINDMpyR54Iorc4MO+KXNMus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1647:b0:3a7:8c66:562c with SMTP id
 e9e14a558f8ab-3a79a5e1263mr1456265ab.3.1732211725867; Thu, 21 Nov 2024
 09:55:25 -0800 (PST)
Date: Thu, 21 Nov 2024 09:55:25 -0800
In-Reply-To: <66f5cc9a.050a0220.46d20.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673f740d.050a0220.3c9d61.0176.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in iguanair_probe/usb_submit_urb (2)
From: syzbot <syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    43fb83c17ba2 Merge tag 'soc-arm-6.13' of git://git.kernel...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14515930580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58b000b917043826
dashboard link: https://syzkaller.appspot.com/bug?extid=ffba8e636870dac0e0c0
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12515930580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ca8ec0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/de84c4bb2d99/disk-43fb83c1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5ef479f28791/vmlinux-43fb83c1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/896a530ab113/bzImage-43fb83c1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ffba8e636870dac0e0c0@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff88801dace300 submitted while active
WARNING: CPU: 0 PID: 3069 at drivers/usb/core/urb.c:379 usb_submit_urb+0x14da/0x1730 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 0 UID: 0 PID: 3069 Comm: kworker/0:2 Not tainted 6.12.0-syzkaller-03657-g43fb83c17ba2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0x14da/0x1730 drivers/usb/core/urb.c:379
Code: fd eb cb bb fe ff ff ff e9 c1 f3 ff ff e8 be bc b2 fa c6 05 50 c9 6d 09 01 90 48 c7 c7 c0 c9 2d 8c 48 89 de e8 77 64 73 fa 90 <0f> 0b 90 90 e9 b6 fe ff ff bb f8 ff ff ff e9 91 f3 ff ff 48 89 ef
RSP: 0018:ffffc9000bc1f038 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff88801dace300 RCX: ffffffff814e8a49
RDX: ffff8880311a0000 RSI: ffffffff814e8a56 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffff88801dace300
R13: ffff888028821030 R14: ffff8880288210a8 R15: ffff888022378000
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005fdeb8 CR3: 000000000df7e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 iguanair_send drivers/media/rc/iguanair.c:193 [inline]
 iguanair_get_features drivers/media/rc/iguanair.c:218 [inline]
 iguanair_probe+0xe78/0x22a0 drivers/media/rc/iguanair.c:438
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3672
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3672
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d9a/0x4e10 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

