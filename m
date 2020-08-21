Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6D424C993
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 03:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgHUBjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 21:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgHUBjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 21:39:33 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D745DC061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 18:39:32 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id r197so66018vkf.13
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 18:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mYhfQVGQv2L9AAT3zv6RHMzgR14goIa2TqteKXtO4h8=;
        b=l9tUm6ZxQ1aEm0XHA/GfgsZB3oFioaAFFJ1boYEsC8BOPyrxF+wxlxx/W9UNWgQQcu
         KvMW3NbUeZ3qwPdp3kHHW74HKcjNVYLlXOsNoU1kSK+cgIdcEi0Us2Ht9Q/yN3P2oeh9
         RtCNWnfmcQFN68wxrVR0DM8Mp3ePfsnEXgbSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mYhfQVGQv2L9AAT3zv6RHMzgR14goIa2TqteKXtO4h8=;
        b=g9jJ+smfY9T25dof6Sx4U91Kv1e+4JO3m0kKSXVmRh17Ht+qsopIY6CuTUMKF4vTZW
         7ufywqXfAOtmp1vwKjPhZyamlP+4kwrOqnHZDmCaj0oR5TrQ/oms/Dx2UQO/0x3OIkE0
         SmOGsec9TQzCGmv4O7/HCosrY4vg159KoSxWlUqvagUC6XE/dUHuzlppjuQ4HpLbPTi8
         aCPlWtIjJQKb+AsyWGnufkVBZ9FwfOIQveffZg3FLM8Hr9P1x2+uvPG84kI58IbDEyyu
         f+V/bn5u8x+HgIu1KNJoaLdJ9B93AgJQPCzq1mFiywXokNmijfaouj40V+iIhF2fBBHJ
         EiBQ==
X-Gm-Message-State: AOAM531g93xtOtTagvCPnakv/eCV6C94yvgQk+Z6eENWgQQDRxB+iz6l
        2qOQdDX7h6JkqtUQ3rx1dHAZWV/xwKH5vYp1m4drrw==
X-Google-Smtp-Source: ABdhPJz/aNYj42JHobF04JJmjRX/OdD6icUob7+KY1YA18J+hJjOyVRvLsR5WOvo+GEr+rqzX8OGQ4tTMlkUICbpwHA=
X-Received: by 2002:a1f:9bc6:: with SMTP id d189mr426867vke.54.1597973970647;
 Thu, 20 Aug 2020 18:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
 <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
 <20200820102347.15d2f610@oasis.local.home> <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home>
In-Reply-To: <20200820203601.4f70bf98@oasis.local.home>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 21 Aug 2020 09:39:19 +0800
Message-ID: <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org, lkml <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 21, 2020 at 8:36 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 21 Aug 2020 08:13:00 +0800
> Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > On Thu, Aug 20, 2020 at 10:23 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > On Thu, 20 Aug 2020 17:14:12 +0800
> > > Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > > Technically, we could only initialize the trace_printk buffers
> > > > when the print env is switched, to avoid the build error and
> > > > unconditional boot-time warning, but I assume this printing
> > > > framework will eventually get removed when the driver moves out
> > > > of staging?
> > >
> > > Perhaps this should be converting into a trace event. Look at what bpf
> > > did for their bpf_trace_printk().
> > >
> > > The more I think about it, the less I like this series.
> >
> > To make it clear, the primary goal of this series is to get rid of
> > trace_printk sprinkled in the kernel by making sure some randconfig
> > builds fail. Since my v2, there already has been one more added (the
> > one that this patch removes), so I'd like to land 2/3 ASAP to prevent
> > even more from being added.
> >
> > Looking at your reply on 1/3, I think we are aligned on that goal? Is
> > there some other approach you'd recommend?
> >
> > Now, I'm not pretending my fixes are the best possible ones, but I
> > would much rather have the burden of converting to trace events on the
> > respective driver maintainers. (btw is there a short
> > documentation/tutorial that I could link to in these patches, to help
> > developers understand what is the recommended way now?)
> >
>
> I like the goal, but I guess I never articulated the problem I have
> with the methodology.
>
> trace_printk() is meant to be a debugging tool. Something that people
> can and do sprinkle all over the kernel to help them find a bug in
> areas that are called quite often (where printk() is way too slow).
>
> The last thing I want them to deal with is adding a trace_printk() with
> their distro's config (or a config from someone that triggered the bug)
> only to have the build to fail, because they also need to add a config
> value.
>
> I add to the Cc a few developers I know that use trace_printk() in this
> fashion. I'd like to hear their view on having to add a config option
> to make trace_printk work before they test a config that is sent to
> them.

Gotcha, thanks. I have also used trace_printk in the past, as
uncommitted changes (and understand the usefulness ,-)). And in Chrome
OS team here, developers have also raised this concern: how do we make
the developer flow convenient so that we can add trace_printk to our
code for debugging, without having to flip back that config option,
and _yet_ make sure that no trace_printk ever makes it into our
production kernels. We have creative ways of making that work (portage
USE flags and stuff). But I'm not sure about other flows, and your
concern is totally valid...

Some other approaches/ideas:
 1. Filter all lkml messages that contain trace_printk. Already found
1 instance, and I can easily reply to those with a semi-canned answer,
if I remember to check that filter regularly (not sustainable in the
long run...).
 2. Integration into some kernel test robot? (I will not roll my own
for this ,-)) It may be a bit difficult as some debug config options
do enable trace_printk, and that's ok.
 3. In Chromium OS, I can add a unit test (i.e. something outside of
the normal kernel build system), but that'll only catch regressions
downstream (or when we happen to backport patches).

Down the line, #3 catches what I care about the most (Chromium OS
issues: we had production kernels for a few days/weeks showing that
splat on boot), but it'd be nice to have something upstream that
benefits everyone.

Thanks,

>
> -- Steve
