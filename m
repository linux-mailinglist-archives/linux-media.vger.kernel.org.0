Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A862778977
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 11:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbjHKJJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 05:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjHKJJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 05:09:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93F62D61
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691744986; x=1723280986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62NM/j4G6DH3olHk0s3PIQjLSARsKlg8ddGRw76YLgk=;
  b=n2ih4CE2ccTHm2T8F1f7OBGdPq3qs2/5IXQPBw8eK5YCHK/rYhdIMVtm
   lG+EaImQbhZP4Eh+/GXCQqxAE994j7dB4iXEsn3/iJogfAnU3DG6DcUW+
   V5xTEeiwNemkS58lP+jrylXRnyZCENmDLfNGFlQo4dHMnyh8bKUOOwPhd
   zCAGBSr3f7OsI1WgeLqyfpXzxxiekzyNAYUGLRte68Esybj2qbVID2oIJ
   JaCUYeDdANkro8ndi+iq/y72xKxr4FvJh6E7maq2q42ufwbwNvv4dSol8
   q/pzaYUWgZKXMAOQ0G3JS1myNY1MUNp0t+QTFhDHUtWp9QtlOptm8ZDsV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="458008711"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="458008711"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="735724922"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="735724922"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:09:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 56F4911FAE0;
        Fri, 11 Aug 2023 12:09:41 +0300 (EEST)
Date:   Fri, 11 Aug 2023 09:09:41 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 03/10] media: mc: Add INTERNAL pad flag
Message-ID: <ZNX61Z5SLvi9HeuV@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-4-sakari.ailus@linux.intel.com>
 <frwh2hqesatlwhxqlesujfhwdvhrsxux5b5p2hsqrqqdzebrwz@2squt4aelrac>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <frwh2hqesatlwhxqlesujfhwdvhrsxux5b5p2hsqrqqdzebrwz@2squt4aelrac>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the review.

On Thu, Aug 10, 2023 at 04:12:18PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Aug 08, 2023 at 10:55:31AM +0300, Sakari Ailus wrote:
> > Internal source pads will be used as routing endpoints in V4L2
> > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> >
> > Also prevent creating links to pads that have been flagged as internal.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/glossary.rst             | 6 ++++++
> >  Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
> >  drivers/media/mc/mc-entity.c                               | 6 +++++-
> >  include/uapi/linux/media.h                                 | 1 +
> >  4 files changed, 18 insertions(+), 1 deletion(-)
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
> >
> >  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> >  must be set for every pad.
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 4991281dcccc..03a9e0b8ebab 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -1071,7 +1071,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> >
> >  	for (i = 0; i < entity->num_pads; i++) {
> >  		if ((entity->pads[i].flags &
> > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> >  			continue;
> >
> >  		if (entity->pads[i].sig_type == sig_type)
> > @@ -1094,6 +1095,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> >  		return -EINVAL;
> >  	if (WARN_ON(!(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE)))
> >  		return -EINVAL;
> > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE &&
> 
> Why do you need to check for this again here ? Hasn't the previous
> if() clause just validated that
> 
>         source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE ?

Yes, this needs to be changed. As a link is created here, the internal flag
shouldn't be present in neither sink nor source pads. I may have forgotten
to address this previously, I'll do this for v4.

> 
> > +		    source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > +		return -EINVAL;
> >  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> >  		return -EINVAL;
> >
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

-- 
Regards,

Sakari Ailus
