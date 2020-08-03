Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A1623B140
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 01:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgHCXuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 19:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgHCXuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 19:50:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E34C06174A
        for <linux-media@vger.kernel.org>; Mon,  3 Aug 2020 16:50:19 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id BA648291EDC
Subject: Re: [PATCH v3 05/10] media: staging: rkisp1: add capability
 V4L2_CAP_IO_MC to capture devices
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-6-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <bfe3f75b-0534-debe-fb30-281ded8150fc@collabora.com>
Date:   Mon, 3 Aug 2020 20:50:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723132014.4597-6-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch.

On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
> The capture devices supports YUV, RGB, and Bayer formats.
> Adding V4L2_CAP_IO_MC capability will reflect userspace
> what format should be set on the resizer in order to stream
> each of the video formats.
> 
> The patch adds a 'mbus' field to the struct
> 'rkisp1_capture_fmt_cfg' which maps the video format
> to the needed mbus format.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 60 +++++++++++++++++--
>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 27efec004686..5dd91b5f82a4 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -49,12 +49,14 @@ enum rkisp1_plane {
>   * @uv_swap: if cb cr swaped, for yuv
>   * @write_format: defines how YCbCr self picture data is written to memory
>   * @output_format: defines sp output format
> + * @mbus: the mbus code on the src resizer pad that matches the pixel format
>   */
>  struct rkisp1_capture_fmt_cfg {
>  	u32 fourcc;
>  	u8 uv_swap;
>  	u32 write_format;
>  	u32 output_format;
> +	u32 mbus;
>  };
>  
>  struct rkisp1_capture_ops {
> @@ -88,92 +90,116 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.fourcc = V4L2_PIX_FMT_YUYV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV16,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV61,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU422M,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV21M,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12M,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV420,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU420,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	},
>  	/* yuv400 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
>  	/* raw */
>  	{
>  		.fourcc = V4L2_PIX_FMT_SRGGB8,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_SRGGB8_1X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG8,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_SGRBG8_1X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG8,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_SGBRG8_1X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR8,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> +		.mbus = MEDIA_BUS_FMT_SBGGR8_1X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB10,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SRGGB10_1X10,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG10,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SGRBG10_1X10,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG10,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SGBRG10_1X10,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR10,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SBGGR10_1X10,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SRGGB12,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SRGGB12_1X12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGRBG12,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SGRBG12_1X12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SGBRG12,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SGBRG12_1X12,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_SBGGR12,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
> +		.mbus = MEDIA_BUS_FMT_SBGGR12_1X12,
>  	},
>  };
>  
> @@ -184,26 +210,31 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV16,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV61,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU422M,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
>  	/* yuv420 */
>  	{
> @@ -211,31 +242,37 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV21M,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_NV12M,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV420,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YVU420,
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	},
>  	/* yuv400 */
>  	{
> @@ -243,16 +280,19 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
>  	/* rgb */
>  	{
>  		.fourcc = V4L2_PIX_FMT_XBGR32,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_RGB565,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
>  };
>  
> @@ -1107,11 +1147,23 @@ static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
>  	struct rkisp1_capture *cap = video_drvdata(file);
>  	const struct rkisp1_capture_fmt_cfg *fmt = NULL;
>  
> -	if (f->index >= cap->config->fmt_size)
> +	if (f->mbus_code) {
> +		int i, n = 0;

unsigned

> +
> +		for (i = 0; i < cap->config->fmt_size; i++)
> +			if (cap->config->fmts[i].mbus == f->mbus_code)
> +				if (n++ == f->index) {
> +					f->pixelformat = cap->config->fmts[i].fourcc;
> +					return 0;
> +				}
>  		return -EINVAL;
> +	} else {
> +		if (f->index >= cap->config->fmt_size)
> +			return -EINVAL;
>  
> -	fmt = &cap->config->fmts[f->index];
> -	f->pixelformat = fmt->fourcc;
> +		fmt = &cap->config->fmts[f->index];
> +		f->pixelformat = fmt->fourcc;
> +	}
>  
>  	return 0;

Maybe remove one level of indentation by checking first:

if (!f->mbus_code) {
    ...
    return 0;
}

// the else case without an else statement

Thanks,
Helen

>  }
> @@ -1261,7 +1313,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	vdev->v4l2_dev = v4l2_dev;
>  	vdev->lock = &node->vlock;
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> -			    V4L2_CAP_STREAMING;
> +			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>  	vdev->entity.ops = &rkisp1_media_ops;
>  	video_set_drvdata(vdev, cap);
>  	vdev->vfl_dir = VFL_DIR_RX;
> 
