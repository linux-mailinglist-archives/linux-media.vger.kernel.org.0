Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA68F7D98E3
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 14:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjJ0MsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 08:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbjJ0MsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 08:48:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA95A1AA
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 05:47:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F19F74A;
        Fri, 27 Oct 2023 14:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698410865;
        bh=0hvib3BasoLmdMKcAPbRc0P66eRpda8aX1TmjGotvT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z0TipUXMvGS/NRSqntOqtqaWphMLDG/TDkEIMmqohliOGa5ZswFEjcgHoa+x8xqCq
         QaVoSc4c/ImLPZREZMaJ8jatPUA9SHgHirBkohlYfWVVwm1xkmSnVtwkM0ydfvVtD5
         aRYD7ULj4M7L6biOdYZ+WZG8elk7QrUnT+aPEWkA=
Date:   Fri, 27 Oct 2023 15:48:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 01/28] media: mc: Add INTERNAL pad flag
Message-ID: <20231027124804.GD12144@pendragon.ideasonboard.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-2-sakari.ailus@linux.intel.com>
 <ee3b59fb-796c-4e38-bc19-575eab4872c1@xs4all.nl>
 <ZR6Ocg+Nm+r1ldy+@kekkonen.localdomain>
 <af7fce73-6ab9-4e5f-b436-d0eaa428fe26@xs4all.nl>
 <ZTmF23SklJ4-qzOv@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZTmF23SklJ4-qzOv@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Oct 25, 2023 at 09:17:15PM +0000, Sakari Ailus wrote:
> On Thu, Oct 05, 2023 at 01:16:27PM +0200, Hans Verkuil wrote:
> > On 05/10/2023 12:22, Sakari Ailus wrote:
> > > On Thu, Oct 05, 2023 at 11:52:08AM +0200, Hans Verkuil wrote:
> > >> On 03/10/2023 13:52, Sakari Ailus wrote:
> > >>> Internal source pads will be used as routing endpoints in V4L2
> > >>> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > >>>
> > >>> Also prevent creating links to pads that have been flagged as internal and
> > >>> initialising source pads with internal flag set.
> > >>>
> > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >>> ---
> > >>>  Documentation/userspace-api/media/glossary.rst         |  6 ++++++
> > >>>  .../userspace-api/media/mediactl/media-types.rst       |  6 ++++++
> > >>>  drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> > >>>  include/uapi/linux/media.h                             |  1 +
> > >>>  4 files changed, 21 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > >>> index 96a360edbf3b..f7b99a4527c7 100644
> > >>> --- a/Documentation/userspace-api/media/glossary.rst
> > >>> +++ b/Documentation/userspace-api/media/glossary.rst
> > >>> @@ -173,6 +173,12 @@ Glossary
> > >>>  	An integrated circuit that integrates all components of a computer
> > >>>  	or other electronic systems.
> > >>>  
> > >>> +_media-glossary-stream:
> > >>> +    Stream
> > >>> +	A distinct flow of data (image data or metadata) over a media pipeline
> > >>> +	from source to sink. A source may be e.g. an image sensor and a sink
> > >>> +	e.g. a memory buffer.
> > >>
> > >> Hmm, I think this is a bit confusing. I think it would be better to replace
> > >> "from source to sink" with "from the initial source to the final sink".
> > > 
> > > Seems fine to me. I'll use that in v7.
> > > 
> > >>
> > >> The original text doesn't make it clear that there can be many hops in
> > >> between.
> > >>
> > >> So also: "A source" -> "An initial source", and "a sink" -> "a final sink".
> > >>
> > >> Note that "media pipeline" isn't defined either. Should that be added?
> > > 
> > > I can add that, too...
> > > 
> > >>
> > >> Finally, I think this should be a separate patch as it has nothing to do with
> > >> adding the INTERNAL pad flag.
> > > 
> > > I agree, will split in v7.
> > > 
> > >>
> > >>> +
> > >>>      V4L2 API
> > >>>  	**V4L2 userspace API**
> > >>>  
> > >>> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > >>> index 0ffeece1e0c8..28941da27790 100644
> > >>> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > >>> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > >>> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > >>>  .. _MEDIA-PAD-FL-SINK:
> > >>>  .. _MEDIA-PAD-FL-SOURCE:
> > >>>  .. _MEDIA-PAD-FL-MUST-CONNECT:
> > >>> +.. _MEDIA-PAD-FL-INTERNAL:
> > >>>  
> > >>>  .. flat-table:: Media pad flags
> > >>>      :header-rows:  0
> > >>> @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
> > >>>  	  when this flag isn't set; the absence of the flag doesn't imply
> > >>>  	  there is none.
> > >>>  
> > >>> +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > >>> +       -  The internal flag indicates an internal pad that has no external
> > >>> +	  connections. Such a pad shall not be connected with a link. The
> > >>> +	  internal flag indicates that the :ref:``stream
> > >>> +	  <media-glossary-stream>`` either starts or ends in the entity.
> > >>
> > >> This suggests that INTERNAL can be used for both sinks and sources, but...
> > > 
> > > Right. The INTERNAL flag in UAPI shouldn't be limited to sources, but at
> > > the same time we don't have use for it in sinks. I'd prefer to leave this
> > > open in the future. We could of course say that explicitly.
> > 
> > I think it is better to mention that it is for streams that start in the
> > entity only, but that in the future it might be extended to support streams
> > that end in the entity.
> > 
> > When we add support for that, we need to update the documentation as well,
> > at minimum with one or more examples of how that would be used.
> 
> I'll use this instead of the original sentence:
> 
> 	  The internal flag may currently be present only in a source pad only

Double "only". 

	The internal flag may currently be present only in source pads, where
	...

> 	  where it indicates that the :ref:``stream <media-glossary-stream>``
> 	  originates from within the entity.

-- 
Regards,

Laurent Pinchart
