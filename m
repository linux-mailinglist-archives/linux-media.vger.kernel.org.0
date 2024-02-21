Return-Path: <linux-media+bounces-5514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B585CCCF
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 01:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E43321F22B9C
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 00:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA5D1841;
	Wed, 21 Feb 2024 00:38:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8CFA40
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 00:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708475904; cv=none; b=P41fLnQo9j3mBs8Kf3Zhe02tui4EM51PWio9AOJESfm7ECb4KzlK/0F8CSm6YekKgkk4YgJLiA52ZOqqIHcIIAaB70l0SHl3lhAKfCQz2atJAtv3CFhT2vXZjXc3Wsmkm0WMD+3rM7r00pvBDUeLsLLa9QprA3zAX9WtxhCO7uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708475904; c=relaxed/simple;
	bh=Ekkhe4hUxiqeGDPpJMO90zirk/0PhKBcGml4i2vlXoo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dt0nDqs5vTqryxTw463ZHx+jmB/sS4b9gEAS2IjuJawes0dQpTnaG0zxGMtIBrmwUmAb4oWj1/erBaOYWxt3vkud0WsIbc9Okt9yukq/IPztroahLNUdf/18j35eietLZJK1DtRpafeyRAui/xHPBudhoAZLrFKkjqAzEwDpeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36516d55c5fso33222615ab.2
        for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 16:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708475901; x=1709080701;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnataEXxpks9beB1qE4GL4ZlXHU9MCHB3WDNJabYpEs=;
        b=tsheL6TMNZZYBDTCzlmfBs32Glq4YqZmUjJvY8WfmIcBdU/oq6yERsrquWTHgkEe9k
         HRli4aRVIQgsttkCSmPhHM5r8qhjyzzUPUI/PZVT/Ku9PgOuaaxGlKyDzlhxHYoH5ezD
         r+y67t41D5MluB9Abm0TdPT0QecJIVAFSKkU9cOFPKdZI8A7QR4reW+nA/EGtT5EoTI5
         coPvtT+DKMal0QPQMNS2TuuPJLyklJL47OqyFowYNzOSHKetcOB+QL6JUZtNQdYIt3Xe
         9lFDcTi/8H/b6+3wju4ATTrJs9kSO1NxOD4irHIxTynK1/Nc1gwP28jOn9nA8rpt+nw+
         b2lw==
X-Forwarded-Encrypted: i=1; AJvYcCVhGMy1hRGpGbxGHIBPDVfvSHHDlzZLIY6L8mmMx7Gpo/NxAB7UD2R20bvXjcS5hicOmlEbnoyA7IBXlJcaq4PWmleM5P0PwSMPo0U=
X-Gm-Message-State: AOJu0YxFitGqTl0jExIyw1SwtCcVgJx5uTvsZDf16Et7yIxfNf0xKqfZ
	n2Zn41higugDYM2LJBEnZproMjfON/DTCO+5eLbs2JhKpy8DdKnlNvBmtcdWKRXPwMTAKbuPZtF
	C/yJfdtfoPdnTS/OBsKPweD4ZbvhiQm8Je62lmOeiBEC4iR5pkz8xHU4=
X-Google-Smtp-Source: AGHT+IEyEZOGy10rBoBXIjejLD//p8kfRqTq3m+niDekIjhdc7usTsHfKwrAbTBpJuyTDKlsOptq1hrpWLiYohyGnBkSi/5Lsa+T
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1be9:b0:365:3e12:3eb1 with SMTP id
 y9-20020a056e021be900b003653e123eb1mr343502ilv.1.1708475901614; Tue, 20 Feb
 2024 16:38:21 -0800 (PST)
Date: Tue, 20 Feb 2024 16:38:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003922d30611d98bab@google.com>
Subject: [syzbot] [media?] WARNING in cec_data_cancel
From: syzbot <syzbot+57d7c816f3eb3c02ffa9@syzkaller.appspotmail.com>
To: hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    905b00721763 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=117a5b52180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c9378409372fa395
dashboard link: https://syzkaller.appspot.com/bug?extid=57d7c816f3eb3c02ffa9
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/afc82f43a122/disk-905b0072.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0b11ab3a34e1/vmlinux-905b0072.xz
kernel image: https://storage.googleapis.com/syzbot-assets/eff038048b1b/Image-905b0072.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+57d7c816f3eb3c02ffa9@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 1133 at drivers/media/cec/core/cec-adap.c:365 cec_data_cancel+0x620/0x7bc drivers/media/cec/core/cec-adap.c:365
Modules linked in:
CPU: 1 PID: 1133 Comm: syz-executor.4 Tainted: G    B              6.8.0-rc4-syzkaller-g905b00721763 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : cec_data_cancel+0x620/0x7bc drivers/media/cec/core/cec-adap.c:365
lr : cec_data_cancel+0x620/0x7bc drivers/media/cec/core/cec-adap.c:365
sp : ffff800097c87730
x29: ffff800097c87740 x28: ffff0000c86cc810 x27: ffff0000c86cc800
x26: dfff800000000000 x25: 1fffe0001a08c4df x24: 0000000000000000
x23: 0000000000000040 x22: 0000000000000000 x21: ffff0000d04626f8
x20: ffff0000d0462000 x19: ffff0000c86cc800 x18: 1fffe00036804796
x17: ffff80008ec8d000 x16: ffff800080275750 x15: 0000000000000001
x14: 1ffff00012f90ea0 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000040000 x10: 00000000000008e5 x9 : ffff8000ac1bf000
x8 : 00000000000008e6 x7 : 0000000000000000 x6 : ffff800086e8a5fc
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff800080316bac
x2 : ffff0000c86cc800 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 cec_data_cancel+0x620/0x7bc drivers/media/cec/core/cec-adap.c:365
 cec_transmit_msg_fh+0xfc0/0x1a74
 cec_transmit drivers/media/cec/core/cec-api.c:230 [inline]
 cec_ioctl+0x239c/0x37b0 drivers/media/cec/core/cec-api.c:534
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl fs/ioctl.c:857 [inline]
 __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:857
 __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
 el0_svc+0x54/0x158 arch/arm64/kernel/entry-common.c:678
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:598
irq event stamp: 0
hardirqs last  enabled at (0): [<0000000000000000>] 0x0
hardirqs last disabled at (0): [<ffff8000801b5074>] copy_process+0x1318/0x3478 kernel/fork.c:2441
softirqs last  enabled at (0): [<ffff8000801b509c>] copy_process+0x1340/0x3478 kernel/fork.c:2442
softirqs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0000000000000000 ]---


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

