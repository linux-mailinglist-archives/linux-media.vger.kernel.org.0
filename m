Return-Path: <linux-media+bounces-56300-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP8MIdSju2kLmAIAu9opvQ
	(envelope-from <linux-media+bounces-56300-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 08:20:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D87F02C7332
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 08:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E14B30DD36D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801CC36B07B;
	Thu, 19 Mar 2026 07:20:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED602D7D42
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773904835; cv=none; b=HQ29GECX8EujwWzvtnpqWy+XJzvWoxUjZstvbYneGuSgZmrv6mi4y3cTGCIBWXfHJhysi78kxs4msKl23uda+jIeho4u3fFdYSOdFcg7wuR+lyuA7tNpsNLA6r5zgY7q2hA7byUcV+BVZPL5j3AAiazEE+9Ahmeg6F+ggmOlUjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773904835; c=relaxed/simple;
	bh=ISWD8a96/1qPCMe009JkaQfjCrfEHH+jRA5zU/27WvU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bD1Qzdfw3eTFDIHjJ/H+VFZDTm6x89KEM9bZJ2x/aPGDRKOIbJ2WWyFp1/dF52VmJrr4bGh2vrVGNT11vjSXV6KvTQlKpgh3BdxGNRtyLJo6C2+piFk4L1SPOzie+yUelTS4oakvnIPpQ6X8ygp0Y2/A16h46ccyssTwg/aNJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-672c40f3873so16014252eaf.2
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 00:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773904833; x=1774509633;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td4dTzzjBD1C8PUxspOZn5JE8gdwHabwlfoswpzLfy4=;
        b=EIW9yMCwzhFDNo5B+eaUNaY9rXaYzqaGFNL7Ga9hKL3vALiGMNzpPwbVBwVk7Lfbc0
         DOCMX/TRjtjFTDTyHeEyLPWHUJFUWu0rFb6UEAnNEEs3Xm/ByJKxCcuPXvBlLZcGpIx9
         A4tf1x8TuGjWAe1j6bVvgZYJ1YkyJcslFBhJOLhDrnQ/f0LOQTParBe+77m/ky1ZcXMC
         TEZ6XJbUSRlJx8H4tc7lta+jKbyiIVAwrP2gnJQ4rxp4/EhuZF4+jOnEd0bOqVbZrdIH
         MWMKbVELrkRTJD2opyBHusHAdiRCBhWGvSoCwaAFfV6vvKdbn6TBCiGiWywdhQ3JxtiD
         GYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX++t7tvXzI899YtwNTVd5m/kS/8ndD1nuG9HjgqWnD4omRbIQjkfoqud7OKaOvmWrCCsFVmmngCbD34Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIhPxegpG0MyCBNUvFUGwRwjkpmjSMBjwssFHKnAQA2DQXyz2u
	+PNko64FotdfovDeeKpEWRitz/nKvFkmF9lvNGT2yruBQhJatRWAL5UgwnYxrCPjPQzkM0EmSOy
	iXIssM2/JYPFPpL0+TZWl2MEjkHs1g5PzYRr1/JT74ytyWvA/N7TmsVmVcLA=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1b14:b0:679:946d:351f with SMTP id
 006d021491bc7-67c0da5892amr4093859eaf.13.1773904832812; Thu, 19 Mar 2026
 00:20:32 -0700 (PDT)
Date: Thu, 19 Mar 2026 00:20:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69bba3c0.050a0220.227207.002c.GAE@google.com>
Subject: [syzbot] [media?] WARNING in igorplugusb_probe/usb_submit_urb
From: syzbot <syzbot+5d7eece664082e0c5c1a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, sean@mess.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=1da705b17f2649a3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56300-lists,linux-media=lfdr.de,5d7eece664082e0c5c1a];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.449];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,googlegroups.com:email,appspotmail.com:email]
X-Rspamd-Queue-Id: D87F02C7332
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    8e42d2514a7e Add linux-next specific files for 20260318
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=158d4cf6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1da705b17f2649a3
dashboard link: https://syzkaller.appspot.com/bug?extid=5d7eece664082e0c5c1a
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=156aa06a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e3ee02580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/64c940773401/disk-8e42d251.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/aa7a94376665/vmlinux-8e42d251.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5a7ab603c859/bzImage-8e42d251.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5d7eece664082e0c5c1a@syzkaller.appspotmail.com

Registered IR keymap rc-empty
rc rc0: IgorPlug-USB IR Receiver as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/rc/rc0
input: IgorPlug-USB IR Receiver as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/rc/rc0/input5
------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType 40
WARNING: drivers/usb/core/urb.c:413 at usb_submit_urb+0x1053/0x18b0 drivers/usb/core/urb.c:411, CPU#0: kworker/0:1/10
Modules linked in:
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0x1115/0x18b0 drivers/usb/core/urb.c:411
Code: 00 00 00 00 00 fc ff df 0f b6 44 05 00 84 c0 0f 85 91 05 00 00 45 0f b6 45 00 48 8b 7c 24 18 48 8b 74 24 10 4c 89 fa 44 89 f1 <67> 48 0f b9 3a 49 bf 00 00 00 00 00 fc ff df e9 c1 f2 ff ff 89 e9
RSP: 0018:ffffc900000f6d58 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8880348cfa00 RCX: 0000000080000280
RDX: ffff8880226d5760 RSI: ffffffff8ca2a000 RDI: ffffffff90619150
RBP: 1ffff11006f01788 R08: 0000000000000040 R09: 1ffff9200001ed78
R10: dffffc0000000000 R11: fffff5200001ed79 R12: ffff888034663100
R13: ffff88803780bc40 R14: 0000000080000280 R15: ffff8880226d5760
FS:  0000000000000000(0000) GS:ffff888124de1000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2acdbe9e80 CR3: 000000007fc82000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 igorplugusb_cmd drivers/media/rc/igorplugusb.c:127 [inline]
 igorplugusb_probe+0x812/0xc70 drivers/media/rc/igorplugusb.c:225
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:721
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:863
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:893
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1021
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1093
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7b6/0xb70 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x2110 drivers/usb/core/message.c:2266
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:721
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:863
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:893
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:1021
 bus_for_each_drv+0x258/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c5/0x450 drivers/base/dd.c:1093
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1148
 bus_probe_device+0x12a/0x220 drivers/base/bus.c:613
 device_add+0x7b6/0xb70 drivers/base/core.c:3692
 usb_new_device+0xa08/0x16f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a1c/0x4f30 drivers/usb/core/hub.c:5953
 process_one_work+0x9ab/0x1780 kernel/workqueue.c:3288
 process_scheduled_works kernel/workqueue.c:3379 [inline]
 worker_thread+0xba8/0x11e0 kernel/workqueue.c:3465
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	00 00                	add    %al,(%rax)
   4:	00 fc                	add    %bh,%ah
   6:	ff                   	lcall  (bad)
   7:	df 0f                	fisttps (%rdi)
   9:	b6 44                	mov    $0x44,%dh
   b:	05 00 84 c0 0f       	add    $0xfc08400,%eax
  10:	85 91 05 00 00 45    	test   %edx,0x45000005(%rcx)
  16:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  1a:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  1f:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  24:	4c 89 fa             	mov    %r15,%rdx
  27:	44 89 f1             	mov    %r14d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	49 bf 00 00 00 00 00 	movabs $0xdffffc0000000000,%r15
  36:	fc ff df
  39:	e9 c1 f2 ff ff       	jmp    0xfffff2ff
  3e:	89 e9                	mov    %ebp,%ecx


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

