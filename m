Return-Path: <linux-media+bounces-27989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7AAA5B751
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 04:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B745E7A3DCB
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 03:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804831E9B29;
	Tue, 11 Mar 2025 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="lJYW3HAB"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF3F9D6;
	Tue, 11 Mar 2025 03:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741664394; cv=none; b=SyLzg5oZNvgfNxgVK0oaZ9chEL62BywdCMFjgBgDjkQlsCIszZ8rigDc6G//jKmXLRqpUPJY7cEFAzQ5sXTT8mFRku1c7YNxwwrhGjSMokVmyAKWPoSOrV445SwDlL5+f19vggQzULZpdS75modNqdhmanZpq/x3VTAUEiRyyLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741664394; c=relaxed/simple;
	bh=bf1un8YCcaJ+MJ/mJNgUmyskR8wA8Z/Ct3ZtI+OuKCA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=jA3ODu6mic2zEgqGcGtQ3Vr1OXsyC3iCb9TWYe/wYz9cPfecr/33WErl5mE6ByqLoMBevjuMpyDzN0nujYrWcctIISv0mNfd1EzPqWoK8nTtG3V3TAnEzpm6mEEsbtPF0v+SGjG3u2ZBi6M6oFuSHmhL0Zhs7u3uWnh2GFi0Keo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=lJYW3HAB; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1741664085; bh=hVM2M5MvJmnwT5u9Fw0gKWjpnaMyGGlte8kaz+9l+E8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lJYW3HABg0KkGqx0BuQ+ZJwkitSVGra1DvPB1u6APPPC4OwGNMS+tOjc0chh+O/k0
	 zcBOA1Zs6WBOmod5R7R6GdzPsYUrWf4/MOwDFq3PXlxUTanUxbsllLzTsYLuVBq16h
	 ed0TgZOJtdxBUWbjvAQZ5461TU5TNmQmgqsIIkhA=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 8AB00AA2; Tue, 11 Mar 2025 11:34:43 +0800
X-QQ-mid: xmsmtpt1741664083tgwzxw6b5
Message-ID: <tencent_196E3769E6DD9364436B296683A58453B705@qq.com>
X-QQ-XMAILINFO: NafziRg7Bx69XVsf7yO71/Z8fK6qdrGHMfY/sI5DumRhQFvCEHobWnI4bUzQ+E
	 d5mYxEAqHHHp4XzDFtKG9hec19iQ6uxcRH2TMbG/+9Dm1a67Uv8WbOn0cJk3HOVfSp7YdzWnvbWb
	 d6vtypamVAM2uB8PTq6uktv+kRXr6uyifiRjuO6876sozGDzCdj4mXo39Z2m69q/DVXZvwj0ahLu
	 pRoMVppc0+VuuZqcYPiPMrWLCMluY0XcpsmFdn5r9IyIiAg3E5F7yl55p9Q28pT1Fm1Jw6AiBJQD
	 GGncGfchemGfW4wHz6I+kTfga/T6wuvp4PFPPWexmYT2QpjH90ySrm1Po6CeVqqmt4p1mr4h8b19
	 nCoOVcOXOTlEVUvCfb3AVoUmd5wEuJySiyRM6JyEqwie18xu1XuvLfLTEKrK18nqWlv+/R4Z3D8f
	 d/53pZWVNxd4LrA1T0xbYIUm4ED+JTBfR68MnV78oKirCEIgLanu0VwehxpedMOJaKaRCl8DWZcs
	 daWnO6Pe0U8GvEAcV5edM1Ulu2s+5JcpgoEg7mB5HPNMMUwHwVfIrcJRympg1OuiZ8wK+I+ORLdU
	 /LovCLBG5mHbniwncYataf+X2fP7B+AoEewWnfxE5ioe570CuAJuxEMjBgA+E2oGCLf2HjVPXKn2
	 7LGOTCansFusMdBGqrKlr4BTsDIEF10W5i7ydq6QSbeni3mRL5iVc8le8EiFrs8sRryhCGso3S7d
	 pjJ2lBQfcruVF1erukqAc5+P+QKAEW9fLcrr/AflDdHaaktqD68poROto18sWDnQbXEAk6V3oBdL
	 fvgG8IywUkFZHa2GItbuC0FdXB7fx568P49ROXpERKh5y8FShSUqT5EUh7atywXUCxQqdluZhTLS
	 vlb2sjTL7zKv82rzYdqi3oV55yuYey3bEyAclwkp94oJETyjbDjMA=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0d33ab192bd50b6c91e6@syzkaller.appspotmail.com
Cc: dwlsalmeida@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH V2] media: vidtv: Terminating the subsequent process of initialization failure
Date: Tue, 11 Mar 2025 11:34:43 +0800
X-OQ-MSGID: <20250311033443.3635370-2-eadavis@qq.com>
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
Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xd9/0x110 mm/kasan/report.c:634
 vidtv_mux_pid_ctx_init drivers/media/test-drivers/vidtv/vidtv_mux.c:78 [inline]
 vidtv_mux_init+0xac2/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:524
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x334/0x4c0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering+0x3a5/0x660 drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0+0x457/0x530 drivers/media/dvb-core/dmxdev.c:537
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
 vidtv_psi_pat_table_init+0x46/0x2c0 drivers/media/test-drivers/vidtv/vidtv_psi.c:970
 vidtv_channel_si_init+0x67/0x1a90 drivers/media/test-drivers/vidtv/vidtv_channel.c:423
 vidtv_mux_init+0x526/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x334/0x4c0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering+0x3a5/0x660 drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0+0x457/0x530 drivers/media/dvb-core/dmxdev.c:537
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
 vidtv_channel_si_init+0x34a/0x1a90 drivers/media/test-drivers/vidtv/vidtv_channel.c:499
 vidtv_mux_init+0x526/0xbe0 drivers/media/test-drivers/vidtv/vidtv_mux.c:519
 vidtv_start_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:194 [inline]
 vidtv_start_feed+0x334/0x4c0 drivers/media/test-drivers/vidtv/vidtv_bridge.c:239
 dmx_section_feed_start_filtering+0x3a5/0x660 drivers/media/dvb-core/dvb_demux.c:973
 dvb_dmxdev_feed_start drivers/media/dvb-core/dmxdev.c:508 [inline]
 dvb_dmxdev_feed_restart.isra.0+0x457/0x530 drivers/media/dvb-core/dmxdev.c:537
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

Fixes: 3be8037960bc ("media: vidtv: add error checks")
Reported-by: syzbot+0d33ab192bd50b6c91e6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0d33ab192bd50b6c91e6
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: replace with media: in subject

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


