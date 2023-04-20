Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B536E905A
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 12:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234899AbjDTKgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 06:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbjDTKfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 06:35:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF12593C7
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 03:32:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D797D5AA;
        Thu, 20 Apr 2023 12:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681986765;
        bh=z7JqXntV/ozWgmPY7FKQzTroECPSQd/UrgMWJu9QwCU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CjYX1o9/oyXR7PwvrTi9iTQBg3KULtvrYLoeN+5iEcRV+4F02eljvlXHTKqI6uPK1
         YUdYdGt2ul/YMuKz5LaOcfyFssjRYwa3+yrgueEfiCBFgdkZHdfx4oKU+O4k962NrM
         kLDB2DxAHurUpgLiJGadaADTzioYmDJ4OvWMC7wc=
Date:   Thu, 20 Apr 2023 13:33:05 +0300
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
Subject: Re: [PATCH v4 3/4] media: imx: imx7-media-csi: Relax width
 constraints for non-8bpp formats
Message-ID: <20230420103305.GC11005@pendragon.ideasonboard.com>
References: <20230419070712.1422335-1-alexander.stein@ew.tq-group.com>
 <20230419070712.1422335-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230419070712.1422335-4-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Wed, Apr 19, 2023 at 09:07:11AM +0200, Alexander Stein wrote:
> The driver unconditionally aligns the image width to multiples of 8
> pixels. The real alignment constraint is 8 bytes, as indicated by the
> CSI_IMAG_PARA.IMAGE_WIDTH documentation that calls for 8 pixel alignment
> for 8bpp formats and 4 pixel alignment for other formats.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v4:
> * Improve commit message
> * Simplify walign calculation
> * Remove comment on hardware alignment constraints
> 
>  drivers/media/platform/nxp/imx7-media-csi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 1315f5743b76f..e6abbfbc5c129 100644
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
> @@ -1163,12 +1164,13 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  	}
>  
>  	/*
> -	 * Round up width for minimum burst size.
> +	 * The width alignment is 8 bytes as indicated by the
> +	 * CSI_IMAG_PARA.IMAGE_WIDTH documentation. Convert it to pixels.
>  	 *
> -	 * TODO: Implement configurable stride support, and check what the real
> -	 * hardware alignment constraint on the width is.
> +	 * TODO: Implement configurable stride support.
>  	 */
> -	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, 8,
> +	walign = 8 * 8 / cc->bpp;
> +	v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
>  			      &pixfmt->height, 1, 0xffff, 1, 0);
>  
>  	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;

-- 
Regards,

Laurent Pinchart
