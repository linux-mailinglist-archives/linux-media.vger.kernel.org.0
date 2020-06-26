Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C7120AEC3
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 11:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgFZJLY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 26 Jun 2020 05:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgFZJLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 05:11:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6D2C08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 02:11:23 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jokOH-0003Tf-Eb; Fri, 26 Jun 2020 11:11:21 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jokOG-0002e9-Ry; Fri, 26 Jun 2020 11:11:20 +0200
Message-ID: <eeabdb6781be889f2281570b09ab20a75d46b366.camel@pengutronix.de>
Subject: Re: [PATCH] MEDIA: i.MX6: Support 16-bit BT.1120 video input
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Date:   Fri, 26 Jun 2020 11:11:20 +0200
In-Reply-To: <m3tv0ivm5k.fsf@t19.piap.pl>
References: <m3tv0ivm5k.fsf@t19.piap.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

I have some doubts about this patch, see below:

On Thu, 2020-05-14 at 12:36 +0200, Krzysztof Hałasa wrote:
> This patch adds support for BT.1120 mode (16-bit version of BT.656)
> on i.MX6.
> 
> Basically, BT.1120 sends Y data over one set of 8 lines, and at the same
> time sends multiplexed U/V data over another set of 8 lines. Everything
> uses the same single clock input. DE signal may optionally be used,
> H and V syncs are not used. The start and stop codes are the same as in
> BT.656 mode, and are transmitted in both Y and U/V channels.
> 
> It appears the proper format designation for this mode is
> MEDIA_BUS_FMT_YUYV8_1X16. It could be extended to support 10-bit data as
> well (YUYV10_1X20), but I don't have necessary hardware to easily test
> it.
> 
> Note that both these 8-bit (tested) and 10-bit modes, according to the
> docs, can be used directly, without the so called "passthrough".
> Also note the hardware bus width should not be used when determining the
> exact transfer mode - data format should be used for this (we can have
> a "narrow" device connected to a "wide" bus).
> 
> This patch assumes BT.1120 uses SDR signaling. It will need to be
> modified if/when there is hw using DDR.

How could DDR signaling be configured?

> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
> index 658c173bebdf..e352757f3f0f 100644
> --- a/drivers/gpu/ipu-v3/ipu-csi.c
> +++ b/drivers/gpu/ipu-v3/ipu-csi.c
> @@ -250,22 +250,18 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_config *cfg, u32 mbus_code,
>  		cfg->mipi_dt = MIPI_DT_RGB888;
>  		cfg->data_width = IPU_CSI_DATA_WIDTH_8;
>  		break;
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
>  	case MEDIA_BUS_FMT_UYVY8_2X8:
>  		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_YUV422_UYVY;
>  		cfg->mipi_dt = MIPI_DT_YUV422;
>  		cfg->data_width = IPU_CSI_DATA_WIDTH_8;
>  		break;
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
>  	case MEDIA_BUS_FMT_YUYV8_2X8:
>  		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_YUV422_YUYV;
>  		cfg->mipi_dt = MIPI_DT_YUV422;
>  		cfg->data_width = IPU_CSI_DATA_WIDTH_8;
>  		break;
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -	case MEDIA_BUS_FMT_YUYV8_1X16:
> -		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
> -		cfg->mipi_dt = MIPI_DT_YUV422;
> -		cfg->data_width = IPU_CSI_DATA_WIDTH_16;
> -		break;

I think this will break support for devices that send 16-bit YUYV but
that use HSYNC/VSYNC instead of BT.1120 signaling. For those we can only
use passthrough mode.

> 	case MEDIA_BUS_FMT_SBGGR8_1X8:
>  	case MEDIA_BUS_FMT_SGBRG8_1X8:
>  	case MEDIA_BUS_FMT_SGRBG8_1X8:
> @@ -352,7 +348,7 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *csicfg,
>  			    const struct v4l2_mbus_config *mbus_cfg,
>  			    const struct v4l2_mbus_framefmt *mbus_fmt)
>  {
> -	int ret;
> +	int ret, is_bt1120;
>  
>  	memset(csicfg, 0, sizeof(*csicfg));
>  
> @@ -373,11 +369,18 @@ static int fill_csi_bus_cfg(struct ipu_csi_bus_config *csicfg,
>  		break;
>  	case V4L2_MBUS_BT656:
>  		csicfg->ext_vsync = 0;
> +		/* UYVY10_1X20 etc. could be supported as well */
> +		is_bt1120 = mbus_fmt->code == MEDIA_BUS_FMT_UYVY8_1X16 ||
> +			mbus_fmt->code == MEDIA_BUS_FMT_YUYV8_1X16;
>  		if (V4L2_FIELD_HAS_BOTH(mbus_fmt->field) ||
>  		    mbus_fmt->field == V4L2_FIELD_ALTERNATE)
> -			csicfg->clk_mode = IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
> +			csicfg->clk_mode = is_bt1120 ?
> +				IPU_CSI_CLK_MODE_CCIR1120_INTERLACED_SDR :
> +				IPU_CSI_CLK_MODE_CCIR656_INTERLACED;
>  		else
> -			csicfg->clk_mode = IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
> +			csicfg->clk_mode = is_bt1120 ?
> +				IPU_CSI_CLK_MODE_CCIR1120_PROGRESSIVE_SDR :
> +				IPU_CSI_CLK_MODE_CCIR656_PROGRESSIVE;
>  		break;
>  	case V4L2_MBUS_CSI2_DPHY:
>  		/*
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index d9e5388ffeb5..3d1d184a0ba7 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -123,27 +123,21 @@ static inline bool is_parallel_bus(struct v4l2_fwnode_endpoint *ep)
>  	return ep->bus_type != V4L2_MBUS_CSI2_DPHY;
>  }
>  
> -static inline bool is_parallel_16bit_bus(struct v4l2_fwnode_endpoint *ep)
> -{
> -	return is_parallel_bus(ep) && ep->bus.parallel.bus_width >= 16;
> -}
> -
>  /*
>   * Check for conditions that require the IPU to handle the
>   * data internally as generic data, aka passthrough mode:
>   * - raw bayer media bus formats, or
> - * - the CSI is receiving from a 16-bit parallel bus, or

This is still true for HSYNC/VSYNC signaling.

> - * - the CSI is receiving from an 8-bit parallel bus and the incoming
> - *   media bus format is other than UYVY8_2X8/YUYV8_2X8.
> + * - other unsupported modes such as JPEG, Y8 etc.
>   */
>  static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
>  					struct v4l2_mbus_framefmt *infmt,
>  					const struct imx_media_pixfmt *incc)
>  {
> -	return incc->bayer || is_parallel_16bit_bus(ep) ||
> -		(is_parallel_bus(ep) &&
> +	return incc->bayer || (is_parallel_bus(ep) &&
>  		 infmt->code != MEDIA_BUS_FMT_UYVY8_2X8 &&
> -		 infmt->code != MEDIA_BUS_FMT_YUYV8_2X8);
> +		 infmt->code != MEDIA_BUS_FMT_UYVY8_1X16 &&
> +		 infmt->code != MEDIA_BUS_FMT_YUYV8_2X8 &&
> +		 infmt->code != MEDIA_BUS_FMT_YUYV8_1X16);

So I don't think it is that easy, we have to take into account
v4l2_mbus_config::type here.

regards
Philipp
