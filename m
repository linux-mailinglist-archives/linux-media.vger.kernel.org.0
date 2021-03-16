Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B6433DC21
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 19:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbhCPSHe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 14:07:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35842 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236265AbhCPSFr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 14:05:47 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 967FF8C8;
        Tue, 16 Mar 2021 19:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615917943;
        bh=b3H7xco2mtjXdf3pVzdPoH5EDV9IbI6hLidVHBvgGrI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TGpb6kWP+DiF01EVCBigDJ9lB4NNlOSXZAS/4uF4tiNJCZ1Kzt6walM9LvV+BTO+R
         r1o+9FfAVnPYgVQg2A9hl4tZuCu7t5R6wEHox03xacAcz6gfwIbuaXHiFfCeHgLOl9
         3URxnHPHU8caML82chzn8elOqYxIHwCDWnHjr6nU=
Date:   Tue, 16 Mar 2021 20:05:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     ezequiel@collabora.com, festevam@gmail.com,
        linux-media@vger.kernel.org, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, slongerbeam@gmail.com
Subject: Re: [PATCH] imx7-media-csi: csi2 only
Message-ID: <YFDzUpzZVrGbM793@pendragon.ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210316115635.4096574-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210316115635.4096574-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, Mar 16, 2021 at 12:56:35PM +0100, Martin Kepplinger wrote:
> ---
> 
> hi Laurent,
> 
> thanks a lot for posting this series!
> 
> First: I only test imx7-media-csi (csi bridge) because I run it on imx8mq.
> overall, I'm very happy with all of this and I get the same image out
> of it as I get with the mx6s_capture nxp driver.

That's good news :-)

> one issue I have is with is_csi2, so I post this patch that I need in
> order to test. It's obviously no solution, just to describe the issue:
> 
> I'm not sure why but imx7_csi_pad_link_validate() isn't called in my case
> and is_csi2 doesn't get set, so I force it. Would it make sense to make
> a dts property for this?

Some platforms support both parallel and CSI-2 inputs, so we can't
hardcode which one is used in DT. I'd advise trying to debug why the
function is never called in your case, it's meant to be called with the
following call stack

- imx7_csi_pad_link_validate() (through v4l2_subdev_pad_ops.link_validate)
- v4l2_subdev_link_validate() (through media_entity_operations.link_validate)
- __media_pipeline_start()
- imx_media_pipeline_set_stream()
- capture_start_streaming()
- ...

> The other thing is that
> v4l2-ctl --set-fmt-video=width=1280,height=720,pixelformat=0
> doesn't call the sensor drivers' set_fmt() pad function. That means that
> only the one mode I hard-code as default will work. instead I just see this:

That's expected. With a driver based on the media controller API, you
have to configure the format on each subdev manually. You can use the
media-ctl utility for that. The video node is only used to control the
DMA engine, the kernel driver doesn't propagate the configuration to
subdevices.

