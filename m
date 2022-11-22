Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B476344D0
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 20:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbiKVTsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 14:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbiKVTsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 14:48:19 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3DD58039
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:48:17 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id kt23so38137613ejc.7
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVbDlvvtZ6kOnIDHKIHd3lgjSqvnp2Onmrr/hjcCiKI=;
        b=ZpmZGbA0yEeAQcmw1YRD+tH2k3dpJ2h+GQqA2nTW/+AmrJijfthJJ1JBDQ4b17naWX
         Gc/gxxKP+B5FUvV3VGk2W0G9ETX/IIVaM8yBzDUKEelLWQEv8b4KysweuE9QpJ6XQVSd
         wJVG2oDQ+oPdHYZz0NjKMihQlfjjhbkia8/Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVbDlvvtZ6kOnIDHKIHd3lgjSqvnp2Onmrr/hjcCiKI=;
        b=5bpb+9y9fb40dtZ7IGR2Vf45IW1hACqQj3pwYPV0IDpPLKQAlFJEFH8qh+fuE5fYt+
         KERPXFyMSnNOvaM3lxLZ1z2GtNjD9w4Wrx5fUez/2UrKsXapQODzEF83yoVTxb7nXkh2
         GGEYlyz8NAlYIG0KHRlXM4CQ2Jrjtnt1+TYtXZoQ+M25WQpGpqxC4R/GqmYgnArPPG4C
         mMm5g9eqhBMs8OOfbIt12IYA5eswtiBZku+Sdyb9tb7NX64tiWIchOM3KmYzrU6zMqIA
         6sP39BO1kIu8Z14eg6e35iJwnqd3Iqm/9W276LN9u6lkRZNwuWvv5pIMxUirB8/FlfBI
         7Odg==
X-Gm-Message-State: ANoB5pkPpsitNuY/lUVvg713Lf12WxYSBXmzqHPYUN9r1SQSqnFHogml
        +yw7ceBEw6umGihuwfmha+eQ074DH/IKlyjbb5sefg==
X-Google-Smtp-Source: AA0mqf7G2K2KCHsUYtNjGbSQRIe5kptdRvJjIPo2u6XacsktiIWjTo1Gtdxekg6+ahn0rSaoqbcgPDkabc4jvu8znZE=
X-Received: by 2002:a17:906:d7b8:b0:79f:9ff6:6576 with SMTP id
 pk24-20020a170906d7b800b0079f9ff66576mr20147812ejb.414.1669146496324; Tue, 22
 Nov 2022 11:48:16 -0800 (PST)
MIME-Version: 1.0
References: <00000000000021719805d692e035@google.com> <000000000000cbce8405eded1951@google.com>
In-Reply-To: <000000000000cbce8405eded1951@google.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 22 Nov 2022 20:48:05 +0100
Message-ID: <CAKMK7uFj2oouRmLyTZH5YLsk_V8FE=XUR-o0QkoMk1macyPDOg@mail.gmail.com>
Subject: Re: [syzbot] inconsistent lock state in sync_info_debugfs_show
To:     syzbot <syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com>
Cc:     bp@alien8.de, christian.koenig@amd.com,
        dri-devel@lists.freedesktop.org, gustavo@padovan.org,
        hdanton@sina.com, hpa@zytor.com, jmattson@google.com,
        joro@8bytes.org, kvm@vger.kernel.org,
        linaro-mm-sig-bounces@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mark.rutland@arm.com,
        mingo@redhat.com, pbonzini@redhat.com, peterz@infradead.org,
        seanjc@google.com, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        vkuznets@redhat.com, wanpengli@tencent.com, will@kernel.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 20 Nov 2022 at 21:51, syzbot
<syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit 997acaf6b4b59c6a9c259740312a69ea549cc684
> Author: Mark Rutland <mark.rutland@arm.com>
> Date:   Mon Jan 11 15:37:07 2021 +0000
>
>     lockdep: report broken irq restoration

Ok this looks funny. I'm pretty sure the code in
drivers/dma-buf/sw_sync.c around sync_timeline_fence_lock is correct.
And we don't do anything that this patch claims to catch, it's all
just plain spin_lock_irq and spin_lock_irqsave usage. Only thing that
crossed my mind here is that maybe lockdep somehow ends up with two
different keys for the same spinlock? I'm really confused ...
-Daniel

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=115b350d880000
> start commit:   84368d882b96 Merge tag 'soc-fixes-6.1-3' of git://git.kern..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=135b350d880000
> console output: https://syzkaller.appspot.com/x/log.txt?x=155b350d880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6f4e5e9899396248
> dashboard link: https://syzkaller.appspot.com/bug?extid=007bfe0f3330f6e1e7d1
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164376f9880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16cf0965880000
>
> Reported-by: syzbot+007bfe0f3330f6e1e7d1@syzkaller.appspotmail.com
> Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
