Return-Path: <linux-media+bounces-67553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RiFGGUUEVmoayAAAu9opvQ
	(envelope-from <linux-media+bounces-67553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:41:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 595EA752F8C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:41:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67553-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67553-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03DD8301D213
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E768843F8A4;
	Tue, 14 Jul 2026 09:40:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2D53F86E9
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 09:40:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022036; cv=none; b=jBXyokLbyyFbabxNEVtJqRLDPzOBQzbVjnMSdgkoh4oYX6fsfAkzfK1L+vRt+A4UrOHBGF3ugXhcS1AgxqiyenrGjYfpBSwdMywS1/Rd8AiCrrw7W0U7y6Jz3LpYAYY1psy/DAQ5Jv0/esn/XRZHCXeeTdCSBVeDHt+XQfsWqFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022036; c=relaxed/simple;
	bh=/nF4kO+eyI/dOx6riO2uAtsbaXkk87f8G+ALrEQvaok=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=R6SS5ZCBfItheoxRdAemMECZ4Vwk2iz8OmVdrHfKvq3cqqnCR4dTYi+J2GiTMFxHJ3Tr0vFclzRB2LCUgLtS8zd6i1SpnFgARzUVDw8UIg12xqXg0VpeVT1uyj3BDp/X909BuaQ5X5voavpgcI4l8xb17YhO5mAkbGvqK2DHltY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6a38164d9d5so3206595eaf.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 02:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784022033; x=1784626833;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+HrYelvgxFwbFMzbrtT93uZcZrKJrm4vdN77Vt6IRw=;
        b=ZDDGPK74vmu3fSBm+8nH/Q0s5M3GbhOJB146VRZj2bGrPtS6rVBiFzXV+4Rr7KiDJc
         lDa5aAHHTLjnex5COH2qJ7nkgZkh6parRMLVFuqhoV/j0JNLZPW1SgAGPkVv+GDlwZt1
         pU2mWHPta8o5O1PIwXpC5MAoatRqRiqVc7f6avRdDs7nkM7hz3HL8ZBchm3dGgl5yCKN
         Pp/gsRgWKus902610NwFfI3fJJYpNXn35t5WHTrFa2z5Eb4i9q00jcWGqrlnQkkdkTWs
         JEiV6CtH/ZHhaSDdbgzFkqczzeTUcAt/frVzF7zOlT8FwOX4uS9MYuKkSpX+aQupGUau
         qsaA==
X-Forwarded-Encrypted: i=1; AFNElJ9D/1xyNWC7PiRgo4X6GhubeEQTZeiW08mNnceg1hW2zIsIibyPmq4YDDf/DfhVvm2oKeHBQs/0HghxLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzUp2ndskpk4vrAsqTqAoFXbJtk7vzEgklNHCFj5N42qsx+Vk
	SgDdKAga/OrePeMBMC5zz8PEsXBxNQzcoCbymODdI5yBlORJNDBszAGyGSXz8szpxDh5EmHbzHA
	bSyxN4ieTvHzXG8snt0hM1gQO2ZZEGVW9U7kgrVxzdsl38k6u55fKbOMp5ng=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a509:20b0:6a3:8744:b570 with SMTP id
 006d021491bc7-6a39a5ca4cbmr4296750eaf.22.1784022033707; Tue, 14 Jul 2026
 02:40:33 -0700 (PDT)
Date: Tue, 14 Jul 2026 02:40:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a560411.c90005c7.37d349.001e.GAE@google.com>
Subject: [syzbot] [media?] memory leak in vidtv_psi_registration_desc_init
From: syzbot <syzbot+e9a1f5e196de6663631b@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=b80376788da8bcda];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67553-lists,linux-media=lfdr.de,e9a1f5e196de6663631b];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,goo.gl:url,googlegroups.com:email,vger.kernel.org:from_smtp,storage.googleapis.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,syzkaller.appspot.com:url];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org,googlegroups.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dwlsalmeida@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 595EA752F8C

Hello,

syzbot found the following issue on:

