Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9D434C50F
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 09:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhC2Hh7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 03:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhC2Hhe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 03:37:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F2DC061574
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 00:37:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 718C31F45F11
Subject: Re: [PATCH v3] media: rkisp1: Increase ISP input resolution limit
To:     Sebastian Fricke <sebastian.fricke@posteo.net>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        heiko@sntech.de, Collabora Kernel ML <kernel@collabora.com>
References: <20210329061637.14921-1-sebastian.fricke@posteo.net>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <de156560-cf94-acbe-5838-287fd06f63c4@collabora.com>
Date:   Mon, 29 Mar 2021 09:37:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210329061637.14921-1-sebastian.fricke@posteo.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 29.03.21 08:16, Sebastian Fricke wrote:
> The current implementation limits the maximum sink pad resolution to
> 4032x3024, which is mentioned by the Rockchip TRM as the maximum size
> to handle black level correction. But the ISP can actually set its
> sink pad format to a size of 4416x3312.
> Allow higher sink pad resolutions in order to allow a bigger range of
> sensor modes to be used with the RkISP1.
> Apply the previous limit to the sink pad crop instead of the format to
> satisfy the requirement of the ISP.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@posteo.net>

sing-off of the author usually comes first and then the "reviewed-by".
Not sure if it meters.

> ---
>   .../platform/rockchip/rkisp1/rkisp1-common.h   | 18 +++++++++++++-----
>   .../platform/rockchip/rkisp1/rkisp1-isp.c      |  8 ++++++--
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 038c303a8aed..553a4b12becf 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -29,11 +29,19 @@
>   #define RKISP1_ISP_SD_SRC BIT(0)
>   #define RKISP1_ISP_SD_SINK BIT(1)
>   
> -/* min and max values for the widths and heights of the entities */
> -#define RKISP1_ISP_MAX_WIDTH		4032
> -#define RKISP1_ISP_MAX_HEIGHT		3024
> -#define RKISP1_ISP_MIN_WIDTH		32
> -#define RKISP1_ISP_MIN_HEIGHT		32
> +/*
> + * min and max values for the widths and heights of the entities
> + * The ISP device accepts input resolutions of up to 4416x3312, but
> + * it can only process resolutions of 4032x3024 internally.
> + * Therefore the crop resolution is limited to 4032x3024, the
> + * sink pad crop is applied automatically when the format is set.
> + */
> +#define RKISP1_ISP_MAX_WIDTH			4416
> +#define RKISP1_ISP_MAX_HEIGHT			3312
> +#define RKISP1_ISP_MAX_WIDTH_CROP		4032
> +#define RKISP1_ISP_MAX_HEIGHT_CROP		3024
> +#define RKISP1_ISP_MIN_WIDTH			32
> +#define RKISP1_ISP_MIN_HEIGHT			32
>   
>   #define RKISP1_RSZ_MP_SRC_MAX_WIDTH		4416
>   #define RKISP1_RSZ_MP_SRC_MAX_HEIGHT		3312
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2e5b57e3aedc..a8274e84a64b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -758,9 +758,13 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
>   					  which);
>   
>   	sink_crop->left = ALIGN(r->left, 2);
> -	sink_crop->width = ALIGN(r->width, 2);
> +	sink_crop->width = clamp_t(u32, ALIGN(r->width, 2),
> +				   RKISP1_ISP_MIN_WIDTH,
> +				   RKISP1_ISP_MAX_WIDTH_CROP);
>   	sink_crop->top = r->top;
> -	sink_crop->height = r->height;
> +	sink_crop->height = clamp_t(u32, r->height,
> +				    RKISP1_ISP_MIN_HEIGHT,
> +				    RKISP1_ISP_MAX_HEIGHT_CROP);

Hi, I think you should also update  the crop in rkisp1_isp_init_config
and also the values returned in get_selection for the sink pad's V4L2_SEL_TGT_CROP_BOUNDS.
I think because the sink crop bounds are now different than the sink format.
Did you run the compliance tests and made sure they pass?

Thanks,
Dafna

>   	rkisp1_sd_adjust_crop(sink_crop, sink_fmt);
>   
>   	*r = *sink_crop;
> 
