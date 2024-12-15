Return-Path: <linux-media+bounces-23432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB559F239D
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 13:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9A6165AC2
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 12:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A153717B50F;
	Sun, 15 Dec 2024 12:12:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB57148FF6
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734264751; cv=none; b=lVEysLaRtR7EEoPd72gu7dZlQDUs3DDq/BgCUbr4baF3cAQCgNzX/Vh5aLSYmPrRA2UG63At4ZAzJK0nlDmFUkJvPqPfAFCBsjPI5M4iOTEZ48E9TQOpGhcwvBAmzjnPLB6NkP+LLApnLM78R+GyapN6PTe/4vbQvfn8JhD8Rbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734264751; c=relaxed/simple;
	bh=AYlTEFpWIncjRpZQPffyZDlLYSxAWaU1Ave5Ue9IMSQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TP+PLEr6dVEDcXbFFCwmnkh+WvOyEp/A3BRmnHkLYXKxc7hLtDMO0LDXvcah7PWBOSnyLsKjlopJlzB9U4eT6WMwMXIRkP3WkQKV6dKR6uDV90q0A/WgM5c9vAQKNqbVMrXqD1pUHw7lNdLaOUQ1c3qdP9fIVnXTqpxfrYKQZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-844db0decffso289725939f.0
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 04:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734264749; x=1734869549;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOL9s/OQ6MNT6UGsGpZsjo3MmE6YYjvHLOxHAwyHjm0=;
        b=vRA8EcvZY7GGDioSZoDAbUajqsSb8Z+zYAu/NjTd73Ehe+CG9Y4S23pTrmaW+f1PuJ
         LFKCxQ9b8iwk/e7NnIM/wXKYx0UfzSTQWRGij/fVvxs3B3qgyHTnqc4CDHwUng9ennh4
         LSqFE760f8hVT04lawRqYqsOHEgfqjdqh9HrfQ8g8oyP9StHnpg/UulksURAgekEGo0M
         1jokXu5YMs8D0Pypi7MOp4EeGpEwbU5RTddkRpNvudgg4CbaoOZLEEvdZZMYtw+Q9rgT
         E7mL0vvh05eZtBVXaqieLnGDFWk9pVyF8TXN6tyzeo6sBVhfo/66rGCISjd+0Yy0B3q+
         sBxA==
X-Forwarded-Encrypted: i=1; AJvYcCVHy3VXeC0fCgT8TQ1tKAt/z6P8VlxuMUMDF7IHZiee5DHAJYasefmZLdXE4Tx0GcNCyTVew03SK+yhGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8fUu1SGeHO9TAXFlS+FYQGilIodi2rhs1j+vgrq9MCJJqAK4
	NFnbMJ9uzpVAZsgQlqp4hPggB8ukfb0bt05G7IcZX59b+BuCk+kpQ3+mFF3ID7Li2XKzID8JLX4
	rHcG5SUQKSsgrW558wU6CgsfKsAnSH01QEwLh/Isfy8Wv3hlC87LkAZ4=
X-Google-Smtp-Source: AGHT+IFUeBrcc2QCuF0+CuTx0GFY7B+Ia2Os/4nKWE/1sZmNSz+EU/eK1rK7hjjPuG8VagdLXkezG47kYg+UyuQ0jmGBDkQTz926
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:238a:b0:3a7:e1c3:11f5 with SMTP id
 e9e14a558f8ab-3b02adcc3acmr79077925ab.6.1734264748854; Sun, 15 Dec 2024
 04:12:28 -0800 (PST)
Date: Sun, 15 Dec 2024 04:12:28 -0800
In-Reply-To: <0000000000008cabee0614a97e81@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675ec7ac.050a0220.37aaf.00f9.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in call_s_stream
From: syzbot <syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com>
To: hverkuil-cisco@xs4all.nl, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2d8308bf5b67 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=149594f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b874549ac3d0b012
dashboard link: https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ba07e8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10bac344580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-2d8308bf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f42110acb18e/vmlinux-2d8308bf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d819752d1b01/bzImage-2d8308bf.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com

0 pages HighMem/MovableOnly
281646 pages reserved
0 pages cma reserved
vimc vimc.0: subdev_call error Scaler
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5933 at drivers/media/v4l2-core/v4l2-subdev.c:460 call_s_stream+0x2df/0x350 drivers/media/v4l2-core/v4l2-subdev.c:460
Modules linked in:
CPU: 0 UID: 0 PID: 5933 Comm: syz-executor330 Not tainted 6.13.0-rc2-syzkaller-00362-g2d8308bf5b67 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:call_s_stream+0x2df/0x350 drivers/media/v4l2-core/v4l2-subdev.c:460
Code: c1 ea 03 80 3c 02 00 75 75 48 8b bb 08 01 00 00 44 89 e2 48 c7 c6 00 17 4f 8c e8 bc 43 39 fe e9 54 fe ff ff e8 62 79 0e fa 90 <0f> 0b 90 e9 cb fe ff ff 4c 89 f7 e8 11 27 71 fa e9 48 fd ff ff e8
RSP: 0018:ffffc900035cfa60 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8880275bf020 RCX: ffffffff878b879e
RDX: ffff8880216e0000 RSI: ffffffff878b8a1e RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: dffffc0000000000
R13: 0000000000000000 R14: ffff8880275bf198 R15: ffffffff87de3560
FS:  0000555584c4b380(0000) GS:ffff88806a600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffee98411d8 CR3: 0000000034912000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vimc_streamer_pipeline_terminate+0x218/0x320 drivers/media/test-drivers/vimc/vimc-streamer.c:62
 vimc_streamer_pipeline_init drivers/media/test-drivers/vimc/vimc-streamer.c:101 [inline]
 vimc_streamer_s_stream+0x650/0x9a0 drivers/media/test-drivers/vimc/vimc-streamer.c:203
 vimc_capture_start_streaming+0xa1/0x130 drivers/media/test-drivers/vimc/vimc-capture.c:256
 vb2_start_streaming+0x15f/0x5a0 drivers/media/common/videobuf2/videobuf2-core.c:1789
 vb2_core_streamon+0x2a7/0x450 drivers/media/common/videobuf2/videobuf2-core.c:2348
 vb2_streamon drivers/media/common/videobuf2/videobuf2-v4l2.c:875 [inline]
 vb2_ioctl_streamon+0xf4/0x170 drivers/media/common/videobuf2/videobuf2-v4l2.c:1118
 __video_do_ioctl+0xaf0/0xf00 drivers/media/v4l2-core/v4l2-ioctl.c:3122
 video_usercopy+0x4d2/0x1620 drivers/media/v4l2-core/v4l2-ioctl.c:3463
 v4l2_ioctl+0x1ba/0x250 drivers/media/v4l2-core/v4l2-dev.c:366
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2b85c01b19
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffee98412d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f2b85c01b19
RDX: 0000000020000000 RSI: 0000000040045612 RDI: 0000000000000005
RBP: 00007f2b85c430f3 R08: 00007ffee9841077 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f2b85c431c6
R13: 00007ffee98412f0 R14: 00007f2b85c43014 R15: 00007f2b85c4314b
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

