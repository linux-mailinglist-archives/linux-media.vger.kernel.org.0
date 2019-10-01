Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E9CC3A5F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 18:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389942AbfJAQVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 12:21:33 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60148 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389941AbfJAQVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 12:21:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91GLU9D030216;
        Tue, 1 Oct 2019 11:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569946890;
        bh=ghA2jDGV0YzDn9mMprH6TaxzoC8WBOvM6BZjdlbrvSQ=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=URRUtENBwgKcTk1PIBuoFDm+FY/YOtVn2cd3XBUXBbYK4oXT4EfYs7rPZc7Bn6k9D
         I2pgU/U9L2PLLLnEpDaGCFhgZ93aRQ04vlOWbPLlGWx2NwG5ijjKfpR9ZPW7cRenhi
         XLzE7vG2IfqCBUeP6GfjGZxwS/uObhPSOTBNbeNA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91GLUHe041996;
        Tue, 1 Oct 2019 11:21:30 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 1 Oct
 2019 11:21:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 1 Oct 2019 11:21:19 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x91GLUra053045;
        Tue, 1 Oct 2019 11:21:30 -0500
Date:   Tue, 1 Oct 2019 11:23:41 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191001162341.f2o7ruar2nifl5ws@ti.com>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191001075704.GA5449@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for the review.

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Tue [2019-Oct-01 10:57:04 +0300]:
> Hi Benoit,
> 
> On Wed, Sep 25, 2019 at 10:22:59AM -0500, Benoit Parrot wrote:
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
> > index 500d9bbff10b..c2a44f30d56e 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -193,6 +193,9 @@ struct ov5640_mode_info {
> >  
> >  struct ov5640_ctrls {
> >  	struct v4l2_ctrl_handler handler;
> > +	struct {
> > +		struct v4l2_ctrl *pixel_rate;
> > +	};
> >  	struct {
> >  		struct v4l2_ctrl *auto_exp;
> >  		struct v4l2_ctrl *exposure;
> > @@ -241,6 +244,7 @@ struct ov5640_dev {
> >  	const struct ov5640_mode_info *last_mode;
> >  	enum ov5640_frame_rate current_fr;
> >  	struct v4l2_fract frame_interval;
> > +	u64 pixel_rate;
> >  
> >  	struct ov5640_ctrls ctrls;
> >  
> > @@ -2202,6 +2206,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >  	const struct ov5640_mode_info *new_mode;
> >  	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
> >  	struct v4l2_mbus_framefmt *fmt;
> > +	u64 rate;
> >  	int ret;
> >  
> >  	if (format->pad != 0)
> > @@ -2233,6 +2238,12 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> >  	if (mbus_fmt->code != sensor->fmt.code)
> >  		sensor->pending_fmt_change = true;
> >  
> > +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > +	rate *= ov5640_framerates[sensor->current_fr];
> > +	sensor->pixel_rate = rate;
> > +
> > +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > +				 sensor->pixel_rate);
> >  out:
> >  	mutex_unlock(&sensor->lock);
> >  	return ret;
> > @@ -2657,6 +2668,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	/* we can use our own mutex for the ctrl lock */
> >  	hdl->lock = &sensor->lock;
> >  
> > +	/* Clock related controls */
> > +	ctrls->pixel_rate =
> > +		v4l2_ctrl_new_std(hdl, ops,
> > +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> > +				  55969920);
> 
> Could you calculate this value instead of using a seemingly random number?

Yes I guess I could, especially if I make a helper function for it :).

> 
> > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > +
> >  	/* Auto/manual white balance */
> >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> > @@ -2782,6 +2800,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> >  	const struct ov5640_mode_info *mode;
> >  	int frame_rate, ret = 0;
> > +	u64 rate;
> >  
> >  	if (fi->pad != 0)
> >  		return -EINVAL;
> > @@ -2816,6 +2835,12 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> >  		sensor->frame_interval = fi->interval;
> >  		sensor->current_mode = mode;
> >  		sensor->pending_mode_change = true;
> > +
> > +		rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > +		rate *= ov5640_framerates[sensor->current_fr];
> > +		sensor->pixel_rate = rate;
> 
> I think it'd be better to have a function to calculate the value instead of
> duplicating the code here.

Yes I'll create a helper function.

Benoit

> 
> > +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > +					 sensor->pixel_rate);
> >  	}
> >  out:
> >  	mutex_unlock(&sensor->lock);
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
> sakari.ailus@linux.intel.com
