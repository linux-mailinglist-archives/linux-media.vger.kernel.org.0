Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183866F16C9
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 13:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240436AbjD1La4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 07:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345867AbjD1Lax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 07:30:53 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20FF5BB1
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 04:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682681451; x=1714217451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i48e5lKqzvm1KfqROexg09W7Q3/UlGJ9U/fNe1fFxko=;
  b=fuCt1Pw7Pg6JvSgDizGWss6yA8orS81dZza85XkemcECdrfGI8ogzrby
   LgM8LKJQrGDetXZOlEHe9WFQU58pWG/2KJBuFXxq1E2y0LLQRT6KKNC8v
   0kjw4rNBpGlcCJfXLwyb3PP5klGsU3StIhr8cLw3l3VqMn2WLspp/cRPo
   3UopqFtVDUuGGYR0fWBdxwzE3oEcLE+bSO7+UYozJX/B045K9petojclA
   9bISza9pA4bmtDPmMKNEHB8insyj1CkDH1WcVn8qRXTdrgxKeqfnKYzHP
   idOQnft4DwpqPESUhoRguDWsoFEnfulMVURRQKKOM1MMublKpO1qOSJRr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="413108748"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="413108748"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="941066337"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="941066337"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 04:30:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2872711FCA0;
        Fri, 28 Apr 2023 14:30:46 +0300 (EEST)
Date:   Fri, 28 Apr 2023 14:30:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 19/18] media: v4l: Drop
 v4l2_async_nf_parse_fwnode_endpoints()
Message-ID: <ZEuuZvlCubaCUuXu@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230414091437.83449-1-jacopo.mondi@ideasonboard.com>
 <20230425010654.GG4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425010654.GG4921@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 25, 2023 at 04:06:54AM +0300, Laurent Pinchart wrote:
> > -/**
> > - * __v4l2_async_nf_add_connection() - Add an async subdev to the notifier's
> > - *				      master asc list.
> > - *
> > - * @notifier: pointer to &struct v4l2_async_notifier
> > - * @asc: pointer to &struct v4l2_async_connection
> > - *
> > - * \warning: Drivers should avoid using this function and instead use one of:
> > - * v4l2_async_nf_add_fwnode(),
> > - * v4l2_async_nf_add_fwnode_remote() or
> > - * v4l2_async_nf_add_i2c().
> > - *
> > - * Call this function before registering a notifier to link the provided @asc to
> > - * the notifiers master @asc_list. The @asc must be allocated with k*alloc() as
> > - * it will be freed by the framework when the notifier is destroyed.
> > - */
> 
> You could move this documentation to the .c file (dropping the warning).
> There's little documentation of internal function for v4l2-async, which
> makes the code hard to understand. Let's not make it worse by dropping
> existing documentation :-)

As this is no longer usable by drivers, I'm not sure how relevant keeping
this around for just v4l2-async internal use is.

For instance, did I read any of these comments when writing this patchset?
I can say I did not read a single one of them. They are not specific enough
for understanding the implementation anyway, this is written for driver
authors in mind. Instead what can and probably should be added are object
relations and why certain non-obvious things are done the way they are.
I'll add this for the patches when the code as such seems fine.

I'll address the rest of the comments in v2.

-- 
Regards,

Sakari Ailus
