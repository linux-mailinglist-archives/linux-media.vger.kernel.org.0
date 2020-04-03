Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F5919D4FF
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 12:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgDCKZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 06:25:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42320 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgDCKZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 06:25:00 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 762F3321;
        Fri,  3 Apr 2020 12:24:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585909497;
        bh=6AoVQWC6bVmf4rPCkhV3E1jg4poMS4+qepNdH5JPhVA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iRiKiLFMPN5UE41ZLkDupUaGCjHlB/2vNn4igBxHdgWI/tZM7dYRfx9D7Mr66RmCZ
         Jt5Jhn5PWoJpQFiEazxfqGbvL6VKGQDGFNqgJ9J4vVsgJJrbje+QDU78tcbC5j66so
         O+9JhRVhwejCsOa4CwMs4JaP8DARZdxgh1AcVfMY=
Date:   Fri, 3 Apr 2020 13:24:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403102449.GB4882@pendragon.ideasonboard.com>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Apr 03, 2020 at 12:11:56PM +0300, Sakari Ailus wrote:
> Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> the same implementation can be used.
> 
> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Improve documentation (add -BE suffix, refer to "FourCC".
> 
> - Use '%p4cc' conversion specifier instead of '%ppf'.
> 
> - Fix 31st bit handling in printing FourCC codes.
> 
> - Use string() correctly, to allow e.g. proper field width handling.
> 
> - Remove loop, use put_unaligned_le32() instead.
> 
>  Documentation/core-api/printk-formats.rst | 12 +++++++++++
>  lib/vsprintf.c                            | 25 +++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 8ebe46b1af39..550568520ab6 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -545,6 +545,18 @@ For printing netdev_features_t.
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
> +Print a FourCC code used by V4L2 or DRM. The "-BE" suffix is added on big endian
> +formats.
> +
> +Passed by reference.
> +
>  Thanks
>  ======
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 7c488a1ce318..93eea6a320da 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1721,6 +1721,28 @@ char *netdev_bits(char *buf, char *end, const void *addr,
>  	return special_hex_number(buf, end, num, size);
>  }
>  
> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{
> +#define FOURCC_STRING_BE	"-BE"
> +	char s[sizeof(*fourcc) + sizeof(FOURCC_STRING_BE)] = { 0 };
> +
> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(buf, end, "(%p4?)", spec);
> +
> +	put_unaligned_le32(*fourcc & ~BIT(31), s);
> +
> +	if (*fourcc & BIT(31))
> +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> +			sizeof(FOURCC_STRING_BE));
> +
> +	return string(buf, end, s, spec);

Taking V4L2_PIX_FMT_Y16_BE as an example, this will print 'Y16 -BE'
(without quotes). There are other 4CCs that contain spaces and would
suffer from a similar issue. Even in little-endian format, it would
result in additional spaces in the output string. Is this what we want ?
Should the caller always enclose the 4CC in quotes or brackets for
clarity ? Or should still be done here ?

> +}
> +
>  static noinline_for_stack
>  char *address_val(char *buf, char *end, const void *addr,
>  		  struct printf_spec spec, const char *fmt)
> @@ -2131,6 +2153,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>   *       correctness of the format string and va_list arguments.
>   * - 'K' For a kernel pointer that should be hidden from unprivileged users
>   * - 'NF' For a netdev_features_t
> + * - '4cc' V4L2 or DRM FourCC code, with "-BE" suffix on big endian formats.
>   * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
>   *            a certain separator (' ' by default):
>   *              C colon
> @@ -2223,6 +2246,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  		return restricted_pointer(buf, end, ptr, spec);
>  	case 'N':
>  		return netdev_bits(buf, end, ptr, spec, fmt);
> +	case '4':
> +		return fourcc_string(buf, end, ptr, spec, fmt);
>  	case 'a':
>  		return address_val(buf, end, ptr, spec, fmt);
>  	case 'd':

-- 
Regards,

Laurent Pinchart
