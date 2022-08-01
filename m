Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131505867F0
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 13:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbiHALKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 07:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbiHALKD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 07:10:03 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD812DABE
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659352203; x=1690888203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w54c1dB7AI+dLClSNPrRB64BYGX6SBc8+TAXFXX2T/0=;
  b=dEcXKZWtaRbmOcFBF/9H0ZcVnSSb6ReBLKQZat5RO1Sh+4pulrCWanin
   aASiSzKjSQ8pg3VDmk1S+NsY+cP3y32HvLy/PxhG7NA4AHOt47yNbCca5
   Sxti15IyEmyqqX46CW1JzARv7YJVc0cWikkv38VCwmpWpOSiOkjLfuAo3
   HLCiImEAStp68maKFlQ3fkCiEnfiz2kF0e0IaqDHWyN1vsQOW1eTbt0rP
   XJsPtnSB7NGUnhzFrVgwvWqWy96VDQsZ3xF98Sxl7eSSU6bWU2CsU1KY8
   AENUZb+DMznL/v8HbLsqOh7EgD2/pdMGgod8/BS3+VNZyy4HnMv7g5BQW
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="314943220"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="314943220"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 04:10:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="605625364"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 04:09:59 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 05D16203B7;
        Mon,  1 Aug 2022 14:09:58 +0300 (EEST)
Date:   Mon, 1 Aug 2022 11:09:57 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v12 23/30] media: subdev: Add for_each_active_route()
 macro
Message-ID: <Yue0hRJxwpNW3Qqn@paasikivi.fi.intel.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-24-tomi.valkeinen@ideasonboard.com>
 <8adf413e-1a65-6c5a-3059-57ac48ae763c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8adf413e-1a65-6c5a-3059-57ac48ae763c@ideasonboard.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Mon, Aug 01, 2022 at 11:40:21AM +0300, Tomi Valkeinen wrote:
> On 27/07/2022 13:36, Tomi Valkeinen wrote:
> 
> > @@ -1593,6 +1593,19 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
> >   				 const struct v4l2_subdev_krouting *routing,
> >   				 enum v4l2_subdev_routing_restriction disallow);
> > +struct v4l2_subdev_route *
> > +__v4l2_subdev_next_active_route(const struct v4l2_subdev_krouting *routing,
> > +				struct v4l2_subdev_route *route);
> > +
> > +/**
> > + * for_each_active_route - iterate on all active routes of a routing table
> > + * @routing: The routing table
> > + * @route: The route iterator
> > + */
> > +#define for_each_active_route(routing, route) \
> > +	for ((route) = NULL;                  \
> > +	     ((route) = __v4l2_subdev_next_active_route((routing), (route)));)
> > +
> 
> By the way, now that we can do it, how do people feel about changing the
> above (and other similar macros) to something like:
> 
> #define for_each_active_route(routing, route)        \
> 	for (struct v4l2_subdev_route *route = NULL; \
> 	     (route = __v4l2_subdev_next_active_route((routing), route));)

Will this compile? :-)

Every such macro works that way and I'd think this is expected by the
developers in general. You also often need to break out of the loop and
keep that variable intact, this also supports doing it to usual way.

I.e. I'd keep it as-is.

-- 
Sakari Ailus
