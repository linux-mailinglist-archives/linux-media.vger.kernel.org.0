Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EABA46880D3
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 15:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbjBBO6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 09:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbjBBO6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 09:58:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88D62685
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 06:58:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25258505;
        Thu,  2 Feb 2023 15:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675349925;
        bh=ekaZOp16UFLLjlDQ3ZT6OXcKjRNIexK9IMu3Aziu9bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pN6Ow0d3uO0MliSwNSPd1EFAXGEgqxbkV5gUzyaX606UGm7YclBge8s5nMBUQgr8/
         y7g/OuZGQKR43FljZBMkuvtFtVYmljQ+HUtrnVMPPw0Qhgy257rQwj/ZKKD/YQ4dWA
         ppdJmHQUMnEgMsWmPtEryvmyR87If+U5oa3lIg34=
Date:   Thu, 2 Feb 2023 16:58:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 07/11] media: i2c: imx290: Convert V4L2_CID_HBLANK to
 read/write
Message-ID: <Y9vPo0UHCCx99LpX@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-8-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-8-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Tue, Jan 31, 2023 at 07:20:12PM +0000, Dave Stevenson wrote:
> The driver exposed V4L2_CID_HBLANK as a read only control to allow
> for exposure calculations and determination of the frame rate.
> 
> Convert to a read/write control so that the frame rate can be
> controlled.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 9ddd6382b127..9006be6e5e7c 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -47,6 +47,7 @@
>  #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
>  #define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
>  #define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
> +#define IMX290_HMAX_MAX					0xffff
>  #define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
>  #define IMX290_WINWV_OB					IMX290_REG_8BIT(0x303a)
>  #define IMX290_WINPV					IMX290_REG_16BIT(0x303c)
> @@ -167,7 +168,7 @@ struct imx290_regval {
>  struct imx290_mode {
>  	u32 width;
>  	u32 height;
> -	u32 hmax;
> +	u32 hmax_min;
>  	u8 link_freq_index;
>  
>  	const struct imx290_regval *data;
> @@ -410,7 +411,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  	{
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 2200,
> +		.hmax_min = 2200,

I didn't find in the documentation a mention that these values are the
minimum the sensor supports. Did you use them as such based on the fact
that anything higher than the nominal hblank value reported by the
datasheet is hopefully guaranteed to work, and lower values are
uncharted territory, or are these the real minimums ? I'm fine using
them as minimum for now even if we could possibly go lower, leaving that
for future patches. I would however mention this in a comment or in the
commit message.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -418,7 +419,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
>  	{
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 3300,
> +		.hmax_min = 3300,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -429,7 +430,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  	{
>  		.width = 1920,
>  		.height = 1080,
> -		.hmax = 2200,
> +		.hmax_min = 2200,
>  		.link_freq_index = FREQ_INDEX_1080P,
>  		.data = imx290_1080p_settings,
>  		.data_size = ARRAY_SIZE(imx290_1080p_settings),
> @@ -437,7 +438,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
>  	{
>  		.width = 1280,
>  		.height = 720,
> -		.hmax = 3300,
> +		.hmax_min = 3300,
>  		.link_freq_index = FREQ_INDEX_720P,
>  		.data = imx290_720p_settings,
>  		.data_size = ARRAY_SIZE(imx290_720p_settings),
> @@ -686,6 +687,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		}
>  		break;
>  
> +	case V4L2_CID_HBLANK:
> +		ret = imx290_write(imx290, IMX290_HMAX,
> +				   ctrl->val + imx290->current_mode->width,
> +				   NULL);
> +		break;
> +
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -716,12 +723,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  			       const struct v4l2_mbus_framefmt *format,
>  			       const struct imx290_mode *mode)
>  {
> -	unsigned int hblank = mode->hmax - mode->width;
> +	unsigned int hblank_min = mode->hmax_min - mode->width;
> +	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
>  	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
>  
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  
> -	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
> +	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
> +				 hblank_min);
>  	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
>  }
>  
> @@ -778,10 +787,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
>  				     0, 0, imx290_test_pattern_menu);
>  
> +	/*
> +	 * Actual range will be set from imx290_ctrl_update later in the probe.
> +	 */
>  	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_HBLANK, 1, 1, 1, 1);
> -	if (imx290->hblank)
> -		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
>  	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_VBLANK, 1, 1, 1, 1);
> @@ -850,11 +860,6 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  		return ret;
>  	}
>  
> -	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
> -			   NULL);
> -	if (ret)
> -		return ret;
> -
>  	/* Apply customized values from user */
>  	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
>  	if (ret) {

-- 
Regards,

Laurent Pinchart
