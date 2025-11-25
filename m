Return-Path: <linux-media+bounces-47684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D16C83D09
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 08:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 281E24E7F98
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 07:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015A42FB96A;
	Tue, 25 Nov 2025 07:55:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF952F99AA
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764057327; cv=none; b=kYH94FV7PALhOeOtmsbjMdNXV4K06kPpVhVw5F1dWSPiULYMTIlRnrMUoHSFpcSPiHyeS66zWwW13iouLIvX720mLx80glhMU/wOsvUxGiPfQwfdUKy3OboetUz9fLmfgSPboKDe6v6dtt/sYxFmjolNYmdtf1ufSTtwceht0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764057327; c=relaxed/simple;
	bh=SkTKwJPDhfNQC/SbiPP4A8ccrC4zZ7g+Qla+sApZ7YQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=EBi8oME7CwM5mCrn2LX6+zYwVKBBBERZgQD8H6QQRJ5SmW16i1uxbCf4D3iqa3Py7oB4c0RyRf6mOeM9g5GKpIyMsgM2iYK6Je++t30rrwSh98JQm/K1ryuDr/Q1X/oMaal0V5IgJHKkpbeuvSrQzwiP6lO0Jsm4iD0QVJg7PGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-93bc56ebb0aso395478039f.0
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 23:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764057324; x=1764662124;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRrPOhGOYvrChnAvN0Az4hHNQ1NsIv6eWYvj6lpNFxo=;
        b=hLpzqS5epE9FNJtGq00xe9v9btTcG3Wc3d91IkF4Qvk+UDbvtJPkpOc7MQVRtYjV2H
         85FnHgB4i47lWi49pYPsDhrY9B9VhFHzOHnd0/+OEGLPA1XKNsE9kIucBY6KKZo7pGr8
         s37TqFkUEUGwNyXOkcX4Vv0XYVtITOQTXfrWuyMCtOjLEWj3pVQVK+yvme+mwGZC4LGH
         xveKy3NNQILouuYcBF9wROlEXtrXZkE64abrcLpHzeah6NUp5vqM1bj40n5jPWXIqyHJ
         LX9ZZQh6twBcrxy6QhNQ1KDlR2K5NNmxVcI2v2fA6xhqP6qcsY7YVm/bnujTP/0WjXbo
         FEOA==
X-Forwarded-Encrypted: i=1; AJvYcCXyJxO2zgOMKYaiNuV0fcTK5YhdiHgWyZn85B4L5FJb7gRLNdzbficEOm2twmUKWBf6nwr4PmALRUN3lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpUzUlTrof3lVOFRLF/IVryXURtSTKy8T/WDoC+tE0thdj4jjH
	KA5az6AKge9GQaKoZgqzwrY2vS1bd2WnSXvvs1SOV7ckaYfto3LLMKxr2E7CrehvHkuwtvGsTXr
	t7G5/b+/vHcKbFAGKkFnJAA4kcGAGogTy4NGFSv/upB9QxbzsppWVP48aR6w=
X-Google-Smtp-Source: AGHT+IHwUsGasx89mDyrzh3QDxLXX5jzW9dbUxZvqfKEqbuWQDOClqNZGoONAsDCwTb3zyGxasbXVKExyMmrYlXUqk5UJhOJUprU
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c242:0:b0:434:96ea:ff6a with SMTP id
 e9e14a558f8ab-435dd1252e3mr12372115ab.35.1764057324603; Mon, 24 Nov 2025
 23:55:24 -0800 (PST)
