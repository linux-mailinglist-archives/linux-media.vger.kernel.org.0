Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E345C7A1B65
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbjIOJzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbjIOJy6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:54:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4AF2D4D
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694771564; x=1726307564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nm+SO+UUNO5D2PMA25/mG3g8wIVby71YmgCxTmMLwsc=;
  b=IiKEeHeeE+mucSnFW0SNbQSQHG6cxJD2WwgdjIWskvtRPQJRGJcX5p0b
   2jb0+fEdPI4Sr/eNWv6KxArQP09rnZJmksisoL2rX76Uie2xUnDIUNH0k
   OwdH/pD+o1X+CPFOTzwf2Lo4lWSjDa/68Wd/7rUw2ZSyoVEacwPPXsenj
   fYUUJxqEiatTzM/4qKGlXAWzF0qjdmC7PIy2P1HO2vwLdj949s/T26hpW
   hk+qepTsh5EDSmQ9lJqDzAFgw3MwmI/IzwJ/DuyvhvbN501UEs20gi59F
   T6Zi3e/SeiG4qAsH51a3npofzKyODxD2G77dhqWs1BJFhylmnm5A/Wltw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381937721"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="381937721"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 02:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744914625"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="744914625"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 02:48:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1D6FE11F831;
        Fri, 15 Sep 2023 12:48:46 +0300 (EEST)
Date:   Fri, 15 Sep 2023 09:48:46 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 3/7] media: ccs: Correctly initialise try compose
 rectangle
Message-ID: <ZQQoftF/gKuSzL+G@kekkonen.localdomain>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-4-sakari.ailus@linux.intel.com>
 <20230915091916.GD14641@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915091916.GD14641@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Sep 15, 2023 at 12:19:16PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Sep 15, 2023 at 10:28:05AM +0300, Sakari Ailus wrote:
> > Initialise the try sink compose rectangle size to the sink compose
> > rectangle for binner and scaler sub-devices. This was missed due to the
> > faulty condition that lead to the compose rectangles to be initialised for
> > the pixel array sub-device where it is not relevant.
> > 
> > Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> But you should instead use .init_cfg() and the subdev active state API.
> That can be done in a separate patch series.

Thank you for the review.

I have that patch still in the metadata series currently. If I can test it
in a timely manner for this set, I'll include it, too.

> 
> > ---
> >  drivers/media/i2c/ccs/ccs-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > index 49e0d9a09530..6f8fbd82e21c 100644
> > --- a/drivers/media/i2c/ccs/ccs-core.c
> > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > @@ -3097,7 +3097,7 @@ static int ccs_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >  		try_fmt->code = sensor->internal_csi_format->code;
> >  		try_fmt->field = V4L2_FIELD_NONE;
> >  
> > -		if (ssd != sensor->pixel_array)
> > +		if (ssd == sensor->pixel_array)
> >  			continue;
> >  
> >  		try_comp = v4l2_subdev_get_try_compose(sd, fh->state, i);
> 

-- 
Regards,

Sakari Ailus
