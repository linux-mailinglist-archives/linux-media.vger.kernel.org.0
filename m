Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDE7374A77
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 23:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbhEEVjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 17:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbhEEVjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 17:39:51 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F7DC061761;
        Wed,  5 May 2021 14:38:53 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e2so1920898plh.8;
        Wed, 05 May 2021 14:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nED1tfdyad77CyL5ahIoVpnSjfX9IAkRkG2H71l3Az8=;
        b=mD7nMf5EDRT5x5dqMxJv+lvSKkg6elqBAP9eWS9YKDFwQq36Atm3/9R+ToXtNAvD/y
         k3tqJujsngiQZYdOuZGeH/KbZYSWeVxWl59LHP3UP3NsDo2yuY1+1tXivm7aWwWz+Ofu
         FLqLRu4DgQ9CeKsCy/iu7Ar68uI++dmWUOEotaTDcsPhadGBUvPncaIGud37grprDOFq
         DaGkfhR/nQZPc5Yhq8jX+rkd2c+sXESg3nqCCXSDkg3Qc7P9HEAKQjECqHKkeO+zje74
         jakIJAsZ9g6Mlys1PDoionmxib3jwEHMfFlCwqEqw3BqBFinNAYCGlUH8Ute8pS6IPGB
         f8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nED1tfdyad77CyL5ahIoVpnSjfX9IAkRkG2H71l3Az8=;
        b=ECHBhNAIqXjoDiR8e7JhXjbP54L8MoPtK0C8Jbk2WVyQksxdtIsrjJUMRmQ91lYcGG
         XPavYPugJESt5GapdFaoxTTRABwVFI5Jxh2xLnv2W9FGwGb5c+DH8nNpAus+wPXaD6HF
         CKDBRoA6RQ4bOd2vBIJzA+49CKT2nJGvmkPaM+Mw2S8+a0GkDqvwPGe1UZUZaQOFk2M4
         SutTZJxM2742Ne9yvYqbFo5/JaxtjC5h7VKx9P2yANXoRq4qzQgeNtsK703Kr/oj/r12
         STbkjDa/TLedypzlxXcfkJbeto87Ut4IHG2iaINOTH8U1yNSTEf9bQXasPnKJrgu5Wra
         sHHQ==
X-Gm-Message-State: AOAM531ud8H6fgQmEriwoXZGRL0898Rg18spJYCygZgGmBi65uzZ64ak
        XfFtYK5kar217SdmRNSrzg3ZkZNka77Raw==
X-Google-Smtp-Source: ABdhPJwXlz7jAdqnQ/pz7K234pdI+wSXJafvAnXxqkBZ5QVq5pqhY7jhYYhDGnWS4Z6dDd4Eua6Y0A==
X-Received: by 2002:a17:902:b68c:b029:eb:6c82:60da with SMTP id c12-20020a170902b68cb02900eb6c8260damr947039pls.25.1620250732852;
        Wed, 05 May 2021 14:38:52 -0700 (PDT)
Received: from [172.18.1.216] (b-fw-1-nat-campusvpn.ucr.edu. [169.235.64.254])
        by smtp.gmail.com with ESMTPSA id x79sm165861pfc.57.2021.05.05.14.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 14:38:52 -0700 (PDT)
Subject: Re: WARNING in em28xx_init_extension
To:     Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+76929be61691e7b3904b@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <00000000000063015a05938f04f0@google.com>
 <CAAeHK+zzdt2ua0XX2_rzuW=+Vs7SQvKgLMz5wir=xh0cqnFTuw@mail.gmail.com>
From:   SyzScope <syzscope@gmail.com>
Message-ID: <79e05615-eb47-c71b-9a06-93a50cb6b777@gmail.com>
Date:   Wed, 5 May 2021 14:38:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAeHK+zzdt2ua0XX2_rzuW=+Vs7SQvKgLMz5wir=xh0cqnFTuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is SyzScope, a research project that aims to reveal high-risk 
primitives from a seemingly low-risk bug (UAF/OOB read, WARNING, BUG, etc.).

