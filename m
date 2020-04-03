Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E5619D3B8
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389998AbgDCJbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:31:04 -0400
Received: from mga05.intel.com ([192.55.52.43]:12998 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388472AbgDCJbE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Apr 2020 05:31:04 -0400
IronPort-SDR: hMx56VxgWOkMxvSiPtEF3fZyS4vzACpji9paDAj9A7fYYsTNKiS85cFTuD9zBoXtEv/YtpA6h7
 i8dgcCMwU4zQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2020 02:31:04 -0700
IronPort-SDR: Ff+uh1GlRsAzAACn6hWcKwB6L/7wQ6bTYA7eA69rBEVqU7gH6ev/OBSCkNoeT2Ric3r7jt7Mg5
 r7eRvnv3tT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; 
   d="scan'208";a="449968404"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2020 02:31:01 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jKIfH-00FOWT-O4; Fri, 03 Apr 2020 12:31:03 +0300
Date:   Fri, 3 Apr 2020 12:31:03 +0300
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
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403093103.GI1922688@smile.fi.intel.com>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 03, 2020 at 12:11:56PM +0300, Sakari Ailus wrote:
> Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> the same implementation can be used.

...

> +static noinline_for_stack
> +char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> +		    struct printf_spec spec, const char *fmt)
> +{

> +#define FOURCC_STRING_BE	"-BE"
> +	char s[sizeof(*fourcc) + sizeof(FOURCC_STRING_BE)] = { 0 };

I guess it makes it too complicated.

	char s[8];

> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	if (fmt[1] != 'c' || fmt[2] != 'c')
> +		return error_string(buf, end, "(%p4?)", spec);
> +

> +	put_unaligned_le32(*fourcc & ~BIT(31), s);

Can you elaborate what the difference in output with this bit set over cleared?
I.o.w. why don't we need to put it as BE and for LE case addd "-LE"?

> +	if (*fourcc & BIT(31))
> +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> +			sizeof(FOURCC_STRING_BE));

We know the size, and we may put '\0' as well
	if (*fourcc & BIT(31))
		strscpy(&s[4], "-BE", sizeof("-BE"));
	else
		strscpy(&s[4], "", sizeof(""));


> +	return string(buf, end, s, spec);
> +}

-- 
With Best Regards,
Andy Shevchenko


