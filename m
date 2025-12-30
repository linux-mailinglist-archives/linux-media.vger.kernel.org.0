Return-Path: <linux-media+bounces-49689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89096CE90E1
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DE803016733
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464C9325726;
	Tue, 30 Dec 2025 08:41:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA48325709
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767084089; cv=none; b=lN8xNZcvDVPbHGzGdx4k4DjLXcdjS/UW5DlgyhSyOiXty76qbym4fVFgaZVWuftLQGpOzalodvyS9pamcqiO9sqKCXVictriWAs5egbaDhmVQz2QTI3xJp1VCNOkqGtFUToWIWe23g+i+12J6eLg724sBWtyPDkJVw0D4knoi6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767084089; c=relaxed/simple;
	bh=d9XaLVbma4B1bPJg+vvzLfsoG5PqSXKhSJORD+B2AT4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Vy1n2H5zJ9PpycF3bbPpkVmrWTmwUMXHgpzjC7HR0wc338sTZi5x/BiYHiVFLuuKMtGyr8xF4vsPnQhPlTkBsVYtygp24/ByuJUT+GeMPqRhFQ9oCy64LU9y//KbRRweYQD9f9ENzaF/p8e4Cij88kybd8UjaE74Kf5orAxEhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-65d004d4d01so10943816eaf.1
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 00:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767084087; x=1767688887;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqwUls/9gcmNA76KILqg51dqtLsjep3YFa7r6IYdAs4=;
        b=GCeoWXKupbg43Wb8PZQlPTvevHydauxtdz7n4y/aFK2oAJG5/a5JiHnrUCQ+6+HPeB
         aJaHkUVTOBEKVsXECkgKdV3erFOjQZ5bPS81lEDZIJ3YWrsk5oJ4x4giNw26nqF8tOh6
         a0ZIdV2ZjEZyo9uZ6EYCk7xFi1b2zxsccz56g7qGwCUZWoedA+tqXNKDxuEMA1Kvg9Xt
         2XUAgNAN1LZL69QY/dxYLsIQlveEyta2EPf9SwX2+nBrGrUGs1+j0qScD6IWXPmVITIu
         0od27jyPXQujqnoAXnIDmrgYSPYbqHFi3bT1+FQlOLTm5uEMrAxkFDZJzRAYqcoWnuSa
         zChA==
X-Forwarded-Encrypted: i=1; AJvYcCXOdfiAd+bzB3iCJZlcvxeoZ1/n53s+zMuTwL90if/V1GtT0iYpao1WASkhutV4sEVh4q/W0hgvkc8yOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9s3Ga6g5ICyIo3XqbsRnANzJ+fSs9U5IaBtyL7yDOPSpisI3
	0G+WS4Cw89d1QwXJafDFBglmD2n289Q8A1TzHEZMrG462GIMoQWej1jXAuaOy5uIJ/WDVi5t9pd
	AeFIaCy9mxoQLWtvwj92JNoUyUdyZj61NvJHk8s/4od2chtfP4fR2ayCb1ek=
X-Google-Smtp-Source: AGHT+IE3+q0urcbUOQVcFf+5AEn41FMVPul2DWoNa3ubP8HlnWhuVnFT3+oH2NxbPLUpoB1Pnr4uQobSND7UvinJpWvWndueLsS8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f028:b0:65d:4d4:e7b8 with SMTP id
 006d021491bc7-65d0e963e41mr14549247eaf.8.1767084087182; Tue, 30 Dec 2025
 00:41:27 -0800 (PST)
Date: Tue, 30 Dec 2025 00:41:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69539037.050a0220.329c0f.052f.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in vidtv_psi_desc_assign
From: syzbot <syzbot+1f5bcc7c919ec578777a@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c875a6c32467 Merge tag 'usb-6.19-rc3' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e63bb4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bfa57a8c0ab3aa8
dashboard link: https://syzkaller.appspot.com/bug?extid=1f5bcc7c919ec578777a
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8899a01b839d/disk-c875a6c3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/24b995d869e5/vmlinux-c875a6c3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a87050fc4ee8/bzImage-c875a6c3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1f5bcc7c919ec578777a@syzkaller.appspotmail.com

