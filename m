Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD904507CF
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 16:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhKOPGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 10:06:40 -0500
Received: from mga17.intel.com ([192.55.52.151]:1767 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232090AbhKOPGh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 10:06:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="214176650"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="214176650"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 07:03:42 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
   d="scan'208";a="454049874"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 07:03:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mmdW7-0077mt-BS;
        Mon, 15 Nov 2021 17:03:31 +0200
Date:   Mon, 15 Nov 2021 17:03:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YZJ2wzYTQnZBe9ev@smile.fi.intel.com>
References: <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
 <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
 <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
 <CAPY8ntABHNcgO4iVOryYZsdePVvjTiddZJCBah60LuzSXkL3PA@mail.gmail.com>
 <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
 <YY5R99cHfxZe5M0M@smile.fi.intel.com>
 <YZJhxJ+z4Zvg8ewP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZJhxJ+z4Zvg8ewP@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 15, 2021 at 03:33:56PM +0200, Laurent Pinchart wrote:
> On Fri, Nov 12, 2021 at 01:37:27PM +0200, Andy Shevchenko wrote:
> > On Fri, Nov 12, 2021 at 12:46:56PM +0200, Laurent Pinchart wrote:
> > > On Fri, Nov 12, 2021 at 10:32:31AM +0000, Dave Stevenson wrote:
> > > > On Thu, 11 Nov 2021 at 22:04, Laurent Pinchart wrote:
> > 
> > > > Sorry, just my two-penneth as someone who has to support general
> > > > users, rather than just develop platforms or address specific use
> > > > cases.
> > > 
> > > As mentioned above, I certainly don't oppose improving power management
> > > for VCMs, as well as the VCM control API in general, as long as we can
> > > cover all use cases. I'm not familiar enough with the use cases to tell
> > > whether making the kernel side more "clever" would be just fine or could
> > > cause issues.
> > 
> > Personally I found the
> > 
> >   kernel <--> library in userspace <--> another library or app
> > 
> > schema is more flexible in many ways:
> >  - we unburden kernel from the heavy code that has nothing to
> >    do directly with HW
> >  - we allow nevertheless to use kernel ABIs if needed
> >  - we decrease burden of the ABI evolution by doing it in only
> >    two places
> 
> I think that's generally true (provided the low-level userspace library
> is well designed). In this specific case, we're moving towards that
> model, and even if it ends up being better, I agree with Dave that the
> transition can be painful.
> 
> > After all this kind of schema might lead us at some point to the
> > shifting of 'we don't break user space' paradigm to the 'we hardly
> > try not to break user space and do not break library ABIs / APIs
> > in user space'.
> 
> Is that an officially allowed policy for kernel subsystems ?

Keyword is "might". And no, it's not allowed right now, but that's I recognize
as a trend.

-- 
With Best Regards,
Andy Shevchenko


