Return-Path: <linux-media+bounces-48880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3485CC3194
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 982C930387BC
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF50EFBF6;
	Tue, 16 Dec 2025 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DJRRsTNL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88D33A9D6;
	Tue, 16 Dec 2025 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889946; cv=none; b=dSzeqvVk28IjIxPr8QbqFwgsu7+9Z1jMOq1ID5N5spk3XuW+ZsFJMsvLtJQ66x+eukWhpGyIvdcifNGLphfZIswRzj1LJo5nZ9QSPheO+CPYIRFLtxbEBc/k1ao6XY8bh9+h6uGcr2HuWkAg1cSqh+9IFynZFAHk3NumpKqXWWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889946; c=relaxed/simple;
	bh=yrTcNnFBCQMK3F/MZDviRkx47vatTRDrwnbWny2IHY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fibM/YmjJTHBL3mi5HxPsNnSu7ITMX+ewXPlueRvsztY6xOjff5UXQBxSJrkMR8iiD6bL481w+FKZK7SbJwmOhxN9emARejsordAhR1VeyFiGSH2fLyVjJVCIXENrSvTnHCF/g+UqTjmGHBc5k5QrS/js4eFpFb+fVWTrv36fA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DJRRsTNL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47990594;
	Tue, 16 Dec 2025 13:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765889935;
	bh=yrTcNnFBCQMK3F/MZDviRkx47vatTRDrwnbWny2IHY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DJRRsTNLBzsb/UjKmzo0ZXStfLRU7RC3Go5CVdlS5guuNSIEnNXMzfaJz3Ac93r9x
	 AUnQVil16qgI4g4NWtK43iHrNwx8p1h0jycgQoe2gTg2m7iKcy0qyC2Qp1oq8SOD4I
	 Ni4ln80lb9TAFRZ5oH0CDkrSAx2JhzzQfbvRT+gs=
Message-ID: <b483e725-4e3e-45b9-9a20-001fe1c7acf0@ideasonboard.com>
Date: Tue, 16 Dec 2025 14:58:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] media: rcar-csi2: Call get_frame_desc to find
 out VC & DT (Gen3)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-13-026655df7138@ideasonboard.com>
 <20250602134926.GB23515@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250602134926.GB23515@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2025 16:49, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 30, 2025 at 04:50:42PM +0300, Tomi Valkeinen wrote:
