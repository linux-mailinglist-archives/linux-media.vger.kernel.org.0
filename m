Return-Path: <linux-media+bounces-49823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC8CECF4D
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 11:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDA35300096D
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 10:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB71299954;
	Thu,  1 Jan 2026 10:44:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365F3A1E9C
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767264270; cv=none; b=m6ZKmSyZCMUZME3f2mSHInEjDAV14c8Tgrj2Cle/XafCvdA2SOpAdZ8GXKH1l2KQpnRemxC3/D0kvNqG5Uj0zgsk/2mxKJjoozSCfdH1ObdtPeCr69SsyC3KSQJ8pXcqbSjI3S9QhKN2p4P3hFfIssB2qa9A8C8rSDvRWxm5bU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767264270; c=relaxed/simple;
	bh=Rx8jHqkSwnFMCtHEdUV5rv/rM1K9R7KKZKoelWHBfls=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=H7m01cvan/vvWERdwBz24CvtctU2N/SaMLKdAvf1nq7ybvTbzvzpS4qfYotHOm/EctWBbcO/mULZFdGF5yj3QWnW5wtgS3HCQrVYr9DcpMC5agHNoqkHYrBe9RV0+XMX4yK+JMH216ylFzufvdbV5Yxg+MYAwj8HnVx5eDh3LCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-65f0fe5372aso1716649eaf.0
        for <linux-media@vger.kernel.org>; Thu, 01 Jan 2026 02:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767264267; x=1767869067;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKgcb8gIF55OUygMRsvCtv9dszNZ4KsDwP82CqLXpAs=;
        b=RiLMv/lygKOVfWTH2WX2CKfg/mRokdIqeNgLRG844r8lIGwGrlJuJVJNrrPCXqPoMT
         aImDXGsewptlCMbhJUJzDX3aAngp7XgQHVlINhetf6sPlFUmi195kuS0jgfqu+E0eo+m
         2K3RWSkxF17bOriUk7J9iJhHJQO16//0Xbgkx/Gz/f0DOvggibpt/KFINdT4I6WuVk8u
         aGg6+aTcZVWXCtLGBZrnIxzMaBSpycbby4i0jDP+FWoYPBU8mHCz0xQ4ctZGeDJD1LkE
         PLE5bM0FvfGJd7umOf9pNaWUnfF1mqoFWVvrr5ADFJPhGaPR7/17qp2Eo/T4sWEybgXd
         Rs+A==
X-Forwarded-Encrypted: i=1; AJvYcCX5eNK1c/qiPlxxxZwVuJF0A8raXJl9bUdij6pU53ChK+qfBp+HDtHpwAmxmhiiMmaQRheitChUey7UKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWpPxQPWqrtK4u+i6uBwN+naSex7T0mHEbc7XPY8+FCKcEg7Yx
	qKyaJ4+34hEQIgOYjZSqOGOHcaTlMDcMKkr6Dt7jO7Mb32Yg69BQDTk41/+oAm/DmA09N7jbZIm
	kOSKnYH6GZas8IawMMr1tQCPGjiKyU6o8VpMIzau27bcV8t1aJX0EINpCeSg=
X-Google-Smtp-Source: AGHT+IEVZN2CHBH05ZLcDIDfFPFkoxrI82hUetptoq9BEGFgWDc2SnKn4QL1I5x1KrjyIzVCq7nfePAUBDSP/Zyuyx0fRbtDtDgd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8519:b0:657:44c3:eb66 with SMTP id
 006d021491bc7-65cfe667080mr11616250eaf.1.1767264267450; Thu, 01 Jan 2026
 02:44:27 -0800 (PST)
