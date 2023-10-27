Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3747D996A
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 15:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345842AbjJ0NLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 09:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345860AbjJ0NLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 09:11:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5BA18A
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698412305; x=1729948305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xnOpzdpb+KTN1B3F8aVFdVd+t+dcn07k9VnibDe8fNE=;
  b=g8QOZvpBqwCBrnwNjpRInzpySg7ZuUFioF4VuF+deDFqgjsaUIGJju3j
   8iPnDEqrjiKAdWWE1EIZKOO172y0GoCPbUVmH3cBxPm3nSYrphRsM4YKZ
   uZ8dSMmCkluYq41gTe5/Gqlt6jCHN7uljpBEMo7O8iHhV4V/PRIJD9tZI
   g/NfJJ/Fj159+afcA3iUWvsLGU2ZFd4035YPBnO0HvTdlJ+305n5FBjhi
   YNmg9BhldMUdXUAC8tpR9+5eK85Jed5JVqO2OkqHhcq7EeYW8kf89c0Wt
   q50IvNWtvQFK6LHPgGRP9vdUw6rAm5kjZoc/H39QJuO9brOTcemgvD5CC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="592673"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="592673"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 06:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="903271874"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="903271874"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 06:09:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0C6E111F830;
        Fri, 27 Oct 2023 15:53:38 +0300 (EEST)
Date:   Fri, 27 Oct 2023 12:53:38 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 01/28] media: mc: Add INTERNAL pad flag
Message-ID: <ZTuy0g7_gGgOJtDy@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-2-sakari.ailus@linux.intel.com>
 <ee3b59fb-796c-4e38-bc19-575eab4872c1@xs4all.nl>
 <ZR6Ocg+Nm+r1ldy+@kekkonen.localdomain>
 <af7fce73-6ab9-4e5f-b436-d0eaa428fe26@xs4all.nl>
 <ZTmF23SklJ4-qzOv@kekkonen.localdomain>
 <20231027124804.GD12144@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027124804.GD12144@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 27, 2023 at 03:48:04PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, Oct 25, 2023 at 09:17:15PM +0000, Sakari Ailus wrote:
> > On Thu, Oct 05, 2023 at 01:16:27PM +0200, Hans Verkuil wrote:
> > > On 05/10/2023 12:22, Sakari Ailus wrote:
> > > > On Thu, Oct 05, 2023 at 11:52:08AM +0200, Hans Verkuil wrote:
> > > >> On 03/10/2023 13:52, Sakari Ailus wrote:
> > > >>> Internal source pads will be used as routing endpoints in V4L2
> > > >>> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > > >>>
> > > >>> Also prevent creating links to pads that have been flagged as internal and
> > > >>> initialising source pads with internal flag set.
> > > >>>
> > > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > >>> ---
> > > >>>  Documentation/userspace-api/media/glossary.rst         |  6 ++++++
> > > >>>  .../userspace-api/media/mediactl/media-types.rst       |  6 ++++++
> > > >>>  drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> > > >>>  include/uapi/linux/media.h                             |  1 +
> > > >>>  4 files changed, 21 insertions(+), 2 deletions(-)
> > > >>>
> > > >>> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> > > >>> index 96a360edbf3b..f7b99a4527c7 100644
> > > >>> --- a/Documentation/userspace-api/media/glossary.rst
> > > >>> +++ b/Documentation/userspace-api/media/glossary.rst
> > > >>> @@ -173,6 +173,12 @@ Glossary
> > > >>>  	An integrated circuit that integrates all components of a computer
> > > >>>  	or other electronic systems.
> > > >>>  
> > > >>> +_media-glossary-stream:
> > > >>> +    Stream
> > > >>> +	A distinct flow of data (image data or metadata) over a media pipeline
> > > >>> +	from source to sink. A source may be e.g. an image sensor and a sink
> > > >>> +	e.g. a memory buffer.
> > > >>
> > > >> Hmm, I think this is a bit confusing. I think it would be better to replace
> > > >> "from source to sink" with "from the initial source to the final sink".
> > > > 
> > > > Seems fine to me. I'll use that in v7.
> > > > 
> > > >>
> > > >> The original text doesn't make it clear that there can be many hops in
> > > >> between.
> > > >>
> > > >> So also: "A source" -> "An initial source", and "a sink" -> "a final sink".
> > > >>
> > > >> Note that "media pipeline" isn't defined either. Should that be added?
> > > > 
> > > > I can add that, too...
> > > > 
> > > >>
> > > >> Finally, I think this should be a separate patch as it has nothing to do with
> > > >> adding the INTERNAL pad flag.
> > > > 
> > > > I agree, will split in v7.
> > > > 
> > > >>
> > > >>> +
> > > >>>      V4L2 API
> > > >>>  	**V4L2 userspace API**
> > > >>>  
> > > >>> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > >>> index 0ffeece1e0c8..28941da27790 100644
> > > >>> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > >>> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > >>> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > > >>>  .. _MEDIA-PAD-FL-SINK:
> > > >>>  .. _MEDIA-PAD-FL-SOURCE:
> > > >>>  .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > >>> +.. _MEDIA-PAD-FL-INTERNAL:
> > > >>>  
> > > >>>  .. flat-table:: Media pad flags
> > > >>>      :header-rows:  0
> > > >>> @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
> > > >>>  	  when this flag isn't set; the absence of the flag doesn't imply
> > > >>>  	  there is none.
> > > >>>  
> > > >>> +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > > >>> +       -  The internal flag indicates an internal pad that has no external
> > > >>> +	  connections. Such a pad shall not be connected with a link. The
> > > >>> +	  internal flag indicates that the :ref:``stream
> > > >>> +	  <media-glossary-stream>`` either starts or ends in the entity.
> > > >>
> > > >> This suggests that INTERNAL can be used for both sinks and sources, but...
> > > > 
> > > > Right. The INTERNAL flag in UAPI shouldn't be limited to sources, but at
> > > > the same time we don't have use for it in sinks. I'd prefer to leave this
> > > > open in the future. We could of course say that explicitly.
> > > 
> > > I think it is better to mention that it is for streams that start in the
> > > entity only, but that in the future it might be extended to support streams
> > > that end in the entity.
> > > 
> > > When we add support for that, we need to update the documentation as well,
> > > at minimum with one or more examples of how that would be used.
> > 
> > I'll use this instead of the original sentence:
> > 
> > 	  The internal flag may currently be present only in a source pad only
> 
> Double "only". 
> 
> 	The internal flag may currently be present only in source pads, where
> 	...

Thanks for spotting this, I'll address it in v7.

> 
> > 	  where it indicates that the :ref:``stream <media-glossary-stream>``
> > 	  originates from within the entity.
> 

-- 
Regards,

Sakari Ailus
