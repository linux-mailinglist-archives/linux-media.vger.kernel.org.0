Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7882363513F
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 08:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbiKWHq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 02:46:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbiKWHqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 02:46:49 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5106BFA70E
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 23:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669189607; x=1700725607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r6Y9dA2LiPLCuAM+ppBswaYCluQgxGOcS4dMiA9FOLQ=;
  b=prCSqCWK/qPgUbc+VBBuK8iZOu6Lx6jEk+kRsyqrVv8j5Qd5jPCRf+qp
   ZNP5sqBBJQ33rqfg6aUZ4QpKq97aHos/2TB++V13dtQghgiV/kxamv2lb
   l82wtZRftqGapu74d98F1ypnvQyRSsH8rHqblzcwRufjmAsCttZ3TgKAL
   kdO46uKhZ9YiM3Z/bP+1hHeELvYy+UVg8PdDGaqH30g1uh/TDj9AnIuew
   UR7ZR4Wh0tcxrLIVLtG2ASHx/PToTyR0sXv2/DArc1762YdGhTsUzIRn7
   DWkzzDHlbICPo+FL9+j8PZ0Y7nHJAZFQRiIq+pfO1Bo8oP2bDZUGZ0Ef5
   w==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525459"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 08:46:45 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 08:46:45 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 08:46:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669189605; x=1700725605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r6Y9dA2LiPLCuAM+ppBswaYCluQgxGOcS4dMiA9FOLQ=;
  b=ZhQ0Ik1l/H25SLC5V5ZihONaC012oMHB+cVv6TtnS/Fdc93bPa7CmM+K
   57aKIplJUglo89czslyvlfxyd/2kHd7fjhDqAS44v1LJsh598kThFoyq0
   JuTmsA61OwTQKDl95L6qJ/gwL8lVdmaQ1bM3zfGwsoi0A6WpP5Vu7KIGQ
   R0bb7xxiJvYhzit3s3lUJ0u71PklsTKlieRrtA0zqDcOh5Q/hJ7pmDg0y
   XE5c8QQaEIlfBxRkKCQXMYwYHtoUd0EDcKzYMX56tCBndelvs3/5CcaBq
   aqI5eQcvlOACKOKdn7IYdgOvErF36ojltEn7BGFFAjgwcB6FkWB4z9Ln3
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525458"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 08:46:45 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 84F92280056;
        Wed, 23 Nov 2022 08:46:45 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 01/15] media: i2c: imx290: Group functions in sections
Date:   Wed, 23 Nov 2022 08:46:45 +0100
Message-ID: <4790491.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-2-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:36 CET schrieb Laurent Pinchart:
> Move functions around to group them in logical sections, in order to
> improve readability. As a result, the IMX290_NUM_SUPPLIES macro has to
> be changed. No other code change is included, only moves.

