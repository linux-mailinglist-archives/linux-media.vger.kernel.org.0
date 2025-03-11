Return-Path: <linux-media+bounces-27997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7EA5B9B5
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 08:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58CA21893DCD
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 07:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8412222AD;
	Tue, 11 Mar 2025 07:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="yDCuOJez"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC31EDA03;
	Tue, 11 Mar 2025 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741677934; cv=none; b=jNp7eJ8DvBxQfZ1OAKQfuq/zl5zFxSE7qSADk80jv6/oby8Hs/pRhP1S7MnbKb3CqPPYpHo+iJf3vRxrpD/rcaheDskakimH4qB9Fm7VTPtLFUyNqza1n6mc3t5cU3KVK8xkb+sM3LehN19oRnQ0MO1V7u/CDpd0s43E4EVGbE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741677934; c=relaxed/simple;
	bh=P7HYlmtZE81obGpsbL9pVBZwUJbbMn6JT5jWFUHPSPY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=gFgm7IiFKRwjdFe+Q4k+H1hTMl6pljhUAtKcFyy6eDOfDn7JW+/XpfBz44vEmGqDlhmTqQ7EKXJ56Ne+OJA0B1CmW0TAzBxQ4APeUgJEw5HgG/4SfuaIqFEUUVjVD5i0H7hBy+Ty1BvdVddIZAJbopAU2tBwTA/NB/g+rPLe2/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=yDCuOJez; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1741677616; bh=d9+2oX9Th/3/xgHPYEGkNk69EloougLjZ+ArC3bUnT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yDCuOJezdJmVOPgs6Xpf/7hUG+5z+xOn+jvENE8Yzt7vchMt7qp+aNmj4AmI1jFr1
	 Y1L6etRbdE0zbLfXs0ZbZr3TApqv7IvXdisxemO6V8czkDhnzff/Uo9Je+ZmtOvKXO
	 iSuIu74vO2kzcYAvwmS28uCqWbF1ZOU2ynXJO3Ps=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 50DB0EAF; Tue, 11 Mar 2025 15:20:13 +0800
X-QQ-mid: xmsmtpt1741677613t1ff26inv
Message-ID: <tencent_682C75C376DD66D03C713710966A37E84A09@qq.com>
X-QQ-XMAILINFO: Oc+6xGkERBk5YDe3Nkkj7Vf2BUr2WM552AP7hHL6kZzXlQievidRzfPlfJ13gS
	 ZREGuaXbUss8daQY2tHkIAOLbOBmpAbRqTdw5+24O6D/G5nVDNhPnWs/RM3ecT84P0/pcRb4wsDU
	 S0D8pIgFLER7KHM++9oZbXIizhC6CiXAku3P4X8o5ry4Ps+mJqaqhckiL3ETmJVvEiP6jiIwJUWU
	 DWtiDWx19bdgN1t3r+ITjW//pGeBziTSMcYsGqHNZjfWw8lON1C+ZyIo/OB7Zqky+An5+4tiqNGA
	 Xcg5zayP0Xk40UsO7h/zqDIBMLz9JabHoA1LVXkG1/Fvyd7vDdbineKj97iHkzgZMWrYMNpTU7E7
	 93MLSVCxQK1M1Qy5jsNyIRax+S70cMR0n5yEEZEA47lQwI2oXwvdND78mrK7wNO3i0BCSfHvyKiO
	 2sbDR1w+3deoGKMtAyKomLxdOMnwPB6G/edlYOW+innZX684TkdgWC6jANu0e54DwI4xdJMXHHMR
	 95MgrVwIFwGesjjTwtEuBd5NJM+5umOxQEfxAv1IfMYmGBcWu+LaxkjEyga8bZlwpJlrHSJ0KAGa
	 b4ff+H5Ob+dsfGEDTHWd1pcQBPi6dFz3Ya5UwykEG8vgaKlJDTGOZxDOGPQMKy9jYRxb71Y+yBLn
	 1/mZVug1dcYFj627Z5dPylyNqcn+NVCKtlLgEEC2WGHn0jsMnCoJR3Mz3PLW/gn5WCfqL4DROG8Z
	 f01vhsAE/zDI+sGTKxNsn767Qm97oR4WOHK8Qww72iXz8Ew304aXibo8SW9oAaQPzocWpp6r0ZMw
	 xCcN81ikAmF1P7Kq6yu6pBdLOJmyKe6JPGPY/gKqaDowpfp4TJltlV1Z5gIqsGs3/VUY/pka5I2l
	 8IgfYAzRsKYYmUitCaqlZUP+MGIW28gIC5gE7jSUVL/tx/XcYemo8=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0d33ab192bd50b6c91e6@syzkaller.appspotmail.com
Cc: dwlsalmeida@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V3] media: vidtv: Terminating the subsequent process of initialization failure
Date: Tue, 11 Mar 2025 15:20:14 +0800
X-OQ-MSGID: <20250311072013.3858217-2-eadavis@qq.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <67cee9e2.050a0220.1939a6.0004.GAE@google.com>
References: <67cee9e2.050a0220.1939a6.0004.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a slab-use-after-free Read in vidtv_mux_init. [1]

After PSI initialization fails, the si member is accessed again, resulting
in this uaf.

After si initialization fails, the subsequent process needs to be exited.

[1]
BUG: KASAN: slab-use-after-free in vidtv_mux_pid_ctx_init drivers/media/test-drivers/vidtv/vidtv_mux.c:78 [inline]
BUG: KASAN: slab-use-after-free in vidtv_mux_init+0xac2/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:524
Read of size 8 at addr ffff88802fa42acc by task syz.2.37/6059

CPU: 0 UID: 0 PID: 6059 Comm: syz.2.37 Not tainted 6.14.0-rc5-syzkaller #0
Hardware name: Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
<TASK>
__dump_stack lib/dump_stack.c:94 [inline]
dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
print_address_description mm/kasan/report.c:408 [inline]
print_report+0xc3/0x670 mm/kasan/report.c:521
kasan_report+0xd9/0x110 mm/kasan/report.c:634
vidtv_mux_pid_ctx_init drivers/media/test-drivers/vidtv/vidtv_mux.c:78
vidtv_mux_init+0xac2/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:524
vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194
vidtv_start_feed drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
dmx_section_feed_start_filtering drivers/media/dvb-core/dvb_demux.c:973
dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
dvb_dmxdev_feed_restart.isra.0 drivers/media/dvb-core/dmxdev.c:537
dvb_dmxdev_filter_stop+0x2b4/0x3a0 drivers/media/dvb-core/dmxdev.c:564
dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
__fput+0x3ff/0xb70 fs/file_table.c:464
task_work_run+0x14e/0x250 kernel/task_work.c:227
exit_task_work include/linux/task_work.h:40 [inline]
do_exit+0xad8/0x2d70 kernel/exit.c:938
do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
__do_sys_exit_group kernel/exit.c:1098 [inline]
__se_sys_exit_group kernel/exit.c:1096 [inline]
__x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
x64_sys_call+0x151f/0x1720 arch/x86/include/generated/asm/syscalls_64.h:232
do_syscall_x64 arch/x86/entry/common.c:52 [inline]
do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f871d58d169
Code: Unable to access opcode bytes at 0x7f871d58d13f.
RSP: 002b:00007fff4b19a788 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f871d58d169
RDX: 0000000000000064 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 00007fff4b19a7ec R08: 0000000b4b19a87f R09: 00000000000927c0
R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000003
R13: 00000000000927c0 R14: 000000000001d553 R15: 00007fff4b19a840
 </TASK>

Allocated by task 6059:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 vidtv_psi_pat_table_init drivers/media/test-drivers/vidtv/vidtv_psi.c:970
 vidtv_channel_si_init drivers/media/test-drivers/vidtv/vidtv_channel.c:423
 vidtv_mux_init drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194
 vidtv_start_feed drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0 drivers/media/dvb-core/dmxdev.c:537
 dvb_dmxdev_filter_stop+0x2b4/0x3a0 drivers/media/dvb-core/dmxdev.c:564
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x3ff/0xb70 fs/file_table.c:464
 task_work_run+0x14e/0x250 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xad8/0x2d70 kernel/exit.c:938
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 __do_sys_exit_group kernel/exit.c:1098 [inline]
 __se_sys_exit_group kernel/exit.c:1096 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
 x64_sys_call arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6059:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4609 [inline]
 kfree+0x2c4/0x4d0 mm/slub.c:4757
 vidtv_channel_si_init drivers/media/test-drivers/vidtv/vidtv_channel.c:499
 vidtv_mux_init drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194
 vidtv_start_feed drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0 drivers/media/dvb-core/dmxdev.c:537
 dvb_dmxdev_filter_stop+0x2b4/0x3a0 drivers/media/dvb-core/dmxdev.c:564
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x3ff/0xb70 fs/file_table.c:464
 task_work_run+0x14e/0x250 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0xad8/0x2d70 kernel/exit.c:938
 do_group_exit+0xd3/0x2a0 kernel/exit.c:1087
 __do_sys_exit_group kernel/exit.c:1098 [inline]
 __se_sys_exit_group kernel/exit.c:1096 [inline]
 __x64_sys_exit_group+0x3e/0x50 kernel/exit.c:1096
 x64_sys_call arch/x86/include/generated/asm/syscalls_64.h:232
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: 3be8037960bc ("media: vidtv: add error checks")
Reported-by: syzbot+0d33ab192bd50b6c91e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0d33ab192bd50b6c91e6
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: replace with media: in subject
V2 -> V3: reduce the line length of the comments

 drivers/media/test-drivers/vidtv/vidtv_channel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 7838e6272712..f3023e91b3eb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -497,7 +497,7 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 	vidtv_psi_sdt_table_destroy(m->si.sdt);
 free_pat:
 	vidtv_psi_pat_table_destroy(m->si.pat);
-	return 0;
+	return -EINVAL;
 }
 
 void vidtv_channel_si_destroy(struct vidtv_mux *m)
-- 
2.43.0


