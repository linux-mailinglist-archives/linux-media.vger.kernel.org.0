Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4528FC7F
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 09:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfHPHi1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 03:38:27 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37617 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbfHPHi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 03:38:27 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yWoWh0oGSzaKOyWoZhlDmM; Fri, 16 Aug 2019 09:38:24 +0200
Subject: Re: [PATCH v6 07/11] media: cedrus: Specify H264 startcode and
 decoding mode
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
References: <20190814195931.6587-1-ezequiel@collabora.com>
 <20190814195931.6587-8-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a7dab464-5be0-ff9d-7547-735a83e87e14@xs4all.nl>
Date:   Fri, 16 Aug 2019 09:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814195931.6587-8-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJSvcLnjP+g63vpsjfpfVM+XMWprF9PTKdzv1Ti/D/eurB2I6cyWrBsc2LNpV9VytsmtO9ZG3cs012z/LDDUzI9FyDwb5z6Q0DeXWYrcPV1D7cDTWugg
 IkbeQgOVeJMIGGW6zg91Hr7WqJfP1jVcsxeGcg3vWPaOE2IY/RZhgQrmSfLLuZD7DbaCO+w9hRwPzdJTalZZla7qgGBUhZHoMpnjbrDgrj0LfliodDyNL4bh
 8UGvMx9BCQzOvZtBj4h76kMZkGOrq/p0sPNxbwlSrj8YUPaViTEAXQegPzHpk0L4eyY+3qPrhzZqCOGOtTIYMWA0BQPhnbijGKpHMyanZrJDIDZkozuytMDr
 qJxqP+dAHT/h3rW9Rh8tgICrfVejzmn8Pnncr446sHtjYxeutcQaMBF9fq0b/24jWc/MFpcwkbzQGSYGdHhxdaOmEpz1cb4C3zg1sY1cqh6uMD+A6IXDLar/
 huD9QGzNMEmYYYAQGqEQ+Eh/dHnXXZcEX/tW4JsXhbmgXSB22M79daQcmlE7VqX9V6Mz8f7FJaYTH39llcApaPWWWCPsDEN3PLQGtRIoU2i9VQ8dTAoIihyD
 4E8zTCq4oNMvQlFPFnHFHz/tG6AVmGe/TUaEMvSIzGveZeUWxeCjWR/QqlvG5YFYhZ4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 9:59 PM, Ezequiel Garcia wrote:
> The cedrus VPU is slice-based and expects V4L2_PIX_FMT_H264_SLICE
> buffers to contain H264 slices with no start code.
> 
> Expose this to userspace with the newly added menu control.
> 
> These two controls are specified as mandatory for applications,
> but we mark them as non-required on the driver side for
> backwards compatibility.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes in v6:
> * Adjust to control renames.
> Changes in v5:
> * Clarify commit log.
> Changes in v4:
> * New patch.
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index 7bdc413bf727..69a836aa11ef 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,26 @@ static const struct cedrus_control cedrus_controls[] = {
>  		.codec		= CEDRUS_CODEC_H264,
>  		.required	= true,
>  	},
> +	{
> +		.cfg = {
> +			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
> +			.max	= V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
> +			.def	= V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
> +			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED),

You don't need this: DECODE_MODE_FRAME_BASED > DECODE_MODE_SLICE_BASED (the max
value). So no need to set the skip_mask since it is out of range.

> +		},
> +		.codec		= CEDRUS_CODEC_H264,
> +		.required	= false,
> +	},
> +	{
> +		.cfg = {
> +			.id	= V4L2_CID_MPEG_VIDEO_H264_START_CODE,
> +			.max	= V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
> +			.def	= V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
> +			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B),

Ditto.

Regards,

	Hans

> +		},
> +		.codec		= CEDRUS_CODEC_H264,
> +		.required	= false,
> +	},
>  };
>  
>  #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
> 