HEAD commit:    2c7c88a412aa Merge tag 'net-7.2-rc3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c32346580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b80376788da8bcda
dashboard link: https://syzkaller.appspot.com/bug?extid=e9a1f5e196de6663631b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=162a7f39580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=158b4432580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a14b4cfab39c/disk-2c7c88a4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/66526931636d/vmlinux-2c7c88a4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c6fa9bcd2f12/bzImage-2c7c88a4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e9a1f5e196de6663631b@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff888111e282c0 (size 32):
  comm "syz.0.17", pid 5937, jiffies 4294942991
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 05 04 42 53 53 44 00 00  ..........BSSD..
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 168dca61):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __do_kmalloc_node mm/slub.c:5361 [inline]
    __kmalloc_noprof+0x3bf/0x550 mm/slub.c:5387
    _kmalloc_noprof include/linux/slab.h:973 [inline]
    _kzalloc_noprof include/linux/slab.h:1290 [inline]
    vidtv_psi_registration_desc_init+0x2d/0xd0 drivers/media/test-drivers/vidtv/vidtv_psi.c:282
    vidtv_channel_s302m_init+0x132/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:107
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:528
    vidtv_mux_init+0x377/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:521
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
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888111ddb450 (size 8):
  comm "syz.0.17", pid 5937, jiffies 4294942991
  hex dump (first 8 bytes):
    65 6e 67 00 00 00 00 00                          eng.....
  backtrace (crc 5673a685):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __do_kmalloc_node mm/slub.c:5361 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5497
    __kmemdup_nul mm/util.c:64 [inline]
    kstrdup+0x3c/0x80 mm/util.c:84
    vidtv_psi_short_event_desc_init+0xf3/0x220 drivers/media/test-drivers/vidtv/vidtv_psi.c:407
    vidtv_channel_s302m_init+0x1c2/0x2a0 drivers/media/test-drivers/vidtv/vidtv_channel.c:124
    vidtv_channels_init+0x1b/0x40 drivers/media/test-drivers/vidtv/vidtv_channel.c:528
    vidtv_mux_init+0x377/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:521
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
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888111e28ce0 (size 32):
  comm "syz.0.17", pid 5937, jiffies 4294942991
  hex dump (first 32 bytes):
    08 80 fd 80 1b 00 81 e2 11 81 88 ff ff 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc dcdc23d2):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5511
    _kmalloc_noprof include/linux/slab.h:969 [inline]
    _kzalloc_noprof include/linux/slab.h:1290 [inline]
    vidtv_psi_sdt_service_init+0x32/0xa0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1386
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:229 [inline]
    vidtv_channel_si_init+0x22f/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
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
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888111e28100 (size 32):
  comm "syz.0.17", pid 5937, jiffies 4294942991
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 48 19 02 0c 80 33 83 03  ........H....3..
    81 88 ff ff 0a 30 9f 30 10 81 88 ff ff 00 00 00  .....0.0........
  backtrace (crc 844dd5c4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5511
    _kmalloc_noprof include/linux/slab.h:969 [inline]
    _kzalloc_noprof include/linux/slab.h:1290 [inline]
    vidtv_psi_service_desc_init+0x74/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:233
    vidtv_psi_desc_clone+0x137/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:451
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:236 [inline]
    vidtv_channel_si_init+0x1d7/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
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
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
    entry_SYSCALL_64_after_hwframe+0x77/0x7f

BUG: memory leak
unreferenced object 0xffff888111e28000 (size 32):
  comm "syz.0.17", pid 5937, jiffies 4294942991
  hex dump (first 32 bytes):
    00 01 ef 2f 09 00 00 23 59 59 80 8d c0 17 cd 14  .../...#YY......
    81 88 ff ff 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc fd542bd4):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4625 [inline]
    slab_alloc_node mm/slub.c:4945 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5511
    _kmalloc_noprof include/linux/slab.h:969 [inline]
    _kzalloc_noprof include/linux/slab.h:1290 [inline]
    vidtv_psi_eit_event_init+0x6d/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1928
    vidtv_channel_eit_event_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:182 [inline]
    vidtv_channel_si_init+0x31d/0x770 drivers/media/test-drivers/vidtv/vidtv_channel.c:443
    vidtv_mux_init+0x115/0x390 drivers/media/test-drivers/vidtv/vidtv_mux.c:525
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
    do_syscall_64+0xf8/0x610 arch/x86/entry/syscall_64.c:94
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

