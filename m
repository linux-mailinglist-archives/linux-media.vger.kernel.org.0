Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429387BF555
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 10:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbjJJIK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 04:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234623AbjJJIKy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 04:10:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82508A9
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 01:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696925452; x=1728461452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tNin7GYTvIyuO2mxdsrdMPIrSxLpJkcUY8T9he1CYMQ=;
  b=azoe4aYEcCWwjJGnMs7rPtH5zi/iRL5aixBTyimw3xsfP+MiYOeWb7hU
   3F6mDb/w1EfxmlrPtQpgsW9gDWVVymuaAOAFyDxOrbtMPQUkVK6chs30b
   x9yz415AcRooqMA346nFNv/aGmyue0vW0wwjAvklBbCm/FV3xrGhSV7aQ
   92rmtCvlaRu/yNvenPyLSk29sAYvhsg/FYi9CBPwQDSUeaqK+bDFNKZJc
   B0n8+wY/wBBvAYAnmUiX27Es7Bx5B0mkPaorhkqknjYibyHE1g6yK3E5K
   9aHtM3N2ceYqs5uoSyoIomAkaE+KVvUN1NHvjQ5wb+fd7tAstnCAQFbPP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="470602243"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="470602243"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788494041"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="788494041"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:10:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 09CE71206D2;
        Tue, 10 Oct 2023 11:10:48 +0300 (EEST)
Date:   Tue, 10 Oct 2023 08:10:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/4] V4L2 sub-device active state helper, CCS fixes
Message-ID: <ZSUHCKhY2vlPsTpx@kekkonen.localdomain>
References: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
 <d5cf6f37-c1d2-4b79-bf12-611fead262bc@ideasonboard.com>
 <ZST7+X7jwjVxNtTF@kekkonen.localdomain>
 <7dccde6c-e82f-4c63-bfbc-b0f1170e2796@ideasonboard.com>
 <ZSUBTFd9Nz1k2W9K@kekkonen.localdomain>
 <f6db5b5c-1a9f-4687-a615-5c1a169d31bf@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6db5b5c-1a9f-4687-a615-5c1a169d31bf@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Tue, Oct 10, 2023 at 11:03:40AM +0300, Tomi Valkeinen wrote:
