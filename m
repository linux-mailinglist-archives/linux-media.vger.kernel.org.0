Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65DED43E027
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 13:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhJ1Lou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 07:44:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229578AbhJ1Lou (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 07:44:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED29460724;
        Thu, 28 Oct 2021 11:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635421343;
        bh=pkmWIMcNmEWqPBFrT8Exd3AVUPRq8ienqiDveCIorP4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OL+HditF+kCwCiaWOHM//XW4dC/8CUwZUF2h8vs21o3wtADOxUFWiS7Z1TwLMfQYk
         mW1Rxf+wEJnxJ0qKvE/cC+pAfg3iqJQtLFBjoALnZFqBXaNwBB3RozyEoupB9dH8iU
         DNcoMT8lySdX0ZG3J1ES1TinBsXsSpOAOjLvL+sI+t0dxgzbqZT8TAQEUQSp0N2Gz1
         eKadwd2i+AqaSq9LTTEmC7z6hZXtBIR/h7kvpAkE1ClBkEEbap3tVCSY3VFOETK91D
         CEECoG08B2MlWJcNzcRws7I30sXkGziwdbRmNdo5eB2v9gmdeZol6laC7WC7nbo4LE
         rr+5lwYE6cSJw==
Date:   Thu, 28 Oct 2021 12:42:17 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nable <nable.maininbox@googlemail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: [PATCH 14/17] media: atomisp: pci: Remove remaining instance of
 call to trace_printk
Message-ID: <20211028124217.394cc49b@sal.lan>
In-Reply-To: <c55212feff3212c27360f2c49f5c4023a95f5b7c.camel@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <20211017161958.44351-15-kitakar@gmail.com>
        <20211026093224.6c7f7fbf@sal.lan>
        <c55212feff3212c27360f2c49f5c4023a95f5b7c.camel@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 28 Oct 2021 18:34:47 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> <Adding back people/list to Cc>
> 
> On Tue, 2021-10-26 at 09:32 +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 18 Oct 2021 01:19:54 +0900
> > Tsuchiya Yuto <kitakar@gmail.com> escreveu:
> >   
> > > (patch based on intel-aero kernel patch:
> > >  https://github.com/intel-aero/meta-intel-aero-base/commit/26fc9fe5030b63bc9dcf0b5f32981948911ca272)
> > > 
> > > Here is the original commit message from the aforementioned patch:
> > > 
> > > 	From 26fc9fe5030b63bc9dcf0b5f32981948911ca272 Mon Sep 17 00:00:00 2001
> > > 	From: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 	Date: Fri, 7 Jul 2017 14:23:53 -0700
> > > 	Subject: [PATCH] linux-yocto: Remove remaining instance of call to
> > > 	 trace_printk
> > > 
> > > 	It's not sufficient to leave trace_printk() out of "normal call chains" since
> > > 	the way trace infrastructure works is that it will allocate the trace_printk
> > > 	buffers if the symbol is there (by using a separate section for the function
> > > 	and checking if __start_* and __stop_* symbols are different.
> > > 
> > > 	Therefore, even if the default value for the param tells the module to use
> > > 	printk(), just the fact that it can be changed to trace_printk() means the
> > > 	initialization code will be called.
> > > 
> > > The trace_printk() was replaced by pr_info() on commit 3d81099c75a6
> > > ("media: atomisp: Replace trace_printk by pr_info") for the upstreamed
> > > atomisp, too. However, as the aforementioned commit message says, there
> > > is still a remaining instance. This causes the "trace_printk() being
> > > used" kernel warning message to still appear on the first driver load.
> > > 
> > > Based on the aforementioned patch, this patch removes the call to
> > > ftrace_vprintk(). This removes that kernel warning.
> > > 
> > > In addition to this, this patch also removes the following now unused
> > > things:
> > > 
> > >     - now empty atomisp_css2_dbg_ftrace_print()
> > >     - trace_printk option from dbg_func kernel parameter  
> > 
> > This patch is incomplete. I mean, if the idea is to drop support for
> > trace, dbg_func parameter becomes obsolete, and a lot of code can be
> > dropped/cleaned.  
> 
> I left __set_css_print_env() and dbg_func module parameter intentionally
> because there is still the option "non", which means do not use any
> function to log. Yes, I don't know if it's really useful since the module
> parameter dbg_level=0 (this is the default value) means no debug output.
> 
> However, they (those who originally wrote atomisp) added the option "non"
> anyway. So, I thought there is a use case for this.
> 
> If everyone thinks it's useless, I can additionally remove them. In this
> case, indeed a lot of code may be additionally removed (I haven't checked
> yet).
> 
> > That's said, I don't see a good reason to drop it, at least while
> > this driver is not 100%.  
> 
> This driver is not 100% yet, but at least it can capture images now
> (at least on ISP2401). So, I thought this is the right time to remove
> it when I wrote this patch.
> 
> But yes, we don't necessarily have to drop it. The other idea is hide
> it by default using a macro, and still can be enabled by manual edit.
> Here is the example from drivers/usb/dwc2/core.h:
> 
>         49-/*
>         50- * Suggested defines for tracers:
>         51- * - no_printk:    Disable tracing
>         52- * - pr_info:      Print this info to the console
>         53- * - trace_printk: Print this info to trace buffer (good for verbose logging)
>         54- */
>         55-
>         56:#define DWC2_TRACE_SCHEDULER		no_printk
>         57:#define DWC2_TRACE_SCHEDULER_VB		no_printk
>         58-
>         59-/* Detailed scheduler tracing, but won't overwhelm console */
>         60-#define dwc2_sch_dbg(hsotg, fmt, ...)					\
>         61:	DWC2_TRACE_SCHEDULER(pr_fmt("%s: SCH: " fmt),			\
>         62-			     dev_name(hsotg->dev), ##__VA_ARGS__)
>         63-
>         64-/* Verbose scheduler tracing */
>         65-#define dwc2_sch_vdbg(hsotg, fmt, ...)					\
>         66:	DWC2_TRACE_SCHEDULER_VB(pr_fmt("%s: SCH: " fmt),		\
>         67-				dev_name(hsotg->dev), ##__VA_ARGS__)
> 
> with using pr_info by default for atomisp (the parameter dbg_level is
> 0 by default, so still no output by default). If this sounds OK, I'd
> like to try this way.

Let's just postpone this change. It sounds a little early to start
cleaning up debug stuff. This can be done any time later, but let's
first test it on our devices and ensure that it is stable enough.

Regards,
Mauro

> 
> > > 
> > > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > > ---
> > >  .../staging/media/atomisp/pci/atomisp_compat_css20.c   | 10 ----------
> > >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c       |  4 ++--
> > >  2 files changed, 2 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> > > index 99a632f33d2d..d81d55c6f1fa 100644
> > > --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> > > +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> > > @@ -159,13 +159,6 @@ static void atomisp_css2_hw_load(hrt_address addr, void *to, uint32_t n)
> > >  	spin_unlock_irqrestore(&mmio_lock, flags);
> > >  }
> > >  
> > > -static int  __printf(1, 0) atomisp_css2_dbg_ftrace_print(const char *fmt,
> > > -							 va_list args)
> > > -{
> > > -	ftrace_vprintk(fmt, args);
> > > -	return 0;
> > > -}
> > > -
> > >  static int  __printf(1, 0) atomisp_vprintk(const char *fmt, va_list args)
> > >  {
> > >  	vprintk(fmt, args);
> > > @@ -860,9 +853,6 @@ static inline int __set_css_print_env(struct atomisp_device *isp, int opt)
> > >  	if (opt == 0)
> > >  		isp->css_env.isp_css_env.print_env.debug_print = NULL;
> > >  	else if (opt == 1)
> > > -		isp->css_env.isp_css_env.print_env.debug_print =
> > > -		    atomisp_css2_dbg_ftrace_print;
> > > -	else if (opt == 2)
> > >  		isp->css_env.isp_css_env.print_env.debug_print = atomisp_vprintk;
> > >  	else
> > >  		ret = -EINVAL;
> > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > index f5362554638e..720963156d24 100644
> > > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > > @@ -87,10 +87,10 @@ module_param(dbg_level, int, 0644);
> > >  MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
> > >  
> > >  /* log function switch */
> > > -int dbg_func = 2;
> > > +int dbg_func = 1;
> > >  module_param(dbg_func, int, 0644);
> > >  MODULE_PARM_DESC(dbg_func,
> > > -		 "log function switch non/trace_printk/printk (default:printk)");
> > > +		 "log function switch non/printk (default:printk)");
> > >  
> > >  int mipicsi_flag;
> > >  module_param(mipicsi_flag, int, 0644);  
> 
> 
