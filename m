Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B5D4432BE
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 17:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbhKBQeS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 12:34:18 -0400
Received: from mga12.intel.com ([192.55.52.136]:7297 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234742AbhKBQKo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Nov 2021 12:10:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="211356866"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="211356866"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 08:49:40 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="583627869"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 08:49:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mhw2I-0033Ff-15;
        Tue, 02 Nov 2021 17:49:18 +0200
Date:   Tue, 2 Nov 2021 17:49:17 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
Message-ID: <YYFd/Zb4aT3Qfjpi@smile.fi.intel.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
 <20211017162337.44860-4-kitakar@gmail.com>
 <20211102130245.GE2794@kadam>
 <CAHp75VeThcCywYZsrUNYSA3Yc3MjJwfiCBCGep1DpWFFUg71cw@mail.gmail.com>
 <CAHp75VdnvxCWYrdrBqtSDP0A2PCT6dYvHAhszY9iH9ooWKT49g@mail.gmail.com>
 <20211102150523.GJ2794@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102150523.GJ2794@kadam>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 02, 2021 at 06:05:23PM +0300, Dan Carpenter wrote:
> On Tue, Nov 02, 2021 at 04:45:20PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 2, 2021 at 4:44 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Nov 2, 2021 at 3:10 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:

...

> > > > Run your patches through scripts/checkpatch.pl.
> > >
> > > While it's good advice, we are dealing with quite a bad code under
> > > staging, so the requirements may be relaxed.
> > 
> > To be more clear: the goal now is getting it _working_. That's why
> > this kind of noise is not important _for now_.
> 
> If it's a new driver, then we accept all sorts of garbage, that's true.

It was in kernel for a while, but never worked (hence anyhow tested)
up to the recent effort made by Tsuchiya.

In any case, as I said, we shall run checkpatch in the future when
we have something working.

-- 
With Best Regards,
Andy Shevchenko


