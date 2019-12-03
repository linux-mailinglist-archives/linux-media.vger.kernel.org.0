Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3DC410FA42
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2019 09:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfLCI4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Dec 2019 03:56:55 -0500
Received: from retiisi.org.uk ([95.216.213.190]:45754 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbfLCI4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Dec 2019 03:56:54 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3C202634C89;
        Tue,  3 Dec 2019 10:56:05 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1ic3yW-0001Nf-SG; Tue, 03 Dec 2019 10:56:04 +0200
Date:   Tue, 3 Dec 2019 10:56:04 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH 4/5] media: i2c: imx290: Add support to enumerate all
 frame sizes
Message-ID: <20191203085604.GC5282@valkosipuli.retiisi.org.uk>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
 <20191129190541.30315-5-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129190541.30315-5-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 30, 2019 at 12:35:40AM +0530, Manivannan Sadhasivam wrote:
> Add support to enumerate all frame sizes supported by IMX290. This is
> required for using with userspace tools such as libcamera.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/media/i2c/imx290.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index d5bb3a59ac46..f26c4a0ee0a0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -468,6 +468,25 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int imx290_enum_frame_size(struct v4l2_subdev *subdev,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if ((fse->code != imx290_formats[0].code) &&
> +	    (fse->code != imx290_formats[1].code))

Please use a loop over imx290_formats instead.

> +		return -EINVAL;
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
> @@ -820,6 +839,7 @@ static const struct v4l2_subdev_video_ops imx290_video_ops = {
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
