Return-Path: <linux-media+bounces-7149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F187D0E2
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 17:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 416A828464D
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885AE40BED;
	Fri, 15 Mar 2024 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QZCITndy"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375BF3FE47
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710518534; cv=none; b=ustQP7AMw16ND7rjUVBYgtHST2D+WMuL++/1IeOwshYpTiU8AIR8TwAXHFGS/G7tVml+ee9lZ0r8ao4C5f1PJ7Sz880QbTG+pw2iBfETMpdiHksNxkROaE/A+YEaEvQ6e1C6erOSLeijqnPBuGD9zRb5Pt1nnjYww6YxZmZosu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710518534; c=relaxed/simple;
	bh=nM7Oh9bEvZfaQgUvvJtn/tYO9WqhzJ9h47o1L/EGYM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFt5f5WsqRaDcjvnN77rUr88uqOmILMxUqWN69dJO8AWosQnhpS711YtMqr++6swPo1CsDejNkDKW5210PJJLdbfMdzdsrcAuchISVWvTymhTi8dD62cOH+vLQRWh/HjWlqxCoirx1cnqiZ3Ckz/JZO/Mjn7qGnoIPIzjFyzB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QZCITndy; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710518530;
	bh=nM7Oh9bEvZfaQgUvvJtn/tYO9WqhzJ9h47o1L/EGYM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZCITndyHeeD+eHQx75llOWLSDHJnCX6F5lr5MSG+d9FtyDQKvCGPTp1zVO4RlwD8
	 SQEPIyCbpbaQib0ZXALItAadUvVS+SZGFWnwWYSJEWS83tib74nfBSABVi9fmxR49I
	 PZQ6Y6vYweRo8W+v7SRXKNp5cHL8mltWSvatgCEsXnjpWOGeBmdV2njsPoXHI63GLv
	 73iwsTPYGNfbylaov9tVhRqgZFMH8eLyST00YvZuj0/BWTywUsTahwa9xKjGI7bQIW
	 LN5ZhS2IN1RWJKCfIq6+lsssl5w/JBEecH2B0qL46ofHOudxi3C+089PuvkZJKeXHO
	 Zi2XKY+OhJ2Wg==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A122D3782111;
	Fri, 15 Mar 2024 16:02:09 +0000 (UTC)
Message-ID: <0b09c9c0-6029-4a5b-8652-d3b5a9fa3e0e@collabora.com>
Date: Fri, 15 Mar 2024 17:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 22/38] media: ccs: Support frame descriptors
Content-Language: en-US
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
 <20240313072516.241106-23-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-23-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:25, Sakari Ailus wrote:
