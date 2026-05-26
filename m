Return-Path: <linux-media+bounces-62741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN7eM7wKFWpPSQcAu9opvQ
	(envelope-from <linux-media+bounces-62741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:51:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCEA5D01C9
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80A143043464
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 02:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AF52F7F02;
	Tue, 26 May 2026 02:49:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04222F1FEF
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 02:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763767; cv=none; b=l34p0IxIDavjqU1NqRfgUtQpZ/F/mdRcbWQHFvVfPFHF3plIgpG8ZyE75fkGJsdqCGDt5jxecKEiS2Nq7UoyaBdQR+UlBlQ1Wk+b27APJox91M9BHNxV4raceaxOPAX4AF0tT69YJiHgr3JPKnprCALBA5LMqIBR2uEB2upONHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763767; c=relaxed/simple;
	bh=4/MJ8TUYH5xhyntHsdQEauFhVcHos+A+Pg3cqt6Ox60=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Y1AujSYtNE660NxJ6VpoW11ht8OStELPBvb+n3k5eq8bdzeNJnt08SUEkDieAaliNaVOBR+LX1WIjMj9dcUDzqgfxsie8BxxiXaGRtIWh2IgW69oKGKf/DB3FqjgRYW5vO5g7EV5SuqEDBTCIdrYctZyzz8ErPlnHzYeUMGLYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-69d8bc9957dso3283323eaf.1
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 19:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779763763; x=1780368563;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EvyEnRBmqyeMoRc/NcD21AEkSR5v4F5ZusZr8VsTDs=;
        b=Vu6m+OYiQD+uF1/XMpaQg0UpehWkYnpKjGO3F3cydqzXefFNwxc/hkBaIHjnInVUSR
         h/k7i7aOWz3300xqzg44/FOXIl3L8yobjX6l/kGEGtAI7IMH5SSLbkhmGYjLYu/IG0XF
         NKXIT1+7aCvHy6G4yZq8Nd0uj30+nl2zxV3ELK+jn5IGq7j7lSNbGVMa1bwcFpoQj2Hr
         DwtZlPTrM/ZIjowcmlIjJXZdpBuhSIpNaKeebknG4Ys5lto53030kxbZvdBbsqgsNJAQ
         DKX3SxtvbhCQBGWmBAdqwJILH7oRwXz29I4+mjFnENo31SnzFnwWJ+nza10ta38rmVmF
         8UEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GejJhvjAb77RItYioB2aiTp4kDh4MdGTia7RRKy6wwOl0wAVWBqqR5hZ1ipeB7l8/dALUdk3e5hdiwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2vXtjAWyDq6PtxbvyUSadmBFD4dAAoO2MI0427ee5Z+LK2G1
	QgcEOJxu5Aj9VliBwWB0Zsx0Yms0wgZK3kCPceIeJVt8/oxuA9aSmAxT/A/2vLNWLBImQvVJ4xJ
	1PZw5UKWQTLVDnJNhhTBPmgU41VKppy6+Z1Anpje5fNqs9CK3HJ8KoR0tOHE=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:edcb:0:b0:688:7dbe:5ff7 with SMTP id
 006d021491bc7-69d7ed3a2bamr9675925eaf.56.1779763763213; Mon, 25 May 2026
 19:49:23 -0700 (PDT)
Date: Mon, 25 May 2026 19:49:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a150a33.2b0a0220.185dbd.0004.GAE@google.com>
Subject: [syzbot] [media?] memory leak in vidtv_psi_service_desc_init (2)
From: syzbot <syzbot+acc3b75c010446ad403f@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=d834308256412d7e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62741-lists,linux-media=lfdr.de,acc3b75c010446ad403f];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org,googlegroups.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,goo.gl:url,storage.googleapis.com:url,appspotmail.com:email,googlegroups.com:email,syzkaller.appspot.com:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 6CCEA5D01C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    45255ea1ca09 Merge tag 'pm-7.1-rc5' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13350d36580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d834308256412d7e
dashboard link: https://syzkaller.appspot.com/bug?extid=acc3b75c010446ad403f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17350d36580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13dd9c2e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4022925bca8d/disk-45255ea1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4a3b4dcf6879/vmlinux-45255ea1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5e129f2050a7/bzImage-45255ea1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+acc3b75c010446ad403f@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881296e58e0 (size 32):
  comm "syz.0.17", pid 5909, jiffies 4294944348
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 48 19 02 0c e0 22 7d 29  ........H...."})
    81 88 ff ff 0a 40 29 7d 29 81 88 ff ff 00 00 00  .....@)}).......
  backtrace (crc c5dd16e3):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4575 [inline]
    slab_alloc_node mm/slub.c:4899 [inline]
    __kmalloc_cache_noprof+0x371/0x480 mm/slub.c:5415
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_service_desc_init+0x74/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:233
    vidtv_channel_s302m_init+0xb1/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:83
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:528
    vidtv_mux_init+0x372/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:515
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881296e58c0 (size 32):
  comm "syz.0.17", pid 5909, jiffies 4294944348
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 05 04 42 53 53 44 00 00  ..........BSSD..
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 168dca61):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4575 [inline]
    slab_alloc_node mm/slub.c:4899 [inline]
    __do_kmalloc_node mm/slub.c:5295 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5308
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_registration_desc_init+0x2d/0xd0 drivers/media/test-drivers/vidtv/vidtv_psi.c:282
    vidtv_channel_s302m_init+0x132/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:107
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:528
    vidtv_mux_init+0x372/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:515
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88812bfbd4f0 (size 8):
  comm "syz.0.17", pid 5909, jiffies 4294944348
  hex dump (first 8 bytes):
    65 6e 67 00 00 00 00 00                          eng.....
  backtrace (crc 5673a685):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4575 [inline]
    slab_alloc_node mm/slub.c:4899 [inline]
    __do_kmalloc_node mm/slub.c:5295 [inline]
    __kmalloc_node_track_caller_noprof+0x3da/0x5c0 mm/slub.c:5408
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_short_event_desc_init+0xf3/0x220 drivers/media/test-drivers/vidtv/vidtv_psi.c:407
    vidtv_channel_s302m_init+0x1c2/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:124
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:528
    vidtv_mux_init+0x372/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:515
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881296e5740 (size 32):
  comm "syz.0.17", pid 5909, jiffies 4294944348
  hex dump (first 32 bytes):
    08 80 fd 80 1b 60 57 6e 29 81 88 ff ff 00 00 00  .....`Wn).......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc e829a286):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4575 [inline]
    slab_alloc_node mm/slub.c:4899 [inline]
    __kmalloc_cache_noprof+0x371/0x480 mm/slub.c:5415
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_sdt_service_init+0x32/0xa0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1386
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:229 [inline]
    vidtv_channel_si_init+0x22f/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881296e5760 (size 32):
  comm "syz.0.17", pid 5909, jiffies 4294944348
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 48 19 02 0c 30 29 7d 29  ........H...0)})
    81 88 ff ff 0a a0 9c 8e 14 81 88 ff ff 00 00 00  ................
  backtrace (crc 2fbc9cf9):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4575 [inline]
    slab_alloc_node mm/slub.c:4899 [inline]
    __kmalloc_cache_noprof+0x371/0x480 mm/slub.c:5415
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_service_desc_init+0x74/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:233
    vidtv_psi_desc_clone+0x137/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:451
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:236 [inline]
    vidtv_channel_si_init+0x1d7/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
    vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
    vidtv_start_feed+0x1d4/0x260 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
    dmx_ts_feed_start_filtering+0x8e/0x130 drivers/media/dvb-core/dvb_demux.c:747
    dvb_dmxdev_start_feed+0x11c/0x170 drivers/media/dvb-core/dmxdev.c:658
    dvb_dmxdev_filter_start+0xd8/0x440 drivers/media/dvb-core/dmxdev.c:769
    dvb_demux_do_ioctl+0x297/0x7d0 drivers/media/dvb-core/dmxdev.c:1065
    dvb_usercopy+0x116/0x2d0 drivers/media/dvb-core/dvbdev.c:996
    dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
    vfs_ioctl fs/ioctl.c:51 [inline]
    __do_sys_ioctl fs/ioctl.c:597 [inline]
    __se_sys_ioctl fs/ioctl.c:583 [inline]
    __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
    do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
    do_syscall_64+0xee/0xf80 arch/x86/entry/syscall_64.c:94
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

