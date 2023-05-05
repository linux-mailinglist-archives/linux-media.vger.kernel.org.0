Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B66A6F7D35
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 08:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjEEGqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 02:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbjEEGqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 02:46:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AB04C12
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 23:46:00 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CA046D6;
        Fri,  5 May 2023 08:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683269155;
        bh=yoEkGtVbuBsc7IP5fV6h/nSW8zTJT+ua+JJ12N6E0cQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mFJ6W30QxYj6LsxM3qlHpx42CIn8JoLj1wpQusFC/wvZlZSTAe/HTY8CyVoLcJLU4
         8GJ65yrKuk9h0zq7m10z0EAanMzKHMV/SWoxv9vxtgglyleqB+p+ZvKXW3RqDbqZeG
         3EWWs/1XumDraHoy3pSwGS5/zPNg7VkcM6onm5rk=
Date:   Fri, 5 May 2023 08:45:55 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        jacopo.mondi@ideasonboard.com, slongerbeam@gmail.com,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2] media: ov5640: fix incorrect frame frate issue for
 defulat VGA
Message-ID: <qrwnkofoyf5utyh7kepihb7vp5wqb657dbak4m7ecjej357i6v@swbdvakgtaby>
References: <20230505020114.764715-1-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505020114.764715-1-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Guoniu Zhou

On Fri, May 05, 2023 at 10:01:14AM +0800, G.N. Zhou (OSS) wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>
> If run OV5640 with default setting after power up, the real frame
> rate for it is 60, not 30. The reason is default frame interval
> parameter initialized in probe is 30 but default link frequency
> is to generate 60 frame rate, so correct it.
>
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

I don't recall having given a tag :)

> ---
> v1->v2:
>   1) fix typo issue(s/runn/run)
>   2) keep original OV5640 default link frequency
>   3) correct comments and frame_interval parameters to match actual
>      frame rate
> ---
>  drivers/media/i2c/ov5640.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 1536649b9e90..5c01bb9414c9 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3851,11 +3851,11 @@ static int ov5640_probe(struct i2c_client *client)
>
>  	/*
>  	 * default init sequence initialize sensor to
> -	 * YUV422 UYVY VGA@30fps
> +	 * YUV422 UYVY VGA@60fps
>  	 */
>  	sensor->frame_interval.numerator = 1;
> -	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
> -	sensor->current_fr = OV5640_30_FPS;
> +	sensor->frame_interval.denominator = ov5640_framerates[OV5640_60_FPS];
> +	sensor->current_fr = OV5640_60_FPS;

If you want to change also the frame_interval setting (which is again
used in parallel mode only) should you also change the .def_fps value
in the ov5640_mode_data[VGA] entry ?

To be honest I would leave parallel on 30FPS, unless you really want
to and have a setup to test.

We could simply update the comment with

+	 * YUV422 UYVY VGA (30FPS in parallel mode, 60 in MIPI CSI-2  mode)

What do you think ?


>  	sensor->current_mode =
>  		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
>  	sensor->last_mode = sensor->current_mode;
> --
> 2.37.1
>