Date: Thu, 01 Jan 2026 02:44:27 -0800
In-Reply-To: <69539037.050a0220.329c0f.052f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6956500b.050a0220.a1b6.033a.GAE@google.com>
Subject: Re: [syzbot] [media?] general protection fault in vidtv_psi_desc_assign
From: syzbot <syzbot+1f5bcc7c919ec578777a@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    349bd28a86f2 Merge tag 'vfio-v6.19-rc4' of https://github...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17c43792580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bfa57a8c0ab3aa8
dashboard link: https://syzkaller.appspot.com/bug?extid=1f5bcc7c919ec578777a
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178b529a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1caf38a16cbb/disk-349bd28a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1650b6e78aae/vmlinux-349bd28a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/df6e3c8e97c1/bzImage-349bd28a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1f5bcc7c919ec578777a@syzkaller.appspotmail.com

RSP: 002b:00007fc9113fe038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc911fe5fa0 RCX: 00007fc911d8f7c9
RDX: 0000000000000000 RSI: 0000000040146f2c RDI: 0000000000000003
RBP: 00007fc911e13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc911fe6038 R14: 00007fc911fe5fa0 R15: 00007ffe9d4f0e68
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 6109 Comm: syz.3.21 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:vidtv_psi_desc_assign+0x24/0x90 drivers/media/test-drivers/vidtv/vidtv_psi.c:629
Code: 90 90 90 90 90 90 0f 1f 40 d6 41 54 55 48 89 f5 53 48 89 fb e8 cd 6d b9 f9 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 75 47 4c 8b 23 49 39 ec 74 36 e8 a9 6d b9 f9 4d 85 e4
RSP: 0018:ffffc90003577a20 EFLAGS: 00010247
RAX: dffffc0000000000 RBX: 0000000000000005 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8804fd23 RDI: 0000000000000005
RBP: ffff88802879dd80 R08: 0000000000000000 R09: 4453534204050000
R10: 0000000000000005 R11: ffff88803393a9b0 R12: 0000000000000000
R13: ffff88807d440780 R14: ffff888020aab3e0 R15: ffff88807d440b00
FS:  00007fc9113fe6c0(0000) GS:ffff8881249fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000075520000 CR4: 00000000003526f0
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
RIP: 0033:0x7fc911d8f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc9113fe038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc911fe5fa0 RCX: 00007fc911d8f7c9
RDX: 0000000000000000 RSI: 0000000040146f2c RDI: 0000000000000003
RBP: 00007fc911e13f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc911fe6038 R14: 00007fc911fe5fa0 R15: 00007ffe9d4f0e68
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vidtv_psi_desc_assign+0x24/0x90 drivers/media/test-drivers/vidtv/vidtv_psi.c:629
Code: 90 90 90 90 90 90 0f 1f 40 d6 41 54 55 48 89 f5 53 48 89 fb e8 cd 6d b9 f9 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 75 47 4c 8b 23 49 39 ec 74 36 e8 a9 6d b9 f9 4d 85 e4
RSP: 0018:ffffc90003577a20 EFLAGS: 00010247
RAX: dffffc0000000000 RBX: 0000000000000005 RCX: 0000000000000001
RDX: 0000000000000000 RSI: ffffffff8804fd23 RDI: 0000000000000005
RBP: ffff88802879dd80 R08: 0000000000000000 R09: 4453534204050000
R10: 0000000000000005 R11: ffff88803393a9b0 R12: 0000000000000000
R13: ffff88807d440780 R14: ffff888020aab3e0 R15: ffff88807d440b00
FS:  00007fc9113fe6c0(0000) GS:ffff8881249fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000075520000 CR4: 00000000003526f0
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
  14:	e8 cd 6d b9 f9       	call   0xf9b96de6
  19:	48 89 da             	mov    %rbx,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	75 47                	jne    0x77
  30:	4c 8b 23             	mov    (%rbx),%r12
  33:	49 39 ec             	cmp    %rbp,%r12
  36:	74 36                	je     0x6e
  38:	e8 a9 6d b9 f9       	call   0xf9b96de6
  3d:	4d 85 e4             	test   %r12,%r12


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

