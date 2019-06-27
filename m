Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B47457E31
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 10:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfF0I1D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 04:27:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33414 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfF0I1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 04:27:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id m4so683257pgk.0;
        Thu, 27 Jun 2019 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hk90YfAA4csqYDfi4nGxg1orhrn3ZYGfEe/fuzX6mW8=;
        b=AZWPFIqiRhu5fw3NjBQYS0Koc8MTQZtodcagQ4uIw5yYxQevu0wEgVfaUEHggK+uRm
         wSzs/d85JW4fgDWB0hTA+r2SFiBPaRTefcDuqv+tx8LCZH2iny/Gqq+iI3iJ+WdJK7xO
         ZrRKlsrOwJBdwzrrJixpHAD3Oy/ewzHmnMp6mRGI7PMYwlNEW6947s4LYIGY67wfJdn9
         WZRSI6zML06QLBCgSVzJ5Y5fWBxMHM0fLgWd5mtm3eVJflrQFvRWgSSz4EjnBNiR9vRt
         HgoiW4EhOv/bef/RaY8rGwEfqZXYBjB1GBV8AAivYAxm+Z+QS4zpr2AgPfn1KTuY2/Wt
         Bu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hk90YfAA4csqYDfi4nGxg1orhrn3ZYGfEe/fuzX6mW8=;
        b=FmRtRsDfP20J2VspJHRedgGb4rasPXftwusUxp/mQ8LrrUWRSLW589dwGj2JmJs7YT
         NAT8lptAfbwaRIYssAXQ9kWWKUNt9Y/jcNts0TLEY/vbPkryhMorUdliX66a6kYTFvkL
         2F0/hCdKSRBK2ka2rTTSCh2cELoU8U9DbOkt4a2vivacDUdADW6h1gO4pwe36E80d2h4
         K5qYPbMgiSIC0SQA4L4FZaa0zH1KVmj/VMpc/lYa4R2HgnBpPVdgqSwtry/EYBkTPguU
         tVXQ7w1o/IGX7S+e1TYtGE0bpGzvEMaTO2XGZY/p9i+Q8DyZc+j0aGl67NwCbMn8Zm9j
         NZVA==
X-Gm-Message-State: APjAAAUaRqQjqH5oKCbwWx/FBPHEPvhwXx6tOolcZObny0WUe22wTBWT
        gQD+7VuE4V3PQii/Q6RAk6E=
X-Google-Smtp-Source: APXvYqxxQj0SFvHtOzkhRoICVHUaB596QC06pjnWOOfQQMyEjzJCX6sN20BA6uP1uM4bNsFFhONrpA==
X-Received: by 2002:a17:90a:2224:: with SMTP id c33mr4577562pje.22.1561624022389;
        Thu, 27 Jun 2019 01:27:02 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.201.6])
        by smtp.gmail.com with ESMTPSA id p15sm14394558pjf.27.2019.06.27.01.26.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 01:27:01 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2] media:vivid:add sanity check to avoid divide error and set value to 1 if 0.
Date:   Thu, 27 Jun 2019 13:56:43 +0530
Message-Id: <20190627082643.14441-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626060115.4305-1-bnvandana@gmail.com>
References: <20190626060115.4305-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported divide error in vivid_thread_vid_cap, which has been
seen only once and doesnot have a reproducer.
This patch sanity checks for the
denominator value with WARN_ON if it is 0 and replaces it with 1.

Reported-by: syz...@syzkaller.appspotmail.com

