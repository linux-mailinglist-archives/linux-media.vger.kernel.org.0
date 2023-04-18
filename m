Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA236E685D
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 17:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjDRPgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 11:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbjDRPgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 11:36:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D471D13849
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 08:35:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EC91DE5;
        Tue, 18 Apr 2023 17:35:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681832101;
        bh=29CZDdB3OmL7lnZ3wrZfr9S5Q96+fW831dciXVD/HpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S+QN1d6IRVsc21sLlcFTuAqKtF3R2ec0YCJqpqVQkRK9TQfxCF/TQkcNRSFbqTS5K
         87uV/THfd1dHFRdM/B0VOW8f1uFzpwnFvUDeoM3DvLhXuKbcwwy5nuFdeLB/34SSTk
         xrmO6+S0SVJwaJX32k+eE0UGMWFaGf4DZRlPndWo=
Date:   Tue, 18 Apr 2023 18:35:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] media: imx: imx7-media-csi: Get rid of
 superfluous call to imx7_csi_mbus_fmt_to_pix_fmt
Message-ID: <20230418153518.GG30837@pendragon.ideasonboard.com>
References: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
 <20230418122041.1318862-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418122041.1318862-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Tue, Apr 18, 2023 at 02:20:38PM +0200, Alexander Stein wrote:
> There is no need to convert input pixformat to mbus_framefmt and back
> again. Instead apply pixformat width constrains directly.
> Assign compose values before adjusting pixformat height/width.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v3:
> * Move compose assignment before width adjustments
> * Add comments regarding width multiples
> * Remove unneeded stride rounding
> 
>  drivers/media/platform/nxp/imx7-media-csi.c | 22 ++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index b701e823436a8..b149374b07ee1 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1145,9 +1145,13 @@ static const struct imx7_csi_pixfmt *
>  __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  			 struct v4l2_rect *compose)
>  {
> -	struct v4l2_mbus_framefmt fmt_src;
>  	const struct imx7_csi_pixfmt *cc;
>  
> +	if (compose) {
> +		compose->width = pixfmt->width;
> +		compose->height = pixfmt->height;
> +	}
> +
>  	/*
>  	 * Find the pixel format, default to the first supported format if not
>  	 * found.
> @@ -1172,13 +1176,17 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  		}
>  	}
>  
> -	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
> -	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
> +	/*
> +	 * Round up width for minimum burst size.
> +	 *
> +	 * TODO: Implement configurable stride support, and check what the real
> +	 * hardware alignment constraint on the width is.
> +	 */
> +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> +			      &pixfmt->height, 1, 0xffff, 1, 0);
>  
> -	if (compose) {
> -		compose->width = fmt_src.width;
> -		compose->height = fmt_src.height;
> -	}
> +	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
> +	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
>  
>  	return cc;
>  }

-- 
Regards,

Laurent Pinchart
