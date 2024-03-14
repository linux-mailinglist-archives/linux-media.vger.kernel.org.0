Return-Path: <linux-media+bounces-7047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC6787B93C
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 09:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69C2F1C210CB
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 08:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070895DF30;
	Thu, 14 Mar 2024 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3uQXLQzH"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D0B5D908
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710404694; cv=none; b=W2qljjNHWhiwQj7GGLZB7O+Cbyzk+UXTtDK7HBm/O+RnzabWpLYwfsQfAqPKUIoRz1FX5o4+p0phXrqjD/MegfPXoY2/CoWOkWEZWhmdRPRlB909EJEek0b22Tp6934RD67hq1ZtwCMZJ9B4WZa28lnClOErywfw+/N8UQQfOAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710404694; c=relaxed/simple;
	bh=OQ0HdCG5KEMLjqe/Lm0uKPgaoeyiPd0HC21GZkAEPwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNbBO49ahijGapubt0JZ0p8P5fZqMt8EMG1mRtH8rEjTM1zEjFp+f3hUwwdvxhN5QLQ3E6xcTWtOtpAAYwtWkMVp5TK0YdcMkzdq2gLf4WC4KZDu8/z3cP8FHi1Z/fBLaIk0KjJWbl0YOj/PT/SRREJo7DP01hjiXwiplgUG7pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3uQXLQzH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710404690;
	bh=OQ0HdCG5KEMLjqe/Lm0uKPgaoeyiPd0HC21GZkAEPwI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3uQXLQzHAuRQ82EEQYTTW6Rws5jSFHFZ1iTINEmCUxCyE1WzGgwyhZI1PX+UAAcjN
	 b0d85jnHKLQvzYf9DCIBfYKcJN5nlyvGN4PDtsWQVT4NRWCT7UpU2sTgTqzNIIM7Aw
	 H6xv3b4L9HKYcBQhygMRjKkosTCsuOj9Mczxq6e29Nexehlk+KFlYL18FNqGtXIy8R
	 CmyBJmLc15wjo7JN17ExJVv/f2sYJZED2hEHKX6LtSGVNXgW/3Iqqn2Tz85DCirn0v
	 CjxpQBnd/8rzSfJ5oz4hCixGmCY85S7FuWp/3G6kwCE1Hk68tC73NxYH3Cogx83t9i
	 Ettmz+MMS9Ktw==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B87C137820E8;
	Thu, 14 Mar 2024 08:24:49 +0000 (UTC)
