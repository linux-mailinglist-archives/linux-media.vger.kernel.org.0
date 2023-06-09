Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEF0729A3D
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 14:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239403AbjFIMos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 08:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237871AbjFIMor (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 08:44:47 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12F02712
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686314684; x=1717850684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SKUGLPQXWd1U2rFWlByG3OhS12qorgM9SHhOyQnSzkU=;
  b=IKzFIKBGqs2LtFTotcxx6xrK4MHeJI4r7sbx6JBPwjZKYn7W0+B7olKs
   fXdCYFkxGQammL2hgRFICTI254D1gVlQ/6JEsc4U/3hDFtL1ascYVgG1n
   QerJ7HrD8K3m8jH+EKKQCUMw+6FAkHZY6KdeYiReKEZQPq2hftF3+9moZ
   sPXTp3SckHngfrOrawvjNT2U2TWv1rpIRbtAVsfpWXNJCuvM3I/Zug3l7
   UKtw8UFjPEGUmSdVUXA9YV8Ajuxw2Eg0D2ZKkD/Fkwm/e9wOIneDsj0nL
   Ci7yVHjj2IsLjhybMAfCbAIUbh6GXi4Nq0BOyGZ8zWa27CYtWREBxW9nv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="423465482"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="423465482"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 05:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="775486480"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="775486480"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 05:44:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id F0ED311F9D2;
        Fri,  9 Jun 2023 15:44:39 +0300 (EEST)
Date:   Fri, 9 Jun 2023 12:44:39 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Message-ID: <ZIMetwrhQcn3GgF8@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-2-sakari.ailus@linux.intel.com>
 <8b315fe6-0d34-2f93-bf0f-7f3be0b37dbc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b315fe6-0d34-2f93-bf0f-7f3be0b37dbc@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the review.

On Thu, Jun 08, 2023 at 09:59:48AM +0200, Hans Verkuil wrote:
> On 05/05/2023 23:52, Sakari Ailus wrote:
> > Internal source pads will be used as routing endpoints in V4L2
> > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > 
> > Also prevent creating links to pads that have been flagged as internal.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/mediactl/media-types.rst          | 7 +++++++
> >  drivers/media/mc/mc-entity.c                              | 8 +++++++-
> >  include/uapi/linux/media.h                                | 1 +
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 0ffeece1e0c8..c724139ad46c 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >  .. _MEDIA-PAD-FL-SINK:
> >  .. _MEDIA-PAD-FL-SOURCE:
> >  .. _MEDIA-PAD-FL-MUST-CONNECT:
> > +.. _MEDIA-PAD-FL-INTERNAL-SOURCE:
> >  
> >  .. flat-table:: Media pad flags
> >      :header-rows:  0
> > @@ -382,6 +383,12 @@ Types and flags used to represent the media graph elements
> >  	  when this flag isn't set; the absence of the flag doesn't imply
> >  	  there is none.
> >  
> > +    *  -  ``MEDIA_PAD_FL_INTERNAL_SOURCE``
> > +       -  This flag indicates an internal pad that has no external
> 
> 'internal pad' or 'internal source pad'?
> 
> > +	  connections. Such a pad may not be connected with a link. The internal
> > +	  flag indicates that the stream either starts or ends in the
> > +	  entity.
> 
> This sentence makes no sense. The flag is for a pad, but then this sentence
> talks about streams and entities and doesn't relate that to the pad. Also,

Streams are between pads, but are visible on V4L2 only while this is MC
related. Documentation-wise this is a bit awkward.

> the flag is INTERNAL_SOURCE, and reading 'stream ends' suggests that it
> should be INTERNAL_SINK in that case.

When it comes to routing, it uses fields related to the sink pad, but this
is a source.

Based on review of the other patches, it seems both Tomi and Laurent would
prefer a plain INTERNAL flag which then would be used in conjunction with
the existing SINK flag, to note an internal source. Routing-wise this is a
cleaner option as this is associated with the sink related fields in any
case.

> 
> I think this needs to be more elaborate and ideally add some examples
> of the use-case(s) (or refer to an example elsewhere).
> 
>  For a given pad, the INTERNAL_SOURCE flag may not be set if
> > +	  either SINK or SOURCE flags is set.
> >  
> >  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> 
> and 'MEDIA_PAD_FL_INTERNAL_SOURCE' as well?
> 
> >  must be set for every pad.
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index ef34ddd715c9..ed99160a2487 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -1062,7 +1062,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> >  
> >  	for (i = 0; i < entity->num_pads; i++) {
> >  		if ((entity->pads[i].flags &
> > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > +		      MEDIA_PAD_FL_INTERNAL_SOURCE)) != pad_type)
> >  			continue;
> >  
> >  		if (entity->pads[i].sig_type == sig_type)
> > @@ -1087,6 +1088,11 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> >  		return -EINVAL;
> >  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> >  		return -EINVAL;
> > +	if (WARN_ON(sink->pads[sink_pad].flags &
> > +		    MEDIA_PAD_FL_INTERNAL_SOURCE) ||
> > +	    WARN_ON(source->pads[source_pad].flags &
> > +		    MEDIA_PAD_FL_INTERNAL_SOURCE))
> > +		return -EINVAL;
> >  
> >  	link = media_add_link(&source->links);
> >  	if (link == NULL)
> > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > index edb8dfef9eba..0e2577e8b425 100644
> > --- a/include/uapi/linux/media.h
> > +++ b/include/uapi/linux/media.h
> > @@ -208,6 +208,7 @@ struct media_entity_desc {
> >  #define MEDIA_PAD_FL_SINK			(1U << 0)
> >  #define MEDIA_PAD_FL_SOURCE			(1U << 1)
> >  #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> > +#define MEDIA_PAD_FL_INTERNAL_SOURCE		(1U << 3)
> >  
> >  struct media_pad_desc {
> >  	__u32 entity;		/* entity ID */
> 
> Regards,
> 
> 	Hans

-- 
Kind regards,

Sakari Ailus
