Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F154446544
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 15:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhKEO4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 10:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbhKEO4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 10:56:08 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A9BC061205
        for <linux-media@vger.kernel.org>; Fri,  5 Nov 2021 07:53:27 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id i5so14184798wrb.2
        for <linux-media@vger.kernel.org>; Fri, 05 Nov 2021 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iXLTZXL1GQP1HI9r/QvQqQsWuhIIrqOsmFlp8xIa9EA=;
        b=s378FoYPpbOvJEqqeuzFQJJ/PPT9UGPGFyvQK0kJrjUMl2vqYFjnIhRzfAnD+Yxz1c
         wIWQgEUjUATKcu7zviAitnD/Kie0GKxCSKrdD0wQCE2YJGSwszme8HZ9ZSBGebjlDBo5
         dqXiiaekTEhL9vCP4akjSRj1o/YDfHW5Y9Sj5csljI8CRXuFq9nlAqszS+LCN7geWUGh
         XDzAn/HLJlqqMF8gy9fr/hHew3Q+BSekoWPpu/AadusPqwVYsu/sW4chCOa4Wdb35QdV
         EgD0LU1GwIeQ0qqC06iAe3H13Apk5m19FItjl+O4uT1WjFfdy15xIumAswsGjEZT4qjv
         9xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iXLTZXL1GQP1HI9r/QvQqQsWuhIIrqOsmFlp8xIa9EA=;
        b=xh6v/bImMajn7Bj2/5TPwZpNRYmWrR2VdV0SZfrjKOO9L7G17ZYDbUrcBhShl+LUVJ
         48/f90tiOrefF5xfEK+Vl/ReZ8UZ0yY5eLPH++19WPlZyblRQbVDE9AdYFlSJmHzmDF2
         GCEHiMDV4MrHFKcruG4XLGNxwUo7d6lgAXvu+eMHuYdLdzY46/q97PVFjiDdz8Yvb/Wl
         F17uuWTlNodrbzRt4nEYf5j8YLedNjq7by7eTlQa4Ewf5SPsit4do1gBnr98QsFqH9b3
         q0hhdLekHSJVLYwQA7Fx/3nyDi1I6GVGBuBxzKu7e29Rxs3GZFPVuGNSkvjZyJZYtkzL
         SvRA==
X-Gm-Message-State: AOAM532k/zIwKvRK/RMmWivFvzbP2wR4IfOnymTb1q92P4mlDzAKQKMM
        Pp80DSO+r2CN7bTmCFZVhj1mGA==
X-Google-Smtp-Source: ABdhPJz1uQp/2OsYlQ22lcK92G8Yg5XjL99UT2p/Zrqni2zAlPmMdHMthVbcYCmG7zZys8uRoXs7hg==
X-Received: by 2002:adf:e306:: with SMTP id b6mr73651599wrj.244.1636124005867;
        Fri, 05 Nov 2021 07:53:25 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id q84sm14380782wme.3.2021.11.05.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 07:53:25 -0700 (PDT)
Date:   Fri, 5 Nov 2021 15:53:23 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH v3 00/14] staging: media: zoran: fusion in one module
Message-ID: <YYVFY6NSdlKiIKK3@Red>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
 <a85c93db-e118-274f-d86a-d127c7399926@xs4all.nl>
 <YYKxTrWI299pvqo7@Red>
 <2bbce7ef-acf8-3c0f-2705-09d34b2d92be@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bbce7ef-acf8-3c0f-2705-09d34b2d92be@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Wed, Nov 03, 2021 at 05:29:46PM +0100, Hans Verkuil a écrit :
