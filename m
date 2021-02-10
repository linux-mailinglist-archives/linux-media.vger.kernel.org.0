Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42B63166EA
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 13:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhBJMj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 07:39:57 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60106 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbhBJMiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 07:38:01 -0500
Received: from [IPv6:2003:c7:cf1c:ce00:58d3:2ef0:81e3:2560] (p200300c7cf1cce0058d32ef081e32560.dip0.t-ipconnect.de [IPv6:2003:c7:cf1c:ce00:58d3:2ef0:81e3:2560])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 931101F45534;
        Wed, 10 Feb 2021 12:37:16 +0000 (GMT)
Subject: Re: [RFC PATCH v6 01/11] media: v4l2-common: add normalized
 pixelformat field to struct v4l2_format_info
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        boris.brezillon@collabora.com, hiroh@chromium.org,
        nicolas@ndufresne.ca, Brian.Starkey@arm.com, kernel@collabora.com,
        narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
        frkoenig@chromium.org, stanimir.varbanov@linaro.org,
        tfiga@chromium.org
References: <20210114180738.1758707-1-helen.koike@collabora.com>
 <20210114180738.1758707-2-helen.koike@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <dfe7ac82-a5c8-5414-9b82-b1a3b7fd9fe6@collabora.com>
Date:   Wed, 10 Feb 2021 13:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210114180738.1758707-2-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Am 14.01.21 um 19:07 schrieb Helen Koike:
> Add normalization to pixelformats, so we can fallback to it when using
> Ext API, and eliminating the handling of two variantes (M and non-M
> formats).
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> Changes in v6:
> - New patch
> ---
>   drivers/media/v4l2-core/v4l2-common.c | 16 ++++++++--------
>   include/media/v4l2-common.h           |  3 +++
>   2 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 78007dba4677..002051b9dc0c 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -276,17 +276,17 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>   		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>   
>   		/* YUV planar formats, non contiguous variant */
> -		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_YVU420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_YUV422M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2, .norm= V4L2_PIX_FMT_YUV420 },
's/norm= /norm =/'

Thanks,
Dafna

> +		{ .format = V4L2_PIX_FMT_YVU420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2, .norm= V4L2_PIX_FMT_YVU420 },
> +		{ .format = V4L2_PIX_FMT_YUV422M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1, .norm= V4L2_PIX_FMT_YUV422P },
>   		{ .format = V4L2_PIX_FMT_YVU422M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_YUV444M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YUV444M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1, .norm= V4L2_PIX_FMT_YUV444 },
>   		{ .format = V4L2_PIX_FMT_YVU444M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
>   
> -		{ .format = V4L2_PIX_FMT_NV12M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_NV21M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_NV16M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_NV61M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_NV12M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .norm = V4L2_PIX_FMT_NV12 },
> +		{ .format = V4L2_PIX_FMT_NV21M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2, .norm = V4L2_PIX_FMT_NV21 },
> +		{ .format = V4L2_PIX_FMT_NV16M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1, .norm = V4L2_PIX_FMT_NV16 },
> +		{ .format = V4L2_PIX_FMT_NV61M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1, .norm = V4L2_PIX_FMT_NV61 },
>   
>   		/* Bayer RGB formats */
>   		{ .format = V4L2_PIX_FMT_SBGGR8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index be36cbdcc1bd..7236af1cfa2f 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -483,6 +483,8 @@ enum v4l2_pixel_encoding {
>    * @vdiv: Vertical chroma subsampling factor
>    * @block_w: Per-plane macroblock pixel width (optional)
>    * @block_h: Per-plane macroblock pixel height (optional)
> + * @norm: The normalized format that should be used in Ext API. Should be set
> + *	  to zero if @format is already the normalized version.
>    */
>   struct v4l2_format_info {
>   	u32 format;
> @@ -494,6 +496,7 @@ struct v4l2_format_info {
>   	u8 vdiv;
>   	u8 block_w[4];
>   	u8 block_h[4];
> +	u32 norm;
>   };
>   
>   static inline bool v4l2_is_format_rgb(const struct v4l2_format_info *f)
> 
