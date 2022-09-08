Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB365B1376
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 06:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiIHEVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 00:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiIHEUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 00:20:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99835CD517
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 21:17:49 -0700 (PDT)
Received: from pyrite.rasen.tech (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA5C96CC;
        Thu,  8 Sep 2022 06:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662610574;
        bh=bvDVW2xnM8/ge75nw8Era0XezorvXgg7ExY/SqlbxP8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IXq52bcF/hKbXvDToDItiKnwai/5GWAduzilYye46bTs3pYdUfCl0GsMExI8Cgcmt
         wQWvAWLqhSSZ2HRd0/OWaAovjWL7hte2awr6BvjRBYtXnNRbdhHDks5bHRGEnUZ8bf
         8ewoze+PebguRhQIJFdHPIyQIifcm/8n9pHbAdVk=
Date:   Thu, 8 Sep 2022 13:16:06 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 6/6] staging: media: imx: Make imx_media_of_add_csi()
 static
Message-ID: <20220908041606.GJ1140330@pyrite.rasen.tech>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
 <20220907200424.32136-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907200424.32136-7-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 11:04:24PM +0300, Laurent Pinchart wrote:
> The imx_media_of_add_csi() function is only called in its compilation
> unit. Make it static and don't export it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-of.c | 5 ++---
>  drivers/staging/media/imx/imx-media.h    | 2 --
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
> index 59f1eb7b62bc..92a99010c150 100644
> --- a/drivers/staging/media/imx/imx-media-of.c
> +++ b/drivers/staging/media/imx/imx-media-of.c
> @@ -16,8 +16,8 @@
>  #include <video/imx-ipu-v3.h>
>  #include "imx-media.h"
>  
> -int imx_media_of_add_csi(struct imx_media_dev *imxmd,
> -			 struct device_node *csi_np)
> +static int imx_media_of_add_csi(struct imx_media_dev *imxmd,
> +				struct device_node *csi_np)
>  {
>  	struct v4l2_async_subdev *asd;
>  	int ret = 0;
> @@ -41,7 +41,6 @@ int imx_media_of_add_csi(struct imx_media_dev *imxmd,
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(imx_media_of_add_csi);
>  
>  int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
>  			     struct device_node *np)
> diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
> index 5a1436dbb12d..c12ecaf378fe 100644
> --- a/drivers/staging/media/imx/imx-media.h
> +++ b/drivers/staging/media/imx/imx-media.h
> @@ -252,8 +252,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
>  /* imx-media-of.c */
>  int imx_media_add_of_subdevs(struct imx_media_dev *dev,
>  			     struct device_node *np);
> -int imx_media_of_add_csi(struct imx_media_dev *imxmd,
> -			 struct device_node *csi_np);
>  
>  /* imx-media-vdic.c */
>  struct v4l2_subdev *imx_media_vdic_register(struct v4l2_device *v4l2_dev,
