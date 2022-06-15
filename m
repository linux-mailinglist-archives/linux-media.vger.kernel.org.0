Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32D5B54D588
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 01:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242636AbiFOXxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 19:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiFOXxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 19:53:19 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFAB3DA4C
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 16:53:18 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m16-20020a7bca50000000b0039c8a224c95so8833wml.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 16:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SwLgeO2DRkI4jTe8Ajc8o3XnOaXvWhj/GIBwxwxNgpU=;
        b=dBDGjAdjAyzp+iYdGh34R9Su1+rNbLTqpIDC10ZgVIOaG1cMAiaF+JUs24nZzzZXj3
         KHXJKcyp3aY5ofGknRy0dLdXnB4EoJhGo0ZRYUG93l3vQSXMwVCZIWdBxdve/Oiv/boo
         uimW5sZwutJuP2uUtuIPiaRTsLhBDcxUfdeXRg1HVfnzUUcO7QiMYrIi5bVXd5s5s71w
         pyCjgRIYUX5JFEtDFOyt38nhubsEtjC/A28A3tnEdJspUDf9X7WER1Q5NCV2/9LoDDy3
         p9J710FJqFbxL+Myneqd+mFGFep8DPjZvWB4dAu9EM6nykmxZ2twYzke1WKSFnV5i4qC
         4bTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SwLgeO2DRkI4jTe8Ajc8o3XnOaXvWhj/GIBwxwxNgpU=;
        b=2MXUQso1lQr/HUhFzje8H+BRHI23OHucdqmT/FSWmRYNAqhqVf2bPKD0AZ8DjYN7aM
         xOeiPItp7WKqvkjpAuqQGzDaaoXA6CWuigjOSY0jcXV2W7+eGXDeTPZbWlKTSSW3f+HH
         KAwunYyxPfD40/CtCaF6Pi6Zb1u+BogYyGalPA5+20Hh+QV9O6GSQgXZTtkEUArNtEsO
         cTBNPg+op5XNo0HNen7tX6uToipuTwAqeJ2bMbnoM9w0IZ3lVtJMD4PDXEW9jWnO45SX
         5w49Xiy32GYWb9PmvW+VNkjl1lcqEux4WahDZ71eEzptIubXNwleW5X1qlFPtrP0gLmu
         Nvng==
X-Gm-Message-State: AOAM531jJmdCSF/OnNMKVlOiiIAtxX5x7T//uUIqtld+LFC/+ddLPsQO
        v00gls/4GsvdzbIDnv/6WHQ=
X-Google-Smtp-Source: ABdhPJy8F2+fKv1C5gq7EgxvSPJbV4f0v69kJQUBAWhGdL+dXY1/0pp4E4vwg9eZuwPqsMp2LiM2ng==
X-Received: by 2002:a05:600c:3b05:b0:397:54ce:896 with SMTP id m5-20020a05600c3b0500b0039754ce0896mr12535936wms.3.1655337197285;
        Wed, 15 Jun 2022 16:53:17 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id w5-20020a7bc105000000b003976fbfbf00sm345178wmi.30.2022.06.15.16.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 16:53:16 -0700 (PDT)
Date:   Thu, 16 Jun 2022 00:53:14 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 3/4] media: imx: imx-mipi-csis: Implement the
 .get_frame_desc() operation
Message-ID: <20220615235314.umyosoxusngzmvey@arch-thunder>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
 <20220615192602.25472-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615192602.25472-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Wed, Jun 15, 2022 at 10:26:01PM +0300, Laurent Pinchart wrote:
> The CSIS is connected to its sink through an SoC-specific gasket that
> needs to be configured. Depending on the platform, the gasket
> configuration requires knowing the CSI-2 DT. To provide the needed
> information, implement the .get_frame_desc() operation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 8674aaad5fa0..905072871ed2 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1160,6 +1160,32 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				    struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> +	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];

Think that you should check *fd before use here, other than that.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> +
> +	if (pad != CSIS_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
> +	fd->num_entries = 1;
> +
> +	memset(entry, 0, sizeof(*entry));
> +
> +	mutex_lock(&csis->lock);
> +
> +	entry->flags = 0;
> +	entry->pixelcode = csis->csis_fmt->code;
> +	entry->bus.csi2.vc = 0;
> +	entry->bus.csi2.dt = csis->csis_fmt->data_type;
> +
> +	mutex_unlock(&csis->lock);
> +
> +	return 0;
> +}
> +
>  static int mipi_csis_log_status(struct v4l2_subdev *sd)
>  {
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> @@ -1184,6 +1210,7 @@ static const struct v4l2_subdev_pad_ops mipi_csis_pad_ops = {
>  	.enum_mbus_code		= mipi_csis_enum_mbus_code,
>  	.get_fmt		= mipi_csis_get_fmt,
>  	.set_fmt		= mipi_csis_set_fmt,
> +	.get_frame_desc		= mipi_csis_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_ops mipi_csis_subdev_ops = {
> -- 
> Regards,
> 
> Laurent Pinchart
> 
