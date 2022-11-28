Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4BC63AB03
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbiK1Oat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbiK1OaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:30:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF4222BD0
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 06:30:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E16A0501;
        Mon, 28 Nov 2022 15:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669645801;
        bh=rNKA/IYQPIONuMAYEkZeMrvDKNwBePDKf99YCwSsMss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LKt0+lLi5ZCU96gi/OysXgi+F548docVYOyRRFmmIxeoAYoVfddtAuar73ctHcvu5
         fAFnI7RcinLotS/jinTSQW4YYd4sjN1QBRouMT1x3Nn6c6qi9c0mOLaujtPZhsv81W
         VbiEIVJt5vKDD8WYqdF8JDFTejQyvXQ4aIHmTO54=
Date:   Mon, 28 Nov 2022 16:29:46 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Guoniu.zhou" <guoniu.zhou@nxp.com>
Cc:     linux-media@vger.kernel.org, slongerbeam@gmail.com,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hugues.fruchet@st.com, jacopo@jmondi.org
Subject: Re: [PATCH v3] media: ov5640: set correct default link frequency
Message-ID: <Y4TF2nZCUGpmAbM9@pendragon.ideasonboard.com>
References: <20221125092024.2866111-1-guoniu.zhou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221125092024.2866111-1-guoniu.zhou@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu zhou,

Thank you for the patch.

On Fri, Nov 25, 2022 at 05:20:24PM +0800, Guoniu.zhou wrote:
> current_link_freq field in ov5640_dev structure is link frequency,
> not link frequency array index, so correct it.
> 
> Fixes: 3c28588f35d3 ("media: ov5640: Update pixel_rate and link_freq")
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3:
>   - Remove empty line after Fixes: 3c28588f35d3 ("media: ov5640: Update pixel_rate and link_freq")
>   - Add "Acked-by: Jacopo Mondi <jacopo@jmondi.org>"
> 
> v2:
>  - Correct typo issue(s/structrue/structure)
> ---
>  drivers/media/i2c/ov5640.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 2d740397a5d4..3f6d715efa82 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3817,7 +3817,8 @@ static int ov5640_probe(struct i2c_client *client)
>  	sensor->current_mode =
>  		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
>  	sensor->last_mode = sensor->current_mode;
> -	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
> +	sensor->current_link_freq =
> +		ov5640_csi2_link_freqs[OV5640_DEFAULT_LINK_FREQ];
>  
>  	sensor->ae_target = 52;
>  

-- 
Regards,

Laurent Pinchart
