Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E223A7AE555
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 07:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbjIZF5J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 01:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbjIZF5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 01:57:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D638110A
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 22:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695707820; x=1727243820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iRy5mtxmoYBRvIwUhhuv5KikjVeqxSp8UIwFK+Jdc4k=;
  b=H8ZIavzKjcqXHZeQIorPsrreBUd2CLq7+usNKQphIcZIO4gNRJh3GsMt
   ESPJPgioMHiY0D6Of/QYBK1C/p+0Zan3yt8gIsAgHVkDLhMAC+lwOoF6b
   asq9OcUVT1QbnOtM5nr/Wg4bpd4rOAU0dzdL5Fd06BJP464PbokKcA8jJ
   y54crYeEBf+Uflx9ogwvMjkoiqq5IjKqvgrsJ4q0CnbsuyYyqGP8kuDo7
   zLfgYKjEbBIlTAV+81NGx2qqS4n6bUCH5PlTO3E/Wenmaj1VfWU9caUa4
   C9o+qVtmSPnvvdnIEShMeSwbr+nyXqES2AYsvGHIu/3ErHVPWGvtNuV7a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371825337"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="371825337"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 22:56:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748700327"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="748700327"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 22:56:56 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 00011120A59;
        Tue, 26 Sep 2023 08:56:52 +0300 (EEST)
Date:   Tue, 26 Sep 2023 05:56:52 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v4 21/23] media: uapi: Allow a larger number of routes
 than there's room for
Message-ID: <ZRJypKqSfTK7G2Nw@kekkonen.localdomain>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
 <20230922142239.259425-22-sakari.ailus@linux.intel.com>
 <20230925213202.GA12446@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925213202.GA12446@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 26, 2023 at 12:32:02AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Sep 22, 2023 at 05:22:37PM +0300, Sakari Ailus wrote:
> > On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
> > as there's room. Do not consider it an error if more routes existed.
> > Simply inform the user there are more routes.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst   | 4 ----
> >  drivers/media/v4l2-core/v4l2-subdev.c                     | 8 ++------
> >  2 files changed, 2 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index ced53ea5f23c..99d3c15fd759 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -145,10 +145,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
> >  appropriately. The generic error codes are described at the
> >  :ref:`Generic Error Codes <gen-errors>` chapter.
> >  
> > -ENOSPC
> > -   The application provided ``num_routes`` is not big enough to contain
> > -   all the available routes the subdevice exposes.
> > -
> >  EINVAL
> >     The sink or source pad identifiers reference a non-existing pad, or reference
> >     pads of different types (ie. the sink_pad identifiers refers to a source pad).
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 1bcc96cde6da..7871ec8a66d1 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -956,14 +956,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  
> >  		krouting = &state->routing;
> >  
> > -		if (routing->len_routes < krouting->num_routes) {
> > -			routing->num_routes = krouting->num_routes;
> > -			return -ENOSPC;
> > -		}
> > -
> >  		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> >  		       krouting->routes,
> > -		       krouting->num_routes * sizeof(*krouting->routes));
> > +		       min(krouting->num_routes, krouting->len_routes) *
> 
> This should be
> 
> 		       min(krouting->num_routes, routing->len_routes) *

Thanks. I'll address this in v5.

> 
> > +		       sizeof(*krouting->routes));
> >  		routing->num_routes = krouting->num_routes;
> >  
> >  		return 0;

-- 
Sakari Ailus
