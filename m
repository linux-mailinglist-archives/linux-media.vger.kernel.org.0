Return-Path: <linux-media+bounces-12220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 400E48D4412
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 05:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C08381F230F9
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 03:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34A456475;
	Thu, 30 May 2024 03:25:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA32256A
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 03:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717039531; cv=none; b=rHwrRCwFa2NYStKFM3A+UHabXZWtRnF9afrqjMSfPgge/59JHPFN2JUe1YAVk0x5YK0GoJugP9PwBwJQiaDjFgLTDe42mEkzkJEfg3JJLkKly/WY3pR+LqB+DVp1eZsn0+OzbTgK0/4zSBQxIiSRAVq5iwbuUhrEviMZkTbd7UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717039531; c=relaxed/simple;
	bh=1Jdlb4uXSKwUEkKt1PnKb6Tdl6S6oUusgKunyS2Q31s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DR/xaokfXaKruzdM7OUk/fyvnw4zYNuNCN1oRTQA+orMYEFMUkRpDloxz6PKGy8gVps9ccTm/29w0b7I3Hci/JkHYBMvF/ZNRodQmZuUHctHz8I4AhJo8pYs4808cB4vrULJkQNBAHarSqkqVH5jEJI0/L5SizfVo+UK25zCdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3742c0af134so4464945ab.1
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 20:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717039529; x=1717644329;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4K7HM1D3AqG6NeUGOCxHtK8VbYgvci8iQeTeS4D2C0=;
        b=eduV59aooSxRBbO2Oa/0Am7YW7Ei63op4DWr60wITPKv3kon6zdnWDBl4eowaJQVqD
         76b9PMOVnyRBD7DgwY0IIyUiHQkugEBW+kdUQkP7YL1mh5jAgKBgttcZEMGQA/Es3pXU
         zXhoJFrx4IM/vOqqPbf/fIUg145tUKMGwORo+Wdi/PSdsGjydHzBexnTuGLerO0/RET7
         AD6LRxJkIm9zBHFRWAunaWCSuuhu47m39G9am/omhIw/TceEvpWe/FAjCi0Sa36leqOM
         gyCDImWgSGHXD9Ttx+lpZMNhWK3yxXnj8z3xw8S0nkjY4GfNpTVpex3zvaJnBvfxdBVx
         iYpA==
X-Forwarded-Encrypted: i=1; AJvYcCUDGdR9tQRNHpeZYsvYH5xOtcIth335rFMsl63GU7PKcNQRoiK2KDZ+RJ+0Oii3BF5ytFUP++vF/Gx9Ip3zYZhfMrQXR2uzyvl6ZlM=
X-Gm-Message-State: AOJu0YyMOcNQ1c5Da9ACvPL742NkPbBSnNqpar5Gptzb9oVN2vKg14uk
	dBZAuKCjtGk5YSrdoLzeNykKPNKLM2+mJYrBYtysumNI4tZHUjvS7UEwZsqTqT7mggrV54VcKoS
	AT1zd+pKaNF/GuUHm1RIaNbe6Qt7b+APN6cFu3dNUCCzchEiLwkXMRtA=
X-Google-Smtp-Source: AGHT+IEXUql0FXR+Lxaqa/6M5rhOpI0OL0iAbamY3PgObpec9S40jP00gT/th087johTJy7XjD35dWWqwVRAD56+EkC9yKg58FZD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a46:b0:36c:11a0:7878 with SMTP id
 e9e14a558f8ab-3747dfb5aa8mr438305ab.2.1717039528943; Wed, 29 May 2024
 20:25:28 -0700 (PDT)
Date: Wed, 29 May 2024 20:25:28 -0700
In-Reply-To: <0000000000002174ba06197f39c1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003032c50619a36bd7@google.com>
Subject: Re: [syzbot] [dri?] [media?] general protection fault in
 udmabuf_create (2)
