Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2746FEC65
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 09:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjEKHK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 03:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjEKHKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 03:10:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD4A173B
        for <linux-media@vger.kernel.org>; Thu, 11 May 2023 00:10:54 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FE238BE;
        Thu, 11 May 2023 09:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683789045;
        bh=LFe/Q2MjCT80TI79PHrSd5b7km9SSA0xEug5jgBx5LQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pMDybcp284jlWGooSIBrK2MOpKp3e/L9mmFO2+bDaqpZJYTwoyaMLpgGyd8lDRfnO
         4wzSAmxk2XnBkYgOjJTngVjX1lTlUbTqFzlHttJVTiUOhHY6LmQdP5tVFSTpStFr6O
         mc7INRqg86O5AkxKbh4gfE+Jt0UI326UDS8rLOu4=
Date:   Thu, 11 May 2023 09:10:50 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        slongerbeam@gmail.com, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3] media: ov5640: correct comments for default VGA to
 avoid confusion
Message-ID: <xepxkc6m7x6k53o2vvhrhaxujutcyzl3jwcbuqwqu6vgj3ptjb@yjolpdlo2uts>
References: <20230509065645.2827855-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509065645.2827855-1-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Guoniu Zhou

On Tue, May 09, 2023 at 02:56:45PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> When OV5640 work at DVP mode, the default initialization settings
> make it output 30 frames per second. But when it work at CSI-2 mode
> the default link frequency will make it output 60 frames per second,
> so correct the comments to make it more clear.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Thank you!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
> v2->v3:
>   1) modify patch title from "fix incorrect frame frate issue for
>      defulat VGA" to "correct comments for default VGA to avoid
>      confusion" to make it more accurate description about this
>      patch.
>   2) remove code change about frame_interval parameters
>   3) remove tag since my misunderstand
>   4) update commit log
>
> v1->v2:
>   1) fix typo issue(s/runn/run)
>   2) keep original OV5640 default link frequency
>   3) correct comments and frame_interval parameters to match actual
>      frame rate
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 1536649b9e90..e9100988a028 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3851,7 +3851,7 @@ static int ov5640_probe(struct i2c_client *client)
>
>  	/*
>  	 * default init sequence initialize sensor to
> -	 * YUV422 UYVY VGA@30fps
> +	 * YUV422 UYVY VGA(30FPS in parallel mode, 60 in MIPI CSI-2 mode)
>  	 */
>  	sensor->frame_interval.numerator = 1;
>  	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
> --
> 2.37.1
>
