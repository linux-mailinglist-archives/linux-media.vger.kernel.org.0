Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50B8419DD16
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 19:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgDCRuF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 13:50:05 -0400
Received: from smtprelay0005.hostedemail.com ([216.40.44.5]:46942 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727882AbgDCRuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 13:50:05 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id C898A182CED34;
        Fri,  3 Apr 2020 17:50:03 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1461:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2110:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3874:4321:5007:6120:6691:6742:7901:10004:10400:10848:10967:11026:11232:11473:11658:11914:12043:12297:12438:12740:12760:12895:13069:13160:13229:13311:13357:13439:14181:14659:14721:21080:21627:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: train70_1d5dccc9e8c04
X-Filterd-Recvd-Size: 2521
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Fri,  3 Apr 2020 17:50:01 +0000 (UTC)
Message-ID: <2751400ae13b25d8259a8a9d7b36caf98ec2d367.camel@perches.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>
Date:   Fri, 03 Apr 2020 10:48:04 -0700
In-Reply-To: <20200403193242.38611906@coco.lan>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
         <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
         <b1e6213ba9f67da8278dd5c5f5e4def8ab927c83.camel@perches.com>
         <20200403193242.38611906@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-04-03 at 19:32 +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 03 Apr 2020 09:56:42 -0700
> Joe Perches <joe@perches.com> escreveu:
[]
> > How many instances of %p4cc could there be?
> 
> That's hard to know... there are several places printing it
> with different ways:
> 
> 	$ git grep -i -E "(dev|pr)_(warn|dbg|info)" drivers/media|grep pixf|wc -l
> 	6
> 	$ git grep -i -E "print" drivers/media|grep pixf|wc -l
> 	1
> 	$ git grep print_fourcc|wc -l
> 	7
> 	$ git grep -i -E "(dev|pr)_(warn|dbg|info)" drivers/media|grep pixelf|wc -l
> 	10
> 	$ git grep -i -E "(dev|pr|v4l)_(warn|dbg|info)" drivers/media|grep format|wc -l
> 	60
> 
> I bet there are other places besides the above ones, but the thing is, as 
> we currently lack a standard way, drivers still have their own ideas
> about how to handle it. Each one does it differently.

My thought was ~100 uses was a minimum, rather like %pI6c.

That's pretty close already, so I suppose that's enough.

It _might_ be useful to use a CONFIG_MEDIA_SUPPORT guard
in lib/vsprintf for this.

cheers, Joe

