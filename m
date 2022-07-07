Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B661A56A64A
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 16:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbiGGOzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 10:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236212AbiGGOzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 10:55:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AD457255
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 07:54:03 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E6C0326;
        Thu,  7 Jul 2022 16:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657205641;
        bh=CUj9JPKxaxbqWdrgk5KEOY5sf9eRhV+a0G9FTCkz6Xo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oV5Yc/TFy860YP94IhvCN45DDTlHRUlkfaKsN5UgAzQ0jojAc4AbQ/f9c8W9fW/Xy
         mJlqlZIPWJujirx7kvhL2qph+WAGVXNWXT4N+ve4qguHXyU2K25O9b2IaMokTP+bm/
         1uDv9alo3d2Qjt4WjnX38URlRqbw1n6Y0pqGAYUc=
Date:   Thu, 7 Jul 2022 23:53:53 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 33/55] media: rkisp1: isp: Merge ISP_ACQ_PROP
 configuration in single variable
Message-ID: <20220707145353.GQ3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-34-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-34-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:51AM +0300, Laurent Pinchart wrote:
> The rkisp1_config_isp() function stores the value of the input selection
> and polarity configuration in two different local variables, OR'ed
> together when writing the register. Merge them into a single acq_prop
> variable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c  | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 85c1995bb5c2..938541ce52ce 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -141,7 +141,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
>  {
>  	struct rkisp1_device *rkisp1 = isp->rkisp1;
> -	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0, input_sel = 0;
> +	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
>  	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
>  	struct v4l2_mbus_framefmt *sink_frm;
>  	struct v4l2_rect *sink_crop;
> @@ -188,17 +188,17 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  	/* Set up input acquisition properties */
>  	if (mbus_type == V4L2_MBUS_BT656 || mbus_type == V4L2_MBUS_PARALLEL) {
>  		if (mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> -			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
> +			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
>  
>  		switch (sink_fmt->bus_width) {
>  		case 8:
> -			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
> +			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
>  			break;
>  		case 10:
> -			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
> +			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
>  			break;
>  		case 12:
> -			input_sel = RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
> +			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_12B;
>  			break;
>  		default:
>  			dev_err(rkisp1->dev, "Invalid bus width %u\n",
> @@ -209,15 +209,15 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  
>  	if (mbus_type == V4L2_MBUS_PARALLEL) {
>  		if (mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> -			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
> +			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
>  
>  		if (mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> -			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
> +			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
>  	}
>  
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, isp_ctrl);
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_PROP,
> -		     signal | sink_fmt->yuv_seq | input_sel |
> +		     acq_prop | sink_fmt->yuv_seq |
>  		     RKISP1_CIF_ISP_ACQ_PROP_BAYER_PAT(sink_fmt->bayer_pat) |
>  		     RKISP1_CIF_ISP_ACQ_PROP_FIELD_SEL_ALL);
>  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_ACQ_NR_FRAMES, 0);
