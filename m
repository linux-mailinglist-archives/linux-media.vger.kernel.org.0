Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C068B498529
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 17:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243424AbiAXQrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 11:47:55 -0500
Received: from mga07.intel.com ([134.134.136.100]:28979 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235273AbiAXQrx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 11:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643042873; x=1674578873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TgPmsrSb/R55h1wIMFatBL4XL6tX+UDBIGle7w4IA5o=;
  b=XsiSbgsr/ZTN7w0BKzn5zYHxLt9kymWXVB/3TxfE+Q6znPGBq4iEwlFF
   laO52oNMopvS4mzkWJ8HqVbYdnhEhN3L7VYfePcHIOD+wqst1aTyhTFcn
   MhM2SwOguO3+dbzeSz7YaBMGbtjBCtycCfM+ohAh/vLXHjscjwLah/W0z
   9oQg/2JeLyJrENVFK2gNVkd6B0QFAzSoasufwTn3ZYwJbnTtsa6AqW+I6
   LyyfHnfoE2gIIRGrVGuEkPnuT/5f53DoLiZiBOIdgPvQ7dUl1R6DG+lw5
   uUfMHrmNOEqHocTQf7GBbGgG+an3TUurz33EWZwxFPnKWsf8prhCJidNK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309409537"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="309409537"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:47:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="520014410"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 08:47:51 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 163CA2036B;
        Mon, 24 Jan 2022 18:47:49 +0200 (EET)
Date:   Mon, 24 Jan 2022 18:47:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 3/3] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <Ye7YNcIoge5rjIae@paasikivi.fi.intel.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
 <20220122163656.168440-4-sakari.ailus@linux.intel.com>
 <YeyYbk5hBodwa0FH@pendragon.ideasonboard.com>
 <Ye7Ns4UMUUDpB3AM@paasikivi.fi.intel.com>
 <Ye7ScPzWH20vDv3Z@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ye7ScPzWH20vDv3Z@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 24, 2022 at 06:23:12PM +0200, Laurent Pinchart wrote:
> On Mon, Jan 24, 2022 at 06:02:59PM +0200, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Sun, Jan 23, 2022 at 01:51:10AM +0200, Laurent Pinchart wrote:
> > 
> > ...
> > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > index 642cb90f457c..81ebf6cca522 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > @@ -18,6 +18,7 @@
> > > >  
> > > >  #include <linux/videodev2.h>
> > > >  
> > > > +#include <media/media-device.h> /* for media_set_bus_info() */
> > > >  #include <media/v4l2-common.h>
> > > >  #include <media/v4l2-ioctl.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > > @@ -1069,6 +1070,8 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
> > > >  	cap->capabilities |= V4L2_CAP_EXT_PIX_FORMAT;
> > > >  	cap->device_caps |= V4L2_CAP_EXT_PIX_FORMAT;
> > > >  
> > > > +	media_set_bus_info(cap->bus_info, vfd->dev_parent);
> > > > +
> > > 
> > > Shouldn't you do this before calling the driver operation, if you want
> > > to allow driver overrides ?
> > 
> > This is done conditionally based on the value of the first byte.
> 
> I had missed that.
> 
> Isn't it still better to call media_set_bus_info() first, instead of
> checking the first byte ?

The result would be no different although it's easier to see what's going
on. This approach would work for querycap but not for media device init.

I'll take this into account in v2.

-- 
Sakari Ailus
