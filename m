Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B686A1FB033
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgFPMSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:18:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46502 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgFPMSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:18:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 842C42A10B5
Subject: Re: [RESEND PATCH v3 5/6] media: staging: rkisp1: rename the field
 'direction' in 'rkisp1_isp_mbus_info' to 'isp_pads_mask'
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200613091353.12689-1-dafna.hirschfeld@collabora.com>
 <20200613091353.12689-6-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <a5e30c03-3e78-537c-b323-de8d407d03de@collabora.com>
Date:   Tue, 16 Jun 2020 09:18:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200613091353.12689-6-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On 6/13/20 6:13 AM, Dafna Hirschfeld wrote:
> The field 'direction' in 'struct rkisp1_isp_mbus_info' is a mask
> of the supported pads of the mbus code. Therefore
> the name 'isp_pads_mask' is better.

tbh, I'm not sure if it is better, since it feels it masks pads.

Also, the isp prefix is not required, since it is already inside rkisp1_isp_formats[].

My opinion is that the name "direction" make sense.

Or maybe some other name that reflects which pads the format applies to, but tbh
I think the current one is fine.

Regards,
Helen

> The patch also rename a local variable 'dir' that holds such mask
> to 'pad'.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 46 +++++++++----------
>  drivers/staging/media/rkisp1/rkisp1-resizer.c |  2 +-
>  3 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 12bd9d05050d..13c5eeff66f3 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -282,7 +282,7 @@ struct rkisp1_isp_mbus_info {
>  	u32 yuv_seq;
>  	u8 bus_width;
>  	enum rkisp1_fmt_raw_pat_type bayer_pat;
> -	unsigned int direction;
> +	unsigned int isp_pads_mask;
>  };
>  
>  static inline void
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index b21a67aea433..2dd01edf8ff1 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -58,119 +58,119 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
>  	{
>  		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
> -		.direction	= RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_RGGB,
>  		.bus_width	= 10,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_BGGR,
>  		.bus_width	= 10,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_GBRG,
>  		.bus_width	= 10,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_GRBG,
>  		.bus_width	= 10,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_RGGB,
>  		.bus_width	= 12,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_BGGR,
>  		.bus_width	= 12,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_GBRG,
>  		.bus_width	= 12,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_GRBG,
>  		.bus_width	= 12,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_RGGB,
>  		.bus_width	= 8,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_BGGR,
>  		.bus_width	= 8,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_GBRG,
>  		.bus_width	= 8,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_GRBG,
>  		.bus_width	= 8,
> -		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
>  		.bus_width	= 16,
> -		.direction	= RKISP1_ISP_SD_SINK,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
>  		.bus_width	= 16,
> -		.direction	= RKISP1_ISP_SD_SINK,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
>  		.bus_width	= 16,
> -		.direction	= RKISP1_ISP_SD_SINK,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
>  		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
>  		.bus_width	= 16,
> -		.direction	= RKISP1_ISP_SD_SINK,
> +		.isp_pads_mask	= RKISP1_ISP_SD_SINK,
>  	},
>  };
>  
> @@ -566,13 +566,13 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>  				     struct v4l2_subdev_pad_config *cfg,
>  				     struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	unsigned int i, dir;
> +	unsigned int i, pad;
>  	int pos = 0;
>  
>  	if (code->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
> -		dir = RKISP1_ISP_SD_SINK;
> +		pad = RKISP1_ISP_SD_SINK;
>  	} else if (code->pad == RKISP1_ISP_PAD_SOURCE_VIDEO) {
> -		dir = RKISP1_ISP_SD_SRC;
> +		pad = RKISP1_ISP_SD_SRC;
>  	} else {
>  		if (code->index > 0)
>  			return -EINVAL;
> @@ -586,7 +586,7 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>  	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
>  		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
>  
> -		if (fmt->direction & dir)
> +		if (fmt->isp_pads_mask & pad)
>  			pos++;
>  
>  		if (code->index == pos - 1) {
> @@ -657,7 +657,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  
>  	src_fmt->code = format->code;
>  	mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
> -	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
> +	if (!mbus_info || !(mbus_info->isp_pads_mask & RKISP1_ISP_SD_SRC)) {
>  		src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
>  		mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
>  	}
> @@ -741,7 +741,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
>  					  which);
>  	sink_fmt->code = format->code;
>  	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
> -	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
> +	if (!mbus_info || !(mbus_info->isp_pads_mask & RKISP1_ISP_SD_SINK)) {
>  		sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
>  		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>  	}
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 137298b77341..5d7a42be3d7f 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -542,7 +542,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>  					    which);
>  	sink_fmt->code = format->code;
>  	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
> -	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
> +	if (!mbus_info || !(mbus_info->isp_pads_mask & RKISP1_ISP_SD_SRC)) {
>  		sink_fmt->code = RKISP1_DEF_FMT;
>  		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>  	}
> 
