Return-Path: <linux-media+bounces-39194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D35B1F63F
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 22:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 314BF164BE4
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 20:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258C6279DDD;
	Sat,  9 Aug 2025 20:59:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B61274651
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754773175; cv=none; b=QGLRbbRcFJRRqJT9IKuM4xhSf1b7JaA+Vl0ruXb+YcvU7QWoCFJxB/zZNsLktUAQeLZXJPMtP1nW3J1nVjJCQzAboOs1qBjXraSgMDOLkPF6TsI3wY2RxuyaN7Q3WGvI0gYP89TdD1jGlreOKgc+PQqQahRiIIU7PpykLGmt6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754773175; c=relaxed/simple;
	bh=TUs0WbiDAT8s32fIHJeyRuj25pNzSZ1BvSQFOYaxYXk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=AKqC5aZVUagSD7BG5ynNMdbDW3L+opTUdIONMsLH10TgGqKkhQCgwow+nGY1tMMyx7isxQ8sOXgH5Kyfptyf6BzFvvGwcdgIA2ShSd1e9ydnRt/PVnUJJP0WyNIGP129YS+jW+i/4jn+NrIjrY58qKpaUOOJzTWCHHckWCTlV30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-881b5e2172bso275464339f.1
        for <linux-media@vger.kernel.org>; Sat, 09 Aug 2025 13:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754773173; x=1755377973;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJvc1sJnjzoRqNwvFQXAxTnYsZfyWTXvD3W28YsGcvs=;
        b=LDq063soJrosGy/+Y0sre+yQNlS84iYPQ3eX+l572pWSc/lIegpQbfuk98UDQQIpSm
         nzwkqYt6mTA3y723AP62iFR9FKUiKX/HX2oSzvuzMb9PZvroJCYr3lStdAarexnmDblk
         bgzQZcTEulPSqUmG+sjFszeh68GM/UUVtq8rj45o+qFEe2ulKyfOES7fw/l4XAU4MtfK
         oDsvHtVV7xWGUe5NcxF+aEMOFwGUQe7Rxbhc0tdOhRNl7f4oUM9Qy2t3zAwoG6tLtmFs
         YG+lFRO5qR7+A+vxVvdOumPvMu6j3RpXlyWoze+qSggStoM1a5cmydOWI40hG21OGRje
         3UaA==
X-Forwarded-Encrypted: i=1; AJvYcCVAfHjHd7Lw7OFBIKtrZjARrOATlgXjSK5Ndv2M4bWVLy+pmb81jV4yf/p7suxMPVtAJZaKU6cYI2Hg9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSE8bdTVVwd8BDmmISHGBwp8NxC3R4e4EWDMB9MX3cSwAOJBl
	g9TSY6rT0hihtWhCjIymwMQoGvP+xCFiRyPWmyz1EoyTpPdU8Rej//bcLWHuSm8C5jsLqcVsXEV
	xG/R/xTBOrjFnJGskb3K28TcqMWDQ68LbZXu7x+sQE8IO2cNeYiOrE/TAlXw=
X-Google-Smtp-Source: AGHT+IH5AUOBIRicWFY3OJQXulqmwZrhBc7pjjojqRKG4JjxHiaAIxKGvmE/eFdqH4NJocnm8nIFXb6x1R+p7pndjIkvyOlFuaV6
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a6b:cf12:0:b0:882:c736:3995 with SMTP id
 ca18e2360f4ac-883f1267881mr976009439f.10.1754773173412; Sat, 09 Aug 2025
 13:59:33 -0700 (PDT)
Date: Sat, 09 Aug 2025 13:59:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6897b6b5.050a0220.7f033.00b2.GAE@google.com>
Subject: [syzbot] [pvrusb2?] WARNING in pvr2_send_request/usb_submit_urb
From: syzbot <syzbot+1237a720b657b1d06a22@syzkaller.appspotmail.com>
To: isely@pobox.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, pvrusb2@isely.net, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d632ab86aff2 Merge tag 'for-6.17/dm-changes' of git://git...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=137422f0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f764ce607e41bad
dashboard link: https://syzkaller.appspot.com/bug?extid=1237a720b657b1d06a22
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f6912b7acf0b/disk-d632ab86.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ddc035c67711/vmlinux-d632ab86.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a995ca981cbf/bzImage-d632ab86.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1237a720b657b1d06a22@syzkaller.appspotmail.com

