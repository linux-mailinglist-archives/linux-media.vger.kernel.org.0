Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575935A1334
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 16:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbiHYOQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 10:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242079AbiHYOO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 10:14:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E182B6CF63
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:14:57 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9544E2B3;
        Thu, 25 Aug 2022 16:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661436895;
        bh=KqiCLpPNN7icLoZa9ZD5y7Vcau+6iTVyWQ7nvf1mhns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hU2q+Ifed02SdiQb3T9cujLh25hr0CyorfjWSD55n2V/aotJM3akKE5c45ET80QXp
         01hA09IQDYXb3CkGaN97FlsAzqhSp6R8OVDGjSHIRW5w27J53vm+kLDNTi0MqWpYlY
         VpUF4SSBDnukzKwsQSpNWZz3WNl1Ez8OFrCCaFgY=
Date:   Thu, 25 Aug 2022 09:14:47 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 1/9] media: rkisp1: Initialize color space on ISP sink
 and source pads
Message-ID: <20220825141447.GC109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:32PM +0300, Laurent Pinchart wrote:
> Initialize the four color space fields on the sink and source video pads
> of the ISP in the .init_cfg() operation. As the main use case for the
> ISP is to convert Bayer data to YUV, select a raw color space on the
> sink pad and a limited range quantization of SYCC on the source pad by
> default.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes since v1:
> 
> - Mention ISP in the subject line
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index a3c7d4d88387..a52b22824739 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -553,12 +553,17 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>  	struct v4l2_rect *sink_crop, *src_crop;
>  
> +	/* Video. */
>  	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
>  					      RKISP1_ISP_PAD_SINK_VIDEO);
>  	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
>  	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
>  	sink_fmt->field = V4L2_FIELD_NONE;
>  	sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
> +	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
> +	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
> +	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>  
>  	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
>  					     RKISP1_ISP_PAD_SINK_VIDEO);
> @@ -571,11 +576,16 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>  					     RKISP1_ISP_PAD_SOURCE_VIDEO);
>  	*src_fmt = *sink_fmt;
>  	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
> +	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	src_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
> +	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>  
>  	src_crop = v4l2_subdev_get_try_crop(sd, sd_state,
>  					    RKISP1_ISP_PAD_SOURCE_VIDEO);
>  	*src_crop = *sink_crop;
>  
> +	/* Parameters and statistics. */
>  	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
>  					      RKISP1_ISP_PAD_SINK_PARAMS);
>  	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
