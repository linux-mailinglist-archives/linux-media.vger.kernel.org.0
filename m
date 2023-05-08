Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9806FAF9D
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 14:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjEHMFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 08:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233648AbjEHME3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 08:04:29 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87CA194
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 05:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683547463; x=1715083463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+DMdJI6uCzC9+BDVG1PJ2Eo1xb8pNVYpIHjEyrpMcU=;
  b=O0dyCmOmwBzwWegg4ZRaC0BX1PYYcQKwLYOIknrCopw6b6OqznmQGXWL
   f7X2zP45ujXBZ2dfHQ7/anO8cvmEgzmUwSLRK+N/NdDs+jcfbbQSKc+4E
   jMOxozMp1ZDogzuBAJcBnUCeHEP77TSFkwr3ZhU1m4CQBSW1P5ny/OnT9
   tFPyc7rFSuaWXP6E+9KUJuzTt6PJNoAH3+lfCWtoaxyFGdbn/OiW7qXWr
   KsGsDWAaKWR5DLMPRnJwybM9+PjFBWSUbl+nB9IWDde9t6N9HgbuzR2ZG
   U9K7HiZuPXoKXGcEQD6VBXJsiHAWfDrJP3HTMFDybA1WiiYHl9EMDZZV2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329985209"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="329985209"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="944829813"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="944829813"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:04:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 6DD8C1203DA;
        Mon,  8 May 2023 15:04:19 +0300 (EEST)
Date:   Mon, 8 May 2023 15:04:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Message-ID: <ZFjlQ9oKmjuLRf+4@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-2-sakari.ailus@linux.intel.com>
 <e41293d2-2b2b-1c3a-e3e9-1384369b1fcc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e41293d2-2b2b-1c3a-e3e9-1384369b1fcc@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the review.

On Mon, May 08, 2023 at 12:52:24PM +0300, Tomi Valkeinen wrote:
> On 06/05/2023 00:52, Sakari Ailus wrote:
> > Internal source pads will be used as routing endpoints in V4L2
> > [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> > 
> > Also prevent creating links to pads that have been flagged as internal.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/mediactl/media-types.rst          | 7 +++++++
> >   drivers/media/mc/mc-entity.c                              | 8 +++++++-
> >   include/uapi/linux/media.h                                | 1 +
> >   3 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> > index 0ffeece1e0c8..c724139ad46c 100644
> > --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> > +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >   .. _MEDIA-PAD-FL-SINK:
> >   .. _MEDIA-PAD-FL-SOURCE:
> >   .. _MEDIA-PAD-FL-MUST-CONNECT:
> > +.. _MEDIA-PAD-FL-INTERNAL-SOURCE:
> >   .. flat-table:: Media pad flags
> >       :header-rows:  0
> > @@ -382,6 +383,12 @@ Types and flags used to represent the media graph elements
> >   	  when this flag isn't set; the absence of the flag doesn't imply
> >   	  there is none.
> > +    *  -  ``MEDIA_PAD_FL_INTERNAL_SOURCE``
> > +       -  This flag indicates an internal pad that has no external
> > +	  connections. Such a pad may not be connected with a link. The internal
> 
> "must not"? Or "shall not"?

I think "may not" is appropriate. I'd be fine with shall, too, albeit it
wouldn't change the meaning in practice.

-- 
Sakari Ailus
