Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE39E7185EA
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjEaPQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234293AbjEaPQX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:16:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F9998;
        Wed, 31 May 2023 08:16:22 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 943D5844;
        Wed, 31 May 2023 17:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685546159;
        bh=HeXBZlYluFZrJepoAl3Q51k415r93t0ilHotlcCj12w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QHjHFLqPSCT8DgU5wqBmdQ6CTOhcwzCCBXDZAoxOai61XmZRglnleAiI+OIlggxn+
         +CxmMiLRXg5AP3mngp2PMsXCJ5NLrF7vAex5D8Psrn1/Is4r2Z5EWb4uDZdJ2Vv3as
         ac6VGsOIIbh3r72N1qBdzhDJQunCr8VRhG9VT53c=
Date:   Wed, 31 May 2023 17:16:17 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/21] media: i2c: imx258: Make V4L2_CID_VBLANK
 configurable.
Message-ID: <vnwwrfgwr5ueiheqsnvxz7sh3qjcftocjjxdghvrigfmlss4yu@5xq3tppv4pxg>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-7-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-7-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:45PM +0100, Dave Stevenson wrote:
> The values and ranges of V4L2_CID_VBLANK are all computed,
> so there is no reason for it to be a read only control.
> Remove the register values from the mode lists, add the
> handler, and remove the read only flag.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 30bae7388c3a..c6fb649abb95 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -30,6 +30,8 @@
>  #define IMX258_VTS_30FPS_VGA		0x034c
>  #define IMX258_VTS_MAX			0xffff
>
> +#define IMX258_REG_VTS			0x0340
> +
>  /* HBLANK control - read only */
>  #define IMX258_PPL_DEFAULT		5352
>
> @@ -202,8 +204,6 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
>  	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x14 },
>  	{ 0x0343, 0xE8 },
> -	{ 0x0340, 0x0C },
> -	{ 0x0341, 0x50 },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x00 },
>  	{ 0x0346, 0x00 },
> @@ -319,8 +319,6 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
>  	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x14 },
>  	{ 0x0343, 0xE8 },
> -	{ 0x0340, 0x06 },
> -	{ 0x0341, 0x38 },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x00 },
>  	{ 0x0346, 0x00 },
> @@ -436,8 +434,6 @@ static const struct imx258_reg mode_1048_780_regs[] = {
>  	{ 0x0114, 0x03 },
>  	{ 0x0342, 0x14 },
>  	{ 0x0343, 0xE8 },
> -	{ 0x0340, 0x03 },
> -	{ 0x0341, 0x4C },
>  	{ 0x0344, 0x00 },
>  	{ 0x0345, 0x00 },
>  	{ 0x0346, 0x00 },
> @@ -803,6 +799,11 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
>  					       BIT(IMX258_HDR_RATIO_MAX));
>  		}
>  		break;
> +	case V4L2_CID_VBLANK:

Should a new vblank value change the exposure limits too ?

> +		ret = imx258_write_reg(imx258, IMX258_REG_VTS,
> +				       IMX258_REG_VALUE_16BIT,
> +				       imx258->cur_mode->height + ctrl->val);
> +		break;
>  	default:
>  		dev_info(&client->dev,
>  			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> @@ -1214,9 +1215,6 @@ static int imx258_init_controls(struct imx258 *imx258)
>  				IMX258_VTS_MAX - imx258->cur_mode->height, 1,
>  				vblank_def);
>
> -	if (imx258->vblank)
> -		imx258->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
>  	imx258->hblank = v4l2_ctrl_new_std(
>  				ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_HBLANK,
>  				IMX258_PPL_DEFAULT - imx258->cur_mode->width,
> --
> 2.25.1
>
