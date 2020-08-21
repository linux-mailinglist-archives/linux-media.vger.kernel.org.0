Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C1A24CAEB
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 04:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgHUCma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 22:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgHUCm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 22:42:29 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFD0C061385
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 19:42:28 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id v20so140634ual.4
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 19:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KRcYINGeMrkJsnhAghPntwftY8YIQTJq9q8O02Dazyc=;
        b=Kb+OKV7DQOGsISDsb7ycGgBlHZrAF4j+ubIx9mrQK2Af0qCfrWhkHaXe9SDOd6C2Wz
         xwlxyuo8RO6ENNuOn6U98HAigUM7CS6hiMIUGJkmnwijoXvc/kFLN/oUVAHbRcuhdUfs
         SObv7Y3Cbn1hrzcGDCUIrUz42utYsodAo4bhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KRcYINGeMrkJsnhAghPntwftY8YIQTJq9q8O02Dazyc=;
        b=NSjLiABq1+Y51FDuMgStPVUgVrdVF8bvOqF0IUuQ/O9bduHPLB4wZAGIJlFX5iSzeA
         tySqPGYfgwV03jXU+svCwf+TtyGz1Uu4WvJUHHy/0YMwJ7AlPuaAn1dyf3lCIwbbkBNV
         P2RRbRekm2pO+gmPwRGgJkX6uWq4u+/WIbFrN/bUwaiIH/Yb2u4+syCIpWXkT+rkqRa4
         DMVnfRPXrOlyiemQWGzEHOXt5eAjtN/38i+aqas7JOvm7jnYJNbpnOotOoeWOEwkpKYh
         0IgFir4Xu7YpvS4ATlWn+98MfYDTBWyOVjr0IcaQ62IjMXUXDzjGZvx8yUMh2UzS/WyY
         oMqA==
X-Gm-Message-State: AOAM5303KkLQi8a7bRMzbLvO6PDR/W3JetrxCtmcT60Td1Wke6JZGXlT
        APogfmuUk2iBNFD7/pOt029vHTTDRz78flsn9XAJ8g==
X-Google-Smtp-Source: ABdhPJwQSw+Mu7CDu/qPHEFFWNOTIiJKWxzRL5Kpq8hObaORvbMqMUkA/5RlPy0vT3897R9VKdnBNAYTanM1LbNkPrA=
X-Received: by 2002:ab0:41:: with SMTP id 59mr392357uai.40.1597977745886; Thu,
 20 Aug 2020 19:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
 <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
 <20200820102347.15d2f610@oasis.local.home> <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
 <20200820203601.4f70bf98@oasis.local.home> <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
 <20200820215701.667f02b2@oasis.local.home> <f9d33bcaa2eda680752205d3c3690cb6bc421730.camel@perches.com>
In-Reply-To: <f9d33bcaa2eda680752205d3c3690cb6bc421730.camel@perches.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 21 Aug 2020 10:42:14 +0800
Message-ID: <CANMq1KDYBbtrrCw6YUeoAPeHyet3L7qM3di9zmULDDRaQR_fZA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
To:     Joe Perches <joe@perches.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Fri, Aug 21, 2020 at 10:36 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-08-20 at 21:57 -0400, Steven Rostedt wrote:
> > On Fri, 21 Aug 2020 09:39:19 +0800
> > Nicolas Boichat <drinkcat@chromium.org> wrote:
> []
> > > Some other approaches/ideas:
> > >  1. Filter all lkml messages that contain trace_printk. Already found
> > > 1 instance, and I can easily reply to those with a semi-canned answer,
> > > if I remember to check that filter regularly (not sustainable in the
> > > long run...).
> >
> > Added Joe Perches to the thread.
> >
> > We can update checkpatch.pl to complain about a trace_printk() that it
> > finds in the added code.
>
> Why?
>
> I don't see much value in a trace_printk checkpatch warning.
> tracing is still dependent on CONFIG_TRACING otherwise
> trace_printk is an if (0)
>
> ELI5 please.

This is my "new" canned answer to this:

Please do not use trace_printk in production code [1,2], it is only
meant for debug use. Consider using trace events, or dev_dbg.
[1] https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace.c#L3158
[2] https://elixir.bootlin.com/linux/v5.8/source/include/linux/kernel.h#L766

I also had arguments in patch 2/3 notes:

There's at least 3 reasons that I can come up with:
 1. trace_printk introduces some overhead. [some users, e.g.
Android/Chrome OS, want CONFIG_TRACING but _not_ that extra overhead]
 2. If the kernel keeps adding always-enabled trace_printk, it will be
much harder for developers to make use of trace_printk for debugging.
 3. People may assume that trace_printk is for debugging only, and may
accidentally output sensitive data (theoretical at this stage).

(we'll need to summarize that somehow if we want to add to checkpatch.pl)
