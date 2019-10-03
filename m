Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF253C9E02
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbfJCMFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:05:36 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34102 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJCMFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:05:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93C5UPb070793;
        Thu, 3 Oct 2019 07:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570104330;
        bh=LTBLkBs6YmveXwgb7cot7MD0XzjmIqla/DdKl6HKIyA=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=pTTWq6e5qvmoAz5m4yH+5rYB9YFKeWYLlq+DB4F9e4B9uhsSmFaN0REepWsruPObW
         wJ1AL2XL1cdU+nfBVRFHcWwblwO+KefeDwbIimj6hQVW1NdMDtsVIQ6p4nuS/6LUoE
         NlbFAXKfhd31hzqakTGIsXNJs/Ys+cVbYaa2d0MU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x93C5UGG128532
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 3 Oct 2019 07:05:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 07:05:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 07:05:29 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x93C5T2C059812;
        Thu, 3 Oct 2019 07:05:29 -0500
Date:   Thu, 3 Oct 2019 07:07:41 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v2 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191003120741.h2k5hcqjqxnu6ts6@ti.com>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-2-bparrot@ti.com>
 <20191003071714.zyldxfoollm26o4u@uno.localdomain>
 <20191003072251.GA14917@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191003072251.GA14917@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Thu [2019-Oct-03 10:22:51 +0300]:
> Hi Jacopo, Benoit,
> 
> On Thu, Oct 03, 2019 at 09:17:14AM +0200, Jacopo Mondi wrote:
> > Hi Benoit,
> > 
> > On Wed, Oct 02, 2019 at 08:51:32AM -0500, Benoit Parrot wrote:
> > > Add v4l2 controls to report the pixel rates of each mode. This is
> > > needed by some CSI2 receiver in order to perform proper DPHY
> > > configuration.
> > >
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 500d9bbff10b..5198dc887400 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -193,6 +193,9 @@ struct ov5640_mode_info {
> > >
> > >  struct ov5640_ctrls {
> > >  	struct v4l2_ctrl_handler handler;
> > > +	struct {
> > > +		struct v4l2_ctrl *pixel_rate;
> > > +	};
> > 
> > Do you need to wrap this v4l2_ctrl in it's own unnamed struct? Other
> > controls here declared in this way are clustered and, if I'm not
> > mistaken, using unnamed struct to wrap them is just a typographically
> > nice way to convey that. I think your new control could be declared
> > without a wrapping struct { }.
> > 
> > >  	struct {
> > >  		struct v4l2_ctrl *auto_exp;
> > >  		struct v4l2_ctrl *exposure;
> > > @@ -2194,6 +2197,16 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> > >  	return 0;
> > >  }
> > >
> > > +static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
> > > +{
> > > +	u64 rate;
> > > +
> > > +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > > +	rate *= ov5640_framerates[sensor->current_fr];
> > > +
> > > +	return rate;
> > > +}
> > > +
> > 
> > Just to point out this is the -theoretical- pixel rate, and might be
> > quite different from the one calculated by the clock tree tuning
> > procedure (which should be updated to match Hugues' latest findings).
> 
> Hmm. Considering the xclk rate may be pretty much anything, I'd suppose
> the value above would only be correct for a given xclk rate.

I am not sure about that, different xclk rate might yield slightly
different byte clock, but all in all the resolution and framerate pretty
much dictate the end result, no?

> 
> Could this be simply calculated from the clock tree configuration, to get
> the right value in all cases?

It probably could, and as I said earlier I gave it a try and failed, since
the theoretical value worked for me that's what I went with. Those are the
same values that Maxime's patch referred to. (dfbfb7aa832cdb media: ov5640:
Compute the clock rate at runtime).

Here I am just "publishing it".

Benoit

> 
> > 
> > >  static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > >  			  struct v4l2_subdev_pad_config *cfg,
> > >  			  struct v4l2_subdev_format *format)
> > > @@ -2233,6 +2246,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > >  	if (mbus_fmt->code != sensor->fmt.code)
> > >  		sensor->pending_fmt_change = true;
> > >
> > > +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > > +				 ov5640_calc_pixel_rate(sensor));
> > >  out:
> > >  	mutex_unlock(&sensor->lock);
> > >  	return ret;
> > > @@ -2657,6 +2672,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >  	/* we can use our own mutex for the ctrl lock */
> > >  	hdl->lock = &sensor->lock;
> > >
> > > +	/* Clock related controls */
> > > +	ctrls->pixel_rate =
> > > +		v4l2_ctrl_new_std(hdl, ops,
> > 
> > If you like it better, this could fit in 1 line
> > 
> > 	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > 					      0, INT_MAX, 1,
> > 					      ov5640_calc_pixel_rate(sensor)
> > 
> > Thanks
> >    j
> > 
> > > +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> > > +				  ov5640_calc_pixel_rate(sensor));
> > 
> > 
> > > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> Note that ctrls->pixel_rate is NULL if e.g. memory allocation fails when
> creating the control.
> 
> > > +
> > >  	/* Auto/manual white balance */
> > >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> > >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> > > @@ -2816,6 +2838,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> > >  		sensor->frame_interval = fi->interval;
> > >  		sensor->current_mode = mode;
> > >  		sensor->pending_mode_change = true;
> > > +
> > > +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > > +					 ov5640_calc_pixel_rate(sensor));
> > >  	}
> > >  out:
> > >  	mutex_unlock(&sensor->lock);
> 
> -- 
> Regards,
> 
> Sakari Ailus
> sakari.ailus@linux.intel.com
