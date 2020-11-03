Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7FA2A4882
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 15:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgKCOqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 09:46:52 -0500
Received: from mga07.intel.com ([134.134.136.100]:42803 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728175AbgKCOqu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 09:46:50 -0500
IronPort-SDR: 0KIbBD6Qoc1C1i6cdvx+yJ9anRcz0GuIEtNWlQ6Hz3JU4clVzTh9bc3C3aLDkaaSyLA85ltbpj
 tb00dAAJzm5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="233228898"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="233228898"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 06:46:49 -0800
IronPort-SDR: EjuroLYVH7sHSk0NjvP6CMOCZ8CpZrUNGFwdHGgfnMFIKSpjRlD7oZbo5aBPd570P+gmrNS1Kv
 ie4tot7f/1nA==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; 
   d="scan'208";a="306065252"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 06:46:45 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kZxb9-003V4L-D1; Tue, 03 Nov 2020 16:47:47 +0200
Date:   Tue, 3 Nov 2020 16:47:47 +0200
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
Message-ID: <20201103144747.GD4077@smile.fi.intel.com>
References: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103133400.24805-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 03, 2020 at 03:34:00PM +0200, Sakari Ailus wrote:
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.

...

> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{
> +	char output[sizeof("(xx)(xx)(xx)(xx) little-endian (0x01234567)")];

I would add a comment that there is another possibility, i.e. big-endian, but
it occupies less space.

> +	char *p = output;
> +	unsigned int i;
> +	u32 val;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(output, end, "(%p4?)", spec);
> +
> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	val = *fourcc & ~BIT(31);
> +
> +	for (i = 0; i < sizeof(*fourcc); i++) {
> +		unsigned char c = val >> (i * 8);
> +
> +		/* Weed out spaces */
> +		if (c == ' ')
> +			continue;
> +
> +		/* Print non-control ASCII characters as-is */
> +		if (isascii(c) && isprint(c)) {
> +			*p++ = c;
> +			continue;
> +		}
> +
> +		*p++ = '(';
> +		p = hex_byte_pack(p, c);
> +		*p++ = ')';
> +	}

I guess above loop can be still optimized, but I have to think about it.

> +	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> +	p += strlen(p);
> +
> +	*p++ = ' ';
> +	*p++ = '(';
> +	/* subtract parenthesis and the space from the size */

This comment misleading. What you are subtracting is a room for closing
parenthesis and NUL.

> +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc,
> +			       sizeof(u32));

I would go with one line here.

The (theoretical) problem is here that the case when buffer size is not enough
to print a value will be like '(0xabc)' but should be rather '(0xabcd' like
snprintf() does in general.

> +	*p++ = ')';
> +	*p = '\0';
> +
> +	return string(buf, end, output, spec);
> +}

-- 
With Best Regards,
Andy Shevchenko


