Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C86A19CD75
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 01:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390055AbgDBX2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 19:28:11 -0400
Received: from smtprelay0216.hostedemail.com ([216.40.44.216]:36478 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387919AbgDBX2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 19:28:11 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id E4123182CED2A;
        Thu,  2 Apr 2020 23:28:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3873:3874:4321:5007:6119:6120:6742:7901:7903:10004:10400:10848:11232:11658:11914:12043:12297:12663:12740:12760:12895:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21433:21611:21627:30054:30069:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: horse36_cc82b9208349
X-Filterd-Recvd-Size: 2399
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Thu,  2 Apr 2020 23:28:07 +0000 (UTC)
Message-ID: <04bb934e551f43540d1daacd2759beacc0b3116a.camel@perches.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
From:   Joe Perches <joe@perches.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>
Cc:     mchehab@kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hverkuil@xs4all.nl,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        laurent.pinchart@ideasonboard.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>
Date:   Thu, 02 Apr 2020 16:26:11 -0700
In-Reply-To: <87eet6mgk7.fsf@intel.com>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
         <87eet6mgk7.fsf@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-04-02 at 11:34 +0300, Jani Nikula wrote:
> On Wed, 01 Apr 2020, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.
> 
> I'm not going to take a strong stand in one way or the other regarding
> the patch at hand, but I do think at some point we have to draw a line
> what should be included in printk formats. Arguably they should be
> reserved to things that are generally useful across large parts of the
> kernel, right?

Definitely yes.

> I think the more specialized you get, the more you should think about
> just using the plain old %s, and your own helpers. Because frankly, the
> kernel printk specifiers also start getting more than a little obscure.
> 
> Or could we conceive of a way to make this locally extensible yet safe,
> letting callers use something like %{foo}, as well as providing a
> locally relevant function to do the conversion?

No.  printf validation would be broken.


