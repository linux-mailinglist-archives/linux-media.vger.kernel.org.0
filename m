Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3260E6CD899
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 13:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjC2Lik (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 07:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjC2Lij (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 07:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D792A4219
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 04:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680089870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q1A1p8PCdF0q1S8wRRCFgu+yVSOSopNJf06rkPHM6d8=;
        b=DQBmmd+ChXxNpOWAZPwywxNNHdofrV3EHBJvbEb0WpO7eabs4j8R0T1m0gjY5y6oVlYrCF
        8k5BD42Dukm2Y9b0G1pRIJBlTb7y4K7BjMTr8s4ELaNvJpKbLXubtgWaAz9lU83diLZO7W
        1inPtZRQSPFCV1RZqtOZ3X2eUGSkKS8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-ThX_gLRRNTiEd0aB80_y3A-1; Wed, 29 Mar 2023 07:37:49 -0400
X-MC-Unique: ThX_gLRRNTiEd0aB80_y3A-1
Received: by mail-lf1-f70.google.com with SMTP id k7-20020ac257c7000000b004db20d1cf7fso5978913lfo.18
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 04:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680089867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1A1p8PCdF0q1S8wRRCFgu+yVSOSopNJf06rkPHM6d8=;
        b=7ahea+evIoYZhhpkVeHOQFqpvsRm57esixUbAkXdRK0NgivPIKUO+T/X2kxcJM0m7e
         HRfcbPQuj89ouZjhhuwS3nzs4vNYyYpTFXWBWloR+mH0kkA9aaRcB945R46E69gjE+4Z
         j3+m1IhNAqcNtJfyplpdVsj0XwrkS/YI8WBJurmRIb8BRG8sWM8gvTrUPAI2gmFJjQi8
         EMs4ysLtsa7qgO8fbKPWSPA0mtwVJ8NE5DRmSyTlkFjQgp0CPoj9SWA+J6IgD+21bsmS
         I2C7rS9XacosU4gtrA8JpUfEqEX+gMvEbUz1pHYEKN6f/DxELKS5d9XdcwluIYHivEFb
         iyjg==
X-Gm-Message-State: AAQBX9c8bDbPpRonpIA90yNQgeJoLpHEayFMzolnZGuHdsTZQVCRKcUL
        uuCtkwFPniBqg7roZdUJVcped9ZvZn0bEk2QRc7d1PzvyOOEG1ITeiLtPy9aCtOqt1xCDyRE3ne
        mSIfSpOVGFcvoaj30Eb5k4bvvUwuwUsU=
X-Received: by 2002:a19:3810:0:b0:4ea:e695:27 with SMTP id f16-20020a193810000000b004eae6950027mr612610lfa.7.1680089867450;
        Wed, 29 Mar 2023 04:37:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350ao9A0bPqAIizKm1+PsgJy0XO+zVMtGXFfqBP1DmwNjqT3QMrBYyUFws0auCPR5nVy52BUk1w==
X-Received: by 2002:a19:3810:0:b0:4ea:e695:27 with SMTP id f16-20020a193810000000b004eae6950027mr612601lfa.7.1680089867092;
        Wed, 29 Mar 2023 04:37:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n6-20020a2e7206000000b00295a96a0f6csm5275487ljc.102.2023.03.29.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 04:37:46 -0700 (PDT)
Message-ID: <fd175fb1-0990-fc7a-8697-45dc0d3e6199@redhat.com>
Date:   Wed, 29 Mar 2023 13:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [regression] Bug 217252 - warning: v4l_enum_fmt+0x125a/0x1c20 -
 Unknown pixelformat 0x00000000
Content-Language: en-US, nl
To:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <dc8e5276-ef88-648f-9f0d-10151ea62c90@leemhuis.info>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dc8e5276-ef88-648f-9f0d-10151ea62c90@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3/29/23 13:25, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developers don't keep an eye on it, I decided to forward it by mail.
> 
> Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
> not CCed them to mails like this.
> 
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217252 :

This is fixed by this (pending) patch:

https://lore.kernel.org/linux-media/20230327091051.404184-1-hpa@redhat.com/

Regards,

Hans




> 
>>  sander44 2023-03-27 12:50:47 UTC
>>
>> Hi Kernel Team,
>>
>> I try today to rebuild kernel 6.1.21, but i notice error with: v4l2-core.
>>
>> [    3.722510] loop17: detected capacity change from 0 to 8
>> [    3.920014] ------------[ cut here ]------------
>> [    3.920016] Unknown pixelformat 0x00000000
>> [    3.920024] WARNING: CPU: 2 PID: 1558 at drivers/media/v4l2-core/v4l2-ioctl.c:1503 v4l_enum_fmt+0x125a/0x1c20
>> [    3.920030] Modules linked in: [...]
>> [    3.920097] CPU: 2 PID: 1558 Comm: pipewire Tainted: G     U             6.1.21-1-lowlatency #2
>> [    3.920099] Hardware name: Intel(R) Client Systems NUC12WSKi7/NUC12WSBi7, BIOS WSADL357.0073.2022.0302.1157 03/02/2022
>> [    3.920100] RIP: 0010:v4l_enum_fmt+0x125a/0x1c20
>> [    3.920102] Code: 48 c7 c3 53 29 ca 83 81 fe 64 76 73 64 0f 84 d7 ef ff ff 41 80 7d 0c 00 0f 85 9e ee ff ff 48 c7 c7 5a 37 ca 83 e8 36 9c 48 ff <0f> 0b 48 c7 c2 76 37 ca 83 49 8d 4d 2c 49 8d 7d 0c be 20 00 00 00
>> [    3.920103] RSP: 0018:ffffa60086907bd8 EFLAGS: 00010246
>> [    3.920104] RAX: 0000000000000000 RBX: ffffffff83ca33fb RCX: 0000000000000000
>> [    3.920105] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> [    3.920106] RBP: ffffa60086907c08 R08: 0000000000000000 R09: 0000000000000000
>> [    3.920106] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>> [    3.920107] R13: ffffa60086907d00 R14: 0000000000000000 R15: ffff98efc87d0018
>> [    3.920107] FS:  00007f7f99022740(0000) GS:ffff98f347680000(0000) knlGS:0000000000000000
>> [    3.920108] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    3.920109] CR2: 00007ffc3f1c3ff8 CR3: 0000000121ab8006 CR4: 0000000000770ee0
>> [    3.920110] PKRU: 55555554
>> [    3.920110] Call Trace:
>> [    3.920111]  <TASK>
>> [    3.920114]  __video_do_ioctl+0x1e7/0x590
>> [    3.920116]  ? __video_do_ioctl+0x1e7/0x590
>> [    3.920118]  video_usercopy+0x25d/0x820
>> [    3.920119]  ? v4l_print_control+0x30/0x30
>> [    3.920121]  video_ioctl2+0x15/0x30
>> [    3.920122]  v4l2_ioctl+0x69/0xb0
>> [    3.920124]  __x64_sys_ioctl+0x9f/0xe0
>> [    3.920126]  do_syscall_64+0x58/0x90
>> [    3.920128]  ? video_ioctl2+0x15/0x30
>> [    3.920129]  ? v4l2_ioctl+0x69/0xb0
>> [    3.920131]  ? exit_to_user_mode_prepare+0x39/0x190
>> [    3.920133]  ? syscall_exit_to_user_mode+0x29/0x50
>> [    3.920135]  ? do_syscall_64+0x67/0x90
>> [    3.920136]  ? syscall_exit_to_user_mode+0x29/0x50
>> [    3.920137]  ? do_syscall_64+0x67/0x90
>> [    3.920138]  ? do_syscall_64+0x67/0x90
>> [    3.920139]  ? do_syscall_64+0x67/0x90
>> [    3.920140]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>> [    3.920142] RIP: 0033:0x7f7f98d1aaff
>> [    3.920143] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>> [    3.920144] RSP: 002b:00007ffe6fcb2810 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> [    3.920145] RAX: ffffffffffffffda RBX: 0000000000000023 RCX: 00007f7f98d1aaff
>> [    3.920146] RDX: 000055f9945f309c RSI: ffffffffc0405602 RDI: 0000000000000023
>> [    3.920147] RBP: 000055f9945f309c R08: 0000000000000000 R09: 0000000000000001
>> [    3.920147] R10: 0000000000000002 R11: 0000000000000246 R12: 00000000ffffffff
>> [    3.920148] R13: 0000000000000000 R14: 000000004000015c R15: 000055f9945f2ec8
>> [    3.920149]  </TASK>
>> [    3.920150] ---[ end trace 0000000000000000 ]---
>>
>> [...]
> 
> See the ticket for more details.
> 
> Note, to my untrained eyes this looked like something that is caused by
> the driver, which afaics is uvcvideo. Hope that wasn't a mistake.
> 
> 
> [TLDR for the rest of this mail: I'm adding this report to the list of
> tracked Linux kernel regressions; the text you find below is based on a
> few templates paragraphs you might have encountered already in similar
> form.]
> 
> BTW, let me use this mail to also add the report to the list of tracked
> regressions to ensure it's doesn't fall through the cracks:
> 
> #regzbot introduced: v5.15..v6.1.21
> https://bugzilla.kernel.org/show_bug.cgi?id=217252
> #regzbot title: media: Unknown pixelformat 0x00000000
> #regzbot ignore-activity
> 
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
> 
> Developers: When fixing the issue, remember to add 'Link:' tags pointing
> to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
> this thread sees some discussion). See page linked in footer for details.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> [1] because bugzilla.kernel.org tells users upon registration their
> "email address will never be displayed to logged out users"
> 

