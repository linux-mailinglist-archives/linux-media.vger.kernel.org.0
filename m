Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27405640580
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 12:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbiLBLIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 06:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiLBLII (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 06:08:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CADC52163
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 03:08:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3C7C6E0;
        Fri,  2 Dec 2022 12:08:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669979285;
        bh=QqY3AmEp7Z04Tx9OGqJXHwl46h4/2YgxSEtKYhQf0YU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b2OKP/5D9YLvBRT9vrX8qYda2pLoVLxzImnKSXjEjoWoXkg0+sAEvQO0xq84xCptx
         60jYzleKFFbw+UmsvDsvknw6CFzliT1j9U9AaaS4gZVuW/URle1Y7bz9A1CugOa6b3
         bJw1IDjIFaKBTv9Aa340G5hT5C7YygNqH2s2JUC0=
Date:   Fri, 2 Dec 2022 13:08:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     linux-media@vger.kernel.org, slongerbeam@gmail.com,
        mchehab@kernel.org, jacopo@jmondi.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH] media: ov5640: report correct frame rate to user
Message-ID: <Y4nck1V4ScHOAtCN@pendragon.ideasonboard.com>
References: <20221202104250.2634726-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221202104250.2634726-1-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu Zhou,

Thank you for the patch.

On Fri, Dec 02, 2022 at 06:42:50PM +0800, G.N. Zhou (OSS) wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> In commit 3145efcdb4d0 ("media: ov5640: Rework timings programming"),
> it defines max_fps field in ov5640_mode_info structure to store maximum
> frame rate supported by each mode. But in ov5640_try_frame_interval(),it

s/,it/, it/

> assumes the maximum frame rate supported by all modes is 60. But actully,

s/actully/actually/

> only VGA support it. For others, the maximum frame rate supported is 30.
> So correct it by taking the maximum frame rate supported by each mode as
> the initialization value of the local variable maxfps.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/i2c/ov5640.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 3f6d715efa82..a396f3eaf054 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2722,13 +2722,17 @@ static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
>  	int minfps, maxfps, best_fps, fps;
>  	int i;
>  
> +	mode = ov5640_find_mode(sensor, width, height, false);
> +	if (!mode)
> +		return -EINVAL;

There are two callers of this function, ov5640_enum_frame_interval() and
ov5640_s_frame_interval(). The latter already has a mode pointer (taken
from sensor->current_mode). I would thus move the ov5640_find_mode()
call to ov5640_enum_frame_interval(), and pass the mode to
ov5640_try_frame_interval.

On a side note, the ov5640_find_mode() call in ov5640_s_frame_interval()
after ov5640_try_frame_interval() seems unneeded to me, it looks like it
could be dropped (in a separate patch).

> +
>  	minfps = ov5640_framerates[OV5640_15_FPS];
> -	maxfps = ov5640_framerates[OV5640_60_FPS];
> +	maxfps = ov5640_framerates[mode->max_fps];
>  
>  	if (fi->numerator == 0) {
>  		fi->denominator = maxfps;
>  		fi->numerator = 1;
> -		rate = OV5640_60_FPS;
> +		rate = mode->max_fps;
>  		goto find_mode;
>  	}
>  

-- 
Regards,

Laurent Pinchart
