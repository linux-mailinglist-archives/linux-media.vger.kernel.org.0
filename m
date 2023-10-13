Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368847C8470
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjJMLdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjJMLdu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:33:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E984CCE
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697196828; x=1728732828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/vNUCIqtxBtM/UKybmnl0PPFlM06rmKywgAKaCT9Ng8=;
  b=e5wxtNK7eynku2rZssNE6US6IG9VhHewMx0J70jsneCB1BL/oneoZAPd
   i40t0g5H/gw4t8qN0wtm66gsa6mTmlGDW0Ii6a1HjRRNtzBwBtvVtuGiw
   rH8WG9GI5GEAhbBqFZiPmo7SCgnngmLvliOTGaovvIku0jBZtziW1CxFU
   Veip+b8AIYf5/4Xju+mFKOOgNMDvhgZ/6AoKo+CMioU5NK3rbWAnsfg7Q
   vka7gwmkL3ggX5U4gvctIV9qFJL6r/Lk3L8YqrGJ2ChB9GyFhLZQN8Wep
   1oNAm/jNmWtVV8Q1TYoKiHH2tuEqzMQZBcAyOA7ydQTY2VH+TzlGu29nc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382390759"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="382390759"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928398943"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="928398943"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:33:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id BB2EB120A2E;
        Fri, 13 Oct 2023 14:33:42 +0300 (EEST)
Date:   Fri, 13 Oct 2023 11:33:42 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <ZSkrFhGxCcWy4jRo@kekkonen.localdomain>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-4-sakari.ailus@linux.intel.com>
 <20231013110439.GB11101@pendragon.ideasonboard.com>
 <ZSklcH8FrlCoIMqa@kekkonen.localdomain>
 <20231013112353.GA9923@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013112353.GA9923@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 13, 2023 at 02:23:53PM +0300, Laurent Pinchart wrote:
> On Fri, Oct 13, 2023 at 11:09:36AM +0000, Sakari Ailus wrote:
> > On Fri, Oct 13, 2023 at 02:04:39PM +0300, Laurent Pinchart wrote:
> > > On Fri, Oct 13, 2023 at 01:44:21PM +0300, Sakari Ailus wrote:
> > > > Rename the sub-devices state information access functions, removing
> > > > "_state" and "_stream" from them. This makes them shorter and so more
> > > > convenient to use. No other functions will be needed to access this
> > > > information.
> > > 
> > > The new names are too generic, and thus confusing. For instance,
> > > v4l2_subdev_get_format() is way too close to v4l2_subdev_get_fmt(). I'm
> > > fine dropping "_stream", but I would like to keep "_state".
> > > 
> > 
> > My intention was actually to rename v4l2_subdev_get_fmt() later on: it's
> > used in an ops struct, almost uniquely, so its name can be longer without
> > it being a nuisance. I can include this in the same set.
> 
> No objection, as long as the new name is clear.
> 
> > The reason for using a shorter names such as v4l2_subdev_get_format() is
> > that they're nicer to use in the code. The function names we've added
> > recently are often exceedingly long. There's hardly room for confusion in
> > this case either: these functions will remain as the only interface to
> > access information in sub-device state.
> 
> I agree that long names are not nice, but too short names end up not
> being descriptive enough. As these functions operate on a state, I'd
> like to keep that information in the name to differenciate them from
> functions operating on the subdev, and use the same state-aware prefix
> for all similar functions (I expect we'll get more of them). If you can
> find a good short form for the v4l2_subdev_state_ prefix that we can use
> through the code base, that would be fine too. And before you ask
> v4l2_sd_st_ is not good :-)

What would you say about v4l2_subdev_state_format() etc.? It's a function
to obtain a pointer to the format on a given pad(/stream) and "get"
typically isn't a part of the function name in other similar cases.

-- 
Sakari Ailus
