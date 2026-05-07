Return-Path: <linux-media+bounces-60884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNyzH8Uh/WmGYAAAu9opvQ
	(envelope-from <linux-media+bounces-60884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:35:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA624F0245
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EDAD30090B4
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 23:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8891337418C;
	Thu,  7 May 2026 23:35:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43D344DB0
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 23:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196924; cv=none; b=PZxlADE0IDGvP5MvLGsVIep+avqDoD6mW6YTU7vTz5FFvD+17lNYTnHbxlGdRtz+arp/34Y1ixsHgu5Wt8b0wycXnbTSdaelwd+OezfdfOLJNbuUqvUSU4BuA8RdNvPdgKDTgLuce0XP4jYV45LyJ/OZb1XIFcd3ItIY5HjiyHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196924; c=relaxed/simple;
	bh=Krk7k589jxc4vZtqSpB+dIkjHndiHFPVXzzxoniAQxI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=psv7Zqgz+ffIRhQ8IOciWW6wDMizYwF5RJ4dRFcdWTFXtghMDKFlfRryESDhtH8XCgUQgdRUffEccGeQ873sZzIlIw2jZwjvCg2vjJhWjvJR3MRU1q6C6nDVgwuuOAB3oge1gSVSlv5rW+hJfNoLUGx2/dbpIpsXUCyJe2cyouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6961e8fa90bso3012777eaf.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 16:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196921; x=1778801721;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQO/x7WRcFOm3tXSZSAt9UTL1uRomsSpNlgzzk8pAKs=;
        b=dSGvzwDc/9Knd7orJJLYyo4OUgqdbF55wxjZX7TN+RKfUzKk3g16zKL5xy+GbCIRdB
         jjBRuuNKVn0CAW6ZotP9egaX57/mkBUrNKo7OSbXQr3YgYX8QUH2n6fpDMkMoICqB6/d
         1WgqToxyOLlr+RNb2lnyLTJH0rS6xST9k6qsMaUG1z4yKhTE0DSmzyknP0kvhk1CoX8g
         iIfejL/GxBWFdosWna5yO2cJaMST6e3jIX8lL6sblQhCg3MOwREw+7C6Yh58kr/otvbB
         xJ3BxLGXj66SvWp9/QK3Y/5cCibVeZEFc1LOKbmcqxgjVHwBlF4n54g3Z1n4QZJoPjD5
         XtHg==
X-Forwarded-Encrypted: i=1; AFNElJ84ucgHr2rzyOCH/9YdNkA2r3P9upGlGiMfTHMuHMD/lJKV5uSVkTZjnogYEQNISCb5z9KguWej0HuF0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDNwBdOfYrxrxtwKTYLbzh7+2aRZ72rB87XJEze+qr8qa+y7Zo
	dZeIXHREHbWi/NT8GFa3KlAdpd+X6KMVnjnQ4sbLFjGrZXL2vfY19h2uAu7YmPJ1fx88Az0cXHz
	J3OeuLTiRjYetQonrpsmqEP2c/y1n3JYp+1cK2lEqrcyh+1a9VZIlN74TwcA=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1897:b0:694:9071:b60d with SMTP id
 006d021491bc7-69998d428f6mr6266684eaf.44.1778196921609; Thu, 07 May 2026
 16:35:21 -0700 (PDT)
Date: Thu, 07 May 2026 16:35:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69fd21b9.050a0220.3cf765.035f.GAE@google.com>
Subject: [syzbot] [media?] [usb?] memory leak in v4l2_ctrl_handler_init_class (3)
From: syzbot <syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2FA624F0245
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=c47d4d4befc65788];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60884-lists,linux-media=lfdr.de,b1de0d5fd8a15fac11aa];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,storage.googleapis.com:url,appspotmail.com:email,goo.gl:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    5862221fdded Merge tag 'parisc-for-7.1-rc3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15dfcd06580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c47d4d4befc65788
dashboard link: https://syzkaller.appspot.com/bug?extid=b1de0d5fd8a15fac11aa
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=170a6636580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13dfcd06580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8afd44b99460/disk-5862221f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/488628808019/vmlinux-5862221f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/92718d825f82/bzImage-5862221f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b1de0d5fd8a15fac11aa@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888106b17248 (size 8):
  comm "kworker/1:8", pid 6017, jiffies 4294942650
  hex dump (first 8 bytes):
    00 c7 2b 2b 81 88 ff ff                          ..++....
  backtrace (crc d625c37c):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kvmalloc_node_noprof+0x537/0x760 mm/slub.c:6832
    v4l2_ctrl_handler_init_class+0x59/0x90 drivers/media/v4l2-core/v4l2-ctrls-core.c:1728
    msi2500_probe+0x2a9/0x390 drivers/media/usb/msi2500/msi2500.c:1248
    usb_probe_interface+0x22a/0x4e0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:631 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:709
    __driver_probe_device+0xe8/0x1a0 drivers/base/dd.c:871
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:901
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1029
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1101
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1156
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:613
    device_add+0x99b/0xc70 drivers/base/core.c:3706
    usb_set_configuration+0x8f5/0xb80 drivers/usb/core/message.c:2268
    usb_generic_driver_probe+0x73/0xb0 drivers/usb/core/generic.c:250
    usb_probe_device+0x78/0x1f0 drivers/usb/core/driver.c:291

