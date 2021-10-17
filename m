Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EAD430AAD
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344215AbhJQQ0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344219AbhJQQ0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:26:48 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AF7C06161C;
        Sun, 17 Oct 2021 09:24:39 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id i5so3379340pla.5;
        Sun, 17 Oct 2021 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77Oj8wqdojqsg0bn79nZkdqYg9OfijGCgFaBQCsH/5c=;
        b=kXP02HhTp8UeNOrEO2TwUPB5xRm7TRr235t5XReuPJREPTzaUw6ypsxxg7tgwMiPeP
         R+TlT7NZlFqf8q8FIncWf5J/QU7uv8TZBnNUAtdR2PgbUbfCjS9uDqtnD0hBldil7np1
         B4kaBMQqQ4YqnxDciqgLeqbQn7qJt0ApbjqBBPUVOE2XydGJxcMnZAIb7uxn5q0/Y6CD
         rQPIHkbnJGooU8xZ9XSXB0zvm8giEGDPoe6yKDyx9duKuBkAoA5q06P0TQQd9WGaOs4O
         sbja5b5MsQUjlo+IE/D/PQjNzDsO5BmRHzfnFI1m1njLFaUbR7Pb61YStcf2eSiVbN5s
         U7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77Oj8wqdojqsg0bn79nZkdqYg9OfijGCgFaBQCsH/5c=;
        b=uvCUi/bHEszSL1hjvfmlCGOD9Z9hZWOfztyD8cXaUlC5OMXCLn8CTsTM3+Kh9FJd2K
         UAQPLJ2RMXLuMGSwIKvhl8KD7ReOyhttkumqFE48Nh3nWDnYFnxBUI+YRxiq7yZ2y6cJ
         aVsYdwwGqaRdZXbhk5W++hUdM6oSv7L5z0RY2ZbuIulkCZMumBf9zBiOSOr04HNR6O9y
         99r/T1UFj/b9vowsDiQXsSJJ1UHDJFpDxubw9MEQrOMLAXzArgiDFqO1iGr1qd8Izl6r
         5oRDSUsrxF+mnU2MtkTUt393GJBXtuzT0kuRyULVaNMOBgHoDU5X7kK0DojJQe8HZ9ZF
         1+Fw==
X-Gm-Message-State: AOAM531wC0roXplrX7HUWE2f4EyjEvKivpNF3Unwj5kaz4oBhtvqbR23
        rLgDVjc7sRF8nP99AwqlAwQ=
X-Google-Smtp-Source: ABdhPJwNfbhLDSI4JU/p0ZdrnLYxqtoad8A0LYKCH9BBZdaPKKGFAEAegGyTRkwxaketJ/RkcxwVJg==
X-Received: by 2002:a17:90b:4a92:: with SMTP id lp18mr27599327pjb.47.1634487878437;
        Sun, 17 Oct 2021 09:24:38 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:24:38 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Ingo Molnar <mingo@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@suse.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [BUG/RFC PATCH 2/5] [BUG][RFC] media: atomisp: pci: remove dummy_ptr NULL check to avoid duplicate active_bo
Date:   Mon, 18 Oct 2021 01:23:33 +0900
Message-Id: <20211017162337.44860-3-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is almost a BUG report with a patch to just avoid kernel error
message. Thus, prefixed with [BUG][RFC].

RFC:
  1. Regarding the NULL check in hmm_init(), it was added for the case
     when probe failed [1]. So, need to address that case with the other
     means? But I'm not sure how we can do for the case.
  2. Regarding the WARN_ON() in hmm_free(), there is a patch from Alan
     ("atomisp: hmm gives a bogus warning on unload") [1] but I haven't
     looked into it yet.

[1] https://lore.kernel.org/linux-media/151001141201.77201.10725942741811192730.stgit@alans-desktop/

>8-----------------------------------------------------------------8<

