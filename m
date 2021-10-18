Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377D04315D6
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 12:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhJRKWv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 18 Oct 2021 06:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhJRKWv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 06:22:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214F9C06161C
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 03:20:40 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPkm-00005Y-2v; Mon, 18 Oct 2021 12:20:24 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mcPkk-0005Gz-QR; Mon, 18 Oct 2021 12:20:22 +0200
Message-ID: <d1a0d97056afca0da8449757c6d10fd14f27dbc3.camel@pengutronix.de>
Subject: Re: [PATCHv2 4/4] media: imx: Use dedicated format handler for
 i.MX7/8
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@puri.sm, phone-devel@vger.kernel.org
Date:   Mon, 18 Oct 2021 12:20:22 +0200
In-Reply-To: <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
         <20211017102904.756408-4-dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dorota,

On Sun, 2021-10-17 at 13:08 +0200, Dorota Czaplejewicz wrote:
> This splits out a format handler which takes into account
> the capabilities of the i.MX7/8 video device,
> as opposed to the default handler compatible with both i.MX5/6 and i.MX7/8.
> 
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

Thank you, I agree this looks better than moving
imx_media_mbus_fmt_to_pix_fmt around. Comments below.

> ---
>  drivers/staging/media/imx/imx-media-utils.c | 78 +++++++++++++++++++--
>  1 file changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
> index e124dd722107..938db2e2ddb1 100644
> --- a/drivers/staging/media/imx/imx-media-utils.c
> +++ b/drivers/staging/media/imx/imx-media-utils.c
> @@ -516,10 +516,9 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
>  }
>  EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
>  
> -int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> -				  const struct v4l2_mbus_framefmt *mbus,
> -				  const struct imx_media_pixfmt *cc,
> -				  enum imx_device_type type)
> +static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +					   const struct v4l2_mbus_framefmt *mbus,
> +					   const struct imx_media_pixfmt *cc)
>  {
>  	u32 width;
>  	u32 stride;
> @@ -568,6 +567,77 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
>  
>  	return 0;
>  }
> +
> +static int imx78_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
> +					   const struct v4l2_mbus_framefmt *mbus,
> +					   const struct imx_media_pixfmt *cc)
> +{
> +	u32 width;
> +	u32 stride;
> +	u8 divisor;
> +
> +	if (!cc) {
> +		cc = imx_media_find_ipu_format(mbus->code,
> +					       PIXFMT_SEL_YUV_RGB);
> +		if (!cc)
> +			cc = imx_media_find_mbus_format(mbus->code,
> +							PIXFMT_SEL_ANY);
> +		if (!cc)
> +			return -EINVAL;
> +	}
> +
> +	/*
> +	 * TODO: the IPU currently does not support the AYUV32 format,
> +	 * so until it does convert to a supported YUV format.
> +	 */
> +	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
> +		u32 code;
> +
> +		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
> +		cc = imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
> +	}

This whole part seems too convoluted for the non-IPU CSI on i.MX7/8.
Certainly the TODO comment does not apply. There is no IPU on i.MX7/8,
and the CSI does not support AYUV32 if I read the datasheet correctly.

imx_media_find_ipu_format() just returns the two IPU internal 32-bit
formats, MEDIA_BUS_FMT_AYUV8_1X32/V4L2_PIX_FMT_YUV32 and
MEDIA_BUS_FMT_ARGB8888_1X32/V4L2_PIX_FMT_XRGB32, both of which can never
be set according to imx7_csi_pad_link_validate(). So I think this could
be reduced to just:

	if (!cc)
		cc = imx_media_find_mbus_format(mbus->code, PIXFMT_SEL_ANY);                                                                                                        

After the removal of imx_media_mbus_fmt_to_ipu_image(), the only place
where imx_media_find_mbus_format() is called with cc == NULL is
in capture_init_format(), with mbus format code MEDIA_BUS_FMT_UYVY8_2X8.

> +
> +	/*
> +	 * The hardware can handle line lengths divisible by 4 bytes,
> +	 * as long as the number of lines is even.
> +	 * Otherwise, use the value of 8 bytes recommended in the datasheet.
> +	 */

The comment talks about byte alignment but then the code goes on to
align the width in pixels, which may be confusing to the reader.

> +	divisor = 4 << (mbus->height % 2);

Since this is not used to actually divide anything, I'd avoid calling
this divisor. I'd suggest "align(ment)" or something similar.

Also I'd expect that for 16-bit formats like YUYV, 4 pixel alignment
should be ok for any height.

> +
> +	width = round_up(mbus->width, divisor);
> +
> +	if (cc->planar)
> +		stride = round_up(width, 16);
> +	else
> +		stride = round_up((width * cc->bpp) >> 3, divisor);

This is probably incorrect, and the driver doesn't use bytesperline
anyway. I think  the following should probably just use
v4l2_fill_pixfmt() to set width, height, pixelformat, bytesperline, and
sizeimage:

> +
> +	pix->width = width;
> +	pix->height = mbus->height;
> +	pix->pixelformat = cc->fourcc;
> +	pix->colorspace = mbus->colorspace;
> +	pix->xfer_func = mbus->xfer_func;
> +	pix->ycbcr_enc = mbus->ycbcr_enc;
> +	pix->quantization = mbus->quantization;
> +	pix->field = mbus->field;
> +	pix->bytesperline = stride;
> +	pix->sizeimage = cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
> +			 stride * pix->height;

regards
Philipp
