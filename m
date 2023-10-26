Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA77A7D7E6C
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbjJZIZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344578AbjJZIZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:25:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E88B8
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308710; x=1729844710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPRXW8DE2fk6yTu+EBUpX82fSJMZbgLhIXb01yy+oFI=;
  b=aYuOoZNbHlep9TCSfKDsmkcmq3H06k1PP6EBtzhYQBaPwU4PWgH0aSm/
   PXc58D89p9t/KjETeSqkOiP4N3nJNVhD5wzIiriVmXb9YkSHjP33QN4ur
   +JT/DHf+PQkF9A8TW50D9KWpCYjz3iFAiGDq0xBiR8QEIQbJrCCzxgdNq
   OEsS2zEY11BinO5hsqCybqE/tBZx3dGTI0iliIQlJFH79TdaS6p2AHx9r
   6sHNi9vjBqkV7vjUL07rM8aLGyafFlExVy/skLPIrjLsORTMcB7JunSIo
   d64IxjSVe37oOEvChj1c13UqSG5xiVTQYpbIqEixk8Rtj7tlYBy1oOjNM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387313265"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="387313265"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="882740374"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="882740374"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:25:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1EAE911FAF5;
        Thu, 26 Oct 2023 11:25:04 +0300 (EEST)
Date:   Thu, 26 Oct 2023 08:25:04 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 3/9] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <ZToiYNcD1D9cOHPG@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-4-sakari.ailus@linux.intel.com>
 <58295947-a749-4752-80c6-00c353017dce@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58295947-a749-4752-80c6-00c353017dce@xs4all.nl>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 26, 2023 at 09:26:40AM +0200, Hans Verkuil wrote:
> On 26/10/2023 09:03, Sakari Ailus wrote:
> > Rename the sub-devices state information access functions, removing
> > "_stream" from them. This makes them shorter and so more convenient to
> > use. No other sets of functions will be needed to access this information.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ds90ub913.c                 |  3 +--
> >  drivers/media/i2c/ds90ub953.c                 |  3 +--
> >  drivers/media/i2c/ds90ub960.c                 | 12 ++++-----
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 10 +++----
> >  drivers/media/v4l2-core/v4l2-subdev.c         | 27 +++++++++----------
> >  include/media/v4l2-subdev.h                   | 19 +++++++------
> >  6 files changed, 34 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> > index 8e9ebed09f64..8bb6be956780 100644
> > --- a/drivers/media/i2c/ds90ub913.c
> > +++ b/drivers/media/i2c/ds90ub913.c
> > @@ -424,8 +424,7 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
> >  	}
> >  
> >  	/* Set sink format */
> > -	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> > -						  format->stream);
> > +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> >  	if (!fmt)
> >  		return -EINVAL;
> 
> If we want shorter names, how about replacing _get_ with _g_? And of course
> _set_ with _s_. I would prefer that, but it's up to you.

These functions doesn't actually "get" something, but return a pointer to
the data. There's thus no corresponding set. I think I'll keep it as-is for
now but I think "_get" could as well be removed here.

> 
> Since we are changing function names here, I wonder if this isn't a good
> opportunity to straighten out some more confusing names.
> 
> I noticed that in v4l2-subdev.h "fmt" typically refers to v4l2_subdev_format,
> while "format" tends to refer to v4l2_mbus_framefmt.
> 
> I find this really confusing, especially if you do not use these functions
> regularly.
> 
> My personal preference would be to use "format" for things relating to
> v4l2_subdev_format and "ffmt" for v4l2_mbus_framefmt. Or possibly just "fmt"
> if people don't like "ffmt". It would signal the type of format a lot better.

I'll use ffmt for the name of the function.

> 
> Anyway, I'm just throwing this out here since I think it is confusing.

-- 
Regards,

Sakari Ailus
