Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645682A4BE6
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 17:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgKCQto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 11:49:44 -0500
Received: from smtprelay0079.hostedemail.com ([216.40.44.79]:58844 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725997AbgKCQto (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 11:49:44 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id E3FE4180A9113;
        Tue,  3 Nov 2020 16:49:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2282:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3354:3622:3865:3867:3868:3870:3871:3872:3874:4321:4605:5007:6119:6120:6742:7901:7903:7904:8603:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12555:12740:12760:12895:12986:13069:13311:13357:13439:14659:14721:21080:21627:21990:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: card07_4c0643e272ba
X-Filterd-Recvd-Size: 3077
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Tue,  3 Nov 2020 16:49:40 +0000 (UTC)
Message-ID: <b389f6991ede1f8ae89a0dbaa8deab06aecc6146.camel@perches.com>
Subject: Re: [PATCH v4 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
From:   Joe Perches <joe@perches.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date:   Tue, 03 Nov 2020 08:49:36 -0800
In-Reply-To: <20201103145616.GJ26150@paasikivi.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
         <20201103144747.GD4077@smile.fi.intel.com>
         <20201103145616.GJ26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-11-03 at 16:56 +0200, Sakari Ailus wrote:
> On Tue, Nov 03, 2020 at 04:47:47PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > so the same implementation can be used.
> > 
> > ...
> > 
> > > +static noinline_for_stack
> > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > +		    struct printf_spec spec, const char *fmt)
> > > +{
> > > +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > 
> > I would add a comment that there is another possibility, i.e. big-endian, but
> > it occupies less space.

I think it's unnecessary as it's obvious and similarly done in other
<foo>_string type functions.

> > > +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > +			       sizeof(u32));
> > 
> > I would go with one line here.
> 
> It's wrapped since the result would be over 80 otherwise.

Perhaps simpler as

	p = special_hex_number(p, p + 10, *fourcc, sizeof(u32));

> > The (theoretical) problem is here that the case when buffer size is not enough
> > to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
> > snprintf() does in general.

Isn't the stack buffer known to be large enough?

> > > +	*p++ = ')';
> > > +	*p = '\0';
> > > +
> > > +	return string(buf, end, output, spec);

Isn't the actual output buffer used here truncating output?

If the general problem is someone using a limited length pointer
output like %10p4cc, then all the output is getting truncated no?


