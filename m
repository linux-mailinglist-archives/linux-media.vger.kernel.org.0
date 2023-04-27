Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1E86F046E
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 12:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243277AbjD0KsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 06:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243401AbjD0KsE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 06:48:04 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FF64ECA
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682592479; x=1714128479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5x3n9qIJBjl5uGfAqIpXXv6Xf/nJz3hgYmGXbG0+g0=;
  b=CowbG+9L/FBfXqR9tdYeY3zWCLzkQ1lfHo8g2+9BZBI5JSWFcoZ1rEKm
   gdw2p38a+w2KwLqaTigoBd7mmld2RR3dEuY7F0eygBeyd92BO1ciIq6sW
   rrBrBAgPvsu+XBO3rgMwbCJadGD/4OypxJmaE2Ti5/A43WNEEiPlWY9Gy
   Z6efwF+lkZl2DKSzBVj+HkaAsOIrI5202Bn1i2jvzneZ1NDlF+bgv26Me
   XVODn9CnkjzfTyMnHUGJ4B2gFwHUaDVuJWWFNYD0edBe7y1yYnUH9t0Nh
   QiK53OjYWM3QGODhFqgS6dKtnwS+OEORn43U1jJpBAuLSwSPdDPwseoeB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="344848699"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="344848699"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 03:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868675995"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="868675995"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 03:47:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4E52911FC9F;
        Thu, 27 Apr 2023 13:47:29 +0300 (EEST)
Date:   Thu, 27 Apr 2023 13:47:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 04/18] media: v4l: async: Make V4L2 async match
 information a struct
Message-ID: <ZEpSwd1fXjfqxGfP@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-5-sakari.ailus@linux.intel.com>
 <q7slamopvwkbvxf3i4ktadawbm6mywucl4to4and3zp2vzhixm@h7vp3hnilt52>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q7slamopvwkbvxf3i4ktadawbm6mywucl4to4and3zp2vzhixm@h7vp3hnilt52>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thu, Apr 13, 2023 at 06:51:29PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Mar 30, 2023 at 02:58:39PM +0300, Sakari Ailus wrote:
