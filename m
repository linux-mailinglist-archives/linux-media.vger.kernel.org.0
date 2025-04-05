Return-Path: <linux-media+bounces-29427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459AA7C75C
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 04:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B43E3189E3F3
	for <lists+linux-media@lfdr.de>; Sat,  5 Apr 2025 02:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C073597A;
	Sat,  5 Apr 2025 02:17:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07CB8BE8
	for <linux-media@vger.kernel.org>; Sat,  5 Apr 2025 02:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743819448; cv=none; b=IFJzy/8/s/PCu55unCjedF1sjXe4MTWdS57IzgLjcnF8DQoro6wBAnZPC1m3F/MgFRYGu2p2JOh4dAcveYh5pFNajBNdo3oiDoZY/h0xDlU1oYoisoSnIlP+JqXGhsjvmIYhnqUj4EMP2ghfuYx26uS3gdRIcvWayk3nVSCpeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743819448; c=relaxed/simple;
	bh=VE4ZqmH9qeb2H5bgc34Kqry1FAWH4BX2S79NGkfvMD0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pGnaWqyrrqfhEXiYHhp87j1u6f8lZVf7T76E7zbjarCVYHfibgFBHLS6xNPfp7rTy9AaKu3wb20o7mIU2E/y7o01M0/fbhveAMRcb6tQFUto129zVUaTBR3k87oAVpmLVVUTF/znAaKC+aSsWnAuADKw+zszIwBfaNJRtQEOZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d43b460970so54035525ab.2
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 19:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743819446; x=1744424246;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wpnBAfM4qhuAgDMWO83CoYcvdmUbKhSinhUkIuqQoTk=;
        b=Nh6jaSXk4uJhMqLg4/Eqvour20rBE02Wa8Sv6yBj2KkwyQGIiZ57MiMNdimDRozhfx
         8Ym54bF+AJvIsRzKQDGgknj3uWjptyQv6lbnMWaJC5KX3qvDMstZ3yZBVJahKJ3gKUr3
         GnuNC8xmA/+zpMf8uwZoJaDoDOttSFV3CKHOnunXrw5tEUJ8RjulGy3Ew5dgFI2m2Qpu
         9JjL0DSBHR6Ewv9cljn40/DViRbFe3t3QY7KMXWVCIF+yJqnrXufLHkCC/jfmaPI78F9
         sR4HVVgIglfraJFv+lwrshBkkY32uP0hG5oVipT0jqmBuRGdwSlC5IFLHVGbid64dMSA
         sFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnnKt8vcq0qFdISv++r6/ARIAfuI1GHrmb7JiOdyRXZ2EMiXdj0ukovue6QSmurDfjWHxyEJpc1bV0nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN+YoLjjNwGt2XxZAbwAWBwjCCCf8iK3xPpdievfFjWqbr7jwe
	qOJXI9DcUxRpUhJXmXkYBnbFroOIFKzywFO3MKB2oeC0YV0ojvfLFSJtYm+5uVYggIZ9gsVv7bA
	DIe3Ra45H5cC4g3kXPJjCstDx8qzqpO2gknXDlR8KTuL16ghCB+6s/zQ=
X-Google-Smtp-Source: AGHT+IG3G67a6Sgd7/mRMdBUyMuLMc2OZnTB9uJeOwPl6HE/W8B/zWSxy68OaplcgyH36x24pIW2fzADSIRBT9rCHy8g+yNproe1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3186:b0:3d4:3ef4:d4d9 with SMTP id
 e9e14a558f8ab-3d6e58722dfmr50493145ab.14.1743819445985; Fri, 04 Apr 2025
 19:17:25 -0700 (PDT)
Date: Fri, 04 Apr 2025 19:17:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f092b5.050a0220.0a13.0229.GAE@google.com>
Subject: [syzbot] [media?] KMSAN: uninit-value in cxusb_i2c_xfer
From: syzbot <syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, mkrufky@linuxtv.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4e82c87058f4 Merge tag 'rust-6.15' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=166a7bcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=378acbc45ac948ee
dashboard link: https://syzkaller.appspot.com/bug?extid=526bd95c0ec629993bf3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13488fb0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1595dc74580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6045aa9da8ac/disk-4e82c870.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1adf8802c9fe/vmlinux-4e82c870.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9eb6c71670e3/bzImage-4e82c870.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+526bd95c0ec629993bf3@syzkaller.appspotmail.com

dvb-usb: bulk message failed: -22 (3/0)
=====================================================
BUG: KMSAN: uninit-value in cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:124 [inline]
BUG: KMSAN: uninit-value in cxusb_i2c_xfer+0x153a/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:124 [inline]
 cxusb_i2c_xfer+0x153a/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 __i2c_transfer+0xe25/0x3150 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x317/0x4a0 drivers/i2c/i2c-core-base.c:2315
 i2c_transfer_buffer_flags+0x125/0x1e0 drivers/i2c/i2c-core-base.c:2343
 i2c_master_send include/linux/i2c.h:109 [inline]
 i2cdev_write+0x210/0x280 drivers/i2c/i2c-dev.c:183
 do_loop_readv_writev fs/read_write.c:848 [inline]
 vfs_writev+0x963/0x14e0 fs/read_write.c:1057
 do_writev+0x247/0x5c0 fs/read_write.c:1101
 __do_sys_writev fs/read_write.c:1169 [inline]
 __se_sys_writev fs/read_write.c:1166 [inline]
 __x64_sys_writev+0x98/0xe0 fs/read_write.c:1166
 x64_sys_call+0x2229/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:21
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable i.i809 created at:
 cxusb_gpio_tuner drivers/media/usb/dvb-usb/cxusb.c:116 [inline]
 cxusb_i2c_xfer+0x323/0x1a60 drivers/media/usb/dvb-usb/cxusb.c:196
 __i2c_transfer+0xe25/0x3150 drivers/i2c/i2c-core-base.c:-1

CPU: 0 UID: 0 PID: 5806 Comm: syz-executor225 Not tainted 6.14.0-syzkaller-10892-g4e82c87058f4 #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
=====================================================


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

