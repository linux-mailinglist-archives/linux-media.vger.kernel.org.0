Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1512672E5E6
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 16:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242259AbjFMOgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 10:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234939AbjFMOgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 10:36:20 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B077310DF
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686666979; x=1718202979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZuBKQCNevrC2HLfWNA85TuAtYV0Ip/Dk54Ich+/quM=;
  b=IZ83nmYLgTHI00mJk2TJWd2UW2chKz10U+NY8MNVt6uzw3M5ZZH6Z+0z
   CnnLijAQQIMcvuiJZw1F3aCNCDk5Y+mW+ST5P7ZFtqNvLVyWHtmJLcR6Y
   nlJjetLHOXZBf+mWHMxP1u5O1PtGWuFZptK/fIzEzAAwNtEL9JcEENHmk
   eOXTEz5BTxd0yxVUABdSwllrC9wvrdhl5YBtHwKdgLbtj41dTWn+PlRXQ
   2IzzTJ9e6hU1/9yH6zK/pzClh9igieW9D6GmIrRVvhfY3rSD2v0Cu1XQt
   OCd6LiZ14m7eLqxFO8QkMgn+jaLyYDYWExWsggOvqik0SykOKNfMige7N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338709630"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="338709630"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="689053734"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="689053734"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 07:35:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5D3E211F9D2;
        Tue, 13 Jun 2023 17:35:55 +0300 (EEST)
Date:   Tue, 13 Jun 2023 14:35:55 +0000
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
Subject: Re: [RESEND PATCH v3 09/32] media: v4l: async: Make V4L2 async match
 information a struct
Message-ID: <ZIh+y5UYL1YCqUGF@kekkonen.localdomain>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
 <20230525091615.2324824-10-sakari.ailus@linux.intel.com>
 <20230530025222.GJ21633@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530025222.GJ21633@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, May 30, 2023 at 05:52:22AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, May 25, 2023 at 12:15:52PM +0300, Sakari Ailus wrote:
> > Make V4L2 async match information a struct, making it easier to use it
> > elsewhere outside the scope of struct v4l2_async_subdev.
> > 
> > Also remove an obsolete comment --- none of these fields are supposed to
> > be touched by drivers.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 20 +++++++-------
> >  include/media/v4l2-async.h           | 41 ++++++++++++++++------------
> >  2 files changed, 33 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 7c924faac4c10..7f56648e40c44 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -212,7 +212,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  
> >  	list_for_each_entry(asd, &notifier->waiting, list) {
> >  		/* bus_type has been verified valid before */
> > -		switch (asd->match_type) {
> > +		switch (asd->match.type) {
> >  		case V4L2_ASYNC_MATCH_I2C:
> >  			match = match_i2c;
> >  			break;
> > @@ -237,10 +237,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >  static bool asd_equal(struct v4l2_async_subdev *asd_x,
> >  		      struct v4l2_async_subdev *asd_y)
> >  {
> > -	if (asd_x->match_type != asd_y->match_type)
> > +	if (asd_x->match.type != asd_y->match.type)
> >  		return false;
> >  
> > -	switch (asd_x->match_type) {
> > +	switch (asd_x->match.type) {
> >  	case V4L2_ASYNC_MATCH_I2C:
> >  		return asd_x->match.i2c.adapter_id ==
> >  			asd_y->match.i2c.adapter_id &&
> > @@ -552,7 +552,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> >  {
> >  	struct device *dev = notifier_dev(notifier);
> >  
> > -	switch (asd->match_type) {
> > +	switch (asd->match.type) {
> >  	case V4L2_ASYNC_MATCH_I2C:
> >  	case V4L2_ASYNC_MATCH_FWNODE:
> >  		if (v4l2_async_nf_has_async_subdev(notifier, asd, skip_self)) {
> > @@ -561,8 +561,8 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> >  		}
> >  		break;
> >  	default:
> > -		dev_err(dev, "v4l2-async: Invalid match type %u on %p\n",
> > -			asd->match_type, asd);
> > +		dev_err(dev, "v4l2-asymc: Invalid match type %u on %p\n",
> 
> Is this for asymmetrical notification ?

Oops.

> 
> With this fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you! :-)

-- 
Regards,

Sakari Ailus
