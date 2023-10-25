Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247137D6832
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 12:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbjJYKUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 06:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjJYKUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 06:20:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF9010A
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 03:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698229229; x=1729765229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=obJH+CBd9haq8aZ2o4JxG0UAZTbUE5N0vx3MkmtZD7c=;
  b=Gt2i5blrNuy0ehGRIcfYNlEqX4ZQiUzmbFaeXDw3TOcVkJycBdLqNIG0
   rCTERlZ2a303pT9RIwKaDIzelVIu4lLXFtfwMrlKR6+VR1OaN13cjsXxU
   sFpTJXXd/CdEJ0b8QZ81QMe92hhGM9gnkhG4rXIzbWhZ4u06YFvMc2yni
   nTAB97+HPZPX8E0Cw47CqiFIJHM3lrVlQ3HyboPr9FsJwL31bMRGbnnvm
   UMrln+5EOZ+lVTf1NK4mmcXkAfMdDY8YLEbcbcfg+aQtJlFrG3TCTyxyE
   6rPzsuBN7P4yZ2YHAuhkTtMBqOTqsrharQm4b8BQF0IqtQP3yCU8CDBsj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="34075"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="34075"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 03:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="762406631"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="762406631"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 03:20:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2924011F82E;
        Wed, 25 Oct 2023 13:20:24 +0300 (EEST)
Date:   Wed, 25 Oct 2023 10:20:24 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 2/8] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZTjr6M_vlw1XgcwN@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-3-sakari.ailus@linux.intel.com>
 <3499574b-fe65-46b1-b69c-c966effafde7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3499574b-fe65-46b1-b69c-c966effafde7@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Oct 25, 2023 at 11:32:11AM +0200, Hans Verkuil wrote:
> On 23/10/2023 19:44, Sakari Ailus wrote:
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
> >  drivers/media/v4l2-core/v4l2-subdev.c | 39 +++++++++++++++++++++++++++
> >  include/media/v4l2-subdev.h           |  9 ++++---
> >  2 files changed, 45 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index ee4fe8f33a41..955ee9a6c91f 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -1684,6 +1684,19 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
> >  	struct v4l2_subdev_stream_configs *stream_configs;
> >  	unsigned int i;
> >  
> > +	if (WARN_ON(!state))
> > +		return NULL;
> > +
> > +	if (state->pads) {
> > +		if (stream)
> > +			return NULL;
> > +
> > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > +			pad = 0;
> 
> I saw Laurent's comment on why we don't return NULL here, and I think
> based on your reply to that this will need a comment why we don't
> return NULL (yet). It's weird code, and it needs an explanation.

I can add a comment, sure. I'll also add a patch to just return NULL here
in the set.

-- 
Regards,

Sakari Ailus
