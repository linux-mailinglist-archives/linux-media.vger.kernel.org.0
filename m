Return-Path: <linux-media+bounces-58103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K0mIXMS1GmEqgcAu9opvQ
	(envelope-from <linux-media+bounces-58103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 22:07:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAEA3A6DF1
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 22:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65E123047501
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 20:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8673988EE;
	Mon,  6 Apr 2026 20:04:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E64311963
	for <linux-media@vger.kernel.org>; Mon,  6 Apr 2026 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505868; cv=none; b=ltCW5iuLHZoRla9Yjl0ssYATHSOlc6rlzo6EI8s5PDwR0sTuKA6C1tgd+q+GiJkg541/xwu/8LkUVJm62wUK2Xg8hwxfUZT+jBOEAsqZD6pKzHMzWtgNJFqCF6yonTBwNRXV2jxVr71Q3T5byGXfPpaZTjOAmRQCyqXseDlEzKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505868; c=relaxed/simple;
	bh=Q3IF9LtoK5CiISJjYZR3IPfPs2OSbvwU/HxXHv4nT2U=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XsgCXKGDs51f6QcNDn/Yi+XQGyqtQM6Zc/2bcdpzJuaQnBn9zLyknZqDsqa5Xd9JsHzCtSN+FpDdJdkEH1LLdl7UXC6wOH1ZBjOGok2ezbA9EPhYE5RDoIosVAUi27Z/Vvi/CV0yCZiI/wyvtT7ruatBkKyKWRWVW7A0cGFIIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-67a1e063795so12618276eaf.1
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 13:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505865; x=1776110665;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AA6tmpz0oO17jdG6+AAgEp8lIVjb3vtI3aNAWWVubf8=;
        b=RLiQIez7rezHnu3HXr4BWN7+dJdqNI+D1EzVn5YozntbUMYF7iOl62ZjdBCLgytZWP
         OZYipHVAXFCKHBOlsYGh8BlgEkdWLejNJ1NJwk0Pf+bdOs/RA1gfnWgEDs0V9vn68ZEr
         5tyDUALY0ZJKna0aASPRzvOfTR7dJ10Mv4GE+fUSjFX4Qt9pFtpz6GyZyuw35NXRML5M
         OMlfRSizpoRy4LIDN+MpHyZ3lJPThVPEwFWB67FyzKejCi5ZrDhTYd2ReyWi1ZKQsXhw
         jN0RrFYm/66N5Ev2hgOxbrqZ7AjDG2CzmX0rtwClAM/4QPG0EtwYa7flXHUVsE8PFN2R
         LORw==
X-Forwarded-Encrypted: i=1; AJvYcCXntJQZ6ObtE/FO5CpNxYkrimu0SF4rwQ48UfS/Dw3V8PY23JjzAlisePuhpq5u8WBeVk/8xlyNVKtZMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/N/yG2wLxDeB6l6ifc/4RFjnHcY5ZaYnLG0sZhNombJ9sYND
	CRk4hZS4kQuhcCMyXdk7eDIENHhJtpXkbJTkRTHpkoTLMOna7fCdBkXPF2U5m4i0+l51v0fmiT/
	lOSWIipWdA7zHTZkQjtNy0IPmXDpi05wO4tAe3sVomulpnHA9usycQL9vZ/8=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:55c9:10b0:67d:f215:e785 with SMTP id
 006d021491bc7-680f7e96326mr5908842eaf.5.1775505865496; Mon, 06 Apr 2026
 13:04:25 -0700 (PDT)
Date: Mon, 06 Apr 2026 13:04:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
Subject: [syzbot] [media?] memory leak in vidtv_psi_short_event_desc_init
From: syzbot <syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58103-lists,linux-media=lfdr.de,afc686a471d70896c5d9];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org,googlegroups.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email,syzkaller.appspot.com:url,goo.gl:url,googlegroups.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: BFAEA3A6DF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    591cd656a1bf Linux 7.0-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ca55da580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2bba615ee79faa5
dashboard link: https://syzkaller.appspot.com/bug?extid=afc686a471d70896c5d9
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=127ad46a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16cf33da580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6b8983945f60/disk-591cd656.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a97f51ce06d9/vmlinux-591cd656.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e945a74880b8/bzImage-591cd656.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881145cb200 (size 64):
  comm "syz.0.17", pid 6104, jiffies 4294941873
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
unreferenced object 0xffff888127ff87a0 (size 32):
  comm "syz.0.17", pid 6104, jiffies 4294941873
  hex dump (first 32 bytes):
    08 80 fd 80 1b e0 83 ff 27 81 88 ff ff 00 00 00  ........'.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 52407852):
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

BUG: memory leak
unreferenced object 0xffff888127ff83e0 (size 32):
  comm "syz.0.17", pid 6104, jiffies 4294941873
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 48 19 02 0c 50 85 36 11  ........H...P.6.
    81 88 ff ff 0a b0 82 36 11 81 88 ff ff 00 00 00  .......6........
  backtrace (crc e8912ca1):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __kmalloc_cache_noprof+0x377/0x480 mm/slub.c:5375
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_service_desc_init+0x74/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:288
    vidtv_psi_desc_clone+0x137/0x160 drivers/media/test-drivers/vidtv/vidtv_psi.c:506
    vidtv_channel_sdt_serv_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:236 [inline]
    vidtv_channel_si_init+0x1d8/0x750 drivers/media/test-drivers/vidtv/vidtv_channel.c:435
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

BUG: memory leak
unreferenced object 0xffff888127ff81a0 (size 32):
  comm "syz.0.17", pid 6104, jiffies 4294941873
  hex dump (first 32 bytes):
    00 01 ee d0 18 00 00 23 59 59 80 8d 80 b0 6f 14  .......#YY....o.
    81 88 ff ff 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc 79354a12):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4543 [inline]
    slab_alloc_node mm/slub.c:4866 [inline]
    __kmalloc_cache_noprof+0x377/0x480 mm/slub.c:5375
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    vidtv_psi_eit_event_init+0x6d/0x1b0 drivers/media/test-drivers/vidtv/vidtv_psi.c:1983
    vidtv_channel_eit_event_cat_into_new drivers/media/test-drivers/vidtv/vidtv_channel.c:182 [inline]
    vidtv_channel_si_init+0x31b/0x750 drivers/media/test-drivers/vidtv/vidtv_channel.c:439
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