We are currently testing seemingly low-risk bugs on syzbot's open 
section(https://syzkaller.appspot.com/upstream), and try to reach out to 
kernel developers if SyzScope discovers any high-risk primitives.

Regrading the bug "BUG: corrupted list in em28xx_init_extension", it 
seems that this bug is still missing a valid patch.

SyzScope reports 4 memory write primitives from this bug.

The detailed comments can be found at 
https://sites.google.com/view/syzscope/bug-corrupted-list-in-em28xx_init_extension

Please let us know if SyzScope indeed helps, and any suggestions/feedback.

On 3/9/2020 8:24 AM, Andrey Konovalov wrote:
> On Fri, Sep 27, 2019 at 10:49 PM syzbot
> <syzbot+76929be61691e7b3904b@syzkaller.appspotmail.com> wrote:
>> Hello,
>>
>> syzbot found the following crash on:
>>
>> HEAD commit:    2994c077 usb-fuzzer: main usb gadget fuzzer driver
>> git tree:       https://github.com/google/kasan.git usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=171c4be3600000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=69ddefac6929256a
>> dashboard link: https://syzkaller.appspot.com/bug?extid=76929be61691e7b3904b
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137d73bd600000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f0c8cb600000
>>
>> IMPORTANT: if you fix the bug, please add the following tag to the commit:
>> Reported-by: syzbot+76929be61691e7b3904b@syzkaller.appspotmail.com
>>
>> em28xx 1-1:0.221: Audio interface 221 found (Vendor Class)
>> em28xx 1-1:0.221: unknown em28xx chip ID (0)
>> em28xx 1-1:0.221: Config register raw data: 0xfffffffb
>> em28xx 1-1:0.221: AC97 chip type couldn't be determined
>> em28xx 1-1:0.221: No AC97 audio processor
>> ------------[ cut here ]------------
>> list_add corruption. prev->next should be next (ffffffff87779de0), but was
>> ffffffff8352fdcc. (prev=ffff8881d2ecc240).
>> WARNING: CPU: 1 PID: 83 at lib/list_debug.c:26 __list_add_valid+0x99/0xf0
>> lib/list_debug.c:26
>> Kernel panic - not syncing: panic_on_warn set ...
>> CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.3.0+ #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> Google 01/01/2011
>> Workqueue: usb_hub_wq hub_event
>> Call Trace:
>>    __dump_stack lib/dump_stack.c:77 [inline]
>>    dump_stack+0xca/0x13e lib/dump_stack.c:113
>>    panic+0x2a3/0x6da kernel/panic.c:219
>>    __warn.cold+0x20/0x4a kernel/panic.c:576
>>    report_bug+0x262/0x2a0 lib/bug.c:186
>>    fixup_bug arch/x86/kernel/traps.c:179 [inline]
>>    fixup_bug arch/x86/kernel/traps.c:174 [inline]
>>    do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
>>    do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
>>    invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
>> RIP: 0010:__list_add_valid+0x99/0xf0 lib/list_debug.c:26
>> Code: 48 c7 c7 60 06 db 85 e8 2a 7a 30 ff 0f 0b 48 83 c4 08 31 c0 5d 41 5c
>> c3 48 89 f1 48 c7 c7 20 07 db 85 4c 89 e6 e8 0c 7a 30 ff <0f> 0b 31 c0 eb
>> c5 48 89 f2 4c 89 e1 48 89 ee 48 c7 c7 a0 07 db 85
>> RSP: 0018:ffff8881d93cf120 EFLAGS: 00010286
>> RAX: 0000000000000000 RBX: ffff8881d2810120 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: ffffffff8128d3fd RDI: ffffed103b279e16
>> RBP: ffff8881d2810240 R08: ffff8881d92a3000 R09: fffffbfff11f45af
>> R10: fffffbfff11f45ae R11: ffffffff88fa2d77 R12: ffffffff87779de0
>> R13: ffff8881d2810000 R14: ffff8881d281012c R15: ffff8881d2c84400
>>    __list_add include/linux/list.h:60 [inline]
>>    list_add_tail include/linux/list.h:93 [inline]
>>    em28xx_init_extension+0x44/0x1f0
>> drivers/media/usb/em28xx/em28xx-core.c:1125
>>    em28xx_init_dev.isra.0+0xa7b/0x15d8
>> drivers/media/usb/em28xx/em28xx-cards.c:3520
>>    em28xx_usb_probe.cold+0xcac/0x2516
>> drivers/media/usb/em28xx/em28xx-cards.c:3869
>>    usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>>    really_probe+0x281/0x6d0 drivers/base/dd.c:548
>>    driver_probe_device+0x104/0x210 drivers/base/dd.c:721
>>    __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>>    bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>>    __device_attach+0x217/0x360 drivers/base/dd.c:894
>>    bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>>    device_add+0xae6/0x16f0 drivers/base/core.c:2201
>>    usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>>    generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>>    usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>>    really_probe+0x281/0x6d0 drivers/base/dd.c:548
>>    driver_probe_device+0x104/0x210 drivers/base/dd.c:721
>>    __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>>    bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>>    __device_attach+0x217/0x360 drivers/base/dd.c:894
>>    bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>>    device_add+0xae6/0x16f0 drivers/base/core.c:2201
>>    usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>>    hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>>    hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>>    port_event drivers/usb/core/hub.c:5359 [inline]
>>    hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>>    process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>>    process_scheduled_works kernel/workqueue.c:2331 [inline]
>>    worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>>    kthread+0x318/0x420 kernel/kthread.c:255
>>    ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>> Kernel Offset: disabled
>> Rebooting in 86400 seconds..
>>
>>
>> ---
>> This bug is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this bug report. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> syzbot can test patches for this bug, for details see:
>> https://goo.gl/tpsmEJ#testing-patches
> #syz dup: BUG: corrupted list in em28xx_init_extension
>
