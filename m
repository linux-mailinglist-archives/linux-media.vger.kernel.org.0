Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623387D804C
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 12:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjJZKKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 06:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjJZKKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 06:10:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4459C1B1
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698315021; x=1729851021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kgk7DD5zWVp3dgLKYX+EmvaBVxfWUWlg003sfQU0nrY=;
  b=Fqm4E30iNl6eov5JqTCV30FVgKd8QQVPJIBBNpAN1VDRaOzyT4eG/Jx6
   eLLtcqEalmiWFMoToZh5VIRMKli78nKkYJdTAGmSq1nN3N6FwtArT8m3j
   O/R/Zb3HXHWjDQQeFRk91swWZ67SfU/N++PJKbBbI/yiUtL5bp7JNtmEV
   wpfGvnMYR9ZjNGYnqLM884ssP3iKTZ74ipULKkzdu3JlZiyf+26Opqmiz
   Oze9Gy0fN6Sm7Wk/65Q31kASRKwqz3yKM5wYsfX9hTW+RZ7LK1yqcO4k3
   pKmZZdjqBJ0e7kGKvPnkcV2wfgxldBbGOTDyMLnKZTNzeHa6VQR+oCoEV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377875644"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="377875644"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 03:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="709017706"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="709017706"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 03:10:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2BE5011FB9B;
        Thu, 26 Oct 2023 13:10:14 +0300 (EEST)
Date:   Thu, 26 Oct 2023 10:10:14 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 3/9] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <ZTo7Bovh3tcQAurN@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-4-sakari.ailus@linux.intel.com>
 <58295947-a749-4752-80c6-00c353017dce@xs4all.nl>
 <ZToiYNcD1D9cOHPG@kekkonen.localdomain>
 <20231026095142.GB1512@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026095142.GB1512@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 26, 2023 at 12:51:42PM +0300, Laurent Pinchart wrote:
> On Thu, Oct 26, 2023 at 08:25:04AM +0000, Sakari Ailus wrote:
> > On Thu, Oct 26, 2023 at 09:26:40AM +0200, Hans Verkuil wrote:
> > > On 26/10/2023 09:03, Sakari Ailus wrote:
> > > > Rename the sub-devices state information access functions, removing
> > > > "_stream" from them. This makes them shorter and so more convenient to
> > > > use. No other sets of functions will be needed to access this information.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/ds90ub913.c                 |  3 +--
> > > >  drivers/media/i2c/ds90ub953.c                 |  3 +--
> > > >  drivers/media/i2c/ds90ub960.c                 | 12 ++++-----
> > > >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 10 +++----
> > > >  drivers/media/v4l2-core/v4l2-subdev.c         | 27 +++++++++----------
> > > >  include/media/v4l2-subdev.h                   | 19 +++++++------
> > > >  6 files changed, 34 insertions(+), 40 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> > > > index 8e9ebed09f64..8bb6be956780 100644
> > > > --- a/drivers/media/i2c/ds90ub913.c
> > > > +++ b/drivers/media/i2c/ds90ub913.c
> > > > @@ -424,8 +424,7 @@ static int ub913_set_fmt(struct v4l2_subdev *sd,
> > > >  	}
> > > >  
> > > >  	/* Set sink format */
> > > > -	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> > > > -						  format->stream);
> > > > +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> > > >  	if (!fmt)
> > > >  		return -EINVAL;
> > > 
> > > If we want shorter names, how about replacing _get_ with _g_? And of course
> > > _set_ with _s_. I would prefer that, but it's up to you.
> > 
> > These functions doesn't actually "get" something, but return a pointer to
> > the data. There's thus no corresponding set. I think I'll keep it as-is for
> > now but I think "_get" could as well be removed here.
> > 
> > > 
> > > Since we are changing function names here, I wonder if this isn't a good
> > > opportunity to straighten out some more confusing names.
> > > 
> > > I noticed that in v4l2-subdev.h "fmt" typically refers to v4l2_subdev_format,
> > > while "format" tends to refer to v4l2_mbus_framefmt.
> > > 
> > > I find this really confusing, especially if you do not use these functions
> > > regularly.
> > > 
> > > My personal preference would be to use "format" for things relating to
> > > v4l2_subdev_format and "ffmt" for v4l2_mbus_framefmt. Or possibly just "fmt"
> > > if people don't like "ffmt". It would signal the type of format a lot better.
> > 
> > I'll use ffmt for the name of the function.
> 
> I would avoid this, it will make things even more confusing by adding
> yet another naming scheme. If we want to clean things up (and I think we
> should), then it should be done on top, and span the entire subsystem.

I could live with that, too, but I think it'll be someone else changing the
naming afterwards.

-- 
Sakari Ailus
