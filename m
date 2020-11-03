Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6D82A48C0
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 15:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgKCO41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 09:56:27 -0500
Received: from mga18.intel.com ([134.134.136.126]:21842 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728090AbgKCO4W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 09:56:22 -0500
IronPort-SDR: 5K5AZammkKEUe+i7/XNqUZnw0jJdgvQwksvg989VjzxG7RTJOvLAnq6V7TAEnsO5yjN83O7ev1
 AsJODC2cuqNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="156841348"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="156841348"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 06:56:22 -0800
IronPort-SDR: KYI2S/nqQuwfQOylVpgemLjwXWSAsuFH0eNZBI3VQ4uLQsyg4Qhf6eguLRBChQdggD6DtpMRXf
 updwEaV03DaQ==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="306067752"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 06:56:18 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id BC4DE209D9; Tue,  3 Nov 2020 16:56:16 +0200 (EET)
Date:   Tue, 3 Nov 2020 16:56:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <20201103145616.GJ26150@paasikivi.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
 <20201103144747.GD4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103144747.GD4077@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, Nov 03, 2020 at 04:47:47PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> 
> ...
> 
> > +static noinline_for_stack
> > +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> > +		    struct printf_spec spec, const char *fmt)
> > +{
> > +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];
> 
> I would add a comment that there is another possibility, i.e. big-endian, but
> it occupies less space.

This string is here to represent the longest possible output of the
function. Most of the time it's less. Saying that might make sense but it's
fairly clear already. Either way works for me though.

> 
> > +	char *p = output;
> > +	unsigned int i;
> > +	u32 val;
> > +
> > +	if (fmt[1] != 'c' || fmt[2] != 'c')
> > +		return error_string(output, end, "(%p4?)", spec);
> > +
> > +	if (check_pointer(&buf, end, fourcc, spec))
> > +		return buf;
> > +
> > +	val = *fourcc & ~BIT(31);
> > +
> > +	for (i = 0; i < sizeof(*fourcc); i++) {
> > +		unsigned char c = val >> (i * 8);
> > +
> > +		/* Weed out spaces */
> > +		if (c == ' ')
> > +			continue;
> > +
> > +		/* Print non-control ASCII characters as-is */
> > +		if (isascii(c) && isprint(c)) {
> > +			*p++ = c;
> > +			continue;
> > +		}
> > +
> > +		*p++ = '(';
> > +		p = hex_byte_pack(p, c);
> > +		*p++ = ')';
> > +	}
> 
> I guess above loop can be still optimized, but I have to think about it.
> 
> > +	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> > +	p += strlen(p);
> > +
> > +	*p++ = ' ';
> > +	*p++ = '(';
> > +	/* subtract parenthesis and the space from the size */
> 
> This comment misleading. What you are subtracting is a room for closing
> parenthesis and NUL.

Agreed, I'll update it for v5.

> 
> > +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> > +			       sizeof(u32));
> 
> I would go with one line here.

It's wrapped since the result would be over 80 otherwise.

> 
> The (theoretical) problem is here that the case when buffer size is not enough
> to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
> snprintf() does in general.
> 
> > +	*p++ = ')';
> > +	*p = '\0';
> > +
> > +	return string(buf, end, output, spec);
> > +}
> 

-- 
Regards,

Sakari Ailus
