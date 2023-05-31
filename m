Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64A671864E
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbjEaP2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbjEaP2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:28:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175F51A5;
        Wed, 31 May 2023 08:27:34 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 642DBE79;
        Wed, 31 May 2023 17:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685546828;
        bh=f0YF3fTgpLkwU2P/r/EyuGl5NKgt+50qOICG+yLsLkQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z1PJBDo8C2orOHr3esd1NkLqev166+jSAohbyITEVW2TSoR5nHhrRqRxH16+4SqmB
         A0q4n4YwPcLftuW7WJAbDXYP/wjVf+tFROCnMSecxGqOhp+7lBi/7QjJUTDxcsU5ED
         rwE6cHcEIqYu0929x8LH8RoEICv3eXwyp0LABUOY=
Date:   Wed, 31 May 2023 17:27:26 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 10/21] media: i2c: imx258: Follow normal V4L2 behaviours
 for clipping exposure
Message-ID: <zfo4hzea6kojuyuc66dolvoucmorlndolzhfzroddqxyujo2td@xo2m7yrphzfo>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-11-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-11-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:49PM +0100, Dave Stevenson wrote:
> V4L2 sensor drivers are expected are expected to clip the supported
> exposure range based on the VBLANK configured.
> IMX258 wasn't doing that as register 0x350 (FRM_LENGTH_CTL)
> switches it to a mode where frame length tracks coarse exposure time.
>
> Disable this mode and clip the range for V4L2_CID_EXPOSURE appropriately
> based on V4L2_CID_VBLANK.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Ah, here you go!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

thanks
   j

> ---
>  drivers/media/i2c/imx258.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 433dff7f1fa0..82ffe09e3bdc 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -37,10 +37,11 @@
>
>  /* Exposure control */
>  #define IMX258_REG_EXPOSURE		0x0202
> +#define IMX258_EXPOSURE_OFFSET		10
>  #define IMX258_EXPOSURE_MIN		4
>  #define IMX258_EXPOSURE_STEP		1
>  #define IMX258_EXPOSURE_DEFAULT		0x640
> -#define IMX258_EXPOSURE_MAX		65535
> +#define IMX258_EXPOSURE_MAX		(IMX258_VTS_MAX - IMX258_EXPOSURE_OFFSET)
>
>  /* Analog gain control */
>  #define IMX258_REG_ANALOG_GAIN		0x0204
> @@ -366,7 +367,7 @@ static const struct imx258_reg mode_common_regs[] = {
>  	{ 0x303A, 0x00 },
>  	{ 0x303B, 0x10 },
>  	{ 0x300D, 0x00 },
> -	{ 0x0350, 0x01 },
> +	{ 0x0350, 0x00 },
>  	{ 0x0204, 0x00 },
>  	{ 0x0205, 0x00 },
>  	{ 0x020E, 0x01 },
> @@ -739,6 +740,19 @@ static int imx258_update_digital_gain(struct imx258 *imx258, u32 len, u32 val)
>  	return 0;
>  }
>
> +static void imx258_adjust_exposure_range(struct imx258 *imx258)
> +{
> +	int exposure_max, exposure_def;
> +
> +	/* Honour the VBLANK limits when setting exposure. */
> +	exposure_max = imx258->cur_mode->height + imx258->vblank->val -
> +		       IMX258_EXPOSURE_OFFSET;
> +	exposure_def = min(exposure_max, imx258->exposure->val);
> +	__v4l2_ctrl_modify_range(imx258->exposure, imx258->exposure->minimum,
> +				 exposure_max, imx258->exposure->step,
> +				 exposure_def);
> +}
> +
>  static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct imx258 *imx258 =
> @@ -746,6 +760,13 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
>  	int ret = 0;
>
> +	/*
> +	 * The VBLANK control may change the limits of usable exposure, so check
> +	 * and adjust if necessary.
> +	 */
> +	if (ctrl->id == V4L2_CID_VBLANK)
> +		imx258_adjust_exposure_range(imx258);
> +
>  	/*
>  	 * Applying V4L2 control value only happens
>  	 * when power is up for streaming
> --
> 2.25.1
>
