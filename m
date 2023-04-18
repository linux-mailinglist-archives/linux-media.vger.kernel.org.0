Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81AEA6E580A
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 06:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbjDREWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 00:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjDREWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 00:22:04 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Apr 2023 21:22:02 PDT
Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660BA44A6
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 21:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1681791723; x=1713327723;
  h=mime-version:from:date:message-id:subject:to;
  bh=ei2gLs1O0NZnYmBieqz5VhegY2tVkKlBOcsxEi/EA7g=;
  b=FXTVyw8Xp/XgBedUW6rwhwetIvoDn+tC8bEv5UBKRptKABsMH4+z0Mjw
   MAaOCfmNAT/JsVBf0FzVokFsLazOtBIHeoJ1nKeVo/3RRUJvmuNM5TTEL
   k026irQ4G59xmaGqyfEuWoD4TIA4A/FtbbFsbzRh+3Ah6FLld2rleTU6S
   x14OJWwyvy2tuZev1hd9sVyPV3kWRzyVbox7k9sk5eAUSX4NJcT9oTjJO
   LSHYaNj18zKRIDudOzSos5VziMKH8aoDvsBetvJaFPkbQblWQO7c6x7DW
   t5rw1iIRi8xDgh+vfug7mH2u7a0BpjHDb2MOSBmsk+eSeMFtnWaSdURcx
   w==;
Received: from mail-wr1-f71.google.com ([209.85.221.71])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Apr 2023 21:21:00 -0700
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-2f4f1fce6c6so1194800f8f.2
        for <linux-media@vger.kernel.org>; Mon, 17 Apr 2023 21:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1681791658; x=1684383658;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ag6QRVBSWKzv0L9O+XILR78++2XNzx82opOiTt5BJwM=;
        b=Ne1+OJswCI/SHD9CEVARkqz9AEhwiCOAod62RAeWBSnBSJtWlvUJiLxENiehkNWWg9
         0nMrUb5BB2DwioJ6iRVOgE2tFGnZzOLB4Nk1S23UmDaB25dR+qBGOvzVWALa2E2zhY8m
         3jp0hs14Q/40piB4NROeCwiDlTku04z+Rcp60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681791658; x=1684383658;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ag6QRVBSWKzv0L9O+XILR78++2XNzx82opOiTt5BJwM=;
        b=l1/vBpzIHuKTOSZEnr2vN4LrMCPQKIJIFvwYm0dfBItsoGODuA2/8bY01M/DBmrFel
         5mrziQee8qpRIOLvBvVhG+8qTFxbgfAT+Tf0FkIM2/PgMT7mQ/wAwGKng8fwCUbF5oeU
         mJLuD+wmQldj6MUNLkohuGEQUUzW8YtUofFI33Cd24xjV/Ntgn+n0KnjADp1bU7Xt0s5
         81H/VvsKagnNBv2jIJpVIKX6XC0S/rU2YPRXSnJHTnjGN8Zku5TXoCrbxtnyv1YlGNaI
         28eo8SVMEHxrSuO4FwIYF3jVM69CUneb9H2jqfzLDktoYSiOIEequCDa+nUAGBW/ln6/
         zRlg==
X-Gm-Message-State: AAQBX9di0ibi9eWxiD+nCYA+GAmazhYab42RkyvqsuzE0cMlxFZt0l6U
        Okxd/MA2J/ttpfR97cUEOEY7NB+/6e2raSBWWdyI/XOSLXfsoBTXhEZ6WpPcs9fxp4dXIh2pvTM
        WJ0j3bF6K+QzqVaGt+okRT6GHitc1jeQL9mvyUdq4
X-Received: by 2002:adf:e710:0:b0:2cf:3a99:9c1e with SMTP id c16-20020adfe710000000b002cf3a999c1emr659184wrm.49.1681791657928;
        Mon, 17 Apr 2023 21:20:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350aVq2gIGzXUeuZqjP58UgyMK3f05ViIe5WrUafSTWEP8RNuI1INVqkqJWIjF7/4RHB/NH5NvwcvY2xHmtS6I1o=
X-Received: by 2002:adf:e710:0:b0:2cf:3a99:9c1e with SMTP id
 c16-20020adfe710000000b002cf3a999c1emr659174wrm.49.1681791657605; Mon, 17 Apr
 2023 21:20:57 -0700 (PDT)
