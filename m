Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72E8498423
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240897AbiAXQDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:03:04 -0500
Received: from mga01.intel.com ([192.55.52.88]:6329 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240900AbiAXQDD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643040183; x=1674576183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZtKjdgQIY1Q1ZGGp8SkXMTIPQ+HJru2toBvznSWpXso=;
  b=VycjVxVDTf7PRjTq02+WD6BKNJEhLHO8VDMD9nKXLd+nIuvesSAvKnp4
   57HeHSsMiLfeyAn/lJwKmJ+VlVinusd3ocjrTgTvoR9xuofXy6oDbs/PR
   7hB6vnvo8z85Eo8ZyE3UCtyJEVex8NWjpLCQa7mGvIPI63MMymPSbk1Kb
   0uSoUDZvZzhuELOSX8muHKtaSKuhasa1gH3KLHEbjRjexmnKUprw2aetO
   ghI8uuSJzm5A06UQ3+vn7woaMe+YVxVOtZZNEukYwEZLBN5+UYBjvJx69
   DI5N0aAyEspyPVcc4G06E0B4DUEUBzxL4tpeo5MY2rRBMc3G8ShJ9QDZK
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="270512182"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="270512182"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:03:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="476764317"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:03:01 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id C9A8E20287;
        Mon, 24 Jan 2022 18:02:59 +0200 (EET)
Date:   Mon, 24 Jan 2022 18:02:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 3/3] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <Ye7Ns4UMUUDpB3AM@paasikivi.fi.intel.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-4-sakari.ailus@linux.intel.com>
 <YeyYbk5hBodwa0FH@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeyYbk5hBodwa0FH@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jan 23, 2022 at 01:51:10AM +0200, Laurent Pinchart wrote:

...

> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 642cb90f457c..81ebf6cca522 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -18,6 +18,7 @@
> >  
> >  #include <linux/videodev2.h>
> >  
> > +#include <media/media-device.h> /* for media_set_bus_info() */
> >  #include <media/v4l2-common.h>
> >  #include <media/v4l2-ioctl.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -1069,6 +1070,8 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
> >  	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
> >  	cap->device_caps |= V4L2_CAP_EXT_PIX_FORMAT;
> >  
> > +	media_set_bus_info(cap->bus_info, vfd->dev_parent);
> > +
> 
> Shouldn't you do this before calling the driver operation, if you want
> to allow driver overrides ?

This is done conditionally based on the value of the first byte.

-- 
Sakari Ailus
