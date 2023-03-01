Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEEDE6A69A2
	for <lists+linux-media@lfdr.de>; Wed,  1 Mar 2023 10:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjCAJRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Mar 2023 04:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCAJRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Mar 2023 04:17:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE1D16313
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 01:17:42 -0800 (PST)
Received: from ideasonboard.com (host-87-18-61-24.retail.telecomitalia.it [87.18.61.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADBD5890;
        Wed,  1 Mar 2023 10:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677662259;
        bh=/kRYmRS9KcxvsjmYM+aezyNc3RUi4SWPWqIOhcQCQsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vhtmtHrl99ktAa87UKNCKiOiD+rXWiqUE9u6eJohFePdXEnCL4sAJbGcF9mPFLpdL
         Hu3LiDa3yxs22yArDEU2VjMHS+iYgc2qNmLuyg3MF2nPN4QFwyo9F7f3DHIULNoZig
         NZ/CXJdQzmkZu6/hUKTPGgw95hkjSzq8d8aS05hs=
Date:   Wed, 1 Mar 2023 10:17:36 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v2 1/4] media: ti: cal: Clean up mbus formats uses
Message-ID: <20230301091736.jo2gjm7uu34dcbfp@uno.localdomain>
References: <20230228171620.330978-1-tomi.valkeinen@ideasonboard.com>
 <20230228171620.330978-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230228171620.330978-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Tue, Feb 28, 2023 at 07:16:17PM +0200, Tomi Valkeinen wrote:
> Clean up the CAL drivers uses of mbus formats:
>
> - Switch all YUV formats from 2X8 formats to 1X16, as those are what
>   should be used for CSI-2 bus.
>
> - Drop 24 and 32 bit formats, as the driver doesn't support them (see
>   cal_ctx_pix_proc_config()).
>
> - Switch RGB565_2X8_LE to RGB565_1X16 (for the same reason as for the
>   YUV formats) and drop RGB565_2X8_BE as it cannot be supported with
>   CSI-2.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti/cal/cal-camerarx.c |  2 +-
>  drivers/media/platform/ti/cal/cal-video.c    |  2 +-
>  drivers/media/platform/ti/cal/cal.c          | 34 +++-----------------
>  3 files changed, 7 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 16ae52879a79..267089b0fea0 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -817,7 +817,7 @@ static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
>  		.format = {
>  			.width = 640,
>  			.height = 480,
> -			.code = MEDIA_BUS_FMT_UYVY8_2X8,
> +			.code = MEDIA_BUS_FMT_UYVY8_1X16,
>  			.field = V4L2_FIELD_NONE,
>  			.colorspace = V4L2_COLORSPACE_SRGB,
>  			.ycbcr_enc = V4L2_YCBCR_ENC_601,
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index ca906a9e4222..ed92e23d4b16 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -894,7 +894,7 @@ static int cal_ctx_v4l2_init_mc_format(struct cal_ctx *ctx)
>  	const struct cal_format_info *fmtinfo;
>  	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
>
> -	fmtinfo = cal_format_by_code(MEDIA_BUS_FMT_UYVY8_2X8);
> +	fmtinfo = cal_format_by_code(MEDIA_BUS_FMT_UYVY8_1X16);
>  	if (!fmtinfo)
>  		return -EINVAL;
>
> diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
> index 1236215ec70e..760c58cb3b3e 100644
> --- a/drivers/media/platform/ti/cal/cal.c
> +++ b/drivers/media/platform/ti/cal/cal.c
> @@ -61,48 +61,24 @@ MODULE_PARM_DESC(mc_api, "activates the MC API");
>  const struct cal_format_info cal_formats[] = {
>  	{
>  		.fourcc		= V4L2_PIX_FMT_YUYV,
> -		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
> +		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
>  		.bpp		= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_UYVY,
> -		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
> +		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
>  		.bpp		= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_YVYU,
> -		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
> +		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
>  		.bpp		= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_VYUY,
> -		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
> +		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
>  		.bpp		= 16,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */

I would drop the comment as it's confusing. As far as I understand it
the RGB565 transmission/reception mode is define uniquely by the CSI-2
specification and the comment here does not match "Figure 112 RGB565
Data Format Reception"

Otherwise
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> -		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
> +		.code		= MEDIA_BUS_FMT_RGB565_1X16,
>  		.bpp		= 16,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_RGB565X, /* rrrrrggg gggbbbbb */
> -		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
> -		.bpp		= 16,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_RGB555, /* gggbbbbb arrrrrgg */
> -		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
> -		.bpp		= 16,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_RGB555X, /* arrrrrgg gggbbbbb */
> -		.code		= MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
> -		.bpp		= 16,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_RGB24, /* rgb */
> -		.code		= MEDIA_BUS_FMT_RGB888_2X12_LE,
> -		.bpp		= 24,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_BGR24, /* bgr */
> -		.code		= MEDIA_BUS_FMT_RGB888_2X12_BE,
> -		.bpp		= 24,
> -	}, {
> -		.fourcc		= V4L2_PIX_FMT_RGB32, /* argb */
> -		.code		= MEDIA_BUS_FMT_ARGB8888_1X32,
> -		.bpp		= 32,
>  	}, {
>  		.fourcc		= V4L2_PIX_FMT_SBGGR8,
>  		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> --
> 2.34.1
>
