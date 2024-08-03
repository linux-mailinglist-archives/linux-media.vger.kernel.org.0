Return-Path: <linux-media+bounces-15745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA50D9469FC
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 16:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0C4AB21382
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89A014F9F1;
	Sat,  3 Aug 2024 14:06:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BEB136E18
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722693964; cv=none; b=Q5JB2zOJLmqg5r3/xxklfDpp3w4VBKl2aKdAr6odzthrqKlhD003vj6rP10q0pjE2jEVla+sFuh43mCvWlUWSLprYpPw/43IbnR0r7pT6Ph+uIquWf0e8gpxqqnbeXHeVqC43Nvn8ahnKgm82Y4XIH/E0rZuU8yMTnSGvFYMm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722693964; c=relaxed/simple;
	bh=LirQ8CLAfMKY1PLF45CzrMYXEwX14ZJ7f/9NXtlMtPk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gFhZd6PPtHfWmJlk9vXdXON3qD44+pPeMSNlCjtFySj3yR4f1qfdd0g3V0ZMMgat+p5f9+kc4J48PNop4WVy68GUVky0YS4QbezdeJM1Pw9LJ4F9HzklA8D+n4zcUOYnN+FcttbLlq6IyyssL5twVKcEGzakMShvLx6IYb0CVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-39a16e61586so148050065ab.3
        for <linux-media@vger.kernel.org>; Sat, 03 Aug 2024 07:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722693962; x=1723298762;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qhendn5kB+jjZTai8W2myOeej1cGbpa2E243h096HY=;
        b=ad0GCeJXXoZBfAg07FCPi1sv1W8gWiWaiUJTjW5pW0PwbUjBUPKrqKfHB6fESGCiY5
         UlKg9evuOkwlGlED8LYzx67rMwpHaYepB4RqF/lcSN9zqDvn/ShS49t0W7rkqYtttYoe
         jJQjEhgjGtGhPxPBZC9mMlvh2WPq1ux7nor2j1nUG/M7Zdj8nJXhLZBCgYUX4NgXEz2G
         UJ6UvQSRz/v5scexbRUDlovh+UVJPnIvqw4xV3bbAuIGoM73gvJyDChGXFGzuPWvzWOu
         DPx3wF15KhrlYMxh1CovrvmNA9iCz6I1yTf1creaPpw/yuM5mllZCYGXUybFmXBgjNkW
         ifdw==
X-Forwarded-Encrypted: i=1; AJvYcCVi1uTWTnVtStvlzM4HiQ1aYIplIVOzL3x67dy7fiWyhZ9i4757iZR9xMtmMvVWV/O/3EkDhEe1Bj41+CnQL1WAcOkzZluG6PR2qQU=
X-Gm-Message-State: AOJu0YzS/6SO+W+kGz+ll68iaEYKkqw76i0D8J3FKPWF8RNssuAjH7Cl
	kEUzn4/Fp6j8tqzSdNka96eGkM++Qf3zjdKKUAFNTDmGgYfgtkFJaKB4oy/trWp7YG5qnSc3WmA
	FbWjScB9QEuoss5uXtjkMi9tSKL5mak8mm1NZhMF8f6Up1vqkEgoF4UM=
X-Google-Smtp-Source: AGHT+IG54BtgrqRXkyPnGMT452tPWX/i5rCo4+MYu1Tov6l9HR33aX/Hz8KrBCKWYyJaAf1tIQ9iydjB8KOCgCd+6TicUvtIQ0WB
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d03:b0:380:f12f:30de with SMTP id
 e9e14a558f8ab-39b1fb8792amr3704275ab.2.1722693962120; Sat, 03 Aug 2024
 07:06:02 -0700 (PDT)
Date: Sat, 03 Aug 2024 07:06:02 -0700
In-Reply-To: <20240803135554.DxjC41K7@linutronix.de>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab5261061ec7f15c@google.com>
Subject: Re: [syzbot] [staging?] [usb?] WARNING in r8712_usb_write_mem/usb_submit_urb
 (2)
From: syzbot <syzbot+ca2eaaadab55de6a5a42@syzkaller.appspotmail.com>
To: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	namcao@linutronix.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in r8712_usb_write_mem/usb_submit_urb

ep_out[2] type=2
ep_out[3] type=0
ep_out[4] type=1
rtl8712_dl_fw:230
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 1 PID: 2586 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 1 UID: 0 PID: 2586 Comm: dhcpcd Not tainted 6.10.0-syzkaller-12562-g1722389b0d86-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
RIP: 0010:usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Code: 84 3c 02 00 00 e8 a5 eb fe fc 4c 89 ef e8 2d 21 d7 fe 45 89 e0 89 e9 4c 89 f2 48 89 c6 48 c7 c7 40 18 a0 87 e8 96 dc c4 fc 90 <0f> 0b 90 90 e9 e9 f8 ff ff e8 77 eb fe fc 49 81 c4 c0 05 00 00 e9
RSP: 0018:ffffc90004acf678 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff888128648700 RCX: ffffffff81194ce9
RDX: ffff88810db70000 RSI: ffffffff81194cf6 RDI: 0000000000000001
RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: ffff888115b8f0a8 R14: ffff888103aa5560 R15: ffff88812864877c
FS:  00007f06eaa79740(0000) GS:ffff8881f6300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055b92c582068 CR3: 000000010c70c000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 r8712_usb_write_mem+0x2e4/0x3f0 drivers/staging/rtl8712/usb_ops_linux.c:170
 rtl8712_dl_fw+0xa03/0x1310 drivers/staging/rtl8712/hal_init.c:231
 rtl8712_hal_init drivers/staging/rtl8712/hal_init.c:360 [inline]
 rtl871x_hal_init+0xb3/0x190 drivers/staging/rtl8712/hal_init.c:424
 netdev_open+0xea/0x800 drivers/staging/rtl8712/os_intfs.c:397
 __dev_open+0x2d4/0x4e0 net/core/dev.c:1474
 __dev_change_flags+0x561/0x720 net/core/dev.c:8837
 dev_change_flags+0x8f/0x160 net/core/dev.c:8909
 devinet_ioctl+0x127a/0x1f10 net/ipv4/devinet.c:1177
 inet_ioctl+0x3aa/0x3f0 net/ipv4/af_inet.c:1003
 sock_do_ioctl+0x116/0x280 net/socket.c:1222
 sock_ioctl+0x22e/0x6c0 net/socket.c:1341
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x193/0x220 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f06eab47d49
Code: 5c c3 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 76 10 48 8b 15 ae 60 0d 00 f7 d8 41 83 c8
RSP: 002b:00007fffa5c56198 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f06eaa796c0 RCX: 00007f06eab47d49
RDX: 00007fffa5c66388 RSI: 0000000000008914 RDI: 0000000000000005
RBP: 00007fffa5c76548 R08: 00007fffa5c66348 R09: 00007fffa5c662f8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fffa5c66388 R14: 0000000000000028 R15: 0000000000008914
 </TASK>


Tested on:

commit:         1722389b Merge tag 'net-6.11-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=131843bd980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3044dca4d5f6dbe
dashboard link: https://syzkaller.appspot.com/bug?extid=ca2eaaadab55de6a5a42
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10b25b03980000


