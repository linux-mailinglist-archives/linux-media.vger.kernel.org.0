Return-Path: <linux-media+bounces-30350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8295A8B9AD
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A6678A00E0
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A50A14F9E2;
	Wed, 16 Apr 2025 12:57:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54D184E
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808246; cv=none; b=R/8lPsYRj+qK3V829w408LU7BZnd5P6yHeBYS7EJDqf25cgXiGlxH4BKH8G7AVOrjo0xIDsUYuQFAtAz1I+ZhR9PqxqTD7gEgDMvrGiNFg6pvsAHHNe2VkXWZRPTqgFS+TpP4M43WFbEj0M9SREBZS/UZR1NTms6m2x60A5QMAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808246; c=relaxed/simple;
	bh=hMbhS79Mfn3XqB2vVxZ9w/HPqdOZ3hTT8ZETPJC/w5k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=TvjFJl16D/1SmEHc8oIQClJl1zaRag+abT8Unu3C7RZtuEd3/z7AxxYqXYR9caHF4drZ0tDIDOyatkfbkkeBWXCSQYpbHKvr3o+6xyPQM9fJcbhKvKulYtv4xLbbxGAZMDIrIa2dDwKiCy7RQYDCsg8s6Nj98RNfHMf5VvxrhpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d5da4fd944so79601985ab.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808243; x=1745413043;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNAm+gwGmliDc62AX9Wt9ewTcdS/eTMF5peaZWNPeKU=;
        b=ACdc9bj+30Wzva+TWFnWSwStVpWD7qVR70E9bsVRoD+syJj2HMvFQxa3D6jV5SIHgU
         kjEXCkSwXANg8RozzWA8cJh2Mx+ka/+PYREqBBNcHvFfZE+O0dwFej6xC5xwAtgyPHkZ
         zdia0QlAS0Mk4Loi1d6QkL3Y7/UFcROu7v1vgk/upFBR7iVwDSPvpX9RQSaTfjUhAlEN
         IJm9noae2p8QV7kF9Al5Eu7/QxPGv9SEJeJESDG1p9SV/zFyqDd2/VYb/Ah1exfw/pae
         9+C1osTVYMvetIt8BN7a9TljvmOaphzgY2Hx28/s6bVcySro5SHzeImNznDW52y06lnN
         NxMA==
X-Forwarded-Encrypted: i=1; AJvYcCWuigfHLf2q5ueOYfTO+qODLuwPiaf7nynrciGT2A2813XwZ/yjlZrz3UQ6vJJ/s/S9f4zYcF2EvgLYCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrexcIBNhYxrFwpZiq0dYv3UJUlCrMrXjjKelFnxSmdLkJzRAG
	tLnUYO+xolt2logSGPE7Fwen2PZMEcLgKgF/3eDyl6uzvnKLAdQS/TTBWb7d82b2Z39S1U8hxy+
	gGv5gdXfgZGIsAGiulAJ4pprhyrigHdTyxmFqicnzTzlsMY82cTQ5XG4=
X-Google-Smtp-Source: AGHT+IEY2/JxH5fF9jbc8XKb8qFntQdM+RGVVdkkk+xhSLw6bFB9Mo2uLJDTvXw8tFH9bxn5OkJODujswRD5/C6zaaoaTVLbx77z
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:148b:b0:3d5:df21:8481 with SMTP id
 e9e14a558f8ab-3d81598394fmr18668225ab.0.1744808243706; Wed, 16 Apr 2025
 05:57:23 -0700 (PDT)
Date: Wed, 16 Apr 2025 05:57:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ffa933.050a0220.243d89.0004.GAE@google.com>
Subject: [syzbot] [media?] WARNING: refcount bug in dvb_device_open
From: syzbot <syzbot+0aea3ca127fe06c384f7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e618ee89561b Merge tag 'spi-fix-v6.15-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=109b8a3f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a4e108575159039
dashboard link: https://syzkaller.appspot.com/bug?extid=0aea3ca127fe06c384f7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6e9ff64c0a63/disk-e618ee89.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5a0301cd26c2/vmlinux-e618ee89.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d51cf55acedf/bzImage-e618ee89.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0aea3ca127fe06c384f7@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: saturated; leaking memory.
WARNING: CPU: 1 PID: 9920 at lib/refcount.c:22 refcount_warn_saturate+0xd4/0x210 lib/refcount.c:22
Modules linked in:
CPU: 1 UID: 0 PID: 9920 Comm: syz.5.1429 Not tainted 6.15.0-rc1-syzkaller-00288-ge618ee89561b #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:refcount_warn_saturate+0xd4/0x210 lib/refcount.c:22
Code: 7d a1 0b 31 ff 89 de e8 4a e5 ed fc 84 db 75 dc e8 61 ea ed fc c6 05 2f 7d a1 0b 01 90 48 c7 c7 40 fa f3 8b e8 ed 7b ad fc 90 <0f> 0b 90 90 eb bc e8 41 ea ed fc 0f b6 1d 10 7d a1 0b 31 ff 89 de
RSP: 0018:ffffc90002ee7908 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffc9000cd2b000
RDX: 0000000000080000 RSI: ffffffff817ad005 RDI: 0000000000000001
RBP: ffff88802a664210 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffff888033636a80
R13: ffffffff9afc7fa0 R14: ffff88802a2f28b0 R15: ffff88802a664210
FS:  00007f9f6790e6c0(0000) GS:ffff888124ab9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32715ff8 CR3: 0000000039f06000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __refcount_add include/linux/refcount.h:291 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 dvb_device_get drivers/media/dvb-core/dvbdev.c:624 [inline]
 dvb_device_open+0x2ed/0x3b0 drivers/media/dvb-core/dvbdev.c:106
 chrdev_open+0x231/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x741/0x1c10 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3845 [inline]
 path_openat+0x1e5e/0x2d40 fs/namei.c:4004
 do_filp_open+0x20b/0x470 fs/namei.c:4031
 do_sys_openat2+0x11b/0x1d0 fs/open.c:1429
 do_sys_open fs/open.c:1444 [inline]
 __do_sys_openat fs/open.c:1460 [inline]
 __se_sys_openat fs/open.c:1455 [inline]
 __x64_sys_openat+0x174/0x210 fs/open.c:1455
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9f66b8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9f6790e038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f9f66da5fa0 RCX: 00007f9f66b8d169
RDX: 0000000000000001 RSI: 0000200000000000 RDI: ffffffffffffff9c
RBP: 00007f9f66c0e990 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f9f66da5fa0 R15: 00007ffdfcf6c128
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

