Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDE431BE69
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 17:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhBOQJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 11:09:16 -0500
Received: from mga01.intel.com ([192.55.52.88]:47735 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231907AbhBOP4u (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 10:56:50 -0500
IronPort-SDR: kA08KHtOQ8BX2+qApDy7cGEYJ3pB2xMsvWLkidqgFH1o+mhGjaXhx3IK1q3toWVwUbT+NU+Ocu
 JdUb3+/yBZiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="201886113"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="201886113"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 07:54:55 -0800
IronPort-SDR: 8ShrDZEX1xRfNPtXowVlgGEsUgQdW6OsYFrW5szNG2KuWQ5PSEcOxw8GcckjNBocJqT6yMSutm
 bzCD86KeOoDg==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="580212299"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 07:54:51 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBgD1-005GGC-W7; Mon, 15 Feb 2021 17:54:47 +0200
Date:   Mon, 15 Feb 2021 17:54:47 +0200
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
Message-ID: <YCqZR5N6ktABHXNf@smile.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-2-sakari.ailus@linux.intel.com>
 <YCp3sdZoalFSUS7u@smile.fi.intel.com>
 <20210215135650.GI3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215135650.GI3@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 15, 2021 at 03:56:50PM +0200, Sakari Ailus wrote:
> On Mon, Feb 15, 2021 at 03:31:29PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 15, 2021 at 01:40:28PM +0200, Sakari Ailus wrote:
> > > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > > so the same implementation can be used.
> > 
> > This version I almost like, feel free to add
> > Reviewed-by: From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > after considering addressing below nit-picks.

> > > +Examples::
> > > +
> > > +	%p4cc	BG12 little-endian (0x32314742)
> > 
> > No examples with spaces / non-printable / non-ascii characters
> 
> I can sure add an example that has a space. But do you think I really
> should add an example where invalid information is being printed?

I think you have to provide better coverage of what user can get out of this.
Perhaps one example with space and non-printable character is enough.

> > > +	char output[sizeof("1234 little-endian (0x01234567)")];
> > 
> > 1234 -> ABCD ? (Or XY12 to be closer to the reality)
> 
> I count in numbers... albeit the hexadecimal number there starts from zero.
> 
> I guess both would work though.
> 
> 0123 would be consistent.

Since letters can be printed the above is confusing a bit. I think XY12 is
closer to the reality than 0123.

-- 
With Best Regards,
Andy Shevchenko