BUG: memory leak
unreferenced object 0xffff888129cfe400 (size 256):
  comm "kworker/1:8", pid 6017, jiffies 4294942650
  hex dump (first 32 bytes):
    58 f7 2c 13 81 88 ff ff 58 f7 2c 13 81 88 ff ff  X.,.....X.,.....
    10 e4 cf 29 81 88 ff ff 10 e4 cf 29 81 88 ff ff  ...).......)....
  backtrace (crc 9e26d735):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kvmalloc_node_noprof+0x537/0x760 mm/slub.c:6832
    v4l2_ctrl_new+0x2bb/0x1470 drivers/media/v4l2-core/v4l2-ctrls-core.c:2139
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2293
    handler_new_ref+0x34d/0x440 drivers/media/v4l2-core/v4l2-ctrls-core.c:1874
    v4l2_ctrl_add_handler drivers/media/v4l2-core/v4l2-ctrls-core.c:2443 [inline]
    v4l2_ctrl_add_handler+0x12d/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2417
    msi2500_probe+0x2e0/0x390 drivers/media/usb/msi2500/msi2500.c:1256
    usb_probe_interface+0x22a/0x4e0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:631 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:709
    __driver_probe_device+0xe8/0x1a0 drivers/base/dd.c:871
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:901
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1029
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1101
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1156
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:613
    device_add+0x99b/0xc70 drivers/base/core.c:3706

BUG: memory leak
unreferenced object 0xffff88812b2bc840 (size 64):
  comm "kworker/1:8", pid 6017, jiffies 4294942650
  hex dump (first 32 bytes):
    00 c8 2b 2b 81 88 ff ff 68 f7 2c 13 81 88 ff ff  ..++....h.,.....
    00 00 00 00 00 00 00 00 00 e4 cf 29 81 88 ff ff  ...........)....
  backtrace (crc 7d5214ee):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    handler_new_ref+0xd9/0x440 drivers/media/v4l2-core/v4l2-ctrls-core.c:1882
    v4l2_ctrl_new+0x69e/0x1470 drivers/media/v4l2-core/v4l2-ctrls-core.c:2222
    v4l2_ctrl_new_std+0x122/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2293
    handler_new_ref+0x34d/0x440 drivers/media/v4l2-core/v4l2-ctrls-core.c:1874
    v4l2_ctrl_add_handler drivers/media/v4l2-core/v4l2-ctrls-core.c:2443 [inline]
    v4l2_ctrl_add_handler+0x12d/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2417
    msi2500_probe+0x2e0/0x390 drivers/media/usb/msi2500/msi2500.c:1256
    usb_probe_interface+0x22a/0x4e0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:631 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:709
    __driver_probe_device+0xe8/0x1a0 drivers/base/dd.c:871
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:901
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1029
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1101
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1156
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:613

BUG: memory leak
unreferenced object 0xffff88812b2bc800 (size 64):
  comm "kworker/1:8", pid 6017, jiffies 4294942650
  hex dump (first 32 bytes):
    c0 c7 2b 2b 81 88 ff ff 40 c8 2b 2b 81 88 ff ff  ..++....@.++....
    40 c8 2b 2b 81 88 ff ff 00 ea cf 29 81 88 ff ff  @.++.......)....
  backtrace (crc 63c3c8c3):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    handler_new_ref+0xd9/0x440 drivers/media/v4l2-core/v4l2-ctrls-core.c:1882
    v4l2_ctrl_add_handler drivers/media/v4l2-core/v4l2-ctrls-core.c:2443 [inline]
    v4l2_ctrl_add_handler+0x12d/0x180 drivers/media/v4l2-core/v4l2-ctrls-core.c:2417
    msi2500_probe+0x2e0/0x390 drivers/media/usb/msi2500/msi2500.c:1256
    usb_probe_interface+0x22a/0x4e0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:631 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:709
    __driver_probe_device+0xe8/0x1a0 drivers/base/dd.c:871
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:901
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1029
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1101
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1156
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:613
    device_add+0x99b/0xc70 drivers/base/core.c:3706
    usb_set_configuration+0x8f5/0xb80 drivers/usb/core/message.c:2268
    usb_generic_driver_probe+0x73/0xb0 drivers/usb/core/generic.c:250

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

