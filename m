Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761762D5D2E
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390014AbgLJOIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 09:08:15 -0500
Received: from mga01.intel.com ([192.55.52.88]:29475 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733261AbgLJOIP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 09:08:15 -0500
IronPort-SDR: Aklkd2ouG1w1YKPIky2mX0d4GaeXzcPfZ/p5Z6fenn0Zowc8u8X6QfJRBwvH2jKQmp6I/r08xe
 DD4fPKCfWGBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="192578543"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="192578543"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 06:07:07 -0800
IronPort-SDR: EoDdnLpI+SqnpnRvYnVV7QWUxkweGYOsEBD78Q4+q9L3qi7LLueBvmqYxBZEz3AzFl+ps4cJza
 lVT8w83o2SFA==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="348822288"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 06:07:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1knMc1-00DR1Y-Ma; Thu, 10 Dec 2020 16:08:05 +0200
Date:   Thu, 10 Dec 2020 16:08:05 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20201210140805.GI4077@smile.fi.intel.com>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X9Hdg3lJm+TZAQGX@alley>
 <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
 <20201210135526.GH25763@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210135526.GH25763@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 03:55:27PM +0200, Sakari Ailus wrote:
> On Thu, Dec 10, 2020 at 03:05:02PM +0200, Andy Shevchenko wrote:
> > On Thu, Dec 10, 2020 at 2:16 PM Petr Mladek <pmladek@suse.com> wrote:
> > > On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > > so the same implementation can be used.
> > > >
> > > > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > Andy, Rasmus,
> > >
> > > the last version looks fine to me. I am going to push it.
> > > Please, speak up if you are against it.
> > 
> > My concerns are:
> > - not so standard format of representation (why not to use
> > string_escape_mem() helper?) or is it?
> 
> The format string may contain spaces that are not meant to be printed.
> Other unprintable chacaters should not be present (at least not in V4L2
> pixelformats). The hexadecimal representation is there to convey the
> numerical value and that originally came from DRM, not V4L2.

Yes, but I mean that we usually anticipate the escaped characters in a form of
'\xNN' (hex) or '\NNN' (octal). The format '(NN)' is quite unusual to me.

> > - no compatibility with generic 4cc
> >   (I would rather have an additional specifier here for v4l2 cases.
> 
> What do you mean by "generic 4cc"? There are two users of 4cc codes in the
> kernel that I know of: V4L2 and DRM. Something that does not refer to
> in-memory pixel formats?

Of course. Everything else. 4cc is a generic term to describe something which
is of 4 characters long [1]. It's not limited by media file formats. And
moreover some (chip) vendors are using it as well (Synopsys).
Microsoft uses 4cc in CSRT ACPI table for vendor field and so on...

[1]: https://en.wikipedia.org/wiki/FourCC

-- 
With Best Regards,
Andy Shevchenko


