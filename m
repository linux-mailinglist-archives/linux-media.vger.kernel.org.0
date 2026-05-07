Return-Path: <linux-media+bounces-60883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEHVL8sh/WmGYAAAu9opvQ
	(envelope-from <linux-media+bounces-60883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:35:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8C4F025D
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 01:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98F443047755
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 23:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88375372691;
	Thu,  7 May 2026 23:35:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FEC34F27B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 23:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196924; cv=none; b=QdMvUb1wdo2wHu7cNU/kmZsg6wGrwSzhsTK2QQIJcBeh39puXChJqWCszF5Rww74rf88UspzXNY0rz6QuHL30AA6QoC4qucraOi4ToxIwj0Gl7glDk8VL5ZMAPxj9TFMLWr9RpRPzP9R9lx7IFBoUSZ/rv+xmHPnaJR0q2+IJLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196924; c=relaxed/simple;
	bh=0jcXSgK9EzbfmTGwMq5P+fViuFcffSQgIB4fQNAs8q4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qhzVPzXGioZ1woVQRgZ+MSGDnEzGIER+hisnM8NkOt3t1ArRs2stH3OICYc3i72daGpH2Kia9t81r3TD/h+C1lk3Lbc2hP5Vt8RwQv0UWbg1/rY1RBqJONB6OMVK6HZ6vDYatatlVdMNCLvoSXfpKaQUW+zGDJOxJlQTwJMEzkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-6963482e03dso1919137eaf.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 16:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196922; x=1778801722;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTkF5cAciGoUUa9iLMmC3lX7goyt44Nm5xF/oDm9lMk=;
        b=NZxpo+MXk0bDHLxNzxD0HjrPbHyrvbv8Ecf35as6ltT04wknpDyA95+6j8Gzp19ev8
         R2TinI8dOXtVqYSnoZhEe7PmI4NoMLA9C+/uisD6L6arK4MDRFlEnjSmeKQz2GJYR6JY
         Eidv0aQlT++MmCIOdWUL+N2vl+05qw3tcAsjYCFFtt8oQnNKTkldRmzzRXecFm3zWTn/
         L5Dixtk1Ic2X+rXEzCvh1mrr2wta+poDoX2ZiXavWd4PLXol23FZbmBREBpzqn8EBEDM
         v/UzT2af/iCI9y00nefsMepyWkiM9GM33V76EPmq7cUG+VEPjyNVC6PyaZ6ltL3w6K24
         Zigw==
X-Forwarded-Encrypted: i=1; AFNElJ+iTZZuJ4FPrODsjqLUs/V9vIS1LfXZVg9+qqxbe+GBVv57aBKO5sc/FpnyHDSLc18egGA8l6CPcOg1mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8x4B9t+3wH+9eqakmtmPwtQXjJgrS1eu4XF+Ub+sCuNRhRYDk
	xV8LG0ukOTZ0WiRIuj0AaBwPu0YnHhYCNld6kXfxgLexjp0hUpSVHHyYQhWtcJQKnnyUtuXv+Zv
	4pP4ZYiTTg7r4Zkk7gWLac6p+VXtA3QbnxE3cy4LzBaQuZtMkq6fJjKWHSVg=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d05:b0:696:7d51:79dd with SMTP id
 006d021491bc7-69998d175eamr5444927eaf.28.1778196921815; Thu, 07 May 2026
 16:35:21 -0700 (PDT)
Date: Thu, 07 May 2026 16:35:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69fd21b9.050a0220.3cf765.0360.GAE@google.com>
Subject: [syzbot] [dri?] [media?] WARNING in dma_resv_add_fence
From: syzbot <syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3BF8C4F025D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=59da38148f3a3d24];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60883-lists,linux-media=lfdr.de,72bd3dd3a5d5f39a0271];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,googlegroups.com:email,goo.gl:url,storage.googleapis.com:url,syzkaller.appspot.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    fcee7d82f27d Merge tag 'net-7.1-rc3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1107ddba580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59da38148f3a3d24
dashboard link: https://syzkaller.appspot.com/bug?extid=72bd3dd3a5d5f39a0271
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13dfca73980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1599bb26580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-fcee7d82.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a5dee9aef2ac/vmlinux-fcee7d82.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7b1a8dd09a15/bzImage-fcee7d82.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+72bd3dd3a5d5f39a0271@syzkaller.appspotmail.com