> On 03/11/2021 16:57, LABBE Corentin wrote:
> > Le Wed, Nov 03, 2021 at 04:21:02PM +0100, Hans Verkuil a écrit :
> >> Hi Corentin,
> >>
> >> On 26/10/2021 21:34, Corentin Labbe wrote:
> >>> Hello
> >>>
> >>> The main change of this serie is to fusion all zoran related modules in
> >>> one.
> >>> This fixes the load order problem when everything is built-in.
> >>
> >> I've been testing this series, and while the module load/unload is now working,
> >> I'm running into a lot of other v4l2 compliance issues.
> >>
> >> I've fixed various issues in some follow-up patches available in my tree:
> >>
> >> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=zoran
> >>
> >> At least some of the worst offenders are now resolved. Note that the patch
> >> dropping read/write support relies on this patch:
> >>
> >> https://patchwork.linuxtv.org/project/linux-media/patch/4f89b139-13b7-eee6-9662-996626b778b0@xs4all.nl/
> > 
> > Hello
> > 
> > My test branch already included your "zoran: fix various V4L2 compliance errors"
> > I have quickly checked other patch and I am ok with them.
> > I will add and test with them.
> > 
> >>
> >> But there is one really major bug that makes me hesitant to merge this:
> >>
> >> This works:
> >>
> >> v4l2-ctl -v pixelformat=MJPG,width=768,height=576
> >> v4l2-ctl --stream-mmap
> >>
> >> This fails:
> >>
> >> v4l2-ctl -v pixelformat=MJPG,width=768,height=288
> >> v4l2-ctl --stream-mmap
> >>
> >> It's an immediate lock up with nothing to indicate what is wrong.
> >> As soon as the height is 288 or less, this happens.
> >>
> >> Both with my DC30 and DC30D.
> > 
> > Just for curiosity, what is the difference between thoses two ?
> 
> It's the DC30 variant without an adv7175.

So my patch removing adv7175 from DC30 is wrong.
I need to add a new DC30D.

> 
> > 
> >>
> >> Do you see the same? Any idea what is going on? I would feel much happier
> >> if this is fixed.
> >>
> >> Note that the same problem is present without this patch series, so it's
> >> been there for some time.
> >>
> > 
> > I will start on digging this problem and add thoses commands to my CI.
> > And I know there are a huge quantity of problem since origins.
> > A simple example is that just setting MJPEG as default input format does not work.
> > 
> > But since it is not related to my serie, can you please merge it.
> 
> Before I do that, I would really like to know a bit more about this issue:
> can you reproduce it? Is it DC30 specific or a general problem with zoran?
> 
> The problem with this hard hang is that it is hard to do regression testing
> with v4l2-compliance, since it will hang as soon as MJPG pixelformat is
> tested.
> 
> I would feel much happier if the hang can be avoided, even if it is just
> with a temporary hack. It will make it much easier going forward.
> 

