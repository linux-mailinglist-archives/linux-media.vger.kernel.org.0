Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460386E5836
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 06:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjDREv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 00:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjDREvZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 00:51:25 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Apr 2023 21:51:23 PDT
Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D1D30DC
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 21:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1681793483; x=1713329483;
  h=mime-version:from:date:message-id:subject:to;
  bh=exqRgkdkSA1PfDIxy/IwknTenS8IWnfSSg0a09RURMo=;
  b=VZzXGE3cTRk261llR5ENehDKHRdvNwo1XDJC2uhNb5hT+OkGCp7e341/
   VhwAScIg0aTNX1FEX6Fj5Rx0aL+ZrbNmRWz2dz/CB7VNxaB2lXvO22ucy
   mQRBqg4WntCsIfM6RYyMuKGThBRi/I2QPhXkdkx5PrDTqIGDFC+mIT0sY
   McORcknj6JNUTiuv7cEq97i4fszZ9k9yhPdFVb1I4NXB5D2XCg8ywxP3Q
   kpiszMph1h0pDbh8WFM+hcq9st7atRwWSYwq583ooi8Qj567LZZ8kJ8l+
   c2RVPH2euBv3hjaKvW7YoRkuJQY+4kKtlMRSlOEh27GvlabP1eDoAYqUI
   w==;
Received: from mail-wm1-f70.google.com ([209.85.128.70])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Apr 2023 21:50:20 -0700
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f16ef3be6eso9901125e9.3
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 21:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1681793418; x=1684385418;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HpyqnahZ0dBtoFysZJW/vJkY2sBhJEsRqq8ZhFGwOjI=;
        b=QIBh8AZCfAo6mr+kt8fYn9MIl6Sn0AQNnIT9l7RcKAk+zUcS0eh2a2AjOnvb7/aUXa
         tVdkMqLIvsscwsah+Ste7AH5HoY5wOx4Vf+e5NMPiQ3/Tf6Runi1iKfaxbi9S/uKO8np
         t3SGO4fxxsu08hDkrHjxiVzVBxv5j0nruZj6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681793418; x=1684385418;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpyqnahZ0dBtoFysZJW/vJkY2sBhJEsRqq8ZhFGwOjI=;
        b=lyRqA5r5JnqXx1K6n9gmTryjgR5qQxCKnWEEBO4yKewhqcZnG7608BCyb5rd5CSP1C
         sg8FzMKD7/KE1T6zjh3GP1t5lGq5D1/FFWN38AL5mcrAcEePBriWuCLu6uaElN9+1Lk8
         tDQunKPrm3ZLg9ZQGQxZ2YnWcDrxWU+A3kCIaClHwjlPZAC+SdYUIfK6h7XzCaKEw6xR
         4+ruK2VC5Ueft/8EAnNy1rlViSw97fdleymXadF6FJHFbPOS3+MepY4ymI8baykDlVJs
         HMM5kiH2cAg3I8MhSnGq0wbU0Y+xyZpYMIxkh67UfKeRMNyMhI+GcKKB5lfJ8GDJqe3T
         6O/Q==
X-Gm-Message-State: AAQBX9fPQo+SsS8r2O+0QR+p7RZ9f7y97SMlhANJQ/74pMLZySlC9Yr2
        k7iHpCWXLXqWOsgrHxgahuNAXQNYfvfdcBKGXtGonLA9V2I/GwP7mGnPKogYUsSnmQ01eY2zq4s
        GrgX4KT9CdUq1uLa+2vBRJVw04l7Z7D0gMm0cPayLFKlbwdhvu/Y=
X-Received: by 2002:a5d:60c3:0:b0:2e3:99d3:7a5 with SMTP id x3-20020a5d60c3000000b002e399d307a5mr658025wrt.24.1681793418097;
        Mon, 17 Apr 2023 21:50:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bt+E4+5aYFJhzoP/eIld+GGePEmOqnh3yrE8Vw7ps59ymnbJkqulV2j2WnJG8R5W9ILDuMhbIodC9lbkhgOgE=
