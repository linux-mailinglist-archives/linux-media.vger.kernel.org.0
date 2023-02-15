Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B691697B33
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 12:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjBOLy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 06:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbjBOLy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 06:54:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D175437705
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 03:54:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DE8710B;
        Wed, 15 Feb 2023 12:54:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676462058;
        bh=+vQMFODfxX/xB8133Ol0weU0/YwtVH8NCjCF91UbhrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WASFWyyXUxLbLEv1qfQvieWnMd3rhNTL9PvkXPFTM6KCWPnMOaNkTNOLjl16JXbUF
         iAo2DlORHCvY80+r9XHl0OOGiapvyQgGJzvvGJtbDEF75VA05FQ33jK6kHa+VgyHYn
         mTDyxf9Oi378rtZJF2B6dz9v4Nd+z1ebNM3uxWag=
Date:   Wed, 15 Feb 2023 13:54:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] media: imx-mipi-csis: Check csis_fmt validity before
 use
Message-ID: <Y+zH6VAhgsfZgX8s@pendragon.ideasonboard.com>
References: <20230214233233.177122-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230214233233.177122-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Wed, Feb 15, 2023 at 12:32:33AM +0100, Marek Vasut wrote:
> The find_csis_format() may return NULL in case supported format is not
> found, check the return value of find_csis_format() before using the
> result to avoid NULL pointer dereference.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Fixes: 11927d0fd0d0 ("media: imx-mipi-csis: Use V4L2 subdev active state")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> ---
> V2: Add blank line
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index e99633565463e..2731ae94cb031 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1109,6 +1109,9 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>  	csis_fmt = find_csis_format(fmt->code);
>  	v4l2_subdev_unlock_state(state);
>  
> +	if (!csis_fmt)
> +		return -EINVAL;

I miss this when reviewing v1, would -EPIPE be a better error code ?
Essentially, this error occurs when trying to start a pipeline where the
sensor has been configured to produce a format not supported by the
CSI-2 receiver. -EINVAL being used everywhere, it makes it more
difficult for users to figure out where the failure may come from. We
already use -EPIPE in many places when validating the pipeline, so I
think it would be an appropriate option here.

If you're fine with this there's no need to send a v3, I'll update the
error code in the pull request.

> +
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
>  	fd->num_entries = 1;
>  

-- 
Regards,

Laurent Pinchart
