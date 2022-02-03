Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC354A8137
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 10:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349740AbiBCJLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 04:11:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41930 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349721AbiBCJLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 04:11:33 -0500
Received: from guri (unknown [IPv6:2a00:c281:14b9:b800:b1fd:f9f1:88bc:3a7f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 084751F451D6;
        Thu,  3 Feb 2022 09:11:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643879492;
        bh=OkXgKx1PAyKY+mbNz35KvtttTS1PGiXTU1OjzBNWFy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U8xBrw8d35pqUSXVLi18vaKm6y+EFT3OL3gPFKpffckinjnVKAH/sDKqHNmZ6racN
         qIz58ddUHSS1w8FqKldaLGzzZH2JNqC/1H7TfKj6ggBrnvN2jHlwy6v4JMW/KHNE/n
         ydQeBMd6vWIC66c3lDeENav0av24GuU0UCOcFAtt5jzFmXOZ6C9Kvnil7cRyKx/LrK
         R0QV43c7rZxyXEj7eG2EVqSDyTPnIz4ZRPiGEABs6FO1s91YZkhy/tPgRo2qlRm3rt
         gUP0LtHBFOX/ptVM9fj4OEtl68oTO0RdOJ6ZmbSZme/1oKuJbWzLnpYF1UVPHBfckh
         h97Bw4RL3eviw==
Date:   Thu, 3 Feb 2022 11:11:27 +0200
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 5/6] media: rockchip: rkisp1: Use mipi-csi2.h
Message-ID: <20220203085748.346rcafqno2ipnhs@guri>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220123160857.24161-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220123160857.24161-6-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested on rock-pi4 with few libcamera's 'cam' commands on several pixelformats

Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

On 23.01.2022 18:08, Laurent Pinchart wrote:
> Replace the driver-specific definitions of MIPI CSI-2 data types with
> macros from mipi-csi2.h.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 34 ++++++++++---------
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    | 11 ------
>  2 files changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2a35bf24e54e..4415c7248c2f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -14,6 +14,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
> +
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-event.h>
>  
>  #include "rkisp1-common.h"
> @@ -62,112 +64,112 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_RGGB,
>  		.bus_width	= 10,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_BGGR,
>  		.bus_width	= 10,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_GBRG,
>  		.bus_width	= 10,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW10,
>  		.bayer_pat	= RKISP1_RAW_GRBG,
>  		.bus_width	= 10,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_RGGB,
>  		.bus_width	= 12,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_BGGR,
>  		.bus_width	= 12,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_GBRG,
>  		.bus_width	= 12,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW12,
>  		.bayer_pat	= RKISP1_RAW_GRBG,
>  		.bus_width	= 12,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_RGGB,
>  		.bus_width	= 8,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_BGGR,
>  		.bus_width	= 8,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_GBRG,
>  		.bus_width	= 8,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
>  		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
> +		.mipi_dt	= MIPI_CSI2_DT_RAW8,
>  		.bayer_pat	= RKISP1_RAW_GRBG,
>  		.bus_width	= 8,
>  		.direction	= RKISP1_ISP_SD_SINK | RKISP1_ISP_SD_SRC,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
> +		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
>  		.bus_width	= 16,
>  		.direction	= RKISP1_ISP_SD_SINK,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
> +		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
>  		.bus_width	= 16,
>  		.direction	= RKISP1_ISP_SD_SINK,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
> +		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
>  		.bus_width	= 16,
>  		.direction	= RKISP1_ISP_SD_SINK,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
>  		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
> -		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
> +		.mipi_dt	= MIPI_CSI2_DT_YUV422_8B,
>  		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
>  		.bus_width	= 16,
>  		.direction	= RKISP1_ISP_SD_SINK,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index d326214c7e07..82f8d33d98b3 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -333,17 +333,6 @@
>  /* MIPI_DATA_SEL */
>  #define RKISP1_CIF_MIPI_DATA_SEL_VC(a)			(((a) & 0x3) << 6)
>  #define RKISP1_CIF_MIPI_DATA_SEL_DT(a)			(((a) & 0x3F) << 0)
> -/* MIPI DATA_TYPE */
> -#define RKISP1_CIF_CSI2_DT_YUV420_8b			0x18
> -#define RKISP1_CIF_CSI2_DT_YUV420_10b			0x19
> -#define RKISP1_CIF_CSI2_DT_YUV422_8b			0x1E
> -#define RKISP1_CIF_CSI2_DT_YUV422_10b			0x1F
> -#define RKISP1_CIF_CSI2_DT_RGB565			0x22
> -#define RKISP1_CIF_CSI2_DT_RGB666			0x23
> -#define RKISP1_CIF_CSI2_DT_RGB888			0x24
> -#define RKISP1_CIF_CSI2_DT_RAW8				0x2A
> -#define RKISP1_CIF_CSI2_DT_RAW10			0x2B
> -#define RKISP1_CIF_CSI2_DT_RAW12			0x2C
>  
>  /* MIPI_IMSC, MIPI_RIS, MIPI_MIS, MIPI_ICR, MIPI_ISR */
>  #define RKISP1_CIF_MIPI_SYNC_FIFO_OVFLW(a)		(((a) & 0xF) << 0)
> -- 
> Regards,
> 
> Laurent Pinchart
> 