> [  742.977677] imx7-csi 30a90000.csi1_bridge: begin graph walk at 'csi capture'
> [  742.977702] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi' on stack
> [  742.977709] imx7-csi 30a90000.csi1_bridge: walk: skipping entity 'csi capture' (already seen)
> [  742.977714] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi'
> [  742.977720] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi capture'
> [  742.977985] imx7-csi 30a90000.csi1_bridge: begin graph walk at 'csi capture'
> [  742.977992] imx7-csi 30a90000.csi1_bridge: walk: pushing 'csi' on stack
> [  742.977997] imx7-csi 30a90000.csi1_bridge: walk: skipping entity 'csi capture' (already seen)
> [  742.978002] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi'
> [  742.978008] imx7-csi 30a90000.csi1_bridge: walk: returning entity 'csi capture'
> [  742.978025] mc: media_release: Media Release
> 
> Does anything come to your mind that would prevent the set_fmt call here?
> That's what the (nxp) mipi driver looks like I'm running here:
> https://source.puri.sm/martin.kepplinger/linux-next/-/blob/5.12-rc3/librem5__integration_byzantium/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c
> 
>  drivers/staging/media/imx/imx7-media-csi.c | 135 +++++++++------------
>  1 file changed, 60 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 56b92ba97d25..95c359019725 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -435,82 +435,67 @@ static void imx7_csi_configure(struct imx7_csi *csi)
>  		stride = out_pix->width;
>  	}
>  
> -	if (!csi->is_csi2) {
> -		dev_dbg(csi->dev, "%s: NOT is_csi2\n", __func__);
> -		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_GCLK_MODE | BIT_HSYNC_POL
> -		    | BIT_FCC | BIT_MCLKDIV(1) | BIT_MCLKEN;
> -
> -		cr18 |= BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> -			BIT_BASEADDR_CHG_ERR_EN;
> -
> -		if (out_pix->pixelformat == V4L2_PIX_FMT_UYVY ||
> -		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
> -			width *= 2;
> -	} else {
> -		dev_dbg(csi->dev, "%s: is_csi2\n", __func__);
> -
> -		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
> -		    | BIT_MCLKDIV(1) | BIT_MCLKEN;
> -
> -		cr18 |= BIT_DATA_FROM_MIPI;
> -
> -		switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
> -		case MEDIA_BUS_FMT_Y8_1X8:
> -		case MEDIA_BUS_FMT_SBGGR8_1X8:
> -		case MEDIA_BUS_FMT_SGBRG8_1X8:
> -		case MEDIA_BUS_FMT_SGRBG8_1X8:
> -		case MEDIA_BUS_FMT_SRGGB8_1X8:
> -			cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
> -			break;
> -		case MEDIA_BUS_FMT_Y10_1X10:
> -		case MEDIA_BUS_FMT_SBGGR10_1X10:
> -		case MEDIA_BUS_FMT_SGBRG10_1X10:
> -		case MEDIA_BUS_FMT_SGRBG10_1X10:
> -		case MEDIA_BUS_FMT_SRGGB10_1X10:
> -			dev_dbg(csi->dev, "%s: RAW10\n", __func__);
> -			cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
> -			break;
> -		case MEDIA_BUS_FMT_Y12_1X12:
> -		case MEDIA_BUS_FMT_SBGGR12_1X12:
> -		case MEDIA_BUS_FMT_SGBRG12_1X12:
> -		case MEDIA_BUS_FMT_SGRBG12_1X12:
> -		case MEDIA_BUS_FMT_SRGGB12_1X12:
> -			cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
> -			break;
> -		case MEDIA_BUS_FMT_Y14_1X14:
> -		case MEDIA_BUS_FMT_SBGGR14_1X14:
> -		case MEDIA_BUS_FMT_SGBRG14_1X14:
> -		case MEDIA_BUS_FMT_SGRBG14_1X14:
> -		case MEDIA_BUS_FMT_SRGGB14_1X14:
> -			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
> -			break;
> -		/*
> -		 * CSI-2 sources are supposed to use the 1X16 formats, but not
> -		 * all of them comply. Support both variants.
> -		 */
> -		case MEDIA_BUS_FMT_UYVY8_2X8:
> -		case MEDIA_BUS_FMT_UYVY8_1X16:
> -		case MEDIA_BUS_FMT_YUYV8_2X8:
> -		case MEDIA_BUS_FMT_YUYV8_1X16:
> -			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
> -			break;
> -		}
> +	cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
> +	    | BIT_MCLKDIV(1) | BIT_MCLKEN;
> +
> +	cr18 |= BIT_DATA_FROM_MIPI;
> +
> +	switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
> +	case MEDIA_BUS_FMT_Y8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		cr18 |= BIT_MIPI_DATA_FORMAT_RAW8;
> +		break;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		dev_dbg(csi->dev, "%s: RAW10\n", __func__);
> +		cr18 |= BIT_MIPI_DATA_FORMAT_RAW10;
> +		break;
> +	case MEDIA_BUS_FMT_Y12_1X12:
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		cr18 |= BIT_MIPI_DATA_FORMAT_RAW12;
> +		break;
> +	case MEDIA_BUS_FMT_Y14_1X14:
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +		cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
> +		break;
> +	/*
> +	 * CSI-2 sources are supposed to use the 1X16 formats, but not
> +	 * all of them comply. Support both variants.
> +	 */
> +	case MEDIA_BUS_FMT_UYVY8_2X8:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_2X8:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +		cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
> +		break;
> +	}
>  
> -		switch (out_pix->pixelformat) {
> -		case V4L2_PIX_FMT_Y10:
> -		case V4L2_PIX_FMT_Y12:
> -		case V4L2_PIX_FMT_SBGGR8:
> -		case V4L2_PIX_FMT_SGBRG8:
> -		case V4L2_PIX_FMT_SGRBG8:
> -		case V4L2_PIX_FMT_SRGGB8:
> -		case V4L2_PIX_FMT_SBGGR16:
> -		case V4L2_PIX_FMT_SGBRG16:
> -		case V4L2_PIX_FMT_SGRBG16:
> -		case V4L2_PIX_FMT_SRGGB16:
> -			dev_dbg(csi->dev, "%s: PIXEL_BIT\n", __func__);
> -			cr1 |= BIT_PIXEL_BIT;
> -			break;
> -		}
> +	switch (out_pix->pixelformat) {
> +	case V4L2_PIX_FMT_Y10:
> +	case V4L2_PIX_FMT_Y12:
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SBGGR16:
> +	case V4L2_PIX_FMT_SGBRG16:
> +	case V4L2_PIX_FMT_SGRBG16:
> +	case V4L2_PIX_FMT_SRGGB16:
> +		dev_dbg(csi->dev, "%s: PIXEL_BIT\n", __func__);
> +		cr1 |= BIT_PIXEL_BIT;
> +		break;
>  	}
>  
>  	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);

-- 
Regards,

Laurent Pinchart
