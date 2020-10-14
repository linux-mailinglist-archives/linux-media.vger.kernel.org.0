Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E262728E7F0
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 22:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbgJNUkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 16:40:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52114 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbgJNUkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 16:40:25 -0400
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18BD91F4582E;
        Wed, 14 Oct 2020 21:40:20 +0100 (BST)
Subject: Re: [PATCH 2/2] media: staging: rkisp1: isp: set metadata pads to
 MEDIA_BUS_FMT_METADATA_FIXED
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200922165813.19378-1-dafna.hirschfeld@collabora.com>
 <20200922165813.19378-3-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <10d04515-3fbe-1b19-b142-ec6727b9aa2a@collabora.com>
Date:   Wed, 14 Oct 2020 17:40:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20200922165813.19378-3-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/22/20 1:58 PM, Dafna Hirschfeld wrote:
> Set the code of the metadata pads of the isp entity to
> MEDIA_BUS_FMT_METADATA_FIXED and set the width and
> height of their formats to 0. This solves the TODO
> item:
> "Fix pad format size for statistics and parameters entities."
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/TODO         | 1 -
>  drivers/staging/media/rkisp1/rkisp1-isp.c | 8 ++++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> index f0c90d1c86a8..f4a94eca6d31 100644
> --- a/drivers/staging/media/rkisp1/TODO
> +++ b/drivers/staging/media/rkisp1/TODO
> @@ -1,4 +1,3 @@
> -* Fix pad format size for statistics and parameters entities.
>  * Fix checkpatch errors.
>  * Review and comment every lock
>  * Handle quantization
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index 02eafea92863..a6c0f1eb0c5a 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -574,7 +574,7 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>  	} else {
>  		if (code->index > 0)
>  			return -EINVAL;
> -		code->code = MEDIA_BUS_FMT_FIXED;
> +		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
>  		return 0;
>  	}
>  
> @@ -630,10 +630,10 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>  					      RKISP1_ISP_PAD_SINK_PARAMS);
>  	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
>  					     RKISP1_ISP_PAD_SOURCE_STATS);
> -	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
> -	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
> +	sink_fmt->width = 0;
> +	sink_fmt->height = 0;
>  	sink_fmt->field = V4L2_FIELD_NONE;
> -	sink_fmt->code = MEDIA_BUS_FMT_FIXED;
> +	sink_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
>  	*src_fmt = *sink_fmt;
>  
>  	return 0;
> 
