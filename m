Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4214F2D5CA6
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 15:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389767AbgLJN5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 08:57:20 -0500
Received: from mga12.intel.com ([192.55.52.136]:31178 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389761AbgLJN5T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 08:57:19 -0500
IronPort-SDR: ax8s0qgw/LucKMSCGW16dRaY+YcxxtjuVaSM6N+nhcf3ml9mf5sSYRXS2WCnNXl/XNa/dglCgz
 NkahukKm0y7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="153489126"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="153489126"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:55:32 -0800
IronPort-SDR: do9N5KAms1qR1BOwmxto6A9gdtKSLM0DRNag1vpRcF0IUs+o5GUMiJyk2pQIUo7Qq+z5wAtONr
 3hHkpPXoLG1w==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="371650813"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 05:55:29 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1BFBB20867; Thu, 10 Dec 2020 15:55:27 +0200 (EET)
Date:   Thu, 10 Dec 2020 15:55:27 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <20201210135526.GH25763@paasikivi.fi.intel.com>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X9Hdg3lJm+TZAQGX@alley>
 <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcY_b7uaGWoEa1Y6YDk0MmmzC4hV2yx8zVT7J-fD67Hyg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Thu, Dec 10, 2020 at 03:05:02PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 10, 2020 at 2:16 PM Petr Mladek <pmladek@suse.com> wrote:
> > On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > so the same implementation can be used.
> > >
> > > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > Andy, Rasmus,
> >
> > the last version looks fine to me. I am going to push it.
> > Please, speak up if you are against it.
> 
> My concerns are:
> - not so standard format of representation (why not to use
> string_escape_mem() helper?) or is it?

The format string may contain spaces that are not meant to be printed.
Other unprintable chacaters should not be present (at least not in V4L2
pixelformats). The hexadecimal representation is there to convey the
numerical value and that originally came from DRM, not V4L2.

> - no compatibility with generic 4cc
>   (I would rather have an additional specifier here for v4l2 cases.

What do you mean by "generic 4cc"? There are two users of 4cc codes in the
kernel that I know of: V4L2 and DRM. Something that does not refer to
in-memory pixel formats?

> OTOH generic %p4cc to me sounds like an equivalent to %4pEh (but we
> have similar cases with MAC where %6ph is the same as %pM).
> 
> But I'm not insisting on them, consider it like just my 2 cents to the
> discussion.

Ack.

-- 
Kind regards,

Sakari Ailus
