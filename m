Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF2531C0C0
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 18:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhBORiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 12:38:16 -0500
Received: from mga11.intel.com ([192.55.52.93]:31645 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232430AbhBORiG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 12:38:06 -0500
IronPort-SDR: 20uhJ7i1OHYDuC174w5yDe8p29tNtGp/OF7QAm1SuIYRN3o23I/1GSIBG0eDZKKUxDotbLkGj9
 jAbfCNnUI0kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="179226327"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="179226327"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:36:20 -0800
IronPort-SDR: HZkYD9uJOUAnACWzxIm2MliZ5P0Ipj1zDYQXW4WQHugCDmw3twAdYGKZRMCVepphS80ut/iYdr
 m/997U/z7r3w==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="424332046"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:36:17 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBhnC-005HSI-JK; Mon, 15 Feb 2021 19:36:14 +0200
Date:   Mon, 15 Feb 2021 19:36:14 +0200
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
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <YCqxDsCpjODcLhbp@smile.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
 <20210215172655.GL3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215172655.GL3@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 15, 2021 at 07:26:55PM +0200, Sakari Ailus wrote:
> On Mon, Feb 15, 2021 at 03:41:14PM +0200, Andy Shevchenko wrote:
> ...
> > > +	seq_printf(m, "\t\tuapi: [FB:%d] ", fb ? fb->base.id : 0);
> > > +	if (fb)
> > > +		seq_printf(m, "%p4cc", &fb->format->format);
> > > +	else
> > > +		seq_puts(m, "n/a");
> > 
> > > +	seq_printf(m, ",0x%llx,%dx%d, visible=%s, src=" DRM_RECT_FP_FMT ", dst=" DRM_RECT_FMT ", rotation=%s\n",
> > 
> > Why not to keep two seq_printf() calls?
> > 
> > if (fb) {
> > 	seq_printf();
> > } else {
> > 	seq_printf();
> > }
> > 
> > ?
> 
> I could, but it'd repeat a lot of the same format string that is very
> complicated right now. Therefore I thought it's better to split.

It's fine, why not?

> Or do you mean seq_printf() vs. seq_puts()? checkpatch.pl (rightly) warns
> about it.

If it doesn't take run-time parameters, then definitely
if (fb)
	seq_printf();
else
	seq_puts();

> > >  		   fb ? fb->modifier : 0,
> > >  		   fb ? fb->width : 0, fb ? fb->height : 0,
> > >  		   plane_visibility(plane_state),

-- 
With Best Regards,
Andy Shevchenko


