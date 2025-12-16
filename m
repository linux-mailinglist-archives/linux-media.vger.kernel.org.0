Return-Path: <linux-media+bounces-48881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED526CC362A
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CF023054F74
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF0B35CBA8;
	Tue, 16 Dec 2025 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qAmv+Ubn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBDE359F91;
	Tue, 16 Dec 2025 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890208; cv=none; b=uKK96SnoAzOilg9yzKidjJUyjpVMPfFK0H1t0Do/2sAOCcw9P6Y68jvknfHgVVxIG2QINlPOyOO8G9HHafhDyefXCc5xElYdIuktQ2lWVceILdfHwtUOj6949wMprkiFaJJxWUeGQ41lnQWZDYD0sNGDMWlLA/6ZhhIxf/KYTVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890208; c=relaxed/simple;
	bh=eQ49oF/KX6uaLSrKM+BBymFT5uAj0NH8ERq0f2Kq2X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiqZOuiO4+LzSzV8RJoCRC9VzyM47rg5hjUaJKqhMGrah3HzpCjm7uc6GGmjoW82O0FiM8pGYGQJxetEedhm9fCyNrcTAMKHbMf/a6xstdXS/LytNaFbXCPbXefU+QkLlc5Jws0IMEpoafVyxtR6qiLyUE41xfqbwbFz1Azethc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qAmv+Ubn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F0DA594;
	Tue, 16 Dec 2025 14:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765890197;
	bh=eQ49oF/KX6uaLSrKM+BBymFT5uAj0NH8ERq0f2Kq2X8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qAmv+UbnGK+tBMmAejylSK9i9SsuQeQnxyWKWuqrPuEbV1Bk+IzEHuzGvyhkuy+dc
	 7UJcRBp+KD/jVqP2TlamMGuBRnCrdnZXC3ShEx38GdYGeb94aAiPP40b2nMuRlaIGN
	 Zmieqsowa3EP5XHXVEHLe/sCnr+fon/5PU4sCyRI=
Message-ID: <6e9b6cb5-1b9e-4ab6-821a-fdeea45e1711@ideasonboard.com>
Date: Tue, 16 Dec 2025 15:03:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] media: rcar-csi2: Add full streams support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-14-026655df7138@ideasonboard.com>
 <20250602135453.GC23515@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250602135453.GC23515@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2025 16:54, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 30, 2025 at 04:50:43PM +0300, Tomi Valkeinen wrote:
>> Add the missing pieces to enable full streams support:
>>
>> - Add set_routing
>> - Drop the explicit uses of a single stream, and instead use the streams
>>   mask.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-csi2.c | 85 ++++++++++++++++++++++--------
>>  1 file changed, 63 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index 8f708196ef49..4a73d223229c 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -694,6 +694,17 @@ static const struct rcar_csi2_format rcar_csi2_formats[] = {
>>  	},
>>  };
>>  
>> +static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>> +	.width		= 1920,
>> +	.height		= 1080,
>> +	.code		= MEDIA_BUS_FMT_RGB888_1X24,
>> +	.colorspace	= V4L2_COLORSPACE_SRGB,
>> +	.field		= V4L2_FIELD_NONE,
>> +	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
>> +	.quantization	= V4L2_QUANTIZATION_DEFAULT,
>> +	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>> +};
>> +
>>  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
>>  {
>>  	unsigned int i;
>> @@ -1641,10 +1652,8 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>>  				u64 source_streams_mask)
>>  {
>>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> -	int ret = 0;
>> -
>> -	if (source_streams_mask != 1)
>> -		return -EINVAL;
>> +	u64 sink_streams;
>> +	int ret;
>>  
>>  	if (!priv->remote)
>>  		return -ENODEV;
>> @@ -1655,8 +1664,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>>  			return ret;
>>  	}
>>  
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
>> +						       RCAR_CSI2_SOURCE_VC0,
>> +						       RCAR_CSI2_SINK,
>> +						       &source_streams_mask);
>> +
>>  	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
>> -					 BIT_ULL(0));
>> +					 sink_streams);
>>  	if (ret) {
>>  		rcsi2_stop(priv);
>>  		return ret;
>> @@ -1672,10 +1686,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>>  				 u32 source_pad, u64 source_streams_mask)
>>  {
>>  	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> -	int ret = 0;
>> -
>> -	if (source_streams_mask != 1)
>> -		return -EINVAL;
>> +	u64 sink_streams;
>>  
>>  	if (!priv->remote)
>>  		return -ENODEV;
>> @@ -1683,11 +1694,17 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>>  	if (priv->stream_count == 1)
>>  		rcsi2_stop(priv);
>>  
>> -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state,
>> +						       RCAR_CSI2_SOURCE_VC0,
>> +						       RCAR_CSI2_SINK,
>> +						       &source_streams_mask);
>> +
>> +	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
>> +				    sink_streams);
>>  
>>  	priv->stream_count -= 1;
>>  
>> -	return ret;
>> +	return 0;
> 
> This seems to belong to a previous patch.

Yep. Although that patch would be before this series =). I'll clean that
up in an earlier one in this series.

>>  }
>>  
>>  static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>> @@ -1720,6 +1737,40 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>  	return 0;
>>  }
>>  
>> +static int rcsi2_set_routing(struct v4l2_subdev *sd,
>> +			     struct v4l2_subdev_state *state,
>> +			     enum v4l2_subdev_format_whence which,
>> +			     struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> +	int ret;
>> +
>> +	if (!priv->info->use_isp)
>> +		return -ENOTTY;
>> +
>> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
>> +		return -EINVAL;
> 
> A comment to explain this check would be nice.

This is no longer needed, as the framework checks it.

>> +
>> +	if (priv->info->use_isp) {
> 
> You return an error above when this condition is false.

Yes, no idea why (probably some early gen4-only code). I'll drop the
earlier check.

 Tomi

>> +		ret = v4l2_subdev_routing_validate(sd, routing,
>> +						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +	} else {
>> +		ret = v4l2_subdev_routing_validate(sd, routing,
>> +						   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
>> +						   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
>> +	}
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
>> +					       &rcar_csi2_default_fmt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>  static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
>>  					 unsigned int pad,
>>  					 struct v4l2_mbus_frame_desc *fd)
>> @@ -1781,6 +1832,7 @@ static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>>  	.set_fmt = rcsi2_set_pad_format,
>>  	.get_fmt = v4l2_subdev_get_fmt,
>>  
>> +	.set_routing = rcsi2_set_routing,
>>  	.get_frame_desc = rcsi2_get_frame_desc,
>>  };
>>  
>> @@ -1801,17 +1853,6 @@ static int rcsi2_init_state(struct v4l2_subdev *sd,
>>  		},
>>  	};
>>  
>> -	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
>> -		.width		= 1920,
>> -		.height		= 1080,
>> -		.code		= MEDIA_BUS_FMT_RGB888_1X24,
>> -		.colorspace	= V4L2_COLORSPACE_SRGB,
>> -		.field		= V4L2_FIELD_NONE,
>> -		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
>> -		.quantization	= V4L2_QUANTIZATION_DEFAULT,
>> -		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
>> -	};
>> -
>>  	static const struct v4l2_subdev_krouting routing = {
>>  		.num_routes = ARRAY_SIZE(routes),
>>  		.routes = routes,
> 


