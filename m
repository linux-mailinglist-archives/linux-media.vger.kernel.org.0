Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A7A5A17DD
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 19:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbiHYRTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 13:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241806AbiHYRTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 13:19:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2648BCC16
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 10:19:00 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2604:2d80:ad8a:9000:1bf9:855b:22de:3645])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B54E52B3;
        Thu, 25 Aug 2022 19:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661447939;
        bh=7argN46m1yRCNgM7ul38H/quYjAxRKLYJIY7A+8O7eg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Np+pxEdo9+4ByFLTfcVJLo8pJ0AYY8suUGH3ratAFhfr1axJ/nRSW3P7BTFFrOI/v
         Z92LSMfeIvJpz1U0goR70gL3/87QQOuPc6ga+ZE41fcuS5kX3XuT/H1Ski/zn2oFSm
         JPYik8vSpLrKF7PBnicNsp1i/p3yXwVNCNHgTlcY=
Date:   Thu, 25 Aug 2022 12:18:52 -0500
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v2 8/9] media: rkisp1: Initialize color space on resizer
 sink and source pads
Message-ID: <20220825171852.GK109174@pyrite.rasen.tech>
References: <20220823171840.8958-1-laurent.pinchart@ideasonboard.com>
 <20220823171840.8958-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823171840.8958-9-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 23, 2022 at 08:18:39PM +0300, Laurent Pinchart wrote:
> Initialize the four color space fields on the sink and source video pads
> of the resizer in the .init_cfg() operation. The resizer can't perform
> any color space conversion, so set the sink and source color spaces to
> the same defaults, which match the ISP source video pad default.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index becef04fdf2d..6f6ec00b63b8 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -430,6 +430,10 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
>  	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
>  	sink_fmt->field = V4L2_FIELD_NONE;
>  	sink_fmt->code = RKISP1_DEF_FMT;
> +	sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> +	sink_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
> +	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	sink_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>  
>  	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
>  					     RKISP1_RSZ_PAD_SINK);
