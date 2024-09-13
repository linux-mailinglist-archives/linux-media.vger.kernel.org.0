Return-Path: <linux-media+bounces-18257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9507978145
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 15:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D00241C2289C
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CCF1DB93C;
	Fri, 13 Sep 2024 13:35:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78891DB926
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726234526; cv=none; b=Iy/s2aEmGtvuh6YVvG7fLwaa0QeR1zmQ/6+aFf2xD5aJd53ePCZmpojhTIKLuNkgTRQ1K+alZcLOwllAXHBgP5gqRHtCK7z3fXEbT3vrdNpcQkfiXwcUzII7BxRTANAwPLavxdVEG7CBbQknnlMrwt5pNXeje0xRcX/2QOt98Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726234526; c=relaxed/simple;
	bh=L617Mvljy9HXxjmnwsSVVglV+7CPs0s/u19e4e37Gww=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BOgGd2Ol4WcIlFz69xBR9wbgaSUAM2kAE/bBl5a0z8By58S8tzTxqvHQ0u4qLZSi9UsTOFJEsvLRdzYeIHgd05gLiDiVAhf7h3nZZ01IEdr1maBtxZ8ChIPRFdmjNLAAIMirG1NfRyz0WSM/+JfxjY2jsD1AMPqZ4GveIeHJ0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a0862f232fso23118475ab.0
        for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 06:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726234524; x=1726839324;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PKoCISMK/cJuQ+TbC+0Y5hS3vYJ16tnnHaLKn4tGUJA=;
        b=lGDTdUTcK1fdmxGnONHJ/dTbIna7eOQBgqZL6CGO7UV5n1hURPYZPs91hEjJ7b1GqO
         laWcTeH25nBU6vw/CsFlER+JxTlboJmjSh47kJOaaMvEp0UN7KVlzmA2EFFsSedahTRY
         VWmLmMMLstKKyxnpZ9kKL9CyidYg/ilk7GMTFQXgdPnczCIDzfbDip7IGZbz6pdRt4R7
         s2X2WfR7v7fS6K/6WzB/5kq9qUMCYyMk0BM9Z0GsaTU2Ngpfqx/7XqRKE3rc90dsNI0X
         1ftvbkHajnJDu3sbfAhj8jUqkMDcVIxKKFehAmoEZTuLcWIuAU2TErH+sqVxtu4hBZg6
         H3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWYJ7aJ1CGVLrX1ER1Gf+N+khujxwnou6WSHPUNIKbqNTBkLHwiJWomksxIfDGs70c7FPUBikYS0GbbbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPuHAb2ls6Oci39ACBucL0uoQSvE8XBZI9T1wQ2TJcnZhFUWX5
	laPhzzCXN73ja68Gb7ufNGjeWSHQwziz26JJQ0L3Swz2gsWEThvyPif/VRqdFaRR53YI/uSIh33
	YCWGzktajLuWMg2SEAInNg5/e5U3S+UT1ZVMjAxrV83TNSDsnDbzeYu0=
X-Google-Smtp-Source: AGHT+IFaewThfqOu3Dxs6Z2K3D6Ex89U7YXfa6Dv7psqA58MWU+8j6fd59h3RMPd5T3lE2HTfYsPfyy7zSaCh4mlwQGOO2xQryfy
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d85:b0:3a0:8dc8:4cd with SMTP id
 e9e14a558f8ab-3a08dc80569mr16597575ab.23.1726234523807; Fri, 13 Sep 2024
 06:35:23 -0700 (PDT)
