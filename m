Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDEB6E68CD
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 18:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbjDRQAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 12:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbjDRP7v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 11:59:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCF259FE
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 08:59:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CADB0DE5;
        Tue, 18 Apr 2023 17:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681833569;
        bh=Os6VV2xNZag6aj5YHpY7G1MLfMhF6i8xkSfXswyw18U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dYh7GncZp2C92vd+x7c4N2vULefTdbRgoxLVRjeCNk94TN7065S/CR1ksYIAzuh+Q
         Kt/buPdD94PxHDHD34nKrsdxfU2c/xMHT4o+WrftQ/w9bnd03x/wXpfle+jdEiLl+W
         NzHLzWoAdQlauj8/IJ4YOeBQDIcwt1M7lrnXlE5E=
Date:   Tue, 18 Apr 2023 18:59:47 +0300
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
Subject: Re: [PATCH v3 3/4] media: imx: imx7-media-csi: Lift width
 constraints for 8bpp formats
Message-ID: <20230418155947.GI30837@pendragon.ideasonboard.com>
References: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
 <20230418122041.1318862-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418122041.1318862-4-alexander.stein@ew.tq-group.com>
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

The commit message should state "Lift width constraint for 16bpp
formats". I would also phrase is "Relax" instead of "Lift" as it's not
completely lifted.

On Tue, Apr 18, 2023 at 02:20:40PM +0200, Alexander Stein wrote:
> For 8-bit formats the image_width just needs to be a multiple of 8 pixels
> others just a multiple of 4 pixels.

This is a bit terse, and I think a word or two are missing. It could be
improved:

The driver unconditionally aligns the image width to multiples of 8
pixels. The real alignment constraint is 8 bytes, as indicated by the
CSI_IMAG_PARA.IMAGE_WIDTH documentation that calls for 8 pixel alignment
for 8bpp formats and 4 pixel alignment for other formats.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Fix commit message (Only 8-bit formats needs multiple of 8 pixels)
> 
>  drivers/media/platform/nxp/imx7-media-csi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 1315f5743b76f..730c9c57bf4bc 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1146,6 +1146,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  			 struct v4l2_rect *compose)
>  {
>  	const struct imx7_csi_pixfmt *cc;
> +	u32 walign;
>  
>  	if (compose) {
>  		compose->width = pixfmt->width;
> @@ -1162,13 +1163,19 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
>  	}
>  
> +	/* Refer to CSI_IMAG_PARA.IMAGE_WIDTH description */
> +	if (cc->bpp == 8)
> +		walign = 8;
> +	else
> +		walign = 4;

Would the following convey the purpose better ?

	/*
	 * The width alignment is 8 bytes as indicated by the
	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
	 */
	walign = 8 * 8 / cc->bpp;

> +
>  	/*
>  	 * Round up width for minimum burst size.
>  	 *
>  	 * TODO: Implement configurable stride support, and check what the real
>  	 * hardware alignment constraint on the width is.
>  	 */

We can now drop the second part of the sentence :-) The first line is
actually not very accurate anymore. How about

	/*
	 * The width alignment is 8 bytes as indicated by the
	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
	 *
  	 * TODO: Implement configurable stride support.
	 */
	walign = 8 * 8 / cc->bpp;
	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
			      &pixfmt->height, 1, 0xffff, 1, 0);

> -	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
>  			      &pixfmt->height, 1, 0xffff, 1, 0);
>  
>  	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;

-- 
Regards,

Laurent Pinchart
