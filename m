Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C73F24CAE0
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 04:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgHUCgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 22:36:25 -0400
Received: from smtprelay0077.hostedemail.com ([216.40.44.77]:60316 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726974AbgHUCgY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 22:36:24 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id CB171100E7B43;
        Fri, 21 Aug 2020 02:36:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2895:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3870:3871:3872:3874:4321:5007:6117:6248:6742:7903:10004:10400:10848:10967:11232:11658:11914:12296:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:14777:21080:21324:21433:21627:21972:21990:30006:30012:30054:30060:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: army26_490db1927035
X-Filterd-Recvd-Size: 2425
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Fri, 21 Aug 2020 02:36:20 +0000 (UTC)
Message-ID: <f9d33bcaa2eda680752205d3c3690cb6bc421730.camel@perches.com>
Subject: Re: [PATCH v4 3/3] media: atomisp: Only use trace_printk if allowed
From:   Joe Perches <joe@perches.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Nicolas Boichat <drinkcat@chromium.org>
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
Date:   Thu, 20 Aug 2020 19:36:19 -0700
In-Reply-To: <20200820215701.667f02b2@oasis.local.home>
References: <20200820170951.v4.1.Ia54fe801f246a0b0aee36fb1f3bfb0922a8842b0@changeid>
         <20200820170951.v4.3.I066d89f39023956c47fb0a42edf196b3950ffbf7@changeid>
         <20200820102347.15d2f610@oasis.local.home>
         <CANMq1KCoEZVj=sjxCqBhqLZKBab57+82=Rk_LN7fc3aCuNHMUw@mail.gmail.com>
         <20200820203601.4f70bf98@oasis.local.home>
         <CANMq1KAAgXG9MKMZ_D9zYFV-j0oVreA_AeSw-8FoyJgZ9eWQpg@mail.gmail.com>
         <20200820215701.667f02b2@oasis.local.home>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-08-20 at 21:57 -0400, Steven Rostedt wrote:
> On Fri, 21 Aug 2020 09:39:19 +0800
> Nicolas Boichat <drinkcat@chromium.org> wrote:
[]
> > Some other approaches/ideas:
> >  1. Filter all lkml messages that contain trace_printk. Already found
> > 1 instance, and I can easily reply to those with a semi-canned answer,
> > if I remember to check that filter regularly (not sustainable in the
> > long run...).
> 
> Added Joe Perches to the thread.
> 
> We can update checkpatch.pl to complain about a trace_printk() that it
> finds in the added code.

Why?

I don't see much value in a trace_printk checkpatch warning.
tracing is still dependent on CONFIG_TRACING otherwise
trace_printk is an if (0)

ELI5 please.


