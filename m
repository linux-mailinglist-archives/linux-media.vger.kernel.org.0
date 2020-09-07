Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E1A2601E2
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 19:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbgIGROG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 13:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729795AbgIGOUS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:20:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41740C061574
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 07:19:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 16CEB2988B2
Subject: Re: [PATCH v4 06/10] media: staging: rkisp1: add a helper function to
 enumerate supported mbus formats on capture
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-7-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <a275c902-4dda-a06b-fc11-1acb40115ca2@collabora.com>
Date:   Mon, 7 Sep 2020 11:19:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901111612.10552-7-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/1/20 8:16 AM, Dafna Hirschfeld wrote:
> Add a function 'rkisp1_cap_enum_mbus_codes' that receive
> a pointer to 'v4l2_subdev_mbus_code_enum' and returns the
> next supported mbus format of the capture. The function
> assumes that pixel formats with identical 'mbus' are grouped
> together in the hardcoded arrays, therefore the order of the
> entries in the array 'rkisp1_sp_fmts' are adjusted.
> This function is a helper for the media bus enumeration of
> the source pad of the resizer entity.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 86 +++++++++++++------
>  drivers/staging/media/rkisp1/rkisp1-common.h  | 11 +++
>  2 files changed, 70 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index d23c9adc8201..531381e1801a 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -84,6 +84,10 @@ struct rkisp1_capture_config {
>  	} mi;
>  };
>  
> +/*
> + * The supported pixel formats for mainpath. NOTE, pixel formats with identical 'mbus'
> + * are grouped together. This is assumed and used by the function rkisp1_cap_enum_mbus_codes
> + */
>  static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  	/* yuv422 */
>  	{
> @@ -112,6 +116,13 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
> +	/* yuv400 */
> +	{
> +		.fourcc = V4L2_PIX_FMT_GREY,
> +		.uv_swap = 0,
> +		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	},
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> @@ -144,13 +155,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	},
> -	/* yuv400 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_GREY,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
>  	/* raw */
>  	{
>  		.fourcc = V4L2_PIX_FMT_SRGGB8,
> @@ -203,6 +207,10 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  	},
>  };
>  
> +/*
> + * The supported pixel formats for selfpath. NOTE, pixel formats with identical 'mbus'
> + * are grouped together. This is assumed and used by the function rkisp1_cap_enum_mbus_codes
> + */
>  static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  	/* yuv422 */
>  	{
> @@ -236,6 +244,26 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
> +	/* yuv400 */
> +	{
> +		.fourcc = V4L2_PIX_FMT_GREY,
> +		.uv_swap = 0,
> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	},
> +	/* rgb */
> +	{
> +		.fourcc = V4L2_PIX_FMT_XBGR32,
> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_RGB565,
> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	},
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> @@ -274,26 +302,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	},
> -	/* yuv400 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_GREY,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
> -	/* rgb */
> -	{
> -		.fourcc = V4L2_PIX_FMT_XBGR32,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_RGB565,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
>  };
>  
>  static const struct rkisp1_capture_config rkisp1_capture_config_mp = {
> @@ -334,6 +342,30 @@ rkisp1_vdev_to_node(struct video_device *vdev)
>  	return container_of(vdev, struct rkisp1_vdev_node, vdev);
>  }
>  
> +int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
> +			       struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	const struct rkisp1_capture_fmt_cfg *fmts = cap->config->fmts;
> +	/*
> +	 * initialize curr_mbus to non existing mbus code 0 to ensure it is
> +	 * different from fmts[0].mbus
> +	 */
> +	u32 curr_mbus = 0;
> +	int i, n = 0;

unsigned

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> +
> +	for (i = 0; i < cap->config->fmt_size; i++) {
> +		if (fmts[i].mbus == curr_mbus)
> +			continue;
> +
> +		curr_mbus = fmts[i].mbus;
> +		if (n++ == code->index) {
> +			code->code = curr_mbus;
> +			return 0;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
>  /* ----------------------------------------------------------------------------
>   * Stream operations for self-picture path (sp) and main-picture path (mp)
>   */
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 992d8ec4c448..8cdfcaab268e 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -410,6 +410,17 @@ static inline u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr)
>  	return readl(rkisp1->base_addr + addr);
>  }
>  
> +/*
> + * rkisp1_cap_enum_mbus_codes - A helper function that return the i'th supported mbus code
> + *				of the capture entity. This is used to enumerate the supported
> + *				mbus codes on the source pad of the resizer.
> + *
> + * @cap:  the capture entity
> + * @code: the mbus code, the function reads the code->index and fills the code->code
> + */
> +int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
> +			       struct v4l2_subdev_mbus_code_enum *code);
> +
>  /*
>   * rkisp1_sd_adjust_crop_rect - adjust a rectangle to fit into another rectangle.
>   *
> 
