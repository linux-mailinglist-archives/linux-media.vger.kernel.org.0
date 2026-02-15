Return-Path: <linux-media+bounces-52819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ydHIcCkkWmBlAEAu9opvQ
	(envelope-from <linux-media+bounces-52819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 11:49:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7B13E81B
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 11:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E01D93002317
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 10:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648E42C031E;
	Sun, 15 Feb 2026 10:49:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A61F5858
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771152570; cv=none; b=s+bEMo5Wq2PP1wo9cMfGgS+syU50lDTtkuCIN371xMbmPxbQAC+KrGkU1sxyHP6gAJPqoBQy0F54iH/wznW+XkVJBSjCj2Q1IitcpQnH+F1Xw0gI64PHTavMZSQkp4npEah3huJoLPVI77ZYosDfHVr60YGyPXpbr8rQ3mBnI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771152570; c=relaxed/simple;
	bh=25F/qOBvf2g2zcZ6dQ1NePM3WPV5zJH3ayE70WSf16g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Isv1emToXFq1FQ/pl5P/frh7REjmkVIluJUngi6q10m00PIAG+wpUUH8jh5R0g8qCYrRlK4fYDK/QkYOswf5KLcsfRI7GwpIIhDFjHzrwhP1iAq5WGMS4R5Ikmhz4SznZbVHvG4XWtcm9UtHz7abxnSJ1KV2RIaxy2YRYD+I5mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4d4db1523so3603881a34.1
        for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 02:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771152568; x=1771757368;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwbd+4EH4LGgNmElxlS+yrXKVRdzkUNGTzwIjApnmgQ=;
        b=CxVS/oH/94Jpabj8zfRYtKiVgI+g8dOkadiupFwwJTxgePk9UJZ2Gi8zIBhOrt8/rs
         WIBf8UDcrARfrCAA08dL7QGpxDyMdR4HooAbFrm05AaYaCZjpvhPW6CfOSCT4LC5tkRM
         WsQfbQFCQMivwbABoBkRJX6s53brxAQPSivDI4BVdwpTtYeT65Vy4XH0XSVrpxiZh2u5
         WzaHikbKIqmkxRQ32Q1ezPCBbEFgyyl6vBjktd+PczrC5WGTcgjmUBcgQG2qwJe8wEVS
         JTD7QyHAGfafNoI9B3MTkiYN1ZjydIDlb4fD16cMRfBGrpoOk/HRO6KI+GCt4R5cydO6
         SgGg==
X-Forwarded-Encrypted: i=1; AJvYcCWonr1gXrk9beQcSUfhcjmcn8ElNGYfJYA7AwS5gVRASxzus6JTSJPxWfbs16X4euld9kVh3uqSlIKdxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP056MykDYgS1bRpvuMk4TLqETJM3FDUOW4fGimd0zstekHjoa
	c/Qt4Y9EVdaepUYqy0eOTjOvqYW7niY37iRdql0tBW+WpazrSV5k+2Bl2feod6grWt3RMeXijlt
	tEpcXfOmPJst/pholHnA0VBeUtONUMDw0dzYHkiyqtdP/QwYTeHvU78p+AeE=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f023:b0:65f:6628:94fc with SMTP id
 006d021491bc7-6785bb6765amr2633117eaf.63.1771152567785; Sun, 15 Feb 2026
 02:49:27 -0800 (PST)
Date: Sun, 15 Feb 2026 02:49:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6991a4b7.a70a0220.2c38d7.00dd.GAE@google.com>
Subject: [syzbot] [media?] KMSAN: uninit-value in vidtv_ts_null_write_into
From: syzbot <syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=50148b563a4d5941];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52819-lists,linux-media=lfdr.de,96f901260a0b2d29cd1a];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org,googlegroups.com];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,goo.gl:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11A7B13E81B
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    cd7a5651db26 alpha: add missing address argument in call t..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=125b62aa580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50148b563a4d5941
dashboard link: https://syzkaller.appspot.com/bug?extid=96f901260a0b2d29cd1a
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e5a6e6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=172c7e5a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/23c623fcb1bf/disk-cd7a5651.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5128bb44f38d/vmlinux-cd7a5651.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a65d6b263e08/bzImage-cd7a5651.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in vidtv_ts_null_write_into+0x43e/0x5c0 drivers/media/test-drivers/vidtv/vidtv_ts.c:62
 vidtv_ts_null_write_into+0x43e/0x5c0 drivers/media/test-drivers/vidtv/vidtv_ts.c:62
 vidtv_mux_pad_with_nulls drivers/media/test-drivers/vidtv/vidtv_mux.c:366 [inline]
 vidtv_mux_tick+0x34b7/0x3e40 drivers/media/test-drivers/vidtv/vidtv_mux.c:411
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xae7/0x1d60 kernel/workqueue.c:3358
 worker_thread+0xede/0x1580 kernel/workqueue.c:3439
 kthread+0x53f/0x600 kernel/kthread.c:467
 ret_from_fork+0x20f/0x910 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Uninit was stored to memory at:
 vidtv_ts_null_write_into+0x437/0x5c0 drivers/media/test-drivers/vidtv/vidtv_ts.c:64
 vidtv_mux_pad_with_nulls drivers/media/test-drivers/vidtv/vidtv_mux.c:366 [inline]
 vidtv_mux_tick+0x34b7/0x3e40 drivers/media/test-drivers/vidtv/vidtv_mux.c:411
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xae7/0x1d60 kernel/workqueue.c:3358
 worker_thread+0xede/0x1580 kernel/workqueue.c:3439
 kthread+0x53f/0x600 kernel/kthread.c:467
 ret_from_fork+0x20f/0x910 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Local variable args.i134 created at:
 vidtv_mux_pad_with_nulls drivers/media/test-drivers/vidtv/vidtv_mux.c:351 [inline]
 vidtv_mux_tick+0x3150/0x3e40 drivers/media/test-drivers/vidtv/vidtv_mux.c:411
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xae7/0x1d60 kernel/workqueue.c:3358

CPU: 1 UID: 0 PID: 30 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: events vidtv_mux_tick
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

