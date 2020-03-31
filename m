Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A2419A203
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 00:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731325AbgCaWk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 18:40:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50860 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729153AbgCaWk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 18:40:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 467A52971E5
Subject: Re: [PATCH v3 1/2] media: staging: rkisp1: remove mbus field from
 rkisp1_sensor_async
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org
References: <20200317180701.6035-1-dafna.hirschfeld@collabora.com>
 <20200317180701.6035-2-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <9c495498-ecea-3563-5c96-d17f27307264@collabora.com>
Date:   Tue, 31 Mar 2020 19:40:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200317180701.6035-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/17/20 3:07 PM, Dafna Hirschfeld wrote:
> 'struct v4l2_mbus_config' is a legacy struct that should not be used
> in new drivers. So replace it with the fields:
> 
> enum v4l2_mbus_type mbus_type;
> unsigned int mbus_flags;
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> no changes since v1.
> 
> changes since v2:
> - rename the field 'parallel_bus_flags' to 'mbus_flags'
> and set it to vep->bus.mipi_csi2.flags instead of 0.
> change the commit log accordingly.
> 
>  drivers/staging/media/rkisp1/rkisp1-common.h |  3 +-
>  drivers/staging/media/rkisp1/rkisp1-dev.c    | 20 ++------
>  drivers/staging/media/rkisp1/rkisp1-isp.c    | 52 +++++++-------------
>  3 files changed, 22 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index b291cc60de8e..e7b2dcb831a1 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -80,8 +80,9 @@ enum rkisp1_isp_pad {
>   */
>  struct rkisp1_sensor_async {
>  	struct v4l2_async_subdev asd;
> -	struct v4l2_mbus_config mbus;
>  	unsigned int lanes;
> +	enum v4l2_mbus_type mbus_type;
> +	unsigned int mbus_flags;
>  	struct v4l2_subdev *sd;
>  	struct v4l2_ctrl *pixel_rate_ctrl;
>  	struct phy *dphy;
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index b1b3c058e957..fcd2a3a4cc78 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -250,26 +250,12 @@ static int rkisp1_fwnode_parse(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> -	s_asd->mbus.type = vep->bus_type;
> -	s_asd->mbus.flags = vep->bus.mipi_csi2.flags;
> +	s_asd->mbus_type = vep->bus_type;
> +	s_asd->mbus_flags = vep->bus.mipi_csi2.flags;
>  	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
>  
> -	switch (vep->bus.mipi_csi2.num_data_lanes) {
> -	case 1:
> -		s_asd->mbus.flags |= V4L2_MBUS_CSI2_1_LANE;
> -		break;
> -	case 2:
> -		s_asd->mbus.flags |= V4L2_MBUS_CSI2_2_LANE;
> -		break;
> -	case 3:
> -		s_asd->mbus.flags |= V4L2_MBUS_CSI2_3_LANE;
> -		break;
> -	case 4:
> -		s_asd->mbus.flags |= V4L2_MBUS_CSI2_4_LANE;
> -		break;
> -	default:
> +	if (s_asd->lanes < 1 || s_asd->lanes > 4)
>  		return -EINVAL;
> -	}
>  
>  	return 0;
>  }
> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> index fa53f05e37d8..c69442005d8b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> @@ -291,7 +291,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
>  	if (sink_fmt->fmt_type == RKISP1_FMT_BAYER) {
>  		acq_mult = 1;
>  		if (src_fmt->fmt_type == RKISP1_FMT_BAYER) {
> -			if (sensor->mbus.type == V4L2_MBUS_BT656)
> +			if (sensor->mbus_type == V4L2_MBUS_BT656)
>  				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
>  			else
>  				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
> @@ -299,17 +299,17 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
>  			rkisp1_write(rkisp1, RKISP1_CIF_ISP_DEMOSAIC_TH(0xc),
>  				     RKISP1_CIF_ISP_DEMOSAIC);
>  
> -			if (sensor->mbus.type == V4L2_MBUS_BT656)
> +			if (sensor->mbus_type == V4L2_MBUS_BT656)
>  				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656;
>  			else
>  				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601;
>  		}
>  	} else if (sink_fmt->fmt_type == RKISP1_FMT_YUV) {
>  		acq_mult = 2;
> -		if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
> +		if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
>  			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
>  		} else {
> -			if (sensor->mbus.type == V4L2_MBUS_BT656)
> +			if (sensor->mbus_type == V4L2_MBUS_BT656)
>  				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656;
>  			else
>  				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
> @@ -319,17 +319,17 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
>  	}
>  
>  	/* Set up input acquisition properties */
> -	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
> -	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
> -		if (sensor->mbus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> +	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
> +	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
> +		if (sensor->mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>  			signal = RKISP1_CIF_ISP_ACQ_PROP_POS_EDGE;
>  	}
>  
> -	if (sensor->mbus.type == V4L2_MBUS_PARALLEL) {
> -		if (sensor->mbus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +	if (sensor->mbus_type == V4L2_MBUS_PARALLEL) {
> +		if (sensor->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>  			signal |= RKISP1_CIF_ISP_ACQ_PROP_VSYNC_LOW;
>  
> -		if (sensor->mbus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> +		if (sensor->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
>  			signal |= RKISP1_CIF_ISP_ACQ_PROP_HSYNC_LOW;
>  	}
>  
> @@ -401,29 +401,11 @@ static int rkisp1_config_dvp(struct rkisp1_device *rkisp1)
>  static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
>  {
>  	const struct rkisp1_isp_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
> -	unsigned int lanes;
> +	unsigned int lanes = rkisp1->active_sensor->lanes;
>  	u32 mipi_ctrl;
>  
> -	/*
> -	 * rkisp1->active_sensor->mbus is set in isp or d-phy notifier_bound
> -	 * function
> -	 */
> -	switch (rkisp1->active_sensor->mbus.flags & V4L2_MBUS_CSI2_LANES) {
> -	case V4L2_MBUS_CSI2_4_LANE:
> -		lanes = 4;
> -		break;
> -	case V4L2_MBUS_CSI2_3_LANE:
> -		lanes = 3;
> -		break;
> -	case V4L2_MBUS_CSI2_2_LANE:
> -		lanes = 2;
> -		break;
> -	case V4L2_MBUS_CSI2_1_LANE:
> -		lanes = 1;
> -		break;
> -	default:
> +	if (lanes < 1 || lanes > 4)
>  		return -EINVAL;
> -	}
>  
>  	mipi_ctrl = RKISP1_CIF_MIPI_CTRL_NUM_LANES(lanes - 1) |
>  		    RKISP1_CIF_MIPI_CTRL_SHUTDOWNLANES(0xf) |
> @@ -470,11 +452,11 @@ static int rkisp1_config_path(struct rkisp1_device *rkisp1)
>  	u32 dpcl = rkisp1_read(rkisp1, RKISP1_CIF_VI_DPCL);
>  	int ret = 0;
>  
> -	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
> -	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
> +	if (sensor->mbus_type == V4L2_MBUS_BT656 ||
> +	    sensor->mbus_type == V4L2_MBUS_PARALLEL) {
>  		ret = rkisp1_config_dvp(rkisp1);
>  		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_PARALLEL;
> -	} else if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
> +	} else if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
>  		ret = rkisp1_config_mipi(rkisp1);
>  		dpcl |= RKISP1_CIF_VI_DPCL_IF_SEL_MIPI;
>  	}
> @@ -561,7 +543,7 @@ static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
>  	rkisp1_config_clk(rkisp1);
>  
>  	/* Activate MIPI */
> -	if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
> +	if (sensor->mbus_type == V4L2_MBUS_CSI2_DPHY) {
>  		val = rkisp1_read(rkisp1, RKISP1_CIF_MIPI_CTRL);
>  		rkisp1_write(rkisp1, val | RKISP1_CIF_MIPI_CTRL_OUTPUT_ENA,
>  			     RKISP1_CIF_MIPI_CTRL);
> @@ -956,7 +938,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
>  	rkisp1->active_sensor = container_of(sensor_sd->asd,
>  					     struct rkisp1_sensor_async, asd);
>  
> -	if (rkisp1->active_sensor->mbus.type != V4L2_MBUS_CSI2_DPHY)
> +	if (rkisp1->active_sensor->mbus_type != V4L2_MBUS_CSI2_DPHY)
>  		return -EINVAL;
>  
>  	atomic_set(&rkisp1->isp.frame_sequence, -1);
> 
