Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD4D7D76BB
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 23:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjJYV0e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 17:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJYV0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 17:26:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74889181
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698269189; x=1729805189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=unNU7fcQmWOT0vul0dDDJR5gy4QTN4dGMvGc48nSfrQ=;
  b=dwHz+d5lB68pGUieIKbIDNiE8w7XAmrHU3p94v1D6AGqWRtJXYPb9pVj
   LMVofPbmJePjQSaJrUmURXgDeFbp/ZmF+4hsVjqzNgyB28lXZItUP1RBE
   5dMfOvpVJtdWc/wrWWK2GArHvNtSuKi0eZQABgtH/7xndKF4nplw/5qLM
   mg50H7qOOz7rXPYGnHxcvIpz8jvopDuI2PvoP/yl0m/ZcYbbNkAY+pwHm
   U/jH4XPL79kUjCSzE313YzZia09+WWu1+a0BvGFpyXUSoydyaQLsMzFK/
   QHNfzg1w/CRqzAyqpXVoKVwMSfuQ6VoCZkIlZ9E9D1YcSPiAqy0FlmJ/q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="366750662"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="366750662"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="902697001"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="902697001"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:24:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 14E8B11F9E8;
        Thu, 26 Oct 2023 00:17:15 +0300 (EEST)
Date:   Wed, 25 Oct 2023 21:17:15 +0000
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
Message-ID: <ZTmF23SklJ4-qzOv@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-2-sakari.ailus@linux.intel.com>
 <ee3b59fb-796c-4e38-bc19-575eab4872c1@xs4all.nl>
 <ZR6Ocg+Nm+r1ldy+@kekkonen.localdomain>
 <af7fce73-6ab9-4e5f-b436-d0eaa428fe26@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af7fce73-6ab9-4e5f-b436-d0eaa428fe26@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 05, 2023 at 01:16:27PM +0200, Hans Verkuil wrote:
> On 05/10/2023 12:22, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thanks for the review!
> > 
> > On Thu, Oct 05, 2023 at 11:52:08AM +0200, Hans Verkuil wrote:
> >> On 03/10/2023 13:52, Sakari Ailus wrote:
> >>> Internal source pads will be used as routing endpoints in V4L2
> >>> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> >>>
> >>> Also prevent creating links to pads that have been flagged as internal and
> >>> initialising source pads with internal flag set.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>  Documentation/userspace-api/media/glossary.rst         |  6 ++++++
> >>>  .../userspace-api/media/mediactl/media-types.rst       |  6 ++++++
> >>>  drivers/media/mc/mc-entity.c                           | 10 ++++++++--
> >>>  include/uapi/linux/media.h                             |  1 +
> >>>  4 files changed, 21 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> >>> index 96a360edbf3b..f7b99a4527c7 100644
> >>> --- a/Documentation/userspace-api/media/glossary.rst
> >>> +++ b/Documentation/userspace-api/media/glossary.rst
> >>> @@ -173,6 +173,12 @@ Glossary
> >>>  	An integrated circuit that integrates all components of a computer
> >>>  	or other electronic systems.
> >>>  
> >>> +_media-glossary-stream:
> >>> +    Stream
> >>> +	A distinct flow of data (image data or metadata) over a media pipeline
> >>> +	from source to sink. A source may be e.g. an image sensor and a sink
> >>> +	e.g. a memory buffer.
> >>
> >> Hmm, I think this is a bit confusing. I think it would be better to replace
> >> "from source to sink" with "from the initial source to the final sink".
> > 
> > Seems fine to me. I'll use that in v7.
> > 
> >>
> >> The original text doesn't make it clear that there can be many hops in
> >> between.
> >>
> >> So also: "A source" -> "An initial source", and "a sink" -> "a final sink".
> >>
> >> Note that "media pipeline" isn't defined either. Should that be added?
> > 
> > I can add that, too...
> > 
> >>
> >> Finally, I think this should be a separate patch as it has nothing to do with
> >> adding the INTERNAL pad flag.
> > 
> > I agree, will split in v7.
> > 
> >>
> >>> +
> >>>      V4L2 API
> >>>  	**V4L2 userspace API**
> >>>  
> >>> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> >>> index 0ffeece1e0c8..28941da27790 100644
> >>> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> >>> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> >>> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >>>  .. _MEDIA-PAD-FL-SINK:
> >>>  .. _MEDIA-PAD-FL-SOURCE:
> >>>  .. _MEDIA-PAD-FL-MUST-CONNECT:
> >>> +.. _MEDIA-PAD-FL-INTERNAL:
> >>>  
> >>>  .. flat-table:: Media pad flags
> >>>      :header-rows:  0
> >>> @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
> >>>  	  when this flag isn't set; the absence of the flag doesn't imply
> >>>  	  there is none.
> >>>  
> >>> +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> >>> +       -  The internal flag indicates an internal pad that has no external
> >>> +	  connections. Such a pad shall not be connected with a link. The
> >>> +	  internal flag indicates that the :ref:``stream
> >>> +	  <media-glossary-stream>`` either starts or ends in the entity.
> >>
> >> This suggests that INTERNAL can be used for both sinks and sources, but...
> > 
> > Right. The INTERNAL flag in UAPI shouldn't be limited to sources, but at
> > the same time we don't have use for it in sinks. I'd prefer to leave this
> > open in the future. We could of course say that explicitly.
> 
> I think it is better to mention that it is for streams that start in the
> entity only, but that in the future it might be extended to support streams
> that end in the entity.
> 
> When we add support for that, we need to update the documentation as well,
> at minimum with one or more examples of how that would be used.

I'll use this instead of the original sentence:

	  The internal flag may currently be present only in a source pad only
	  where it indicates that the :ref:``stream <media-glossary-stream>``
	  originates from within the entity.

-- 
Regards,

Sakari Ailus
