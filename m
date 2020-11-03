Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39742A4A42
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 16:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgKCPqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 10:46:01 -0500
Received: from mga07.intel.com ([134.134.136.100]:48981 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728474AbgKCPqB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 10:46:01 -0500
IronPort-SDR: lPsVTv1DvEzGzj8ypJvKA87mIsHLajIz9U9W80rsyhUL/8INyUdMeJU7BssL4IdrRX7AmIiwhA
 gD+ReM4k2Klg==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="233239582"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="233239582"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 07:45:58 -0800
IronPort-SDR: 0N5GIaDzQLTkm+QI39DbxKEIqUgnz5PwMjSHGBBwSEp6ZtuJ/rWshE7S5SHGOl/RSjDs9/b9fO
 nsR9K8XyzagA==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="320484142"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 07:45:54 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kZyWN-003ZmP-UA; Tue, 03 Nov 2020 17:46:55 +0200
Date:   Tue, 3 Nov 2020 17:46:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v4 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201103154655.GE4077@smile.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
 <20201103144747.GD4077@smile.fi.intel.com>
 <20201103145616.GJ26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103145616.GJ26150@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 03, 2020 at 04:56:16PM +0200, Sakari Ailus wrote:
> On Tue, Nov 03, 2020 at 04:47:47PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > so the same implementation can be used.

...

> > > +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> > 
> > I would add a comment that there is another possibility, i.e. big-endian, but
> > it occupies less space.
> 
> This string is here to represent the longest possible output of the
> function. Most of the time it's less. Saying that might make sense but it's
> fairly clear already. Either way works for me though.

It's not known by reading the above line. I would add a comment.

...

> > > +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > > +			       sizeof(u32));
> > 
> > I would go with one line here.
> 
> It's wrapped since the result would be over 80 otherwise.

It will be not the first one breaking the limit in this module for the sake of
readability.

...

> > The (theoretical) problem is here that the case when buffer size is not enough
> > to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
> > snprintf() does in general.

Any comments here?
Perhaps you need to add a comment to explain that the overflow is impossible.

-- 
With Best Regards,
Andy Shevchenko


