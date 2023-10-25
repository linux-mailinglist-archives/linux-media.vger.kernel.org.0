Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5957D753F
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 22:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjJYUMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 16:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJYUMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 16:12:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C0B111
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698264742; x=1729800742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=abTWRlrIWSRtNhVS1YgsyUlvqZ2d4AklIw++bSVjRWY=;
  b=gh6FNlVbQkA6JimtU3FPbgOaKF6ScVJ/ugsuUhRVr0rMeGwZ+IlXkWRu
   YmT8Ug1Gq9p4+b6X2UCq37nDqEI74AfsagqgrzNrb87RbXk5am2qRjVdC
   2JbLmojl8+bDSXo8f8ysiGu5fsxs3I+5bxEH5o4ZA8gB+HAkRzYgxyvpw
   yUtJMqjgj6DSJLY5evjYHyvwC5kUCPQD5CufKbNCPUq5TI/W0xefJKzlf
   4DLtUeo2bQJXKGQKWy/sbxPUWatE4Is0OgYjuB+imxxYw32LXOV/dFR4c
   WDsU1/FRKxg5kpphy8aeKJZSIAJcR1yj1bSZWMRYjMgubKL5XDW7LneUr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451629488"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="451629488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:12:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849660053"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="849660053"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:12:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A410411FAAC;
        Wed, 25 Oct 2023 23:12:16 +0300 (EEST)
Date:   Wed, 25 Oct 2023 20:12:16 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 17/28] media: v4l: subdev: Return routes set using
 S_ROUTING
Message-ID: <ZTl2oP-5jvOJzzju@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-8-sakari.ailus@linux.intel.com>
 <b7cd29a5-c198-4b5b-a88c-ffac18777df8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7cd29a5-c198-4b5b-a88c-ffac18777df8@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 05, 2023 at 01:05:17PM +0200, Hans Verkuil wrote:
> On 03/10/2023 14:08, Sakari Ailus wrote:
> > Return the routes set using S_ROUTING back to the user. Also reflect this
> > in documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++--
> >  drivers/media/v4l2-core/v4l2-subdev.c                        | 5 ++++-
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 9a9765ddc316..ced53ea5f23c 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -43,8 +43,9 @@ The routing configuration determines the flows of data inside an entity.
> >  Drivers report their current routing tables using the
> >  ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
> >  with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> > -setting or clearing flags of the  ``flags`` field of a
> > -struct :c:type:`v4l2_subdev_route`.
> > +setting or clearing flags of the ``flags`` field of a struct
> > +:c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``, also
> > +``VIDIOC_SUBDEV_S_ROUTING`` returns the routes back to the user.
> >  
> >  All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
> >  called. This means that the userspace must reconfigure all streams after calling
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index bd1e8205913c..9a34e13dfd96 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -935,9 +935,12 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		krouting.len_routes = routing->len_routes;
> >  		krouting.routes = routes;
> >  
> > -		return v4l2_subdev_call(sd, pad, set_routing, state,
> > +		rval = v4l2_subdev_call(sd, pad, set_routing, state,
> >  					routing->which, &krouting);
> > +		if (rval < 0)
> > +			return rval;
> >  	}
> > +		fallthrough;
> 
> Admittedly, it is a bit hard to see from just this patch, but I think
> the actual code that VIDIOC_SUBDEV_S_ROUTING has to do here is just
> a very few lines from VIDIOC_SUBDEV_G_ROUTING. I think it is better
> to explicitly have them here, then doing a fallthrough.
> 
> Most of what is in VIDIOC_SUBDEV_G_ROUTING are just a bunch of checks
> that are already done in VIDIOC_SUBDEV_S_ROUTING.

Ack, I'll change this for v7.

-- 
Regards,

Sakari Ailus