Date: Mon, 24 Nov 2025 23:55:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692560ec.a70a0220.2ea503.0087.GAE@google.com>
Subject: [syzbot] [media?] [usb?] memory leak in v4l2_ctrl_handler_init_class (2)
From: syzbot <syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fd95357fd8c6 Merge tag 'sched_ext-for-6.18-rc6-fixes-2' of..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a39742580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b05a12580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10f8aa12580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/23b612a7fe35/disk-fd95357f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2da12b65fa76/vmlinux-fd95357f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/97ebacdc6971/bzImage-fd95357f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88812a347a58 (size 8):
  comm "kworker/0:6", pid 6036, jiffies 4294942408
  hex dump (first 8 bytes):
    80 38 6e 25 81 88 ff ff                          .8n%....
  backtrace (crc f78d2928):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kvmalloc_node_noprof+0x51c/0x820 mm/slub.c:7112
    kvmalloc_array_node_noprof include/linux/slab.h:1122 [inline]
    v4l2_ctrl_handler_init_class+0x67/0x90 drivers/media/v4l2-core/v4l2-ctrls-core.c:1625
    usb_keene_probe+0xc4/0x450 drivers/media/radio/radio-keene.c:326
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    usb_set_configuration+0x961/0xc70 drivers/usb/core/message.c:2210
    usb_generic_driver_probe+0x83/0xd0 drivers/usb/core/generic.c:250
    usb_probe_device+0x7c/0x1d0 drivers/usb/core/driver.c:291
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659

BUG: memory leak
unreferenced object 0xffff888126df0200 (size 256):
  comm "kworker/0:6", pid 6036, jiffies 4294942408
  hex dump (first 32 bytes):
    00 0b df 26 81 88 ff ff 00 09 df 26 81 88 ff ff  ...&.......&....
    10 02 df 26 81 88 ff ff 10 02 df 26 81 88 ff ff  ...&.......&....
  backtrace (crc 602da918):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kvmalloc_node_noprof+0x51c/0x820 mm/slub.c:7112
    v4l2_ctrl_new+0x2bf/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2031
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    usb_set_configuration+0x961/0xc70 drivers/usb/core/message.c:2210
    usb_generic_driver_probe+0x83/0xd0 drivers/usb/core/generic.c:250
    usb_probe_device+0x7c/0x1d0 drivers/usb/core/driver.c:291

BUG: memory leak
unreferenced object 0xffff888126df0900 (size 256):
  comm "kworker/0:6", pid 6036, jiffies 4294942408
  hex dump (first 32 bytes):
    00 02 df 26 81 88 ff ff 30 f5 8f 24 81 88 ff ff  ...&....0..$....
    10 09 df 26 81 88 ff ff 10 09 df 26 81 88 ff ff  ...&.......&....
  backtrace (crc 84e60c55):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kvmalloc_node_noprof+0x51c/0x820 mm/slub.c:7112
    v4l2_ctrl_new+0x2bf/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2031
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    handler_new_ref+0x352/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1772
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689

BUG: memory leak
unreferenced object 0xffff8881256e3400 (size 64):
  comm "kworker/0:6", pid 6036, jiffies 4294942408
  hex dump (first 32 bytes):
    40 33 6e 25 81 88 ff ff 40 f5 8f 24 81 88 ff ff  @3n%....@..$....
    00 00 00 00 00 00 00 00 00 09 df 26 81 88 ff ff  ...........&....
  backtrace (crc a7c4a093):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kmalloc_noprof+0x3e3/0x6b0 mm/slub.c:5662
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    handler_new_ref+0xd7/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1780
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    handler_new_ref+0x352/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1772
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537

BUG: memory leak
unreferenced object 0xffff8881256e3340 (size 64):
  comm "kworker/0:6", pid 6036, jiffies 4294942408
  hex dump (first 32 bytes):
    80 32 6e 25 81 88 ff ff 00 34 6e 25 81 88 ff ff  .2n%.....4n%....
    00 34 6e 25 81 88 ff ff 00 02 df 26 81 88 ff ff  .4n%.......&....
  backtrace (crc be938ee5):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __do_kmalloc_node mm/slub.c:5649 [inline]
    __kmalloc_noprof+0x3e3/0x6b0 mm/slub.c:5662
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    handler_new_ref+0xd7/0x450 drivers/media/v4l2-core/v4l2-ctrls-core.c:1780
    v4l2_ctrl_new+0x67d/0x1340 drivers/media/v4l2-core/v4l2-ctrls-core.c:2114
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2185
    usb_keene_probe+0xe8/0x450 drivers/media/radio/radio-keene.c:327
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    usb_set_configuration+0x961/0xc70 drivers/usb/core/message.c:2210
    usb_generic_driver_probe+0x83/0xd0 drivers/usb/core/generic.c:250

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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

