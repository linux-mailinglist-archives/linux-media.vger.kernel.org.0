Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E3D24D24B
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgHUK1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728095AbgHUK1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:27:46 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC61C061386
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:27:46 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id b26so555695vsa.13
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLYcljNGZttH/GCZ/u2OCM/Vr/JknmWHq4l/f3i9MZg=;
        b=ITwgGOpRS/WDjnqmJfAc0eAYsRTBHz8MYA3e73p551BWIzeon7OpZszOJLTMnqlrIT
         JXNmrQBx3msE7pRgDV2Aq6onKkMYxPleGiByxw0RAQT05Oz2LEF3KzLpkGyfm71SheI6
         VIapccfxOLUkzclJScPQVLsL/+V1IfeOqhKrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLYcljNGZttH/GCZ/u2OCM/Vr/JknmWHq4l/f3i9MZg=;
        b=MiTQ0ffX3lOqPcC+p8mEcFwlc40RItRpDgh5Ym/Sq9BARVtbp0EFb1xdbFR0Xx33zn
         GcxHYrPnXt8rxffVd2n/hJdXvCui1UzBi+upGI48oztrGIqSXUWmvenkM8gtqw6Su/bT
         yat9eYfLuM3ADdejd3j7q3WL8uOwlzzBAbPmVQzes050vMGMbcSuHmq0tOFR3+f9pkJS
         ujOt0ZqFVrmIkdf2SHO3H+pkaVe4Z6gJdMzYESB59LNS1wSaLxLsMt5lhvBK2tZcse11
         E5FO01RS6uufANcUeRebx5/cR6FpQ3aGDLXYorad1l/X5yqk0rJS+jM7p21bSHZJTgq8
         wwSw==
X-Gm-Message-State: AOAM532NuCNOuC/cj3b6UiVvC20BhPgUwfh76rmzAcGtOjUoAbTljGZh
        LTTuJctjPYZpt5Y3xNOWV/R9fOAO2dtNPPKNNJe3sQulGDHg3A==
X-Google-Smtp-Source: ABdhPJzgeEmj1+btUeVvJ0qJpS7JekMDK41vyIgXlRUvTCFefre/x6EvGfW/QS1211z99Xg/C3oHrn2EZfOxcIC/q+Q=
X-Received: by 2002:a67:f787:: with SMTP id j7mr1089774vso.79.1598005663199;
 Fri, 21 Aug 2020 03:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
 <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
 <20200820102347.15d2f610@oasis.local.home> <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home> <21fae92da07c4566ba4eed3b5e1bce2d@AcuMS.aculab.com>
In-Reply-To: <21fae92da07c4566ba4eed3b5e1bce2d@AcuMS.aculab.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 21 Aug 2020 18:27:30 +0800
Message-ID: <CANMq1KBvNqcdCsuDGGygYqS5+ZBw+qSVXTC+WWNycypG2=BRMQ@mail.gmail.com>
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

On Fri, Aug 21, 2020 at 4:48 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Steven Rostedt
> > Sent: 21 August 2020 01:36
> > On Fri, 21 Aug 2020 08:13:00 +0800
> > Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > > On Thu, Aug 20, 2020 at 10:23 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > > >
> > > > On Thu, 20 Aug 2020 17:14:12 +0800
> > > > Nicolas Boichat <drinkcat@chromium.org> wrote:
> > > >
> > > > > Technically, we could only initialize the trace_printk buffers
> > > > > when the print env is switched, to avoid the build error and
> > > > > unconditional boot-time warning, but I assume this printing
> > > > > framework will eventually get removed when the driver moves out
> > > > > of staging?
> > > >
> > > > Perhaps this should be converting into a trace event. Look at what bpf
> > > > did for their bpf_trace_printk().
> > > >
> > > > The more I think about it, the less I like this series.
> > >
> > > To make it clear, the primary goal of this series is to get rid of
> > > trace_printk sprinkled in the kernel by making sure some randconfig
> > > builds fail. Since my v2, there already has been one more added (the
> > > one that this patch removes), so I'd like to land 2/3 ASAP to prevent
> > > even more from being added.
> > >
> > > Looking at your reply on 1/3, I think we are aligned on that goal? Is
> > > there some other approach you'd recommend?
> > >
> > > Now, I'm not pretending my fixes are the best possible ones, but I
> > > would much rather have the burden of converting to trace events on the
> > > respective driver maintainers. (btw is there a short
> > > documentation/tutorial that I could link to in these patches, to help
> > > developers understand what is the recommended way now?)
> > >
> >
> > I like the goal, but I guess I never articulated the problem I have
> > with the methodology.
> >
> > trace_printk() is meant to be a debugging tool. Something that people
> > can and do sprinkle all over the kernel to help them find a bug in
> > areas that are called quite often (where printk() is way too slow).
> >
> > The last thing I want them to deal with is adding a trace_printk() with
> > their distro's config (or a config from someone that triggered the bug)
> > only to have the build to fail, because they also need to add a config
> > value.
> >
> > I add to the Cc a few developers I know that use trace_printk() in this
> > fashion. I'd like to hear their view on having to add a config option
> > to make trace_printk work before they test a config that is sent to
> > them.
>
> Is it worth having three compile-time options:
> 1) trace_printk() ignored.

CONFIG_TRACE=n (now)

> 2) trace_printk() enabled.

CONFIG_TRACE=y (now)

> 3) trace_printk() generates a compile time error.

CONFIG_TRACE=y and CONFIG_TRACING_ALLOW_PRINTK=n (my patch)

>
> Normal kernel builds would ignore calls.
> Either a config option or a module option (etc) would enable it.
> A config option that 'rand-config' builds would turn on would
> generate compile-time errors.

Yes, a config option is exactly what my patch 2/2 does. And see
Steven's argument.


>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
