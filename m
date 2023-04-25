Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2AE6EDE3E
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 10:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbjDYIgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 04:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbjDYIge (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 04:36:34 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA12B13F9E
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 01:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682411669; x=1713947669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BjtGkYhttHB/7HGopTei/Bi5epK6Fh8biNPgKR1xZl0=;
  b=j1AIsg/jO6JVzPfUdvKtkPgZUkDqCpIct1JadjdbY1BG2NtrCNSM462t
   AuPscVkkDUrVe4r6dZaMLDm6FiRqO6Mqdtgrvtgw1sOSIlTAaBx97+alL
   /IUKp6wb3cbuJ7ZJD/Zhb2cixqDx8r/AMZv2adoSaJfgzane30HbxdLE9
   chsNBVUERnfzbirlMKH+i1Y+Df80wb5zS9AcsXOXhQyU6FwiVlhdnt8nO
   pOOU3OiRl6Ef6ae6ujeQSnWEKrQeFhWNv7QEOZpnXjztFEG+vvEktfv9A
   p991G1iuM2TNKLZ+eU6t5hRdHionDiVn013rKEP/g2SL7UeXAr6F4YtWu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="327007978"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="327007978"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867812333"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="867812333"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:32:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 95B9411FCA2;
        Tue, 25 Apr 2023 11:32:45 +0300 (EEST)
Date:   Tue, 25 Apr 2023 11:32:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 01/18] media: v4l: async: Return async sub-devices to
 subnotifier list
Message-ID: <ZEeQLYuRSXCoDQ45@kekkonen.localdomain>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-2-sakari.ailus@linux.intel.com>
 <20230425012857.GK4921@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425012857.GK4921@pendragon.ideasonboard.com>
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

On Tue, Apr 25, 2023 at 04:28:57AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Mar 30, 2023 at 02:58:36PM +0300, Sakari Ailus wrote:
> > When an async notifier is unregistered, the async sub-devices in the
> > notifier's done list will disappear with the notifier. However this is
> > currently also done to the sub-notifiers that remain registered. Their
> > sub-devices only need to be unbound while the async sub-devices themselves
> > need to be returned to the sub-notifier's waiting list. Do this now.
> > 
> > Fixes: 2cab00bb076b ("media: v4l: async: Allow binding notifiers to sub-devices")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 2f1b718a9189..008a2a3e312e 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -414,7 +414,8 @@ static void v4l2_async_cleanup(struct v4l2_subdev *sd)
> >  
> >  /* Unbind all sub-devices in the notifier tree. */
> >  static void
> > -v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
> > +v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> > +				 bool readd)
> 
> I've read this as "read d" and was wondering what it meant. Maybe
> "re_add" would be a better variable name ?
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you.

The patch has been already merged and the argument will soon disappear with
the async rework patchset.

-- 
Regards,

Sakari Ailus
