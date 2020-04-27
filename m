Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB571BA7FD
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 17:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgD0Pas (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 11:30:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:50188 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728021AbgD0Pas (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 11:30:48 -0400
IronPort-SDR: 8tMmEonabBebIQtUWcVAK9+E4KlWVRyIH86DXF4vQVdchlWHhFtis0rTbQDy7ZA56vi+t8XkPQ
 yKOpF60aXPeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 08:30:48 -0700
IronPort-SDR: GP3A3rfPMYdQpzYh2A4GAPQSDWg+are3wylGKVaQq4kEA+BeK88WkbqyFEkCwtaaKfarRcKcAw
 aZqyaUnWvt6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; 
   d="scan'208";a="431816249"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2020 08:30:44 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jT5iZ-003PtH-0X; Mon, 27 Apr 2020 18:30:47 +0300
Date:   Mon, 27 Apr 2020 18:30:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [RESEND PATCH v3 1/1] lib/vsprintf: Add support for printing
 V4L2 and DRM fourccs
Message-ID: <20200427153046.GL185537@smile.fi.intel.com>
References: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427145303.29943-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 27, 2020 at 05:53:03PM +0300, Sakari Ailus wrote:
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.

4cc is more generic than pixel format.

...

> +V4L2 and DRM FourCC code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +	%p4cc

Missed examples.

> +Print a FourCC code used by V4L2 or DRM, including format endianness and
> +its numerical value as hexadecimal.

...

> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *__fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{
> +#define FOURCC_HEX_CHAR_STR		"(xx)"
> +#define FOURCC_BIG_ENDIAN_STR		" big-endian"
> +#define FOURCC_LITTLE_ENDIAN_STR	" little-endian"
> +#define FOURCC_HEX_NUMBER		" (0x01234567)"

Where are #undef:s?

> +#define FOURCC_STRING_MAX						\
> +	FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR FOURCC_HEX_CHAR_STR	\
> +	FOURCC_HEX_CHAR_STR FOURCC_LITTLE_ENDIAN_STR FOURCC_HEX_NUMBER

> +	struct printf_spec my_spec = {
> +		.type = FORMAT_TYPE_UINT,
> +		.field_width = 2,
> +		.flags = SMALL,
> +		.base = 16,
> +		.precision = -1,
> +	};

Seems like close enough to bus_spec.

> +	char __s[sizeof(FOURCC_STRING_MAX)];
> +	char *s = __s;
> +	unsigned int i;
> +	/*
> +	 * The 31st bit defines the endianness of the data, so save its printing
> +	 * for later.
> +	 */
> +	u32 fourcc = *__fourcc & ~BIT(31);
> +	int ret;
> +
> +	if (check_pointer(&buf, end, __fourcc, spec))
> +		return buf;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(buf, end, "(%p4?)", spec);
> +
> +	for (i = 0; i < sizeof(fourcc); i++, fourcc >>= 8) {
> +		unsigned char c = fourcc;
> +
> +		/* Weed out spaces */
> +		if (c == ' ')
> +			continue;
> +
> +		/* Print non-control characters as-is */
> +		if (c > ' ') {
> +			*s = c;
> +			s++;
> +			continue;
> +		}

> +		if (WARN_ON_ONCE(sizeof(__s) <
> +				 (s - __s) + sizeof(FOURCC_HEX_CHAR_STR)))

Why WARN?!

> +			break;
> +
> +		*s = '(';
> +		s++;
> +		s = number(s, s + 2, c, my_spec);
> +		*s = ')';
> +		s++;
> +	}
> +
> +	ret = strscpy(s, *__fourcc & BIT(31) ? FOURCC_BIG_ENDIAN_STR
> +					     : FOURCC_LITTLE_ENDIAN_STR,
> +		      sizeof(__s) - (s - __s));

> +	if (!WARN_ON_ONCE(ret < 0))

Ditto.

> +		s += ret;

> +	if (!WARN_ON_ONCE(sizeof(__s) <
> +			  (s - __s) + sizeof(FOURCC_HEX_NUMBER))) {

Ditto.

> +		*s = ' ';
> +		s++;
> +		*s = '(';
> +		s++;
> +		/* subtract parentheses and the space from the size */
> +		special_hex_number(s, s + sizeof(FOURCC_HEX_NUMBER) - 3,
> +				   *__fourcc, sizeof(u32));
> +		s += sizeof(u32) * 2 + 2 /* 0x */;
> +		*s = ')';
> +		s++;
> +		*s = '\0';
> +	}
> +
> +	return string(buf, end, __s, spec);

This looks overengineered. Why everyone will need so long strings to be printed?

> +}

-- 
With Best Regards,
Andy Shevchenko


