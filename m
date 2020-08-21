Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FE224D51D
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgHUMh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgHUMh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:37:27 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8CCC061385
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 05:37:27 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e14so726668vsa.9
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HUgN6ieJhIl8uII5WpVu/u5z15uJplqpBcG4NHNK9Tk=;
        b=B+XDozwpX0mgDxmJ6B/TSWbBDUbxlXICDWzTZ0j1JZrwcVr7nlDnFEkAXLfjy9/mv8
         htZLil76tPTHeIHrsH8uDlSs0MDekxxkQFL5tatwS+M8PXeS8Las4CgSNBfkRPfZZY5n
         Db2XXy4qs3y2Ha+4PSmAEzBhK26XXt/hZh7Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HUgN6ieJhIl8uII5WpVu/u5z15uJplqpBcG4NHNK9Tk=;
        b=gzMbWZR1PKaExPw47WekkaT6X4R4RGDpm5LR4UEuHrcMxm95XeFc1Zz556NJWTHHGm
         VNSH8qYOIMcTzOtGNNt8VqHM8WIXSqnr1VHAw17JNcYW8pbuWu99kv1PxiTvs6nXrscc
         gx4dc5aa8TluytOsuePTZM34ZB4RTCofwfXZSXzWiq4V2UkxBUB8Rx1Grql/l74zZ2Sh
         ypkXxM9b2jSjZO0uiYx1mio/ovawE+9MW6vgaOxeKd8aU3XlYagl1vimxnG+9Xr30VEf
         X7kvc6JDK0ozVxR6nL59lBw8exdq0YxwIIRie+mGk5ZCi9I6MeB0D98dL3J/0lSOzIQ/
         3fYA==
X-Gm-Message-State: AOAM532IRUP2t1UmhSt4LqVoOeu85wZXWOTWMEcb5DkHIQHdZ3BDTixK
        Tf8CiOQ+TJixalAps4d1HMxG/pycdxEZ7JxZ5yrFkQ==
X-Google-Smtp-Source: ABdhPJygLjeX9qF2zIlcXZqIhRvgUeRfApyD41pRd420Ijd4idtK0rAzzpbRlTzYydU7YTYMB4F1QwLFqPlRNMYVFDE=
X-Received: by 2002:a67:f787:: with SMTP id j7mr1403877vso.79.1598013446831;
 Fri, 21 Aug 2020 05:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
 <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
 <20200820102347.15d2f610@oasis.local.home> <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home> <21fae92da07c4566ba4eed3b5e1bce2d@AcuMS.aculab.com>
 <CANMq1KBvNqcdCsuDGGygYqS5+ZBw+qSVXTC+WWNycypG2=BRMQ@mail.gmail.com>
 <898c56e4b7ef4c3da1d634fdef5a8898@AcuMS.aculab.com> <CANMq1KDT+uecuqxXRsxv9-sMv0sGXk6ZQ3hWv0aK34dfzaJXyg@mail.gmail.com>
 <6c5249afad274ce49e643d9b05706e3a@AcuMS.aculab.com>
In-Reply-To: <6c5249afad274ce49e643d9b05706e3a@AcuMS.aculab.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 21 Aug 2020 20:37:15 +0800
Message-ID: <CANMq1KCc-KObgJTe0vWXGHcsffMD=41VMe=GjtsKG0iobJES0Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
To:     David Laight <David.Laight@aculab.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 21, 2020 at 8:18 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Nicolas Boichat
> > Sent: 21 August 2020 13:07
> ...
> > > You might also want a #define that can set temporarily
> > > to enable traces in a specific file/module even though
> > > CONFIG_TRACE=n.
> >
> > I don't understand how traces are supposed to work with CONFIG_TRACE=n?
>
> Probably because I meant something different :-)
>
> You want the kernel built so that there are no (expanded)
> calls to trace_printf() but with support for modules that
> contain them.
>
> Then I can load a module into a distro kernel that
> contains trace_printf() calls for debug testing.

Gotcha. I think it already works this way ,-)

So if you have CONFIG_TRACE=y, but no trace_printk in your
vmlinux/kernel, no memory is used, and no warning splat
(https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace.c#L3160)
is displayed. But then when you load a module with trace_printk, the
buffers are allocated and the warning splat is printed.

The magic is here:
https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace_printk.c#L53

My option wouldn't really change that. I mean, if you have
CONFIG_TRACING_ALLOW_PRINTK=n when you compile your module, it'd fail
at build time, but if you set it to =y, your module could happily
build and load (with the big warning splat), no matter how you built
your kernel (I mean, you still need CONFIG_TRACE=y, but
CONFIG_TRACING_ALLOW_PRINTK doesn't matter).

> Which is why I was suggesting a config option that
> only rand-config builds would ever set that would
> cause the calls to generate compile-time errors.

I think I already answered that one above. We'd want that config
option enabled on Chrome OS and we're not a rand-config build (I mean,
we're a very carefully selected random config ,-P).

Thanks,

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
