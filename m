Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106147D4BD4
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 11:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbjJXJUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 05:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233980AbjJXJUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 05:20:36 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50313139
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698139234; x=1729675234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oGhrNdbq5od5Gvtu3OXSgeliYC78h9Arn2cqzhKFoD4=;
  b=OwAPBYqz1TJRmfobcwqYpAp/W4+dKd4rVQ0vkqRk1QVqSlGreG55ff8S
   en+cFdcTh3J4iGtip7QW+Hljg47p4VhaUHtS8P8BwIUONHQCN5j84vGSQ
   6F7R40KoIEkrWz25jFgx+d0loj8uCIkKOzRoNQfrNkf9S5gfWlfcZAJN7
   /rtQgEFEZSb9uDl+uHPCvQiU1M9s1F4l5I+sQVlSiB8t+cuUURp8Of65g
   4KTuY2X7EgZ6D5kOOxTjBkERNIENm60tpWKsWlkeVqNnWzIkDjnksndLC
   ZyK/uLBP0kEGDJjXaZ5w353eavRiw7RmtyL3fXWFb7fUU1XqflEDF9B2+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385913186"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="385913186"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 02:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1005605772"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="1005605772"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 02:20:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B012111F89D;
        Tue, 24 Oct 2023 12:20:28 +0300 (EEST)
Date:   Tue, 24 Oct 2023 09:20:28 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 6/8] media: v4l: subdev: Switch to stream-aware state
 functions
Message-ID: <ZTeMXLGJNBsm3hG1@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-7-sakari.ailus@linux.intel.com>
 <20231023221339.GE18687@pendragon.ideasonboard.com>
 <ZTdcHwhwNwCm3Q_r@kekkonen.localdomain>
 <20231024072102.GB31956@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024072102.GB31956@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 24, 2023 at 10:21:02AM +0300, Laurent Pinchart wrote:
> On Tue, Oct 24, 2023 at 05:54:39AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> 	> 
> > On Tue, Oct 24, 2023 at 01:13:39AM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Mon, Oct 23, 2023 at 08:44:06PM +0300, Sakari Ailus wrote:
> > > > diff --git b/drivers/media/i2c/s5k5baf.c a/drivers/media/i2c/s5k5baf.c
> > > > index a36b310b32e1..3f3005cca9d0 100644
> > > > --- b/drivers/media/i2c/s5k5baf.c
> > > > +++ a/drivers/media/i2c/s5k5baf.c
> > > > @@ -1473,12 +1473,10 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
> > > >  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
> > > >  		rects = (struct v4l2_rect * []) {
> > > >  				&s5k5baf_cis_rect,
> > > > -				v4l2_subdev_get_try_crop(sd, sd_state,
> > > > -							 PAD_CIS),
> > > > -				v4l2_subdev_get_try_compose(sd, sd_state,
> > > > -							    PAD_CIS),
> > > > -				v4l2_subdev_get_try_crop(sd, sd_state,
> > > > -							 PAD_OUT)
> > > > +				v4l2_subdev_state_get_crop(sd_state, PAD_CIS),
> > > > +				v4l2_subdev_state_get_compose(sd_state,
> > > > +							      PAD_CIS),
> > > 
> > > A single line would be more readable I think.
> > 
> > But over 80.
> 
> By one character. Given the relaxed limit, this is one of the cases
> where going to 81 columns inmproves readability.

I fixed the alignment of all entries of the array, now it's less than 80
and all entries fit on a single line. :-)

-- 
Regards,

Sakari Ailus
