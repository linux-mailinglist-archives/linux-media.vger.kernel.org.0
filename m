Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85621C9DE3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730229AbfJCL5v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:57:51 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53646 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJCL5u (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 07:57:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93BviRF009994;
        Thu, 3 Oct 2019 06:57:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570103864;
        bh=frGIJpIlzjIigeJImvZp4ZAbaDGCi3lcoK+18Z8zEnk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=iMuJquSUKMXpDEn8ieTDCj4cEVxzfm4VKN2kONUOYqHBbemL+jkekPHgIE9JBNaQU
         nXy8wspZTzMJ7/O+1tlKhloTMw+XVAiPC2TckSt9PL56Gye+gZBYkycXURdeorYJOZ
         QGJ+W472p5DWZos8P9C+/a2s98Atmx0GpnakezA0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x93Bviev117912
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Oct 2019 06:57:44 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 06:57:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 06:57:33 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x93BvhRf071871;
        Thu, 3 Oct 2019 06:57:43 -0500
Date:   Thu, 3 Oct 2019 06:59:55 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191003115955.mnkd3w666miyzuoo@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-2-bparrot@ti.com>
 <20191003071714.zyldxfoollm26o4u@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191003071714.zyldxfoollm26o4u@uno.localdomain>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> wrote on Thu [2019-Oct-03 09:17:14 +0200]:
> Hi Benoit,
> 
> On Wed, Oct 02, 2019 at 08:51:32AM -0500, Benoit Parrot wrote:
> > Add v4l2 controls to report the pixel rates of each mode. This is
> > needed by some CSI2 receiver in order to perform proper DPHY
> > configuration.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 500d9bbff10b..5198dc887400 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -193,6 +193,9 @@ struct ov5640_mode_info {
> >
> >  struct ov5640_ctrls {
> >  	struct v4l2_ctrl_handler handler;
> > +	struct {
> > +		struct v4l2_ctrl *pixel_rate;
> > +	};
> 
> Do you need to wrap this v4l2_ctrl in it's own unnamed struct? Other
> controls here declared in this way are clustered and, if I'm not
> mistaken, using unnamed struct to wrap them is just a typographically
> nice way to convey that. I think your new control could be declared
> without a wrapping struct { }.

Probably not, just tried to be consistent with the rest of code here.

> 
> >  	struct {
> >  		struct v4l2_ctrl *auto_exp;
> >  		struct v4l2_ctrl *exposure;
> > @@ -2194,6 +2197,16 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> >  	return 0;
> >  }
> >
> > +static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
> > +{
> > +	u64 rate;
> > +
> > +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > +	rate *= ov5640_framerates[sensor->current_fr];
> > +
> > +	return rate;
> > +}
> > +
> 
> Just to point out this is the -theoretical- pixel rate, and might be
> quite different from the one calculated by the clock tree tuning
> procedure (which should be updated to match Hugues' latest findings).

True, and to my surprise my receiver worked with all of those value even if
some actual value maybe off, I guess in my case they were close enough.

> 
> >  static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >  			  struct v4l2_subdev_pad_config *cfg,
> >  			  struct v4l2_subdev_format *format)
> > @@ -2233,6 +2246,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >  	if (mbus_fmt->code != sensor->fmt.code)
> >  		sensor->pending_fmt_change = true;
> >
> > +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > +				 ov5640_calc_pixel_rate(sensor));
> >  out:
> >  	mutex_unlock(&sensor->lock);
> >  	return ret;
> > @@ -2657,6 +2672,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	/* we can use our own mutex for the ctrl lock */
> >  	hdl->lock = &sensor->lock;
> >
> > +	/* Clock related controls */
> > +	ctrls->pixel_rate =
> > +		v4l2_ctrl_new_std(hdl, ops,
> 
> If you like it better, this could fit in 1 line
> 
> 	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> 					      0, INT_MAX, 1,
> 					      ov5640_calc_pixel_rate(sensor)
>

Either way works for me.

Benoit
 
> Thanks
>    j
> 
> > +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> > +				  ov5640_calc_pixel_rate(sensor));
> 
> 
> > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >  	/* Auto/manual white balance */
> >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> > @@ -2816,6 +2838,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> >  		sensor->frame_interval = fi->interval;
> >  		sensor->current_mode = mode;
> >  		sensor->pending_mode_change = true;
> > +
> > +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > +					 ov5640_calc_pixel_rate(sensor));
> >  	}
> >  out:
> >  	mutex_unlock(&sensor->lock);
> > --
> > 2.17.1
> >


