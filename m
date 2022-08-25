Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C30F5A14D1
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 16:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242101AbiHYOtN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 10:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235500AbiHYOtL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 10:49:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2531B285C
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:49:09 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F9712B3;
        Thu, 25 Aug 2022 16:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661438947;
        bh=/VurhkuO65QWbqkrdNb+54nkXj9HUJUZ3ItYDqjoSsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s8gMinGowgsmyIvu68rpXBaKpXb8rf3PflLoiSr+oQJzhfoaMV+yn4eWgJEZ47c6S
         M770ZRZs9ImvX1kBgQm7PplDPL9N7j0vy1jX81ps9TWwYiUV/qxudo7k74SaThvDWZ
         9ZjJfsk789yYG6GMoShfO9Dap6VYZK0GnbaXYyP0=
Date:   Thu, 25 Aug 2022 09:49:00 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 2/9] media: rkisp1: Allow setting color space on ISP
 sink pad
Message-ID: <20220825144900.GD109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:33PM +0300, Laurent Pinchart wrote:
> The ISP accepts different color spaces on its input: for YUV input, it
> doesn't set any restrictions, and for Bayer inputs, any color primaries
> or transfer function can be accepted (YCbCr encoding isn't applicable
> there, and quantization range can only be full).
> 
> Allow setting a color space on the ISP sink pad, with the aforementioned
> restrictions. The settings don't influence hardware yet (only the YUV
> quantization range will, anything else has no direct effect on the ISP
> configuration), but can already be set to allow color space information
> to be coherent across the ISP sink link.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Fix swapped default color spaces for YUV and Bayer
> - Improve coherency in usage of ternary operator ? :
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index a52b22824739..b5bdf427c7e1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -705,6 +705,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
>  	const struct rkisp1_mbus_info *mbus_info;
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  	struct v4l2_rect *sink_crop;
> +	bool is_yuv;
>  
>  	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
>  					  RKISP1_ISP_PAD_SINK_VIDEO,
> @@ -725,6 +726,36 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
>  				   RKISP1_ISP_MIN_HEIGHT,
>  				   RKISP1_ISP_MAX_HEIGHT);
>  
> +	/*
> +	 * Adjust the color space fields. Accept any color primaries and
> +	 * transfer function for both YUV and Bayer. For YUV any YCbCr encoding
> +	 * and quantization range is also accepted. For Bayer formats, the YCbCr
> +	 * encoding isn't applicable, and the quantization range can only be
> +	 * full.
> +	 */
> +	is_yuv = mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV;
> +
> +	sink_fmt->colorspace = format->colorspace ? :
> +			       (is_yuv ? V4L2_COLORSPACE_SRGB :
> +				V4L2_COLORSPACE_RAW);
> +	sink_fmt->xfer_func = format->xfer_func ? :
> +			      V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
> +	if (is_yuv) {
> +		sink_fmt->ycbcr_enc = format->ycbcr_enc ? :
> +			V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
> +		sink_fmt->quantization = format->quantization ? :
> +			V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
> +						      sink_fmt->ycbcr_enc);
> +	} else {
> +		/*
> +		 * The YCbCr encoding isn't applicable for non-YUV formats, but
> +		 * V4L2 has no "no encoding" value. Hardcode it to Rec. 601, it
> +		 * should be ignored by userspace.
> +		 */
> +		sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +		sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	}
> +
>  	*format = *sink_fmt;
>  
>  	/* Propagate to in crop */
