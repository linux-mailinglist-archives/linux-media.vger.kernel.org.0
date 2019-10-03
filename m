Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69E2CCA065
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 16:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbfJCOcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 10:32:50 -0400
Received: from mga12.intel.com ([192.55.52.136]:57319 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfJCOcu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 10:32:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 07:32:49 -0700
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; 
   d="scan'208";a="196362792"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 07:32:47 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A83F320F75; Thu,  3 Oct 2019 17:32:44 +0300 (EEST)
Date:   Thu, 3 Oct 2019 17:32:44 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191003143244.GC14917@paasikivi.fi.intel.com>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-2-bparrot@ti.com>
 <20191003071714.zyldxfoollm26o4u@uno.localdomain>
 <20191003072251.GA14917@paasikivi.fi.intel.com>
 <20191003120741.h2k5hcqjqxnu6ts6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003120741.h2k5hcqjqxnu6ts6@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Thu, Oct 03, 2019 at 07:07:41AM -0500, Benoit Parrot wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Thu [2019-Oct-03 10:22:51 +0300]:
> > Hi Jacopo, Benoit,
> > 
> > On Thu, Oct 03, 2019 at 09:17:14AM +0200, Jacopo Mondi wrote:
> > > Hi Benoit,
> > > 
> > > On Wed, Oct 02, 2019 at 08:51:32AM -0500, Benoit Parrot wrote:
> > > > Add v4l2 controls to report the pixel rates of each mode. This is
> > > > needed by some CSI2 receiver in order to perform proper DPHY
> > > > configuration.
> > > >
> > > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > > ---
> > > >  drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > > index 500d9bbff10b..5198dc887400 100644
> > > > --- a/drivers/media/i2c/ov5640.c
> > > > +++ b/drivers/media/i2c/ov5640.c
> > > > @@ -193,6 +193,9 @@ struct ov5640_mode_info {
> > > >
> > > >  struct ov5640_ctrls {
> > > >  	struct v4l2_ctrl_handler handler;
> > > > +	struct {
> > > > +		struct v4l2_ctrl *pixel_rate;
> > > > +	};
> > > 
> > > Do you need to wrap this v4l2_ctrl in it's own unnamed struct? Other
> > > controls here declared in this way are clustered and, if I'm not
> > > mistaken, using unnamed struct to wrap them is just a typographically
> > > nice way to convey that. I think your new control could be declared
> > > without a wrapping struct { }.
> > > 
> > > >  	struct {
> > > >  		struct v4l2_ctrl *auto_exp;
> > > >  		struct v4l2_ctrl *exposure;
> > > > @@ -2194,6 +2197,16 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> > > >  	return 0;
> > > >  }
> > > >
> > > > +static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
> > > > +{
> > > > +	u64 rate;
> > > > +
> > > > +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > > > +	rate *= ov5640_framerates[sensor->current_fr];
> > > > +
> > > > +	return rate;
> > > > +}
> > > > +
> > > 
> > > Just to point out this is the -theoretical- pixel rate, and might be
> > > quite different from the one calculated by the clock tree tuning
> > > procedure (which should be updated to match Hugues' latest findings).
> > 
> > Hmm. Considering the xclk rate may be pretty much anything, I'd suppose
> > the value above would only be correct for a given xclk rate.
> 
> I am not sure about that, different xclk rate might yield slightly
> different byte clock, but all in all the resolution and framerate pretty
> much dictate the end result, no?

Interestingly, the driver determines the PLL configuration based on the
pixels per line and lines per frame (including blanking) and the frames per
seconds. I guess it's always been like that in this driver.

So I agree the target frame rate can be used for this.

You could change ov5640_set_mode() to use this function as well to avoid
doing the same calculation twice in different places in the driver. Up to
you.

> 
> > 
> > Could this be simply calculated from the clock tree configuration, to get
> > the right value in all cases?
> 
> It probably could, and as I said earlier I gave it a try and failed, since
> the theoretical value worked for me that's what I went with. Those are the
> same values that Maxime's patch referred to. (dfbfb7aa832cdb media: ov5640:
> Compute the clock rate at runtime).
> 
> Here I am just "publishing it".
> 
> Benoit
> 
> > 
> > > 
> > > >  static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > > >  			  struct v4l2_subdev_pad_config *cfg,
> > > >  			  struct v4l2_subdev_format *format)
> > > > @@ -2233,6 +2246,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > > >  	if (mbus_fmt->code != sensor->fmt.code)
> > > >  		sensor->pending_fmt_change = true;
> > > >
> > > > +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > > > +				 ov5640_calc_pixel_rate(sensor));
> > > >  out:
> > > >  	mutex_unlock(&sensor->lock);
> > > >  	return ret;
> > > > @@ -2657,6 +2672,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > > >  	/* we can use our own mutex for the ctrl lock */
> > > >  	hdl->lock = &sensor->lock;
> > > >
> > > > +	/* Clock related controls */
> > > > +	ctrls->pixel_rate =
> > > > +		v4l2_ctrl_new_std(hdl, ops,
> > > 
> > > If you like it better, this could fit in 1 line
> > > 
> > > 	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > > 					      0, INT_MAX, 1,
> > > 					      ov5640_calc_pixel_rate(sensor)
> > > 
> > > Thanks
> > >    j
> > > 
> > > > +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> > > > +				  ov5640_calc_pixel_rate(sensor));
> > > 
> > > 
> > > > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > 
> > Note that ctrls->pixel_rate is NULL if e.g. memory allocation fails when
> > creating the control.
> > 
> > > > +
> > > >  	/* Auto/manual white balance */
> > > >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> > > >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> > > > @@ -2816,6 +2838,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> > > >  		sensor->frame_interval = fi->interval;
> > > >  		sensor->current_mode = mode;
> > > >  		sensor->pending_mode_change = true;
> > > > +
> > > > +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > > > +					 ov5640_calc_pixel_rate(sensor));
> > > >  	}
> > > >  out:
> > > >  	mutex_unlock(&sensor->lock);
> > 
> > -- 
> > Regards,
> > 
> > Sakari Ailus
> > sakari.ailus@linux.intel.com

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
