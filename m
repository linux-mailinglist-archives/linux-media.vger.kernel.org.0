Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1501D762058
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 19:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjGYRkR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 13:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjGYRkP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 13:40:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FC1193
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 10:40:14 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82A75558;
        Tue, 25 Jul 2023 19:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690306754;
        bh=4f032qP+PoraQ/e8maiWAapYjkYjTCPck/IMWM1pGPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CHNw+ToGkz3dFi+D/7iURyCl4n28CFxNHCrBaHNnbvHR5YqCIarWOI6lcJ4+MQmMF
         DeN6KuLCv/xnD8UaEKkbjB1H/g9gmI95eyjYDdoV0Dr1aCrCVkFUEXhWMuu2w/YmcO
         r/g77iT1zk+e2itbfp6CxXgDpmBuXxvyJYm3ZIHs=
Date:   Tue, 25 Jul 2023 20:40:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] media: imx: imx7-media-csi: Move stepwise framesize
 into a dedicated struct
Message-ID: <20230725174020.GH21640@pendragon.ideasonboard.com>
References: <20230720074129.3680269-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720074129.3680269-1-alexander.stein@ew.tq-group.com>
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

On Thu, Jul 20, 2023 at 09:41:28AM +0200, Alexander Stein wrote:
> This way these constraints can be reused later on.
> No functional change intended.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 26 ++++++++++++---------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 2f9302fc7570..73f8f2a35422 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -260,6 +260,20 @@ imx7_csi_notifier_to_dev(struct v4l2_async_notifier *n)
>  	return container_of(n, struct imx7_csi, notifier);
>  }
>  
> +/*
> + * TODO: The constraints are hardware-specific and may depend on the
> + * pixel format. This should come from the driver using
> + * imx_media_capture.

Addressing this will not be possible with a single v4l2_frmsize_stepwise
instance, so I'd rather address the TODO first.

> + */
> +static const struct v4l2_frmsize_stepwise imx7_csi_frmsize_stepwise = {
> +	.min_width = 1,
> +	.min_height = 1,
> +	.max_width = 65535,
> +	.max_height = 65535,
> +	.step_width = 1,
> +	.step_height = 1,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Hardware Configuration
>   */
> @@ -1082,18 +1096,8 @@ static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
>  	if (!cc)
>  		return -EINVAL;
>  
> -	/*
> -	 * TODO: The constraints are hardware-specific and may depend on the
> -	 * pixel format. This should come from the driver using
> -	 * imx_media_capture.
> -	 */
>  	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> -	fsize->stepwise.min_width = 1;
> -	fsize->stepwise.max_width = 65535;
> -	fsize->stepwise.min_height = 1;
> -	fsize->stepwise.max_height = 65535;
> -	fsize->stepwise.step_width = 1;
> -	fsize->stepwise.step_height = 1;
> +	fsize->stepwise = imx7_csi_frmsize_stepwise;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
