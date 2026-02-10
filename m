Return-Path: <linux-media+bounces-52485-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEQFJIGvimklNAAAu9opvQ
	(envelope-from <linux-media+bounces-52485-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 05:09:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C3116D7A
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 05:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 676D4301413F
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 04:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73CF2FFF90;
	Tue, 10 Feb 2026 04:09:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD91278156
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 04:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770696569; cv=none; b=c90dOsoD0+TH0L4heTn3/EnJZNaVS0+ACJYa55NLPfSGwPrHtj7i6CI9MTWLeG0bjZxtNTNaYHpnfZl+zSE65AUXI9AWoErWX9aWe8TnvfG+bH1oc2rJT7awMAO3UIMhss3FgWcwl4WBIt6fcuHHevkG1ECstEauA3imatDTSSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770696569; c=relaxed/simple;
	bh=tiLCN98J4bn0EGyvt74OlYDQfUB5SfHMEsDCeRllRT4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=CAHFrJFQuNsXuDGBXNqTCMbktyh84v+UpCf9ehgDzftHJRFpWeZg9HNPZFHvk7/Zrvgb24iwUuaz9adOMPObZNJ8bJg7YN5mrkLgvqPdtiFCrTo7g0stgCIlga8G0m9WX9rknQKiFSOBvbScHTRK4htWUke9YMTIlBaJeDTnS2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6631840318fso17909503eaf.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 20:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770696567; x=1771301367;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GfY/qHH+1S6pSWh631xPmx6yB+DaTA4YJ61SecxIsRI=;
        b=QopCImZIwivizJ/KUsW/d6s2v/1lobTA5KAllP43BmnqC45TNkgeCuMk82kNrp+F/5
         2wuuqBdDnEB1fowk0sB7cGWicsiVI9SdIdF8Uk9Y3zFBddO08b4vZKxlIV8uafBwSU4T
         NpWaRIw3HGd19z22wC2QZEFx/Z65BN6bpveot2I/s04w4yDB7SHuLEecHeaIazAnyTWm
         y3C5nQ5vyppKGbpSffkPEwlZ/GrvKo/jqCJ3zYeSEkAQvqs6I/8L7e7I+LnAwRlQdBGQ
         1/sZdxWerGpt+qRuNNMICug4D9vKKkLz3hvcveGYdkOT3c9/kn+goa34j8X9lMqivOpn
         JG5g==
X-Forwarded-Encrypted: i=1; AJvYcCWIXfB5v92nSq/SpkscJ83E+c8PrpidbAr3eqRtq+kJMTSQwACpb9LI/PewPSULP0lN0aaG2l86tcUkgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmvjNb7NyWIJTuMiABJ9E8+fH9ft4mp460QHKlQlYW6K6tuGy
	mfmMZWwn1/2q2X65Aws5y0tbhyuDX8+SqFlarqNlZOXQi8QKFIqtvm0BKzoZeCfXB3t69P16h55
	9umxmpKlyjIBBigzjlO1FE9PD25Hnyv4/Njd6C8Kt8ZHgZXDKojVWISIJwn0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f014:b0:66e:7439:76ee with SMTP id
 006d021491bc7-66e74397850mr5444441eaf.75.1770696567096; Mon, 09 Feb 2026
 20:09:27 -0800 (PST)
Date: Mon, 09 Feb 2026 20:09:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <698aaf77.050a0220.1ad825.0033.GAE@google.com>
Subject: [syzbot] [media?] memory leak in vidtv_psi_service_desc_init
From: syzbot <syzbot+639ebc6ec75e96674741@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52485-lists,linux-media=lfdr.de,639ebc6ec75e96674741];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org,googlegroups.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,storage.googleapis.com:url,appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,goo.gl:url,syzkaller.appspot.com:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: DC8C3116D7A
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    05f7e89ab973 Linux 6.19
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1143533a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d7d0fbecb37bff8
dashboard link: https://syzkaller.appspot.com/bug?extid=639ebc6ec75e96674741
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ed6a52580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1587465a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1ad63df9059c/disk-05f7e89a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4f2b44c1d6fd/vmlinux-05f7e89a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9736a52697bc/bzImage-05f7e89a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+639ebc6ec75e96674741@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888145b50820 (size 32):
  comm "syz.0.17", pid 6068, jiffies 4294944486
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 48 19 02 0c 60 fd 02 09  ........H...`...
    81 88 ff ff 0a 70 fd 02 09 81 88 ff ff 00 00 00  .....p..........
  backtrace (crc 90a0c7d4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __kmalloc_cache_noprof+0x41a/0x590 mm/slub.c:5775
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    vidtv_psi_service_desc_init+0x74/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:288
    vidtv_channel_s302m_init+0xb1/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:83
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:524
    vidtv_mux_init+0x372/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:515
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:655
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:766
    dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:963 [inline]
    dvb_demux_do_ioctl+0x7a2/0x7d0 drivers/media/dvb-core/dmxdev.c:1077
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:999
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1186
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810902fd70 (size 16):
  comm "syz.0.17", pid 6068, jiffies 4294944486
  hex dump (first 16 bytes):
    0b 42 65 65 74 68 6f 76 65 6e 00 00 00 00 00 00  .Beethoven......
  backtrace (crc e88d86b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_node_track_caller_noprof+0x47b/0x690 mm/slub.c:5768
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_service_desc_init+0x17a/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:305
    vidtv_channel_s302m_init+0xb1/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:83
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:524
    vidtv_mux_init+0x372/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:515
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:655
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:766
    dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:963 [inline]
    dvb_demux_do_ioctl+0x7a2/0x7d0 drivers/media/dvb-core/dmxdev.c:1077
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:999
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1186
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88810902fd60 (size 16):
  comm "syz.0.17", pid 6068, jiffies 4294944486
  hex dump (first 16 bytes):
    0b 4c 69 6e 75 78 54 56 2e 6f 72 67 00 00 00 00  .LinuxTV.org....
  backtrace (crc b60e4fc0):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_node_track_caller_noprof+0x47b/0x690 mm/slub.c:5768
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_service_desc_init+0x130/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:313
    vidtv_channel_s302m_init+0xb1/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:83
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:524
    vidtv_mux_init+0x372/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:515
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:655
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:766
    dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:963 [inline]
    dvb_demux_do_ioctl+0x7a2/0x7d0 drivers/media/dvb-core/dmxdev.c:1077
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:999
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1186
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888145b502c0 (size 32):
  comm "syz.0.17", pid 6068, jiffies 4294944486
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 05 04 42 53 53 44 00 00  ..........BSSD..
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 168dca61):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4958 [inline]
    slab_alloc_node mm/slub.c:5263 [inline]
    __do_kmalloc_node mm/slub.c:5656 [inline]
    __kmalloc_noprof+0x465/0x680 mm/slub.c:5669
    kmalloc_noprof include/linux/slab.h:961 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    vidtv_psi_registration_desc_init+0x2d/0xd0 drivers/media/test-drivers/vidtv/vidtv_psi.c:337
    vidtv_channel_s302m_init+0x132/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:107
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:524
    vidtv_mux_init+0x372/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:515
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:655
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:766
    dvb_dmxdev_pes_filter_set drivers/media/dvb-core/dmxdev.c:963 [inline]
    dvb_demux_do_ioctl+0x7a2/0x7d0 drivers/media/dvb-core/dmxdev.c:1077
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:999
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1186
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xa4/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

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