LGFM.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 626 +++++++++++++++++++------------------
>  1 file changed, 325 insertions(+), 301 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 9954ad7376f7..aae4f51941a1 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -152,13 +152,7 @@
>  #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH		1920
>  #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT		1080
> 
> -static const char * const imx290_supply_name[] = {
> -	"vdda",
> -	"vddd",
> -	"vdddo",
> -};
> -
> -#define IMX290_NUM_SUPPLIES ARRAY_SIZE(imx290_supply_name)
> +#define IMX290_NUM_SUPPLIES				3
> 
>  struct imx290_regval {
>  	u32 reg;
> @@ -199,31 +193,14 @@ struct imx290 {
>  	struct mutex lock;
>  };
> 
> -struct imx290_pixfmt {
> -	u32 code;
> -	u8 bpp;
> -};
> +static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> +{
> +	return container_of(_sd, struct imx290, sd);
> +}
> 
> -static const struct imx290_pixfmt imx290_formats[] = {
> -	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> -	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> -};
> -
> -static const struct regmap_config imx290_regmap_config = {
> -	.reg_bits = 16,
> -	.val_bits = 8,
> -};
> -
> -static const char * const imx290_test_pattern_menu[] = {
> -	"Disabled",
> -	"Sequence Pattern 1",
> -	"Horizontal Color-bar Chart",
> -	"Vertical Color-bar Chart",
> -	"Sequence Pattern 2",
> -	"Gradation Pattern 1",
> -	"Gradation Pattern 2",
> -	"000/555h Toggle Pattern",
> -};
> +/*
> ---------------------------------------------------------------------------
> -- + * Modes and formats
> + */
> 
>  static const struct imx290_regval imx290_global_init_settings[] = {
>  	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
> @@ -438,10 +415,19 @@ static inline int imx290_modes_num(const struct imx290
> *imx290) return ARRAY_SIZE(imx290_modes_4lanes);
>  }
> 
> -static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> -{
> -	return container_of(_sd, struct imx290, sd);
> -}
> +struct imx290_pixfmt {
> +	u32 code;
> +	u8 bpp;
> +};
> +
> +static const struct imx290_pixfmt imx290_formats[] = {
> +	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
> +	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
> +};
> +
> +/*
> ---------------------------------------------------------------------------
> -- + * Register access
> + */
> 
>  static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32
> *value) {
> @@ -501,18 +487,94 @@ static int imx290_set_register_array(struct imx290
> *imx290, return 0;
>  }
> 
> -/* Stop streaming */
> -static int imx290_stop_streaming(struct imx290 *imx290)
> +static int imx290_set_data_lanes(struct imx290 *imx290)
>  {
> -	int ret = 0;
> +	int ret = 0, laneval, frsel;
> 
> -	imx290_write(imx290, IMX290_STANDBY, 0x01, &ret);
> +	switch (imx290->nlanes) {
> +	case 2:
> +		laneval = 0x01;
> +		frsel = 0x02;
> +		break;
> +	case 4:
> +		laneval = 0x03;
> +		frsel = 0x01;
> +		break;
> +	default:
> +		/*
> +		 * We should never hit this since the data lane count is
> +		 * validated in probe itself
> +		 */
> +		dev_err(imx290->dev, "Lane configuration not 
supported\n");
> +		return -EINVAL;
> +	}
> 
> -	msleep(30);
> +	imx290_write(imx290, IMX290_PHY_LANE_NUM, laneval, &ret);
> +	imx290_write(imx290, IMX290_CSI_LANE_MODE, laneval, &ret);
> +	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
> 
> -	return imx290_write(imx290, IMX290_XMSTA, 0x01, &ret);
> +	return ret;
>  }
> 
> +static int imx290_write_current_format(struct imx290 *imx290)
> +{
> +	int ret;
> +
> +	switch (imx290->current_format.code) {
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		ret = imx290_set_register_array(imx290, 
imx290_10bit_settings,
> +						ARRAY_SIZE(
> +							
imx290_10bit_settings));
> +		if (ret < 0) {
> +			dev_err(imx290->dev, "Could not set format 
registers\n");
> +			return ret;
> +		}
> +		break;
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		ret = imx290_set_register_array(imx290, 
imx290_12bit_settings,
> +						ARRAY_SIZE(
> +							
imx290_12bit_settings));
> +		if (ret < 0) {
> +			dev_err(imx290->dev, "Could not set format 
registers\n");
> +			return ret;
> +		}
> +		break;
> +	default:
> +		dev_err(imx290->dev, "Unknown pixel format\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline u8 imx290_get_link_freq_index(struct imx290 *imx290)
> +{
> +	return imx290->current_mode->link_freq_index;
> +}
> +
> +static s64 imx290_get_link_freq(struct imx290 *imx290)
> +{
> +	u8 index = imx290_get_link_freq_index(imx290);
> +
> +	return *(imx290_link_freqs_ptr(imx290) + index);
> +}
> +
> +static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
> +{
> +	s64 link_freq = imx290_get_link_freq(imx290);
> +	u8 nlanes = imx290->nlanes;
> +	u64 pixel_rate;
> +
> +	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> +	pixel_rate = link_freq * 2 * nlanes;
> +	do_div(pixel_rate, imx290->bpp);
> +	return pixel_rate;
> +}
> +
> +/*
> ---------------------------------------------------------------------------
> - + * Controls
> + */
> +
>  static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx290 *imx290 = container_of(ctrl->handler,
> @@ -566,6 +628,187 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
>  	.s_ctrl = imx290_set_ctrl,
>  };
> 
> +static const char * const imx290_test_pattern_menu[] = {
> +	"Disabled",
> +	"Sequence Pattern 1",
> +	"Horizontal Color-bar Chart",
> +	"Vertical Color-bar Chart",
> +	"Sequence Pattern 2",
> +	"Gradation Pattern 1",
> +	"Gradation Pattern 2",
> +	"000/555h Toggle Pattern",
> +};
> +
> +static int imx290_ctrl_init(struct imx290 *imx290)
> +{
> +	struct v4l2_fwnode_device_properties props;
> +	unsigned int blank;
> +	int ret;
> +
> +	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> +	imx290->ctrls.lock = &imx290->lock;
> +
> +	/*
> +	 * The sensor has an analog gain and a digital gain, both controlled
> +	 * through a single gain value, expressed in 0.3dB increments. 
Values
> +	 * from 0.0dB (0) to 30.0dB (100) apply analog gain only, higher 
values
> +	 * up to 72.0dB (240) add further digital gain. Limit the range to
> +	 * analog gain only, support for digital gain can be added 
separately
> +	 * if needed.
> +	 *
> +	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
> +	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
> +	 * gain. When support for those sensors gets added to the driver, 
the
> +	 * gain control should be adjusted accordingly.
> +	 */
> +	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> +
> +	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 
1,
> +			  IMX290_VMAX_DEFAULT - 2);
> +
> +	imx290->link_freq =
> +		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ,
> +				       imx290_link_freqs_num(imx290) - 
1, 0,
> +				       imx290_link_freqs_ptr(imx290));
> +	if (imx290->link_freq)
> +		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE,
> +					       1, INT_MAX, 1,
> +					       
imx290_calc_pixel_rate(imx290));
> +
> +	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> +				     0, 0, imx290_test_pattern_menu);
> +
> +	blank = imx290->current_mode->hmax - imx290->current_mode->width;
> +	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +					   V4L2_CID_HBLANK, blank, 
blank, 1,
> +					   blank);
> +	if (imx290->hblank)
> +		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> +	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +					   V4L2_CID_VBLANK, blank, 
blank, 1,
> +					   blank);
> +	if (imx290->vblank)
> +		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> +					&props);
> +
> +	imx290->sd.ctrl_handler = &imx290->ctrls;
> +
> +	if (imx290->ctrls.error) {
> +		ret = imx290->ctrls.error;
> +		v4l2_ctrl_handler_free(&imx290->ctrls);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> ---------------------------------------------------------------------------
> - + * Subdev operations
> + */
> +
> +/* Start streaming */
> +static int imx290_start_streaming(struct imx290 *imx290)
> +{
> +	int ret;
> +
> +	/* Set init register settings */
> +	ret = imx290_set_register_array(imx290, imx290_global_init_settings,
> +					ARRAY_SIZE(
> +						
imx290_global_init_settings));
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set init registers\n");
> +		return ret;
> +	}
> +
> +	/* Apply the register values related to current frame format */
> +	ret = imx290_write_current_format(imx290);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set frame format\n");
> +		return ret;
> +	}
> +
> +	/* Apply default values of current mode */
> +	ret = imx290_set_register_array(imx290, imx290->current_mode->data,
> +					imx290->current_mode-
>data_size);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set current mode\n");
> +		return ret;
> +	}
> +
> +	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> +			   NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Apply customized values from user */
> +	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> +	if (ret) {
> +		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
> +		return ret;
> +	}
> +
> +	imx290_write(imx290, IMX290_STANDBY, 0x00, &ret);
> +
> +	msleep(30);
> +
> +	/* Start streaming */
> +	return imx290_write(imx290, IMX290_XMSTA, 0x00, &ret);
> +}
> +
> +/* Stop streaming */
> +static int imx290_stop_streaming(struct imx290 *imx290)
> +{
> +	int ret = 0;
> +
> +	imx290_write(imx290, IMX290_STANDBY, 0x01, &ret);
> +
> +	msleep(30);
> +
> +	return imx290_write(imx290, IMX290_XMSTA, 0x01, &ret);
> +}
> +
> +static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct imx290 *imx290 = to_imx290(sd);
> +	int ret = 0;
> +
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(imx290->dev);
> +		if (ret < 0)
> +			goto unlock_and_return;
> +
> +		ret = imx290_start_streaming(imx290);
> +		if (ret) {
> +			dev_err(imx290->dev, "Start stream failed\n");
> +			pm_runtime_put(imx290->dev);
> +			goto unlock_and_return;
> +		}
> +	} else {
> +		imx290_stop_streaming(imx290);
> +		pm_runtime_put(imx290->dev);
> +	}
> +
> +unlock_and_return:
> +
> +	return ret;
> +}
> +
>  static struct v4l2_mbus_framefmt *
>  imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state
> *state, u32 which)
> @@ -627,30 +870,6 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
> 
> -static inline u8 imx290_get_link_freq_index(struct imx290 *imx290)
> -{
> -	return imx290->current_mode->link_freq_index;
> -}
> -
> -static s64 imx290_get_link_freq(struct imx290 *imx290)
> -{
> -	u8 index = imx290_get_link_freq_index(imx290);
> -
> -	return *(imx290_link_freqs_ptr(imx290) + index);
> -}
> -
> -static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
> -{
> -	s64 link_freq = imx290_get_link_freq(imx290);
> -	u8 nlanes = imx290->nlanes;
> -	u64 pixel_rate;
> -
> -	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -	pixel_rate = link_freq * 2 * nlanes;
> -	do_div(pixel_rate, imx290->bpp);
> -	return pixel_rate;
> -}
> -
>  static int imx290_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *fmt)
> @@ -774,151 +993,31 @@ static int imx290_entity_init_cfg(struct v4l2_subdev
> *subdev, return 0;
>  }
> 
> -static int imx290_write_current_format(struct imx290 *imx290)
> -{
> -	int ret;
> -
> -	switch (imx290->current_format.code) {
> -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> -		ret = imx290_set_register_array(imx290, 
imx290_10bit_settings,
> -						ARRAY_SIZE(
> -							
imx290_10bit_settings));
> -		if (ret < 0) {
> -			dev_err(imx290->dev, "Could not set format 
registers\n");
> -			return ret;
> -		}
> -		break;
> -	case MEDIA_BUS_FMT_SRGGB12_1X12:
> -		ret = imx290_set_register_array(imx290, 
imx290_12bit_settings,
> -						ARRAY_SIZE(
> -							
imx290_12bit_settings));
> -		if (ret < 0) {
> -			dev_err(imx290->dev, "Could not set format 
registers\n");
> -			return ret;
> -		}
> -		break;
> -	default:
> -		dev_err(imx290->dev, "Unknown pixel format\n");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -/* Start streaming */
> -static int imx290_start_streaming(struct imx290 *imx290)
> -{
> -	int ret;
> -
> -	/* Set init register settings */
> -	ret = imx290_set_register_array(imx290, imx290_global_init_settings,
> -					ARRAY_SIZE(
> -						
imx290_global_init_settings));
> -	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set init registers\n");
> -		return ret;
> -	}
> -
> -	/* Apply the register values related to current frame format */
> -	ret = imx290_write_current_format(imx290);
> -	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set frame format\n");
> -		return ret;
> -	}
> -
> -	/* Apply default values of current mode */
> -	ret = imx290_set_register_array(imx290, imx290->current_mode->data,
> -					imx290->current_mode-
>data_size);
> -	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set current mode\n");
> -		return ret;
> -	}
> -
> -	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> -			   NULL);
> -	if (ret)
> -		return ret;
> -
> -	/* Apply customized values from user */
> -	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
> -	if (ret) {
> -		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
> -		return ret;
> -	}
> -
> -	imx290_write(imx290, IMX290_STANDBY, 0x00, &ret);
> -
> -	msleep(30);
> -
> -	/* Start streaming */
> -	return imx290_write(imx290, IMX290_XMSTA, 0x00, &ret);
> -}
> -
> -static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
> -{
> -	struct imx290 *imx290 = to_imx290(sd);
> -	int ret = 0;
> -
> -	if (enable) {
> -		ret = pm_runtime_resume_and_get(imx290->dev);
> -		if (ret < 0)
> -			goto unlock_and_return;
> -
> -		ret = imx290_start_streaming(imx290);
> -		if (ret) {
> -			dev_err(imx290->dev, "Start stream failed\n");
> -			pm_runtime_put(imx290->dev);
> -			goto unlock_and_return;
> -		}
> -	} else {
> -		imx290_stop_streaming(imx290);
> -		pm_runtime_put(imx290->dev);
> -	}
> -
> -unlock_and_return:
> -
> -	return ret;
> -}
> -
> -static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(imx290->supplies); i++)
> -		imx290->supplies[i].supply = imx290_supply_name[i];
> -
> -	return devm_regulator_bulk_get(dev, ARRAY_SIZE(imx290->supplies),
> -				       imx290->supplies);
> -}
> -
> -static int imx290_set_data_lanes(struct imx290 *imx290)
> -{
> -	int ret = 0, laneval, frsel;
> -
> -	switch (imx290->nlanes) {
> -	case 2:
> -		laneval = 0x01;
> -		frsel = 0x02;
> -		break;
> -	case 4:
> -		laneval = 0x03;
> -		frsel = 0x01;
> -		break;
> -	default:
> -		/*
> -		 * We should never hit this since the data lane count is
> -		 * validated in probe itself
> -		 */
> -		dev_err(imx290->dev, "Lane configuration not 
supported\n");
> -		return -EINVAL;
> -	}
> -
> -	imx290_write(imx290, IMX290_PHY_LANE_NUM, laneval, &ret);
> -	imx290_write(imx290, IMX290_CSI_LANE_MODE, laneval, &ret);
> -	imx290_write(imx290, IMX290_FR_FDG_SEL, frsel, &ret);
> -
> -	return ret;
> -}
> +static const struct v4l2_subdev_video_ops imx290_video_ops = {
> +	.s_stream = imx290_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
> +	.init_cfg = imx290_entity_init_cfg,
> +	.enum_mbus_code = imx290_enum_mbus_code,
> +	.enum_frame_size = imx290_enum_frame_size,
> +	.get_fmt = imx290_get_fmt,
> +	.set_fmt = imx290_set_fmt,
> +	.get_selection = imx290_get_selection,
> +};
> +
> +static const struct v4l2_subdev_ops imx290_subdev_ops = {
> +	.video = &imx290_video_ops,
> +	.pad = &imx290_pad_ops,
> +};
> +
> +static const struct media_entity_operations imx290_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +/*
> ---------------------------------------------------------------------------
> - + * Power management
> + */
> 
>  static int imx290_power_on(struct device *dev)
>  {
> @@ -966,105 +1065,30 @@ static const struct dev_pm_ops imx290_pm_ops = {
>  	SET_RUNTIME_PM_OPS(imx290_power_off, imx290_power_on, NULL)
>  };
> 
> -static const struct v4l2_subdev_video_ops imx290_video_ops = {
> -	.s_stream = imx290_set_stream,
> -};
> -
> -static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
> -	.init_cfg = imx290_entity_init_cfg,
> -	.enum_mbus_code = imx290_enum_mbus_code,
> -	.enum_frame_size = imx290_enum_frame_size,
> -	.get_fmt = imx290_get_fmt,
> -	.set_fmt = imx290_set_fmt,
> -	.get_selection = imx290_get_selection,
> -};
> +/*
> ---------------------------------------------------------------------------
> - + * Probe & remove
> + */
> 
> -static const struct v4l2_subdev_ops imx290_subdev_ops = {
> -	.video = &imx290_video_ops,
> -	.pad = &imx290_pad_ops,
> +static const struct regmap_config imx290_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
>  };
> 
> -static const struct media_entity_operations imx290_subdev_entity_ops = {
> -	.link_validate = v4l2_subdev_link_validate,
> +static const char * const imx290_supply_name[IMX290_NUM_SUPPLIES] = {
> +	"vdda",
> +	"vddd",
> +	"vdddo",
>  };
> 
> -static int imx290_ctrl_init(struct imx290 *imx290)
> +static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
> {
> -	struct v4l2_fwnode_device_properties props;
> -	unsigned int blank;
> -	int ret;
> +	unsigned int i;
> 
> -	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> -	if (ret < 0)
> -		return ret;
> +	for (i = 0; i < ARRAY_SIZE(imx290->supplies); i++)
> +		imx290->supplies[i].supply = imx290_supply_name[i];
> 
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
> -	imx290->ctrls.lock = &imx290->lock;
> -
> -	/*
> -	 * The sensor has an analog gain and a digital gain, both controlled
> -	 * through a single gain value, expressed in 0.3dB increments. 
Values
> -	 * from 0.0dB (0) to 30.0dB (100) apply analog gain only, higher 
values
> -	 * up to 72.0dB (240) add further digital gain. Limit the range to
> -	 * analog gain only, support for digital gain can be added 
separately
> -	 * if needed.
> -	 *
> -	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
> -	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
> -	 * gain. When support for those sensors gets added to the driver, 
the
> -	 * gain control should be adjusted accordingly.
> -	 */
> -	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
> -
> -	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 
1,
> -			  IMX290_VMAX_DEFAULT - 2);
> -
> -	imx290->link_freq =
> -		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ,
> -				       imx290_link_freqs_num(imx290) - 
1, 0,
> -				       imx290_link_freqs_ptr(imx290));
> -	if (imx290->link_freq)
> -		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
> -	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> -					       V4L2_CID_PIXEL_RATE,
> -					       1, INT_MAX, 1,
> -					       
imx290_calc_pixel_rate(imx290));
> -
> -	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
> -				     V4L2_CID_TEST_PATTERN,
> -				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> -				     0, 0, imx290_test_pattern_menu);
> -
> -	blank = imx290->current_mode->hmax - imx290->current_mode->width;
> -	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -					   V4L2_CID_HBLANK, blank, 
blank, 1,
> -					   blank);
> -	if (imx290->hblank)
> -		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
> -	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> -	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -					   V4L2_CID_VBLANK, blank, 
blank, 1,
> -					   blank);
> -	if (imx290->vblank)
> -		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
> -	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
> -					&props);
> -
> -	imx290->sd.ctrl_handler = &imx290->ctrls;
> -
> -	if (imx290->ctrls.error) {
> -		ret = imx290->ctrls.error;
> -		v4l2_ctrl_handler_free(&imx290->ctrls);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return devm_regulator_bulk_get(dev, ARRAY_SIZE(imx290->supplies),
> +				       imx290->supplies);
>  }
> 
>  /*




