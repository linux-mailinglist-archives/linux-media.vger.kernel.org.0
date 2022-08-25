Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5716F5A1740
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 18:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239553AbiHYQxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 12:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbiHYQxx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 12:53:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2CF0167F9
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 09:53:52 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB9512B3;
        Thu, 25 Aug 2022 18:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661446430;
        bh=uJ/9Vyi7/aFhexfrlPlBgeBm/rEgtM5/u5rY2MtiRVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tZljZamTzCSxVvRxmHe64lcFs5YJ20QMVaDvBfW9d9yA/Tc1c4Pkx0htuJteNyk/Q
         XzDJZuFa1L77IRVS2332lMxFvvBZdbecGxrKF7bjCGNbvpkaCkqfoqJ9d0HgMmXHZr
         saRjTq8chrw1YRPmZOI9usBQYPYn4VNn6g27ZQRA=
Date:   Thu, 25 Aug 2022 11:53:43 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 4/9] media: rkisp1: Allow setting all color space
 fields on ISP source pad
Message-ID: <20220825165343.GG109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-5-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:35PM +0300, Laurent Pinchart wrote:
> The ISP output color space is configured through the ISP source pad. At
> the moment, only the quantization can be set. Extend it to the three
> other color space fields:
> 
> - The ycbcr_enc field will be used to configure the RGB to YUV matrix
>   (currently hardcoded to Rec. 601).
> 
> - The colorspace (which controls the color primaries) and xfer_func
>   fields will not be used to configure the ISP, as the corresponding
>   hardware blocks (the cross-talk RGB to RGB matrix and the tone mapping
>   curve) are programmed directly by applications through ISP parameters.
>   Nonetheless, those two fields should be set by applications to match
>   the ISP configuration, in order to propagate the correct color space
>   down the pipeline up to the capture video nodes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Fix quantization setting that was set on sink pad by mistake
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 55 ++++++++++++++++---
>  1 file changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index d34f32271d74..7869f0cced62 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -609,6 +609,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  	struct v4l2_mbus_framefmt *src_fmt;
>  	const struct v4l2_rect *src_crop;
> +	bool set_csc;
>  
>  	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
>  					  RKISP1_ISP_PAD_SINK_VIDEO, which);
> @@ -645,20 +646,60 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  	src_fmt->height = src_crop->height;
>  
>  	/*
> -	 * The CSC API is used to allow userspace to force full
> -	 * quantization on YUV formats.
> +	 * Copy the color space for the sink pad. When converting from Bayer to
> +	 * YUV, default to a limited quantization range.
>  	 */
> -	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
> -	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
> +	src_fmt->colorspace = sink_fmt->colorspace;
> +	src_fmt->xfer_func = sink_fmt->xfer_func;
> +	src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;
> +
> +	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER &&
>  	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> -		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> -	else if (src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>  		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>  	else
> -		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +		src_fmt->quantization = sink_fmt->quantization;
> +
> +	/*
> +	 * Allow setting the source color space fields when the SET_CSC flag is
> +	 * set and the source format is YUV. If the sink format is YUV, don't
> +	 * set the color primaries, transfer function or YCbCr encoding as the
> +	 * ISP is bypassed in that case and passes YUV data through without
> +	 * modifications.
> +	 *
> +	 * The color primaries and transfer function are configured through the
> +	 * cross-talk matrix and tone curve respectively. Settings for those
> +	 * hardware blocks are conveyed through the ISP parameters buffer, as
> +	 * they need to combine color space information with other image tuning
> +	 * characteristics and can't thus be computed by the kernel based on the
> +	 * color space. The source pad colorspace and xfer_func fields are thus
> +	 * ignored by the driver, but can be set by userspace to propagate
> +	 * accurate color space information down the pipeline.
> +	 */
> +	set_csc = !!(format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC);
> +
> +	if (set_csc && src_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> +		if (sink_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
> +			if (format->colorspace != V4L2_COLORSPACE_DEFAULT)
> +				src_fmt->colorspace = format->colorspace;
> +			if (format->xfer_func != V4L2_XFER_FUNC_DEFAULT)
> +				src_fmt->xfer_func = format->xfer_func;
> +			if (format->ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT)
> +				src_fmt->ycbcr_enc = format->ycbcr_enc;
> +		}
> +
> +		if (format->quantization != V4L2_QUANTIZATION_DEFAULT)
> +			src_fmt->quantization = format->quantization;
> +	}
>  
>  	*format = *src_fmt;
>  
> +	/*
> +	 * Restore the SET_CSC flag if it was set to indicate support for the
> +	 * CSC setting API.
> +	 */
> +	if (set_csc)
> +		format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
> +
>  	/* Store the source format info when setting the active format. */
>  	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		isp->src_fmt = src_info;
