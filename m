Return-Path: <linux-media+bounces-46142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2CC28DD9
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 12:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 375614E596D
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 11:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4CA23AE66;
	Sun,  2 Nov 2025 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OzeIOmE7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECAB34D394;
	Sun,  2 Nov 2025 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762081684; cv=none; b=ArX5utkltwwcbStAhyaZtuRzTbysDIeyut0LtrWqoxY7wvpfCf40U8hlpDuxQNj3kF15bQOiDMd1CJTv6wOEaOIgVHkH797O0hsnRipOu6L1muCfQcF1YEzdJFqcHVrppK5X3mWSetHoH/IUz2SBXuMTwKZj9xD+9xpohY82bKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762081684; c=relaxed/simple;
	bh=9VUY6I8wPRyjtjwVVyJqFPwSXTMWsq3QP3oQaIPQyy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KY+sHoFFH/WNnZQbb5adMmc/OT+NiWYdbE4RsxSdFnufjDHOsXnHLrHhQUjq4lytFsW8byWd1PtuA+qQSL/66RgFS88rOM7FIiXnI0mwR+2ehrHnvZO3soNlGu+rbWDHw3Yhu1HYMkO6t7QYrMmi4sfIzta5/RYeglaBN93PdT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OzeIOmE7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-50-232.net.vodafone.it [5.90.50.232])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 279E2A98;
	Sun,  2 Nov 2025 12:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762081568;
	bh=9VUY6I8wPRyjtjwVVyJqFPwSXTMWsq3QP3oQaIPQyy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OzeIOmE7HuZO+lIEEu1tOoEbEdvPydvNrt+YTFmrvLaXEvQ3XuXDdivpvQ9tWPLTI
	 DubqWW0VdGzKRQygWzb7wg3NV98hQ6e+dMeM6XQxzIUIt+Vizv8tRDNwz0zHjaYFI4
	 ktWE6tXKn0p9kzni0472RDR8YV8G4yno5O/tU56M=
Date: Sun, 2 Nov 2025 12:07:55 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH 09/13] media: i2c: ov5647: Add control of V4L2_CID_HBLANK
Message-ID: <maj7fvugwy25d4fny4km26yoed4o4zdggh3totbuatqu73qjs2@tllxhvjg7qey>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-9-098413454f5e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-b4-rpi-ov5647-v1-9-098413454f5e@ideasonboard.com>

Hi Jai

