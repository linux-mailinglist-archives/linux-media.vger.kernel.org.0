Return-Path: <linux-media+bounces-64988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /6WZOVsyMWpadwUAu9opvQ
	(envelope-from <linux-media+bounces-64988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:24:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4126768EC2E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="b9/fAujP";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64988-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64988-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FE6E313A442
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A06383C65;
	Tue, 16 Jun 2026 11:20:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D70C2D8DD0;
	Tue, 16 Jun 2026 11:20:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608821; cv=none; b=kCXgrJMuJSVxSSzCO69IqHY1Z7Y5nPdIWD/kuE9DgmAUcLdmUp/1sNDyu/0GzBCyEQvbtAl7Z7jKQBdeXFXzRS62NkAL8OySKf4B+2dMUoE4hAHHp0PgvUk/s3bioXzia47GnR7KVkoGRA/ZP3XuhEQRiv74WqeJfjDxbX/T074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608821; c=relaxed/simple;
	bh=a3OTobzVHLfzK/TYKvKxjWVhIp1VrswRkLtD5l2pFuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFax9YnIqN83ll1A/iBkUv+hNU630/JXhMRIVLyvopLoJBNoGlETPzy6lQBh7wyhF9wxHjZPhevqJuyv1FbOXzEEs1tnYFn43uaiPboK70OFr7nmxA/bMzwDkt9IPxltwvFB1R+CoqSW6PsFxZ+4PvE0LMmXllGhOfGhOWgpP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b9/fAujP; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47A398FA;
	Tue, 16 Jun 2026 13:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781608776;
	bh=a3OTobzVHLfzK/TYKvKxjWVhIp1VrswRkLtD5l2pFuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b9/fAujPxJcNFcNF6xkzXx/cE4wGPDFRJqtoc6N7Q60tfJpLfgGEAI5rXdi0XrakT
	 pyM0C1OSefafA+Ot7tzWvHdBf5nMYFXZbUYwFc2YHV7jvFXfuTqGIhgwMD6L/iegTC
	 Rjtsx8nh1D8SaAIhzSHTjxegKGLMiclxvWzcVzb8=
Message-ID: <e0ad4d15-2cf9-45a5-9312-fac297119ad4@ideasonboard.com>
Date: Tue, 16 Jun 2026 14:20:06 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] media: rcar-csi2: Move
 {enable|disable}_streams() calls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
 <20260311-rcar-streams-v5-3-3e6c957d7567@ideasonboard.com>
 <20260318205435.GG716464@killaraus.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260318205435.GG716464@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64988-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4126768EC2E

Hi,

On 18/03/2026 22:54, Laurent Pinchart wrote:
> On Wed, Mar 11, 2026 at 03:53:16PM +0200, Tomi Valkeinen wrote:
>> With multiple streams the operation to enable the CSI-2 hardware and to
>> call {enable|disable}_streams() on upstream subdev will need to be
>> handled separately.
>>
>> Prepare for that by moving {enable|disable}_streams() calls out from
>> rcsi2_start() and rcsi2_stop().
>>
>> On Gen3, a side effect of this change is that if the sink side devices
>> call .enable_streams() on rcar-csi2 multiple times, the second call will
>> fail. This is because we always use stream ID 0, so the second call
>> would attempt to enable the same stream again, leading to an error. In
>> other words, a normal single-stream setup continues to work, but trying
>> to use the current driver's custom VC based routing will fail.
> 
> I assume this gets addressed later in the series.

Yes and no.

The previous patch does the same for rcar-isp, which affects the gen4 
custom VC based routing the same was this does for gen3.

At the end of the series we support full multi-stream with the upstream 
API. The custom VC based routing is no longer supported, and will 
continue to fail.

>>
>> On Gen4, this doesn't matter as the rcar-isp behaves in a similar way as
>> described above, and thus rcar-csi2 will only get a single
>> .enable_streams() call.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/rcar-csi2.c | 25 +++++++++++++++----------
>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
>> index 7305cc4a04cb..158fa447e668 100644
>> --- a/drivers/media/platform/renesas/rcar-csi2.c
>> +++ b/drivers/media/platform/renesas/rcar-csi2.c
>> @@ -1822,20 +1822,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>>   		return ret;
>>   	}
>>   
>> -	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
>> -					 BIT_ULL(0));
>> -	if (ret) {
>> -		rcsi2_enter_standby(priv);
>> -		return ret;
>> -	}
>> -
>>   	return 0;
>>   }
>>   
>>   static void rcsi2_stop(struct rcar_csi2 *priv)
>>   {
>>   	rcsi2_enter_standby(priv);
>> -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
>>   }
>>   
>>   static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>> @@ -1857,6 +1849,14 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>>   			return ret;
>>   	}
>>   
>> +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
>> +					 BIT_ULL(0));
>> +	if (ret) {
>> +		if (priv->stream_count == 0)
>> +			rcsi2_stop(priv);
>> +		return ret;
>> +	}
>> +
>>   	priv->stream_count += 1;
>>   
>>   	return ret;
>> @@ -1867,7 +1867,7 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>>   				 u32 source_pad, u64 source_streams_mask)
>>   {
>>   	struct rcar_csi2 *priv = sd_to_csi2(sd);
>> -	int ret = 0;
>> +	int ret;
>>   
>>   	if (source_streams_mask != 1)
>>   		return -EINVAL;
>> @@ -1878,9 +1878,14 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>>   	if (priv->stream_count == 1)
>>   		rcsi2_stop(priv);
>>   
>> +	ret = v4l2_subdev_disable_streams(priv->remote, priv->remote_pad,
>> +					  BIT_ULL(0));
>> +	if (ret)
>> +		return ret;
>> +
>>   	priv->stream_count -= 1;
>>   
>> -	return ret;
>> +	return 0;
>>   }
> 
> rcsi2_irq_thread() also calls rcsi2_stop(), followed by rcsi2_start().
> This is to handle errors reported by the AFIFO_OF, ERRSOTHS and
> ERRSOTSYNCHS interrupts. If the source isn't restarted, such an attempt
> to recover from errors will likely fail. On the other hand, restarting
> the source will likely not lead to great results either.

Indeed. I think for single-stream use cases the behavior should still be 
the same, but for multi-stream use, any enabled stream will keep the 
csi2 enabled.

This kind of error handling sounds a bit fragile. If a restart helps, 
don't we need to restart the whole pipeline, not just from csi2-rx 
upwards? Or is it guaranteed that the ISP/CS and VIN will continue working?

Did this work earlier with the custom VC based routing?

  Tomi

> Error handling was introduced in
> 
> commit 4ab44ff0841b9a825f9875623d24809d29e37a10
> Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Date:   Thu Apr 11 16:30:58 2019 -0400
> 
>      media: rcar-csi2: restart CSI-2 link if error is detected
> 
>      Restart the CSI-2 link if the CSI-2 receiver detects an error during
>      reception. The driver did nothing when a link error happened and the
>      data flow simply stopped without the user knowing why.
> 
>      Change the driver to try and recover from errors by restarting the link
>      and informing the user that something is not right. For obvious reasons
>      it's not possible to recover from all errors (video source disconnected
>      for example) but in such cases the user is at least informed of the
>      error and the same behavior of the stopped data flow is retained.
> 
> Niklas, do you recall anything about the errors you saw ?