> Provide information on the frame layout using frame descriptors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/i2c/ccs/ccs-core.c  | 60 +++++++++++++++++++++++++++++++
>   drivers/media/i2c/ccs/ccs-quirk.h |  7 ++++
>   drivers/media/i2c/ccs/ccs.h       |  4 +++
>   3 files changed, 71 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 0efbc63534bc..9cc2080b73ec 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -25,6 +25,7 @@
>   #include <linux/slab.h>
>   #include <linux/smiapp.h>
>   #include <linux/v4l2-mediabus.h>
> +#include <media/mipi-csi2.h>
>   #include <media/v4l2-cci.h>
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-fwnode.h>
> @@ -245,6 +246,33 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
>   	return ret;
>   }
>   
> +static u8 ccs_mipi_csi2_data_type(unsigned int bpp)
> +{
> +	switch (bpp) {
> +	case 6:
> +		return MIPI_CSI2_DT_RAW6;
> +	case 7:
> +		return MIPI_CSI2_DT_RAW7;
> +	case 8:
> +		return MIPI_CSI2_DT_RAW8;
> +	case 10:
> +		return MIPI_CSI2_DT_RAW10;
> +	case 12:
> +		return MIPI_CSI2_DT_RAW12;
> +	case 14:
> +		return MIPI_CSI2_DT_RAW14;
> +	case 16:
> +		return MIPI_CSI2_DT_RAW16;
> +	case 20:
> +		return MIPI_CSI2_DT_RAW20;
> +	case 24:
> +		return MIPI_CSI2_DT_RAW24;
> +	default:
> +		WARN_ON(1);
> +		return 0;
> +	}
> +}
> +
>   static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
>   {
>   	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> @@ -2632,6 +2660,37 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
>   	return ret;
>   }
>   
> +static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> +	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
> +
> +	if (ccs_has_quirk(sensor, frame_desc))
> +		return ccs_call_quirk(sensor, frame_desc, desc);
> +
> +	switch (sensor->hwcfg.csi_signalling_mode) {
> +	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
> +	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
> +		desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +		break;
> +	default:
> +		/* FIXME: CCP2 support */
> +		return -EINVAL;
> +	}
> +
> +	entry->pixelcode = sensor->csi_format->code;
> +	entry->stream = CCS_STREAM_PIXEL;
> +	entry->bus.csi2.dt =
> +		sensor->csi_format->width == sensor->csi_format->compressed ?
> +		ccs_mipi_csi2_data_type(sensor->csi_format->compressed) :
> +		CCS_DEFAULT_COMPRESSED_DT;
> +	entry++;
> +	desc->num_entries++;
> +
> +	return 0;
> +}
> +
>   static int ccs_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
>   {
>   	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> @@ -3054,6 +3113,7 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
>   	.set_selection = ccs_set_selection,
>   	.enable_streams = ccs_enable_streams,
>   	.disable_streams = ccs_disable_streams,
> +	.get_frame_desc = ccs_get_frame_desc,
>   };
>   
>   static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
> diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
> index 392c97109617..3e1d9eaa33fa 100644
> --- a/drivers/media/i2c/ccs/ccs-quirk.h
> +++ b/drivers/media/i2c/ccs/ccs-quirk.h
> @@ -36,6 +36,7 @@ struct ccs_sensor;
>    *			 access may be done by the caller (default read
>    *			 value is zero), else negative error code on error
>    * @flags: Quirk flags
> + * @frame_desc: Obtain the frame descriptor
>    */
>   struct ccs_quirk {
>   	int (*limits)(struct ccs_sensor *sensor);
> @@ -46,6 +47,8 @@ struct ccs_quirk {
>   	int (*init)(struct ccs_sensor *sensor);
>   	int (*reg_access)(struct ccs_sensor *sensor, bool write, u32 *reg,
>   			  u32 *val);
> +	int (*frame_desc)(struct ccs_sensor *sensor,
> +			  struct v4l2_mbus_frame_desc *desc);
>   	unsigned long flags;
>   };
>   
> @@ -62,6 +65,10 @@ struct ccs_reg_8 {
>   		.val = _val,		\
>   	}
>   
> +#define ccs_has_quirk(sensor, _quirk)					\
> +	((sensor)->minfo.quirk &&					\
> +	 (sensor)->minfo.quirk->_quirk)
> +
>   #define ccs_call_quirk(sensor, _quirk, ...)				\
>   	((sensor)->minfo.quirk &&					\
>   	 (sensor)->minfo.quirk->_quirk ?				\
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 4725e6eca8d0..adb152366ea2 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -46,6 +46,8 @@
>   
>   #define CCS_COLOUR_COMPONENTS		4
>   
> +#define CCS_DEFAULT_COMPRESSED_DT	0x30
> +
>   #define SMIAPP_NAME			"smiapp"
>   #define CCS_NAME			"ccs"
>   
> @@ -175,6 +177,8 @@ struct ccs_csi_data_format {
>   #define CCS_PAD_SRC			1
>   #define CCS_PADS			2
>   
> +#define CCS_STREAM_PIXEL		0
> +
>   struct ccs_binning_subtype {
>   	u8 horizontal:4;
>   	u8 vertical:4;

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

