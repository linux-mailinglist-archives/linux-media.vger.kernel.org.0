Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6155D56CDCA
	for <lists+linux-media@lfdr.de>; Sun, 10 Jul 2022 10:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiGJIf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jul 2022 04:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiGJIf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jul 2022 04:35:27 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F66F13F19
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 01:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657442127; x=1688978127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kzjDj5oysIgZ3Ih4736vVDJOBzXaP6SLPsucfJdqNwg=;
  b=g/TIQ1BZWB1JXsat9NF2SIYiBnqlj6eaY2e8y3UypC5bY9iCfXDPI8t7
   VbYg8xHKXkvaKz7A+oLrKwARVvNQt2omrnOYTm5g5IR/84m9weSuedZTN
   bnfvq8p1AK+u4deZyw/Pci5DQoTlcvTaP8gF1zsUr1MmjM20RW65gRk1l
   imI3ZGdYeLJXue4GzbIq5oabCfruLN/qKPX7mnI1hGkfNv9J6A3oZttrh
   R3P0z3CLoQGWMQ/vT91Y+IP9Gzf7Ryaf3obxeOHiNdCRjv/RY/DcNcg9b
   a48lLD2RwYH2kN+NTL7PO75WhGEquYkavFSJnSIFftGJAFAefZ7ye4VNv
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="282044118"
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="282044118"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 01:35:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="684074483"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 01:35:25 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 180A0201C5;
        Sun, 10 Jul 2022 11:35:23 +0300 (EEST)
Date:   Sun, 10 Jul 2022 11:35:23 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, djrscally@gmail.com,
        mchehab@kernel.org
Subject: Re: [PATCH v2 1/1] v4l: async: Also match secondary fwnode endpoints
Message-ID: <YsqPS2ov9X/c4Ihd@paasikivi.fi.intel.com>
References: <20220709160123.3033324-1-sakari.ailus@linux.intel.com>
 <YsnNvKobdSRQxCKj@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsnNvKobdSRQxCKj@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hyvää huomenta Laurent,

On Sat, Jul 09, 2022 at 09:49:32PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Sat, Jul 09, 2022 at 07:01:23PM +0300, Sakari Ailus wrote:
> > For camera sensor devices the firmware information comes from non-DT (or
> 
> Did you mean "camera sensor devices whose formation information comes
> from non-DT" ?

I'd say "of which", but yes.

> 
> > some ACPI variants), the kernel makes the information visible to the
> > drivers in a form similar to DT. This takes place through device's
> > secondary fwnodes, in which case also the secondary fwnode needs to be
> > heterogenously (endpoint vs. device) matched.
> > 
> > Fixes: 1f391df44607 ("media: v4l2-async: Use endpoints in __v4l2_async_nf_add_fwnode_remote()")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > With correct indentation this time.
> > 
> >  drivers/media/v4l2-core/v4l2-async.c | 49 ++++++++++++++++------------
> >  1 file changed, 28 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index c6995718237a4..2db5d7a8af82b 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -66,8 +66,10 @@ static bool match_i2c(struct v4l2_async_notifier *notifier,
> >  #endif
> >  }
> >  
> > -static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > -			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > +static bool
> > +match_fwnode_one(struct v4l2_async_notifier *notifier,
> > +		 struct v4l2_subdev *sd, struct fwnode_handle *sd_fwnode,
> > +		 struct v4l2_async_subdev *asd)
> >  {
> >  	struct fwnode_handle *other_fwnode;
> >  	struct fwnode_handle *dev_fwnode;
> > @@ -75,22 +77,6 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	bool sd_fwnode_is_ep;
> >  	struct device *dev;
> >  
> > -	/*
> > -	 * Both the subdev and the async subdev can provide either an endpoint
> > -	 * fwnode or a device fwnode. Start with the simple case of direct
> > -	 * fwnode matching.
> > -	 */
> > -	if (sd->fwnode == asd->match.fwnode)
> > -		return true;
> > -
> > -	/*
> > -	 * Check the same situation for any possible secondary assigned to the
> > -	 * subdev's fwnode
> > -	 */
> > -	if (!IS_ERR_OR_NULL(sd->fwnode->secondary) &&
> > -	    sd->fwnode->secondary == asd->match.fwnode)
> > -		return true;
> 
> This check is now gone, is it not needed ?

It is. I'll send v3, moving the direct check here.

Thanks for the review!

> 
> > -
> >  	/*
> >  	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> >  	 * endpoint or a device. If they're of the same type, there's no match.
> > @@ -99,7 +85,7 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	 * ACPI. This won't make a difference, as drivers should not try to
> >  	 * match unconnected endpoints.
> >  	 */
> > -	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd->fwnode);
> > +	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd_fwnode);
> >  	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
> >  
> >  	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> > @@ -110,11 +96,11 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	 * parent of the endpoint fwnode, and compare it with the other fwnode.
> >  	 */
> >  	if (sd_fwnode_is_ep) {
> > -		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> > +		dev_fwnode = fwnode_graph_get_port_parent(sd_fwnode);
> >  		other_fwnode = asd->match.fwnode;
> >  	} else {
> >  		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> > -		other_fwnode = sd->fwnode;
> > +		other_fwnode = sd_fwnode;
> >  	}
> >  
> >  	fwnode_handle_put(dev_fwnode);
> > @@ -143,6 +129,27 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >  	return true;
> >  }
> >  
> > +static bool match_fwnode(struct v4l2_async_notifier *notifier,
> > +			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> > +{
> > +	/*
> > +	 * Both the subdev and the async subdev can provide either an endpoint
> > +	 * fwnode or a device fwnode. Start with the simple case of direct
> > +	 * fwnode matching.
> > +	 */
> > +	if (sd->fwnode == asd->match.fwnode)
> > +		return true;
> > +
> > +	if (match_fwnode_one(notifier, sd, sd->fwnode, asd))
> > +		return true;
> > +
> > +	/* Also check the secondary fwnode. */
> > +	if (IS_ERR_OR_NULL(sd->fwnode->secondary))
> > +		return false;
> > +
> > +	return match_fwnode_one(notifier, sd, sd->fwnode->secondary, asd);
> > +}
> > +
> >  static LIST_HEAD(subdev_list);
> >  static LIST_HEAD(notifier_list);
> >  static DEFINE_MUTEX(list_lock);

-- 
Terveisin,

Sakari Ailus
