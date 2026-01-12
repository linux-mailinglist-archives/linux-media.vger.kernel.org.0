Return-Path: <linux-media+bounces-50393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99224D11428
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90C2F3027813
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 08:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A288F34105B;
	Mon, 12 Jan 2026 08:35:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F133E369
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206927; cv=none; b=ibRZ7bJMBOceG4nQE84wDNByYdZsF7FQ9W8stAk2pW3N1D+UZH0vyzJiwGPMzLnz03pIdN89SS8gDuXWq5llga7GsU/1vLVxIWrZxFX93G16B5pIx5jqkN7ZnL88A8K8YIFQBX5xkMsGGpwB4KYfRn56VLuzJp0ybZ3e2fxnRyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206927; c=relaxed/simple;
	bh=S2AiEFPPm0de26q64xDh6FzeNxAyS3uMTQPtxhqqlqQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Q8nljMr77e1vmH2sAP6119W3IPsgPWMiW8U1nPiyHWOlLWApLXl3Geh0os7BjgmAnLTV8rsulaHlcRn52wL1XdOFC3ths1aMhcTOP5m0BWRRdtYjp7duv74CBFpvvfskdmwD5kPAEJYk9Ohrp1+foyRwgxDaPUL8DQhTCF0a03Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6574475208eso6662983eaf.3
        for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 00:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206924; x=1768811724;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+EACYNZL8XSC2LzZB44HqAqilwXa0agAZP7cahv37I=;
        b=MHbw0ya13KPgLk6MU6q9nST+Ur/GiRzfSPRQFpO99ujmZrHxpjLvf/jJt9R1VENlE0
         cdI0bHZCwfKqjUloRUg8yfxxJmCa4RdIBfi4CgnmKedhtGcFFVZyP6czRBRxcr9+WgW8
         QM8qdauRsy+5hnqP/z/gjroScgYDlnHdOn6oIi+vC/h9R8OZW3iuKD1NmmdRPVitmwrR
         f3kO+M2e2oyzVDFA4xeVK73dGtboXY+ZucvM3EVuwCfapvXtSLde7Of4XFOZDrRe3ovn
         4iB2WNmU5Y1bfao3UT+cpk6QWWCUuz3/5P2ZEXpmYSrRqCukU7hXcObYEcrGXz9I0Gz9
         Bw5g==
X-Forwarded-Encrypted: i=1; AJvYcCV/DfB+GzPBWW+l5fyx1+huaqOGneQOsnPjgzFZzud42pqSt/h4gNEyLMQA6quhkv9fgTOmsAvh6ODqqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLO6MXprFR6KPqvlzwhYx4LPc2ZU12P6Sl6epJYzKPcJ2BJHsJ
	ZycaFJHlDZeGCRgYIZa9f9iX8WUS/++kzprSrCxhAAlsIisYS3je68LzM7LIR+LqzwbljB6Wq5m
	Z2W+t8pvt2wnNYHHeAc9ML6bWJpZ/7RGHPq09ybPCsG6l/aku4VYvWe9eznE=
X-Google-Smtp-Source: AGHT+IE8jXO5IaJTso6NQezDEu1LByyigRqAGPQ0IGB5QWrXH7rnRpB+w9xayla73MGVa7F6iKeqfjCwoycO2qfFWCJCfgMGEk08
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4203:b0:659:9a49:90c8 with SMTP id
 006d021491bc7-65f55090ed6mr5299508eaf.71.1768206924708; Mon, 12 Jan 2026
 00:35:24 -0800 (PST)
