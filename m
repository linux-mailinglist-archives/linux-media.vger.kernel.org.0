Return-Path: <linux-media+bounces-48408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD3CAD5BE
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 15:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 055953038967
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 14:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE9E28507B;
	Mon,  8 Dec 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OV4jzv7V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24144225417;
	Mon,  8 Dec 2025 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765202617; cv=none; b=GJr2O4VxzWCf1kCPKp8IloUPqh6qZpRW33nZwf7W7jruUnQK3UHsRONseInHV9K9vusrbZrU0JWNrVrOMI9ghkCG6ZCz4vxk94zBrEha4g3LK6x9tVa9BON5LsFW3xayQygCdHHzhHgrwnLSsTRkWvS2Me0oMvJ05SLKUA5VHAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765202617; c=relaxed/simple;
	bh=lZ7gaHoYYByv3QerI7QxwHLQqGkeLiV/GPP6nrG0Dzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXYlXwRa1lz9CcY1B5+aTwdH6MXP6PTec3m6ws37S/R8PFV+4A+KWWYYcCpnRhMA0o/awdisTqhYqQKzS7lS8N9G3TX/t+Z5nMxWCblh2dO1x30HtcUMIRjsV4klw6G0pu2zwN5KW7kImEXPgSk00x1dmxBl260oUVYNxNDvN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OV4jzv7V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1665C7A;
	Mon,  8 Dec 2025 15:01:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765202472;
	bh=lZ7gaHoYYByv3QerI7QxwHLQqGkeLiV/GPP6nrG0Dzk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OV4jzv7VXHugb9FUt6xiZr1WqUjmfmhKy4ESB7L27XdloxtkZTCUA6lphZ2WZh0XG
	 5r/JGVAXU9fkq88PAewbwNx8UzudI4mgXHAjtEKaocT4JTiR30hOdi6Tbx0Amam+LM
	 T8J7W3uNFVTbN46PLfxIhvXHV/pMFJaDnlro2Jlg=
Message-ID: <71140fb3-16bb-44ef-834d-2d4e4ab9369b@ideasonboard.com>
Date: Mon, 8 Dec 2025 16:03:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] media: rcar-csi2: Optimize rcsi2_calc_mbps()
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-7-026655df7138@ideasonboard.com>
 <20250606120702.GD2770609@ragnatech.se>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250606120702.GD2770609@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 06/06/2025 15:07, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your work.
> 
> On 2025-05-30 16:50:36 +0300, Tomi Valkeinen wrote:
>> With modern drivers supporting link-freq, we don't need to do any
>> calculations based on the bpp and number of lanes when figuring out the
>> link frequency. However, the code currently always runs code to get the
>> bpp and number of lanes.
>>
>> Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
>> when querying the link-freq is not supported by the upstream subdevice.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> I wonder if it make sens to add a dev_warn_once() for the old call path 
> so we won't forget to update all known users of this old way, and once 
> fixed we can remove the huristic method all together?

I think something like that should be done in the framework, rather in
each individual driver.

 Tomi

>> ---
>>  drivers/media/platform/renesas/rcar-csi2.c | 50 +++++++++++++++++-------------
>>  1 file changed, 29 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index 90973f3cba38..e0a0fd96459b 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1001,15 +1001,10 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
>>  static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>  			   struct v4l2_subdev_state *state)
>>  {
>> -	const struct rcar_csi2_format *format;
>> -	struct v4l2_mbus_framefmt *fmt;
>>  	struct media_pad *remote_pad;
>>  	struct v4l2_subdev *source;
>> -	unsigned int lanes;
>> -	unsigned int bpp;
>>  	s64 freq;
>>  	u64 mbps;
>> -	int ret;
>>  
>>  	if (!priv->remote)
>>  		return -ENODEV;
>> @@ -1017,28 +1012,41 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>  	source = priv->remote;
>>  	remote_pad = &source->entity.pads[priv->remote_pad];
>>  
>> -	ret = rcsi2_get_active_lanes(priv, &lanes);
>> -	if (ret)
>> -		return ret;
>> +	/*
>> +	 * First try to get the real link freq. If that fails, try the heuristic
>> +	 * method with bpp and lanes (but that only works for one route).
>> +	 */
>> +	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>> +	if (freq < 0) {
>> +		const struct rcar_csi2_format *format;
>> +		struct v4l2_mbus_framefmt *fmt;
>> +		unsigned int lanes;
>> +		unsigned int bpp;
>> +		int ret;
>>  
>> -	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>> -	if (!fmt)
>> -		return -EINVAL;
>> +		ret = rcsi2_get_active_lanes(priv, &lanes);
>> +		if (ret)
>> +			return ret;
>>  
>> -	format = rcsi2_code_to_fmt(fmt->code);
>> -	if (!format)
>> -		return -EINVAL;
>> +		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
>> +		if (!fmt)
>> +			return -EINVAL;
>>  
>> -	bpp = format->bpp;
>> +		format = rcsi2_code_to_fmt(fmt->code);
>> +		if (!format)
>> +			return -EINVAL;
>>  
>> -	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
>> -	if (freq < 0) {
>> -		int ret = (int)freq;
>> +		bpp = format->bpp;
>>  
>> -		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
>> -			source->name, ret);
>> +		freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
>> +		if (freq < 0) {
>> +			int ret = (int)freq;
>>  
>> -		return ret;
>> +			dev_err(priv->dev, "failed to get link freq for %s: %d\n",
>> +				source->name, ret);
>> +
>> +			return ret;
>> +		}
>>  	}
>>  
>>  	mbps = div_u64(freq * 2, MEGA);
>>
>> -- 
>> 2.43.0
>>
> 


