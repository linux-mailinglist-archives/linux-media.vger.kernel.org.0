Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900697C5DB7
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 21:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbjJKTgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 15:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjJKTgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 15:36:08 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8256490
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 12:36:04 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S5NKq6MT2zyYS;
        Wed, 11 Oct 2023 22:35:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697052961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aIVVNDXGf7PnNzlxt+pG7UugROWWEvoajiv3qpUnLBs=;
        b=xz1j8mbVLVmtVsya2C77OW6MfE7xAINporLCEdrFBC7qH1JCYsq/8TKdQmU56uNwchuDyK
        wfKKz+TRROfxww8v4l3/+p1mkm3tB29xMDQMNnIdifq3/z4CgkaFyTdeq1tyegpoqkKH5B
        I7BZdNEfqKhDYQ7xYya/Due183KsKmU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697052961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aIVVNDXGf7PnNzlxt+pG7UugROWWEvoajiv3qpUnLBs=;
        b=xzDbQ5tstPoj+CqRc+zyeNkabIkh0TTpwHdLbU0RHno4Oaqls9WzbnJdxJdvLHReQW+dWO
        TD0r6kpAJPpT7iPo3n0SsU8F9lVgHqsyK4XqKlf4cGwK5147BTv2CVWqCcDWjTmU0NuOeW
        K96ttdFGbNXgKhUJe136lmSHnS72NZk=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697052961; a=rsa-sha256; cv=none;
        b=hOhL+G93cqbE12BBD+WblFh2sdDkJ6sAgLP8qpe2y8Gc1MFAdy4wccxme55iSYY4kygMcT
        6Z2j+DAUHgmL0TX3dXQ3rB6OQbgECC/NzNOwIV6kqFzWV0+52LDrIvz0AN/EBw5PUVSGCr
        zsAd5hf9gd4MxjF/GN3ais+nIzYikmM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A3908634CA9;
        Wed, 11 Oct 2023 22:35:55 +0300 (EEST)
Date:   Wed, 11 Oct 2023 19:35:55 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 01/28] media: mc: Add INTERNAL pad flag
Message-ID: <ZSb5G8QpZThOMUu8@valkosipuli.retiisi.eu>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-2-sakari.ailus@linux.intel.com>
 <0e29af0c-9bd9-4861-6d18-4d3ec5c3ee33@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e29af0c-9bd9-4861-6d18-4d3ec5c3ee33@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

Thanks for the review.

On Thu, Oct 05, 2023 at 02:04:55PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 14:52, Sakari Ailus wrote:
> > Internal source pads will be used as routing endpoints in V4L2
> > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> 
> It would probably be good to explain here and in the comments/docs, that a
> sink pad is a source pad =). When you say above "internal source pad", it's
> actually MEDIA_PAD_FL_INTERNAL | MEDIA_PAD_FL_SINK. I think this will
> confuse people time and time again, so it's probably good to explain it in
> as many places as possible.

I'll add it here.

> 
> > Also prevent creating links to pads that have been flagged as internal and
> > initialising source pads with internal flag set.
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   Documentation/userspace-api/media/glossary.rst         |  6 ++++++
> >   .../userspace-api/media/mediactl/media-types.rst       |  6 ++++++
> >   drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> >   include/uapi/linux/media.h                             |  1 +
> >   4 files changed, 21 insertions(+), 2 deletions(-)
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
> > index 543a392f8635..f5f290781021 100644
> > --- a/drivers/media/mc/mc-entity.c
> > +++ b/drivers/media/mc/mc-entity.c
> > @@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
> >   		iter->index = i++;
> >   		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> > -					     MEDIA_PAD_FL_SOURCE)) != 1) {
> > +					     MEDIA_PAD_FL_SOURCE)) != 1 ||
> > +		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
> > +		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
> >   			ret = -EINVAL;
> >   			break;
> 
> Would it make sense to have this "only internal-sinks supported"-check as a
> separate check, with an error print? It is a valid thing to do, we just want
> to disable it for the time being.

This would be a driver bug. We don't have such complaints on setting both
sink and source flags either, or similar things in the V4L2 framework. I'd
leave it as-is.

Maybe a WARN_ON() as we have in some cases below for creating links?

> 
> >   		}
> > @@ -1075,7 +1077,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> >   	for (i = 0; i < entity->num_pads; i++) {
> >   		if ((entity->pads[i].flags &
> > -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> > +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> > +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
> >   			continue;
> >   		if (entity->pads[i].sig_type == sig_type)
> > @@ -1100,6 +1103,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
> >   		return -EINVAL;
> >   	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
> >   		return -EINVAL;
> > +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> > +	    WARN_ON(source->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> > +		return -EINVAL;
> >   	link = media_add_link(&source->links);
> >   	if (link == NULL)
> > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > index 1c80b1d6bbaf..80cfd12a43fc 100644
> > --- a/include/uapi/linux/media.h
> > +++ b/include/uapi/linux/media.h
> > @@ -208,6 +208,7 @@ struct media_entity_desc {
> >   #define MEDIA_PAD_FL_SINK			(1U << 0)
> >   #define MEDIA_PAD_FL_SOURCE			(1U << 1)
> >   #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> > +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> >   struct media_pad_desc {
> >   	__u32 entity;		/* entity ID */
> 

-- 
Sakari Ailus