> > Make V4L2 async match information a struct, making it easier to use it
> > elsewhere outside the scope of struct v4l2_async_subdev.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c  | 18 ++++++-------
> >  drivers/media/v4l2-core/v4l2-fwnode.c |  2 +-
> >  include/media/v4l2-async.h            | 39 ++++++++++++++++-----------
> >  3 files changed, 33 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 13fe0bdc70b6..bb78e3618ab5 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -147,7 +147,7 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
> >
> >  	list_for_each_entry(asd, &notifier->waiting, list) {
> >  		/* bus_type has been verified valid before */
> > -		switch (asd->match_type) {
> > +		switch (asd->match.type) {
> >  		case V4L2_ASYNC_MATCH_I2C:
> >  			match = match_i2c;
> >  			break;
> > @@ -172,10 +172,10 @@ v4l2_async_find_match(struct v4l2_async_notifier *notifier,
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
> > @@ -494,7 +494,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> >  	if (!asd)
> >  		return -EINVAL;
> >
> > -	switch (asd->match_type) {
> > +	switch (asd->match.type) {
> >  	case V4L2_ASYNC_MATCH_I2C:
> >  	case V4L2_ASYNC_MATCH_FWNODE:
> >  		if (v4l2_async_nf_has_async_subdev(notifier, asd, this_index)) {
> > @@ -504,7 +504,7 @@ static int v4l2_async_nf_asd_valid(struct v4l2_async_notifier *notifier,
> >  		break;
> >  	default:
> >  		dev_err(dev, "Invalid match type %u on %p\n",
> > -			asd->match_type, asd);
> > +			asd->match.type, asd);
> >  		return -EINVAL;
> >  	}
> >
> > @@ -630,7 +630,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
> >  		return;
> >
> >  	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
> > -		switch (asd->match_type) {
> > +		switch (asd->match.type) {
> >  		case V4L2_ASYNC_MATCH_FWNODE:
> >  			fwnode_handle_put(asd->match.fwnode);
> >  			break;
> > @@ -685,7 +685,7 @@ __v4l2_async_nf_add_fwnode(struct v4l2_async_notifier *notifier,
> >  	if (!asd)
> >  		return ERR_PTR(-ENOMEM);
> >
> > -	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> > +	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
> >  	asd->match.fwnode = fwnode_handle_get(fwnode);
> >
> >  	ret = __v4l2_async_nf_add_subdev(notifier, asd);
> > @@ -732,7 +732,7 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
> >  	if (!asd)
> >  		return ERR_PTR(-ENOMEM);
> >
> > -	asd->match_type = V4L2_ASYNC_MATCH_I2C;
> > +	asd->match.type = V4L2_ASYNC_MATCH_I2C;
> >  	asd->match.i2c.adapter_id = adapter_id;
> >  	asd->match.i2c.address = address;
> >
> > @@ -850,7 +850,7 @@ EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> >  static void print_waiting_subdev(struct seq_file *s,
> >  				 struct v4l2_async_subdev *asd)
> >  {
> > -	switch (asd->match_type) {
> > +	switch (asd->match.type) {
> >  	case V4L2_ASYNC_MATCH_I2C:
> >  		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
> >  			   asd->match.i2c.address);
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 3d9533c1b202..e6bd63364bed 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -811,7 +811,7 @@ v4l2_async_nf_fwnode_parse_endpoint(struct device *dev,
> >  	if (!asd)
> >  		return -ENOMEM;
> >
> > -	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> > +	asd->match.type = V4L2_ASYNC_MATCH_FWNODE;
> >  	asd->match.fwnode =
> >  		fwnode_graph_get_remote_port_parent(endpoint);
> >  	if (!asd->match.fwnode) {
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 25eb1d138c06..0c4cffd081c9 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -34,23 +34,38 @@ enum v4l2_async_match_type {
> >  };
> >
> >  /**
> > - * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> > + * struct v4l2_async_match - async sub-device match information
> >   *
> > - * @match_type:	type of match that will be used
> > - * @match:	union of per-bus type matching data sets
> > - * @match.fwnode:
> > + * @type:	type of match that will be used
> > + * @fwnode:
> >   *		pointer to &struct fwnode_handle to be matched.
> 
> These two could be on a single line

Will fix for v2.

> 
> >   *		Used if @match_type is %V4L2_ASYNC_MATCH_FWNODE.
> > - * @match.i2c:	embedded struct with I2C parameters to be matched.
> > + * @i2c:	embedded struct with I2C parameters to be matched.
> >   *		Both @match.i2c.adapter_id and @match.i2c.address
> >   *		should be matched.
> >   *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> > - * @match.i2c.adapter_id:
> > + * @i2c.adapter_id:
> >   *		I2C adapter ID to be matched.
> >   *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> > - * @match.i2c.address:
> > + * @i2c.address:
> >   *		I2C address to be matched.
> >   *		Used if @match_type is %V4L2_ASYNC_MATCH_I2C.
> > + */
> > +struct v4l2_async_match {
> > +	enum v4l2_async_match_type type;
> > +	union {
> > +		struct fwnode_handle *fwnode;
> > +		struct {
> > +			int adapter_id;
> > +			unsigned short address;
> > +		} i2c;
> > +	};
> > +};
> > +
> > +/**
> > + * struct v4l2_async_subdev - sub-device descriptor, as known to a bridge
> > + *
> > + * @match:	struct of match type and per-bus type matching data sets
> >   * @asd_list:	used to add struct v4l2_async_subdev objects to the
> >   *		master notifier @asd_list
> >   * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> > @@ -61,15 +76,7 @@ enum v4l2_async_match_type {
> >   * v4l2_async_subdev as its first member.
> >   */
> >  struct v4l2_async_subdev {
> > -	enum v4l2_async_match_type match_type;
> > -	union {
> > -		struct fwnode_handle *fwnode;
> > -		struct {
> > -			int adapter_id;
> > -			unsigned short address;
> > -		} i2c;
> > -	} match;
> > -
> > +	struct v4l2_async_match match;
> 
> nit: I would maintain a blank line

I'll rework some of this still, the comment is actually wrong as none of
these fields are expected to be accessed by drivers.

> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks!

> 
> Thanks
>    j
> 
> >  	/* v4l2-async core private: not to be used by drivers */
> >  	struct list_head list;
> >  	struct list_head asd_list;

-- 
Regards,

Sakari Ailus
