Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8980D24CB1E
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 05:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgHUDFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 23:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:37760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbgHUDFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 23:05:03 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EDEF20732;
        Fri, 21 Aug 2020 03:05:01 +0000 (UTC)
Date:   Thu, 20 Aug 2020 23:04:59 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Joe Perches <joe@perches.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
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
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
Message-ID: <20200820230459.2471c892@oasis.local.home>
In-Reply-To: <c0ca85e475d1e761431b2c10ade803451c74178f.camel@perches.com>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
        <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
        <20200820102347.15d2f610@oasis.local.home>
        <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
        <20200820203601.4f70bf98@oasis.local.home>
        <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
        <20200820215701.667f02b2@oasis.local.home>
        <f9d33bcaa2eda680752205d3c3690cb6bc421730.camel@perches.com>
        <CANMq1KDYBbtrrCw6YUeoAPeHyet3L7qM3di9zmULDDRaQR_fZA@mail.gmail.com>
        <c0ca85e475d1e761431b2c10ade803451c74178f.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 20 Aug 2020 19:49:59 -0700
Joe Perches <joe@perches.com> wrote:

> Perhaps make trace_printk dependent on #define DEBUG?

This is basically what Nicolas's patch series does in this very patch!

And no, I hate it. We are currently discussing ways of not having to
modify the config in order to allow trace_printk() to be used.

We don't want to burden the developer to take a config, add a bunch of
trace_printks() and find that it's compiled out!

Thus, this is a NAK.

-- Steve


> 
> Something like:
> ---
>  include/linux/kernel.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 500def620d8f..6ca8f958df73 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -717,6 +717,7 @@ do {									\
>   * let gcc optimize the rest.
>   */
>  
> +#ifdef DEBUG
>  #define trace_printk(fmt, ...)				\
>  do {							\
>  	char _______STR[] = __stringify((__VA_ARGS__));	\
> @@ -725,6 +726,12 @@ do {							\
>  	else						\
>  		trace_puts(fmt);			\
>  } while (0)
> +#else
> +#define trace_printk(fmt, ...)						\
> +do {									\
> +	__trace_printk_check_format(fmt, ##args);			\
> +} while (0)
> +#endif
>  
>  #define do_trace_printk(fmt, args...)					\
>  do {									\
> 

