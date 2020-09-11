Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24165266A3E
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 23:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgIKVpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 17:45:07 -0400
Received: from retiisi.org.uk ([95.216.213.190]:51540 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725864AbgIKVpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 17:45:06 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 18CB8634C8C;
        Sat, 12 Sep 2020 00:44:41 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kGqqX-00014C-91; Sat, 12 Sep 2020 00:44:41 +0300
Date:   Sat, 12 Sep 2020 00:44:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     leonl@leopardimaging.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx274: add support for sensor mode6, 1280x540
Message-ID: <20200911214441.GG834@valkosipuli.retiisi.org.uk>
References: <20200909105328.92598-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909105328.92598-1-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

Thanks for the patch.

On Wed, Sep 09, 2020 at 01:53:28PM +0300, Eugen Hristev wrote:
> Add support for the mode 6 for the sensor, this mode uses
> 3/8 subsampling and 3 horizontal binning.
> Aspect ratio is changed.
> Split the bin_ratio variable into two parts, one for
> width and one for height, as the ratio is no longer preserved
> when doing subsampling in this mode.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/media/i2c/imx274.c | 89 +++++++++++++++++++++++++++++++-------
>  1 file changed, 73 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index e6aa9f32b6a8..5adb11f036e2 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -147,8 +147,9 @@ static const struct regmap_config imx274_regmap_config = {
>  
>  enum imx274_binning {
>  	IMX274_BINNING_OFF,
> -	IMX274_BINNING_2_1,
> -	IMX274_BINNING_3_1,
> +	IMX274_BINNING_2_2,
> +	IMX274_BINNING_3_3,
> +	IMX274_BINNING_4_3,

This enum is unused (apart from the useless use of the first value). Please
remove it (may be a new patch).

>  };
>  
>  /*
> @@ -158,7 +159,8 @@ enum imx274_binning {
>   * implemented modes.
>   *
>   * @init_regs: registers to initialize the mode
> - * @bin_ratio: downscale factor (e.g. 3 for 3:1 binning)
> + * @wbin_ratio: width downscale factor (e.g. 3 for 1280; 3 = 3840/1280)
> + * @hbin_ratio: height downscale factor (e.g. 3 for 720; 3 = 2160/720)
>   * @min_frame_len: Minimum frame length for each mode (see "Frame Rate
>   *                 Adjustment (CSI-2)" in the datasheet)
>   * @min_SHR: Minimum SHR register value (see "Shutter Setting (CSI-2)" in the
> @@ -169,7 +171,8 @@ enum imx274_binning {
>   */
>  struct imx274_mode {
>  	const struct reg_8 *init_regs;
> -	unsigned int bin_ratio;
> +	unsigned int wbin_ratio;
> +	unsigned int hbin_ratio;

These could be char or short.

>  	int min_frame_len;
>  	int min_SHR;
>  	int max_fps;
> @@ -332,6 +335,46 @@ static const struct reg_8 imx274_mode5_1280x720_raw10[] = {
>  	{IMX274_TABLE_END, 0x00}
>  };
>  
> +/*
> + * Vertical 2/8 subsampling horizontal 3 binning
> + * imx274 mode6(refer to datasheet) register configuration with
> + * 1280x540 resolution, raw10 data and mipi four lane output
> + */
> +static const struct reg_8 imx274_mode6_1280x540_raw10[] = {
> +	{0x3004, 0x04}, /* mode setting */
> +	{0x3005, 0x31},
> +	{0x3006, 0x00},
> +	{0x3007, 0x02}, /* mode setting */
> +
> +	{0x3018, 0xA2}, /* output XVS, HVS */
> +
> +	{0x306B, 0x05},
> +	{0x30E2, 0x04}, /* mode setting */
> +
> +	{0x30EE, 0x01},
> +	{0x3342, 0x0A},
> +	{0x3343, 0x00},
> +	{0x3344, 0x16},
> +	{0x3345, 0x00},
> +	{0x33A6, 0x01},
> +	{0x3528, 0x0E},
> +	{0x3554, 0x1F},
> +	{0x3555, 0x01},
> +	{0x3556, 0x01},
> +	{0x3557, 0x01},
> +	{0x3558, 0x01},
> +	{0x3559, 0x00},
> +	{0x355A, 0x00},
> +	{0x35BA, 0x0E},
> +	{0x366A, 0x1B},
> +	{0x366B, 0x1A},
> +	{0x366C, 0x19},
> +	{0x366D, 0x17},
> +	{0x3A41, 0x04},
> +
> +	{IMX274_TABLE_END, 0x00}
> +};
> +
>  /*
>   * imx274 first step register configuration for
>   * starting stream
> @@ -445,7 +488,8 @@ static const struct reg_8 imx274_tp_regs[] = {
>  static const struct imx274_mode imx274_modes[] = {
>  	{
>  		/* mode 1, 4K */
> -		.bin_ratio = 1,
> +		.wbin_ratio = 1, /* 3840 */
> +		.hbin_ratio = 1, /* 2160 */
>  		.init_regs = imx274_mode1_3840x2160_raw10,
>  		.min_frame_len = 4550,
>  		.min_SHR = 12,
> @@ -454,7 +498,8 @@ static const struct imx274_mode imx274_modes[] = {
>  	},
>  	{
>  		/* mode 3, 1080p */
> -		.bin_ratio = 2,
> +		.wbin_ratio = 2, /* 1620 */
> +		.hbin_ratio = 2, /* 1080 */
>  		.init_regs = imx274_mode3_1920x1080_raw10,
>  		.min_frame_len = 2310,
>  		.min_SHR = 8,
> @@ -463,13 +508,24 @@ static const struct imx274_mode imx274_modes[] = {
>  	},
>  	{
>  		/* mode 5, 720p */
> -		.bin_ratio = 3,
> +		.wbin_ratio = 3, /* 1280 */
> +		.hbin_ratio = 3, /* 720 */
>  		.init_regs = imx274_mode5_1280x720_raw10,
>  		.min_frame_len = 2310,
>  		.min_SHR = 8,
>  		.max_fps = 120,
>  		.nocpiop = 112,
>  	},
> +	{
> +		/* mode 6, 540p */
> +		.wbin_ratio = 3, /* 1280 */
> +		.hbin_ratio = 4, /* 540 */
> +		.init_regs = imx274_mode6_1280x540_raw10,
> +		.min_frame_len = 2310,
> +		.min_SHR = 4,
> +		.max_fps = 120,
> +		.nocpiop = 112,
> +	},
>  };
>  
>  /*
> @@ -892,12 +948,13 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(imx274_modes); i++) {
> -		unsigned int ratio = imx274_modes[i].bin_ratio;
> +		unsigned int wratio = imx274_modes[i].wbin_ratio;
> +		unsigned int hratio = imx274_modes[i].hbin_ratio;
>  
>  		int goodness = imx274_binning_goodness(
>  			imx274,
> -			cur_crop->width / ratio, *width,
> -			cur_crop->height / ratio, *height,
> +			cur_crop->width / wratio, *width,
> +			cur_crop->height / hratio, *height,
>  			flags);
>  
>  		if (goodness >= best_goodness) {
> @@ -906,14 +963,14 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>  		}
>  	}
>  
> -	*width = cur_crop->width / best_mode->bin_ratio;
> -	*height = cur_crop->height / best_mode->bin_ratio;
> +	*width = cur_crop->width / best_mode->wbin_ratio;
> +	*height = cur_crop->height / best_mode->hbin_ratio;
>  
>  	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		imx274->mode = best_mode;
>  
> -	dev_dbg(dev, "%s: selected %u:1 binning\n",
> -		__func__, best_mode->bin_ratio);
> +	dev_dbg(dev, "%s: selected %u:%u binning\n",

I think the earlier message suggested it was ratio. How about "x"
instead of a colon?

Apart from these looks good to me.

> +		__func__, best_mode->wbin_ratio, best_mode->hbin_ratio);
>  
>  	tgt_fmt->width = *width;
>  	tgt_fmt->height = *height;
> @@ -1840,8 +1897,8 @@ static int imx274_probe(struct i2c_client *client)
>  	imx274->mode = &imx274_modes[IMX274_DEFAULT_BINNING];
>  	imx274->crop.width = IMX274_MAX_WIDTH;
>  	imx274->crop.height = IMX274_MAX_HEIGHT;
> -	imx274->format.width = imx274->crop.width / imx274->mode->bin_ratio;
> -	imx274->format.height = imx274->crop.height / imx274->mode->bin_ratio;
> +	imx274->format.width = imx274->crop.width / imx274->mode->wbin_ratio;
> +	imx274->format.height = imx274->crop.height / imx274->mode->hbin_ratio;
>  	imx274->format.field = V4L2_FIELD_NONE;
>  	imx274->format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
>  	imx274->format.colorspace = V4L2_COLORSPACE_SRGB;

-- 
Kind regards,

Sakari Ailus
