Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FB27280FA
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 15:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbjFHNQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 09:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236250AbjFHNQl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 09:16:41 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C6026B3
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 06:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686230200; x=1717766200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5eVQiCZkD9AKXxkvflelHJsXipZaLoWCjus5ftqlK58=;
  b=CF3pBBe6609cRW/9HN0DzddSU+VqpjJ5kXm1673eAgkIOH3WQftxzP68
   pPSP/qIS2dzCb4O7tK9Iu85y95ctYBY1h1GpJHhE/gbeHBnZFFCeTVNRE
   sj0HklVc6ISXGZS0XBb2J0MS1kGQ9xKbN5Z0Zb8Obb9bVhQlO+1SuqUfE
   /q18UEIlCoJb64mBiiWAnlfAJPRYRDsRY1CLC87RlZ7CfCahS5Fs/XFKZ
   w39QS/Eg8vLIpmues6P/rJmxqrQVqKoxZMOYWI0qbPz5N9eDoEh+8scQA
   smgj/a223Ur2v9uERmqWlXGdIN6bwTlxHx2zzcH/5/bZjm0ZHBQs2TxbW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337661333"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="337661333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 06:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="775045033"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="775045033"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 06:15:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 27ACF120BF8;
        Thu,  8 Jun 2023 16:15:05 +0300 (EEST)
Date:   Thu, 8 Jun 2023 13:15:05 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/28] media: ov2680: Don't take the lock for try_fmt
 calls
Message-ID: <ZIHUWZr7ndQRYcG/@kekkonen.localdomain>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-6-hdegoede@redhat.com>
 <ZIHNQ4JngKVJKMYu@kekkonen.localdomain>
 <20230608124830.GR5058@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608124830.GR5058@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jun 08, 2023 at 03:48:30PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Jun 08, 2023 at 12:44:51PM +0000, Sakari Ailus wrote:
> > On Wed, Jun 07, 2023 at 06:46:49PM +0200, Hans de Goede wrote:
> > > On ov2680_set_fmt() calls with format->which == V4L2_SUBDEV_FORMAT_TRY,
> > > ov2680_set_fmt() does not talk to the sensor.
> > > 
> > > So in this case there is no need to lock the sensor->lock mutex or
> > > to check that the sensor is streaming.
> > > 
> > > Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  drivers/media/i2c/ov2680.c | 20 +++++++++-----------
> > >  1 file changed, 9 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> > > index d90bbca6e913..a26a6f18f4f1 100644
> > > --- a/drivers/media/i2c/ov2680.c
> > > +++ b/drivers/media/i2c/ov2680.c
> > > @@ -592,24 +592,22 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
> > >  	if (format->pad != 0)
> > >  		return -EINVAL;
> > >  
> > > -	mutex_lock(&sensor->lock);
> > > -
> > > -	if (sensor->is_streaming) {
> > > -		ret = -EBUSY;
> > > -		goto unlock;
> > > -	}
> > > -
> > >  	mode = v4l2_find_nearest_size(ov2680_mode_data,
> > >  				      ARRAY_SIZE(ov2680_mode_data), width,
> > >  				      height, fmt->width, fmt->height);
> > > -	if (!mode) {
> > > -		ret = -EINVAL;
> > > -		goto unlock;
> > > -	}
> > > +	if (!mode)
> > > +		return -EINVAL;
> > >  
> > >  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> > >  		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> > >  		format->format = *try_fmt;
> > 
> > Access to sd_state needs to be serialised, so mutex should be held here.
> 
> This operation should be called with the state lock held already, so I
> don't think any extra locking is needed.

Ah, you're right indeed. I suppose lock here is redundant but controls need
some care.

-- 
Regards,

Sakari Ailus
