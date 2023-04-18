Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1968E6E5D86
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 11:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjDRJhN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 05:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjDRJhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 05:37:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C921BD
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 02:37:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECAF0127D;
        Tue, 18 Apr 2023 11:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681810623;
        bh=BuvVA/eUtX+MtG0B7mDmn50EABHQOACAO6fOd96O2BY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HZ2kZlXKA5SXkaJEqnJH1DZOb5cHGH9uNJpGtFXy1jlcAq7iWOrHrfWUc1R/VeNTG
         /x8QFI3au/eflskDI/2KEtuPamvkKSwU7dUY/XYt3VQW25BHe7mp4evr8dLvdq1cOT
         NVXBrnft6Y2nagqNrFzsZiZFfDyEZDKPOjAZuSpQ=
Date:   Tue, 18 Apr 2023 12:37:21 +0300
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
Subject: Re: [PATCH v2 3/3] media: imx: imx7-media-csi: Lift width
 constraints for 8bpp formats
Message-ID: <20230418093721.GB11510@pendragon.ideasonboard.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
 <20230418071439.197735-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418071439.197735-4-alexander.stein@ew.tq-group.com>
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

On Tue, Apr 18, 2023 at 09:14:39AM +0200, Alexander Stein wrote:
> For 8-bit formats the image_width just needs to be a multiple of 4 pixels.

This doesn't match the code below. I think the code is right, the commit
message should be updated.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 1508f6ba20e91..5240670476b2b 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1147,6 +1147,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  {
>  	const struct imx7_csi_pixfmt *cc;
>  	u32 stride;
> +	u32 walign;
>  
>  	/*
>  	 * Find the pixel format, default to the first supported format if not
> @@ -1172,7 +1173,13 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  		}
>  	}
>  
> -	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> +	/* Refer to CSI_IMAG_PARA.IMAGE_WIDTH description */
> +	if (cc->bpp == 8)
> +		walign = 8;
> +	else
> +		walign = 4;
> +
> +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
>  			      &pixfmt->height, 1, 0xffff, 1, 0);
>  
>  	stride = round_up((pixfmt->width * cc->bpp) / 8, 8);

-- 
Regards,

Laurent Pinchart
