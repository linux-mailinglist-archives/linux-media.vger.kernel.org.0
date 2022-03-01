Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19E44C7FE8
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 02:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiCABCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 20:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiCABCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 20:02:03 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5854DEC5
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 17:01:23 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id qx21so28271435ejb.13
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 17:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ud5/y/EBwvp8QN7vw5ZxaiWuDsWQaCGba2UHh4N4mec=;
        b=QDNLH8KOj2N5elfQIiFc9ZMVPG667ughU6MItd4VPmNt6fV069Cvzy3GNDu1LboIOU
         /ukem7qn980/nnuqsEKTwz+sJAAGQSBr/OuNtNkm7jqBwkXZFdDq4KuXeUYSVdjS5Ygf
         UbLkNglYiw3uAvK1jhMlolPsp6Bm5sW2kE0eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ud5/y/EBwvp8QN7vw5ZxaiWuDsWQaCGba2UHh4N4mec=;
        b=uMAeBtbdhhvEMIfM893n0VjTqckQB1+4sq0DqGmG8Q0YIsBgNSK6oiOei8KF0XCMge
         PzAkEDm5pOWY4AI7lCbXsUa5azQ12NI9F+Tj5wgx/bJLwiVyZkejg3V/KLri1owH7Ku8
         qDo6XlqRfkZcMbM09Am0b++wbm4yQB0HGMjqMIy3m/X7KiGnckL1hMgDv+d3sJrlOWFp
         k0e9zODWakEo7X7U4drTlzwOufl14DPptor8vw6YSG5UpH8WCVYbOmtzZnf6XGypjP8m
         uzh81AOUYmyUB9Vm2nOXsiu0H9sLwrZEbHQFnOqOxoYVkjeS4LgJFjiDk80E+savKgCK
         bPdQ==
X-Gm-Message-State: AOAM5300nnuoaeJMsXWbQj1Zj5DiHjE10Zof3GpQ6eS+Z8DtvOl/vp6n
        l5qDNcr8rWlP53iEdHc5G1mXLWQUEkqIdduVRgA=
X-Google-Smtp-Source: ABdhPJy1mmo1WO7/xawOcKduvMzGC+C86F9MQwO9DqJJAoA5NvuX1QUYPFeWNjawjCJyZ3QHp+BZkA==
X-Received: by 2002:a17:906:66cb:b0:6cf:e4f7:9504 with SMTP id k11-20020a17090666cb00b006cfe4f79504mr17300582ejp.142.1646096482234;
        Mon, 28 Feb 2022 17:01:22 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id q9-20020a170906770900b006d20acf7e2bsm4779594ejm.200.2022.02.28.17.01.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 17:01:21 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id d3so18055504wrf.1
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 17:01:21 -0800 (PST)
X-Received: by 2002:a2e:aaa2:0:b0:244:bf42:3e6e with SMTP id
 bj34-20020a2eaaa2000000b00244bf423e6emr16240083ljb.176.1646096101617; Mon, 28
 Feb 2022 16:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com> <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org> <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <20220301003059.GE614@gate.crashing.org>
In-Reply-To: <20220301003059.GE614@gate.crashing.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Feb 2022 16:54:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLYqYcw0xv65xrLSR7KDpS_6M+S9737m6NQorHGWsXYQ@mail.gmail.com>
Message-ID: <CAHk-=wgLYqYcw0xv65xrLSR7KDpS_6M+S9737m6NQorHGWsXYQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mike Rapoport <rppt@kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, linux1394-devel@lists.sourceforge.net,
        drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        intel-wired-lan@lists.osuosl.org,
        kgdb-bugreport@lists.sourceforge.net,
        bcm-kernel-feedback-list@broadcom.com,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergman <arnd@arndb.de>,
        Linux PM <linux-pm@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        dma <dmaengine@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        v9fs-developer@lists.sourceforge.net,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sgx@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
        samba-technical@lists.samba.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux F2FS Dev Mailing List 
        <linux-f2fs-devel@lists.sourceforge.net>,
        tipc-discussion@lists.sourceforge.net,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 28, 2022 at 4:38 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> In C its scope is the rest of the declaration and the entire loop, not
> anything after it.  This was the same in C++98 already, btw (but in
> pre-standard versions of C++ things were like you remember, yes, and it
> was painful).

Yeah, the original C++ model was just unadulterated garbage, with no
excuse for it, and the scope was not the loop, but the block the loop
existed in.

That would never have been acceptable for the kernel - it's basically
just an even uglier version of "put variable declarations in the
middle of code" (and we use "-Wdeclaration-after-statement" to
disallow that for kernel code, although apparently some of our user
space tooling code doesn't enforce or follow that rule).

The actual C99 version is the sane one which actually makes it easier
and clearer to have loop iterators that are clearly just in loop
scope.

That's a good idea in general, and I have wanted to start using that
in the kernel even aside from some of the loop construct macros.
Because putting variables in natural minimal scope is a GoodThing(tm).

Of course, we shouldn't go crazy with it. Even after we do that
-std=gnu11 thing, we'll have backports to worry about. And it's not
clear that we necessarily want to backport that gnu11 thing - since
people who run old stable kernels also may be still using those really
old compilers...

            Linus