Date: Mon, 12 Jan 2026 00:35:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6964b24c.050a0220.eaf7.008c.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in vidtv_psi_ts_psi_write_into
From: syzbot <syzbot+814c351d094f4f1a1b86@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7f98ab9da046 Merge tag 'for-6.19-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10082a8a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bfa57a8c0ab3aa8
dashboard link: https://syzkaller.appspot.com/bug?extid=814c351d094f4f1a1b86
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/940981af530c/disk-7f98ab9d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7221a482bfe3/vmlinux-7f98ab9d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6861da47f819/bzImage-7f98ab9d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+814c351d094f4f1a1b86@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 5922 Comm: kworker/1:6 Tainted: G          I  L      syzkaller #0 PREEMPT(full) 
Tainted: [I]=FIRMWARE_WORKAROUND, [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: events vidtv_mux_tick
RIP: 0010:vidtv_psi_ts_psi_write_into+0x4d7/0xbf0 drivers/media/test-drivers/vidtv/vidtv_psi.c:197
Code: 00 4c 8d 7b 20 4c 8b 0b 4c 89 f8 48 c1 e8 03 80 3c 28 00 0f 85 22 05 00 00 48 8b 43 20 48 89 c1 48 89 c6 48 c1 e9 03 83 e6 07 <0f> b6 0c 29 40 38 f1 7f 08 84 c9 0f 85 97 05 00 00 0f b6 08 0f b6
RSP: 0018:ffffc900044af2f0 EFLAGS: 00010202
RAX: 0000000000000002 RBX: ffffc900044af400 RCX: 0000000000000000
RDX: 0000000000016034 RSI: 0000000000000002 RDI: 0000000000000005
RBP: dffffc0000000000 R08: 0000000000000005 R09: ffffc9000bb99000
R10: 0000000000000000 R11: ffffc900044af42c R12: 0000000000000008
R13: 0000000000000000 R14: 0000000000000178 R15: ffffc900044af420
FS:  0000000000000000(0000) GS:ffff8881249fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000047b24000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 vidtv_psi_table_header_write_into+0x1af/0x240 drivers/media/test-drivers/vidtv/vidtv_psi.c:799
 vidtv_psi_pmt_write_into+0x3a9/0x9e0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1231
 vidtv_mux_push_si+0xc04/0xec0 drivers/media/test-drivers/vidtv/vidtv_mux.c:196
 vidtv_mux_tick+0xe8d/0x14e0 drivers/media/test-drivers/vidtv/vidtv_mux.c:408
 process_one_work+0x9ba/0x1b20 kernel/workqueue.c:3257
 process_scheduled_works kernel/workqueue.c:3340 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3421
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x983/0xb10 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vidtv_psi_ts_psi_write_into+0x4d7/0xbf0 drivers/media/test-drivers/vidtv/vidtv_psi.c:197
Code: 00 4c 8d 7b 20 4c 8b 0b 4c 89 f8 48 c1 e8 03 80 3c 28 00 0f 85 22 05 00 00 48 8b 43 20 48 89 c1 48 89 c6 48 c1 e9 03 83 e6 07 <0f> b6 0c 29 40 38 f1 7f 08 84 c9 0f 85 97 05 00 00 0f b6 08 0f b6
RSP: 0018:ffffc900044af2f0 EFLAGS: 00010202
RAX: 0000000000000002 RBX: ffffc900044af400 RCX: 0000000000000000
RDX: 0000000000016034 RSI: 0000000000000002 RDI: 0000000000000005
RBP: dffffc0000000000 R08: 0000000000000005 R09: ffffc9000bb99000
R10: 0000000000000000 R11: ffffc900044af42c R12: 0000000000000008
R13: 0000000000000000 R14: 0000000000000178 R15: ffffc900044af420
FS:  0000000000000000(0000) GS:ffff8881249fc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b31d08ff8 CR3: 000000002fa6a000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	00 4c 8d 7b          	add    %cl,0x7b(%rbp,%rcx,4)
   4:	20 4c 8b 0b          	and    %cl,0xb(%rbx,%rcx,4)
   8:	4c 89 f8             	mov    %r15,%rax
   b:	48 c1 e8 03          	shr    $0x3,%rax
   f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
  13:	0f 85 22 05 00 00    	jne    0x53b
  19:	48 8b 43 20          	mov    0x20(%rbx),%rax
  1d:	48 89 c1             	mov    %rax,%rcx
  20:	48 89 c6             	mov    %rax,%rsi
  23:	48 c1 e9 03          	shr    $0x3,%rcx
  27:	83 e6 07             	and    $0x7,%esi
* 2a:	0f b6 0c 29          	movzbl (%rcx,%rbp,1),%ecx <-- trapping instruction
  2e:	40 38 f1             	cmp    %sil,%cl
  31:	7f 08                	jg     0x3b
  33:	84 c9                	test   %cl,%cl
  35:	0f 85 97 05 00 00    	jne    0x5d2
  3b:	0f b6 08             	movzbl (%rax),%ecx
  3e:	0f                   	.byte 0xf
  3f:	b6                   	.byte 0xb6


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

