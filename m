Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A51720386
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbjFBNi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbjFBNi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:38:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAA3137;
        Fri,  2 Jun 2023 06:38:25 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4691E6E0;
        Fri,  2 Jun 2023 15:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685713081;
        bh=ctQXngfCblu/INHQm8DQpO1rksks+IsJop0Y4ZtUbr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lNTqadrk2X4T9r6kKZNXu05ITIUByVIebA/QPOuKyvBYX4OyAIdo8H8N5+o/Xi/9A
         yITb++vkbXvhhORsgiMdeMjZ0cq4aKphj37I+h/2KAZTk8AmnWO7ocPnXuHTHQ6w0I
         RDFHvACineFfMWD4oigE4JIuKomYVkDGpVRY9U+k=
Date:   Fri, 2 Jun 2023 15:38:21 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 14/21] media: i2c: imx258: Add support for long exposure
 modes
Message-ID: <i7epfbavk5z7imvlsecitwqcdhmu7yh6z25guu7utfes2e7yyz@l7iz5vrit7h7>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-15-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-15-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, May 30, 2023 at 06:29:53PM +0100, Dave Stevenson wrote:
> The sensor has a register CIT_LSHIFT which extends the exposure
> and frame times by the specified power of 2 for longer
> exposure times.
>
> Add support for this by configuring this register via V4L2_CID_VBLANK
> and extending the V4L2_CID_EXPOSURE range accordingly.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index f5199e3243e8..1e424058fcb9 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -69,6 +69,10 @@
>  #define IMX258_HDR_RATIO_STEP		1
>  #define IMX258_HDR_RATIO_DEFAULT	0x0
>
> +/* Long exposure multiplier */
> +#define IMX258_LONG_EXP_SHIFT_MAX	7
> +#define IMX258_LONG_EXP_SHIFT_REG	0x3002
> +
>  /* Test Pattern Control */
>  #define IMX258_REG_TEST_PATTERN		0x0600
>
> @@ -629,6 +633,8 @@ struct imx258 {
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *exposure;
> +	/* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
> +	unsigned int long_exp_shift;
>
>  	/* Current mode */
>  	const struct imx258_mode *cur_mode;
> @@ -793,6 +799,26 @@ static void imx258_adjust_exposure_range(struct imx258 *imx258)
>  				 exposure_def);
>  }
>
> +static int imx258_set_frame_length(struct imx258 *imx258, unsigned int val)
> +{
> +	int ret;
> +
> +	imx258->long_exp_shift = 0;
> +
> +	while (val > IMX258_VTS_MAX) {
> +		imx258->long_exp_shift++;
> +		val >>= 1;
> +	}
> +
> +	ret = imx258_write_reg(imx258, IMX258_REG_VTS,
> +			       IMX258_REG_VALUE_16BIT, val);
> +	if (ret)
> +		return ret;
> +
> +	return imx258_write_reg(imx258, IMX258_LONG_EXP_SHIFT_REG,
> +				IMX258_REG_VALUE_08BIT, imx258->long_exp_shift);
> +}
> +
>  static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx258 *imx258 =
> @@ -823,7 +849,7 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_EXPOSURE:
>  		ret = imx258_write_reg(imx258, IMX258_REG_EXPOSURE,
>  				IMX258_REG_VALUE_16BIT,
> -				ctrl->val);
> +				ctrl->val >> imx258->long_exp_shift);

Shouldn't this be done only if vblank > VTS_MAX ?

>  		break;
>  	case V4L2_CID_DIGITAL_GAIN:
>  		ret = imx258_update_digital_gain(imx258, IMX258_REG_VALUE_16BIT,
> @@ -855,9 +881,8 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  		}
>  		break;
>  	case V4L2_CID_VBLANK:
> -		ret = imx258_write_reg(imx258, IMX258_REG_VTS,
> -				       IMX258_REG_VALUE_16BIT,
> -				       imx258->cur_mode->height + ctrl->val);
> +		ret = imx258_set_frame_length(imx258,
> +					      imx258->cur_mode->height + ctrl->val);
>  		break;
>  	default:
>  		dev_info(&client->dev,
> @@ -983,8 +1008,9 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
>  			     imx258->cur_mode->height;
>  		__v4l2_ctrl_modify_range(
>  			imx258->vblank, vblank_min,
> -			IMX258_VTS_MAX - imx258->cur_mode->height, 1,
> -			vblank_def);
> +			((1 << IMX258_LONG_EXP_SHIFT_MAX) * IMX258_VTS_MAX) -
> +						imx258->cur_mode->height,
> +			1, vblank_def);
>  		__v4l2_ctrl_s_ctrl(imx258->vblank, vblank_def);
>  		h_blank =
>  			imx258->link_freq_configs[mode->link_freq_index].pixels_per_line
> --
> 2.25.1
>