The NULL check for dummy_ptr in hmm_init() [1] results in the following
"hmm_init Failed to create sysfs" error exactly once every
two times on atomisp reload by rmmod/insmod (although atomisp module
loads and works fine regardless of this error):

	kern  :warn  : [  140.230662] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:03.0/active_bo'
	kern  :warn  : [  140.230668] CPU: 1 PID: 2502 Comm: insmod Tainted: G         C OE     5.15.0-rc4-1-surface-mainline #1 b8acf6eb64994414b2e20bad312a7a2c45f748f9
	kern  :warn  : [  140.230675] Hardware name: OEMB OEMB/OEMB, BIOS 1.51116.238 03/09/2015
	kern  :warn  : [  140.230678] Call Trace:
	kern  :warn  : [  140.230687]  dump_stack_lvl+0x46/0x5a
	kern  :warn  : [  140.230702]  sysfs_warn_dup.cold+0x17/0x24
	kern  :warn  : [  140.230710]  sysfs_add_file_mode_ns+0x160/0x170
	kern  :warn  : [  140.230717]  internal_create_group+0x126/0x390
	kern  :warn  : [  140.230723]  hmm_init+0x5c/0x70 [atomisp 7a6a680bf400629363d2a6f58fd10e7299678b99]
	kern  :warn  : [  140.230811]  atomisp_pci_probe.cold+0x1136/0x148e [atomisp 7a6a680bf400629363d2a6f58fd10e7299678b99]
	kern  :warn  : [  140.230875]  local_pci_probe+0x45/0x80
	kern  :warn  : [  140.230882]  ? pci_match_device+0xd7/0x130
	kern  :warn  : [  140.230887]  pci_device_probe+0xfa/0x1b0
	kern  :warn  : [  140.230892]  really_probe+0x1f5/0x3f0
	kern  :warn  : [  140.230899]  __driver_probe_device+0xfe/0x180
	kern  :warn  : [  140.230903]  driver_probe_device+0x1e/0x90
	kern  :warn  : [  140.230908]  __driver_attach+0xc0/0x1c0
	kern  :warn  : [  140.230912]  ? __device_attach_driver+0xe0/0xe0
	kern  :warn  : [  140.230915]  ? __device_attach_driver+0xe0/0xe0
	kern  :warn  : [  140.230919]  bus_for_each_dev+0x89/0xd0
	kern  :warn  : [  140.230924]  bus_add_driver+0x12b/0x1e0
	kern  :warn  : [  140.230929]  driver_register+0x8f/0xe0
	kern  :warn  : [  140.230933]  ? 0xffffffffc153f000
	kern  :warn  : [  140.230937]  do_one_initcall+0x57/0x220
	kern  :warn  : [  140.230945]  do_init_module+0x5c/0x260
	kern  :warn  : [  140.230952]  load_module+0x24bd/0x26a0
	kern  :warn  : [  140.230962]  ? __do_sys_finit_module+0xae/0x110
	kern  :warn  : [  140.230966]  __do_sys_finit_module+0xae/0x110
	kern  :warn  : [  140.230972]  do_syscall_64+0x5c/0x80
	kern  :warn  : [  140.230979]  ? syscall_exit_to_user_mode+0x23/0x40
	kern  :warn  : [  140.230983]  ? do_syscall_64+0x69/0x80
	kern  :warn  : [  140.230988]  ? exc_page_fault+0x72/0x170
	kern  :warn  : [  140.230991]  entry_SYSCALL_64_after_hwframe+0x44/0xae
	kern  :warn  : [  140.230997] RIP: 0033:0x7f7fd5d8718d
	kern  :warn  : [  140.231003] Code: b4 0c 00 0f 05 eb a9 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 6c 0c 00 f7 d8 64 89 01 48
	kern  :warn  : [  140.231006] RSP: 002b:00007ffefc25f0e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
	kern  :warn  : [  140.231012] RAX: ffffffffffffffda RBX: 000055ac3edcd7f0 RCX: 00007f7fd5d8718d
	kern  :warn  : [  140.231015] RDX: 0000000000000000 RSI: 000055ac3d723270 RDI: 0000000000000003
	kern  :warn  : [  140.231017] RBP: 0000000000000000 R08: 0000000000000000 R09: 00007f7fd5e52380
	kern  :warn  : [  140.231019] R10: 0000000000000003 R11: 0000000000000246 R12: 000055ac3d723270
	kern  :warn  : [  140.231021] R13: 0000000000000000 R14: 000055ac3edd06e0 R15: 0000000000000000
	kern  :err   : [  140.231038] atomisp-isp2 0000:00:03.0: hmm_init Failed to create sysfs

So, remove the NULL check to always call sysfs_remove_group() and fix
the above error.

At this point, atomisp now gives WARN_ON() in hmm_free() [2] on atomisp
reload by rmmod/insmod. So, also remove it.

[1] added on commit
    d9ab83953fa7 ("media: atomisp: don't cause a warn if probe failed")
[2] added on commit
    b83cc378dfc4 ("atomisp: clean up the hmm init/cleanup indirections")

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 6a5ee4607089..47dc3df3b800 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -209,8 +209,6 @@ int hmm_init(void)
 
 void hmm_cleanup(void)
 {
-	if (!dummy_ptr)
-		return;
 	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
 
 	/* free dummy memory first */
@@ -288,8 +286,6 @@ void hmm_free(ia_css_ptr virt)
 
 	dev_dbg(atomisp_dev, "%s: free 0x%08x\n", __func__, virt);
 
-	WARN_ON(!virt);
-
 	bo = hmm_bo_device_search_start(&bo_device, (unsigned int)virt);
 
 	if (!bo) {
-- 
2.33.1

