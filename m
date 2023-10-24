Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462147D5A28
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 20:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343992AbjJXSHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 14:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344117AbjJXSHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 14:07:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C474410DA
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 11:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698170866; x=1729706866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jg6JMtqDBqWoyjE05ZeVnihYGXjauJ2Gqks0Y/8/13g=;
  b=ODtTlAjbJcES3mMJiB0R70GXYS9eb0A55VevQiLlXUN3tJn7ZbbMFGZ2
   WetWhLztCdB3+JGtNwqjxovgI1khuuJdSJ2eHsSUCuR79belSpsbPJ/vj
   Nw4Sb/r7n71mGyp+aJWxpr4GtBxe0uNiriQlVHLKXPyNb9cJJb3uUUtRF
   xNveuwi2ab1KPbnyVc9lK8qJkyHcx0KfKPbCcod95p8UwXM6Zft7/Mf6i
   ga6c04AkRSlRAKOHmkvEfB25cKRAwZJl7NnEftcCJbUNVDwdcjaiNNHJZ
   vsZcXBO0Pr64w+mzBPy8E0iOUDgORioWjA6tN0m+1KthveEuDWvrpICGc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="5752352"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="5752352"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 11:07:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="793585440"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="793585440"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 11:07:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D5B031203B9;
        Tue, 24 Oct 2023 21:07:39 +0300 (EEST)
Date:   Tue, 24 Oct 2023 18:07:39 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 2/8] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZTgH61gDeqoflYcC@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-3-sakari.ailus@linux.intel.com>
 <f5af7581-8128-4848-b932-5997e4cdb475@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5af7581-8128-4848-b932-5997e4cdb475@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 24, 2023 at 05:45:27PM +0300, Tomi Valkeinen wrote:
> On 23/10/2023 20:44, Sakari Ailus wrote:
> > There are two sets of functions that return information from sub-device
> > state, one for stream-unaware users and another for stream-aware users.
> > Add support for stream-aware functions to return format, crop and compose
> > information from pad-based array that are functionally equivalent to the
> > old, stream-unaware ones.
> > 
> > Also check state is non-NULL, in order to guard against old drivers
> > potentially calling this with NULL state for active formats or selection
> > rectangles.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
> >   include/media/v4l2-subdev.h           |  9 ++++---
> >   2 files changed, 45 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index ee4fe8f33a41..955ee9a6c91f 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1684,6 +1684,19 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> >   	struct v4l2_subdev_stream_configs *stream_configs;
> >   	unsigned int i;
> > +	if (WARN_ON(!state))
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> 
> If this happens, is it a driver error? WARN_ON()?

The caller has used stream-unaware state and still specified a stream. It's
a driver bug. A WARN_ON() wouldn't be unreasonable in this case IMO.

> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks!

-- 
Regards,

Sakari Ailus
