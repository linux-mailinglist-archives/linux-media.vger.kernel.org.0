Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE657BF41A
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442491AbjJJHXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442472AbjJJHXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:23:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692E29F
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696922622; x=1728458622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wJadMgvyT4KB+zyVGSMddHwRaZkrc6MyWhSsDAxULzM=;
  b=P6FwrvqvJUN5ku5tR9otcha5zZkPMFC1P906JIHnIfn6odknZ3z7G9l3
   pb/eVyY5CV+k+laX5XCmV5ZiL5NGMX5MhZA+sJIMJdUzdMy1cbgESKehe
   a8AU7PV2krNSKaF8yWMfo+y3/fWTzcdhoTKj4/F7eTtWdNTSWpdlTNlbz
   l7pFBFQvT3uGNM+LzuGYc/cs28yTugHmQpvjDQ6BNYBkZEAYs38PiiNQH
   dfd7kpMbn6AlpyiVD/mYtvUjjPT9Z8mAo0ZrDfROZVoh+qAYIewJUEOUM
   ANScDb52HnNt+8NVs72glKhuj/YleArjS7Lx1BD36wQCDFWwGdzQSIRL5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384186755"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="384186755"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 00:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="753300045"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="753300045"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 00:23:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C148211F8DE;
        Tue, 10 Oct 2023 10:23:37 +0300 (EEST)
Date:   Tue, 10 Oct 2023 07:23:37 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/4] V4L2 sub-device active state helper, CCS fixes
Message-ID: <ZST7+X7jwjVxNtTF@kekkonen.localdomain>
References: <20231009220906.221303-1-sakari.ailus@linux.intel.com>
 <d5cf6f37-c1d2-4b79-bf12-611fead262bc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5cf6f37-c1d2-4b79-bf12-611fead262bc@ideasonboard.com>
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

On Tue, Oct 10, 2023 at 09:52:48AM +0300, Tomi Valkeinen wrote:
> On 10/10/2023 01:09, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This set includes a helper for working with V4L2 sub-device active state as
> > well as a fix for the CCS driver sub-device state patch.
> > 
> > since v1:
> > 
> > - There were other drivers using __v4l2_subdev_state_alloc(). Ouch. Change
> >    those users as well. Note that this function should not be used in
> >    drivers, hence API niceness is not a high priority.
> > 
> > Sakari Ailus (4):
> >    media: v4l: subdev: Set sub-device active state earlier
> >    media: v4l: subdev: Add a helper to tell if a sub-device state is
> >      active
> >    media: ccs: Rework initialising sub-device state
> >    media: ccs: Fix a (harmless) lockdep warning
> > 
> >   drivers/media/i2c/ccs/ccs-core.c              | 64 ++++++++++++-------
> >   .../platform/renesas/rcar-vin/rcar-v4l2.c     |  3 +-
> >   .../media/platform/renesas/vsp1/vsp1_entity.c |  3 +-
> >   drivers/media/v4l2-core/v4l2-subdev.c         | 14 ++--
> >   drivers/staging/media/tegra-video/vi.c        |  2 +-
> >   include/media/v4l2-subdev.h                   | 11 +++-
> >   6 files changed, 66 insertions(+), 31 deletions(-)
> > 
> 
> I'm not familiar with the CCS driver, and you don't explain much why you are
> doing this, so it's a bit unclear to me. But I don't like it.
> 
> The idea with the subdev state was that the driver doesn't need to know
> whether it's active-state or try-state. It should behave the same way in
> both cases. This series goes against that.
> 
> Can you explain a bit what the issue is and what you are doing in this
> series?

The driver maintains internal state and that needs to be updated when the
configuration (including what's in sub-device state) changes. Generally the
driver knows (as for the whence field) which state it's dealing with but
that is not the case for init_cfg.

Alternatively I could split the internal workings of the driver into active
and try states but I prefer to improve the framework and make the driver
simpler.

Deducing the internal configuration solely based on sub-device state is not
really feasible.

-- 
Terveisin,

Sakari Ailus
