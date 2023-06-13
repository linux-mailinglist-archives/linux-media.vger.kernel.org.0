Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1C472E8DE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 18:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbjFMQzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 12:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbjFMQzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 12:55:17 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A25819B7
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686675316; x=1718211316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GGK+1OfmDCJe8tqrsvO+QfrMeDwJpoX7pCiTuT5J1iE=;
  b=UzC345WtvWzGNI4A3tNjO6fYevgJ/RhacCXKHSR3paY8wODp2k4zPE2g
   Ff7TipXrWdCk8Swq4LW4NTHI7SFW4Om4VEdcKY2YHQxTO0n1hTmUO2cIr
   olPaasRVgwgiT1zdiQwvxJiFt/SycvLH4RQT0uJgTyIbJD21YrPHELi6a
   2mY/MOUjc9TyDbw3n95DTkvcVpLHN5XvEGrn5H2OcwxAuiAR6SmVym5TN
   DZIjHLD3BaelGzUskn7BGuDfgZZQXqmHTLH7E3axYODDlca658u0vDTBB
   syJHJYwL0riKFVRh5xNSNBQbPaTuNlfGIwF0qaySZ1aAfS6AQxd+Sw7GM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="360876513"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="360876513"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958461242"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="958461242"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:55:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 21F6A120C1C;
        Tue, 13 Jun 2023 19:55:06 +0300 (EEST)
Date:   Tue, 13 Jun 2023 16:55:06 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [RESEND PATCH v3 15/32] media: v4l: async: Clean up error
 handling in v4l2_async_match_notify
Message-ID: <ZIifanYD9dMkcYya@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-16-sakari.ailus@linux.intel.com>
 <20230530055224.GT21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530055224.GT21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 08:52:24AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:58PM +0300, Sakari Ailus wrote:
> > Add labels for error handling instead of doing it all in individual cases.
> > Prepare for more functionality in this function.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index b1025dfc27a92..f51f0c37210c9 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -320,10 +320,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >  		return ret;
> >  
> >  	ret = v4l2_async_nf_call_bound(notifier, sd, asc);
> > -	if (ret < 0) {
> > -		v4l2_device_unregister_subdev(sd);
> > -		return ret;
> > -	}
> > +	if (ret < 0)
> > +		goto err_unregister_subdev;
> >  
> >  	/*
> >  	 * Depending of the function of the entities involved, we may want to
> > @@ -332,11 +330,8 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >  	 * pad).
> >  	 */
> >  	ret = v4l2_async_create_ancillary_links(notifier, sd);
> > -	if (ret) {
> > -		v4l2_async_nf_call_unbind(notifier, sd, asc);
> > -		v4l2_device_unregister_subdev(sd);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		goto err_call_unbind;
> >  
> >  	list_del(&asc->waiting_entry);
> >  	sd->asd = asc;
> > @@ -363,6 +358,14 @@ static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
> >  	subdev_notifier->parent = notifier;
> >  
> >  	return v4l2_async_nf_try_all_subdevs(subdev_notifier);
> 
> Unrelated to this patch, but shoulnd't this have error handling too ?

You're absolutely right. Bad things will happen if this fails. :-(

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you!

> 
> > +
> > +err_call_unbind:
> > +	v4l2_async_nf_call_unbind(notifier, sd, asc);
> > +
> > +err_unregister_subdev:
> > +	v4l2_device_unregister_subdev(sd);
> > +
> > +	return ret;
> >  }
> >  
> >  /* Test all async sub-devices in a notifier for a match. */

-- 
Kind regards,

Sakari Ailus