WARNING: CPU: 0 PID: 1309 at drivers/usb/core/urb.c:379 usb_submit_urb+0x1519/0x1770 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 0 UID: 0 PID: 1309 Comm: pvrusb2-context Not tainted 6.16.0-syzkaller-11568-gd632ab86aff2 #0 PREEMPT(voluntary) 
RIP: 0010:usb_submit_urb+0x1519/0x1770 drivers/usb/core/urb.c:379
Code: fd eb cb bb fe ff ff ff e9 96 f3 ff ff e8 5f 38 da fc c6 05 ac 36 cb 05 01 90 48 c7 c7 80 71 c5 87 48 89 de e8 b8 f2 9c fc 90 <0f> 0b 90 90 e9 ac fe ff ff bb f8 ff ff ff e9 66 f3 ff ff 48 89 ef
RSP: 0018:ffffc90001cbeda8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff88810cf23300 RCX: ffffffff8140b968
RDX: ffff88811193ba00 RSI: ffffffff8140b975 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
R13: 00000000c000a800 R14: ffff888137f6e000 R15: ffff888136599610
FS:  0000000000000000(0000) GS:ffff88826911d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007faf709fae9c CR3: 0000000123a8c000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 pvr2_send_request+0x3a/0x50 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3819
 pvr2_i2c_read+0x203/0x6d0 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:130
 pvr2_i2c_basic_op+0xcf/0xf0 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:172
 pvr2_i2c_xfer+0x37d/0xfd0 drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:445
 __i2c_transfer+0x6b3/0x2190 drivers/i2c/i2c-core-base.c:2264
 i2c_smbus_xfer_emulated+0x230/0x11f0 drivers/i2c/i2c-core-smbus.c:470
 __i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:608 [inline]
 __i2c_smbus_xfer+0x836/0x1020 drivers/i2c/i2c-core-smbus.c:554
 i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:546 [inline]
 i2c_smbus_xfer+0x200/0x3c0 drivers/i2c/i2c-core-smbus.c:536
 i2c_smbus_read_byte_data+0x135/0x1e0 drivers/i2c/i2c-core-smbus.c:143
 saa711x_detect_chip drivers/media/i2c/saa7115.c:1710 [inline]
 saa711x_probe+0x234/0x20b0 drivers/media/i2c/saa7115.c:1816
 i2c_device_probe+0x65d/0xd40 drivers/i2c/i2c-core-base.c:591
 call_driver_probe drivers/base/dd.c:581 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:659
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:801
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:831
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:959
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1031
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1aa0 drivers/base/core.c:3689
 i2c_new_client_device+0x660/0xeb0 drivers/i2c/i2c-core-base.c:1022
 v4l2_i2c_new_subdev_board+0xb6/0x300 drivers/media/v4l2-core/v4l2-i2c.c:81
 v4l2_i2c_new_subdev+0x14f/0x1c0 drivers/media/v4l2-core/v4l2-i2c.c:136
 pvr2_hdw_load_subdev drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2022 [inline]
 pvr2_hdw_load_modules drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2074 [inline]
 pvr2_hdw_setup_low drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2155 [inline]
 pvr2_hdw_setup drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2261 [inline]
 pvr2_hdw_initialize+0x28d0/0x4510 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2338
 pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:111 [inline]
 pvr2_context_thread_func+0x253/0x9b0 drivers/media/usb/pvrusb2/pvrusb2-context.c:158
 kthread+0x3c5/0x780 kernel/kthread.c:463
 ret_from_fork+0x5b6/0x6c0 arch/x86/kernel/process.c:148
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