MIME-Version: 1.0
From:   Yu Hao <yhao016@ucr.edu>
Date:   Mon, 17 Apr 2023 21:20:46 -0700
Message-ID: <CA+UBctDXyiosaiR7YNKCs8k0aWu4gU+YutRcnC+TDJkXpHjQag@mail.gmail.com>
Subject: BUG: general protection fault in vidtv_mux_stop_thread
To:     dwlsalmeida@gmail.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

We found the following issue using syzkaller on Linux v6.2.0.

It seems to be a currency bug.
In the function `vidtv_stop_streaming`, after `dvb->mux = NULL;` was executed,
it executes `vidtv_mux_stop_thread(dvb->mux);` again.
Need to check the `dvb->mux==NULL` before `vidtv_mux_stop_thread(dvb->mux);`
in function `vidtv_stop_streaming`

The full report including the Syzkaller reproducer:
https://gist.github.com/ZHYfeng/c61f87ed42d4c44344d4addefd81cc1f

The brief report is below:

Syzkaller hit 'general protection fault in vidtv_mux_stop_thread' bug.

general protection fault, probably for non-canonical address
0xdffffc0000000025: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000128-0x000000000000012f]
CPU: 0 PID: 9614 Comm: syz-executor.0 Not tainted 6.2.0 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:vidtv_mux_stop_thread+0x27/0x80
drivers/media/test-drivers/vidtv/vidtv_mux.c:471
Code: 00 00 00 0f 1f 44 00 00 55 53 48 89 fb e8 51 23 b2 fa 48 8d bb
28 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6
04 02 84 c0 74 02 7e 3b 0f b6 ab 28 01 00 00 31 ff 89 ee e8
RSP: 0018:ffffc900068ffca0 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff86cec666
RDX: 0000000000000025 RSI: ffff888020378000 RDI: 0000000000000128
RBP: ffff888019d652f8 R08: 0000000000000000 R09: fffffbfff1ce4fab
R10: ffffc900068ffcb8 R11: fffffbfff1ce4faa R12: ffff888019d65260
R13: ffffffff8dc6f3c0 R14: ffffc9000713a6c0 R15: ffff888019d64a70
FS:  0000555555b72940(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555555c00d88 CR3: 000000001e832000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vidtv_stop_streaming
drivers/media/test-drivers/vidtv/vidtv_bridge.c:209 [inline]
 vidtv_stop_feed+0x14e/0x250 drivers/media/test-drivers/vidtv/vidtv_bridge.c:252
 dmx_section_feed_stop_filtering+0x91/0x150
drivers/media/dvb-core/dvb_demux.c:1000
 dvb_dmxdev_feed_stop+0x203/0x280 drivers/media/dvb-core/dmxdev.c:486
 dvb_dmxdev_filter_stop.part.0+0x1e7/0x340 drivers/media/dvb-core/dmxdev.c:559
 dvb_dmxdev_filter_stop drivers/media/dvb-core/dmxdev.c:552 [inline]
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0xd6/0x5c0 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x281/0xa90 fs/file_table.c:320
 task_work_run+0x170/0x270 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
 exit_to_user_mode_prepare+0x262/0x270 kernel/entry/common.c:203
 __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
 syscall_exit_to_user_mode+0x19/0x50 kernel/entry/common.c:296
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fe950c40dcb
Code: 03 00 00 00 0f 05 48 3d 00 f0 ff ff 77 41 c3 48 83 ec 18 89 7c
24 0c e8 63 fc ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d
00 f0 ff ff 77 2f 44 89 c7 89 44 24 0c e8 a1 fc ff ff 8b 44
RSP: 002b:00007ffd3d403e80 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 00007fe950c40dcb
RDX: 0000001b31220000 RSI: 0000000000000001 RDI: 0000000000000003
RBP: 0000000000000001 R08: 0000000000000000 R09: 00007fe950dd0450
R10: 00007ffd3d403fc0 R11: 0000000000000293 R12: 00007fe950dd0448
R13: 00007fe950dd0450 R14: 00007fe950dcbf60 R15: 000000000001c14f
 </TASK>
