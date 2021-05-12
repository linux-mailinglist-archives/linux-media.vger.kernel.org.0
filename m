Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC78337C67F
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 17:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234177AbhELPvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 11:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhELPlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 11:41:05 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD100C0611B8;
        Wed, 12 May 2021 08:18:59 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id b21so11648627pft.10;
        Wed, 12 May 2021 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=a6yni3wO/CDK9/OPIkBzIDQnVsSJgamlGmLbl5o+phI=;
        b=JY5FLWkT3Dcyau3tunzWkrbXvM0JQMMUsGM5XTXnHJXF1EBvnhjffXkY2T6zH+C4UX
         wCfy3r/lWzw4nPKLjlE8myGIfCUKFWKESEDFJIeT7XcfIt9BFdvWqLNA9I0o8gbA116q
         qFXMAOEpXXW4nX62eH9UScBfKDApFDZgwPb4R1siBRie6KKVNcB/hw6ufSsOeTt+RKP3
         i88X5fF41Oy74bj98TqzFjN/wfk8cP+Wu31UgOwvIF2uOeW+PZLvt5+7ZjOm8Q3fowuQ
         AuiaBfWI7fY8I5F2leuGW5tL9AKo1z+5l15dJf9ddR4AqG3XkMYr9VxAOPmXVDHfTzFf
         Rngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=a6yni3wO/CDK9/OPIkBzIDQnVsSJgamlGmLbl5o+phI=;
        b=KYl8iGIx1gdyH8u8251hpd06s+RJIoYUAiyskmEYXxy4h8p11QQU3U6/nIqRQQBNIW
         I5CCKEq2N2C4lKllCNW/7/8hEHrDWSN5z9oFhWdZHATasBrul10mPYFSH/ZGxRfqFmOP
         HGdH0Inf6dxYQCoMi/btWaswpSOTUMF0YOr7XLmPsEMSFF2KmkfQR8xUjnYJLz8/i3lr
         BZvmopLnh1FIMs8f3GPfUJCl0XKfQhDoxSssrY23CoE2NDd4hACOXhuassSd2sM1sIU4
         ocA6YD+KQJion6oQ0xYHzv4ekEFBoon3w1olrTCNlOTQYilRfXLtFPf9TMwCaxZK6AIv
         d6CA==
X-Gm-Message-State: AOAM5306RmyBrJQZdhUojp2cOZHOf0oPV+xnAcWbu0CaxM/mPKlFS8Ib
        En5wpx59EFnASV2QRiYV+g==
X-Google-Smtp-Source: ABdhPJzepVE5kbSE8vmoRD0QugGE+S9C+e7/rhBMoLyoSHwKPl6nviBcXX6DLLXjaQpUARYXbekERA==
X-Received: by 2002:aa7:8198:0:b029:274:8a92:51b5 with SMTP id g24-20020aa781980000b02902748a9251b5mr36404964pfi.5.1620832739374;
        Wed, 12 May 2021 08:18:59 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
        by smtp.gmail.com with ESMTPSA id e3sm134018pjd.18.2021.05.12.08.18.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 08:18:59 -0700 (PDT)
From:   Zheyu Ma <zheyuma97@gmail.com>
To:     mchehab@kernel.org
Cc:     akpm@linux-foundation.org, rppt@kernel.org, zheyuma97@gmail.com,
        christophe.jaillet@wanadoo.fr, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: bt8xx: Fix a missing check bug in bt878_probe
Date:   Wed, 12 May 2021 15:18:36 +0000
Message-Id: <1620832716-24253-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In 'bt878_irq', the driver calls 'tasklet_schedule', but this tasklet is
set in 'dvb_bt8xx_load_card' of another driver 'dvb-bt8xx'.
However, this two drivers are separate. The user may not load the
'dvb-bt8xx' driver when loading the 'bt8xx' driver, that is, the tasklet
has not been initialized when 'tasklet_schedule' is called, so it is
necessary to check whether the tasklet is initialized in 'bt878_probe'.

Fix this by adding a check at the end of bt878_probe.

The KASAN's report reveals it:

BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
PGD 800000006aab2067 P4D 800000006aab2067 PUD 6b2ea067 PMD 0
Oops: 0010 [#1] PREEMPT SMP KASAN PTI
CPU: 2 PID: 8724 Comm: syz-executor.0 Not tainted 4.19.177-
gdba4159c14ef-dirty #40
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-
gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:          (null)
Code: Bad RIP value.
RSP: 0018:ffff88806c287ea0 EFLAGS: 00010246
RAX: fffffbfff1b01774 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 1ffffffff1b01775 RDI: 0000000000000000
RBP: ffff88806c287f00 R08: fffffbfff1b01774 R09: fffffbfff1b01774
R10: 0000000000000001 R11: fffffbfff1b01773 R12: 0000000000000000
R13: ffff88806c29f530 R14: ffffffff8d80bb88 R15: ffffffff8d80bb90
FS:  00007f6b550e6700(0000) GS:ffff88806c280000(0000) knlGS:
0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000005ec98000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 tasklet_action_common.isra.17+0x141/0x420 kernel/softirq.c:522
 tasklet_action+0x50/0x70 kernel/softirq.c:540
 __do_softirq+0x224/0x92c kernel/softirq.c:292
 invoke_softirq kernel/softirq.c:372 [inline]
 irq_exit+0x15a/0x180 kernel/softirq.c:412
 exiting_irq arch/x86/include/asm/apic.h:535 [inline]
 do_IRQ+0x123/0x1e0 arch/x86/kernel/irq.c:260
 common_interrupt+0xf/0xf arch/x86/entry/entry_64.S:670
 </IRQ>
RIP: 0010:__do_sys_interrupt kernel/sys.c:2593 [inline]
RIP: 0010:__se_sys_interrupt kernel/sys.c:2584 [inline]
RIP: 0010:__x64_sys_interrupt+0x5b/0x80 kernel/sys.c:2584
Code: ba 00 04 00 00 48 c7 c7 c0 99 31 8c e8 ae 76 5e 01 48 85 c0 75 21 e8
14 ae 24 00 48 c7 c3 c0 99 31 8c b8 0c 00 00 00 0f 01 c1 <31> db e8 fe ad
24 00 48 89 d8 5b 5d c3 48 c7 c3 ea ff ff ff eb ec
RSP: 0018:ffff888054167f10 EFLAGS: 00000212 ORIG_RAX: ffffffffffffffde
RAX: 000000000000000c RBX: ffffffff8c3199c0 RCX: ffffc90001ca6000
RDX: 000000000000001a RSI: ffffffff813478fc RDI: ffffffff8c319dc0
RBP: ffff888054167f18 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000080 R11: fffffbfff18633b7 R12: ffff888054167f58
R13: ffff88805f638000 R14: 0000000000000000 R15: 0000000000000000
 do_syscall_64+0xb0/0x4e0 arch/x86/entry/common.c:293
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4692a9
Code: f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 48 89 f8 48 89 f7
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6b550e5c48 EFLAGS: 00000246 ORIG_RAX: 000000000000014f
RAX: ffffffffffffffda RBX: 000000000077bf60 RCX: 00000000004692a9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000020000140
RBP: 00000000004cf7eb R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000077bf60
R13: 0000000000000000 R14: 000000000077bf60 R15: 00007fff55a1dca0
Modules linked in:
Dumping ftrace buffer:
   (ftrace buffer empty)
CR2: 0000000000000000
---[ end trace 68e5849c3f77cbb6 ]---
RIP: 0010:          (null)
Code: Bad RIP value.
RSP: 0018:ffff88806c287ea0 EFLAGS: 00010246
RAX: fffffbfff1b01774 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 1ffffffff1b01775 RDI: 0000000000000000
RBP: ffff88806c287f00 R08: fffffbfff1b01774 R09: fffffbfff1b01774
R10: 0000000000000001 R11: fffffbfff1b01773 R12: 0000000000000000
R13: ffff88806c29f530 R14: ffffffff8d80bb88 R15: ffffffff8d80bb90
FS:  00007f6b550e6700(0000) GS:ffff88806c280000(0000) knlGS:
0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000005ec98000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/media/pci/bt8xx/bt878.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 78dd35c9b65d..db35bc319bc6 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -477,6 +477,9 @@ static int bt878_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	btwrite(0, BT878_AINT_MASK);
 	bt878_num++;
 
+	if (!bt->tasklet.func)
+		tasklet_disable(&bt->tasklet);
+
 	return 0;
 
       fail2:
-- 
2.17.1

