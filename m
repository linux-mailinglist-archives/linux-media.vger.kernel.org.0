Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 302DFC2E75
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 09:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfJAH5J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 03:57:09 -0400
Received: from mga17.intel.com ([192.55.52.151]:10537 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfJAH5J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 03:57:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 00:57:08 -0700
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; 
   d="scan'208";a="185104735"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 00:57:06 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 62B0521ACC; Tue,  1 Oct 2019 10:57:04 +0300 (EEST)
Date:   Tue, 1 Oct 2019 10:57:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191001075704.GA5449@paasikivi.fi.intel.com>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925152301.21645-2-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On Wed, Sep 25, 2019 at 10:22:59AM -0500, Benoit Parrot wrote:
> Add v4l2 controls to report the pixel rates of each mode. This is
> needed by some CSI2 receiver in order to perform proper DPHY
> configuration.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 500d9bbff10b..c2a44f30d56e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -193,6 +193,9 @@ struct ov5640_mode_info {
>  
>  struct ov5640_ctrls {
>  	struct v4l2_ctrl_handler handler;
> +	struct {
> +		struct v4l2_ctrl *pixel_rate;
> +	};
>  	struct {
>  		struct v4l2_ctrl *auto_exp;
>  		struct v4l2_ctrl *exposure;
> @@ -241,6 +244,7 @@ struct ov5640_dev {
>  	const struct ov5640_mode_info *last_mode;
>  	enum ov5640_frame_rate current_fr;
>  	struct v4l2_fract frame_interval;
> +	u64 pixel_rate;
>  
>  	struct ov5640_ctrls ctrls;
>  
> @@ -2202,6 +2206,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  	const struct ov5640_mode_info *new_mode;
>  	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
>  	struct v4l2_mbus_framefmt *fmt;
> +	u64 rate;
>  	int ret;
>  
>  	if (format->pad != 0)
> @@ -2233,6 +2238,12 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  	if (mbus_fmt->code != sensor->fmt.code)
>  		sensor->pending_fmt_change = true;
>  
> +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> +	rate *= ov5640_framerates[sensor->current_fr];
> +	sensor->pixel_rate = rate;
> +
> +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> +				 sensor->pixel_rate);
>  out:
>  	mutex_unlock(&sensor->lock);
>  	return ret;
> @@ -2657,6 +2668,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	/* we can use our own mutex for the ctrl lock */
>  	hdl->lock = &sensor->lock;
>  
> +	/* Clock related controls */
> +	ctrls->pixel_rate =
> +		v4l2_ctrl_new_std(hdl, ops,
> +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> +				  55969920);

Could you calculate this value instead of using a seemingly random number?

> +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	/* Auto/manual white balance */
>  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>  					   V4L2_CID_AUTO_WHITE_BALANCE,
> @@ -2782,6 +2800,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  	const struct ov5640_mode_info *mode;
>  	int frame_rate, ret = 0;
> +	u64 rate;
>  
>  	if (fi->pad != 0)
>  		return -EINVAL;
> @@ -2816,6 +2835,12 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
>  		sensor->frame_interval = fi->interval;
>  		sensor->current_mode = mode;
>  		sensor->pending_mode_change = true;
> +
> +		rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> +		rate *= ov5640_framerates[sensor->current_fr];
> +		sensor->pixel_rate = rate;

I think it'd be better to have a function to calculate the value instead of
duplicating the code here.

> +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> +					 sensor->pixel_rate);
>  	}
>  out:
>  	mutex_unlock(&sensor->lock);

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
