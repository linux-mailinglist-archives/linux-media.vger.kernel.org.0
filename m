Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7A77CA2F4
	for <lists+linux-media@lfdr.de>; Mon, 16 Oct 2023 10:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjJPI7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Oct 2023 04:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbjJPI67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Oct 2023 04:58:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51B5E1
        for <linux-media@vger.kernel.org>; Mon, 16 Oct 2023 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697446736; x=1728982736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ngb0wzYygn4fpw8VpUbYXxc/w5ai5GZeVuv5FccSdLE=;
  b=DKEUyF1g+dGA4fVMe1G6jJKVmATnezA6ir+LdCT3/9hGm3Bx41SaeGvM
   hZ/twO2lrHXXXYWhdlyhgOdFbBCeWZ6/rDd1niE0IYLXxL7JCGHawIcuP
   wWrXCpxfmCviz+L0otgLf5lYZb9sMT5u6w4VUzD2YwRQbZ0HaIWzFJjIe
   V5IaegMC+/wvqIEr0V87asl4fRmHcBS3Uf9DUEZVLX77Ne1flNm2m31QD
   EVpT9vAIeFevfQeVOVSnz/BvtaXTxz5tfvF1jPa8wT0r9FfXFqf3Tddlo
   jqMqjukjCa1qGufUUt0ghK4oB2eLuMXWEQ5H3WPVhDwvlciUg3RXDQXJj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385322694"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="385322694"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821493728"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="821493728"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:58:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 885E711F82E;
        Mon, 16 Oct 2023 11:58:51 +0300 (EEST)
Date:   Mon, 16 Oct 2023 08:58:51 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <ZSz7Sxk6FwsL5RW/@kekkonen.localdomain>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-4-sakari.ailus@linux.intel.com>
 <20231013110439.GB11101@pendragon.ideasonboard.com>
 <ZSklcH8FrlCoIMqa@kekkonen.localdomain>
 <20231013112353.GA9923@pendragon.ideasonboard.com>
 <ZSkrFhGxCcWy4jRo@kekkonen.localdomain>
 <20231016082619.GI23177@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016082619.GI23177@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 16, 2023 at 11:26:19AM +0300, Laurent Pinchart wrote:
> On Fri, Oct 13, 2023 at 11:33:42AM +0000, Sakari Ailus wrote:
> > On Fri, Oct 13, 2023 at 02:23:53PM +0300, Laurent Pinchart wrote:
> > > On Fri, Oct 13, 2023 at 11:09:36AM +0000, Sakari Ailus wrote:
> > > > On Fri, Oct 13, 2023 at 02:04:39PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Oct 13, 2023 at 01:44:21PM +0300, Sakari Ailus wrote:
> > > > > > Rename the sub-devices state information access functions, removing
> > > > > > "_state" and "_stream" from them. This makes them shorter and so more
> > > > > > convenient to use. No other functions will be needed to access this
> > > > > > information.
> > > > > 
> > > > > The new names are too generic, and thus confusing. For instance,
> > > > > v4l2_subdev_get_format() is way too close to v4l2_subdev_get_fmt(). I'm
> > > > > fine dropping "_stream", but I would like to keep "_state".
> > > > > 
> > > > 
> > > > My intention was actually to rename v4l2_subdev_get_fmt() later on: it's
> > > > used in an ops struct, almost uniquely, so its name can be longer without
> > > > it being a nuisance. I can include this in the same set.
> > > 
> > > No objection, as long as the new name is clear.
> > > 
> > > > The reason for using a shorter names such as v4l2_subdev_get_format() is
> > > > that they're nicer to use in the code. The function names we've added
> > > > recently are often exceedingly long. There's hardly room for confusion in
> > > > this case either: these functions will remain as the only interface to
> > > > access information in sub-device state.
> > > 
> > > I agree that long names are not nice, but too short names end up not
> > > being descriptive enough. As these functions operate on a state, I'd
> > > like to keep that information in the name to differenciate them from
> > > functions operating on the subdev, and use the same state-aware prefix
> > > for all similar functions (I expect we'll get more of them). If you can
> > > find a good short form for the v4l2_subdev_state_ prefix that we can use
> > > through the code base, that would be fine too. And before you ask
> > > v4l2_sd_st_ is not good :-)
> > 
> > What would you say about v4l2_subdev_state_format() etc.? It's a function
> > to obtain a pointer to the format on a given pad(/stream) and "get"
> > typically isn't a part of the function name in other similar cases.
> 
> I like it better than v4l2_subdev_get_format() for sure, but I think the
> _get here still looks a bit better. v4l2_subdev_state_get_format() would
> already be shorter than the existing function name, do we need to
> shorten it even further ?

As noted, we don't have "_get" as part of other similar functions. The only
reason, as far as I can see, would be to keep it for historical reasons. As
we've been changing the APIs otherwise a lot, I don't put much value for
that. Having "get" also suggests refcounting is involved.

Therefore I prefer the shorter form.

-- 
Sakari Ailus
