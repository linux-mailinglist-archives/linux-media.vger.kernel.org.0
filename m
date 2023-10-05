Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2187BA3B3
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 17:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238078AbjJEP6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 11:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbjJEP4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 11:56:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E0F3C1D
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696514065; x=1728050065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jlPg1W8OitdNLSLGToNJchEH64RnB2dBG9TOtpPGv6c=;
  b=atcbxwZdVHeMZBe6FDqpUxCSBedRCuL5lCExLiZD59inQAq1NQoKV5cs
   Dbgovs5I+t71JTh/eWh9MS+8N19ngsvTWpktPKucTQ64+8sT7Ax9JUEID
   RC3eXi5quUheskImvqKNoCGZNjSXyGZ6CYeNfeD+rtTF355wPNWf4ktaC
   VEi084/50umoQ22ZZ9eZOl5zVa2+Dws5W9wuJRCynV9h2Ka02KB6Mr90c
   ByA5SSG/sDil62KlFQd/BWa2iNYyIFL6X7xV4r3QStVVh69n8vAow5Afi
   S2hYPjPXHgqCEydS7Hf9ghLDZSBCrnJbdXItIk3hoRs9+Ny5bdDjIIwfu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414429073"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="414429073"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817526468"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="817526468"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 03:22:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id BCB1212035C;
        Thu,  5 Oct 2023 13:22:42 +0300 (EEST)
Date:   Thu, 5 Oct 2023 10:22:42 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 01/28] media: mc: Add INTERNAL pad flag
Message-ID: <ZR6Ocg+Nm+r1ldy+@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-2-sakari.ailus@linux.intel.com>
 <ee3b59fb-796c-4e38-bc19-575eab4872c1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee3b59fb-796c-4e38-bc19-575eab4872c1@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the review!

On Thu, Oct 05, 2023 at 11:52:08AM +0200, Hans Verkuil wrote:
> On 03/10/2023 13:52, Sakari Ailus wrote:
> > Internal source pads will be used as routing endpoints in V4L2
> > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > 
> > Also prevent creating links to pads that have been flagged as internal and
> > initialising source pads with internal flag set.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/glossary.rst         |  6 ++++++
> >  .../userspace-api/media/mediactl/media-types.rst       |  6 ++++++
> >  drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> >  include/uapi/linux/media.h                             |  1 +
> >  4 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > index 96a360edbf3b..f7b99a4527c7 100644
> > --- a/Documentation/userspace-api/media/glossary.rst
> > +++ b/Documentation/userspace-api/media/glossary.rst
> > @@ -173,6 +173,12 @@ Glossary
> >  	An integrated circuit that integrates all components of a computer
> >  	or other electronic systems.
> >  
> > +_media-glossary-stream:
> > +    Stream
> > +	A distinct flow of data (image data or metadata) over a media pipeline
> > +	from source to sink. A source may be e.g. an image sensor and a sink
> > +	e.g. a memory buffer.
> 
> Hmm, I think this is a bit confusing. I think it would be better to replace
> "from source to sink" with "from the initial source to the final sink".

Seems fine to me. I'll use that in v7.

> 
> The original text doesn't make it clear that there can be many hops in
> between.
> 
> So also: "A source" -> "An initial source", and "a sink" -> "a final sink".
> 
> Note that "media pipeline" isn't defined either. Should that be added?

I can add that, too...

> 
> Finally, I think this should be a separate patch as it has nothing to do with
> adding the INTERNAL pad flag.

I agree, will split in v7.

> 
> > +
> >      V4L2 API
> >  	**V4L2 userspace API**
> >  
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 0ffeece1e0c8..28941da27790 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >  .. _MEDIA-PAD-FL-SINK:
> >  .. _MEDIA-PAD-FL-SOURCE:
> >  .. _MEDIA-PAD-FL-MUST-CONNECT:
> > +.. _MEDIA-PAD-FL-INTERNAL:
> >  
> >  .. flat-table:: Media pad flags
> >      :header-rows:  0
> > @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
> >  	  when this flag isn't set; the absence of the flag doesn't imply
> >  	  there is none.
> >  
> > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > +       -  The internal flag indicates an internal pad that has no external
> > +	  connections. Such a pad shall not be connected with a link. The
> > +	  internal flag indicates that the :ref:``stream
> > +	  <media-glossary-stream>`` either starts or ends in the entity.
> 
> This suggests that INTERNAL can be used for both sinks and sources, but...

Right. The INTERNAL flag in UAPI shouldn't be limited to sources, but at
the same time we don't have use for it in sinks. I'd prefer to leave this
open in the future. We could of course say that explicitly.

> 
> >  
> >  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> >  must be set for every pad.
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 543a392f8635..f5f290781021 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >  		iter->index = i++;
> >  
> >  		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > -					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > +					     MEDIA_PAD_FL_SOURCE)) != 1 ||
> > +		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
> > +		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
> 
> ...this appears to limit it to just sinks.

Yes, this is enforced so we won't get drivers that accidentally would use
the INTERNAL flag on source pads.

> 
> Regards,
> 
> 	Hans
> 
> >  			ret = -EINVAL;
> >  			break;
> >  		}
> > @@ -1075,7 +1077,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> >  
> >  	for (i = 0; i < entity->num_pads; i++) {
> >  		if ((entity->pads[i].flags &
> > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> >  			continue;
> >  
> >  		if (entity->pads[i].sig_type == sig_type)
> > @@ -1100,6 +1103,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> >  		return -EINVAL;
> >  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> >  		return -EINVAL;
> > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> > +	    WARN_ON(source->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > +		return -EINVAL;
> >  
> >  	link = media_add_link(&source->links);
> >  	if (link == NULL)
> > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > index 1c80b1d6bbaf..80cfd12a43fc 100644
> > --- a/include/uapi/linux/media.h
> > +++ b/include/uapi/linux/media.h
> > @@ -208,6 +208,7 @@ struct media_entity_desc {
> >  #define MEDIA_PAD_FL_SINK			(1U << 0)
> >  #define MEDIA_PAD_FL_SOURCE			(1U << 1)
> >  #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> > +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> >  
> >  struct media_pad_desc {
> >  	__u32 entity;		/* entity ID */
> 

-- 
Regards,

Sakari Ailus
