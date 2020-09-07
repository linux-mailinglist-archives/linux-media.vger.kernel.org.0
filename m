Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18F12601DC
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 19:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbgIGRNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 13:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729799AbgIGOWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:22:01 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5FDC061786
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 07:21:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E56E72925F1
Subject: Re: [PATCH v4 10/10] media: staging: rkisp1: fix configuration for
 GREY pixelformat
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-11-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <a87930d2-f7b1-c6c7-00b8-bb8213558e3b@collabora.com>
Date:   Mon, 7 Sep 2020 11:19:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901111612.10552-11-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/1/20 8:16 AM, Dafna Hirschfeld wrote:
> This patch changes the device configuration to support capture
> of V4L2_PIX_FMT_GREY video. The 'write_format' field of the format
> description should be planar.
> Also the array 'pixm->plane_fmt' that describes the planes should
> be memset to 0 before filling it since the the cb, cr planes should
> be 0.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>


Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 79ee6795a58f..6d02cb1c9c5b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -120,7 +120,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
>  		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> +		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
>  	/* yuv420 */
> @@ -248,7 +248,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
>  		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
> @@ -1059,6 +1059,7 @@ rkisp1_fill_pixfmt(struct v4l2_pix_format_mplane *pixm,
>  	unsigned int i;
>  	u32 stride;
>  
> +	memset(pixm->plane_fmt, 0, sizeof(pixm->plane_fmt));
>  	info = v4l2_format_info(pixm->pixelformat);
>  	pixm->num_planes = info->mem_planes;
>  	stride = info->bpp[0] * pixm->width;
> 
