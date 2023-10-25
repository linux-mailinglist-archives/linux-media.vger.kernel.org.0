Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D87437D766A
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 23:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjJYVLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 17:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjJYVLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 17:11:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AB7132
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698268289; x=1729804289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f8LB6pusfRz0HFT88Bu91slOdN6TYHu5CI2RQpLZuzQ=;
  b=jEc7WrXSvzyBXBx6yfu2EhyWrDvW27EgVZdgnFabnN2FBwsktI2/PBSu
   ip/B1L2ShpAMi4L8UBrwvkyglaUKIeU6Pt4KRBrYXTNpWn1+VaRRzkIG7
   SF556ER0cuSSKdzPSFRe/ZKDiJGBvuktLGUmcFTKYP9MTncOCQ7SYOBhJ
   fNZFEld8qbCufyqIqMWwqTBOHKHPEv4ZcnuDwpX7SZztSncHQyGBwdGsM
   2h/rmRGZJh1BWfqdoqK1l1mSQINs8D9UTFVNBqqQf/RmfMezHny55h+5J
   W0LknHJ8Ioxofvpfu0WLjQtPrTioEASeqZh7GWX/HWkF1Dv39GuyLsdTZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367613533"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="367613533"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752472962"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="752472962"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:11:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 01F6F11F8DF;
        Thu, 26 Oct 2023 00:11:24 +0300 (EEST)
Date:   Wed, 25 Oct 2023 21:11:23 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 13/28] media: v4l: subdev: Add a function to lock two
 sub-device states, use it
Message-ID: <ZTmEexsmaURoAg6F@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-4-sakari.ailus@linux.intel.com>
 <c3640f19-ae69-4915-b0f2-acc480c6aa07@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3640f19-ae69-4915-b0f2-acc480c6aa07@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Mon, Oct 09, 2023 at 01:34:00PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 15:07, Sakari Ailus wrote:
> > Add two new functions, v4l2_subdev_lock_states() and
> > v4l2_subdev_unclock_states(), to acquire and release the state of two
> > sub-devices. They differ from calling v4l2_subdev_{un,}lock_state() so
> > that if the two states share the same lock, the lock is acquired only
> > once.
> > 
> > Also use the new functions in v4l2_subdev_link_validate().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 12 +++-----
> >   include/media/v4l2-subdev.h           | 40 +++++++++++++++++++++++++++
> >   2 files changed, 44 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 854f9d4db923..df9a1ae65410 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1377,17 +1377,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
> >   	states_locked = sink_state && source_state;
> > -	if (states_locked) {
> > -		v4l2_subdev_lock_state(sink_state);
> > -		v4l2_subdev_lock_state(source_state);
> > -	}
> > +	if (states_locked)
> > +		v4l2_subdev_lock_states(sink_state, source_state);
> >   	ret = v4l2_subdev_link_validate_locked(link, states_locked);
> > -	if (states_locked) {
> > -		v4l2_subdev_unlock_state(sink_state);
> > -		v4l2_subdev_unlock_state(source_state);
> > -	}
> > +	if (states_locked)
> > +		v4l2_subdev_unlock_states(sink_state, source_state);
> >   	return ret;
> >   }
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 7c34243ffed9..e49e8af2fb52 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1418,6 +1418,46 @@ static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
> >   	mutex_unlock(state->lock);
> >   }
> > +/**
> > + * v4l2_subdev_lock_states - Lock two sub-device states
> > + * @state1: One subdevice state
> > + * @state2: The other subdevice state
> > + *
> > + * Locks the state of two sub-devices.
> > + *
> > + * The states must be unlocked with v4l2_subdev_unlock_states() after use.
> > + *
> > + * This differs from calling v4l2_subdev_lock_state() on both states so that if
> > + * the states share the same lock, the lock is acquired only once (so no
> > + * deadlock occurs). Note that it must be ensured the locks must always be
> > + * acquired in the same order.
> 
> Either s/must/will/ or maybe "note that the locks must always be
> acquired...".

How about:

The caller is responsible for ensuring the locks will always be acquired in
the same order.

> 
> Maybe it should be stated that state1 and state2 have to be from subdevices
> that are connected via a media link and something like "the sink subdevice
> must always be state 1, and the source subdevice must always be state2".

That's less generic than the text in the patch. But in practice I presume
this would be the case --- this is intended to be used in link validation.

-- 
Regards,

Sakari Ailus
