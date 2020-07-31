Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69862344B3
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 13:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732638AbgGaLor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 07:44:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:35014 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732104AbgGaLor (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 07:44:47 -0400
IronPort-SDR: 3U18FB6w2Mbi2ZA8zesmYhwI+BONMK81rNU1eCy1ZDaQdpq0hn4bHO+g9Hvg95HxT6NlKY3ypp
 DApljyFeqKQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="131833043"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="131833043"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 04:44:46 -0700
IronPort-SDR: nW0vU/U/0td0BoGSqQsk5m8/w0z2OBQrZ7gc0mJ14YrW83ND3Mzw541HUBA6OihIHFh+HwpDQS
 RutUV8DVSRBg==
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
   d="scan'208";a="287160277"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 04:44:42 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CD0E920722; Fri, 31 Jul 2020 14:44:39 +0300 (EEST)
Date:   Fri, 31 Jul 2020 14:44:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 15/25] media: ov5647: Break out format handling
Message-ID: <20200731114439.GN13316@paasikivi.fi.intel.com>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623164224.44476-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623164224.44476-5-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Btw. I've bounced the two DT binding patches to DT list + Rob. Please
remember that in v2 if there are changes.

On Tue, Jun 23, 2020 at 06:42:24PM +0200, Jacopo Mondi wrote:
> Break format handling out from the main driver structure.
> 
> This commit prepares for the introduction of more sensor formats and
> resolutions by instrumenting the existing operation to work on multiple
> modes instead of assuming a single one supported.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 84 +++++++++++++++++++++++++++-----------
>  1 file changed, 61 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 03f4f1a257ecd..a801ed0249aad 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -84,18 +84,28 @@ struct regval_list {
>  	u8 data;
>  };
>  
> +struct ov5647_mode {
> +	struct v4l2_mbus_framefmt	format;
> +	struct regval_list		*reg_list;
> +	unsigned int			num_regs;
> +};
> +
> +struct ov5647_format_list {
> +	unsigned int			mbus_code;
> +	struct ov5647_mode		*modes;
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
> +	struct ov5647_mode		*mode;
>  };
>  
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -205,6 +215,33 @@ static struct regval_list ov5647_640x480[] = {
>  	{0x0100, 0x01},
>  };
>  
> +static struct ov5647_mode ov5647_8bit_modes[] = {

const

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

Please use ARRAY_SIZE() directly, you don't need a macro here.

> +
> +#define OV5647_DEFAULT_MODE	(&ov5647_formats[0].modes[0])
> +#define OV5647_DEFAULT_FORMAT	(ov5647_formats[0].modes[0].format)
> +
>  static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
>  {
>  	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
> @@ -282,8 +319,7 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5647_write_array(sd, ov5647_640x480,
> -				 ARRAY_SIZE(ov5647_640x480));
> +	ret = ov5647_write_array(sd, sensor->mode->reg_list, sensor->mode->num_regs);

No need for a line over 80.

>  	if (ret < 0) {
>  		dev_err(&client->dev, "write sensor default regs error\n");
>  		return ret;
> @@ -494,10 +530,10 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
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
> @@ -506,16 +542,24 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
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
> @@ -528,11 +572,7 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
>  
>  	/* Only one format is supported, so return that. */
>  	memset(fmt, 0, sizeof(*fmt));
> -	fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	fmt->field = V4L2_FIELD_NONE;
> -	fmt->width = 640;
> -	fmt->height = 480;
> +	*fmt = OV5647_DEFAULT_FORMAT;
>  
>  	return 0;
>  }
> @@ -591,11 +631,7 @@ static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
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
> @@ -813,6 +849,8 @@ static int ov5647_probe(struct i2c_client *client)
>  
>  	mutex_init(&sensor->lock);
>  
> +	sensor->mode = OV5647_DEFAULT_MODE;

You could do this without the macro, too.

> +
>  	ret = ov5647_init_controls(sensor);
>  	if (ret)
>  		goto mutex_destroy;

-- 
Kind regards,

Sakari Ailus