I hit the same problem with my DC10+.
I got the following trace:
[   97.022391] BUG: kernel NULL pointer dereference, address: 0000000000000018
[   97.029357] #PF: supervisor write access in kernel mode
[   97.034579] #PF: error_code(0x0002) - not-present page
[   97.039712] PGD 100e30067 P4D 100e30067 PUD 11c958067 PMD 0 
[   97.045370] Oops: 0002 [#1] PREEMPT SMP NOPTI
[   97.049723] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G         C        5.15.0-next-20211105+ #126
[   97.058500] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./K10N78, BIOS P2.00 07/01/2010
[   97.067791] RIP: 0010:zoran_irq+0x178/0x2e0 [zr36067]
[   97.072845] Code: 01 8d 5c 00 01 48 8b 85 90 0c 00 00 48 63 db 44 8b 2c 98 41 f6 c5 01 0f 84 64 01 00 00 4c 8b bc dd 38 0d 00 00 e8 98 72 a1 fa <49> 89 47 18 83 bd 90 0b 00 00 01 0f 84 da 00 00 00 48 8b 85 68 0c
[   97.091590] RSP: 0018:ffffa57040003f00 EFLAGS: 00010016
[   97.096807] RAX: 000000169273a7d2 RBX: 0000000000000001 RCX: 0000000000000018
[   97.103932] RDX: 000000830c927d90 RSI: 000000000000d33a RDI: 00041965ba87a734
[   97.111063] RBP: ffff9d845cce1028 R08: 00000000005b6db7 R09: 0000000000000000
[   97.118188] R10: 0000000000000000 R11: ffffa57040003ff8 R12: 0000000000000065
[   97.125312] R13: 0000000004027541 R14: ffff9d845cce1d58 R15: 0000000000000000
[   97.132434] FS:  0000000000000000(0000) GS:ffff9d845fc00000(0000) knlGS:0000000000000000
[   97.140513] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   97.146249] CR2: 0000000000000018 CR3: 000000011c956000 CR4: 00000000000006f0
[   97.153374] Call Trace:
[   97.155822]  <IRQ>
[   97.157840]  __handle_irq_event_percpu+0x35/0x180
[   97.162546]  handle_irq_event+0x50/0xb0
[   97.166384]  handle_fasteoi_irq+0x8b/0x1e0
[   97.170483]  __common_interrupt+0x64/0x100
[   97.174581]  common_interrupt+0x9f/0xc0
[   97.178414]  </IRQ>
[   97.180510]  <TASK>
[   97.182609]  asm_common_interrupt+0x1e/0x40
[   97.186793] RIP: 0010:acpi_idle_do_entry+0x47/0x50
[   97.191585] Code: 08 48 8b 15 1f db 5d 01 ed c3 e9 64 fd ff ff 65 48 8b 04 25 00 ad 01 00 48 8b 00 a8 08 75 ea eb 07 0f 00 2d 0b 80 5b 00 fb f4 <fa> c3 cc cc cc cc cc cc cc 41 56 49 89 f6 41 55 41 89 d5 41 54 55
[   97.210323] RSP: 0018:ffffffffbc603e30 EFLAGS: 00000246
[   97.215539] RAX: 0000000000004000 RBX: ffff9d84413f1c00 RCX: 000000000000001f
[   97.222666] RDX: ffff9d845fc00000 RSI: ffff9d8440165000 RDI: ffff9d8440165064
[   97.229798] RBP: ffff9d8440165064 R08: 000000000001184d R09: 0000000000000018
[   97.236921] R10: 00000000000029cc R11: 000000000000318c R12: 0000000000000001
[   97.244046] R13: ffffffffbc7c3e20 R14: 0000000000000001 R15: 0000000000000000
[   97.251178]  acpi_idle_enter+0x99/0xe0
[   97.254931]  cpuidle_enter_state+0x84/0x360
[   97.259118]  cpuidle_enter+0x24/0x40
[   97.262698]  do_idle+0x1d0/0x250
[   97.265928]  cpu_startup_entry+0x14/0x20
[   97.269846]  start_kernel+0x63a/0x65f
[   97.273514]  secondary_startup_64_no_verify+0xc2/0xcb
[   97.278565]  </TASK>
[   97.280748] Modules linked in: adv7175 saa7110 zr36067(C) videobuf2_dma_contig
[   97.287970] CR2: 0000000000000018
[   97.291279] ---[ end trace 0ee22c5269015e89 ]---
[   97.295888] RIP: 0010:zoran_irq+0x178/0x2e0 [zr36067]
[   97.300941] Code: 01 8d 5c 00 01 48 8b 85 90 0c 00 00 48 63 db 44 8b 2c 98 41 f6 c5 01 0f 84 64 01 00 00 4c 8b bc dd 38 0d 00 00 e8 98 72 a1 fa <49> 89 47 18 83 bd 90 0b 00 00 01 0f 84 da 00 00 00 48 8b 85 68 0c
[   97.319679] RSP: 0018:ffffa57040003f00 EFLAGS: 00010016
[   97.324896] RAX: 000000169273a7d2 RBX: 0000000000000001 RCX: 0000000000000018
[   97.332019] RDX: 000000830c927d90 RSI: 000000000000d33a RDI: 00041965ba87a734
[   97.339144] RBP: ffff9d845cce1028 R08: 00000000005b6db7 R09: 0000000000000000
[   97.346276] R10: 0000000000000000 R11: ffffa57040003ff8 R12: 0000000000000065
[   97.353401] R13: 0000000004027541 R14: ffff9d845cce1d58 R15: 0000000000000000
[   97.360525] FS:  0000000000000000(0000) GS:ffff9d845fc00000(0000) knlGS:0000000000000000
[   97.368603] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   97.374340] CR2: 0000000000000018 CR3: 000000011c956000 CR4: 00000000000006f0
[   97.381464] Kernel panic - not syncing: Fatal exception in interrupt
[   97.387810] Kernel Offset: 0x39c00000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[   97.398580] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

x86_64-pc-linux-gnu-addr2line -e vmlinux zoran_irq+0x16f/0x2e0
/usr/src/linux-next/arch/x86/include/asm/processor.h:443

I have no more clue for the moment.
