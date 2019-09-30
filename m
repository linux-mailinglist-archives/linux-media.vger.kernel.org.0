Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 365A4C1DA1
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 11:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730121AbfI3JFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 05:05:20 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53727 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727885AbfI3JFU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 05:05:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ErcHicx7P9D4hErcLiL5w1; Mon, 30 Sep 2019 11:05:17 +0200
Subject: Re: [Patch 16/16] media: ti-vpe: vpe: don't rely on colorspace member
 for conversion
To:     Benoit Parrot <bparrot@ti.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190927183650.31345-1-bparrot@ti.com>
 <20190927183650.31345-17-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <263b7b22-b867-3f73-bcaf-8978f9e3b415@xs4all.nl>
Date:   Mon, 30 Sep 2019 11:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927183650.31345-17-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLZZOfYKObMr6urVSkPtBD/MbO+Km7BSjMnj5CzysF2i2OpF2Q8YaxQzoGHEXqjOS/jbuu85uULhwQZ24TRaZjMDP6LGR7dG4LhZMG+BkwVH8/+x8oOF
 PocIACD1qnrnb+PdYrN6ssKhNZfgsE47GCLT/29F07JKU6WkM2KFk40gfc1fg0RbMODvAISt23vNS/n6SEOzkG1baDMTT0YJTgaq1AFSf8k3fgBXzM5TYsgN
 608IfxpkXSmIrFkVMYwP3jQvunQr/24aEeiOD6cZErttAjS54nsq9lZUeEjVgr9o
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/27/19 8:36 PM, Benoit Parrot wrote:
> Up to now VPE was relying on the colorspace value of struct v4l2_format
> as an indication to perform color space conversion from YUV to RGB or
> not.
> 
> Instead we should used the source/destination fourcc codes as a more
> reliable indication to perform color space conversion or not.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/ti-vpe/vpe.c | 41 ++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> index e30981cd3e8f..d002adc6263f 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -353,6 +353,32 @@ enum {
>  	Q_DATA_DST = 1,
>  };
>  
> +static bool is_fmt_rgb(u32 fourcc)
> +{
> +	if (fourcc == V4L2_PIX_FMT_RGB24 ||
> +	    fourcc == V4L2_PIX_FMT_BGR24 ||
> +	    fourcc == V4L2_PIX_FMT_RGB32 ||
> +	    fourcc == V4L2_PIX_FMT_BGR32 ||
> +	    fourcc == V4L2_PIX_FMT_RGB565 ||
> +	    fourcc == V4L2_PIX_FMT_RGB555)
> +		return true;
> +
> +	return false;
> +}

Why not add a 'bool is_rgb' to struct vpe_fmt?

It is all too easy to forget to update this function if a new RGB format is
added to the vpe_formats array in the future.

> +
> +/*
> + * This helper is only used to setup the color space converter
> + * the actual value returned is only to broadly differentiate between
> + * RGB and YUV
> + */
> +static enum  v4l2_colorspace fourcc_to_colorspace(u32 fourcc)

double space after enum.

> +{
> +	if (is_fmt_rgb(fourcc))
> +		return V4L2_COLORSPACE_SRGB;
> +
> +	return V4L2_COLORSPACE_SMPTE170M;
> +}

This is highly confusing. RGB or YUV conversion does not change the colorspace
at all.

There are four colorimetry related fields: colorspace, xfer_func, ycbcr_enc and
quantization. Most hardware (including this one AFAICT) have a 3x3 matrix + a
vector to do the conversion. This only allows you to convert between different
ycbcr encodings and quantization ranges. The colorspace and xfer_func parameters
stay unchanged (you need gamma tables and two other 3x3 matrices for that).

So if you want to set up the 3x3 matrix + vector correctly, then you need to
provide the ycbcr_enc value + quantization value of the source to your function.
ycbcr_enc is only valid of YUV pixelformats, of course, and you can use
V4L2_MAP_COLORSPACE_DEFAULT, V4L2_MAP_YCBCR_ENC_DEFAULT and V4L2_MAP_QUANTIZATION_DEFAULT
if one or more of these values as set by userspace are 0.

Since the V4L2 API does not (yet) support setting ycbcr_enc and quantization for the
capture queue you have to provide that information yourself:

