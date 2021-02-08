Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8060A312F33
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 11:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhBHKj0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 05:39:26 -0500
Received: from mga03.intel.com ([134.134.136.65]:44689 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232574AbhBHKhq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 05:37:46 -0500
IronPort-SDR: c9IsHp9RRq7e32ALCUFiNsavslBp8dppdTrSV3vsTT639fcTQfXgFm4BqirAr+TVXBodwWH7dv
 JIDlitp/Hyfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="181756396"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="181756396"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 02:32:51 -0800
IronPort-SDR: LDaMR48YdexvfIeM28F56eQ26H9WHFlfY8jjxneE5m2Nht6HM+Du5WlUl1yYyVswRsrSgGO2BF
 b1dzjnNV+x2Q==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="577617694"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 02:32:46 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4BF052082C; Mon,  8 Feb 2021 12:32:44 +0200 (EET)
Date:   Mon, 8 Feb 2021 12:32:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5 11/13] media: v4l2-async: Discourage use of
 v4l2_async_notifier_add_subdev
Message-ID: <20210208103244.GQ32460@paasikivi.fi.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
 <20210202135611.13920-12-sakari.ailus@linux.intel.com>
 <20210206091546.1497bbcb@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206091546.1497bbcb@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thanks for the review.

On Sat, Feb 06, 2021 at 09:15:46AM +0100, Mauro Carvalho Chehab wrote:
> Em Tue,  2 Feb 2021 15:56:09 +0200
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > From: Ezequiel Garcia <ezequiel@collabora.com>
> > 
> > Most -if not all- use-cases are expected to be covered by one of:
> > v4l2_async_notifier_add_fwnode_subdev,
> > v4l2_async_notifier_add_fwnode_remote_subdev or
> > v4l2_async_notifier_add_i2c_subdev.
> 
> Actually, all cases outside V4L2 core:
> 
> $ git grep v4l2_async_notifier_add_subdev
> Documentation/driver-api/media/v4l2-subdev.rst:using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> drivers/media/v4l2-core/v4l2-async.c:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> drivers/media/v4l2-core/v4l2-async.c:EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
> drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
> drivers/media/v4l2-core/v4l2-async.c:   ret = v4l2_async_notifier_add_subdev(notifier, asd);
> drivers/media/v4l2-core/v4l2-fwnode.c:  ret = v4l2_async_notifier_add_subdev(notifier, asd);
> include/media/v4l2-async.h: * before the first call to @v4l2_async_notifier_add_subdev.
> include/media/v4l2-async.h: * v4l2_async_notifier_add_subdev - Add an async subdev to the
> include/media/v4l2-async.h:int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> include/media/v4l2-async.h: * @v4l2_async_notifier_add_subdev,
> 
> 
> > 
> > We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
> > so rename it as __v4l2_async_notifier_add_subdev. This is
> > typically a good hint for drivers to avoid using the function.
> 
> IMO, the best here would be to create a header file:
> 
> 	drivers/media/v4l2-core/v4l2-async-priv.h
> 
> and move v4l2_async_notifier_add_subdev from include/media/v4l2-async.h.
> 
> This will warrant that only the V4L2 core would have access to it.
> Also, it is a lot better than adding something like this:

It'd be the first header in the directory. I suppose there are other
functions that could have the prototype there.

I'll still see if there could be other options for this.

The topic of split into modules of v4l2-async and v4l2-fwnode was also
discussed recently, and it's obviously related to this. The two are
virtually always used together and so would make sense to be in the same
module. In practice this would mean moving v4l2-async out of videodev2. The
module wouldn't be large but the vast majority of regular laptop and
desktop PC users are having this in memory needlessly.

> 
> > + * \warning: Drivers should avoid using this function and instead use one of:
> > + * @v4l2_async_notifier_add_fwnode_subdev,
> > + * @v4l2_async_notifier_add_fwnode_remote_subdev or
> > + * @v4l2_async_notifier_add_i2c_subdev.
> > + *
> 
> 
> Please submit a followup patch.

Yes.

> 
> -
> 
> On a separate but related note, The names of the async notifiers are
> too big, causing lots of coding style warnings, like:
> 
> +       asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> +               &fmd->subdev_notifier, of_fwnode_handle(ep), sizeof(*asd));
> ...
> +                       asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> +                               &isp->notifier, ep, sizeof(*isd));

We started with lots of variants of similar functions over time, so I
preferred to keep the names descriptive. Now that we've settled to a small
number of them, it's also worth seeing whether there could be room for
shorter but still descriptive names without allowing for such variance we
no longer need.

> 
> Ending a line with an open parenthesis is not natural: you won't see
> any good written English texts (or on any other natural language) that would
> have a line ending with a '('.