Message-ID: <ca64e301-5507-4bb7-8ebe-2c30e8800709@collabora.com>
Date: Thu, 14 Mar 2024 09:24:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 35/38] media: ov2740: Add support for embedded data
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-36-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-36-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 3/13/24 08:25, Sakari Ailus wrote:
> Add support for embedded data. This introduces two internal pads for pixel
> and embedded data streams. As the driver supports a single mode only,
> there's no need for backward compatibility in mode selection.
> 
> The embedded data is configured to be placed before the image data whereas
> after the image data is the default.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/i2c/ov2740.c | 150 +++++++++++++++++++++++++++++++++----
>   1 file changed, 137 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index df57f0096e98..7488b2535071 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -11,6 +11,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/regmap.h>
> +#include <media/mipi-csi2.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-fwnode.h>
> @@ -71,11 +72,31 @@
>   #define OV2740_REG_ISP_CTRL00		0x5000
>   /* ISP CTRL01 */
>   #define OV2740_REG_ISP_CTRL01		0x5001
> +
> +/* Embedded data line location control */
> +#define OV2740_REG_EMBEDDED_FLAG	0x5a08
> +#define OV2740_EMBEDDED_FLAG_FOOTER	BIT(2) /* otherwise it's in header */
> +#define OV2740_EMBEDDED_FLAG_MYSTERY	BIT(1)
>   /* Customer Addresses: 0x7010 - 0x710F */
>   #define CUSTOMER_USE_OTP_SIZE		0x100
>   /* OTP registers from sensor */
>   #define OV2740_REG_OTP_CUSTOMER		0x7010
>   
> +enum {
> +	OV2740_PAD_SOURCE,
> +	OV2740_PAD_PIXEL,
> +	OV2740_PAD_META,
> +	OV2740_NUM_PADS,
> +};
> +
> +enum {
> +	OV2740_STREAM_PIXEL,
> +	OV2740_STREAM_META,
> +};
> +
> +#define OV2740_META_WIDTH		100U /* 97 bytes of actual data */
> +#define OV2740_META_HEIGHT		1U
> +
>   struct nvm_data {
>   	struct nvmem_device *nvmem;
>   	struct regmap *regmap;
> @@ -513,7 +534,7 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
>   
>   struct ov2740 {
>   	struct v4l2_subdev sd;
> -	struct media_pad pad;
> +	struct media_pad pads[OV2740_NUM_PADS];
>   	struct v4l2_ctrl_handler ctrl_handler;
>   
>   	/* V4L2 Controls */
> @@ -976,6 +997,11 @@ static int ov2740_enable_streams(struct v4l2_subdev *sd,
>   	if (ret)
>   		goto out_pm_put;
>   
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_EMBEDDED_FLAG, 1,
> +			       OV2740_EMBEDDED_FLAG_MYSTERY);
> +	if (ret)
> +		return ret;
> +
>   	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>   			       OV2740_MODE_STREAMING);
>   	if (ret) {
> @@ -1013,23 +1039,49 @@ static int ov2740_disable_streams(struct v4l2_subdev *sd,
>   	return ret;
>   }
>   
> -static int ov2740_set_format(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_state *sd_state,
> -			     struct v4l2_subdev_format *fmt)
> +static int __ov2740_set_format(struct v4l2_subdev *sd,
> +			       struct v4l2_subdev_state *sd_state,
> +			       struct v4l2_mbus_framefmt *format,
> +			       enum v4l2_subdev_format_whence which,
> +			       unsigned int pad, unsigned int stream)
>   {
> +	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
> +		*meta_fmt;
>   	struct ov2740 *ov2740 = to_ov2740(sd);
>   	const struct ov2740_mode *mode;
>   	s32 vblank_def, h_blank;
>   
> +	/*
> +	 * Allow setting format on internal pixel pad as well as the source
> +	 * pad's pixel stream (for compatibility).
> +	 */
> +	if (pad == OV2740_PAD_SOURCE || pad == OV2740_PAD_META ||
> +	    stream == OV2740_STREAM_META) {
This is equivalent to
if (pad != OV2740_PAD_PIXEL)
Correct me if I'm wrong but this code doesn't allow to set the format on 
the source pad.

Should it be:
if ((pad == OV2740_PAD_SOURCE && stream == OV2740_STREAM_META) ||
	pad == OV2740_PAD_META) {


> +		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
> +		return 0;
> +	}
> +
> +	pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
> +	meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
> +	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> +						   OV2740_STREAM_PIXEL);
> +	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
> +						    OV2740_STREAM_META);
> +
>   	mode = v4l2_find_nearest_size(ov2740->supported_modes,
>   				      ov2740->supported_modes_count,
>   				      width, height,
> -				      fmt->format.width, fmt->format.height);
> +				      format->width, format->height);
> +	ov2740_update_pad_format(mode, pix_fmt);
> +	*format = *src_pix_fmt = *pix_fmt;
>   
> -	ov2740_update_pad_format(mode, &fmt->format);
> -	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +	meta_fmt->code = MEDIA_BUS_FMT_OV2740_EMBEDDED;
> +	meta_fmt->width = OV2740_META_WIDTH;
> +	meta_fmt->height = OV2740_META_HEIGHT;
> +	*src_meta_fmt = *meta_fmt;
> +	src_meta_fmt->code = MEDIA_BUS_FMT_META_10;
>   
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +	if (which == V4L2_SUBDEV_FORMAT_TRY)
>   		return 0;
>   
>   	ov2740->cur_mode = mode;
Regards,
-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

