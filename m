Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9D91E1E30
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 11:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbgEZJSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 05:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgEZJSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 05:18:03 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F13C03E97E;
        Tue, 26 May 2020 02:18:03 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A14B4634C87;
        Tue, 26 May 2020 12:17:16 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jdVi0-0002Rz-M8; Tue, 26 May 2020 12:17:16 +0300
Date:   Tue, 26 May 2020 12:17:16 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     mchehab@kernel.org, manivannan.sadhasivam@linaro.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 08/10] media: i2c: imx290: Add support to enumerate
 all frame sizes
Message-ID: <20200526091716.GJ8214@valkosipuli.retiisi.org.uk>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
 <20200524192505.20682-9-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524192505.20682-9-andrey.konovalov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Sun, May 24, 2020 at 10:25:03PM +0300, Andrey Konovalov wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Add support to enumerate all frame sizes supported by IMX290. This is
> required for using with userspace tools such as libcamera.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  drivers/media/i2c/imx290.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 6e70ff22bc5f..88850f3b1427 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -471,6 +471,25 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int imx290_enum_frame_size(struct v4l2_subdev *subdev,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if ((fse->code != imx290_formats[0].code) &&
> +	    (fse->code != imx290_formats[1].code))
> +		return -EINVAL;

Please skip the modes that do not have the code specified by the user. They
should not be enumerated here.

> +
> +	if (fse->index >= ARRAY_SIZE(imx290_modes))
> +		return -EINVAL;
> +
> +	fse->min_width = imx290_modes[fse->index].width;
> +	fse->max_width = imx290_modes[fse->index].width;
> +	fse->min_height = imx290_modes[fse->index].height;
> +	fse->max_height = imx290_modes[fse->index].height;
> +
> +	return 0;
> +}
> +
>  static int imx290_get_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_pad_config *cfg,
>  			  struct v4l2_subdev_format *fmt)
> @@ -850,6 +869,7 @@ static const struct v4l2_subdev_video_ops imx290_video_ops = {
>  static const struct v4l2_subdev_pad_ops imx290_pad_ops = {
>  	.init_cfg = imx290_entity_init_cfg,
>  	.enum_mbus_code = imx290_enum_mbus_code,
> +	.enum_frame_size = imx290_enum_frame_size,
>  	.get_fmt = imx290_get_fmt,
>  	.set_fmt = imx290_set_fmt,
>  };

-- 
Regards,

Sakari Ailus
