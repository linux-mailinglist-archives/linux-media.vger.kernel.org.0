Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34485A14F7
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 16:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241442AbiHYO6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 10:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235495AbiHYO6g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 10:58:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC49B5A70
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:58:35 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61A362B3;
        Thu, 25 Aug 2022 16:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661439513;
        bh=7fpyFrgtIgQm3lmgbT+8PAeIiTn0pDYDN7SZDEK15wk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WQrWKTx7CGnHdNeGTCHY5KLzvrHPQLeN0TInJ4kVIarxLoCzzaz0iOC9OA0OjsMhy
         cGwSWRQJig1pdNIQjQ7sP94n6CMx1L0ECi//XTsFsGAFYBfDMp9NXunl8Oebnl5fj2
         YecgiuuON78iPUpGIFBSqB2rNpvNR0Uvr9+CqfkE=
Date:   Thu, 25 Aug 2022 09:58:26 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 3/9] media: rkisp1: Fix source pad format configuration
Message-ID: <20220825145826.GE109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:34PM +0300, Laurent Pinchart wrote:
> The ISP converts Bayer data to YUV when operating normally, and can also
> operate in pass-through mode where the input and output formats must
> match. Converting from YUV to Bayer isn't possible. If such an invalid
> configuration is attempted, adjust it by copying the sink pad media bus
> code to the source pad.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 40 +++++++++++++++----
>  1 file changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index b5bdf427c7e1..d34f32271d74 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -604,23 +604,43 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  				   struct v4l2_mbus_framefmt *format,
>  				   unsigned int which)
>  {
> -	const struct rkisp1_mbus_info *mbus_info;
> +	const struct rkisp1_mbus_info *sink_info;
> +	const struct rkisp1_mbus_info *src_info;
> +	struct v4l2_mbus_framefmt *sink_fmt;
>  	struct v4l2_mbus_framefmt *src_fmt;
>  	const struct v4l2_rect *src_crop;
>  
> +	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
> +					  RKISP1_ISP_PAD_SINK_VIDEO, which);
>  	src_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
>  					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
>  	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
>  					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
>  
> +	/*
> +	 * Media bus code. The ISP can operate in pass-through mode (Bayer in,
> +	 * Bayer out or YUV in, YUV out) or process Bayer data to YUV, but
> +	 * can't convert from YUV to Bayer.
> +	 */
> +	sink_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
> +
>  	src_fmt->code = format->code;
> -	mbus_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
> -	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
> +	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
> +	if (!src_info || !(src_info->direction & RKISP1_ISP_SD_SRC)) {
>  		src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
> -		mbus_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
> +		src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
>  	}
> -	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> -		isp->src_fmt = mbus_info;
> +
> +	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
> +	    src_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
> +		src_fmt->code = sink_fmt->code;
> +		src_info = sink_info;
> +	}
> +
> +	/*
> +	 * The source width and height must be identical to the source crop
> +	 * size.
> +	 */
>  	src_fmt->width  = src_crop->width;
>  	src_fmt->height = src_crop->height;
>  
> @@ -630,14 +650,18 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  	 */
>  	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
>  	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
> -	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> +	    src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>  		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> -	else if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> +	else if (src_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
>  		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>  	else
>  		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>  
>  	*format = *src_fmt;
> +
> +	/* Store the source format info when setting the active format. */
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		isp->src_fmt = src_info;
>  }
>  
>  static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
