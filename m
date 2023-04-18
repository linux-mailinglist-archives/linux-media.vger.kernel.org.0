Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F006E5D4D
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 11:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjDRJ1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 05:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjDRJ1K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 05:27:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A22A40FD
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 02:27:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69CE8127D;
        Tue, 18 Apr 2023 11:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681810017;
        bh=CEWE6bS169TvR/IamoEYF8O3xwFO92MYBUqJRrseEck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JFAluhX7iRgnGFs70FjUyaFLQMmMsTGtyvlYQjGuwybVW4RrRrJ8wYI49xkjCveao
         sFr/Yji4jL9w06Reuoae3fLyKpk/7I/CNmr72PQS/uWAcVbQZVF6LYUdYqjmbLBnyR
         WdKg+Hgm8Y6ngHt6IwkuKWweT3h0/ynD35eoboT4=
Date:   Tue, 18 Apr 2023 12:27:13 +0300
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
Subject: Re: [PATCH v2 1/3] media: imx: imx7-media-csi: Get rid of
 superfluous call to imx7_csi_mbus_fmt_to_pix_fmt
Message-ID: <20230418092713.GA26319@pendragon.ideasonboard.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
 <20230418071439.197735-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418071439.197735-2-alexander.stein@ew.tq-group.com>
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

On Tue, Apr 18, 2023 at 09:14:37AM +0200, Alexander Stein wrote:
> There is no need to convert input pixformat to mbus_framefmt and back
> again. Instead apply pixformat width contrains directly.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index b701e823436a8..bd649fd9166fd 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1145,8 +1145,8 @@ static const struct imx7_csi_pixfmt *
>  __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  			 struct v4l2_rect *compose)
>  {
> -	struct v4l2_mbus_framefmt fmt_src;
>  	const struct imx7_csi_pixfmt *cc;
> +	u32 stride;
>  
>  	/*
>  	 * Find the pixel format, default to the first supported format if not
> @@ -1172,12 +1172,16 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  		}
>  	}
>  
> -	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
> -	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);

Could you please keep the comment from imx7_csi_mbus_fmt_to_pix_fmt()
here, to indicate where the alignment comes from ?

	/* Round up width for minimum burst size */

We should likely revisit this in the future, I don't think the alignment
is actually needed. This could be recorded already:

	/*
	 * Round up width for minimum burst size.
	 *
	 * TODO: Implement configurable stride support, and check what the real
	 * hardware alignment constraint on the width is.
	 */

> +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> +			      &pixfmt->height, 1, 0xffff, 1, 0);
> +
> +	stride = round_up((pixfmt->width * cc->bpp) / 8, 8);

You can drop the round_up(), as pixfmt->width is now a multiple of 8, so

	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;

> +	pixfmt->bytesperline = stride;
> +	pixfmt->sizeimage = stride * pixfmt->height;
>  
>  	if (compose) {
> -		compose->width = fmt_src.width;
> -		compose->height = fmt_src.height;
> +		compose->width = pixfmt->width;

This is a change of behaviour, compose->width used to be set to the
unaligned width.

> +		compose->height = pixfmt->height;
>  	}
>  
>  	return cc;

-- 
Regards,

Laurent Pinchart
