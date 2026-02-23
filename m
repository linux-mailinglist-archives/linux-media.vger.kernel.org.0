Return-Path: <linux-media+bounces-53173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJJiKi4cnGkZ/wMAu9opvQ
	(envelope-from <linux-media+bounces-53173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:21:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE64173D17
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10D0D3071425
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3305F34E766;
	Mon, 23 Feb 2026 09:12:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828291A0BD0
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837956; cv=none; b=c9FZosIdF4bSCVY1O/fN8xEzm1sLeC4sF14mTGC2l+n/saE2hEg8K5+lf/RVf7123JrD9468JJjI3C4yoX9HFbuUwEyPKCOHpg9RKe+tyYGCsy95pFYWPNkKwWmvKnwPc5BtBxSl70DZq6x+jjFNlA7vb21O+ogYLkQ0SX763/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837956; c=relaxed/simple;
	bh=4IRkVJwUhAFKh+FodGnR0scevOhLPA4FqSrchY216qY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=BZknSrmCl8AEWd3k9vX6zrLCxbKcxRFDvylYLP0z2yY3wphq4V2gIArSQJob7+2NlL3PiGcCGjzt+3PHNdKhub3k5BHJyecFz9OSPyHBfES0ox8Fb1DNqkNc1NdtOEhYbXO2P6MYmbVwyuakGnuTlDy9R1JxwDZNw7BX/eLMe+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c44ae7abso41762780eaf.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837954; x=1772442754;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3z5phDmHYu3IVjU3Vbcg2uAA1hRywQSQQ43KZNtG0Yc=;
        b=hxDIJeXS7JXsJwiCtKYCDncnFOOOu8Z2URT7M3zzWHuypDCrz2PJPqPscDnoe3Yi9M
         UTwyMr0mEwiaIRQu6pkhgrMmEx7imwLQJSVvBMCKYYDIIhSIJJ7kekowlPIgqsWE44gG
         kVqGMm8qgmaDqblS/6+hHZQO3FWs3JW6gc98WAIebp+WqQ3m/zQ4hmXxrR/frkZC8E0C
         ++bw+Bxmru8litOsaksujLI/Pv5u6ooxsO7elChGSjeOrMkF6GIk3Y/YHj6HKGyAG1KT
         O/AUgHEu6xl7UUJYe+lFyoVjzpLMq/JtDnLVteKvKHUZBPzEStXp51JjGXQwZ6zLyHGa
         3XQw==
X-Forwarded-Encrypted: i=1; AJvYcCWT1a1QpfmFNLRNRsV/ng6gnAaRQMMYSSS2Nf9qFs2ZPN84C9lExDRxyHzQsYgyHi+r+ES7sklfAka9Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVjaoqRcjypnvg8nOxzr7BXXkdS3NbJ2/mOeZtAnXgNmtbv6X
	4IzLNzw8RzzwU4Hca6HhRdU3c949OG8tf7tcMifSskaQ8eubJiitSW/9mJNST017cKVb+LoBokM
	SwXLt6V47OPUr0+pZiJpRmCQc5dSTGCHdyueJ95j64foFpu22xadk8P0jJ9g=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1988:b0:679:c7d0:d4fe with SMTP id
 006d021491bc7-679c7d0d707mr3922516eaf.36.1771837954471; Mon, 23 Feb 2026
 01:12:34 -0800 (PST)
Date: Mon, 23 Feb 2026 01:12:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <699c1a02.a70a0220.2c38d7.0197.GAE@google.com>
Subject: [syzbot] [media?] WARNING in smsusb_stop_streaming
From: syzbot <syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=1ff39736314a9939];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53173-lists,linux-media=lfdr.de,0d6ef2b7ceb6014d756c];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,storage.googleapis.com:url,syzkaller.appspot.com:url,appspotmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FE64173D17
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    2961f841b025 Merge tag 'turbostat-2026.02.14' of git://git..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=17941ffa580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ff39736314a9939
dashboard link: https://syzkaller.appspot.com/bug?extid=0d6ef2b7ceb6014d756c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/aa34762dfd3f/disk-2961f841.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/52025d84f6c4/vmlinux-2961f841.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66db8f0bf40c/bzImage-2961f841.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com

------------[ cut here ]------------
data & WORK_STRUCT_PWQ
WARNING: kernel/workqueue.c:4304 at __flush_work+0xb75/0xcb0 kernel/workqueue.c:4304, CPU#0: kworker/0:6/5393
Modules linked in:
CPU: 0 UID: 0 PID: 5393 Comm: kworker/0:6 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: usb_hub_wq hub_event

RIP: 0010:__flush_work+0xb75/0xcb0 kernel/workqueue.c:4304
Code: 01 e8 3f a5 10 00 e9 bf fd ff ff 48 8b 7c 24 18 e8 c0 c1 97 00 e9 f7 f6 ff ff e8 b6 c1 97 00 e9 09 fa ff ff e8 3c 04 34 00 90 <0f> 0b 90 e9 38 fc ff ff e8 ce c1 97 00 e9 2d fb ff ff 48 89 df e8
RSP: 0018:ffffc90003856bc0 EFLAGS: 00010246
RAX: 0000000000100000 RBX: ffff8881000ba405 RCX: ffffc90011986000
RDX: 0000000000100000 RSI: ffffffff817db084 RDI: ffff88811df50000
RBP: 0000000000000004 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000004 R11: ffff8881f5739708 R12: ffffffff817da9da
R13: ffff88810006b400 R14: 0000000000000001 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8882686d3000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fce04149d40 CR3: 0000000123490000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 __cancel_work_sync kernel/workqueue.c:4447 [inline]
 cancel_work_sync+0xd1/0xf0 kernel/workqueue.c:4484
 smsusb_stop_streaming+0xaa/0x210 drivers/media/usb/siano/smsusb.c:183
 smsusb_term_device+0x8f/0x200 drivers/media/usb/siano/smsusb.c:345
 smsusb_init_device+0xb4e/0xbb0 drivers/media/usb/siano/smsusb.c:497
 smsusb_probe+0xd7f/0xe1f drivers/media/usb/siano/smsusb.c:575
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:583 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:661
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:803
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:833
 __device_attach_driver+0x1ff/0x3e0 drivers/base/dd.c:961
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1033
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x64/0x160 drivers/base/bus.c:574
 device_add+0x11d9/0x1950 drivers/base/core.c:3689
 usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:583 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:661
 __driver_probe_device+0x1de/0x400 drivers/base/dd.c:803
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:833
 __device_attach_driver+0x1ff/0x3e0 drivers/base/dd.c:961
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1033
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x64/0x160 drivers/base/bus.c:574
 device_add+0x11d9/0x1950 drivers/base/core.c:3689
 usb_new_device.cold+0x685/0x115c drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x314d/0x4af0 drivers/usb/core/hub.c:5953
 process_one_work+0x9d7/0x1920 kernel/workqueue.c:3275
 process_scheduled_works kernel/workqueue.c:3358 [inline]
 worker_thread+0x5da/0xe40 kernel/workqueue.c:3439
 kthread+0x370/0x450 kernel/kthread.c:467
 ret_from_fork+0x6c3/0xcb0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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