For RGB ycbcr_enc is of course ignored, and quantization should be full range.
For YUV it depends: the quantization is always limited range, but for the ycbcr_enc
you have a choice: if the source was YUV, then you can decide to just copy the
ycbcr_enc value. Alternatively, you can convert to 601 for SDTV and 709 for anything
else. The latter is also the recommended choice if the source was RGB.

In any case, please do not use enum v4l2_colorspace in the csc_set_coeff function:
it's misleading.

https://hverkuil.home.xs4all.nl/spec/uapi/v4l/colorspaces.html and the following two
sections contain a lot of information about how colorspaces work.

Regards,

	Hans

> +
>  /* find our format description corresponding to the passed v4l2_format */
>  static struct vpe_fmt *__find_format(u32 fourcc)
>  {
> @@ -764,11 +790,10 @@ static void set_src_registers(struct vpe_ctx *ctx)
>  static void set_dst_registers(struct vpe_ctx *ctx)
>  {
>  	struct vpe_mmr_adb *mmr_adb = ctx->mmr_adb.addr;
> -	enum v4l2_colorspace clrspc = ctx->q_data[Q_DATA_DST].colorspace;
>  	struct vpe_fmt *fmt = ctx->q_data[Q_DATA_DST].fmt;
>  	u32 val = 0;
>  
> -	if (clrspc == V4L2_COLORSPACE_SRGB) {
> +	if (is_fmt_rgb(fmt->fourcc)) {
>  		val |= VPE_RGB_OUT_SELECT;
>  		vpdma_set_bg_color(ctx->dev->vpdma,
>  			(struct vpdma_data_format *)fmt->vpdma_fmt[0], 0xff);
> @@ -912,7 +937,8 @@ static int set_srcdst_params(struct vpe_ctx *ctx)
>  	set_dei_regs(ctx);
>  
>  	csc_set_coeff(ctx->dev->csc, &mmr_adb->csc_regs[0],
> -		s_q_data->colorspace, d_q_data->colorspace);
> +		      fourcc_to_colorspace(s_q_data->fmt->fourcc),
> +		      fourcc_to_colorspace(d_q_data->fmt->fourcc));
>  
>  	sc_set_hs_coeffs(ctx->dev->sc, ctx->sc_coeff_h.addr, src_w, dst_w);
>  	sc_set_vs_coeffs(ctx->dev->sc, ctx->sc_coeff_v.addr, src_h, dst_h);
> @@ -1285,7 +1311,7 @@ static void device_run(void *priv)
>  	if (ctx->deinterlacing)
>  		add_out_dtd(ctx, VPE_PORT_MV_OUT);
>  
> -	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
> +	if (is_fmt_rgb(d_q_data->fmt->fourcc)) {
>  		add_out_dtd(ctx, VPE_PORT_RGB_OUT);
>  	} else {
>  		add_out_dtd(ctx, VPE_PORT_LUMA_OUT);
> @@ -1327,7 +1353,7 @@ static void device_run(void *priv)
>  	}
>  
>  	/* sync on channel control descriptors for output ports */
> -	if (d_q_data->colorspace == V4L2_COLORSPACE_SRGB) {
> +	if (is_fmt_rgb(d_q_data->fmt->fourcc)) {
>  		vpdma_add_sync_on_channel_ctd(&ctx->desc_list,
>  			VPE_CHAN_RGB_OUT);
>  	} else {
> @@ -1682,10 +1708,7 @@ static int __vpe_try_fmt(struct vpe_ctx *ctx, struct v4l2_format *f,
>  		height = pix->height;
>  
>  	if (!pix->colorspace) {
> -		if (fmt->fourcc == V4L2_PIX_FMT_RGB24 ||
> -				fmt->fourcc == V4L2_PIX_FMT_BGR24 ||
> -				fmt->fourcc == V4L2_PIX_FMT_RGB32 ||
> -				fmt->fourcc == V4L2_PIX_FMT_BGR32) {
> +		if (is_fmt_rgb(fmt->fourcc)) {
>  			pix->colorspace = V4L2_COLORSPACE_SRGB;
>  		} else {
>  			if (height > 1280)	/* HD */
> 

