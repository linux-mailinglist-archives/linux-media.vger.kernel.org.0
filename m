Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A701F6F0534
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 13:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243630AbjD0Lwr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 07:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243612AbjD0Lwq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 07:52:46 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BE84C3D
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 04:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682596363; x=1714132363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZreUdP/tcpcBzT386aX3Rkh/8aqFIQvqgP6nZf/khyE=;
  b=cpyWOOGoozvwEAz1UQpGNltfbfPMKMT1BzBy3+poB8nDMRKyKA0uW/4p
   J4wXs+vNMEbaqt5RSQAL5ihY75oZ0pEcDH09VvsmUHok0SyNs5bHuqVtx
   uetBA4qLMgiwuQWwD34XBsXDrAVNthS8jxUwcnmL5G/ZxgsmV+eKQTrxs
   73a3PvDoenyw9fWQnNRmy5EwyQ/gzP/7JkzgpwKbwO8bsCUgFnf1Yt78z
   Qo15gnfeMkNU4j7S2ZSQA3zaLWMxYCc3vXjpm2/hYAb/NfnmG5PdsIx1N
   ZEcf7HMEBjKBJCh9dgEOmwcZgZZtqB730mksAPXfDKtQmO5vtSARANMLh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="375395164"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="375395164"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="694354514"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="694354514"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:52:40 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 40BAA1224B5;
        Thu, 27 Apr 2023 14:52:37 +0300 (EEST)
Date:   Thu, 27 Apr 2023 14:52:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 07/18] media: v4l: async: Clean up list heads and entries
Message-ID: <ZEpiBX8b2rrO36vE@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-8-sakari.ailus@linux.intel.com>
 <20230425004936.GE4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425004936.GE4921@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 25, 2023 at 03:49:36AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Mar 30, 2023 at 02:58:42PM +0300, Sakari Ailus wrote:
> > The naming of list heads and list entries is confusing as they're named
> > similarly. Use _head for list head and _list for list entries.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  2 +-
> >  .../platform/renesas/rcar-vin/rcar-core.c     |  2 +-
> >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 +-
> >  drivers/media/platform/xilinx/xilinx-vipp.c   | 10 +--
> >  drivers/media/v4l2-core/v4l2-async.c          | 66 +++++++++----------
> >  .../staging/media/imx/imx-media-dev-common.c  |  2 +-
> >  drivers/staging/media/tegra-video/vi.c        |  6 +-
> >  include/media/v4l2-async.h                    | 21 +++---
> >  8 files changed, 56 insertions(+), 55 deletions(-)
> 
> [snip]
> 
> > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > index 0c4cffd081c9..425280b4d387 100644
> > --- a/include/media/v4l2-async.h
> > +++ b/include/media/v4l2-async.h
> > @@ -68,7 +68,7 @@ struct v4l2_async_match {
> >   * @match:	struct of match type and per-bus type matching data sets
> >   * @asd_list:	used to add struct v4l2_async_subdev objects to the
> >   *		master notifier @asd_list
> 
> It's now called @asd_head.
> 
> > - * @list:	used to link struct v4l2_async_subdev objects, waiting to be
> > + * @waiting_list: used to link struct v4l2_async_subdev objects, waiting to be
> >   *		probed, to a notifier->waiting list
> 
> It's now called notifier->waiting_head.
> 
> Please double-check comments and documentation to catch other
> occurrences.

Sure.

> 
> >   *
> >   * When this struct is used as a member in a driver specific struct,
> > @@ -77,9 +77,10 @@ struct v4l2_async_match {
> >   */
> >  struct v4l2_async_subdev {
> >  	struct v4l2_async_match match;
> > +
> >  	/* v4l2-async core private: not to be used by drivers */
> > -	struct list_head list;
> >  	struct list_head asd_list;
> > +	struct list_head waiting_list;
> >  };
> >  
> >  /**
> > @@ -108,20 +109,20 @@ struct v4l2_async_notifier_operations {
> >   * @v4l2_dev:	v4l2_device of the root notifier, NULL otherwise
> >   * @sd:		sub-device that registered the notifier, NULL otherwise
> >   * @parent:	parent notifier
> > - * @asd_list:	master list of struct v4l2_async_subdev
> > - * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
> > - * @done:	list of struct v4l2_subdev, already probed
> > - * @list:	member in a global list of notifiers
> > + * @asd_head:	master list of struct v4l2_async_subdev
> > + * @waiting_list: list of struct v4l2_async_subdev, waiting for their drivers
> > + * @done_head:	list of struct v4l2_subdev, already probed
> > + * @notifier_list: member in a global list of notifiers
> >   */
> >  struct v4l2_async_notifier {
> >  	const struct v4l2_async_notifier_operations *ops;
> >  	struct v4l2_device *v4l2_dev;
> >  	struct v4l2_subdev *sd;
> >  	struct v4l2_async_notifier *parent;
> > -	struct list_head asd_list;
> > -	struct list_head waiting;
> > -	struct list_head done;
> > -	struct list_head list;
> > +	struct list_head asd_head;
> > +	struct list_head waiting_head;
> > +	struct list_head done_head;
> > +	struct list_head notifier_list;
> 
> I find the _head suffix to still be confusing. How about the following ?
> 
> 	struct {
> 		struct list_head all;
> 		struct list_head waiting;
> 		struct list_head done;
> 	} asds;

There are many list heads and entries in v4l2-async related structs and
before this patch. _head is used for all list heads, _list for list
entries. I prefer having _head as this way it is trivial to look for all
instances of that list head, removing the _head part makes this much
harder.

How about using _entry for list entries instead?

There doesn't seem to be much consistency in the kernel but in the majority
of cases it is self-evident I guess.

-- 
Regards,

Sakari Ailus
