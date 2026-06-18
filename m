Return-Path: <linux-media+bounces-65239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4OkGJs5wNGrJYAYAu9opvQ
	(envelope-from <linux-media+bounces-65239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 00:27:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E429D6A2F22
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 00:27:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WThfp+1W;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65239-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65239-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1770304C7FD
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 22:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAD534250E;
	Thu, 18 Jun 2026 22:27:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BBD308F32
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 22:27:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781821623; cv=none; b=R9I6cPZ5CXDK+dNGRwHhoFA7po3+IJyWOOIEWScvr4jvqAduO8hpHt2sExH+rQKDF/WRL/Rl6Io4PR0eN+mQi74clLlhcyi0PvwWMrm0JpBa7kEBJU50SOaaVTfd52OMgqREuc8R67i0OJg+ykKvfxmXjKHCkBeutSvL2SAF/ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781821623; c=relaxed/simple;
	bh=s/bpaS8/ZucHNp3161HtJVW2CkQmNeaQCdO4wgRJmWs=;
	h=Message-ID:Date:Subject:To:Cc:Content-Type:MIME-Version:From; b=NCc9pRH/Nmt4fApJS6P0GTv78eKfg1N5hwAnRSxlmiE3U1JkZsggBZenYqiBP4JOepduv4tnV6Az+D5KYwx9JsCrCNUJVD/iJeSC2a/6S1ypEpKrDIfyVpwAEluP/O/X2Ipsk1dWXHy0x6wlTuxSOzg5TXgcD/eAIPoRf1VoHHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WThfp+1W; arc=none smtp.client-ip=209.85.217.49
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-728ab13d1d2so51225137.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 15:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781821621; x=1782426421; darn=vger.kernel.org;
        h=from:mime-version:content-transfer-encoding:cc:to:subject:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nndZDsVBQXK6p6BB0nDCWywsCGCPc/CnDR5kfHYEU0E=;
        b=WThfp+1WLHhPpdr38L/ydlpzY+KuEUIgUbM53PoG889Papsd5CSsR+hxuvwBiy+sEZ
         QLUuOy/Huj77vXZHZKuo947WFBgaLpI0CIADqYDSki5zYN8yEaF7gc0gikJt7gWOsKc8
         mtg9+vNfDpQgDCPJi//x3ODvsqeaMSGo+h4i4fnD2bN87sFfLeNIKutbe9oEGPu4Ho9B
         256+UgymdCJ+VehHgsN+WovQ/2qdDEzJWRzuyYThr63/nuBucAl6Lee8/ziElUtefCC9
         ytu05x4VQ6h1aIW/dalbNOMWNl3crfGbt6VXwMXQK/k40cUMwtcM2/3+lMTVCgWCgymg
         3paA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781821621; x=1782426421;
        h=from:mime-version:content-transfer-encoding:cc:to:subject:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nndZDsVBQXK6p6BB0nDCWywsCGCPc/CnDR5kfHYEU0E=;
        b=USBLImD1nyO9UVZaaGAnX2KGZEx5WrDf9/PnsIb0fwLVb/4msa5VGk2D0kMGMG1MuC
         BHqS5N6Fa6DCpIolfxFKMmlc8zUME337CybYxhkLpN9M6zgk1ZG+iiLRRqb//utGz7Lw
         dA+SqWkwopG2QsR+hIy74Csa00B0Vl8qwo6xj0JMZV6UA6/08x93EHRVTpndWbbwj4PC
         gLYXcLVA8bwGkuV1iPznkar/K1IIDvK2E1RCUN+4onZOGPjS0NZjREPNvkHZB5CY18vO
         l10D0m2zw+46OpLV/T7XMVLbneB9QMGgCLoJn4RyGepqjNwU9ktWIke9mjmYTH08fi2Y
         SRnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CGeRTvyC97ZO7zf4qhUook8y2yEY6Ld2kcsx6RU4zZy0jU+xgfTVdE4hu03eo5lU5phSvErgxsHfdkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCXKO2J2znCkstVI9lOuO1RqIcriLpgZk4rSKCAqGm7zd2aEyu
	UTdMT8pqMy116TQFvelpDRkVpDtOj5W5/4wujdTWPiD/kheY6su2VZ/T
X-Gm-Gg: AfdE7cmtbHsloIVF2ped/cwNA/hbi0hSB0yJgJkK/bPhf2iWn8kyOO+HKCVHTraNv+d
	982chKmaqk+l+pD95ssrfILg3y4/0foOAG9y7yZLXgyR/RpznOQ4upOZ4rd0Pra7eg/gwkJshmL
	XFcLkDpLdgSo39/r5BzDeGHWMoGeZRFOHDkXnABHNhBEwumxRXdKHNB2MxXXrLg3mc7hQKHh/om
	4J0DtZILV2/+fj0xvITjiVsSfch+igx33sNfuiW9S2iKZd2Llas/3drLyPHZA1yNTbRsqPiXQaz
	1prqvRKKoKVavqHU8dnB0Z+9/Km9c0zpMFrqSQ0ab0UaaTeQEcHiC7wPbmPAKSTbZY7FQtKyMUv
	bW+oXgX8TtxesdeyzMS0krUoKRFDQXUlGBe9NJ+uETdNNlnI07KZ3dbyPQkI+qiSW8bgWMQT7hl
	9dJBzHJFPvqm+UVpyu5NWdDpFn+Id0aALNlg0uCuhGFQqxIyhTO+Y54kVxU5LAYQPAA6bjrBeap
	ukEwhIepk0y
X-Received: by 2002:a05:6102:3e92:b0:729:15de:c73c with SMTP id ada2fe7eead31-72a01cac365mr482651137.2.1781821620679;
        Thu, 18 Jun 2026 15:27:00 -0700 (PDT)
Received: from [192.168.10.115] ([132.170.207.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966fc50bf80sm548870241.12.2026.06.18.15.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:26:59 -0700 (PDT)
Message-ID: <6a3470b3.01a98498.2c3fd5.dec7@mx.google.com>
Date: Thu, 18 Jun 2026 15:26:59 -0700 (PDT)
Subject: KASAN: slab-use-after-free Read in v4l2_fh_open
To: mchehab@kernel.org, hverkuil+cisco@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, kees@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: syzkaller@googlegroups.com, contact@pgazz.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: sanan.hasanou@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-65239-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sananhasanou@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzkaller@googlegroups.com,m:contact@pgazz.com,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sananhasanou@gmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E429D6A2F22

Good day, dear maintainers,

We found a bug using a modified version of syzkaller.

Kernel Branch: 7.0-rc1
Kernel Config: <https://drive.google.com/open?id=173DLEAEPKPhhR1TcqofdnkLpdoK7PMFl>
Reproducer: <https://drive.google.com/open?id=1R8QMlaB0Uwrt1BIzqQvRrMo6VYbmX3qK>
Thank you!

Best regards,
Sanan Hasanov

==================================================================
BUG: KASAN: slab-use-after-free in v4l2_fh_init drivers/media/v4l2-core/v4l2-fh.c:25 [inline]
BUG: KASAN: slab-use-after-free in v4l2_fh_open+0x144/0x550 drivers/media/v4l2-core/v4l2-fh.c:64
Read of size 8 at addr ffff8880570245b8 by task v4l_id/31950

CPU: 0 UID: 0 PID: 31950 Comm: v4l_id Not tainted 7.0.0-rc1 #1 PREEMPT(full) 
Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xcb/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 v4l2_fh_init drivers/media/v4l2-core/v4l2-fh.c:25 [inline]
 v4l2_fh_open+0x144/0x550 drivers/media/v4l2-core/v4l2-fh.c:64
 em28xx_v4l2_open+0x15a/0x990 drivers/media/usb/em28xx/em28xx-video.c:2153
 v4l2_open+0x1bc/0x390 drivers/media/v4l2-core/v4l2-dev.c:433
 chrdev_open+0x4cd/0x5e0 fs/char_dev.c:411
 do_dentry_open+0x777/0x14d0 fs/open.c:949
 vfs_open+0x3d/0x340 fs/open.c:1081
 do_open fs/namei.c:4671 [inline]
 path_openat+0x2d8a/0x37e0 fs/namei.c:4830
 do_file_open+0x208/0x440 fs/namei.c:4859
 do_sys_openat2+0x10a/0x1e0 fs/open.c:1366
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_openat fs/open.c:1388 [inline]
 __se_sys_openat fs/open.c:1383 [inline]
 __x64_sys_openat+0x13d/0x170 fs/open.c:1383
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x19a/0x7b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x4b/0x53
RIP: 0033:0x7fdfdd774127
Code: 25 00 00 41 00 3d 00 00 41 00 74 47 64 8b 04 25 18 00 00 00 85 c0 75 6b 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 95 00 00 00 48 8b 4c 24 28 64 48 2b 0c 25
RSP: 002b:00007ffd4df65430 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007ffd4df65628 RCX: 00007fdfdd774127
RDX: 0000000000000000 RSI: 00007ffd4df65f19 RDI: 00000000ffffff9c
RBP: 00007ffd4df65f19 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Allocated by task 12368:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x70 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xa0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x27b/0x3e0 mm/slub.c:5339
 kmalloc_noprof include/linux/slab.h:962 [inline]
 kzalloc_noprof include/linux/slab.h:1200 [inline]
 em28xx_v4l2_init+0x16b/0x2ef0 drivers/media/usb/em28xx/em28xx-video.c:2532
 em28xx_init_extension+0x11f/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0x811/0xf10 kernel/workqueue.c:3358
 worker_thread+0x9c1/0xeb0 kernel/workqueue.c:3439
 kthread+0x3c1/0x4d0 kernel/kthread.c:467
 ret_from_fork+0x608/0xc40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:245

Freed by task 12368:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x70 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2687 [inline]
 slab_free mm/slub.c:6124 [inline]
 kfree+0x1f8/0x4f0 mm/slub.c:6442
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x16d4/0x2ef0 drivers/media/usb/em28xx/em28xx-video.c:2901
 em28xx_init_extension+0x11f/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0x811/0xf10 kernel/workqueue.c:3358
 worker_thread+0x9c1/0xeb0 kernel/workqueue.c:3439
 kthread+0x3c1/0x4d0 kernel/kthread.c:467
 ret_from_fork+0x608/0xc40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888057024000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 1464 bytes inside of
 freed 8192-byte region [ffff888057024000, ffff888057026000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x57020
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff888057022011
flags: 0x2000000000000040(head|zone=1)
page_type: f5(slab)
raw: 2000000000000040 ffff888012c42280 dead000000000100 dead000000000122
raw: 0000000000000000 0000400000020002 00000000f5000000 ffff888057022011
head: 2000000000000040 ffff888012c42280 dead000000000100 dead000000000122
head: 0000000000000000 0000400000020002 00000000f5000000 ffff888057022011
head: 2000000000000003 ffffea00015c0801 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 12836, tgid 12836 (kworker/1:8), ts 148781064900, free_ts 148779833020
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x253/0x480 mm/page_alloc.c:1889
 prep_new_page mm/page_alloc.c:1897 [inline]
 get_page_from_freelist+0x2240/0x2330 mm/page_alloc.c:3962
 __alloc_frozen_pages_noprof+0x20e/0x3d0 mm/page_alloc.c:5250
 alloc_slab_page+0x5e/0x120 mm/slub.c:-1
 allocate_slab+0x77/0x540 mm/slub.c:3444
 new_slab mm/slub.c:3502 [inline]
 refill_objects+0x229/0x680 mm/slub.c:7134
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x1cf/0x430 mm/slub.c:4578
 alloc_from_pcs mm/slub.c:4681 [inline]
 slab_alloc_node mm/slub.c:4815 [inline]
 __kmalloc_cache_noprof+0x377/0x3e0 mm/slub.c:5334
 kmalloc_noprof include/linux/slab.h:962 [inline]
 kzalloc_noprof include/linux/slab.h:1200 [inline]
 snd_mixer_oss_notify_handler+0x1bc/0x1150 sound/core/oss/mixer_oss.c:1318
 snd_card_register+0x5df/0x750 sound/core/init.c:923
 try_to_register_card+0x2a1/0x330 sound/usb/card.c:-1
 usb_audio_probe+0x145d/0x1e80 sound/usb/card.c:1045
 usb_probe_interface+0x6c8/0xcf0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x46f/0xbb0 drivers/base/dd.c:661
 __driver_probe_device+0x1ad/0x330 drivers/base/dd.c:803
 driver_probe_device+0x54/0x240 drivers/base/dd.c:833
page last free pid 12836 tgid 12836 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1433 [inline]
 __free_frozen_pages+0xb5e/0x1200 mm/page_alloc.c:2978
 __slab_free+0x2d2/0x2e0 mm/slub.c:5532
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9e/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14a/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4501 [inline]
 slab_alloc_node mm/slub.c:4830 [inline]
 kmem_cache_alloc_noprof+0x223/0x3d0 mm/slub.c:4837
 __kernfs_new_node+0x15c/0x7a0 fs/kernfs/dir.c:637
 kernfs_new_node+0x158/0x270 fs/kernfs/dir.c:718
 __kernfs_create_file+0x50/0x270 fs/kernfs/file.c:1057
 sysfs_add_file_mode_ns+0x1bd/0x250 fs/sysfs/file.c:313
 sysfs_merge_group+0x17c/0x310 fs/sysfs/group.c:382
 dpm_sysfs_add+0xd7/0x270 drivers/base/power/sysfs.c:704
 device_add+0x548/0xba0 drivers/base/core.c:3649
 snd_register_device+0x3db/0x560 sound/core/sound.c:278
 snd_ctl_dev_register+0x79/0x180 sound/core/control.c:2296
 __snd_device_register sound/core/device.c:149 [inline]
 snd_device_register_all+0xd1/0x1a0 sound/core/device.c:197

Memory state around the buggy address:
 ffff888057024480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888057024500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888057024580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff888057024600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888057024680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>