Date: Fri, 13 Sep 2024 06:35:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000974b090622004b40@google.com>
Subject: [syzbot] [media?] general protection fault in dvb_usbv2_generic_write
From: syzbot <syzbot+f9f5333782a854509322@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5dadc1be8fc5 Merge tag 'char-misc-6.11-rc7' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16784e00580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58a85aa6925a8b78
dashboard link: https://syzkaller.appspot.com/bug?extid=f9f5333782a854509322
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/21e48b60b45c/disk-5dadc1be.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/92982a88343c/vmlinux-5dadc1be.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2149656ca3d1/bzImage-5dadc1be.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f9f5333782a854509322@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000019: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x00000000000000c8-0x00000000000000cf]
CPU: 0 UID: 0 PID: 10852 Comm: syz.3.1595 Not tainted 6.11.0-rc6-syzkaller-00355-g5dadc1be8fc5 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:587 [inline]
RIP: 0010:__mutex_lock+0xf2/0xd70 kernel/locking/mutex.c:752
Code: c0 c0 b9 33 9a 48 c1 e8 03 42 0f b6 04 20 84 c0 0f 85 79 0b 00 00 83 3d bb 28 71 0e 00 75 21 49 8d 7d 60 48 89 f8 48 c1 e8 03 <42> 80 3c 20 00 74 05 e8 b2 42 38 f6 4d 39 6d 60 0f 85 f3 0a 00 00
RSP: 0018:ffffc9000313ef60 EFLAGS: 00010202
RAX: 0000000000000019 RBX: 0000000000000000 RCX: ffffffff9a33b903
RDX: dffffc0000000000 RSI: ffff888030280000 RDI: 00000000000000c8
RBP: ffffc9000313f0b8 R08: ffffc9000313f027 R09: 0000000000000000
R10: ffffc9000313f000 R11: fffff52000627e05 R12: dffffc0000000000
R13: 0000000000000068 R14: 0000000000000000 R15: ffff888060c51958
FS:  0000000000000000(0000) GS:ffff8880b8800000(0063) knlGS:00000000f5776b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00007f35653215e8 CR3: 0000000028422000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dvb_usbv2_generic_write+0x26/0x50 drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c:77
 mxl111sf_ctrl_msg+0x143/0x270 drivers/media/usb/dvb-usb-v2/mxl111sf.c:73
 mxl111sf_write_reg+0xd8/0x1f0 drivers/media/usb/dvb-usb-v2/mxl111sf.c:123
 mxl111sf_i2c_start drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:130 [inline]
 mxl111sf_i2c_xfer+0x91e/0x8a30 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:813
 __i2c_transfer+0x866/0x21f0
 i2c_transfer+0x271/0x3b0 drivers/i2c/i2c-core-base.c:2304
 i2cdev_ioctl_rdwr+0x452/0x700 drivers/i2c/i2c-dev.c:309
 compat_i2cdev_ioctl+0x7ca/0x8e0 drivers/i2c/i2c-dev.c:576
 __do_compat_sys_ioctl fs/ioctl.c:1007 [inline]
 __se_compat_sys_ioctl+0x51c/0xca0 fs/ioctl.c:950
 do_syscall_32_irqs_on arch/x86/entry/common.c:165 [inline]
 __do_fast_syscall_32+0xb4/0x110 arch/x86/entry/common.c:386
 do_fast_syscall_32+0x34/0x80 arch/x86/entry/common.c:411
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf747d579
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f577656c EFLAGS: 00000206 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000000707
RDX: 0000000020001100 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:587 [inline]
RIP: 0010:__mutex_lock+0xf2/0xd70 kernel/locking/mutex.c:752
Code: c0 c0 b9 33 9a 48 c1 e8 03 42 0f b6 04 20 84 c0 0f 85 79 0b 00 00 83 3d bb 28 71 0e 00 75 21 49 8d 7d 60 48 89 f8 48 c1 e8 03 <42> 80 3c 20 00 74 05 e8 b2 42 38 f6 4d 39 6d 60 0f 85 f3 0a 00 00
RSP: 0018:ffffc9000313ef60 EFLAGS: 00010202
RAX: 0000000000000019 RBX: 0000000000000000 RCX: ffffffff9a33b903
RDX: dffffc0000000000 RSI: ffff888030280000 RDI: 00000000000000c8
RBP: ffffc9000313f0b8 R08: ffffc9000313f027 R09: 0000000000000000
R10: ffffc9000313f000 R11: fffff52000627e05 R12: dffffc0000000000
R13: 0000000000000068 R14: 0000000000000000 R15: ffff888060c51958
FS:  0000000000000000(0000) GS:ffff8880b8800000(0063) knlGS:00000000f5776b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000055f273f047f0 CR3: 0000000028422000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	c0 c0 b9             	rol    $0xb9,%al
   3:	33 9a 48 c1 e8 03    	xor    0x3e8c148(%rdx),%ebx
   9:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
   e:	84 c0                	test   %al,%al
  10:	0f 85 79 0b 00 00    	jne    0xb8f
  16:	83 3d bb 28 71 0e 00 	cmpl   $0x0,0xe7128bb(%rip)        # 0xe7128d8
  1d:	75 21                	jne    0x40
  1f:	49 8d 7d 60          	lea    0x60(%r13),%rdi
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1) <-- trapping instruction
  2f:	74 05                	je     0x36
  31:	e8 b2 42 38 f6       	call   0xf63842e8
  36:	4d 39 6d 60          	cmp    %r13,0x60(%r13)
  3a:	0f 85 f3 0a 00 00    	jne    0xb33


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

