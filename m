Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B042F7AE571
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 08:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbjIZGCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 02:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjIZGCq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 02:02:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0BAD6
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695708160; x=1727244160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eyYXafCRbISZMrgPD/Q65x3lhjeI/BOWa5S2T/04fnY=;
  b=WJHhNWrt65OBTj24R2mbpn3NYEt3wGaFfzy0zYJCKHeZBVLKMzRyMzQb
   nI19WsExkijqHydrfZpETPzY9zxDlk2/K+SqE+4K+NGD11U0tKq5iKLsk
   6Gvhg0APOFLLQuVuasUSEegFIrLVX+nj3LivAQbk850RQY0pUcYcej9CK
   asnYyLJp0sjafiYD9rdahhsOz0IHYMNxZEfchYr/BhK2daYGmqkBuCAk2
   BvHbBPwiEjsvDlzkjbShv6V9bnKQXljSwMgqNkO+jxjHQxeruqxTClIWp
   d58g+k2GeJuMuJAi47pRfu+mtQujedSEKiXgXHw0UODN4smAhJk8YgUwE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385341793"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="385341793"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 23:02:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="922299238"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="922299238"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 23:02:36 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DEBFA1202BB;
        Tue, 26 Sep 2023 08:56:28 +0300 (EEST)
Date:   Tue, 26 Sep 2023 05:56:28 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v4 19/23] media: v4l: subdev: Add len_routes field to
 struct v4l2_subdev_routing
Message-ID: <ZRJyjCVC2kwjVeNf@kekkonen.localdomain>
References: <20230922142239.259425-1-sakari.ailus@linux.intel.com>
 <20230922142239.259425-20-sakari.ailus@linux.intel.com>
 <20230925210100.GA18981@pendragon.ideasonboard.com>
 <20230925213450.GA1409@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925213450.GA1409@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the review.

On Tue, Sep 26, 2023 at 12:34:50AM +0300, Laurent Pinchart wrote:
> On Tue, Sep 26, 2023 at 12:01:02AM +0300, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Sep 22, 2023 at 05:22:35PM +0300, Sakari Ailus wrote:
> > > The len_routes field is used to tell the size of the routes array in
> > > struct v4l2_subdev_routing. This way the number of routes returned from
> > > S_ROUTING IOCTL may be larger than the number of routes provided, in case
> > > there are more routes returned by the driver.
> > > 
> > > Note that this changes the (now-disabled) UAPI, users must be updated.
> > 
> > This cause a regression in all upstream drivers that call
> > v4l2_subdev_set_routing(). You need to patch the following files:
> > 
> > drivers/media/i2c/ds90ub913.c
> > drivers/media/i2c/ds90ub953.c
> > drivers/media/i2c/ds90ub960.c
> > drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > 
> > It's a bit error-prone though. Consider the following change:
> > 
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index 792f031e032a..c1c9e7018f24 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -201,6 +201,7 @@ static int mxc_isi_crossbar_init_cfg(struct v4l2_subdev *sd,
> >  		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
> >  	}
> > 
> > +	routing.len_routes = xbar->num_sources;
> >  	routing.num_routes = xbar->num_sources;
> >  	routing.routes = routes;
> > 
> > It's easy to forget to set len_routes :-S I wonder if we could do
> > better.
> 
> Actually, this isn't needed. My problem was caused by a bug in patch
> 21/23.
> 
> Still, not initializing len_routes in drivers feels wrong.

len_routes signifies the number of routes that can fit to the
user-allocated routes array. Drivers do need to ensure they don't write
more routes there, as the kernel allocates as much memory for the in-kernel
array.

-- 
Kind regards,

Sakari Ailus
