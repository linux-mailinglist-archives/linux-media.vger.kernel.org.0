Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7577CDD36
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 15:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344563AbjJRN1u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 09:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjJRN1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 09:27:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239BAB0
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 06:27:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BF6F2B3;
        Wed, 18 Oct 2023 15:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697635658;
        bh=auI5vdoChSMPWluOriZD8S8nrW6YW3t8jTPjdss5ZW4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RJN2eP355kkdYYDwzvj3xzeROeZ4BuAI7SuRD7LtrEJ7a5WVkUkflRtqz4twAVZd+
         Wp1zXaGJrRwDxheryshr2v7ITPZ9Vd7N5aJYXS+Bl7SDJ4vFNcivA6vDDm+iU41PWZ
         B9Wi9f3NyK3bsRvCONUnXWaTjvOMQsaUoNWqwpC8=
Date:   Wed, 18 Oct 2023 16:27:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kieran.bingham@ideasonboard.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: css: Write LINE_LENGTH_PCK correctly
Message-ID: <20231018132752.GA28214@pendragon.ideasonboard.com>
References: <20231018131729.1022521-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231018131729.1022521-1-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

On Wed, Oct 18, 2023 at 06:47:29PM +0530, Umang Jain wrote:
> According to MIPI CCS v1.1 specification, the LINE_LENGTH_PCK
> units is in VT pixel clocks (Section 8.2.6).
> 
> To compute how many pixel clocks it takes, simply divide the
> VT pixel clock frequency by the number of pixels in a single line.

Have you hard of dimensional analysis
(https://en.wikipedia.org/wiki/Dimensional_analysis) ? It's a very good
and simple way of checking the validity of mathematical formulas.

> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
> Testing:
> 
> The patch is tested using IMX519 with CCS.
> This patch makes the frame buffer being filled to the fullest
> (instead of getting 1/3rd only previously) - without any workarounds.
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 16de66a37fad..12c75a843dfe 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -734,9 +734,11 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		break;
>  	case V4L2_CID_HBLANK:
> -		rval = ccs_write(sensor, LINE_LENGTH_PCK,
> -				 sensor->pixel_array->crop[CCS_PA_PAD_SRC].width
> -				 + ctrl->val);
> +		/* LINE_LENGTH_PCK units are in VT pixel clocks. */
> +		u16 line_length_pck =
> +			sensor->pll.vt_bk.pix_clk_freq_hz /
> +			(sensor->pixel_array->crop[CCS_PA_PAD_SRC].width + ctrl->val);
> +		rval = ccs_write(sensor, LINE_LENGTH_PCK, line_length_pck);
>  
>  		break;
>  	case V4L2_CID_TEST_PATTERN:

-- 
Regards,

Laurent Pinchart
