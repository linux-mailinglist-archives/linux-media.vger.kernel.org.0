Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F07131C06D
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 18:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhBORYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 12:24:35 -0500
Received: from mga06.intel.com ([134.134.136.31]:41954 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230418AbhBORXb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 12:23:31 -0500
IronPort-SDR: c7saTC4Hoxn0Ow8Ey35yhqMKKF6wdAD0TgtD8L2/DoapXTK1i9U7Z/SHwUWNe+j+b0GUJQGwYM
 7yc8gUl2wY6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="244206736"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="244206736"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:21:40 -0800
IronPort-SDR: geRpXhgmUT9FMi4UccziIcMxaTZyiBds3SjXanW6DPrJxmk0e5swhB0HicfkwGS4oAhIIEeQTL
 su/W5+KEreZg==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="588917260"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:21:35 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2A17320518;
        Mon, 15 Feb 2021 19:21:03 +0200 (EET)
Date:   Mon, 15 Feb 2021 19:21:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
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
Message-ID: <20210215172103.GJ3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
 <YCp3sdZoalFSUS7u@smile.fi.intel.com>
 <20210215135650.GI3@paasikivi.fi.intel.com>
 <YCqZR5N6ktABHXNf@smile.fi.intel.com>
 <YCqmnG9r2gogFPsH@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCqmnG9r2gogFPsH@alley>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petr,

On Mon, Feb 15, 2021 at 05:51:40PM +0100, Petr Mladek wrote:
> On Mon 2021-02-15 17:54:47, Andy Shevchenko wrote:
> > On Mon, Feb 15, 2021 at 03:56:50PM +0200, Sakari Ailus wrote:
> > > On Mon, Feb 15, 2021 at 03:31:29PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> > > > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > > > so the same implementation can be used.
> > > > 
> > > > This version I almost like, feel free to add
> > > > Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > after considering addressing below nit-picks.
> > 
> > > > > +Examples::
> > > > > +
> > > > > +	%p4cc	BG12 little-endian (0x32314742)
> > > > 
> > > > No examples with spaces / non-printable / non-ascii characters
> > > 
> > > I can sure add an example that has a space. But do you think I really
> > > should add an example where invalid information is being printed?
> > 
> > I think you have to provide better coverage of what user can get out of this.
> > Perhaps one example with space and non-printable character is enough.
> > 
> > > > > +	char output[sizeof("1234 little-endian (0x01234567)")];
> > > > 
> > > > 1234 -> ABCD ? (Or XY12 to be closer to the reality)
> > > 
> > > I count in numbers... albeit the hexadecimal number there starts from zero.
> > > 
> > > I guess both would work though.
> > > 
> > > 0123 would be consistent.
> > 
> > Since letters can be printed the above is confusing a bit. I think XY12 is
> > closer to the reality than 0123.
> 
> Ailus, are you going to send v8 with the two small changes? I mean a
> selftest with the space and the above sample code.

Yes, and a few more examples.

> 
> Anyway, feel free to add:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Thank you.

It'd be great if we could merge this through the printk tree. Acks are
needed from the DRM people first.

-- 
Regards,

Sakari Ailus
