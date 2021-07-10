Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F9B3C3729
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 00:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhGJWqS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jul 2021 18:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhGJWqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jul 2021 18:46:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3030C0613DD;
        Sat, 10 Jul 2021 15:43:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B14C4255;
        Sun, 11 Jul 2021 00:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625957010;
        bh=Rv1bX3T7hsw9kcMhjL3G4sz+4wp/ROBxyj3X4cEoOtw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CSEFeDYcL+4aEwuzw0/71OSQCzR1QqZiV7nQLmCwt0JAPsF1iY/hK2ljAKY0Phy+J
         mymjGdEf4LuNkj8n/rdseucA05dtsjzU0HhgEhj+qnVT23HzUQe4pNUEpwdIPyQqEN
         WtwbDptwVl7XDAQmyJ0Aa2W2Apse0VqVVhT82M4g=
Date:   Sun, 11 Jul 2021 01:42:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Dennis Rachui <drachui@de.adit-jv.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: do not update format while streaming
Message-ID: <YOoiZM+oicZBD4o1@pendragon.ideasonboard.com>
References: <1625750578-108454-1-git-send-email-drachui@de.adit-jv.com>
 <YOhbOHnCn9eFgKWG@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOhbOHnCn9eFgKWG@oden.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Jul 09, 2021 at 04:20:40PM +0200, Niklas Söderlund wrote:
> On 2021-07-08 15:22:58 +0200, Dennis Rachui wrote:
> > Verify that streaming is not active before setting the pad format.
> > 
> > According to the VIDIOC documentation [1] changes to the active
> > format of a media pad via the VIDIOC_SUBDEV_S_FMT ioctl are
> > applied to the underlying hardware.
> > In rcar-csi2 a format change only applies to hardware, when the
> > pipeline is started. While the device is not in use, it is therefore
> > okay to update the format.
> > 
> > However, when the pipeline is active, this leads to a format
> > mismatch between driver and device.
> > Other applications can query the format with
> > VIDIOC_SUBDEV_G_FMT at any time and would be reported
> > a format that does not fit the current stream.
> > 
> > This commit prevents format update while streaming is active
> > and returns -EBUSY to user space, as suggested by [1].
> > 
> > [1] Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
> 
> I like that this is addressed, but I wonder is this not something that 
> should be fixed in the V4L2 core and not in drivers?

Some drivers may support format changes during streaming (that's allowed
by the V4L2 API, I'm not sure if it's used anywhere though). While I'd
favour not duplicating the same logic in different (and differently
buggy) ways in drivers, I'm not sure how this could be implemented in a
sane way in the V4L2 core in its current state.

> > Note: after creation of this commit, it was noticed that Steve
> > Longerbeam has a very similar solution in his fork.
> > 
> > Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> > Cc: Steve Longerbeam <slongerbeam@gmail.com>
> > Signed-off-by: Dennis Rachui <drachui@de.adit-jv.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index e28eff0..98152e1 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -724,18 +724,37 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> >  {
> >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> >  	struct v4l2_mbus_framefmt *framefmt;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&priv->lock);
> >  
> >  	if (!rcsi2_code_to_fmt(format->format.code))
> >  		format->format.code = rcar_csi2_formats[0].code;
> >  
> >  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +
> > +		/*
> > +		 * Do not apply changes to active format while streaming.
> > +		 *
> > +		 * Since video streams could be forwarded from sink pad to any
> > +		 * source pad (depending on CSI-2 channel routing), all
> > +		 * media pads are effected by this rule.
> > +		 */
> > +		if (priv->stream_count > 0) {
> > +			ret = -EBUSY;
> > +			goto out;
> > +		}
> > +
> >  		priv->mf = format->format;
> >  	} else {
> >  		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> >  		*framefmt = format->format;
> >  	}
> >  
> > -	return 0;
> > +out:
> > +	mutex_unlock(&priv->lock);
> > +
> > +	return ret;
> >  }
> >  
> >  static int rcsi2_get_pad_format(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
