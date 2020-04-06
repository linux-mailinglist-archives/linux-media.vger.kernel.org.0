Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3205A19F0BE
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 09:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgDFH3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 03:29:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:63537 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgDFH3G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 03:29:06 -0400
IronPort-SDR: jahqi3kONJ0JXN2xrJezQGIzxgHs+j1Uwl1T6wHAl0JNgpQxNsxlO+zGJyzaj+pfNDTZ6NrEWs
 JfhSu2D43XRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 00:29:05 -0700
IronPort-SDR: PTRRg3j9W+zcLsusMj2JOJphF/aWn1Jpkx1T57J4M5dh9NJ+iQqcvF/kqw1HGOEmZ9hLAaBu0q
 L40tKvY5ZtdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; 
   d="scan'208";a="450740106"
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.252.48.155])
  by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2020 00:29:02 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 5A0A621D18; Mon,  6 Apr 2020 10:28:58 +0300 (EEST)
Date:   Mon, 6 Apr 2020 10:28:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
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
Message-ID: <20200406072857.GD5835@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rasmus,

Thanks for the comments.

On Fri, Apr 03, 2020 at 02:10:53PM +0200, Rasmus Villemoes wrote:
> On 03/04/2020 11.11, Sakari Ailus wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.
> 
> This seems quite niche to me, I'm not sure that belongs in vsprintf.c.
> What's wrong with having a
> 
> char *fourcc_string(char *buf, u32 x)
> 
> that formats x into buf and returns buf, so it can be used in a
> 
> char buf[8];
> pr_debug("bla: %s\n", fourcc_string(buf, x))

I guess that could be one option. But changing the implementation could
require changing the size of all those buffers.

We had this approach, too:

<URL:https://lore.kernel.org/linux-media/20190916100433.24367-1-hverkuil-cisco@xs4all.nl/>

Let's see if we'll get more comments on this.

> 
> Or, for that matter, since it's for debugging, why not just print x with
> 0x%08x?

People generally prefer readable output that they can understand. The codes
are currently being printed in characters, and that's how they are defined
in kernel headers, too. Therefore the hexadecimal values are of secondary
importance (although they could be printed too, as apparently a similar
function in DRM does).

> 
> At the very least, the "case '4'" in pointer() should be guarded by
> appropriate CONFIG_*.
> 
> Good that Documentation/ gets updated, but test_printf needs updating as
> well.

Agreed.

> 
> 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > since v1:
> > 
> > - Improve documentation (add -BE suffix, refer to "FourCC".
> > 
> > - Use '%p4cc' conversion specifier instead of '%ppf'.
> 
> Cute. Remember to update the commit log (which still says %ppf).

I will.

> 
> > - Fix 31st bit handling in printing FourCC codes.
> > 
> > - Use string() correctly, to allow e.g. proper field width handling.
> > 
> > - Remove loop, use put_unaligned_le32() instead.
> > 
> >  Documentation/core-api/printk-formats.rst | 12 +++++++++++
> >  lib/vsprintf.c                            | 25 +++++++++++++++++++++++
> >  2 files changed, 37 insertions(+)
> > 
> > diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> > index 8ebe46b1af39..550568520ab6 100644
> > --- a/Documentation/core-api/printk-formats.rst
> > +++ b/Documentation/core-api/printk-formats.rst
> > @@ -545,6 +545,18 @@ For printing netdev_features_t.
> >  
> >  Passed by reference.
> >  
> > +V4L2 and DRM FourCC code (pixel format)
> > +---------------------------------------
> > +
> > +::
> > +
> > +	%p4cc
> > +
> > +Print a FourCC code used by V4L2 or DRM. The "-BE" suffix is added on big endian
> > +formats.
> > +
> > +Passed by reference.
> 
> Maybe it's obvious to anyone in that business, but perhaps make it more
> clear the 4cc is stored in a u32 (and not, e.g., a __le32 or some other
> integer), that obviously matters when the code treats the pointer as a u32*.

The established practice is to use u32 (as this is really no hardware
involved) but I guess it'd be good to document that here, too.

> > +
> > +	put_unaligned_le32(*fourcc & ~BIT(31), s);
> > +
> > +	if (*fourcc & BIT(31))
> > +		strscpy(s + sizeof(*fourcc), FOURCC_STRING_BE,
> > +			sizeof(FOURCC_STRING_BE));
> 
> put_unaligned_le32(0x0045422d, s + 4) probably generates smaller code,
> and is more in line with building the first part of the string with
> put_unaligned_le32().

Uh. The fourcc code is made of printable characters (apart from the 31st
bit) so it can be printed, but I wouldn't use that here. "-BE" is just a
string and not related to 4ccs.

-- 
Regards,

Sakari Ailus
