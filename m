Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5120D19DE21
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 20:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391087AbgDCSka (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 14:40:30 -0400
Received: from smtprelay0024.hostedemail.com ([216.40.44.24]:43886 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728337AbgDCSka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 14:40:30 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 232EE837F27B;
        Fri,  3 Apr 2020 18:40:29 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2915:3138:3139:3140:3141:3142:3352:3622:3865:3866:3868:3871:4321:5007:6119:6120:6742:7901:7903:10004:10400:10848:11026:11232:11658:11914:12296:12297:12740:12760:12895:13069:13161:13229:13311:13357:13439:14659:14721:21080:21627:30054:30069:30070:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: head59_210c0a7bd8631
X-Filterd-Recvd-Size: 2165
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Fri,  3 Apr 2020 18:40:26 +0000 (UTC)
Message-ID: <e44e41317719727ea12aee4ff1e210dea796dd2f.camel@perches.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
From:   Joe Perches <joe@perches.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Date:   Fri, 03 Apr 2020 11:38:29 -0700
In-Reply-To: <20200403104701.GC3172@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
         <20200403102449.GB4882@pendragon.ideasonboard.com>
         <20200403104701.GC3172@kekkonen.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-04-03 at 13:47 +0300, Sakari Ailus wrote:
> On Fri, Apr 03, 2020 at 01:24:49PM +0300, Laurent Pinchart wrote:
> > On Fri, Apr 03, 2020 at 12:11:56PM +0300, Sakari Ailus wrote:
> > > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > > the same implementation can be used.
[]
> > > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
[]
> > > +static noinline_for_stack
> > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > +		    struct printf_spec spec, const char *fmt)
[]
> > > +	if (fmt[1] != 'c' || fmt[2] != 'c')

This could check outside a format string if
the %p4 is at the end of the format string.

	printk("%p4", fourcc)

So this should verify

	if (!(fmt[1] == 'c' && fmt[2] == 'c'))


