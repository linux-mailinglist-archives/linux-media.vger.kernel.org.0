Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9416331BA6E
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 14:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhBONfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 08:35:11 -0500
Received: from mga18.intel.com ([134.134.136.126]:14178 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhBONdk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 08:33:40 -0500
IronPort-SDR: 7PzYmWe7ijkXVwrojAs4N6XKLmUILvnmuiqyTo0o9qLYT5dPf/dksRjESm481WTCJgSqpzj57Q
 onnf7F6+lBvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="170340455"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="170340455"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:31:35 -0800
IronPort-SDR: WgaLDDO8hzHT59lq6F9XeQXfid+lKCKz7uljzLdWH/Oi4e7/mYnJqd0Gb1wEpYPIW7HwJdQXpB
 ekx7gKsylN/w==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="512203296"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:31:32 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBdyL-005CXG-0i; Mon, 15 Feb 2021 15:31:29 +0200
Date:   Mon, 15 Feb 2021 15:31:29 +0200
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
Subject: Re: [PATCH v7 1/3] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <YCp3sdZoalFSUS7u@smile.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215114030.11862-2-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.

This version I almost like, feel free to add
Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
after considering addressing below nit-picks.

> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> ---
>  Documentation/core-api/printk-formats.rst | 16 ++++++++++
>  lib/test_printf.c                         | 17 ++++++++++
>  lib/vsprintf.c                            | 39 +++++++++++++++++++++++
>  scripts/checkpatch.pl                     |  6 ++--
>  4 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 160e710d992f..da2aa065dc42 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -567,6 +567,22 @@ For printing netdev_features_t.
>  
>  Passed by reference.
>  
> +V4L2 and DRM FourCC code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +	%p4cc
> +
> +Print a FourCC code used by V4L2 or DRM, including format endianness and
> +its numerical value as hexadecimal.
> +
> +Passed by reference.
> +
> +Examples::
> +
> +	%p4cc	BG12 little-endian (0x32314742)

No examples with spaces / non-printable / non-ascii characters

> +
>  Thanks
>  ======
>  
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 7d60f24240a4..9848510a2786 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -647,6 +647,22 @@ static void __init fwnode_pointer(void)
>  	software_node_unregister_nodes(softnodes);
>  }
>  
> +static void __init fourcc_pointer(void)
> +{
> +	struct {
> +		u32 code;
> +		char *str;
> +	} const try[] = {
> +		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
> +		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
> +		{ 0x10111213, ".... little-endian (0x10111213)", },
> +	};
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(try); i++)
> +		test(try[i].str, "%p4cc", &try[i].code);
> +}
> +
>  static void __init
>  errptr(void)
>  {
> @@ -692,6 +708,7 @@ test_pointer(void)
>  	flags();
>  	errptr();
>  	fwnode_pointer();
> +	fourcc_pointer();
>  }
>  
>  static void __init selftest(void)
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 3b53c73580c5..432b5a2d1e90 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1733,6 +1733,42 @@ char *netdev_bits(char *buf, char *end, const void *addr,
>  	return special_hex_number(buf, end, num, size);
>  }
>  
> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{
> +	char output[sizeof("1234 little-endian (0x01234567)")];

1234 -> ABCD ? (Or XY12 to be closer to the reality)

> +	char *p = output;
> +	unsigned int i;
> +	u32 val;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(buf, end, "(%p4?)", spec);
> +
> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	val = *fourcc & ~BIT(31);
> +
> +	for (i = 0; i < sizeof(*fourcc); i++) {
> +		unsigned char c = val >> (i * 8);
> +
> +		/* Print non-control ASCII characters as-is, dot otherwise */
> +		*p++ = isascii(c) && isprint(c) ? c : '.';
> +	}
> +
> +	strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
> +	p += strlen(p);
> +
> +	*p++ = ' ';
> +	*p++ = '(';
> +	p = special_hex_number(p, output + sizeof(output) - 2, *fourcc, sizeof(u32));
> +	*p++ = ')';
> +	*p = '\0';
> +
> +	return string(buf, end, output, spec);
> +}
> +
>  static noinline_for_stack
>  char *address_val(char *buf, char *end, const void *addr,
>  		  struct printf_spec spec, const char *fmt)
> @@ -2162,6 +2198,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>   *       correctness of the format string and va_list arguments.
>   * - 'K' For a kernel pointer that should be hidden from unprivileged users
>   * - 'NF' For a netdev_features_t
> + * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
>   * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
>   *            a certain separator (' ' by default):
>   *              C colon
> @@ -2259,6 +2296,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  		return restricted_pointer(buf, end, ptr, spec);
>  	case 'N':
>  		return netdev_bits(buf, end, ptr, spec, fmt);
> +	case '4':
> +		return fourcc_string(buf, end, ptr, spec, fmt);
>  	case 'a':
>  		return address_val(buf, end, ptr, spec, fmt);
>  	case 'd':
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 92e888ed939f..79858e07d023 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6557,9 +6557,11 @@ sub process {
>  					$specifier = $1;
>  					$extension = $2;
>  					$qualifier = $3;
> -					if ($extension !~ /[SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
> +					if ($extension !~ /[4SsBKRraEehMmIiUDdgVCbGNOxtf]/ ||
>  					    ($extension eq "f" &&
> -					     defined $qualifier && $qualifier !~ /^w/)) {
> +					     defined $qualifier && $qualifier !~ /^w/) ||
> +					    ($extension eq "4" &&
> +					     defined $qualifier && $qualifier !~ /^cc/)) {
>  						$bad_specifier = $specifier;
>  						last;
>  					}
> -- 
> 2.29.2
> 

-- 
With Best Regards,
Andy Shevchenko


