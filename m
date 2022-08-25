Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9EE05A17F4
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 19:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbiHYR1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 13:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242469AbiHYR1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 13:27:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C040A061D
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 10:27:34 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B513E2B3;
        Thu, 25 Aug 2022 19:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661448453;
        bh=q3oqY9FkFH3pjAH1NET+4Z2xhWAsZLJm2Vsi0YufGKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fVILlCqR4kCGkWT+DXf888fr6ivTH5CsR2PMr49Gv0oer9eTas9xIfdE+Q30ysYhc
         rcHXCNRxU52J0Gjc8xTp/vokSovVa19TJG1P0Hyv0QqIYhmzpDNAmxNpT2L3bPLn7Z
         p4r6ZN2sD0sIR33W8OBay+CXWNrYtm7A+946BwV8=
Date:   Thu, 25 Aug 2022 12:27:26 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 9/9] media: rkisp1: Allow setting color space on
 resizer sink pad
Message-ID: <20220825172726.GL109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-10-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-10-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:40PM +0300, Laurent Pinchart wrote:
> The resizer doesn't deal with color spaces, so it can accept any color
> space on its input, and propagates it unchanged to its output. When
> operating with a Bayer input format (in pass-through mode) further
> restrict the YCbCr encoding and quantization to Rec 601 and full range
> respectively, as for raw data the former ought to be ignored and the
> latter is always full range.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c | 41 +++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 6f6ec00b63b8..891a622124e2 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -526,6 +526,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>  	const struct rkisp1_mbus_info *mbus_info;
>  	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>  	struct v4l2_rect *sink_crop;
> +	bool is_yuv;
>  
>  	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, sd_state, RKISP1_RSZ_PAD_SINK,
>  					  which);
> @@ -547,9 +548,6 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>  	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>  		rsz->pixel_enc = mbus_info->pixel_enc;
>  
> -	/* Propagete to source pad */
> -	src_fmt->code = sink_fmt->code;
> -
>  	sink_fmt->width = clamp_t(u32, format->width,
>  				  RKISP1_ISP_MIN_WIDTH,
>  				  RKISP1_ISP_MAX_WIDTH);
> @@ -557,8 +555,45 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
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
> +	/* Propagate the media bus code and color space to the source pad. */
> +	src_fmt->code = sink_fmt->code;
> +	src_fmt->colorspace = sink_fmt->colorspace;
> +	src_fmt->xfer_func = sink_fmt->xfer_func;
> +	src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;
> +	src_fmt->quantization = sink_fmt->quantization;
> +
>  	/* Update sink crop */
>  	rkisp1_rsz_set_sink_crop(rsz, sd_state, sink_crop, which);
>  }
