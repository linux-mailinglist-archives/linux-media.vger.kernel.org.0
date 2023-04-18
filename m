Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09AE86E6874
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 17:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjDRPnn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 11:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjDRPnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 11:43:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B03E7A94
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 08:43:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 435F6DE5;
        Tue, 18 Apr 2023 17:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681832614;
        bh=uBd0wd3V/F43OQg2BlwGoXpIZo7ZOfhMPvTB8IyNsH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hpGC8UcUgr6V8RfiEafwzXzr+gT9fO7klUfWjtBZQtzriq5Zx4rqvCONv+nRsDp3B
         KEuuXojU0bwQDlR0JKEEcyZ+N0p+j0d/m+njiN5dyXozOxmgAfkifLXtZIBad34HjC
         +hIhsoVOS12mja/GfEhKRFqXBTC2tZ30wNNJnCjc=
Date:   Tue, 18 Apr 2023 18:43:51 +0300
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
Subject: Re: [PATCH v3 2/4] media: imx: imx7-media-csi: Remove interlave
 fields
Message-ID: <20230418154351.GH30837@pendragon.ideasonboard.com>
References: <20230418122041.1318862-1-alexander.stein@ew.tq-group.com>
 <20230418122041.1318862-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230418122041.1318862-3-alexander.stein@ew.tq-group.com>
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

In the subject line, "interlave" is misspelled. I'd write "Remove
incorrect interlacing support"

On Tue, Apr 18, 2023 at 02:20:39PM +0200, Alexander Stein wrote:
> Interlaced mode is currently not supported, so disable fields in try_fmt.

And here,

The driver doesn't currently support interlacing, but due to legacy
leftovers, it accepts values for the pixel format "field" field other
than V4L2_FIELD_NONE. Fix it by hardcoding V4L2_FIELD_NONE. Proper
interlacing support can be implemented later if desired.

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I can apply those changes directly to my tree if you would prefer
avoiding a v4.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Remove left-over interlace mode check
> 
>  drivers/media/platform/nxp/imx7-media-csi.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index b149374b07ee1..1315f5743b76f 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1162,20 +1162,6 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
>  	}
>  
> -	/* Allow IDMAC interweave but enforce field order from source. */
> -	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
> -		switch (pixfmt->field) {
> -		case V4L2_FIELD_SEQ_TB:
> -			pixfmt->field = V4L2_FIELD_INTERLACED_TB;
> -			break;
> -		case V4L2_FIELD_SEQ_BT:
> -			pixfmt->field = V4L2_FIELD_INTERLACED_BT;
> -			break;
> -		default:
> -			break;
> -		}
> -	}
> -
>  	/*
>  	 * Round up width for minimum burst size.
>  	 *
> @@ -1187,6 +1173,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  
>  	pixfmt->bytesperline = pixfmt->width * cc->bpp / 8;
>  	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
> +	pixfmt->field = V4L2_FIELD_NONE;
>  
>  	return cc;
>  }

-- 
Regards,

Laurent Pinchart
