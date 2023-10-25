Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6767D6521
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 10:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbjJYIbb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 04:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbjJYIb2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 04:31:28 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A55134
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 01:31:24 -0700 (PDT)
Received: from [100.94.55.57] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ehristev)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C6B516607349;
        Wed, 25 Oct 2023 09:31:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698222683;
        bh=Y3cW/sCgqmtllZUYS0E8Cc/cLdkO0Ih9IesTpwjKcv8=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=IZMb6F+6kTwZ+uYe1B7jP4qdOE1QcPO6CyOl1nrs+SM68QJxszPM08Tq+zb6OS6Km
         11B2Vm9DkLcq/NVNyYiVK+F5rYkMlK+wKNqm0r5875xSieeL7mso3P4Bfa9m68Wigl
         yHK5TOWN+PPig3UR6M5McWAh+EtEKBlIjVT/w1PTG+zIax21kKV/IGPXo7JRwYixl5
         gGgQiHywH5Wic52Jvm/yh7AqK9D7vcL4xJGT/VyS7T7gKpapwiSZlXMDJoqEOP+PKr
         x82ExPdDWMQLqoWtvlohuf0CZN1fsOH6XFcRSc+hX9uA/cvV5svSTmsbnXCYPn7oRU
         BjSGKEjs0ye6g==
Message-ID: <eae2aff1-e950-4e49-869f-a17d05a32631@collabora.com>
Date:   Wed, 25 Oct 2023 11:31:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: microchip-isc: Remove dead code in pipeline
 validation
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20231024233430.1488-1-laurent.pinchart@ideasonboard.com>
From:   Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20231024233430.1488-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/25/23 02:34, Laurent Pinchart wrote:
> The isc_try_fse() function, called from isc_validate(), takes two
> parameters, an isc_device pointer, and a v4l2_subdev_state pointer. The
> isc_device is accessed but not modified by the function. The state is
> modified, including the struct v4l2_subdev_pad_config array it points
> to, but they are then never used by the caller. Furthermore, the V4L2
> subdev operation called by isc_try_fse() doesn't modify the subdev it is
> called on. The isc_try_fse() function has thus no effect, and can just
> be dropped.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This patch has been compile-tested only. Eugen, would you be able to
> test it on hardware ?

Hello Laurent,

Thank you for the patch.
When I initially wrote this code, I definitely had something in mind. I 
think it was the fact that the ISC should adjust it's crop area 
according to what the subdev is emitting, to avoid other problems (e.g. 
reporting bad frame size and v4l2-compliance crying )
Somehow , maybe, that intention is lost somewhere. I agree with you that 
this code appears useless.
I will test it out and let you know . (I cannot promise exactly when I 
have some time to do it, so bear with me please...)

Eugen

> ---
>   .../platform/microchip/microchip-isc-base.c   | 39 -------------------
>   1 file changed, 39 deletions(-)
> 
> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
> index 1f8528844497..540cb1378289 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -851,38 +851,6 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
>   	return 0;
>   }
>   
> -static void isc_try_fse(struct isc_device *isc,
> -			struct v4l2_subdev_state *sd_state)
> -{
> -	struct v4l2_subdev_frame_size_enum fse = {
> -		.which = V4L2_SUBDEV_FORMAT_TRY,
> -	};
> -	int ret;
> -
> -	/*
> -	 * If we do not know yet which format the subdev is using, we cannot
> -	 * do anything.
> -	 */
> -	if (!isc->config.sd_format)
> -		return;
> -
> -	fse.code = isc->try_config.sd_format->mbus_code;
> -
> -	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
> -			       sd_state, &fse);
> -	/*
> -	 * Attempt to obtain format size from subdev. If not available,
> -	 * just use the maximum ISC can receive.
> -	 */
> -	if (ret) {
> -		sd_state->pads->try_crop.width = isc->max_width;
> -		sd_state->pads->try_crop.height = isc->max_height;
> -	} else {
> -		sd_state->pads->try_crop.width = fse.max_width;
> -		sd_state->pads->try_crop.height = fse.max_height;
> -	}
> -}
> -
>   static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
>   {
>   	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
> @@ -944,10 +912,6 @@ static int isc_validate(struct isc_device *isc)
>   		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>   		.pad = isc->remote_pad,
>   	};
> -	struct v4l2_subdev_pad_config pad_cfg = {};
> -	struct v4l2_subdev_state pad_state = {
> -		.pads = &pad_cfg,
> -	};
>   
>   	/* Get current format from subdev */
>   	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, get_fmt, NULL,
> @@ -1008,9 +972,6 @@ static int isc_validate(struct isc_device *isc)
>   	if (ret)
>   		return ret;
>   
> -	/* Obtain frame sizes if possible to have crop requirements ready */
> -	isc_try_fse(isc, &pad_state);
> -
>   	/* Configure ISC pipeline for the config */
>   	ret = isc_try_configure_pipeline(isc);
>   	if (ret)

