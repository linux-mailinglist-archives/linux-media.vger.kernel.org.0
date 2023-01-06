Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F87F660A4D
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 00:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234760AbjAFXeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 18:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbjAFXef (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 18:34:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F024744C63
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 15:34:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86CB44AE;
        Sat,  7 Jan 2023 00:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673048072;
        bh=hVt8Y+XSGdHNxKjK2gFYwnoF1AnufTeB/MlcCsqFmYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UtBypQqhIOcFg6DVzXPoQm7mIvkMI9ORfMsPSYdzDNn1DMxmzZxYCIIQE1zO2Gjtm
         hjwosy5zaDudDSQfuN7UaPBomvJ/mgBghGETcJCaOM5wlsneF7Oh4wPiYcAvZS7U3H
         2oJMta/TT74De3FJM1rewMo4FsDV/xlN+XazijZw=
Date:   Sat, 7 Jan 2023 01:34:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     adam@piggz.co.uk
Cc:     linux-media@vger.kernel.org, yong.deng@magewell.com,
        mchehab@kernel.org, linux-sunxi@lists.linux.dev,
        paul.kocialkowski@bootlin.com
Subject: Re: [PATCH 2/3] media: sun6i-csi: implement V4L2_CAP_IO_MC
Message-ID: <Y7iwA5qhRjRIzcuF@pendragon.ideasonboard.com>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-3-adam@piggz.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230106194038.16018-3-adam@piggz.co.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Thank you for the patch.

On Fri, Jan 06, 2023 at 07:40:37PM +0000, adam@piggz.co.uk wrote:
> From: Adam Pigg <adam@piggz.co.uk>
> 
> modify sun6i_csi_capture_enum_fmt to check the mbus_codes from the
> pixel format array for the supplied format

The commit message should explain why. Please also start sentences with
a capital letter, and end them with a period.

> Signed-off-by: Adam Pigg <adam@piggz.co.uk>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 69578075421c..54beba4d2b2f 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -666,13 +666,43 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *private,
>  				      struct v4l2_fmtdesc *fmtdesc)
>  {
>  	u32 index = fmtdesc->index;
> +	unsigned int i;
>  
>  	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
>  		return -EINVAL;
>  
> -	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
> +	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> +		const struct sun6i_csi_capture_format *format =
> +			&sun6i_csi_capture_formats[i];
>  
> -	return 0;
> +		/*
> +		 * If a media bus code is specified, only consider formats that
> +		 * match it.
> +		 */
> +		if (fmtdesc->mbus_code) {
> +			unsigned int j;
> +
> +			if (!format->mbus_codes)
> +				continue;
> +
> +			for (j = 0; format->mbus_codes[j]; j++) {
> +				if (fmtdesc->mbus_code == format->mbus_codes[j])
> +					break;
> +			}
> +
> +			if (!format->mbus_codes[j])
> +				continue;
> +		}
> +
> +		if (index == 0) {
> +			fmtdesc->pixelformat = format->pixelformat;
> +			return 0;
> +		}
> +
> +		index--;
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  static int sun6i_csi_capture_g_fmt(struct file *file, void *private,
> @@ -978,7 +1008,7 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
>  
>  	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
>  		sizeof(video_dev->name));
> -	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;

Let's avoid long lines:

	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
			       | V4L2_CAP_IO_MC;

With this change and with an updated commit message you can add my

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

in the next version of this patch.

>  	video_dev->vfl_dir = VFL_DIR_RX;
>  	video_dev->release = video_device_release_empty;
>  	video_dev->fops = &sun6i_csi_capture_fops;

-- 
Regards,

Laurent Pinchart
