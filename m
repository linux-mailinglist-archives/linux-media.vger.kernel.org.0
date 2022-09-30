Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90CD95F0BC9
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 14:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbiI3Mec (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 08:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiI3Meb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 08:34:31 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E64216DDC7
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664541270; x=1696077270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vCb6SGSq+JwOBH3Ym/x3rmQ1cZkQFds7Lk2WpTeKKXo=;
  b=P5wWEAcT6ZJzmCknXOCzLiFfQwFl6D6KtCbZrLaB9uuxCw4/DzVk0jPC
   PoBKtV/wUcoziVOXFnLPF110uYEjyqyoU4xQR5bvhm1WOGSDFJfw+rMOi
   pytRv663kVvKm9uPYCnHATVPtDuQ3897K8v7NghHUl00m6zs3mEoW1Fap
   9uBIq8Gx/NHrkxP+yhZVJ7RGBaDSqNTttvImSGqQFsTtA0Q1CCE8/WLqe
   +It2cQmF18V5t2Kb6gHUCoF3+1sBdmPYZhkriKQ1Cw4N84IXmWZ6VxlwJ
   uobIwOmQhoL4PG758LSQ3fRwHoyK+ep3V3xD2ajQhGiQd+AeoX3onVP2g
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="302153271"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="302153271"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 05:34:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="622756767"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="622756767"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 05:34:26 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2265A20215;
        Fri, 30 Sep 2022 15:34:25 +0300 (EEST)
Date:   Fri, 30 Sep 2022 12:34:25 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v14 20/34] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <YzbiUYEHS1O6K2cQ@paasikivi.fi.intel.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-21-tomi.valkeinen@ideasonboard.com>
 <YzbNjzENgJ9PZsiJ@paasikivi.fi.intel.com>
 <28f60fbb-f994-b6c6-63ff-f78b7015861f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28f60fbb-f994-b6c6-63ff-f78b7015861f@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 30, 2022 at 02:22:40PM +0300, Tomi Valkeinen wrote:
> Hei,
> 
> On 30/09/2022 14:05, Sakari Ailus wrote:
> 
> > > @@ -191,6 +192,55 @@ struct v4l2_subdev_capability {
> > >   /* The v4l2 sub-device supports routing and multiplexed streams. */
> > >   #define V4L2_SUBDEV_CAP_STREAMS			0x00000002
> > > +/*
> > > + * Is the route active? An active route will start when streaming is enabled
> > > + * on a video node.
> > > + */
> > > +#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		_BITUL(0)
> > 
> > _BITUL() will produce an unsigned long. This isn't necessary.
> > 
> > Please use (1U << 0) instead. Same below.
> 
> Ok. I used BIT() originally, but that, of course, isn't available in
> userspace...
> 
> You might also have noticed that the next flag is bit 2, not bit 1. Bit 1
> was immutable route, which I dropped, but for the time being I kept the
> numbering to keep the ABI compatibility with my already compiled tools. I'll
> change that one to bit 1 in the next series, or if we decide to add a static
> flag, I'll add the static flag as bit 1.

Sounds good.

-- 
Sakari Ailus