RBP: 00007fbc65813f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbc659e6038 R14: 00007fbc659e5fa0 R15: 00007ffcd46bbaa8
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 17992 Comm: syz.1.2581 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:vidtv_psi_desc_assign+0x24/0x90 drivers/media/test-drivers/vidtv/vidtv_psi.c:629
Code: 90 90 90 90 90 90 0f 1f 40 d6 41 54 55 48 89 f5 53 48 89 fb e8 dd 65 b9 f9 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 75 47 4c 8b 23 49 39 ec 74 36 e8 b9 65 b9 f9 4d 85 e4
RSP: 0018:ffffc9000c61fa20 EFLAGS: 00010247
RAX: dffffc0000000000 RBX: 0000000000000005 RCX: ffffc9000daab000
RDX: 0000000000000000 RSI: ffffffff8804f313 RDI: 0000000000000005
RBP: ffff88807da44660 R08: 0000000000000000 R09: 4453534204050000
R10: 0000000000000005 R11: ffff88802cc229b0 R12: 0000000000000000
R13: ffff88807b485640 R14: ffff88801feace80 R15: ffff8880338e7800
FS:  00007fbc665bb6c0(0000) GS:ffff8881248fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200001000000 CR3: 00000000767b2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 vidtv_channel_pmt_match_sections drivers/media/test-drivers/vidtv/vidtv_channel.c:349 [inline]
 vidtv_channel_si_init+0x1445/0x1a50 drivers/media/test-drivers/vidtv/vidtv_channel.c:479
 vidtv_mux_init+0x526/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x33e/0x4d0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_ts_feed_start_filtering+0xf6/0x220 drivers/media/dvb-core/dvb_demux.c:747
 dvb_dmxdev_start_feed+0x273/0x3f0 drivers/media/dvb-core/dmxdev.c:655
 dvb_dmxdev_filter_start+0x1b6/0xe10 drivers/media/dvb-core/dmxdev.c:766
 dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:963 [inline]
 dvb_demux_do_ioctl+0x9de/0x12f0 drivers/media/dvb-core/dmxdev.c:1077
 dvb_usercopy+0x167/0x340 drivers/media/dvb-core/dvbdev.c:999
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1186
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbc6578f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbc665bb038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fbc659e5fa0 RCX: 00007fbc6578f7c9
RDX: 0000000000000000 RSI: 0000000040146f2c RDI: 0000000000000003
RBP: 00007fbc65813f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbc659e6038 R14: 00007fbc659e5fa0 R15: 00007ffcd46bbaa8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vidtv_psi_desc_assign+0x24/0x90 drivers/media/test-drivers/vidtv/vidtv_psi.c:629
Code: 90 90 90 90 90 90 0f 1f 40 d6 41 54 55 48 89 f5 53 48 89 fb e8 dd 65 b9 f9 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 75 47 4c 8b 23 49 39 ec 74 36 e8 b9 65 b9 f9 4d 85 e4
RSP: 0018:ffffc9000c61fa20 EFLAGS: 00010247
RAX: dffffc0000000000 RBX: 0000000000000005 RCX: ffffc9000daab000
RDX: 0000000000000000 RSI: ffffffff8804f313 RDI: 0000000000000005
RBP: ffff88807da44660 R08: 0000000000000000 R09: 4453534204050000
R10: 0000000000000005 R11: ffff88802cc229b0 R12: 0000000000000000
R13: ffff88807b485640 R14: ffff88801feace80 R15: ffff8880338e7800
FS:  00007fbc665bb6c0(0000) GS:ffff8881248fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557f4c7cc950 CR3: 00000000767b2000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	0f 1f 40 d6          	nopl   -0x2a(%rax)
   a:	41 54                	push   %r12
   c:	55                   	push   %rbp
   d:	48 89 f5             	mov    %rsi,%rbp
  10:	53                   	push   %rbx
  11:	48 89 fb             	mov    %rdi,%rbx
  14:	e8 dd 65 b9 f9       	call   0xf9b965f6
  19:	48 89 da             	mov    %rbx,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	75 47                	jne    0x77
  30:	4c 8b 23             	mov    (%rbx),%r12
  33:	49 39 ec             	cmp    %rbp,%r12
  36:	74 36                	je     0x6e
  38:	e8 b9 65 b9 f9       	call   0xf9b965f6
  3d:	4d 85 e4             	test   %r12,%r12


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

