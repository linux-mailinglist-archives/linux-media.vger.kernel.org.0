Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13AE315120
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 15:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhBIOBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 09:01:19 -0500
Received: from mga17.intel.com ([192.55.52.151]:21970 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231135AbhBIOAM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 09:00:12 -0500
IronPort-SDR: z1e9eDjPMLmE/7WRo/xvcHHVzmyT4Er5fJjvBeX+0oIflKxPAXiU1FjEntfHH/psojq+iiMTh/
 vGE4/At19n5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="161631320"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="161631320"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 05:58:23 -0800
IronPort-SDR: fbcFkfxI0Fa4AC+LfvEwX7YMNHGwehcMIqgwFS77VTBC+afRizCswvdfHN1HH2Mvbs7YsvFYy7
 2xPKK6sY2m+g==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="378978690"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 05:58:21 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2ED00206D0; Tue,  9 Feb 2021 15:58:19 +0200 (EET)
Date:   Tue, 9 Feb 2021 15:58:19 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx334: Fix an error message
Message-ID: <20210209135819.GE32460@paasikivi.fi.intel.com>
References: <YCJsUCngklBkJMgw@mwanda>
 <20210209120804.GD32460@paasikivi.fi.intel.com>
 <20210209134938.GP2696@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209134938.GP2696@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 09, 2021 at 04:49:39PM +0300, Dan Carpenter wrote:
> On Tue, Feb 09, 2021 at 02:08:04PM +0200, Sakari Ailus wrote:
> > Hi Dan,
> > 
> > On Tue, Feb 09, 2021 at 02:04:48PM +0300, Dan Carpenter wrote:
> > > The "ret" variable is uninitialized in this error message.
> > > 
> > > Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Thanks for the patch. This has been already addressed by a patch from Hans
> > (but not merged yet):
> > 
> > <URL:https://patchwork.linuxtv.org/project/linux-media/patch/917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl/>
> > 
> > > ---
> > > When new drivers are merged into the kernel, then could we use the
> > > driver prefix?  In other words something like this:
> > > 
> > > media: i2c/imx334: Add imx334 camera sensor driver
> > 
> > We've usually had driver's name and Mauro's scripts add media: prefix ---
> > unless it's already there. Are you suggesting also the bus should be part
> > of it?
> 
> No, what I'm saying is when people add a new driver they do:
> 
> [PATCH] subsystem: Add new driver for foo345
> 
> But it would be better if they added "foo345" to the prefix.
> 
> [PATCH] subsystem: foo345: Add new driver for foo345

Ah, yes. I also prefer this but I guess this hasn't been consistently
enforced nor documented (or is it?) and can be easily missed in review.
Then there are patches that touch a number of drivers at the same time...

> 
> Doing it the way that I'm suggesting has become more common for the past
> four years.  Four years ago was when I started complaining that I can't
> guess the correct prefix for new drivers.  That was also the last time
> that someone complained to me that I had used the incorrect patch prefix.
> I would argue that Hans used the wrong patch prefix for his patch so
> maybe we have just become more mellow these days.
> 
> And also I'm surprised that Mauro adds the media: prefix for you instead
> of making everyone do it themselves...  He's the only person who does
> this that I know of.

It's possible since Mauro picks the patches from the pull request instead
of pulling it.

-- 
Sakari Ailus
