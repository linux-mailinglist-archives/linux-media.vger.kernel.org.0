Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9981A6FAFFC
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 14:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjEHM3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 08:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbjEHM3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 08:29:04 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4153A2B7
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683548919; x=1715084919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9KuFWC2D/VFm+eENMWQKXZKbATP8NlMfjHpspq4lips=;
  b=dpqXoI5T0pfBIfQitEwSRKcHP+IUQqaFLUJIjrMd+zfr28nC3KfP/XKh
   VB4rDjV/kGIJ1P9wNePRoS3yTm1G+fOhSRKJtC4NvSEiNQR2eFLP6fqfe
   hOBjWOM9PTsFvpAIGYiK1Bl/W/82Zox65hG+mcIyePkMz8gnSJGofQg7e
   84sbxJJ1GEclM6Co/e50MUWgDBfUyx0Y+cTmW3pgy0hMUxcVOW2yhEiRF
   QWDnAnn7jZcZw7EdmfO0DUsxS4/uEsvxsFW/6zM5IvnrGP7xuAJRhYBxz
   JfAyWN72e17x1D9gHM5XXmUGQbz1vSB1FYVcyd4T6N25zVCALcjGOybIt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="338852403"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="338852403"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="729063094"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="729063094"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:28:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1E6DC1203DA;
        Mon,  8 May 2023 15:28:26 +0300 (EEST)
Date:   Mon, 8 May 2023 15:28:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Message-ID: <ZFjq6ohCFLcx4K+n@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-2-sakari.ailus@linux.intel.com>
 <e41293d2-2b2b-1c3a-e3e9-1384369b1fcc@ideasonboard.com>
 <ZFjlQ9oKmjuLRf+4@kekkonen.localdomain>
 <568aea8d-4173-218e-5315-6aa02bef8121@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568aea8d-4173-218e-5315-6aa02bef8121@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 08, 2023 at 03:07:31PM +0300, Tomi Valkeinen wrote:
> On 08/05/2023 15:04, Sakari Ailus wrote:
> > Hi Tomi,
> > 
> > Thank you for the review.
> > 
> > On Mon, May 08, 2023 at 12:52:24PM +0300, Tomi Valkeinen wrote:
> > > On 06/05/2023 00:52, Sakari Ailus wrote:
> > > > Internal source pads will be used as routing endpoints in V4L2
> > > > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > > > 
> > > > Also prevent creating links to pads that have been flagged as internal.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >    .../userspace-api/media/mediactl/media-types.rst          | 7 +++++++
> > > >    drivers/media/mc/mc-entity.c                              | 8 +++++++-
> > > >    include/uapi/linux/media.h                                | 1 +
> > > >    3 files changed, 15 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > index 0ffeece1e0c8..c724139ad46c 100644
> > > > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > > > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > > >    .. _MEDIA-PAD-FL-SINK:
> > > >    .. _MEDIA-PAD-FL-SOURCE:
> > > >    .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > > +.. _MEDIA-PAD-FL-INTERNAL-SOURCE:
> > > >    .. flat-table:: Media pad flags
> > > >        :header-rows:  0
> > > > @@ -382,6 +383,12 @@ Types and flags used to represent the media graph elements
> > > >    	  when this flag isn't set; the absence of the flag doesn't imply
> > > >    	  there is none.
> > > > +    *  -  ``MEDIA_PAD_FL_INTERNAL_SOURCE``
> > > > +       -  This flag indicates an internal pad that has no external
> > > > +	  connections. Such a pad may not be connected with a link. The internal
> > > 
> > > "must not"? Or "shall not"?
> > 
> > I think "may not" is appropriate. I'd be fine with shall, too, albeit it
> > wouldn't change the meaning in practice.
> 
> Ok. I don't speak standardize, and I'm not a native English speaker. But to
> me "may not be connected" sounds like it is possibly not connected, but also
> that it is possible for it to be connected.

Ah, yes, I think you're actually right. But that is what I thought when
writing the text. ;-) Shall we use shall, then?

-- 
Sakari Ailus
