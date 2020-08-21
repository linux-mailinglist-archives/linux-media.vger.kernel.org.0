Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AE124CAFE
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 04:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHUCuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 22:50:04 -0400
Received: from smtprelay0015.hostedemail.com ([216.40.44.15]:41834 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725852AbgHUCuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 22:50:04 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 8DDB11801EA45;
        Fri, 21 Aug 2020 02:50:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2561:2564:2682:2685:2693:2828:2859:2895:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6117:6119:6248:6691:6742:7903:9025:10004:10400:10848:10967:11026:11232:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:13439:14181:14659:14721:21080:21324:21433:21451:21627:21972:21990:30006:30012:30054:30060:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:1:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: tank92_391416627035
X-Filterd-Recvd-Size: 4489
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Fri, 21 Aug 2020 02:50:00 +0000 (UTC)
Message-ID: <c0ca85e475d1e761431b2c10ade803451c74178f.camel@perches.com>
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
From:   Joe Perches <joe@perches.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
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
Date:   Thu, 20 Aug 2020 19:49:59 -0700
In-Reply-To: <CANMq1KDYBbtrrCw6YUeoAPeHyet3L7qM3di9zmULDDRaQR_fZA@mail.gmail.com>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
         <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
         <20200820102347.15d2f610@oasis.local.home>
         <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
         <20200820203601.4f70bf98@oasis.local.home>
         <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
         <20200820215701.667f02b2@oasis.local.home>
         <f9d33bcaa2eda680752205d3c3690cb6bc421730.camel@perches.com>
         <CANMq1KDYBbtrrCw6YUeoAPeHyet3L7qM3di9zmULDDRaQR_fZA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-08-21 at 10:42 +0800, Nicolas Boichat wrote:
> On Fri, Aug 21, 2020 at 10:36 AM Joe Perches <joe@perches.com> wrote:
> > On Thu, 2020-08-20 at 21:57 -0400, Steven Rostedt wrote:
> > > On Fri, 21 Aug 2020 09:39:19 +0800
> > > Nicolas Boichat <drinkcat@chromium.org> wrote:
> > []
> > > > Some other approaches/ideas:
> > > >  1. Filter all lkml messages that contain trace_printk. Already found
> > > > 1 instance, and I can easily reply to those with a semi-canned answer,
> > > > if I remember to check that filter regularly (not sustainable in the
> > > > long run...).
> > > 
> > > Added Joe Perches to the thread.
> > > 
> > > We can update checkpatch.pl to complain about a trace_printk() that it
> > > finds in the added code.
> > 
> > Why?
> > 
> > I don't see much value in a trace_printk checkpatch warning.
> > tracing is still dependent on CONFIG_TRACING otherwise
> > trace_printk is an if (0)
> > 
> > ELI5 please.
> 
> This is my "new" canned answer to this:
> 
> Please do not use trace_printk in production code [1,2], it is only
> meant for debug use. Consider using trace events, or dev_dbg.
> [1] https://elixir.bootlin.com/linux/v5.8/source/kernel/trace/trace.c#L3158
> [2] https://elixir.bootlin.com/linux/v5.8/source/include/linux/kernel.h#L766
> 
> I also had arguments in patch 2/3 notes:
> 
> There's at least 3 reasons that I can come up with:
>  1. trace_printk introduces some overhead. [some users, e.g.
> Android/Chrome OS, want CONFIG_TRACING but _not_ that extra overhead]
>  2. If the kernel keeps adding always-enabled trace_printk, it will be
> much harder for developers to make use of trace_printk for debugging.
>  3. People may assume that trace_printk is for debugging only, and may
> accidentally output sensitive data (theoretical at this stage).

Perhaps make trace_printk dependent on #define DEBUG?

Something like:
---
 include/linux/kernel.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 500def620d8f..6ca8f958df73 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -717,6 +717,7 @@ do {									\
  * let gcc optimize the rest.
  */
 
+#ifdef DEBUG
 #define trace_printk(fmt, ...)				\
 do {							\
 	char _______STR[] = __stringify((__VA_ARGS__));	\
@@ -725,6 +726,12 @@ do {							\
 	else						\
 		trace_puts(fmt);			\
 } while (0)
+#else
+#define trace_printk(fmt, ...)						\
+do {									\
+	__trace_printk_check_format(fmt, ##args);			\
+} while (0)
+#endif
 
 #define do_trace_printk(fmt, args...)					\
 do {									\


