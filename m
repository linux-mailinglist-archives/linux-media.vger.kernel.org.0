Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979D96F156E
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 12:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345490AbjD1K3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 06:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjD1K3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 06:29:16 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FAC2D63
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 03:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682677749; x=1714213749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MRvxy7PK/YBVDcSFejqLtGDg5ealWMKNlSHLxUz4U5M=;
  b=Kn4iLW/RU9SDwxgohbqr0yiMQc1jI6dgv7Ir6CkYgPLgIdu1bIY8cJ2f
   ckXSqw9S5qGnopFzu+B33GzrE9kGd9CqUlX1sQCG37KcjrOB/8GKzrsgK
   +LKVkwRky+IZwA19diK0oD9moQYkypGLTP5RkoZFpJGG0+NLhCHxMvTpD
   6pDEheVBThslPMoBbKpjctpzHkLF1QUx+2DlTy97+fNvDbgZoJjvKNkpu
   JuHIc5VE6xRhGejP3rMD5QirH/e0vo/ebodpTIrJQBi4ywIDJgmDk9m5s
   EtLGaFKkcPgzYz9MOMaij3BptgQux73cFiaRLSOxdJAGpD4hjPyDOLeiD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410806995"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="410806995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 03:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="806350121"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="806350121"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 03:29:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E985D11FCA0;
        Fri, 28 Apr 2023 13:29:02 +0300 (EEST)
Date:   Fri, 28 Apr 2023 13:29:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 09/18] media: v4l: async: Differentiate connecting and
 creating sub-devices
Message-ID: <ZEuf7siNLcUI+++u@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-10-sakari.ailus@linux.intel.com>
 <jli4aguuxhjvlc6foz6acm4o7yuk7adzpx2ff2t26tter53ebh@qys7n4wgx5ls>
 <ZDlWhJGLuki4h+1z@kekkonen.localdomain>
 <20230425021442.GM4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425021442.GM4921@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 25, 2023 at 05:14:42AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Apr 14, 2023 at 04:35:00PM +0300, Sakari Ailus wrote:
> > On Fri, Apr 14, 2023 at 10:52:25AM +0200, Jacopo Mondi wrote:
> > > On Thu, Mar 30, 2023 at 02:58:44PM +0300, Sakari Ailus wrote:
> > > > When the v4l2-async framework was introduced, the use case for it was to
> > > > connect a camera sensor with a parallel receiver. Both tended to be rather
> > > > simple devices with a single connection between them.
> > > >
> > > > The framework has been since improved in multiple ways but there are
> > > > limitations that have remained, for instance the assumption an async
> > > > sub-device is connected towards a single notifier and via a single link
> > > > only.
> > > >
> > > > This patch adds an object that represents the device while an earlier
> > > > patch in the series re-purposed the old struct v4l2_async_subdev as the
> > > > connection.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +-
> > > >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |   8 +-
> > > >  drivers/media/platform/ti/omap3isp/isp.h      |   2 +-
> > > >  drivers/media/v4l2-core/v4l2-async.c          | 163 ++++++++++++++++--
> > > >  include/media/v4l2-async.h                    |  32 +++-
> > > >  include/media/v4l2-subdev.h                   |   2 +-
> 
> We the introduction of such a new core concept, Documentation/ should
> also be updated.
> 
> > > >  6 files changed, 179 insertions(+), 30 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > index d30f0ecb1bfd..a1293c45aae1 100644
> > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > @@ -148,7 +148,7 @@ struct rkisp1_info {
> > > >   * @port:		port number (0: MIPI, 1: Parallel)
> > > >   */
> > > >  struct rkisp1_sensor_async {
> > > > -	struct v4l2_async_connection asd;
> > > > +	struct v4l2_async_subdev asd;
> 
> Ah, we're back to "asd" naming... There's no point in going back and
> forth in drivers, so you can ignore my comment about renaming the
> variables in drivers. Please however record the reason why variables are
> not renamed in the commit message of patch 08/18.
> 
> On second thought, why does patch 08/18 switch to v4l2_async_connection
> in a very large number of drivers, and this patch only moves back to
> v4l2_async_subdev in rkisp1 and omap3isp ? What's special about these
> two drivers ?

These changes actually appear unintended currently. The relation between
the driver struct remains related to the async connection. I'll drop them.

-- 
Sakari Ailus
