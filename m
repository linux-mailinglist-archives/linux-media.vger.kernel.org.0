Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167DC660A4B
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 00:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjAFXb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 18:31:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjAFXb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 18:31:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6956EF1E
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 15:31:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DF694AE;
        Sat,  7 Jan 2023 00:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673047913;
        bh=6bso9oqZaI8tQknV9goZ5oei1vPmSA9r1Hyp2f3EgME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kK8xyzeojCKiQ7yywWFuyRAMzr+2Y4QdOVqhminKUrbfujM3XzXcAlhpYAx8S/kEB
         F0Nr78jHUlAORgI1brdzZbaOXBV02PCuPo1sgxyDVLp22c/obJ4CTR3SlJUX2B5GjU
         yG+2hdNcTOSvjJSlg+5PXSbugS1uBB4RDRh2vaeo=
Date:   Sat, 7 Jan 2023 01:31:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     adam@piggz.co.uk
Cc:     linux-media@vger.kernel.org, yong.deng@magewell.com,
        mchehab@kernel.org, linux-sunxi@lists.linux.dev,
        paul.kocialkowski@bootlin.com
Subject: Re: [PATCH 1/3] media: sun6i-csi: merge sun6i_csi_formats and
 sun6i_csi_formats_match
Message-ID: <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-2-adam@piggz.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230106194038.16018-2-adam@piggz.co.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

Thank you for the patch.

On Fri, Jan 06, 2023 at 07:40:36PM +0000, adam@piggz.co.uk wrote:
> From: Adam Pigg <adam@piggz.co.uk>
> 
> Merged the two format arrays into sun6i_csi_capture_formats as a
> pre-requisite to implementing V4L2_CAP_IO_MC

I'll point to https://cbea.ms/git-commit/ if you haven't read it yet.
You can ignore the "Limit the subject line to 50 characters" rule and go
up to the normal 72 characters limit for commit messages, as 50 doesn't
include the prefixes commonly used in kernel commit messages.

For this specific patch, I would write

Information about media bus formats and pixel formats supported by the
driver is split between the sun6i_csi_capture_formats and
sun6i_csi_capture_format_matches arrays. This makes it difficult to map
media bus formats to pixel formats when enumerating the supported pixel
formats by walking the sun6i_csi_capture_formats array. To prepare for
support of media bus format support in sun6i_csi_capture_enum_fmt(),
merge the two arrays toegether.


An extra paragraph could be added to explain *how* this is being done,
but the implementation is straightforward enough to not require that.

> Signed-off-by: Adam Pigg <adam@piggz.co.uk>
> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 155 +++++-------------
>  .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   6 +-
>  2 files changed, 46 insertions(+), 115 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index 03d4adec054c..69578075421c 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -22,6 +22,8 @@
>  
>  /* Helpers */
>  
> +#define SUN6I_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
> +
>  void sun6i_csi_capture_dimensions(struct sun6i_csi_device *csi_dev,
>  				  unsigned int *width, unsigned int *height)
>  {
> @@ -49,72 +51,86 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
>  		.pixelformat		= V4L2_PIX_FMT_SBGGR8,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR8_1X8),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SGBRG8,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG8_1X8),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SGRBG8,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG8_1X8),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SRGGB8,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB8_1X8),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SBGGR10,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SGBRG10,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SGRBG10,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SRGGB10,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_10,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_10,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SBGGR12,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SBGGR12_1X12),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SGBRG12,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGBRG12_1X12),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SGRBG12,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SGRBG12_1X12),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_SRGGB12,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_12,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_12,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_SRGGB12_1X12),
>  	},
>  	/* RGB */
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_RGB565,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_LE),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_RGB565X,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RGB565,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RGB565,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_RGB565_2X8_BE),
>  	},
>  	/* YUV422 */
>  	{
> @@ -123,6 +139,8 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
>  		.input_format_raw	= true,
>  		.hsize_len_factor	= 2,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8,
> +							 MEDIA_BUS_FMT_YUYV8_1X16),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_YVYU,
> @@ -130,6 +148,8 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
>  		.input_format_raw	= true,
>  		.hsize_len_factor	= 2,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YVYU8_2X8,
> +							 MEDIA_BUS_FMT_YVYU8_1X16),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_UYVY,
> @@ -137,6 +157,8 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
>  		.input_format_raw	= true,
>  		.hsize_len_factor	= 2,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> +							 MEDIA_BUS_FMT_UYVY8_1X16),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_VYUY,
> @@ -144,57 +166,68 @@ static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] = {
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
>  		.input_format_raw	= true,
>  		.hsize_len_factor	= 2,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_VYUY8_2X8,
> +							 MEDIA_BUS_FMT_VYUY8_1X16),
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_NV16,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> +		.mbus_codes		= 0,