divide error: 0000 [#1] PREEMPT SMP KASAN
kobject: 'tx-0' (0000000017161f7f): kobject_uevent_env
CPU: 0 PID: 23689 Comm: vivid-003-vid-c Not tainted 5.0.0-rc4+ #58
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
Google 01/01/2011
RIP: 0010:vivid_cap_update_frame_period
drivers/media/platform/vivid/vivid-kthread-cap.c:661 [inline]
RIP: 0010:vivid_thread_vid_cap+0x221/0x284
drivers/media/platform/vivid/vivid-kthread-cap.c:789
Code: 48 c1 e9 03 0f b6 0c 11 48 89 f2 48 69 c0 00 ca 9a 3b 83 c2 03 38
ca
7c 08 84 c9 0f 85 f0 1e 00 00 41 8b 8f 24 64 00 00 31 d2 <48> f7 f1 49
89
c4 48 89 c3 49 8d 87 28 64 00 00 48 89 c2 48 89 45
RSP: 0018:ffff88808b4afd68 EFLAGS: 00010246
kobject: 'tx-0' (0000000017161f7f): fill_kobj_path: path
= '/devices/virtual/net/gre0/queues/tx-0'
RAX: 000000de5a6f8e00 RBX: 0000000100047b22 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000004
RBP: ffff88808b4aff00 R08: ffff88804862e1c0 R09: ffffffff89997008
R10: ffffffff89997010 R11: 0000000000000001 R12: 00000000fffffffc
R13: ffff8880a17e0500 R14: ffff88803e40f760 R15: ffff8882182b0140
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004cdc90 CR3: 000000005d827000 CR4: 00000000001426f0
Call Trace:
kobject: 'gretap0' (00000000d7549098): kobject_add_internal: parent:
'net',
set: 'devices'
kobject: 'loop2' (0000000094ed4ee4): kobject_uevent_env
kobject: 'loop2' (0000000094ed4ee4): fill_kobj_path: path
= '/devices/virtual/block/loop2'
  kthread+0x357/0x430 kernel/kthread.c:246
kobject: 'gretap0' (00000000d7549098): kobject_uevent_env
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Modules linked in:
kobject: 'gretap0' (00000000d7549098): fill_kobj_path: path
= '/devices/virtual/net/gretap0'
---[ end trace bc5c8b25b64d768f ]---
kobject: 'loop1' (0000000032036b86): kobject_uevent_env
RIP: 0010:vivid_cap_update_frame_period
drivers/media/platform/vivid/vivid-kthread-cap.c:661 [inline]
RIP: 0010:vivid_thread_vid_cap+0x221/0x2840
drivers/media/platform/vivid/vivid-kthread-cap.c:789
kobject: 'loop1' (0000000032036b86): fill_kobj_path: path
= '/devices/virtual/block/loop1'
Code: 48 c1 e9 03 0f b6 0c 11 48 89 f2 48 69 c0 00 ca 9a 3b 83 c2 03 38
ca
7c 08 84 c9 0f 85 f0 1e 00 00 41 8b 8f 24 64 00 00 31 d2 <48> f7 f1 49
89
c4 48 89 c3 49 8d 87 28 64 00 00 48 89 c2 48 89 45
kobject: 'loop0' (00000000dd9927c3): kobject_uevent_env
RSP: 0018:ffff88808b4afd68 EFLAGS: 00010246
RAX: 000000de5a6f8e00 RBX: 0000000100047b22 RCX: 0000000000000000
kobject: 'queues' (000000007ed20666): kobject_add_internal:
parent: 'gretap0', set: '<NULL>'
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 0000000000000004
RBP: ffff88808b4aff00 R08: ffff88804862e1c0 R09: ffffffff89997008
kobject: 'loop0' (00000000dd9927c3): fill_kobj_path: path
= '/devices/virtual/block/loop0'
R10: ffffffff89997010 R11: 0000000000000001 R12: 00000000fffffffc
kobject: 'queues' (000000007ed20666): kobject_uevent_env
R13: ffff8880a17e0500 R14: ffff88803e40f760 R15: ffff8882182b0140
FS:  0000000000000000(0000) GS:ffff8880ae800000(0000)
knlGS:0000000000000000
kobject: 'loop5' (00000000a41f9e79): kobject_uevent_env
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kobject: 'queues' (000000007ed20666): kobject_uevent_env: filter
function
caused the event to drop!
CR2: 00000000004cdc90 CR3: 000000005d827000 CR4: 00000000001426f0
kobject: 'loop5' (00000000a41f9e79): fill_kobj_path: path
= '/devices/virtual/block/loop5'

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
V2- fixed checkpatch errors.

 drivers/media/platform/vivid/vivid-kthread-cap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index f8006a30c12f..cf6dfecf879f 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -658,6 +658,8 @@ static void vivid_cap_update_frame_period(struct vivid_dev *dev)
 	u64 f_period;

 	f_period = (u64)dev->timeperframe_vid_cap.numerator * 1000000000;
+	if (WARN_ON(dev->timeperframe_vid_cap.denominator == 0))
+		dev->timeperframe_vid_cap.denominator = 1;
 	do_div(f_period, dev->timeperframe_vid_cap.denominator);
 	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
 		f_period >>= 1;
--
2.17.1

