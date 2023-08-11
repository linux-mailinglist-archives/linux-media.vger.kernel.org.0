Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADF6778E2E
	for <lists+linux-media@lfdr.de>; Fri, 11 Aug 2023 13:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbjHKLsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Aug 2023 07:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235203AbjHKLsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Aug 2023 07:48:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E233EFB
        for <linux-media@vger.kernel.org>; Fri, 11 Aug 2023 04:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691754525; x=1723290525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oKpwrmED1pRx1XsZkuMuLKX5I70twYEP7w4zlPZhLXU=;
  b=jraPc9hRaXfiBxTaUbj30L5ciaunCDha/WfaCQnVBXYBU7MCCQHH/tCS
   3qPDLELGeIFQbh27Ml+Y856pHLIeD49cEOmTIZ/Kxx2VuP0SehwwsqGXP
   jekuDvPF/rwpGlxs6OXkPVT25WtD6igkG7MA8YFEu5EQauSPvUC61YZLY
   AMBGn1tRBJyqiNbqIBkruy5ZpOnM1/NBU5jBmC0k2jrayN82m1hWKqIYU
   jRj2NYZi9oev/R/TB8ktFmJGC4fV8E/2nwuuTanBcStcl23JJwBtplC+z
   cfIOPnGU7ObcQPblNL7pyjTPFtiUmrpo7vnfRu5bVnfRvlYUZQMC5DX+K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="356619537"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="356619537"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767647619"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="767647619"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:48:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 753231213C1;
        Fri, 11 Aug 2023 14:48:40 +0300 (EEST)
Date:   Fri, 11 Aug 2023 11:48:40 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 03/10] media: mc: Add INTERNAL pad flag
Message-ID: <ZNYgGKFncrwnn3qD@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-4-sakari.ailus@linux.intel.com>
 <e20a1335-6e6f-6c64-9640-8984c50338ca@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e20a1335-6e6f-6c64-9640-8984c50338ca@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Aug 08, 2023 at 10:15:45AM +0200, Hans Verkuil wrote:
> On 08/08/2023 09:55, Sakari Ailus wrote:
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
> > +		    source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL))
> 
> Even though this code is correct, I prefer to have () around the 'x & y' parts.
> It avoids confusion for the reader.

There actually should be a check here that neither of the pads have
internal flag set --- internal pads may not be connected by a link. I'll
fix that for v4. This was actually a leftover from the "internal source"
flag.

> 
> Up to you, though.

I'd prefer to keep it as-is. :-)

-- 
Regards,

Sakari Ailus