> On 10/10/2023 10:46, Sakari Ailus wrote:
> > Moi,
> > 
> > On Tue, Oct 10, 2023 at 10:40:05AM +0300, Tomi Valkeinen wrote:
> > > On 10/10/2023 10:23, Sakari Ailus wrote:
> > > > Moi,
> > > > 
> > > > On Tue, Oct 10, 2023 at 09:52:48AM +0300, Tomi Valkeinen wrote:
> > > > > On 10/10/2023 01:09, Sakari Ailus wrote:
> > > > > > Hi folks,
> > > > > > 
> > > > > > This set includes a helper for working with V4L2 sub-device active state as
> > > > > > well as a fix for the CCS driver sub-device state patch.
> > > > > > 
> > > > > > since v1:
> > > > > > 
> > > > > > - There were other drivers using __v4l2_subdev_state_alloc(). Ouch. Change
> > > > > >      those users as well. Note that this function should not be used in
> > > > > >      drivers, hence API niceness is not a high priority.
> > > > > > 
> > > > > > Sakari Ailus (4):
> > > > > >      media: v4l: subdev: Set sub-device active state earlier
> > > > > >      media: v4l: subdev: Add a helper to tell if a sub-device state is
> > > > > >        active
> > > > > >      media: ccs: Rework initialising sub-device state
> > > > > >      media: ccs: Fix a (harmless) lockdep warning
> > > > > > 
> > > > > >     drivers/media/i2c/ccs/ccs-core.c              | 64 ++++++++++++-------
> > > > > >     .../platform/renesas/rcar-vin/rcar-v4l2.c     |  3 +-
> > > > > >     .../media/platform/renesas/vsp1/vsp1_entity.c |  3 +-
> > > > > >     drivers/media/v4l2-core/v4l2-subdev.c         | 14 ++--
> > > > > >     drivers/staging/media/tegra-video/vi.c        |  2 +-
> > > > > >     include/media/v4l2-subdev.h                   | 11 +++-
> > > > > >     6 files changed, 66 insertions(+), 31 deletions(-)
> > > > > > 
> > > > > 
> > > > > I'm not familiar with the CCS driver, and you don't explain much why you are
> > > > > doing this, so it's a bit unclear to me. But I don't like it.
> > > > > 
> > > > > The idea with the subdev state was that the driver doesn't need to know
> > > > > whether it's active-state or try-state. It should behave the same way in
> > > > > both cases. This series goes against that.
> > > > > 
> > > > > Can you explain a bit what the issue is and what you are doing in this
> > > > > series?
> > > > 
> > > > The driver maintains internal state and that needs to be updated when the
> > > > configuration (including what's in sub-device state) changes. Generally the
> > > > driver knows (as for the whence field) which state it's dealing with but
> > > > that is not the case for init_cfg.
> > > 
> > > So you need to set the subdev state to sd->active_state earlier (in patch 1)
> > > so that the driver can use v4l2_subdev_state_whence()? You don't really
> > > explain that in the patch descriptions.
> > > 
> > > In other words, if init_cfg() were to get a whence-parameter, this wouldn't
> > > be needed? (I don't want to do that, just trying to understand what's going
> > > on).
> > 
> > Yes, that's correct.
> 
> Ok. So the driver keeps some private state separately from the subdev state,
> and keeps track of only the active state details, and thus it needs to know
> the whence in init_cfg so that it can fill in those details only when
> dealing with active state.

Precisely so.

> 
> > > > Alternatively I could split the internal workings of the driver into active
> > > > and try states but I prefer to improve the framework and make the driver
> > > > simpler.
> > > 
> > > I agree with the goal, but I don't think this is improving the framework.
> > > 
> > > If we decide that we need to know if a state is an active-state or a
> > > try-state, I think it's better to add a whence-field into the state itself.
> > > But I'd rather not.
> > 
> > In all other callbacks the whence is known but not in init_cfg.
> 
> Yes, those should be removed =).
> 
> Well, that may not work, but at least we should consider if a specific
> callback should ever care about active/try, and if not, remove the whence.
> 
> > Comparing with sd->active_state does this pretty cleanly, without a need to
> > change APIs.
> > 
> > > 
> > > > Deducing the internal configuration solely based on sub-device state is not
> > > > really feasible.
> > > 
> > > Am I correct in that what you really need is a way to sub-class the subdev
> > > state, so that you can have all that internal state in the subdev state, and
> > > thus all the code in the driver can work in "whence-agnostic" manner? That's
> > > something we've been thinking about for a long time.
> > 
> > In the case of the CCS driver it's not necessary to store these parameters
> > for try states: they are driver internal only.
> 
> That's fine, the sub-classed state can only have driver internal data (in
> addition to the standard data).
> 
> I think a follow-up question here is: why do you need to keep track of state
> that's only needed for active state? What is that state?

Sensor register values effectively. These are programmed just before
streaming starts. There's scaling factor, whether scaling is
horizontal-only, both vertical and horizontal or if there's no scaling.
Similarly for binning.

> 
> > > But the driver needs to be fixed now, not at some point in the future, of
> > > course. If the sub-classing would solve the issue (i.e. we have a plan in
> > > mind), I'd rather just hack this in the driver, instead of extending the
> > > framework, which might easily lead to other drivers going the wrong way too.
> > > 
> > > How about a private flag, set before calling v4l2_subdev_init_finalize(),
> > > and unset after the call. ccs_init_cfg() can look at that flag an if it's
> > > set, it's initializing an active state.
> > 
> > I dislike using driver specific flags in generic APIs.
> 
> I meant in the driver private state. Add a field to the driver's private
> data struct, and use that. Then it's wholly inside the driver, and needs
> just a few lines of hack-code, easy to remove later.
> 
> > While trivial sensor drivers have no use for such functionality, I would be
> > surprised if there would not be other similar cases.
> 
> Can you open this up a bit? Why do drivers need to know if an operation is
> about active or try state?
> 
> Answering my own question:
> 
> In some cases it's implicit: when starting the streaming, it's always active
> state. Similarly in, e.g., get_frame_desc.
> 
> Some operations might allow changing HW settings while streaming is enabled.
> I guess set_fmt might allow changing some specific things even while
> streaming is enabled. And if so, the callback needs to know if this is for
> active state or not.
> 
> But why does a driver need to know the whence in init_cfg? With sub-classed
> state, init_cfg should work fine for both active-state and try-state.

See above.

While init_cfg does not (obviously) enable binning or scaling, it still
deals with the same configuration parameters.

-- 
Regards,

Sakari Ailus
