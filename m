Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD554B2443
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 12:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349443AbiBKL1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 06:27:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiBKL1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 06:27:05 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA9FE5D
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 03:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644578824; x=1676114824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DZ/aDg0txxoM2NpoFPjszz7fuQTABAltlA0Qlx5n7gs=;
  b=JuQdKB8l/w67LJeurbjKLU41TE8vaNu9E2GHQpyLIr6jAsBFe2jhrisS
   qL2XdweKCcSW0dfCNi7mhmtKl29qpg2FcRD8JAusZ5V3ccZJqn2zUAh4s
   By5dJ7mV5PYMpTZtI253M00w/76b2beGFZ2KD61uHy+TD5RvsIEzoGmWQ
   B7kL+7kmwxNe2Icekh6h6085eYAfHbbEH+eS10RAAnhiP2i0GqT5CDs1F
   Fp2ZeSXDH0f/3MG8TgXmOCWvBUnmCguhnDwLrG2WaiLY5UgUbY9cLBuyp
   rprRI4sqCePOEF5uUCRwqM5EZ8TcxGXpq54gEas4Z+i0oI+es+WnzxYn9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249923329"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; 
   d="scan'208";a="249923329"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 03:27:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; 
   d="scan'208";a="537624782"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 03:27:02 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id F1BA4204FB;
        Fri, 11 Feb 2022 13:26:59 +0200 (EET)
Date:   Fri, 11 Feb 2022 13:26:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v2 6/6] media: v4l2-async: Create links during
 v4l2_async_match_notify()
Message-ID: <YgZIA9uhg4BWzUqw@paasikivi.fi.intel.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
 <20220130235821.48076-7-djrscally@gmail.com>
 <YfqzdowSDlF9VwFP@paasikivi.fi.intel.com>
 <a535c8c6-b09f-5be3-5465-9ea3be38bc02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a535c8c6-b09f-5be3-5465-9ea3be38bc02@gmail.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Thanks for the ping.

On Wed, Feb 02, 2022 at 09:48:56PM +0000, Daniel Scally wrote:
> Hi Sakari
> 
> On 02/02/2022 16:38, Sakari Ailus wrote:
> > Hi Daniel,
> >
> > Thanks for the update.
> >
> > On Sun, Jan 30, 2022 at 11:58:21PM +0000, Daniel Scally wrote:
> >> Upon an async fwnode match, there's some typical behaviour that the
> >> notifier and matching subdev will want to do. For example, a notifier
> >> representing a sensor matching to an async subdev representing its
> >> VCM will want to create an ancillary link to expose that relationship
> >> to userspace.
> >>
> >> To avoid lots of code in individual drivers, try to build these links
> >> within v4l2 core.
> >>
> >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >> ---
> >> Changes since v1:
> >>
> >> 	- Added #ifdef guards for CONFIG_MEDIA_CONTROLLER
> >> 	- Some spelling and nomenclature cleanup (Laurent)
> >>
> >> Changes since the rfc:
> >>
> >> 	- None
> >>
> >>  drivers/media/v4l2-core/v4l2-async.c | 56 ++++++++++++++++++++++++++++
> >>  1 file changed, 56 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >> index 0404267f1ae4..8980534e755e 100644
> >> --- a/drivers/media/v4l2-core/v4l2-async.c
> >> +++ b/drivers/media/v4l2-core/v4l2-async.c
> >> @@ -275,6 +275,50 @@ v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
> >>  static int
> >>  v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> >>  
> >> +static int
> >> +__v4l2_async_create_ancillary_link(struct v4l2_async_notifier *notifier,
> >> +				   struct v4l2_subdev *sd)
> >> +{
> >> +	struct media_link *link = NULL;
> >> +
> >> +#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> >> +
> >> +	if (sd->entity.function != MEDIA_ENT_F_LENS &&
> >> +	    sd->entity.function != MEDIA_ENT_F_FLASH)
> >> +		return -EINVAL;
> >> +
> >> +	link = media_create_ancillary_link(&notifier->sd->entity, &sd->entity);
> >> +
> >> +#endif
> >> +
> >> +	return IS_ERR(link) ? PTR_ERR(link) : 0;
> >> +}
> >> +
> >> +/*
> >> + * Create links on behalf of the notifier and subdev, where it's obvious what
> >> + * should be done. At the moment, we only support cases where the notifier
> >> + * is a camera sensor and the subdev is a lens controller.
> > I think I'd rather change this so that ancillary links are created for lens
> > and flash subdevs, independently of the function of the notifier subdev.
> >
> > Are there cases where this would go wrong currently, or in the future? I
> > can't think of any right now at least. I guess we could add more
> > information in the future to convey here if needed.
> I don't think doing that would go wrong anyhow...at least not that I
> could think of at the minute. My plan was to add a new function like
> __v4l2_async_create_data_links() and call that (from
> v4l2_async_try_create_links()) where the function of the notifier subdev
> was MEDIA_ENT_F_VID_IF_BRIDGE...you think we shouldn't be doing that? Or
> just that it should be separate?

I'm not sure the function of the subdev should be involved with this.

The function is mainly used by the user space and different drivers tend to
use different functions. Of course there could (and should) be alignment on
this, but as you can have only a single function, there are bound to be
cases where you have to pick one that fits the best but does not entirely
match what the device is.

I see no problem doing this automatically, as long as it does not clash
with what drivers create by themselves. The local pad where the data link
is connected often comes from the driver --- same for the flags btw. --- so
some way needs to be provided for the driver to provide this information.

There's a callback for connecting endpoint with a pad the transmitter
drivers use, maybe that could be helpful?

-- 
Kind regards,

Sakari Ailus