R13: 00007f7755215fac R14: 00007f7755215fa0 R15: 00007f7755215fa0
 </TASK>
------------[ cut here ]------------
debug_locks && !(lock_is_held(&(&(obj)->lock.base)->dep_map) != 0)
WARNING: drivers/dma-buf/dma-resv.c:296 at dma_resv_add_fence+0x71e/0x840 drivers/dma-buf/dma-resv.c:296, CPU#2: syz.0.17/5919
Modules linked in:
CPU: 2 UID: 0 PID: 5919 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:dma_resv_add_fence+0x71e/0x840 drivers/dma-buf/dma-resv.c:296
Code: 44 24 08 be ff ff ff ff 48 8d 78 60 e8 db 3b 33 05 31 ff 89 c3 89 c6 e8 e0 58 b1 fb 85 db 0f 85 26 fa ff ff e8 23 5e b1 fb 90 <0f> 0b 90 e9 18 fa ff ff e8 15 5e b1 fb be 03 00 00 00 4c 89 e7 e8
RSP: 0018:ffffc9000448f168 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff865734f0
RDX: ffff8880261ea500 RSI: ffffffff865734fd RDI: ffff8880261ea500
RBP: ffff88802d439f70 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff88802d439f00
R13: ffff88802d439f00 R14: 1ffff92000891e39 R15: ffff88802853e800
FS:  00005555690ac500(0000) GS:ffff8880d6572000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32a63fff CR3: 000000003fb78000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 virtio_gpu_array_add_fence+0xcd/0x140 drivers/gpu/drm/virtio/virtgpu_gem.c:257
 virtio_gpu_queue_ctrl_sgs drivers/gpu/drm/virtio/virtgpu_vq.c:410 [inline]
 virtio_gpu_queue_fenced_ctrl_buffer+0x578/0xfb0 drivers/gpu/drm/virtio/virtgpu_vq.c:500
 virtio_gpu_cursor_plane_update+0x411/0xbc0 drivers/gpu/drm/virtio/virtgpu_plane.c:463
 drm_atomic_helper_commit_planes+0x497/0xf10 drivers/gpu/drm/drm_atomic_helper.c:3038
 drm_atomic_helper_commit_tail+0x7f/0x130 drivers/gpu/drm/drm_atomic_helper.c:1989
 commit_tail+0x338/0x430 drivers/gpu/drm/drm_atomic_helper.c:2074
 drm_atomic_helper_commit+0x303/0x380 drivers/gpu/drm/drm_atomic_helper.c:2312
 drm_atomic_commit+0x230/0x300 drivers/gpu/drm/drm_atomic.c:1789
 drm_atomic_helper_update_plane+0x314/0x400 drivers/gpu/drm/drm_atomic_helper.c:3438
 __setplane_atomic+0x22d/0x350 drivers/gpu/drm/drm_plane.c:1101
 drm_mode_cursor_universal+0x5e9/0xe20 drivers/gpu/drm/drm_plane.c:1256
 drm_mode_cursor_common+0x308/0x970 drivers/gpu/drm/drm_plane.c:1315
 drm_mode_cursor_ioctl+0xd4/0x110 drivers/gpu/drm/drm_plane.c:1365
 drm_ioctl_kernel+0x1f3/0x3e0 drivers/gpu/drm/drm_ioctl.c:804
 drm_ioctl+0x5e6/0xc60 drivers/gpu/drm/drm_ioctl.c:901
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x10b/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7754f9cdd9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd0c03a0b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f7755215fa0 RCX: 00007f7754f9cdd9
RDX: 0000200000000100 RSI: 00000000c01c64a3 RDI: 0000000000000003
RBP: 00007ffd0c03a120 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007f7755215fac R14: 00007f7755215fa0 R15: 00007f7755215fa0
 </TASK>


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

