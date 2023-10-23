Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610347D42A0
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjJWWSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJWWSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:18:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384E1A6
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698099530; x=1729635530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N4abRzYJf6SDm97Kq+0XKBW30U0bkllspo/2XCGmRvI=;
  b=F5tjBz3jyaN5aj86gkQ/zSVW/zNJ+rL1DgItrl0iL9Nb7BH20kst9X6C
   gPIfoWc4cOA8o2T4by9zhVrI6IkGKBCGdvx5Gqv4BWsrZFkxclUVZLydo
   jmFA7d0BGaQTmlvM3W5z5WlLLCKXFm5BP+e3OIbMJyCs0qKAh6ppYE2EN
   7/5u7Pi7E2xUTgSmblsFk9NCslv/K0kDovwQz7r/hSgm6166OKPcJkaP0
   rSp/6fg43LQaG8wfQ0o/WuPOia7NMIUJFXmVp10LZi/F4CX1xPK15rjsl
   pgIPmIy05Y85YPHmrpqvZlQkRg1XOfehMidER70zCf//VlnKU2gvIm9UR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="367168931"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="367168931"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 15:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="708069809"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="708069809"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 15:18:47 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id EBF4111F830;
        Tue, 24 Oct 2023 01:18:44 +0300 (EEST)
Date:   Mon, 23 Oct 2023 22:18:44 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 2/8] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZTbxRJsCuYFyneEm@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-3-sakari.ailus@linux.intel.com>
 <20231023220729.GD18687@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023220729.GD18687@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 24, 2023 at 01:07:29AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Oct 23, 2023 at 08:44:02PM +0300, Sakari Ailus wrote:
> > There are two sets of functions that return information from sub-device
> > state, one for stream-unaware users and another for stream-aware users.
> > Add support for stream-aware functions to return format, crop and compose
> > information from pad-based array that are functionally equivalent to the
> > old, stream-unaware ones.
> > 
> > Also check state is non-NULL, in order to guard against old drivers
> > potentially calling this with NULL state for active formats or selection
> > rectangles.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
> >  include/media/v4l2-subdev.h           |  9 ++++---
> >  2 files changed, 45 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index ee4fe8f33a41..955ee9a6c91f 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1684,6 +1684,19 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> >  
> > +	if (WARN_ON(!state))
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> > +
> > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > +			pad = 0;
> 
> Do we want to carry this forward from the existing pad config accessors,
> can't we return NULL instead ?

I also think this should be changed, but again, this should be done in a
separate patch. I'd also postpone it after this set is merged.

> 
> Either way,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus
