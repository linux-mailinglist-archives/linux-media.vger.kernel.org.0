Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB16A2B1964
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 11:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgKMKy0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 05:54:26 -0500
Received: from mga06.intel.com ([134.134.136.31]:32776 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgKMKyZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 05:54:25 -0500
IronPort-SDR: 7jVdbwBnZcw+rmuheanFJnDhDjDSX+fblEwJfgSm4EwVJGQd7Q54fPJBTV6nSHd0ioaAw5FRgg
 XURArL7fTOmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="232073184"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="232073184"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2020 02:54:23 -0800
IronPort-SDR: CqYnJPCz85Lt+Zl46+QWnqQoSIbJs9rraLE/sDGJGNJQmvn0olodnEO95VXNg27Cu+wQyV1Q4t
 bs6BUj7spy9g==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="309130601"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2020 02:54:20 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7B63320736; Fri, 13 Nov 2020 12:54:18 +0200 (EET)
Date:   Fri, 13 Nov 2020 12:54:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Joe Perches <joe@perches.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v4 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201113105418.GB15897@paasikivi.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
 <20201103144747.GD4077@smile.fi.intel.com>
 <20201103145616.GJ26150@paasikivi.fi.intel.com>
 <b389f6991ede1f8ae89a0dbaa8deab06aecc6146.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b389f6991ede1f8ae89a0dbaa8deab06aecc6146.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

On Tue, Nov 03, 2020 at 08:49:36AM -0800, Joe Perches wrote:
> On Tue, 2020-11-03 at 16:56 +0200, Sakari Ailus wrote:
> > On Tue, Nov 03, 2020 at 04:47:47PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> > > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > > so the same implementation can be used.
> > > 
> > > ...
> > > 
> > > > +static noinline_for_stack
> > > > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > > > +		    struct printf_spec spec, const char *fmt)
> > > > +{
> > > > +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > > 
> > > I would add a comment that there is another possibility, i.e. big-endian, but
> > > it occupies less space.
> 
> I think it's unnecessary as it's obvious and similarly done in other
> <foo>_string type functions.
> 
> > > > +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > > +			       sizeof(u32));
> > > 
> > > I would go with one line here.
> > 
> > It's wrapped since the result would be over 80 otherwise.
> 
> Perhaps simpler as
> 
> 	p = special_hex_number(p, p + 10, *fourcc, sizeof(u32));

Yes. But having bugs elsewhere would have a magnified effect. I wouldn't be
afraid of a newline here.

> 
> > > The (theoretical) problem is here that the case when buffer size is not enough
> > > to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
> > > snprintf() does in general.
> 
> Isn't the stack buffer known to be large enough?

Yes. If there are no bugs, that is.

> 
> > > > +	*p++ = ')';
> > > > +	*p = '\0';
> > > > +
> > > > +	return string(buf, end, output, spec);
> 
> Isn't the actual output buffer used here truncating output?
> 
> If the general problem is someone using a limited length pointer
> output like %10p4cc, then all the output is getting truncated no?

Correct. But I'd also be surprised if anyone ever used this feature.

-- 
Kind regards,

Sakari Ailus