From: syzbot <syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9d99040b1bc8 Add linux-next specific files for 20240529
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14c083e6980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=735e953fee00ec19
dashboard link: https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176b79d2980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10266eaa980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f0deeb27b28b/disk-9d99040b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5acd2205cee1/vmlinux-9d99040b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/222eebb6b9d8/bzImage-9d99040b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 PID: 5101 Comm: syz-executor479 Not tainted 6.10.0-rc1-next-20240529-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:PageTail include/linux/page-flags.h:284 [inline]
RIP: 0010:const_folio_flags include/linux/page-flags.h:312 [inline]
RIP: 0010:folio_test_head include/linux/page-flags.h:837 [inline]
RIP: 0010:folio_test_large include/linux/page-flags.h:858 [inline]
RIP: 0010:folio_nr_pages include/linux/mm.h:2076 [inline]
RIP: 0010:udmabuf_create+0xa54/0x11c0 drivers/dma-buf/udmabuf.c:376
Code: 01 00 00 48 8b 44 24 70 42 80 3c 28 00 48 8b 5c 24 68 74 08 48 89 df e8 9a 63 ed fb 4c 8b 3b 49 8d 5f 08 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 7d 63 ed fb 48 8b 1b 48 89 de 48
RSP: 0018:ffffc9000357fbe0 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000008 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: ffff888022207028 RDI: ffff8880295ee248
RBP: ffffc9000357fd70 R08: ffffffff8fad8daf R09: 1ffffffff1f5b1b5
R10: dffffc0000000000 R11: fffffbfff1f5b1b6 R12: 0000000000000001
R13: dffffc0000000000 R14: ffff888022207028 R15: 0000000000000000
FS:  00005555645a9480(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feee7c0f0d0 CR3: 0000000022b26000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:420 [inline]
 udmabuf_ioctl+0x304/0x4f0 drivers/dma-buf/udmabuf.c:451
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feee7b981b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffda54957e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007feee7b981b9
RDX: 00000000200002c0 RSI: 0000000040187542 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000001
R13: 431bde82d7b634db R14: 00007ffda5495820 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:PageTail include/linux/page-flags.h:284 [inline]
RIP: 0010:const_folio_flags include/linux/page-flags.h:312 [inline]
RIP: 0010:folio_test_head include/linux/page-flags.h:837 [inline]
RIP: 0010:folio_test_large include/linux/page-flags.h:858 [inline]
RIP: 0010:folio_nr_pages include/linux/mm.h:2076 [inline]
RIP: 0010:udmabuf_create+0xa54/0x11c0 drivers/dma-buf/udmabuf.c:376
Code: 01 00 00 48 8b 44 24 70 42 80 3c 28 00 48 8b 5c 24 68 74 08 48 89 df e8 9a 63 ed fb 4c 8b 3b 49 8d 5f 08 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 7d 63 ed fb 48 8b 1b 48 89 de 48
RSP: 0018:ffffc9000357fbe0 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000008 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: ffff888022207028 RDI: ffff8880295ee248
RBP: ffffc9000357fd70 R08: ffffffff8fad8daf R09: 1ffffffff1f5b1b5
R10: dffffc0000000000 R11: fffffbfff1f5b1b6 R12: 0000000000000001
R13: dffffc0000000000 R14: ffff888022207028 R15: 0000000000000000
FS:  00005555645a9480(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005fdeb8 CR3: 0000000022b26000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	01 00                	add    %eax,(%rax)
   2:	00 48 8b             	add    %cl,-0x75(%rax)
   5:	44 24 70             	rex.R and $0x70,%al
   8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   d:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  12:	74 08                	je     0x1c
  14:	48 89 df             	mov    %rbx,%rdi
  17:	e8 9a 63 ed fb       	call   0xfbed63b6
  1c:	4c 8b 3b             	mov    (%rbx),%r15
  1f:	49 8d 5f 08          	lea    0x8(%r15),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 7d 63 ed fb       	call   0xfbed63b6
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	48 89 de             	mov    %rbx,%rsi
  3f:	48                   	rex.W


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