This is C, not English, and I'm sure we could have a long debate on the
topic. :-) But maybe we don't need to.

> 
> While I understand that the name describes precisely what those 
> functions, such non-intuitive usage of parenthesis makes the line
> obfuscated, for no good reason.
> 
> Also, the entire meaning of the V4L2 async API is to allow subdevs
> to be registered later. So, IMHO, the namespace for those 3
> calls could be simplified to:
> 
> 	v4l2_async_notifier_add_fwnode(),
> 	v4l2_async_notifier_add_fwnode_remote()
> 	v4l2_async_notifier_add_i2c().

Yes, I had actually the same in mind. Seems reasonable.

> 
> Also, we should place at least the first argument afer the
> parenthesis, even if this would violate the 80 columns
> coding style rule[1]. 
> 
> So, the above examples would be written as:
> 
> 
>         asd = v4l2_async_notifier_add_fwnode_remote(&fmd->subdev_notifier,
> 						    of_fwnode_handle(ep),
> 						    sizeof(*asd));
> 
> and:
> 
>                         asd = v4l2_async_notifier_add_fwnode_remote(&isp->notifier,
> 								    ep,
> 								    sizeof(*isd));
> 
> Which better matches the Kernel coding style, and it is way easier to
> review, as the brain will see the parenthesis just like it would on
> a natural language.
> 
> [1] The 80 columns warning is a "soft" coding style violation. It serves
> as a reference that either the function code is becoming too complex with too
> many loops, or that the function names are becoming too big. As it produces
> lots of false positives, and people were breaking strings or finishing
> lines with open parenthesis, this rule got relaxed, and checkpatch now
> warns only (by default) if the line has more than 100 columns.

The coding style refers to it as the "preferred limit", indeed. But there
are conditions how exceeding that is allowed.

Note that aligning the function arguments on the following lines to right
of the opening parenthesis is also referred to as a "very commonly used
style", i.e. there is no suggestion it is a requirement. That is certainly
my preference as well, but I guess it's the priority of these preferences
that we'd be discussing.

Let's see how much making the names shorter helps.

> 
> 
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Helen Koike <helen.koike@collabora.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c  | 8 ++++----
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
> >  include/media/v4l2-async.h            | 9 +++++++--
> >  3 files changed, 12 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index ed603ae63cad..d848db962dc7 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -611,7 +611,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
> >  }
> >  EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
> >  
> > -int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > +int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> >  				   struct v4l2_async_subdev *asd)
> >  {
> >  	int ret;
> > @@ -628,7 +628,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> >  	mutex_unlock(&list_lock);
> >  	return ret;
> >  }
> > -EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
> > +EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
> >  
> >  struct v4l2_async_subdev *
> >  v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> > @@ -645,7 +645,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> >  	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> >  	asd->match.fwnode = fwnode_handle_get(fwnode);
> >  
> > -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> >  	if (ret) {
> >  		fwnode_handle_put(fwnode);
> >  		kfree(asd);
> > @@ -695,7 +695,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
> >  	asd->match.i2c.adapter_id = adapter_id;
> >  	asd->match.i2c.address = address;
> >  
> > -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> >  	if (ret) {
> >  		kfree(asd);
> >  		return ERR_PTR(ret);
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index c1c2b3060532..63be16c8eb83 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -822,7 +822,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> >  	if (ret < 0)
> >  		goto out_err;
> >  
> > -	ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > +	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> >  	if (ret < 0) {
> >  		/* not an error if asd already exists */
> >  		if (ret == -EEXIST)
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 8815e233677e..b113329582ff 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -133,17 +133,22 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
> >  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
> >  
> >  /**
> > - * v4l2_async_notifier_add_subdev - Add an async subdev to the
> > + * __v4l2_async_notifier_add_subdev - Add an async subdev to the
> >   *				notifier's master asd list.
> >   *
> >   * @notifier: pointer to &struct v4l2_async_notifier
> >   * @asd: pointer to &struct v4l2_async_subdev
> >   *
> > + * \warning: Drivers should avoid using this function and instead use one of:
> > + * @v4l2_async_notifier_add_fwnode_subdev,
> > + * @v4l2_async_notifier_add_fwnode_remote_subdev or
> > + * @v4l2_async_notifier_add_i2c_subdev.
> > + *
> 
> The markups here are violating kernel-doc. Functions should be declared
> as:
> 
>     * v4l2_async_notifier_add_fwnode_subdev(),
>     * v4l2_async_notifier_add_fwnode_remote_subdev() or
>     * v4l2_async_notifier_add_i2c_subdev().
> 
> Please address it on a followup patch.

Sure.

-- 
Kind regards,

Sakari Ailus
