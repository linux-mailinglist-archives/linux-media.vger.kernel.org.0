Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B22561F7
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 08:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfFZGBn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 02:01:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42609 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfFZGBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 02:01:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so725176pff.9;
        Tue, 25 Jun 2019 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZNJj3CjcDtl0Bgik+fJ5f3lZ9ANWsGTsyVirZdpD8EM=;
        b=pmgK/nYZHHwueN3F9YBPxm5xyifECKJey/yfzjE2Gd8mHEMvbG6XTT4unYkY61ty6c
         nRpXey5cPqMP6VVziojFmH12+fcaNYggm6BtEvCMXC5oMTMUo+pFtio9Y4HlWnZUckTu
         8MvVewalXLEDjTXlluB/19ynW6j+NpHG9HbC0OCkiresxZpEh3jQ1q9nuxUsKiPxrxMy
         HMShFYjbnWWmhF7Izzy4KNbDL5rcGVPBOp+c3J7PyuFr+M+xeoDT3JnBYkHQ+Bd596gw
         fp47zoxDGfWXpqVG8Q3fFZ+TbA1JRZhyrsiAAQpJQhaTkiparHTCLsAWbrLGUZJg4ugf
         tBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZNJj3CjcDtl0Bgik+fJ5f3lZ9ANWsGTsyVirZdpD8EM=;
        b=QSCa0q7zeCX5CIZirbLA7Fs4EbgT8QkwgqnrFcWPe+Av7BlkKAVspLpg4WeyNp2GaK
         Ljs4FIIQdZ/cNiLjwYvTRfJwwsfKagInXiugTLVi4Du26rcmPioXkLe9BKYHp+Yhr2I9
         I3MYqmijQLj3iQff4L9zaujZBCdviCRfm/aXdGgrOQWC17o2tiYXebhF969PQsW+ddbf
         AQag9Z0nOG67Kf5U6gARSzk8r0i6RR+WaAwJcYQo+XM/g2hVQ/OgFlfeNrYK0aaAvQFu
         HU1ZSb+muMxwYNnpiBFk31QppxcX2pH8YZLh1DMRIkBct2cOdxgcIwQGrKHqHTPm3Stc
         /jWg==
X-Gm-Message-State: APjAAAXY2rktPb1H2LpOtzJFecvQUe8WC3E6lWKxV9aazm7wZN+E0/Uz
        DHgNVTm9ZUvvMxvjN/eJTQI=
X-Google-Smtp-Source: APXvYqwGZ1aPeO54Ny4sGR2KuzZc9jJTzUSmbycQV3iHl/HnQP6K5zI8tw8GlVVrWZUMXEJhQqRHOw==
X-Received: by 2002:a63:1657:: with SMTP id 23mr1129946pgw.98.1561528902301;
        Tue, 25 Jun 2019 23:01:42 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.200.186])
        by smtp.gmail.com with ESMTPSA id k22sm17156025pfk.157.2019.06.25.23.01.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 23:01:41 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Vandana BN <bnvandana@gmail.com>
Subject: [PATCH] media:vivid: add sanity check to avoid divide error and set value to 1 if 0.
Date:   Wed, 26 Jun 2019 11:31:15 +0530
Message-Id: <20190626060115.4305-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Syzbot reported divide error in vivid_thread_vid_cap, which has been
seen only once and doesnot have a reproducer.
This patch sanity checks for the denominator value with WARN_ON if it is 0 and replaces it with 1.

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
 drivers/media/platform/vivid/vivid-kthread-cap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index f8006a30c12f..025a8c68bd1c 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -658,6 +658,8 @@ static void vivid_cap_update_frame_period(struct vivid_dev *dev)
 	u64 f_period;
 
 	f_period = (u64)dev->timeperframe_vid_cap.numerator * 1000000000;
+	if(WARN_ON(dev->timeperframe_vid_cap.denominator == 0))
+		dev->timeperframe_vid_cap.denominator = 1;
 	do_div(f_period, dev->timeperframe_vid_cap.denominator);
 	if (dev->field_cap == V4L2_FIELD_ALTERNATE)
 		f_period >>= 1;
-- 
2.17.1

