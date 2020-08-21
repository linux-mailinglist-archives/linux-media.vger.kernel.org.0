Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A579F24D4D5
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 14:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgHUMVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 08:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgHUMUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 08:20:12 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7C2C061388
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 05:20:11 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id b26so693808vsa.13
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=52w1cJUaQ9YanpUGNy0nDzv1xTgiDNv65mHDcwVGT/k=;
        b=ma8DyBTio5H7kC0GIQ2hYvDq/OC2i1mxC0vGTCsokkwIOce8mzt3dmwWQ2pc7uHqhw
         GQjt7ejyzZqestweM11fLlNXDcO8dJAf767AZFt9DXZcnqF9FCaUBsu+nP3DBFbWA/8H
         m9IprTGaVujoL/pcNzqE6hjgEPBKQmEx73Tck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=52w1cJUaQ9YanpUGNy0nDzv1xTgiDNv65mHDcwVGT/k=;
        b=bxxb2+ukU/7apxd5G4JA4SukIuRDPzJgEim0JewpUgr5qKaLQrLjKiCtgApTSTI1Kx
         Mrq4lZ7so5D+hKCurgCS19GtSXwuEMNQrYnc5flJexaXUPMHLXfJfDVnmqDcSqGXZMCF
         v7ur6QxYMwpr//9ngLgtLmcA92fvmUgzwnI3d7X6U60A6adyyRSFVuP5BH2GsmP9+XhV
         c1uLzTlQ40xr3B+Y/1H6LK0eWCGdfVDu97eQd52pj43HZfHgN3rr53qsyq6z7EAUCdBU
         0u8UnnsuR6Wl9LsLjRpOLvE3OmaAgjvUHezG6udH8B5gtG6dnipfvChARqnLmozD1cQY
         KWfA==
X-Gm-Message-State: AOAM5329KR0RlHLCOWXujUpZuDlQ2VHc0eEGBbx8WC7I/YVf3lPeGJri
        4rSuvaInYt02acx9q37OKeuA+t2m8fGNYcij6yQ5lw==
X-Google-Smtp-Source: ABdhPJx5f1sQLnbRNjOhBQQZgrQyMKznEcXj7NlHlGGfOAbWXzvtJyasjXRpR5CO9AqugLoE5SfHzGUP5k61w0/lFFA=
X-Received: by 2002:a05:6102:1ca:: with SMTP id s10mr1289867vsq.14.1598012403767;
 Fri, 21 Aug 2020 05:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
 <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
 <20200820102347.15d2f610@oasis.local.home> <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home> <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
 <20200820215701.667f02b2@oasis.local.home> <CANMq1KCpV+RKCqHsK-=Xeb+Vq28qdnBVF51rcga7m9-xjqNSCg@mail.gmail.com>
 <20200820230105.1f9651b7@oasis.local.home>
In-Reply-To: <20200820230105.1f9651b7@oasis.local.home>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 21 Aug 2020 20:19:52 +0800
Message-ID: <CANMq1KAuB4fCg50=G9ed_ALaD7O8=3PWQQMZNit52As-r7to4Q@mail.gmail.com>
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
        Guenter Roeck <groeck@chromium.org>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 21, 2020 at 11:01 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 21 Aug 2020 10:39:02 +0800
> Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> > I'm not sure how that helps? I mean, the use case you have in mind is
> > somebody reusing a distro/random config and not being able to use
> > trace_printk, right? If that config has CONFIG_DISABLE_TRACE_PRINTK=y,
> > then the developer will still need to flip that back.
> >
> > Note that the option I'm added has default=y (_allow_ trace_printk),
> > so I don't think default y or default n really matters?
>
> Ideally, the production system doesn't have it set. It only sets it to
> make sure that it's clean before sending out. But then it can add it
> back before production. Yeah, it's pretty much cutting hairs between
> the two. I don't like either one.
>
> Really, if you are worried about this, just add your patch to your
> local tree. I'm not sure this is something that can be fixed upstream.
>
> Another idea is to add something like below, and build with:
>
>  make CHECK_TRACE_PRINT=1
>
> This way it is a build command line option that causes the build to
> fail if trace_printk() is added.
>
> This way production systems can add this to make sure their kernels are
> free of trace_printk() but it doesn't affect the config that is used.

(for some reason I missed this reply in the thread ,-P)

Thanks, that's quite a nice idea, I'll try it out (not sure if we
still want that build_assert trick). We'd lose the automatic detection
of issues through randconfig kernel test robot, but hopefully if
enough distros enable it they'll start filing reports about issues.

And maybe we can use that in combination with a checkpatch.pl check.

(it turns out I'm having a hard time finding a good spot for this test
in our Chrome OS build infra, so an upstream-friendly solution would
be much better ,-P)

>
> -- Steve
>
> [ Not even compiled tested! ]
>
> diff --git a/Makefile b/Makefile
> index 2057c92a6205..5714a738879d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -91,6 +91,13 @@ else
>    Q = @
>  endif
>
> +ifeq ("$(origin CHECK_TRACE_PRINTK)", "command line")
> +  KBUILD_NO_TRACE_PRINTK = $(NO_TRACE_PRINTK)
> +endif
> +ifndef KBUILD_NO_TRACE_PRINTK
> +  KBUILD_NO_TRACE_PRINTK = 0
> +endif
> +
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
>
> @@ -839,6 +846,10 @@ KBUILD_AFLAGS      += -gz=zlib
>  KBUILD_LDFLAGS += --compress-debug-sections=zlib
>  endif
>
> +ifeq ($(KBUILD_NO_TRACE_PRINTK),1)
> +KBUILD_CFLAGS += -DNO_TRACE_PRINTK
> +endif
> +
>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
>  export DEBUG_CFLAGS
>
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 500def620d8f..bee432547d26 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -680,11 +680,14 @@ extern void tracing_stop(void);
>  static inline __printf(1, 2)
>  void ____trace_printk_check_format(const char *fmt, ...)
>  {
> +#ifdef NO_TRACE_PRINTK
> +       extern void __no_trace_printk_on_build(void);
> +       __no_trace_printk_on_build();
> +#endif
>  }
>  #define __trace_printk_check_format(fmt, args...)                      \
>  do {                                                                   \
> -       if (0)                                                          \
> -               ____trace_printk_check_format(fmt, ##args);             \
> +       ____trace_printk_check_format(fmt, ##args);                     \
>  } while (0)
>
>  /**
