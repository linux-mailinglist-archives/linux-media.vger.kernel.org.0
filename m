Return-Path: <linux-media+bounces-48877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 385A1CC2E1D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6B223005F24
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 12:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDB939376F;
	Tue, 16 Dec 2025 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A9nVsK6W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9A339376D;
	Tue, 16 Dec 2025 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889141; cv=none; b=u7zO1rI6CcKCXWKUcy5OiB9WDfPitvvgjXItM9ugIRjbxbBFky3MKhJUN0FE2AFuBCru4aavTRJLj5OuuTldVJordML3E7XW9zMsIqsBAARLHI4ougxQ0GQfYEd+jXqcF1cO5WddPtHD40mrtXjbiGgukoA4iuz/fJB3FftYX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889141; c=relaxed/simple;
	bh=lv6g6LGjPaL8mc1OmO3gZ6DqJnEc7fOXPysNzRpcI3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3BJ47ODq6TNuAyQIyPg8UBADq7rP9AcOcGJIDs5YORcLiPQxW1rIXtu3uJM8DUee2eNRRCG2jfug8HouLMD1D4kXgxPhsy3gZ+pb5AFzeMAUTuYV7a2TkPfmWtXUEr/vdZBVB0N0EeoE0qod/c8mARon7MzsIL9a9gdqJkGuRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A9nVsK6W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2518A1039;
	Tue, 16 Dec 2025 13:45:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765889128;
	bh=lv6g6LGjPaL8mc1OmO3gZ6DqJnEc7fOXPysNzRpcI3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A9nVsK6WSsz7TGGcxRWAZ2WQ+8qg+iJm/0suEXV6c8paGdKOkIiKfxYuKFSsJpim8
	 nci9Buk1dUl0hsC9P/0qJKWN1I6B9/AuWXXyOdjiPpBqBA62Tw4x6ffc8/6v74mZVx
	 +VOJYACOw5kD162t4YtflPV6Ms5fCqucxG/YMvnQ=
Message-ID: <0919cbe4-6c74-44eb-96a8-7522b2f4b694@ideasonboard.com>
Date: Tue, 16 Dec 2025 14:45:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] media: rcar-csi2: Add more stream support to
 rcsi2_calc_mbps()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-12-026655df7138@ideasonboard.com>
 <20250602132838.GE11750@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20250602132838.GE11750@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2025 16:28, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 30, 2025 at 04:50:41PM +0300, Tomi Valkeinen wrote:
>> In the case where link-freq is not available, make sure we fail if there
>> are more than one stream configured, and also use the correct stream
>> number for that single stream.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-csi2.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index 65c7f3040696..b9f83aae725a 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1018,17 +1018,22 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
>>  	 */
>>  	freq = v4l2_get_link_freq(remote_pad, 0, 0);
>>  	if (freq < 0) {
>> +		struct v4l2_subdev_route *route = &state->routing.routes[0];
> 
> const

Ok.

>>  		const struct rcar_csi2_format *format;
>>  		struct v4l2_mbus_framefmt *fmt;
>>  		unsigned int lanes;
>>  		unsigned int bpp;
>>  		int ret;
>>  
>> +		if (state->routing.num_routes > 1)
>> +			return -EINVAL;
> 
> Do we have to guard against the case where there would be no route ?

No, but I think it still makes sense to use != here (and in other
similar places). Just in case. I'll do that change.

 Tomi

>> +
>>  		ret = rcsi2_get_active_lanes(priv, &lanes);
>>  		if (ret)
>>  			return ret;
>>  
>> -		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
>> +		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
>> +						   route->sink_stream);
>>  		if (!fmt)
>>  			return -EINVAL;
>>  
> 


