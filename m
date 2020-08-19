Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16FE24A798
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 22:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgHSUOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 16:14:23 -0400
Received: from mga02.intel.com ([134.134.136.20]:51485 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbgHSUOX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 16:14:23 -0400
IronPort-SDR: DLGsowIk0C/93zVeOe7z6styYPmpZp3twzmafClmEA84mFNZ7LaDdIp8PS6cEkK5FhaO/XM6r9
 DebYLyzlyrbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="143007125"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="143007125"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 13:14:23 -0700
IronPort-SDR: eZ+65NvYBsXpP+0KnzcfhbezZCWthfiF2hKKWd79qMP2i1nkQYw/kcKELfKa57qxeurJLZh3vT
 5g+B9ZNgXkLQ==
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="497359589"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2020 13:14:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2B9312064F; Wed, 19 Aug 2020 23:14:19 +0300 (EEST)
Date:   Wed, 19 Aug 2020 23:14:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: i2c: max9286: Depend on GPIOLIB
Message-ID: <20200819201419.GW24582@paasikivi.fi.intel.com>
References: <20200819002252.16361-1-laurent.pinchart@ideasonboard.com>
 <12f93522-5ca3-7da8-c819-e1f29429e0b6@ideasonboard.com>
 <20200819115853.GD6049@pendragon.ideasonboard.com>
 <afe64357-5f2e-8e8c-77e6-833f84d4610f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afe64357-5f2e-8e8c-77e6-833f84d4610f@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran, Laurent,

On Wed, Aug 19, 2020 at 02:00:57PM +0100, Kieran Bingham wrote:
> Hi Laurent,
> 
> +Sakari, +Mauro,
> 
> On 19/08/2020 12:58, Laurent Pinchart wrote:
> > Hi Kieran,
> > 
> > On Wed, Aug 19, 2020 at 09:45:32AM +0100, Kieran Bingham wrote:
> >> On 19/08/2020 01:22, Laurent Pinchart wrote:
> >>> The max9286 driver depends on the GPIO library, list the dependency in
> >>> Kconfig.
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> Sakari has already posted a fix for this on the 3rd August at:
> >>
> >> [PATCH 1/1] max9286: Depend on OF_GPIO
> >>
> >> https://lore.kernel.org/linux-media/20200803090935.23619-1-sakari.ailus@linux.intel.com/
> > 
> > Is that on its way upstream ? I've submitted this patch in response to a
> > 0day bot report, the more we wait with fixes, the more likely effort
> > will be duplicated :-S
> 
> I don't know - it's out of my hands ;-)
> I've added Sakari and Mauro to this thread.
> 
> I was also pinged on this issue on the 13th August, where Randy Dunlap
> had encountered the same build error, at the time Sakari mentioned [0]
> he'll send a pull-request soon ...
> 
> [0]
> https://lore.kernel.org/linux-media/20200813215505.GC24582@paasikivi.fi.intel.com/
> 
> Is there a way to accelerate the integration of that fix?

Not really; I need the media-tree fixes branch for the 5.9 kernel first.

-- 
Sakari Ailus
