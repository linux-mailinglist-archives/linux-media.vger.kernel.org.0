Return-Path: <linux-media+bounces-48884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF3CC37E1
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22F11306C567
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97148330650;
	Tue, 16 Dec 2025 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aNQu7VGL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928F3BF058;
	Tue, 16 Dec 2025 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891110; cv=none; b=K8K5/gxh47vL0niz9/pVEwtkcEDgcwc6mm3zB18guiHL8MoBpmdsRScw+hLUMKXBrY861u3oBMiQ3U9/4JuxVlpHamxAq6idjKVa9Oy+o2eDtBriRc2jHSEm2Wvbr93zHlXSGs6K2/pbkvOe18g3zfH7HT4UTD++72Vz3x85jvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891110; c=relaxed/simple;
	bh=r6T5TibxXp59Q3tENyCXZWAlGfVodfhLONfa411Wwdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SD0QmGnmkXzeRsiFYZkkcOHVaAQ+ypEIaprt5I7aUKJlGrOTh6IhJXC90ML2hCtc9jdf12rvBE/g06WoagcLArgKN+eqzkg4ZDXClM0DebfvkAd5FTQDwRUHDhHJ3uRK5/0Y3wFyDXoSHj/M/zx9uf3Cx3edkrURorOjk7bTzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aNQu7VGL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5BAA581;
	Tue, 16 Dec 2025 14:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765891101;
	bh=r6T5TibxXp59Q3tENyCXZWAlGfVodfhLONfa411Wwdw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aNQu7VGL+yBkGj9d5hZdVeobXraIZKwUaCAvr3MWfcs7CTRElMl+Qkp7SzA6q8q+K
	 VkmZ6MMRknzVDo5LGl5rCJasV+FQEtFlOnDmO/MAqsZiagXz8ZSKyTxwkfh5zEg5vH
	 ohBaHuWP+8bPMz3OhRrNrVoUHG8beWSpvvt49YZw=
Message-ID: <3946a90a-0656-4f70-a773-1e205e55f37b@ideasonboard.com>
Date: Tue, 16 Dec 2025 15:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] media: rcar-csi2: Add .get_frame_desc op
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-10-026655df7138@ideasonboard.com>
 <20250606121426.GG2770609@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250606121426.GG2770609@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 06/06/2025 15:14, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your work.
> 
> On 2025-05-30 16:50:39 +0300, Tomi Valkeinen wrote:
>> Add v4l2_subdev_pad_ops.get_frame_desc() implementation.
>>
>> We also implement a fallback for the case where the upstream subdevice
>> does not implement .get_frame_desc. It assumes a single stream with VC =
>> 0 and DT based on the configured stream mbus format.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-csi2.c | 56 ++++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index 20bd44274bd2..65c7f3040696 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1676,12 +1676,68 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
>>  	return 0;
>>  }
>>  
>> +static int rcsi2_get_frame_desc_fallback(struct v4l2_subdev *sd,
>> +					 unsigned int pad,
>> +					 struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	const struct rcar_csi2_format *format;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret = 0;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +
>> +	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>> +	if (!fmt) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	format = rcsi2_code_to_fmt(fmt->code);
>> +	if (!format) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	fd->num_entries = 1;
>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>> +	fd->entry[0].stream = 0;
>> +	fd->entry[0].pixelcode = fmt->code;
>> +	fd->entry[0].bus.csi2.vc = 0;
>> +	fd->entry[0].bus.csi2.dt = format->datatype;
>> +
>> +out:
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	return ret;
>> +}
>> +
>> +static int rcsi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>> +				struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> +	int ret;
>> +
>> +	if (WARN_ON(!priv->info->use_isp))
>> +		return -ENOTTY;
> 
> This looks odd, why can't we support the frame descriptor and streams on 
> Gen3 that do not use the ISP Channel Selector?

Yes, this is not right. There was another similar case. I think they are
remnants of a gen4-only series.

 Tomi

> 
>> +
>> +	if (WARN_ON(pad != RCAR_CSI2_SOURCE_VC0))
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_get_frame_desc_passthrough(sd, pad, fd);
>> +	if (ret == -ENOIOCTLCMD)
>> +		ret = rcsi2_get_frame_desc_fallback(sd, pad, fd);
>> +	return ret;
>> +}
>> +
>>  static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
>>  	.enable_streams = rcsi2_enable_streams,
>>  	.disable_streams = rcsi2_disable_streams,
>>  
>>  	.set_fmt = rcsi2_set_pad_format,
>>  	.get_fmt = v4l2_subdev_get_fmt,
>> +
>> +	.get_frame_desc = rcsi2_get_frame_desc,
>>  };
>>  
>>  static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
>>
>> -- 
>> 2.43.0
>>
> 


