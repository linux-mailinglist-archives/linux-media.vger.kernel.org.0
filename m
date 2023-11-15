Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55FE7E3165
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 00:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbjKFX2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 18:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbjKFX2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 18:28:11 -0500
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0877547B9
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 15:25:22 -0800 (PST)
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-58787094359so4378537eaf.2
        for <linux-media@vger.kernel.org>; Mon, 06 Nov 2023 15:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699313122; x=1699917922;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tIuCoytmVadRySr33DQZ5/TwXBcyTI+qOt/uxCcdew=;
        b=j+tzUdkEBA7cPWHC/R7ecUHR8/DSFlvSsCMe5wV5HDYqg2vHCN/CHLmhZgyadARs4M
         T2w0I9Tx9BpRG9kSU3pbItCMYwHF8H+LhAmBmvlexLpTbZACIiywewU+Le2+wSMnd/lH
         +f8xkdlZ/uzKsERzmawqP77GcAweNtzN0on/4pQx1+V8XRkPMsYOUi3w88taapXKCuwS
         8a9iDce3MRjE6z7Nd34yIPYOEfIsqjldRRWM/3UxXylJvlSSCZ+nEJTShP9DBSbElpg6
         hMSQ/NJB6tiLCC7M1VtJB6F6Xk6wrjwAEeNdCZM3IIxMaMLNf70zzMbiJHOU7ZTLZgoB
         DKOQ==
X-Gm-Message-State: AOJu0YxtiCmsTYj31Xa8uHCppvmicVLLVEt4/JBghLG29RnSDq6eZwoi
        T21f2Bu9dUxSY1sD0iXEzzb0KAvpviZaGs33n2yQ3RBt4Xay
X-Google-Smtp-Source: AGHT+IGZnbMG2wIjxKhbru5Ov2b3CCz3h1LseB0sEh5MBxu3ykMqYgKg6klDliWZX6650SH3AnLqNCoNgwsFj+QnIVQ6y8i/RZKz
MIME-Version: 1.0
X-Received: by 2002:a05:6871:5d4:b0:1e9:9dda:12d with SMTP id
 v20-20020a05687105d400b001e99dda012dmr519982oan.2.1699313122401; Mon, 06 Nov
 2023 15:25:22 -0800 (PST)
Date:   Mon, 06 Nov 2023 15:25:22 -0800
In-Reply-To: <0000000000002a4da90603a5cbbf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000005e40d0609842b6d@google.com>
Subject: Re: [syzbot] [dri?] kernel BUG in vmf_insert_pfn_prot (2)
From:   syzbot <syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com>
To:     airlied@gmail.com, christian.koenig@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, hdanton@sina.com,
        linaro-mm-sig-bounces@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    d2f51b3516da Merge tag 'rtc-6.7' of git://git.kernel.org/p..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1422ebef680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ffa1cec3b40f3ce
