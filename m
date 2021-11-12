Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B4E44E5A5
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 12:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbhKLLkp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 06:40:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:6016 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233883AbhKLLkn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 06:40:43 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="231844604"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="231844604"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 03:37:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="670626269"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2021 03:37:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mlUs4-0065Aa-69;
        Fri, 12 Nov 2021 13:37:28 +0200
Date:   Fri, 12 Nov 2021 13:37:27 +0200
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
Message-ID: <YY5R99cHfxZe5M0M@smile.fi.intel.com>
References: <6ee7c491-4636-8819-c954-dfc6abcfd1a5@gmail.com>
 <495cbb6b-656d-6c3b-669a-f4b588e970cc@redhat.com>
 <a26f70ae-203e-99fd-8e4d-484af6f207f7@gmail.com>
 <4c7b9d72-4634-ea1d-5fff-bf17c3834b72@redhat.com>
 <CAPY8ntBZpZjecHNCMf-eMefcp2EgmbqkXMt4p=UeOe0n-o8WrA@mail.gmail.com>
 <6e832988-4810-fe59-7357-886b286697a0@redhat.com>
 <CAPY8ntB3pT4EqornywTtqcn4_iD-QUHPkApq=nb3XCc+6CuepA@mail.gmail.com>
 <YY2Ta34aTqFKPYnS@pendragon.ideasonboard.com>
 <CAPY8ntABHNcgO4iVOryYZsdePVvjTiddZJCBah60LuzSXkL3PA@mail.gmail.com>
 <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YY5GIFudxS81q/Qp@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 12:46:56PM +0200, Laurent Pinchart wrote:
> On Fri, Nov 12, 2021 at 10:32:31AM +0000, Dave Stevenson wrote:
> > On Thu, 11 Nov 2021 at 22:04, Laurent Pinchart wrote:

> > Sorry, just my two-penneth as someone who has to support general
> > users, rather than just develop platforms or address specific use
> > cases.
> 
> As mentioned above, I certainly don't oppose improving power management
> for VCMs, as well as the VCM control API in general, as long as we can
> cover all use cases. I'm not familiar enough with the use cases to tell
> whether making the kernel side more "clever" would be just fine or could
> cause issues.

Personally I found the

  kernel <--> library in userspace <--> another library or app

schema is more flexible in many ways:
 - we unburden kernel from the heavy code that has nothing to
   do directly with HW
 - we allow nevertheless to use kernel ABIs if needed
 - we decrease burden of the ABI evolution by doing it in only
   two places

After all this kind of schema might lead us at some point to the
shifting of 'we don't break user space' paradigm to the 'we hardly
try not to break user space and do not break library ABIs / APIs
in user space'.

-- 
With Best Regards,
Andy Shevchenko


