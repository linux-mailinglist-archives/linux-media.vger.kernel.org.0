Return-Path: <linux-media+bounces-23063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 588529EB216
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 14:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4655B168CF9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 13:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127C61AA1E0;
	Tue, 10 Dec 2024 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H6f0gvZh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2EF23DE8D;
	Tue, 10 Dec 2024 13:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733838106; cv=none; b=Ipj76fPy1dwPaPHw8m5Jk+GRqd806MJ1NoF7KyueXS6DbdhwhC+DbuHkH8nlBC+XExvhbXRL4YdRpDxJ9vHjhH2rt3/ae1hcAnAlIoA4YHZXrx2ZjtAitoQ1V4jIRlIz2gvIQT+xqMXNykGhDbAQqvZM03qAka3zB9PwxYXxByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733838106; c=relaxed/simple;
	bh=EOCTGealcIBIJ5RYhGWN005zEfzz6Why3C6vHAiug2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkAGGgXngLYKF95wuyvTd6TimMqOMK9cgbcgKP6sNEfH+L7VBlHqzJZ7DKMB/iJULJVL3CjYkmb4DHn9WLsMeA7SErg9z+HIofCklfn3jGltYg0NCN8VMWBDJanFAMD81L9Icc5DHZ5AGYT+BAqp9p/OaMAdK1MC5X1qD1n4apM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H6f0gvZh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89487752;
	Tue, 10 Dec 2024 14:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733838069;
	bh=EOCTGealcIBIJ5RYhGWN005zEfzz6Why3C6vHAiug2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6f0gvZhZbpGNz207Stpb5kVE8VAHXUEav0q2IvICffuOdKLUdsLrAHSXN4IQk4nd
	 Tm34qfOUikrEyHOyyATSlfuXAeEN6z1VLXG06E9lReKzIM9BIGhx8ib5ZpDmeWdp+I
	 +XLExWZLJRigSz6nM+OUfWfW0/zGKrMf3QHzvOxU=
Date: Tue, 10 Dec 2024 15:41:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Vinay Varma <varmavinaym@gmail.com>
Subject: Re: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for
 analog binning
Message-ID: <20241210134126.GI573@pendragon.ideasonboard.com>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
 <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>
 <Z0Xc6FYyYdLTUfll@kekkonen.localdomain>
 <umnnd72lotwgm46bv43bn3vdvcuqxf3idurp63hbilosx3gs4o@gp63z27qtlxp>
 <Z1hC-V8LZcXO_Qzo@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1hC-V8LZcXO_Qzo@kekkonen.localdomain>

