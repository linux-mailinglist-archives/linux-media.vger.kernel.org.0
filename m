Return-Path: <linux-media+bounces-58609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEsBNE2y22lfFQkAu9opvQ
	(envelope-from <linux-media+bounces-58609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 16:55:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC43E4675
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 16:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99DB0300D6AC
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 14:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAA337CD3A;
	Sun, 12 Apr 2026 14:55:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F92C21F0
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776005706; cv=none; b=i78s3hlKJ2Gu1fT4N1vAUffTJFZxRtbhrRe+7s6pyHvaErx6MraW68BAkfMsZ1mHUr4rMNVJWNIus6q1lpUfv2MPvFhB+lGmqi8z31nwQuERs45Xpz3fdzVGCxsBYExK/MR7Oaf991SLWK+ihwBr7Y9mybOgcr/otxLdJ6fWE78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776005706; c=relaxed/simple;
	bh=4RRdnBLP3Hz96BtMU3C6/EgQrJUQ9BJVxiT0uPNOj+4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kCf+ODfYl4Ve97+KqZtGTalDAoPs+SBXm15+U2IsGnt91tnN0bBwcpxBCBvXsqSLodW4BRrhqh0/Yfwf3HLHOQgouBOLiXeA3WKbT13YAHmoPgqF2hCyTl94kEE2dqxItxJuYtsSCBHNlkTIPNlvuEOMbx3/P6TyEYSwnm2YJtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-68cfc614246so2148292eaf.3
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 07:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776005704; x=1776610504;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVf5fiqUq0onPyBFF8VtLinQdg5TDgsGPn7OOzBAazQ=;
        b=UuiGrJetdxMVbd5j/wlJGgBZKVPoABNc2Cm03j9t/1W7aULZZQttUguny3wBZA58+R
         wW/YB8kL7bTTtK/qRS4JWelIixkWv3xgvlQmzXEtgkQxE46YdybtZwgxOp53d5cFdqSz
         BqjictH534YPR0WS4EwtIOkp1Lly8RzqalsCJMQdiclOEJPGITjcgknQCDHjRvNh1T5K
         pbYAEWtkwa72Fdyc5ifcTkzuTG/8kHtbiZdtIooZ0Q7NwV0MAo6RqbSE4E8XmqfJT4WK
         OpT07sa/IbPcr1x8zfVdyaPEvDv7RjyKMgOi4KeDAykl/7vTmyxzDsygynJfq2KDfn/V
         qH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsUe4QnkxSQ7y0IB9+BDWboeGkpSkAYCB2AmRhaQc2vq41BR9JRElzhwjo++vJPUqNi7zrBB3auX/mzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsk1rbrYXQAsjbcCg0KLGbeY7g9dEXfe9rr6XmCPWKAyxfa5wk
	uQMEYGKLoRggyPoHjp1bnJMZRnV8uDYeRiUpMg889vCqVyPMLmyuXt0Hsae76DvLpA+d7hKmUzP
	rtF8b+zU4UoH2KnmeFO3z/H4r8ttjm3Ff8AkBoNKXT/yU/8R22X5kIlyh0yk=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1886:b0:685:dcfd:2305 with SMTP id
 006d021491bc7-68be57780femr5155444eaf.3.1776005703838; Sun, 12 Apr 2026
 07:55:03 -0700 (PDT)
Date: Sun, 12 Apr 2026 07:55:03 -0700
In-Reply-To: <aduY8CsgJq3SUXD2@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69dbb247.a00a0220.468cb.0039.GAE@google.com>
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_short_event_desc_init
From: syzbot <syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com>
To: azpijr@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-58609-lists,linux-media=lfdr.de,afc686a471d70896c5d9];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EBFC43E4675
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in vidtv_psi_short_event_desc_init

BUG: memory leak
unreferenced object 0xffff88812bb30d00 (size 64):
  comm "syz.0.17", pid 6713, jiffies 4294945608
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 4d 8b 98 d9 e0 09 81 88  ........M.......
    ff ff 20 40 d8 7a 14 81 88 ff ff 66 00 23 c3 14  .. @.z.....f.#..
  backtrace (crc 3cb0610c):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __kmalloc_cache_noprof+0x377/0x480 mm/slub.c:5375
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_short_event_desc_init+0x9e/0x220 drivers/media/test-drivers/vidtv/vidtv_psi.c:444
    vidtv_channel_s302m_init+0x1c2/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:124
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:524
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
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888109e0d998 (size 8):
  comm "syz.0.17", pid 6713, jiffies 4294945608
  hex dump (first 8 bytes):
    65 6e 67 00 00 00 00 00                          eng.....
  backtrace (crc 5673a685):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_node_track_caller_noprof+0x3e0/0x5d0 mm/slub.c:5368
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_short_event_desc_init+0xf3/0x220 drivers/media/test-drivers/vidtv/vidtv_psi.c:462
    vidtv_channel_s302m_init+0x1c2/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:124
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:524
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
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff8881147ad840 (size 64):
  comm "syz.0.17", pid 6713, jiffies 4294945608
  hex dump (first 32 bytes):
    0b 4c 75 64 77 69 67 20 76 61 6e 20 42 65 65 74  .Ludwig van Beet
    68 6f 76 65 6e 3a 20 46 fc 72 20 45 6c 69 73 65  hoven: F.r Elise
  backtrace (crc 6d5386ce):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __do_kmalloc_node mm/slub.c:5259 [inline]
    __kmalloc_node_track_caller_noprof+0x3e0/0x5d0 mm/slub.c:5368
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_short_event_desc_init+0x1f0/0x220 drivers/media/test-drivers/vidtv/vidtv_psi.c:467
    vidtv_channel_s302m_init+0x1c2/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:124
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:524
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
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff88812a3536e0 (size 32):
  comm "syz.0.17", pid 6713, jiffies 4294945608
  hex dump (first 32 bytes):
    08 80 fd 80 1b e0 30 35 2a 81 88 ff ff 00 00 00  ......05*.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 47116e02):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __kmalloc_cache_noprof+0x377/0x480 mm/slub.c:5375
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_sdt_service_init+0x32/0xa0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1441
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:229 [inline]
    vidtv_channel_si_init+0x230/0x750 drivers/media/test-drivers/vidtv/vidtv_channel.c:435
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
    do_syscall_64+0xe2/0xf80 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


Tested on:

commit:         f5459048 Merge tag 'i2c-for-7.0-final' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15ce1036580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5
dashboard link: https://syzkaller.appspot.com/bug?extid=afc686a471d70896c5d9
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11dcdcd2580000


