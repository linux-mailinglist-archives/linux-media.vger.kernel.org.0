Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4666673DC
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 15:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233983AbjALOAY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 09:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbjALN7z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 08:59:55 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872D25132B
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 05:59:47 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pFy7N-00045E-R4; Thu, 12 Jan 2023 14:59:45 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pFy7N-0006t1-H7; Thu, 12 Jan 2023 14:59:45 +0100
Date:   Thu, 12 Jan 2023 14:59:45 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v1 3/6] media: imx-pxp: Pass pixel format value to
 find_format()
Message-ID: <20230112135945.GO24101@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        kernel@pengutronix.de, linux-imx@nxp.com
References: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com>
 <20230106133227.13685-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230106133227.13685-4-laurent.pinchart@ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 06 Jan 2023 15:32:24 +0200, Laurent Pinchart wrote:
> The find_format() function looks up format information for a given pixel
> format. It takes a v4l2_format pointer, but only uses the contained
> pixel format value. To prepare it for being used by callers that don't
> have v4l2_format, modify it to take the pixel format value directly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/nxp/imx-pxp.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 132065c8b8b4..fd4c055c01eb 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -176,14 +176,14 @@ enum {
>  	V4L2_M2M_DST = 1,
>  };
>  
> -static struct pxp_fmt *find_format(struct v4l2_format *f)
> +static struct pxp_fmt *find_format(unsigned int pixelformat)
>  {
>  	struct pxp_fmt *fmt;
>  	unsigned int k;
>  
>  	for (k = 0; k < NUM_FORMATS; k++) {
>  		fmt = &formats[k];
> -		if (fmt->fourcc == f->fmt.pix.pixelformat)
> +		if (fmt->fourcc == pixelformat)
>  			break;
>  	}
>  
> @@ -1268,10 +1268,10 @@ static int pxp_try_fmt_vid_cap(struct file *file, void *priv,
>  	struct pxp_fmt *fmt;
>  	struct pxp_ctx *ctx = file2ctx(file);
>  
> -	fmt = find_format(f);
> +	fmt = find_format(f->fmt.pix.pixelformat);
>  	if (!fmt) {
>  		f->fmt.pix.pixelformat = formats[0].fourcc;
> -		fmt = find_format(f);
> +		fmt = find_format(f->fmt.pix.pixelformat);
>  	}
>  	if (!(fmt->types & MEM2MEM_CAPTURE)) {
>  		v4l2_err(&ctx->dev->v4l2_dev,
> @@ -1296,10 +1296,10 @@ static int pxp_try_fmt_vid_out(struct file *file, void *priv,
>  	struct pxp_fmt *fmt;
>  	struct pxp_ctx *ctx = file2ctx(file);
>  
> -	fmt = find_format(f);
> +	fmt = find_format(f->fmt.pix.pixelformat);
>  	if (!fmt) {
>  		f->fmt.pix.pixelformat = formats[0].fourcc;
> -		fmt = find_format(f);
> +		fmt = find_format(f->fmt.pix.pixelformat);
>  	}
>  	if (!(fmt->types & MEM2MEM_OUTPUT)) {
>  		v4l2_err(&ctx->dev->v4l2_dev,
> @@ -1332,7 +1332,7 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
>  		return -EBUSY;
>  	}
>  
> -	q_data->fmt		= find_format(f);
> +	q_data->fmt		= find_format(f->fmt.pix.pixelformat);
>  	q_data->width		= f->fmt.pix.width;
>  	q_data->height		= f->fmt.pix.height;
>  	q_data->bytesperline	= f->fmt.pix.bytesperline;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