On Tue, Dec 10, 2024 at 01:32:41PM +0000, Sakari Ailus wrote:
> On Wed, Nov 27, 2024 at 03:07:14PM +0530, Jai Luthra wrote:
> > On Nov 26, 2024 at 14:36:24 +0000, Sakari Ailus wrote:
> > > On Mon, Nov 25, 2024 at 08:36:27PM +0530, Jai Luthra wrote:
> > > > When the analog binning mode is used for high framerate operation,
> > > > the pixel rate is effectively doubled. Account for this when setting up
> > > > the pixel clock rate, and applying the vblank and exposure controls.
> > > > 
> > > > The previous logic only used analog binning for 8-bit modes, but normal
> > > > binning limits the framerate on 10-bit 480p [1]. So with this patch we
> > > > switch to using special binning (with 2x pixel rate) for all formats of
> > > > 480p mode and 8-bit 1232p.
> > > > 
> > > > [1]: https://github.com/raspberrypi/linux/issues/5493
> > > > 
> > > > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
> > > > Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
> > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 120 ++++++++++++++++++++++++++++-----------------
> > > >  1 file changed, 76 insertions(+), 44 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 970e6362d0ae3a9078daf337155e83d637bc1ca1..39b85cdee58318b080c867afd68ca33d14d3eda7 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -149,6 +149,12 @@
> > > >  #define IMX219_PIXEL_ARRAY_WIDTH	3280U
> > > >  #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
> > > >  
> > > > +enum binning_mode {
> > > > +	BINNING_NONE = IMX219_BINNING_NONE,
> > > > +	BINNING_X2 = IMX219_BINNING_X2,
> > > > +	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
> > > > +};
> > > > +
> > > >  /* Mode : resolution and related config&values */
> > > >  struct imx219_mode {
> > > >  	/* Frame width */
> > > > @@ -337,6 +343,10 @@ struct imx219 {
> > > >  
> > > >  	/* Two or Four lanes */
> > > >  	u8 lanes;
> > > > +
> > > > +	/* Binning mode */
> > > > +	enum binning_mode bin_h;
> > > > +	enum binning_mode bin_v;
> > > >  };
> > > >  
> > > >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > > > @@ -362,6 +372,36 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
> > > >  	return imx219_mbus_formats[i];
> > > >  }
> > > >  
> > > > +static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
> > > > +{
> > > > +	switch (format->code) {
> > > > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > > +		return 8;
> > > > +
> > > > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > > +	default:
> > > > +		return 10;
> > > > +	}
> > > > +}
> > > > +
> > > > +static int imx219_get_rate_factor(struct imx219 *imx219)
> > > > +{
> > > > +	switch (imx219->bin_v) {
> > > > +	case BINNING_NONE:
> > > > +	case BINNING_X2:
> > > > +		return 1;
> > > > +	case BINNING_ANALOG_X2:
> > > > +		return 2;
> > > 
> > > FWIW, what the CCS driver does is that it exposes different horizontal
> > > blanking ranges for devices that use analogue binning. The rate is really
> > > about reading pixels and with analogue binning the rate is the same, it's
> > > just that fewer pixels are being (digitally) read (as they are binned). I
> > > wonder if this would be a workable approach for this sensor, too. Of course
> > > if the LLP behaves differently for this sensor, then we should probably
> > > just accept that.
> > 
> > IMX219 seems to be odd in this case, as the LLP doesn't change during 
> > analog binning. Shared some more details in this thread:
> > 
> > https://lore.kernel.org/linux-media/20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com/T/#m1da4206e91db12b8e377dc686935195fc5f4bb68
> 
> Ack.
> 
> > > > +	}
> > > > +	return -EINVAL;
> > > > +}
> > > > +
> > > >  /* -----------------------------------------------------------------------------
> > > >   * Controls
> > > >   */
> > > > @@ -373,10 +413,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >  	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> > > >  	const struct v4l2_mbus_framefmt *format;
> > > >  	struct v4l2_subdev_state *state;
> > > > +	int rate_factor;
> > > 
> > > u32?
> > > 
> > 
> > Fixed.
> > 
> > > >  	int ret = 0;
> > > >  
> > > >  	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
> > > >  	format = v4l2_subdev_state_get_format(state, 0);
> > > > +	rate_factor = imx219_get_rate_factor(imx219);
> > > >  
> > > >  	if (ctrl->id == V4L2_CID_VBLANK) {
> > > >  		int exposure_max, exposure_def;
> > > > @@ -405,7 +447,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >  		break;
> > > >  	case V4L2_CID_EXPOSURE:
> > > >  		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > > > -			  ctrl->val, &ret);
> > > > +			  ctrl->val / rate_factor, &ret);
> > > 
> > > Isn't the exposure in lines? It shouldn't be affected by the rate change,
> > > shouldn't it?
> > > 
> > 
> > From the sensor datasheet the unit of FRAME_LENGTH register is updated 
> > to 2xLines when analog binning is used. And exposure and vertical 
> > blanking values are also in units of FRAME_LENGTH. This is also 
> > consistent with the behavior seen while testing.
> > 
> > > >  		break;
> > > >  	case V4L2_CID_DIGITAL_GAIN:
> > > >  		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > > > @@ -422,7 +464,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >  		break;
> > > >  	case V4L2_CID_VBLANK:
> > > >  		cci_write(imx219->regmap, IMX219_REG_VTS,
> > > > -			  format->height + ctrl->val, &ret);
> > > > +			  (format->height + ctrl->val) / rate_factor, &ret);
> > > 
> > > The same for vertical blanking.
> > > 
> > > >  		break;
> > > >  	case V4L2_CID_HBLANK:
> > > >  		cci_write(imx219->regmap, IMX219_REG_HTS,
> > > > @@ -463,7 +505,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
> > > >  
> > > >  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
> > > >  {
> > > > -	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
> > > > +	return ((imx219->lanes == 2) ? IMX219_PIXEL_RATE :
> > > > +		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
> > > >  }
> > > >  
> > > >  /* Initialize control handlers */
> > > > @@ -592,29 +635,12 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> > > >  {
> > > >  	const struct v4l2_mbus_framefmt *format;
> > > >  	const struct v4l2_rect *crop;
> > > > -	unsigned int bpp;
> > > > -	u64 bin_h, bin_v;
> > > > +	u32 bpp;
> > > >  	int ret = 0;
> > > >  
> > > >  	format = v4l2_subdev_state_get_format(state, 0);
> > > >  	crop = v4l2_subdev_state_get_crop(state, 0);
> > > > -
> > > > -	switch (format->code) {
> > > > -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > > > -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > > > -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > > > -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > > > -		bpp = 8;
> > > > -		break;
> > > > -
> > > > -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > > -	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > > > -	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > > > -	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > > > -	default:
> > > > -		bpp = 10;
> > > > -		break;
> > > > -	}
> > > > +	bpp = imx219_get_format_bpp(format);
> > > >  
> > > >  	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
> > > >  		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> > > > @@ -625,28 +651,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> > > >  	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
> > > >  		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
> > > >  
> > > > -	switch (crop->width / format->width) {
> > > > -	case 1:
> > > > -	default:
> > > > -		bin_h = IMX219_BINNING_NONE;
> > > > -		break;
> > > > -	case 2:
> > > > -		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > > > -		break;
> > > > -	}
> > > > -
> > > > -	switch (crop->height / format->height) {
> > > > -	case 1:
> > > > -	default:
> > > > -		bin_v = IMX219_BINNING_NONE;
> > > > -		break;
> > > > -	case 2:
> > > > -		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
> > > > -		break;
> > > > -	}
> > > > -
> > > > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
> > > > -	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
> > > > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->bin_h, &ret);
> > > > +	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->bin_v, &ret);
> > > 
> > > Please run:
> > > 
> > > $ ./scripts/checkpatch.pl --strict --max-line-length=80
> > > 
> > 
> > Oops, fixed in next revision.
> > 
> > > >  
> > > >  	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
> > > >  		  format->width, &ret);
> > > > @@ -851,6 +857,27 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > > >  		int exposure_max;
> > > >  		int exposure_def;
> > > >  		int hblank;
> > > > +		int pixel_rate;
> > > > +		u32 bpp = imx219_get_format_bpp(format);
> > > > +		enum binning_mode binning = BINNING_NONE;
> > > > +
> > > > +		/*
> > > > +		 * For 8-bit formats, analog horizontal binning is required,
> > > > +		 * else the output image is garbage.
> > > > +		 * For 10-bit formats, analog horizontal binning is optional,
> > > > +		 * but still useful as it doubles the effective framerate.
> > > > +		 * We can only use it with width <= 1624, as for higher values
> > > > +		 * there are blocky artefacts.
> > > 
> > > This comment would benefit from rewrapping.
> > > 
> > 
> > Fixed.
> > 
> > > > +		 *
> > > > +		 * Vertical binning should match the horizontal binning mode.
> > > > +		 */
> > > > +		if (bin_h == 2 && (format->width <= 1624 || bpp == 8))
> > > > +			binning = BINNING_ANALOG_X2;
> > > > +		else
> > > > +			binning = BINNING_X2;
> > > > +
> > > > +		imx219->bin_h = (bin_h == 2) ? binning : BINNING_NONE;
> > > > +		imx219->bin_v = (bin_v == 2) ? binning : BINNING_NONE;
> > > 
> > > It'd be also nice to move the state information to sub-device state.
> > 
> > I'm not sure I follow, do you mean the framework should store the 
> > binning mode, similar to how crop rectangle and interval are stored in 
> > v4l2_subdev_state?

Not the binning mode (or binning factor) as such, but v4l2_subdev_state
stores the format and selection rectangles, and the binning factors
should then be computed at stream on time. The imx219 structure should
not store any state data that is not related to the current hardware
state.

> Yes, please. This is done to the CCS driver as part of the metadata set
> (which we can hopefully merge in not too distant future)
> <URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/metadata>.

-- 
Regards,

Laurent Pinchart

