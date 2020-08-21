Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC07E24C9C4
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 03:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgHUB5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 21:57:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726841AbgHUB5G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 21:57:06 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A987120748;
        Fri, 21 Aug 2020 01:57:03 +0000 (UTC)
Date:   Thu, 20 Aug 2020 21:57:01 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
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
        Guenter Roeck <groeck@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
Message-ID: <20200820215701.667f02b2@oasis.local.home>
In-Reply-To: <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
        <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
        <20200820102347.15d2f610@oasis.local.home>
        <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
        <20200820203601.4f70bf98@oasis.local.home>
        <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 21 Aug 2020 09:39:19 +0800
Nicolas Boichat <drinkcat@chromium.org> wrote:

> On Fri, Aug 21, 2020 at 8:36 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
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
> Gotcha, thanks. I have also used trace_printk in the past, as
> uncommitted changes (and understand the usefulness ,-)). And in Chrome
> OS team here, developers have also raised this concern: how do we make
> the developer flow convenient so that we can add trace_printk to our
> code for debugging, without having to flip back that config option,
> and _yet_ make sure that no trace_printk ever makes it into our
> production kernels. We have creative ways of making that work (portage
> USE flags and stuff). But I'm not sure about other flows, and your
> concern is totally valid...
> 
> Some other approaches/ideas:
>  1. Filter all lkml messages that contain trace_printk. Already found
> 1 instance, and I can easily reply to those with a semi-canned answer,
> if I remember to check that filter regularly (not sustainable in the
> long run...).

Added Joe Perches to the thread.

We can update checkpatch.pl to complain about a trace_printk() that it
finds in the added code.

>  2. Integration into some kernel test robot? (I will not roll my own
> for this ,-)) It may be a bit difficult as some debug config options
> do enable trace_printk, and that's ok.
>  3. In Chromium OS, I can add a unit test (i.e. something outside of
> the normal kernel build system), but that'll only catch regressions
> downstream (or when we happen to backport patches).
> 
> Down the line, #3 catches what I care about the most (Chromium OS
> issues: we had production kernels for a few days/weeks showing that
> splat on boot), but it'd be nice to have something upstream that
> benefits everyone.
> 

What about an opposite config. That is, not have a config to enable it.
But one to disable it. If it is disabled and a trace_printk is found,
it will fail the build. This way your builds will not allow your kernel
to get out the door with one.

#ifdef CONFIG_DISABLE_TRACE_PRINTK
#define trace_printk	__this_function_is_disabled
#endif

?

-- Steve