>> Call get_frame_desc to find out VC & DT, for Gen3 platforms, instead of
>> hardcoding the VC routing and deducing the DT based on the mbus format.
>>
>> If the source subdevice doesn't implement .get_frame_desc, we use a
>> fallback case where we assume there's a single stream with VC = 0 and DT
>> based on the mbus format.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-csi2.c | 113 +++++++++++++++++++----------
>>  1 file changed, 76 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index b9f83aae725a..8f708196ef49 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -71,10 +71,7 @@ struct rcar_csi2;
>>  #define FLD_REG				0x1c
>>  #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
>>  #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
>> -#define FLD_FLD_EN4			BIT(3)
>> -#define FLD_FLD_EN3			BIT(2)
>> -#define FLD_FLD_EN2			BIT(1)
>> -#define FLD_FLD_EN			BIT(0)
>> +#define FLD_FLD_EN(ch)			BIT(ch)
>>  
>>  /* Automatic Standby Control */
>>  #define ASTBY_REG			0x20
>> @@ -1066,52 +1063,94 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>  static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
>>  				     struct v4l2_subdev_state *state)
>>  {
>> -	const struct rcar_csi2_format *format;
>> -	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
>> -	const struct v4l2_mbus_framefmt *fmt;
>> +	u32 phycnt, vcdt = 0, vcdt2 = 0;
>> +	u32 fld = FLD_DET_SEL(1);
>> +	struct v4l2_mbus_frame_desc source_fd;
>> +	struct v4l2_subdev_route *route;
>>  	unsigned int lanes;
>> -	unsigned int i;
>>  	int mbps, ret;
>> +	u8 ch = 0;
>>  
>> -	/* Use the format on the sink pad to compute the receiver config. */
>> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>> +	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
>> +			       priv->remote_pad, &source_fd);
>> +	if (ret && ret != -ENOIOCTLCMD) {
>> +		return ret;
>> +	} else if (ret == -ENOIOCTLCMD) {
> 
> 	if (ret && ret != -ENOIOCTLCMD)
> 		return ret;
> 
> 	if (ret == -ENOIOCTLCMD) {

Yep, that's cleaner.

>> +		/* Create a fallback source_fd */
>> +		struct v4l2_mbus_frame_desc *fd = &source_fd;
>> +		const struct rcar_csi2_format *format;
>> +		struct v4l2_mbus_framefmt *fmt;
>>  
>> -	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>> -		fmt->width, fmt->height,
>> -		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
>> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>> +		if (!fmt)
>> +			return -EINVAL;
>>  
>> -	/* Code is validated in set_fmt. */
>> -	format = rcsi2_code_to_fmt(fmt->code);
>> -	if (!format)
>> -		return -EINVAL;
>> +		format = rcsi2_code_to_fmt(fmt->code);
>> +		if (!format)
>> +			return -EINVAL;
>>  
>> -	/*
>> -	 * Enable all supported CSI-2 channels with virtual channel and
>> -	 * data type matching.
>> -	 *
>> -	 * NOTE: It's not possible to get individual datatype for each
>> -	 *       source virtual channel. Once this is possible in V4L2
>> -	 *       it should be used here.
>> -	 */
>> -	for (i = 0; i < priv->info->num_channels; i++) {
>> +		memset(fd, 0, sizeof(*fd));
>> +
>> +		fd->num_entries = 1;
>> +		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>> +		fd->entry[0].stream = 0;
>> +		fd->entry[0].pixelcode = fmt->code;
>> +		fd->entry[0].bus.csi2.vc = 0;
>> +		fd->entry[0].bus.csi2.dt = format->datatype;
>> +	}
>> +
>> +	for_each_active_route(&state->routing, route) {
>> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
> 
> const

Yep.

>> +		const struct v4l2_mbus_framefmt *fmt;
>> +		const struct rcar_csi2_format *format;
>> +		unsigned int i;
>> +		u8 vc, dt;
>>  		u32 vcdt_part;
>>  
>> -		if (priv->channel_vc[i] < 0)
>> -			continue;
>> +		for (i = 0; i < source_fd.num_entries; i++) {
>> +			if (source_fd.entry[i].stream == route->sink_stream) {
> 
> No need to check the pad ?

We only have a single sink pad in CSI-2.

>> +				source_entry = &source_fd.entry[i];
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!source_entry) {
>> +			dev_err(priv->dev,
>> +				"Failed to find stream from source frame desc\n");
>> +			return -EPIPE;
>> +		}
>>  
>> -		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
>> -			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
>> +		vc = source_entry->bus.csi2.vc;
>> +		dt = source_entry->bus.csi2.dt;
>> +
>> +		vcdt_part = VCDT_SEL_VC(vc) | VCDT_VCDTN_EN |
>> +			VCDT_SEL_DTN_ON | VCDT_SEL_DT(dt);
> 
> I would drop the vc and dt variables and write
> 
> 		vcdt_part = VCDT_SEL_VC(source_entry->bus.csi2.vc)
> 			  | VCDT_VCDTN_EN | VCDT_SEL_DTN_ON
> 			  | VCDT_SEL_DT(source_entry->bus.csi2.dt);

Yes, I think this is fine too.

>>  
>>  		/* Store in correct reg and offset. */
>> -		if (i < 2)
>> -			vcdt |= vcdt_part << ((i % 2) * 16);
>> +		if (ch < 2)
>> +			vcdt |= vcdt_part << ((ch % 2) * 16);
>>  		else
>> -			vcdt2 |= vcdt_part << ((i % 2) * 16);
>> -	}
>> +			vcdt2 |= vcdt_part << ((ch % 2) * 16);
>> +
>> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK,
>> +						   route->sink_stream);
>> +		if (!fmt)
>> +			return -EINVAL;
>> +
>> +		dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
>> +			fmt->width, fmt->height,
>> +			fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
>>  
>> -	if (fmt->field == V4L2_FIELD_ALTERNATE)
>> -		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
>> -			| FLD_FLD_EN;
>> +		/* Code is validated in set_fmt. */
> 
> Then why don't you drop the !format check ?

It's a copy of the existing code. I've been reluctant to change gen3
code, as I can't test. But I can't really see how this could be wrong,
so I'll just drop the check here.

 Tomi

>> +		format = rcsi2_code_to_fmt(fmt->code);
>> +		if (!format)
>> +			return -EINVAL;
>> +
>> +		if (fmt->field == V4L2_FIELD_ALTERNATE)
>> +			fld |= FLD_FLD_EN(ch);
>> +
>> +		ch++;
>> +	}
>>  
>>  	/*
>>  	 * Get the number of active data lanes inspecting the remote mbus
> 


