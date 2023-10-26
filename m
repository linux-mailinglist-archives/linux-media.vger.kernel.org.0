Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6DCE7D7DB7
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 09:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjJZHjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 03:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjJZHjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 03:39:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F44186
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 00:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698305962; x=1729841962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a2m1TRBEGGqSofRW06GDkC08Q6cR3TSIz5/IjxYK47k=;
  b=PNhJad+doFLF2eNlsrOlkSv2rxazEBV9ILoDtaBM1FJxyj1CN+aQjerl
   nwK1GpPzRL26bZkw8UJqCzJZ200cDuAe1XbUlGpRUc+2KZf7oTlwanwGp
   DoND6u3chTH1ZqogNLNKSd1tyySrEbJezE2S7/aTxk2sibPTEjI7XNgkE
   gcNTAq+A2yMNnPxMluBa+jjy3vjZuiOF4nLWLLpUowS6teTG6LrVu9NMD
   nJTRlP1E3UVb+8BHd3CfmhHy4c/YoBceaJZr9aIOTufrGP+DVRvBEPvtc
   Szd1nhHCy7lD357IH8tOu6+8ob4aFmbFBgECvjVLztnhSo+wh5NHC7k1D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390340082"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="390340082"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:39:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="788393027"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="788393027"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:39:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 880D211FAF5;
        Thu, 26 Oct 2023 10:39:16 +0300 (EEST)
Date:   Thu, 26 Oct 2023 07:39:16 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 2/9] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZToXpFsVWBhMCf0t@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-3-sakari.ailus@linux.intel.com>
 <190d7dea-c07a-4ef4-a596-c583edeb6e9e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <190d7dea-c07a-4ef4-a596-c583edeb6e9e@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 26, 2023 at 09:11:04AM +0200, Hans Verkuil wrote:
> On 26/10/2023 09:03, Sakari Ailus wrote:
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
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 51 +++++++++++++++++++++++++++
> >  include/media/v4l2-subdev.h           |  9 +++--
> >  2 files changed, 57 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index ee4fe8f33a41..7feaea6b04ad 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1684,6 +1684,23 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
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
> > +		/*
> > +		 * Set the pad to 0 on error as this is aligned with the
> > +		 * behaviour of the pad state information access functions.
> > +		 */
> 
> This comment does not explain why pad can be an invalid value or why we
> map that to 0 instead of returning an error.
> 
> The phrase "as this is aligned with the behaviour of..." makes no sense:
> if it was aligned with that, then you wouldn't need a WARN_ON.

Nevertheless this is true: the pad state information access functions have
that same WARN_ON().

The original reason for this is to avoid accessing memory outside the
array. Primarily the source of this was previously state being NULL (for
state-unaware drivers), but we have a check for this already earlier on. I
can add this.

Note that the comment is removed later on in the set as the function will
return NULL in this case as well, so polishing it will not have any long
term benefits. :-)

> 
> If this WARN_ON is triggered, and someone investigates, then this comment
> should explain why you got it and how to fix it.
> 
> I'm also wondering if this should be a WARN_ON_ONCE. If this is wrong,
> won't you get this warning a lot?

Probably so, indeed. I can switch it to WARN_ON_ONCE().

> 
> > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > +			pad = 0;
> > +
> > +		return &state->pads[pad].try_fmt;
> > +	}
> > +
> 

-- 
Regards,

Sakari Ailus
