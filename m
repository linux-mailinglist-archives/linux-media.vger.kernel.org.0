Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0403A20AE99
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgFZI6n convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 26 Jun 2020 04:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgFZI6n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:58:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB23C08C5C1
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:58:43 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jokC0-0001x4-7A; Fri, 26 Jun 2020 10:58:40 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jokBy-00013d-M8; Fri, 26 Jun 2020 10:58:38 +0200
Message-ID: <fd039306c9414da97b39e79ae4c20fca96043c3a.camel@pengutronix.de>
Subject: Re: MEDIA: Add support for RAW14 and RAW16 to IPUv3 CSI
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org
Date:   Fri, 26 Jun 2020 10:58:38 +0200
In-Reply-To: <m35zcyx2mt.fsf@t19.piap.pl>
References: <m35zcyx2mt.fsf@t19.piap.pl>
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

On Thu, 2020-05-14 at 11:54 +0200, Krzysztof Hałasa wrote:
> It appears the i.MX camera interface is missing support for 14- and 16-bit
> Bayer and B&W-only formats. Add it.
> 
> Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

Have these been tested? I see nothing obviously wrong, but this being
the IPUv3 ... things might not work as expected.

Please separate the media-bus-format.h and ipu-csi.c changes into
separate patches.

regards
Philipp

> 
> diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
> index 8ae301eef643..658c173bebdf 100644
> --- a/drivers/gpu/ipu-v3/ipu-csi.c
> +++ b/drivers/gpu/ipu-v3/ipu-csi.c
> @@ -128,6 +128,7 @@ struct ipu_csi {
>  #define MIPI_DT_RAW10		0x2b
>  #define MIPI_DT_RAW12		0x2c
>  #define MIPI_DT_RAW14		0x2d
> +#define MIPI_DT_RAW16		0x2e
>  
>  /*
>   * Bitfield of CSI bus signal polarities and modes.
> @@ -157,6 +158,7 @@ enum ipu_csi_data_width {
>  	IPU_CSI_DATA_WIDTH_8   = 1,
>  	IPU_CSI_DATA_WIDTH_10  = 3,
>  	IPU_CSI_DATA_WIDTH_12  = 5,
> +	IPU_CSI_DATA_WIDTH_14  = 7,
>  	IPU_CSI_DATA_WIDTH_16  = 9,
>  };
>  
> @@ -303,6 +305,24 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_config *cfg, u32 mbus_code,
>  		cfg->mipi_dt = MIPI_DT_RAW12;
>  		cfg->data_width = IPU_CSI_DATA_WIDTH_12;
>  		break;
> +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> +	case MEDIA_BUS_FMT_Y14_1X14:
> +		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
> +		cfg->mipi_dt = MIPI_DT_RAW14;
> +		cfg->data_width = IPU_CSI_DATA_WIDTH_14;
> +		break;
> +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> +	case MEDIA_BUS_FMT_Y16_1X16:
> +		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
> +		cfg->mipi_dt = MIPI_DT_RAW16;
> +		cfg->data_width = IPU_CSI_DATA_WIDTH_16;
> +		break;
>  	case MEDIA_BUS_FMT_JPEG_1X8:
>  		/* TODO */
>  		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_JPEG;
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 84fa53ffb13f..60a374374d16 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -64,7 +64,7 @@
>  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
>  #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
>  
> -/* YUV (including grey) - next is	0x202e */
> +/* YUV (including grey) - next is	0x202f */
>  #define MEDIA_BUS_FMT_Y8_1X8			0x2001
>  #define MEDIA_BUS_FMT_UV8_1X8			0x2015
>  #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
> @@ -87,6 +87,7 @@
>  #define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
>  #define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
>  #define MEDIA_BUS_FMT_Y14_1X14			0x202d
> +#define MEDIA_BUS_FMT_Y16_1X16			0x202e
>  #define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
>  #define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
>  #define MEDIA_BUS_FMT_YUYV8_1X16		0x2011
> 