I don't think this is correct. To produce semi-planar or multi-planar
YUV formats, I believe the CSI needs YUV input. This should thus be
(unless I'm mistaken)

		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
							 MEDIA_BUS_FMT_UYVY8_1X16,
							 MEDIA_BUS_FMT_VYUY8_2X8,
							 MEDIA_BUS_FMT_VYUY8_1X16,
							 MEDIA_BUS_FMT_YUYV8_2X8,
							 MEDIA_BUS_FMT_YUYV8_1X16,
							 MEDIA_BUS_FMT_YVYU8_2X8,
							 MEDIA_BUS_FMT_YVYU8_1X16),

and same below.

Paul, could you confirm this ?

I'm a bit surprised that the CSI can't shuffle the YUV components for
packed YUYV formats, but so be it if that's a hardware limitation.

I'm also thinking that a subsequent patch could drop the raw check from
sun6i_csi_capture_link_validate():

-	/* With raw input mode, we need a 1:1 match between input and output. */
-	if (bridge_format->input_format == SUN6I_CSI_INPUT_FMT_RAW ||
-	    capture_format->input_format_raw) {
-		match = sun6i_csi_capture_format_match(pixelformat,
-						       fmt.format.code);
-		if (!match)
-			goto invalid;
-	}
+	/* Make sure the media bus code and pixel format are compatible. */
+	match = sun6i_csi_capture_format_match(pixelformat, fmt.format.code);
+	if (!match)
+		goto invalid;

>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_NV61,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
>  		.input_yuv_seq_invert	= true,
> +		.mbus_codes		= 0,
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_YUV422P,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P,
> +		.mbus_codes		= 0,
>  	},
>  	/* YUV420 */
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_NV12_16L16,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB,
> +		.mbus_codes		= 0,
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_NV12,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> +		.mbus_codes		= 0,
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_NV21,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
>  		.input_yuv_seq_invert	= true,
> +		.mbus_codes		= 0,
>  	},
>  
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_YUV420,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> +		.mbus_codes		= 0,
>  	},
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_YVU420,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
>  		.input_yuv_seq_invert	= true,
> +		.mbus_codes		= 0,
>  	},
>  	/* Compressed */
>  	{
>  		.pixelformat		= V4L2_PIX_FMT_JPEG,
>  		.output_format_frame	= SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
>  		.output_format_field	= SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> +		.mbus_codes		= SUN6I_BUS_FMTS(MEDIA_BUS_FMT_JPEG_1X8),
>  	},
>  };
>  
> @@ -210,118 +243,20 @@ struct sun6i_csi_capture_format *sun6i_csi_capture_format_find(u32 pixelformat)
>  	return NULL;
>  }
>  
> -/* RAW formats need an exact match between pixel and mbus formats. */
> -static const
> -struct sun6i_csi_capture_format_match sun6i_csi_capture_format_matches[] = {
> -	/* YUV420 */
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_YUYV,
> -		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_YUYV,
> -		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_YVYU,
> -		.mbus_code	= MEDIA_BUS_FMT_YVYU8_2X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_YVYU,
> -		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_UYVY,
> -		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_UYVY,
> -		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_VYUY,
> -		.mbus_code	= MEDIA_BUS_FMT_VYUY8_2X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_VYUY,
> -		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
> -	},
> -	/* RGB */
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_RGB565,
> -		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_LE,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_RGB565X,
> -		.mbus_code	= MEDIA_BUS_FMT_RGB565_2X8_BE,
> -	},
> -	/* Bayer */
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SBGGR8,
> -		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SGBRG8,
> -		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SGRBG8,
> -		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SRGGB8,
> -		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SBGGR10,
> -		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SGBRG10,
> -		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SGRBG10,
> -		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SRGGB10,
> -		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SBGGR12,
> -		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SGBRG12,
> -		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SGRBG12,
> -		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
> -	},
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_SRGGB12,
> -		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
> -	},
> -	/* Compressed */
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_JPEG,
> -		.mbus_code	= MEDIA_BUS_FMT_JPEG_1X8,
> -	},
> -};
> -
>  static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
>  {
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
> -		const struct sun6i_csi_capture_format_match *match =
> -			&sun6i_csi_capture_format_matches[i];
> -
> -		if (match->pixelformat == pixelformat &&
> -		    match->mbus_code == mbus_code)
> -			return true;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> +		const struct sun6i_csi_capture_format *format =
> +			&sun6i_csi_capture_formats[i];
> +
> +		if (format->pixelformat == pixelformat) {
> +			for (j = 0; format->mbus_codes[j]; j++) {
> +				if (mbus_code == format->mbus_codes[j])
> +					return true;
> +			}
> +		}
>  	}
>  
>  	return false;
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> index 3ee5ccefbd10..0484942834e3 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> @@ -27,11 +27,7 @@ struct sun6i_csi_capture_format {
>  	bool	input_yuv_seq_invert;
>  	bool	input_format_raw;
>  	u32	hsize_len_factor;
> -};
> -
> -struct sun6i_csi_capture_format_match {
> -	u32	pixelformat;
> -	u32	mbus_code;
> +	const u32 *mbus_codes;
>  };
>  
>  #undef current

-- 
Regards,

Laurent Pinchart
