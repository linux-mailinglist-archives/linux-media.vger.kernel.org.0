Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB8819AE98
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 17:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732684AbgDAPNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 11:13:33 -0400
Received: from mga12.intel.com ([192.55.52.136]:1169 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732442AbgDAPNd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Apr 2020 11:13:33 -0400
IronPort-SDR: 1pwoghMHYqAbMXajfJATqSVGYaZr6c5lpuchun8NdxLyShAbjW4VDe4E3OLoI6JoclzvPsJXje
 AVNPAF3u2iNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 08:13:33 -0700
IronPort-SDR: YdIz9SKhq6Hwq1ov06ZyGbjHuyqz0OlLpBt/QfMWW6VuAqId83hMv2MKGqzhKLj4cNtl6B1XhT
 qktd/Zm41bMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; 
   d="scan'208";a="273210606"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2020 08:13:30 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jJf3c-00EvkP-Ro; Wed, 01 Apr 2020 18:13:32 +0300
Date:   Wed, 1 Apr 2020 18:13:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
Message-ID: <20200401151332.GU1922688@smile.fi.intel.com>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
 <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 01, 2020 at 04:13:51PM +0200, Hans Verkuil wrote:
> On 4/1/20 4:05 PM, Sakari Ailus wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.

%p4cc ?

> > +	char ch[2] = { 0 };
> 
> This can just be '{ };'

The latter is GCC extension, while above is C standard. Former is slightly
better I think. Though see below.

> > +	unsigned int i;
> > +
> > +	if (check_pointer(&buf, end, fourcc, spec))
> > +		return buf;
> > +
> > +	switch (fmt[1]) {
> > +	case 'f':

> > +		for (i = 0; i < sizeof(*fourcc); i++) {
> > +			ch[0] = *fourcc >> (i << 3);
> 
> You need to AND with 0x7f, otherwise a big endian fourcc (bit 31 is set)
> will look wrong. Also, each character is standard 7 bit ascii, bit 7 isn't
> used except to indicate a BE variant.

Why not to do it once by a flag and do reset it once?

	u32 tmp = *fourcc;
	bool be4cc = tmp & BIT(31);

	tmp &= BIT(31);

On top of that, as promised above, why not simple do it in a simpler way, i.e.
using standard idiom:

	for (i = 0; i < sizeof(*fourcc); i++) {
		if (buf < end)
			*buf = tmp >> (i * 8);
		buf++;
	}
?

> > +			buf = string(buf, end, ch, spec);
> > +		}
> > +
> > +		if (*fourcc & BIT(31))
> > +			buf = string(buf, end, "-BE", spec);

Another possibility

	u8 ch[8];

	if (*fourcc & BIT(31)) {
		put_unaligned_be32(tmp, &ch[0]);
		strcpy(&ch[4], "-BE");
	} else {
		put_unaligned_le32(tmp, &ch[0]);
		strcpy(&ch[4], "-LE");
	}
	return string(buf, end, &ch[0], spec);

> > +		return buf;
> > +	default:
> > +		return error_string(buf, end, "(%pp?)", spec);
> > +	}
> > +}

-- 
With Best Regards,
Andy Shevchenko


