Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81D476E2F0
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 10:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjHCI0E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 04:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233652AbjHCIZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 04:25:40 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEE85260
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 01:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691050788; x=1722586788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X6EBXguHtnboUcaGpIpI1RIvWpz3+XBGBjUa3WE1y7E=;
  b=Cb5GXizoqHMLN4IKv2Dus++MqYXo46nPnHtBzJ9f6HTew1zImyNYhcrH
   iP79CR7R7o3ddxMZ+q13WEXWLQ052KLGj5eRyEXYX+1w46ZychFgjMVnF
   e51WXBIiAUNdd0XFbS/WzdxINIUZxGtd65CaIKuZDlNDKOkqmWZBK5S9l
   QRXVGV+yvIVlYgFDkMdr3xsXK84ekCJwTdvDZ//7R5Ig6vWVZLKTc57dM
   I2Jn/+QwdcECaZkSzTlW8b1/Ri96f0Y7bORvM6EsZn0zZRpF1zPp9zJDR
   +yt8ydpYEEPKjCQnpT6AnYYT6JTVtx5I8uYIbmqOaL0v6k8qA1CyWaFEL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372543523"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="372543523"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="679400861"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="679400861"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 01:19:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 54ACC120AB8;
        Thu,  3 Aug 2023 11:19:43 +0300 (EEST)
Date:   Thu, 3 Aug 2023 08:19:43 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v2 3/9] media: mc: Add INTERNAL pad flag
Message-ID: <ZMtjH+eaCj1IwTYM@kekkonen.localdomain>
References: <20230802214556.180589-1-sakari.ailus@linux.intel.com>
 <20230802214556.180589-4-sakari.ailus@linux.intel.com>
 <ff86ce95-f776-fc52-3e0e-9cfd64e87480@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff86ce95-f776-fc52-3e0e-9cfd64e87480@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

Thanks for the review.

On Thu, Aug 03, 2023 at 10:56:35AM +0300, Tomi Valkeinen wrote:
> On 03/08/2023 00:45, Sakari Ailus wrote:
> > Internal source pads will be used as routing endpoints in V4L2
> > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > 
> > Also prevent creating links to pads that have been flagged as internal.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   Documentation/userspace-api/media/glossary.rst             | 6 ++++++
> >   Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
> >   drivers/media/mc/mc-entity.c                               | 6 +++++-
> >   include/uapi/linux/media.h                                 | 1 +
> >   4 files changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > index 96a360edbf3b..f7b99a4527c7 100644
> > --- a/Documentation/userspace-api/media/glossary.rst
> > +++ b/Documentation/userspace-api/media/glossary.rst
> > @@ -173,6 +173,12 @@ Glossary
> >   	An integrated circuit that integrates all components of a computer
> >   	or other electronic systems.
> > +_media-glossary-stream:
> > +    Stream
> > +	A distinct flow of data (image data or metadata) over a media pipeline
> > +	from source to sink. A source may be e.g. an image sensor and a sink
> > +	e.g. a memory buffer.
> > +
> >       V4L2 API
> >   	**V4L2 userspace API**
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 0ffeece1e0c8..28941da27790 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >   .. _MEDIA-PAD-FL-SINK:
> >   .. _MEDIA-PAD-FL-SOURCE:
> >   .. _MEDIA-PAD-FL-MUST-CONNECT:
> > +.. _MEDIA-PAD-FL-INTERNAL:
> >   .. flat-table:: Media pad flags
> >       :header-rows:  0
> > @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
> >   	  when this flag isn't set; the absence of the flag doesn't imply
> >   	  there is none.
> > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > +       -  The internal flag indicates an internal pad that has no external
> > +	  connections. Such a pad shall not be connected with a link. The
> > +	  internal flag indicates that the :ref:``stream
> > +	  <media-glossary-stream>`` either starts or ends in the entity.
> >   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> >   must be set for every pad.
> > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > index 4991281dcccc..03a9e0b8ebab 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -1071,7 +1071,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> >   	for (i = 0; i < entity->num_pads; i++) {
> >   		if ((entity->pads[i].flags &
> > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> >   			continue;
> >   		if (entity->pads[i].sig_type == sig_type)
> > @@ -1094,6 +1095,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> >   		return -EINVAL;
> >   	if (WARN_ON(!(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE)))
> >   		return -EINVAL;
> > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE &&
> > +		    source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > +		return -EINVAL;
> 
> What does this check?
> 
> Shouldn't we check here if either sink or source is INTERNAL, then fail?

We shouldn't have any source pads that have the internal flag set, that was
the intention here (but you can drop the source flag check). Also both
pads can't have the internal flag, I'll add that for v3.

-- 
Kind regards,

Sakari Ailus
