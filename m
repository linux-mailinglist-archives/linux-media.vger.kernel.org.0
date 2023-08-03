Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB0676E353
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbjHCIkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbjHCIkG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:40:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACF4273B
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691051962; x=1722587962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ppb6keTs3POI3ABfBOQc/aAtYlYVYzqaHIOPboO5Mxk=;
  b=dOz01nvZQ21sOokx9wPGMw4tAOTv/DF7OaOJ1AFAvB6HaDUBGn5hWaIT
   Z+hF44AoP9uVyieva+7d3Bl2d5IpuJvZeNkGIIgjfQhav7fo65Ioyyh3L
   1QP+A8Nb6BmGaghki7aDppcsOJ/LRpc/Af+TVmifJQ1otlfVfgknNiixV
   uTNQt/g7mJW9/Z4utjCVT73ng/mLr9iNTVa3L4izfJY1U5hBaNKgbzjPC
   Qbp1kV/WqPnyPBiPsH7jpBNxPYq4CEpT8vrVzS5LK8ZaZOK5uvp5yXSFJ
   6IgsC4+8En6HSZ+fgUPk2StjHzB0UBMbe60yHQnxlyyFfsabTS5oi9vI+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368713376"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="368713376"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729492309"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="729492309"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:39:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2E1E11207A3;
        Thu,  3 Aug 2023 11:39:17 +0300 (EEST)
Date:   Thu, 3 Aug 2023 08:39:17 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v2 3/9] media: mc: Add INTERNAL pad flag
Message-ID: <ZMtntTGn0WloB7vL@kekkonen.localdomain>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
 <20230802214556.180589-4-sakari.ailus@linux.intel.com>
 <ff86ce95-f776-fc52-3e0e-9cfd64e87480@ideasonboard.com>
 <ZMtjH+eaCj1IwTYM@kekkonen.localdomain>
 <9f438329-3052-a9b3-d4c3-45e47e031b74@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f438329-3052-a9b3-d4c3-45e47e031b74@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 03, 2023 at 11:24:46AM +0300, Tomi Valkeinen wrote:
> On 03/08/2023 11:19, Sakari Ailus wrote:
> > Moi,
> > 
> > Thanks for the review.
> > 
> > On Thu, Aug 03, 2023 at 10:56:35AM +0300, Tomi Valkeinen wrote:
> > > On 03/08/2023 00:45, Sakari Ailus wrote:
> > > > Internal source pads will be used as routing endpoints in V4L2
> > > > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > > > 
> > > > Also prevent creating links to pads that have been flagged as internal.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >    Documentation/userspace-api/media/glossary.rst             | 6 ++++++
> > > >    Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
> > > >    drivers/media/mc/mc-entity.c                               | 6 +++++-
> > > >    include/uapi/linux/media.h                                 | 1 +
> > > >    4 files changed, 18 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > > > index 96a360edbf3b..f7b99a4527c7 100644
> > > > --- a/Documentation/userspace-api/media/glossary.rst
> > > > +++ b/Documentation/userspace-api/media/glossary.rst
> > > > @@ -173,6 +173,12 @@ Glossary
> > > >    	An integrated circuit that integrates all components of a computer
> > > >    	or other electronic systems.
> > > > +_media-glossary-stream:
> > > > +    Stream
> > > > +	A distinct flow of data (image data or metadata) over a media pipeline
> > > > +	from source to sink. A source may be e.g. an image sensor and a sink
> > > > +	e.g. a memory buffer.
> > > > +
> > > >        V4L2 API
> > > >    	**V4L2 userspace API**
> > > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > index 0ffeece1e0c8..28941da27790 100644
> > > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > > >    .. _MEDIA-PAD-FL-SINK:
> > > >    .. _MEDIA-PAD-FL-SOURCE:
> > > >    .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > > +.. _MEDIA-PAD-FL-INTERNAL:
> > > >    .. flat-table:: Media pad flags
> > > >        :header-rows:  0
> > > > @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
> > > >    	  when this flag isn't set; the absence of the flag doesn't imply
> > > >    	  there is none.
> > > > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > > > +       -  The internal flag indicates an internal pad that has no external
> > > > +	  connections. Such a pad shall not be connected with a link. The
> > > > +	  internal flag indicates that the :ref:``stream
> > > > +	  <media-glossary-stream>`` either starts or ends in the entity.
> > > >    One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > > >    must be set for every pad.
> > > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > > index 4991281dcccc..03a9e0b8ebab 100644
> > > > --- a/drivers/media/mc/mc-entity.c
> > > > +++ b/drivers/media/mc/mc-entity.c
> > > > @@ -1071,7 +1071,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> > > >    	for (i = 0; i < entity->num_pads; i++) {
> > > >    		if ((entity->pads[i].flags &
> > > > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > > > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > > > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> > > >    			continue;
> > > >    		if (entity->pads[i].sig_type == sig_type)
> > > > @@ -1094,6 +1095,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> > > >    		return -EINVAL;
> > > >    	if (WARN_ON(!(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE)))
> > > >    		return -EINVAL;
> > > > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE &&
> > > > +		    source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > > > +		return -EINVAL;
> > > 
> > > What does this check?
> > > 
> > > Shouldn't we check here if either sink or source is INTERNAL, then fail?
> > 
> > We shouldn't have any source pads that have the internal flag set, that was
> > the intention here (but you can drop the source flag check). Also both
> > pads can't have the internal flag, I'll add that for v3.
> 
> The function is media_create_pad_link(), isn't that about creating links
> between entities? Internal pads shouldn't be allowed on either side.

Uh, yes, indeed. I'll address this in v3.

-- 
Sakari Ailus