On Tue, Oct 28, 2025 at 12:57:20PM +0530, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The driver did expose V4L2_CID_HBLANK, but as a READ_ONLY control.
>
> The sensor only uses the HTS register to control the line length,
> so convert this control to read/write, with the appropriate ranges.
> Adopt the old fixed values as the minimum values permitted in each
> mode to avoid issues of it not streaming.
>
> This should allow exposure times up to ~3 seconds (up from ~1sec).
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3aad3dc9b5cd0c24c07a37e2567e3c61c52e4fc2..59c21b91d09d79f073a54871221f197a0bcf3aa2 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -53,6 +53,8 @@
>  #define OV5647_REG_AEC_AGC		0x3503
>  #define OV5647_REG_GAIN_HI		0x350a
>  #define OV5647_REG_GAIN_LO		0x350b
> +#define OV5647_REG_HTS_HI		0x380c
> +#define OV5647_REG_HTS_LO		0x380d
>  #define OV5647_REG_VTS_HI		0x380e
>  #define OV5647_REG_VTS_LO		0x380f
>  #define OV5647_REG_VFLIP		0x3820
> @@ -79,6 +81,8 @@
>  #define OV5647_VBLANK_MIN		24
>  #define OV5647_VTS_MAX			32767
>
> +#define OV5647_HTS_MAX			0x1fff
> +
>  #define OV5647_EXPOSURE_MIN		4
>  #define OV5647_EXPOSURE_STEP		1
>  #define OV5647_EXPOSURE_DEFAULT		1000
> @@ -187,8 +191,6 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
>  	{0x3a19, 0xf8},
>  	{0x3c01, 0x80},
>  	{0x3b07, 0x0c},
> -	{0x380c, 0x0b},
> -	{0x380d, 0x1c},
>  	{0x3814, 0x11},
>  	{0x3815, 0x11},
>  	{0x3708, 0x64},
> @@ -276,8 +278,6 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
>  	{0x3a19, 0xf8},
>  	{0x3c01, 0x80},
>  	{0x3b07, 0x0c},
> -	{0x380c, 0x09},
> -	{0x380d, 0x70},
>  	{0x3814, 0x11},
>  	{0x3815, 0x11},
>  	{0x3708, 0x64},
> @@ -375,8 +375,6 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
>  	{0x3809, 0x10},
>  	{0x380a, 0x03},
>  	{0x380b, 0xcc},
> -	{0x380c, 0x07},
> -	{0x380d, 0x68},
>  	{0x3811, 0x0c},
>  	{0x3813, 0x06},
>  	{0x3814, 0x31},
> @@ -450,8 +448,6 @@ static struct regval_list ov5647_640x480_10bpp[] = {
>  	{0x3a19, 0xf8},
>  	{0x3c01, 0x80},
>  	{0x3b07, 0x0c},
> -	{0x380c, 0x07},
> -	{0x380d, 0x3c},
>  	{0x3814, 0x35},
>  	{0x3815, 0x35},
>  	{0x3708, 0x64},
> @@ -1061,7 +1057,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  					 mode->pixel_rate, 1, mode->pixel_rate);
>
>  		hblank = mode->hts - mode->format.width;
> -		__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1,
> +		__v4l2_ctrl_modify_range(sensor->hblank, hblank,
> +					 OV5647_HTS_MAX - mode->format.width, 1,

Is '1' really the min ? Who knows the datasheet doesn't report that :(

>  					 hblank);
>
>  		vblank = mode->vts - mode->format.height;
> @@ -1325,6 +1322,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
>  				     sensor->mode->format.height + ctrl->val);
>  		break;
> +	case V4L2_CID_HBLANK:
> +		ret = ov5647_write16(sd, OV5647_REG_HTS_HI,
> +				     sensor->mode->format.width + ctrl->val);

Why are we writing HTS_HI only ? The max control value is set to
0x1fff, this spans two registers..

> +		break;
>  	case V4L2_CID_TEST_PATTERN:
>  		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
>  				   ov5647_test_pattern_val[ctrl->val]);
> @@ -1332,7 +1333,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>
>  	/* Read-only, but we adjust it based on mode. */
>  	case V4L2_CID_PIXEL_RATE:
> -	case V4L2_CID_HBLANK:
>  		/* Read-only, but we adjust it based on mode. */

We really like this comment, at the point of repeating it twice...

Speaking of which... if you set the ctrl_handler to NULL when
registering a ro control

	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, NULL,
					       V4L2_CID_PIXEL_RATE,
					       sensor->mode->pixel_rate,
					       sensor->mode->pixel_rate, 1,
					       sensor->mode->pixel_rate);

you can remove the above 4 lines.

(the background is that for RO controls the control_handler has to be
set to NULL, to avoid having to handle them in the s_ctrl handler)

Maybe add a patch to this series ?

>  		break;
>
> @@ -1409,10 +1409,11 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
>  					       sensor->mode->pixel_rate, 1,
>  					       sensor->mode->pixel_rate);
>
> -	/* By default, HBLANK is read only, but it does change per mode. */
>  	hblank = sensor->mode->hts - sensor->mode->format.width;
>  	sensor->hblank = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> -					   V4L2_CID_HBLANK, hblank, hblank, 1,
> +					   V4L2_CID_HBLANK, hblank,
> +					   OV5647_HTS_MAX -
> +					   sensor->mode->format.width, 1,
>  					   hblank);
>
>  	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> @@ -1446,7 +1447,6 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
>  		goto handler_free;
>
>  	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	sensor->sd.ctrl_handler = &sensor->ctrls;
>
>  	return 0;
>
> --
> 2.51.0
>