X-Received: by 2002:a5d:60c3:0:b0:2e3:99d3:7a5 with SMTP id
 x3-20020a5d60c3000000b002e399d307a5mr658015wrt.24.1681793417813; Mon, 17 Apr
 2023 21:50:17 -0700 (PDT)
MIME-Version: 1.0
From:   Yu Hao <yhao016@ucr.edu>
Date:   Mon, 17 Apr 2023 21:50:07 -0700
Message-ID: <CA+UBctCu7fXn4q41O_3=id1+OdyQ85tZY1x+TkT-6OVBL6KAUw@mail.gmail.com>
Subject: BUG: WARNING in dvb_frontend_get_event
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

We found the following issue using syzkaller on Linux v6.2.0.

In the function `dvb_frontend_get_event`, function
`wait_event_interruptible` is called
and the condition is `dvb_frontend_test_event(fepriv, events)`.
In the function `dvb_frontend_test_event`, function
`down(&fepriv->sem);` is called.
However, function `wait_event_interruptible` would put the process to sleep.
And function `down(&fepriv->sem);` may block the process.
So there is the issue with "do not call blocking ops when !TASK_RUNNING".

The full report including the Syzkaller reproducer & C reproducer:
https://gist.github.com/ZHYfeng/4c5f8be6adc63b73dba68230d15ece2c

The brief report is below:

Syzkaller hit 'WARNING in dvb_frontend_get_event' bug.

------------[ cut here ]------------
do not call blocking ops when !TASK_RUNNING; state=1 set at
[<ffffffff8161186d>] prepare_to_wait_event+0x6d/0x690
kernel/sched/wait.c:333
WARNING: CPU: 0 PID: 8017 at kernel/sched/core.c:9968
__might_sleep+0x10a/0x160 kernel/sched/core.c:9968
Modules linked in:
CPU: 0 PID: 8017 Comm: syz-executor303 Not tainted 6.2.0 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:__might_sleep+0x10a/0x160 kernel/sched/core.c:9968
Code: 9d 03 00 48 8d bb d8 16 00 00 48 89 fa 48 c1 ea 03 80 3c 02 00
75 34 48 8b 93 d8 16 00 00 48 c7 c7 e0 68 4c 8a e8 38 55 72 08 <0f> 0b
e9 75 ff ff ff e8 1a 7b 7f 00 e9 26 ff ff ff 89 34 24 e8 1d
RSP: 0018:ffffc9000e537ac8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff888018bdba80 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff888018bdba80 RDI: fffff52001ca6f4b
RBP: ffffffff8a4cd200 R08: 0000000000000000 R09: ffffed1005944f32
R10: ffff88802ca2798b R11: ffffed1005944f31 R12: 000000000000003a
R13: 0000000000000000 R14: 0000000000000000 R15: ffff888044057260
FS:  0000555555995880(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd34db66000 CR3: 000000001f479000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 down+0x1e/0xa0 kernel/locking/semaphore.c:58
 dvb_frontend_test_event drivers/media/dvb-core/dvb_frontend.c:277 [inline]
 dvb_frontend_get_event.isra.0+0x528/0x670
drivers/media/dvb-core/dvb_frontend.c:301
 dvb_frontend_handle_ioctl+0x1953/0x2ea0
drivers/media/dvb-core/dvb_frontend.c:2726
 dvb_frontend_do_ioctl+0x1c5/0x2f0 drivers/media/dvb-core/dvb_frontend.c:2097
 dvb_usercopy+0xbe/0x280 drivers/media/dvb-core/dvbdev.c:961
 dvb_frontend_ioctl+0x5a/0x80 drivers/media/dvb-core/dvb_frontend.c:2111
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x198/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f569e9f4a7d
Code: 28 c3 e8 36 29 00 00 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff77694948 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f569e9f4a7d
RDX: 0000000020000000 RSI: 0000000080286f4e RDI: 0000000000000003
RBP: 00007f569e9ae440 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f569e9ae4e0
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
