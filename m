Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C57728062
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 14:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbjFHMsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 08:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbjFHMsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 08:48:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFA3198C
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 05:48:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126033089000.35.openmobile.ne.jp [126.33.89.0])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9ECBD01;
        Thu,  8 Jun 2023 14:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686228487;
        bh=2yG2t4n1XWifTbVrK2jkgayJxOvszDKrY6AoqWqSqm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FE9v/R5drnP4n2EHDOOcUBHVUE9U9USNERjvOigNHhw6pIMjklW1AvVxHDX4Qqqe7
         3YwLsAcmNMg/LuDz4/WzUyfyKjGJdOEfrhujnuXUVUOEgCqnxgp24phtjDgsLLzxTT
         30q4lwbKK5Au4feDasJM8isiiO8tNAjEd8W7eQCg=
Date:   Thu, 8 Jun 2023 15:48:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 05/28] media: ov2680: Don't take the lock for try_fmt
 calls
Message-ID: <20230608124830.GR5058@pendragon.ideasonboard.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-6-hdegoede@redhat.com>
 <ZIHNQ4JngKVJKMYu@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZIHNQ4JngKVJKMYu@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jun 08, 2023 at 12:44:51PM +0000, Sakari Ailus wrote:
> On Wed, Jun 07, 2023 at 06:46:49PM +0200, Hans de Goede wrote:
> > On ov2680_set_fmt() calls with format->which == V4L2_SUBDEV_FORMAT_TRY,
> > ov2680_set_fmt() does not talk to the sensor.
> > 
> > So in this case there is no need to lock the sensor->lock mutex or
> > to check that the sensor is streaming.
> > 
> > Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/media/i2c/ov2680.c | 20 +++++++++-----------
> >  1 file changed, 9 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> > index d90bbca6e913..a26a6f18f4f1 100644
> > --- a/drivers/media/i2c/ov2680.c
> > +++ b/drivers/media/i2c/ov2680.c
> > @@ -592,24 +592,22 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
> >  	if (format->pad != 0)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&sensor->lock);
> > -
> > -	if (sensor->is_streaming) {
> > -		ret = -EBUSY;
> > -		goto unlock;
> > -	}
> > -
> >  	mode = v4l2_find_nearest_size(ov2680_mode_data,
> >  				      ARRAY_SIZE(ov2680_mode_data), width,
> >  				      height, fmt->width, fmt->height);
> > -	if (!mode) {
> > -		ret = -EINVAL;
> > -		goto unlock;
> > -	}
> > +	if (!mode)
> > +		return -EINVAL;
> >  
> >  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> >  		format->format = *try_fmt;
> 
> Access to sd_state needs to be serialised, so mutex should be held here.

This operation should be called with the state lock held already, so I
don't think any extra locking is needed.

> > +		return 0;
> > +	}
> > +
> > +	mutex_lock(&sensor->lock);
> > +
> > +	if (sensor->is_streaming) {
> > +		ret = -EBUSY;
> >  		goto unlock;
> >  	}
> >  

-- 
Regards,

Laurent Pinchart
