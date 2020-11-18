Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AE72B856E
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgKRUS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:18:56 -0500
Received: from mga03.intel.com ([134.134.136.65]:4888 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgKRUSz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:18:55 -0500
IronPort-SDR: WV+sGfZmvoCCJHDgzsFNfQnPtpTL6V1Ota6oQww+uKU49O4gVV3hFsxHXvqrAINpQgnENDQSYg
 N27i6XYEPnew==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171277576"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="171277576"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:18:53 -0800
IronPort-SDR: 1/CzfPpXdkFcF7mMxO9W5cuGadqK92DLblDW+1AXyoUdG4yB8C0eZ0UH6LQqWK17eaiUHVnGw2
 iC3g3wdbE9Zw==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="359635616"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:18:51 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 14B3C20808; Wed, 18 Nov 2020 22:18:49 +0200 (EET)
Date:   Wed, 18 Nov 2020 22:18:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: Re: [PATCH v3 13/29] media: ov5647: Break out format handling
Message-ID: <20201118201848.GK3940@paasikivi.fi.intel.com>
References: <20201109164934.134919-1-jacopo@jmondi.org>
 <20201109164934.134919-14-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109164934.134919-14-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 09, 2020 at 05:49:18PM +0100, Jacopo Mondi wrote:
> Break format handling out from the main driver structure.
> 
> This commit prepares for the introduction of more sensor formats and
> resolutions by instrumenting the existing operation to work on multiple
> modes instead of assuming a single one supported.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 90 +++++++++++++++++++++++++++-----------
>  1 file changed, 65 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 91193706b6fe1..d41c11afe1216 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -84,18 +84,28 @@ struct regval_list {
>  	u8 data;
>  };
>  
> +struct ov5647_mode {
> +	struct v4l2_mbus_framefmt	format;
> +	const struct regval_list	*reg_list;
> +	unsigned int			num_regs;
> +};
> +
> +struct ov5647_format_list {
> +	unsigned int			mbus_code;
> +	const struct ov5647_mode	*modes;
> +	unsigned int			num_modes;
> +};
> +
>  struct ov5647 {
>  	struct v4l2_subdev		sd;
>  	struct media_pad		pad;
>  	struct mutex			lock;
> -	struct v4l2_mbus_framefmt	format;
> -	unsigned int			width;
> -	unsigned int			height;
>  	int				power_count;
>  	struct clk			*xclk;
>  	struct gpio_desc		*pwdn;
>  	bool				clock_ncont;
>  	struct v4l2_ctrl_handler	ctrls;
> +	const struct ov5647_mode	*mode;
>  };
>  
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -115,7 +125,7 @@ static struct regval_list sensor_oe_enable_regs[] = {
>  	{0x3002, 0xe4},
>  };
>  
> -static struct regval_list ov5647_640x480[] = {
> +static const struct regval_list ov5647_640x480[] = {
>  	{0x0100, 0x00},
>  	{0x0103, 0x01},
>  	{0x3034, 0x08},
> @@ -205,6 +215,33 @@ static struct regval_list ov5647_640x480[] = {
>  	{0x0100, 0x01},
>  };
>  
> +static const struct ov5647_mode ov5647_8bit_modes[] = {
> +	{
> +		.format	= {
> +			.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> +			.colorspace	= V4L2_COLORSPACE_SRGB,
> +			.field		= V4L2_FIELD_NONE,
> +			.width		= 640,
> +			.height		= 480
> +		},
> +		.reg_list	= ov5647_640x480,
> +		.num_regs	= ARRAY_SIZE(ov5647_640x480)
> +	},
> +};
> +
> +static const struct ov5647_format_list ov5647_formats[] = {
> +	{
> +		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.modes		= ov5647_8bit_modes,
> +		.num_modes	= ARRAY_SIZE(ov5647_8bit_modes),
> +	},
> +};
> +
> +#define OV5647_NUM_FORMATS	(ARRAY_SIZE(ov5647_formats))
> +
> +#define OV5647_DEFAULT_MODE	(&ov5647_formats[0].modes[0])
> +#define OV5647_DEFAULT_FORMAT	(ov5647_formats[0].modes[0].format)
> +
>  static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
>  {
>  	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
> @@ -245,7 +282,7 @@ static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
>  }
>  
>  static int ov5647_write_array(struct v4l2_subdev *sd,
> -			      struct regval_list *regs, int array_size)
> +			      const struct regval_list *regs, int array_size)
>  {
>  	int i, ret;
>  
> @@ -275,6 +312,7 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>  static int ov5647_set_mode(struct v4l2_subdev *sd)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct ov5647 *sensor = to_sensor(sd);
>  	u8 resetval, rdval;
>  	int ret;
>  
> @@ -282,8 +320,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_write_array(sd, ov5647_640x480,
> -				 ARRAY_SIZE(ov5647_640x480));
> +	ret = ov5647_write_array(sd, sensor->mode->reg_list,
> +				 sensor->mode->num_regs);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "write sensor default regs error\n");
>  		return ret;
> @@ -494,10 +532,10 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_pad_config *cfg,
>  				 struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	if (code->index > 0)
> +	if (code->index >= OV5647_NUM_FORMATS)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> +	code->code = ov5647_formats[code->index].mbus_code;
>  
>  	return 0;
>  }
> @@ -506,16 +544,24 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_pad_config *cfg,
>  				  struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->index)
> +	const struct v4l2_mbus_framefmt *fmt;
> +	unsigned int i = 0;
> +
> +	for (; i < OV5647_NUM_FORMATS; ++i) {
> +		if (ov5647_formats[i].mbus_code == fse->code)
> +			break;
> +	}
> +	if (i == OV5647_NUM_FORMATS)
>  		return -EINVAL;
>  
> -	if (fse->code != MEDIA_BUS_FMT_SBGGR8_1X8)
> +	if (fse->index >= ov5647_formats[i].num_modes)
>  		return -EINVAL;
>  
> -	fse->min_width = 640;
> -	fse->max_width = 640;
> -	fse->min_height = 480;
> -	fse->max_height = 480;
> +	fmt = &ov5647_formats[i].modes[fse->index].format;
> +	fse->min_width = fmt->width;
> +	fse->max_width = fmt->width;
> +	fse->min_height = fmt->height;
> +	fse->max_height = fmt->height;
>  
>  	return 0;
>  }
> @@ -528,11 +574,7 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
>  
>  	/* Only one format is supported, so return that. */
>  	memset(fmt, 0, sizeof(*fmt));
> -	fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	fmt->field = V4L2_FIELD_NONE;
> -	fmt->width = 640;
> -	fmt->height = 480;
> +	*fmt = OV5647_DEFAULT_FORMAT;

With this change, the memset above becomes redundant.

>  
>  	return 0;
>  }
> @@ -591,11 +633,7 @@ static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>  	crop->width = OV5647_WINDOW_WIDTH_DEF;
>  	crop->height = OV5647_WINDOW_HEIGHT_DEF;
>  
> -	format->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> -	format->width = 640;
> -	format->height = 480;
> -	format->field = V4L2_FIELD_NONE;
> -	format->colorspace = V4L2_COLORSPACE_SRGB;
> +	*format = OV5647_DEFAULT_FORMAT;
>  
>  	return 0;
>  }
> @@ -817,6 +855,8 @@ static int ov5647_probe(struct i2c_client *client)
>  
>  	mutex_init(&sensor->lock);
>  
> +	sensor->mode = OV5647_DEFAULT_MODE;
> +
>  	ret = ov5647_init_controls(sensor);
>  	if (ret)
>  		goto mutex_destroy;

-- 
Regards,

Sakari Ailus
