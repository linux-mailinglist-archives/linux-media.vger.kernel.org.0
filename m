Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B1C24CAF6
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 04:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgHUCpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 22:45:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgHUCpC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 22:45:02 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D94B20758;
        Fri, 21 Aug 2020 02:45:00 +0000 (UTC)
Date:   Thu, 20 Aug 2020 22:44:59 -0400
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
Message-ID: <20200820224459.0968b9f4@oasis.local.home>
In-Reply-To: <f9d33bcaa2eda680752205d3c3690cb6bc421730.camel@perches.com>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
        <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
        <20200820102347.15d2f610@oasis.local.home>
        <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
        <20200820203601.4f70bf98@oasis.local.home>
        <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
        <20200820215701.667f02b2@oasis.local.home>
        <f9d33bcaa2eda680752205d3c3690cb6bc421730.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 20 Aug 2020 19:36:19 -0700
Joe Perches <joe@perches.com> wrote:

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
> 

Because no production code should contain trace_printk(). It should be
deleted before going to Linus. If you have trace_printk() in your code,
you will be greeted by the following banner in your dmesg:

 **********************************************************
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **                                                      **
 ** trace_printk() being used. Allocating extra memory.  **
 **                                                      **
 ** This means that this is a DEBUG kernel and it is     **
 ** unsafe for production use.                           **
 **                                                      **
 ** If you see this message and you are not debugging    **
 ** the kernel, report this immediately to your vendor!  **
 **                                                      **
 **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
 **********************************************************

-- Steve