dashboard link: https://syzkaller.appspot.com/bug?extid=398e17b61dab22cc56bc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16344918e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=156bb2c0e80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/01a7f380fc8d/disk-d2f51b35.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c2fe46c74542/vmlinux-d2f51b35.xz
kernel image: https://storage.googleapis.com/syzbot-assets/247d6a0567c5/bzImage-d2f51b35.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at mm/memory.c:2216!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 5067 Comm: syz-executor340 Not tainted 6.6.0-syzkaller-14651-gd2f51b3516da #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/09/2023
RIP: 0010:vmf_insert_pfn_prot+0x247/0x430 mm/memory.c:2216
Code: 0f 0b e8 7c e6 bd ff 49 89 ef bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 f8 e1 bd ff 49 83 ff 20 0f 85 aa fe ff ff e8 59 e6 bd ff <0f> 0b 48 bd ff ff ff ff ff ff 0f 00 e8 48 e6 bd ff 4c 89 f6 48 89
RSP: 0018:ffffc90003bbf758 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88802847ec00 RCX: ffffffff81cab618
RDX: ffff888015bd1dc0 RSI: ffffffff81cab627 RDI: 0000000000000007
RBP: 000000000c040474 R08: 0000000000000007 R09: 0000000000000020
R10: 0000000000000020 R11: 0000000000000009 R12: 0000000020ffd000
R13: 1ffff92000777eec R14: 000000000001e529 R15: 0000000000000020
FS:  0000555555e2a480(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020ffd000 CR3: 000000002aae7000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_gem_shmem_fault+0x207/0x400 drivers/gpu/drm/drm_gem_shmem_helper.c:531
 __do_fault+0x107/0x5f0 mm/memory.c:4265
 do_read_fault mm/memory.c:4628 [inline]
 do_fault mm/memory.c:4762 [inline]
 do_pte_missing mm/memory.c:3730 [inline]
 handle_pte_fault mm/memory.c:5038 [inline]
 __handle_mm_fault+0x2682/0x3d60 mm/memory.c:5179
 handle_mm_fault+0x478/0xa00 mm/memory.c:5344
 do_user_addr_fault+0x3d1/0x1000 arch/x86/mm/fault.c:1413
 handle_page_fault arch/x86/mm/fault.c:1505 [inline]
 exc_page_fault+0x5c/0xd0 arch/x86/mm/fault.c:1561
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
RIP: 0010:rep_movs_alternative+0x4a/0x70 arch/x86/lib/copy_user_64.S:71
Code: 75 f1 c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 8b 06 48 89 07 48 83 c6 08 48 83 c7 08 83 e9 08 74 df 83 f9 08 73 e8 eb c9 <f3> a4 c3 48 89 c8 48 c1 e9 03 83 e0 07 f3 48 a5 89 c1 85 c9 75 b3
RSP: 0018:ffffc90003bbfb50 EFLAGS: 00050206
RAX: 0000000000000001 RBX: 0000000020ffd000 RCX: 0000000000001000
RDX: 0000000000000000 RSI: 0000000020ffd000 RDI: ffff888018796000
RBP: 0000000000001000 R08: 0000000000000001 R09: ffffed10030f2dff
R10: ffff888018796fff R11: 0000000000000000 R12: 0000000020ffe000
R13: ffff888018796000 R14: 0000000000000000 R15: 0000000020ffd000
 copy_user_generic arch/x86/include/asm/uaccess_64.h:112 [inline]
 raw_copy_from_user arch/x86/include/asm/uaccess_64.h:127 [inline]
 _copy_from_user+0xc2/0xf0 lib/usercopy.c:23
 copy_from_user include/linux/uaccess.h:183 [inline]
 snd_rawmidi_kernel_write1+0x360/0x860 sound/core/rawmidi.c:1618
 snd_rawmidi_write+0x26e/0xc00 sound/core/rawmidi.c:1687
 vfs_write+0x2a4/0xdf0 fs/read_write.c:582
 ksys_write+0x1f0/0x250 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x3f/0x110 arch/x86/entry/common.c:82
 entry_SYSCALL_64_after_hwframe+0x63/0x6b
RIP: 0033:0x7f31add88d69
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdd9a49ee8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007ffdd9a49f00 RCX: 00007f31add88d69
RDX: 00000000fffffd2c RSI: 0000000020000000 RDI: 0000000000000004
RBP: 00007ffdd9a49f08 R08: 0000000000000000 R09: 0000000000000000
R10: 00007ffdd9a49f08 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffdd9a4a168 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vmf_insert_pfn_prot+0x247/0x430 mm/memory.c:2216
Code: 0f 0b e8 7c e6 bd ff 49 89 ef bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 f8 e1 bd ff 49 83 ff 20 0f 85 aa fe ff ff e8 59 e6 bd ff <0f> 0b 48 bd ff ff ff ff ff ff 0f 00 e8 48 e6 bd ff 4c 89 f6 48 89
RSP: 0018:ffffc90003bbf758 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88802847ec00 RCX: ffffffff81cab618
RDX: ffff888015bd1dc0 RSI: ffffffff81cab627 RDI: 0000000000000007
RBP: 000000000c040474 R08: 0000000000000007 R09: 0000000000000020
R10: 0000000000000020 R11: 0000000000000009 R12: 0000000020ffd000
R13: 1ffff92000777eec R14: 000000000001e529 R15: 0000000000000020
FS:  0000555555e2a480(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020acb000 CR3: 000000002aae7000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	75 f1                	jne    0xfffffff3
   2:	c3                   	ret
   3:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
   a:	00 00 00 00
   e:	66 90                	xchg   %ax,%ax
  10:	48 8b 06             	mov    (%rsi),%rax
  13:	48 89 07             	mov    %rax,(%rdi)
  16:	48 83 c6 08          	add    $0x8,%rsi
  1a:	48 83 c7 08          	add    $0x8,%rdi
  1e:	83 e9 08             	sub    $0x8,%ecx
  21:	74 df                	je     0x2
  23:	83 f9 08             	cmp    $0x8,%ecx
  26:	73 e8                	jae    0x10
  28:	eb c9                	jmp    0xfffffff3
* 2a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi) <-- trapping instruction
  2c:	c3                   	ret
  2d:	48 89 c8             	mov    %rcx,%rax
  30:	48 c1 e9 03          	shr    $0x3,%rcx
  34:	83 e0 07             	and    $0x7,%eax
  37:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  3a:	89 c1                	mov    %eax,%ecx
  3c:	85 c9                	test   %ecx,%ecx
  3e:	75 b3                	jne    0xfffffff3


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
