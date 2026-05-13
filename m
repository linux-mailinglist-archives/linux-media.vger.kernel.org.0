Return-Path: <linux-media+bounces-61460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMhROfaLBGqvLQIAu9opvQ
	(envelope-from <linux-media+bounces-61460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:34:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9A53530A
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 116F1301B14C
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5F027FB2E;
	Wed, 13 May 2026 14:29:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034325A33F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682563; cv=none; b=m49aG70Ryc89KA5ubIqDI1/u5WMBVnlry97E7bnI0Qk6HwKhXk5Ylt2nmFaoA57/40JFhdHcKB4bVD3HIXBPUG/qYz39DF24uHEHynF59hbGQjvUfDhxym81FGdej2F8beMgQrhRRTLVfVV7iKo6VeBBV+kTiD7cpdzgbhyYEAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682563; c=relaxed/simple;
	bh=FFXhqmEf0NqmH36uwdFa/7LMhi9Sgp/tX0bhkrD0Hew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VL7gUhkEjYyTCRlyjD4Cr1MGaoaI5Q7ybWC/FzifZgdDIB+Qga5zP6Q+lRgLImeb+pO7Me6KeuPSTuxQn157bJ96K0Kjpzhwfdnngw2pSpGyfQWVBxELa2VoA3xpnoA16SBzYjjL9nXFUx6mHuF3GWu+BiReD5so2j1sQjp04xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wNAaD-0002gm-FK; Wed, 13 May 2026 16:29:09 +0200
Message-ID: <aeff9412-1c69-469d-bee3-7b9efa9b3947@pengutronix.de>
Date: Wed, 13 May 2026 16:29:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate into
 separate function
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Philipp Zabel <pza@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
 <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
 <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
 <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 77B9A53530A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61460-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.936];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid]
X-Rspamd-Action: no action

Hi Nicola,

On 5/12/26 4:15 PM, Nicolas Dufresne wrote:
> Le mardi 12 mai 2026 à 16:08 +0200, Sven Püschel a écrit :
>
>
>>> To stick with the spec, the capture format needs to be updated, and it needs to
>>> happen in a way user can be able to read it back for the correct frame if
>>> userspace make use of the queues. I see 3 options, let me know what you think,
>>> or what is later implemented if you already thought about that.
>>>
>>> 1. Synchronously update the capture format width/height, document in the
>>> respective control this behaviour, leaving to userspace to remember which frames
>>> the change will apply to.
>>>
>>> This works nicely for this type of HW, but would be a bit complicated for a
>>> deinterlacer, since the buffering might be HW specific. It also make usage of
>>> queues harder, less independent.
>>>
>>> 2. Force a drain/stop/start for any 90 degree rotation
>>>
>>> This might impose a longer idle time for the converter core, and is kind of
>>> opposite of your commit message. But requires no spec work.
>>>
>>> 3. Emit SRC_CH, implement the drain procedure typical to decoder resolution
>>> change.
>>>
>>> Typically it means userspace can keep buffering on the OUTPUT queue, and once
>>> the LAST buffer is met, it can simply read the new format (and new stride, since
>>> due to alignment, this might be hardware specific) and toggle streamoff/on only
>>> on capture queue to reactivate the processing.
>>>
>>> The 3. is more complex for the driver, but its a proven race-free method for
>>> decoders already. 2 would be statusquo to get this series in, and we could post-
>>> poned more advance work for seamless 90degree rorations. 1., I don't really like
>>> that solution, it not quite generic enough.
>> I'll go with option 2 for now to keep it simple and improve the status
>> quo a bit.
> Works for me.

Philipp Zabel just mentioned that a 90 degree rotation would just cause 
the RGA to scale it to the output format (deforming if it isn't 
quadratic). The existing code already considers the rotation to set the 
scaling factor accordingly (which I've also missed in this commit. But 
the commit is dropped anyways in v6 due to the various footguns).

While I see that the V4L2_CID_ROTATE docs mention the need to set the 
format according to the chosen rotation, it feels like it's intended for 
non-scaling converters. So I don't see a problem to just allow the 
current state, as the user has to adjust the format anyways if he isn't 
interested in a deformed image (instead of blocking this potential rare 
use-case).

But I'd add a check in my scaling commit to also check in the streaming 
state that we don't set a 90 degree rotation causing the scaling factor 
to be exceeded (e.g. 1x2 -> 1x32 scales by 16, whereas 90 degree 
rotation causes a scaling factor of 32).

Sincerely
     Sven

>
> Nicolas
>
>> Sincerely
>>       Sven
>>
>>> feedback welcome,
>>> Nicolas
>>>
>>>> ---
>>>>    drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++++++++++++-----------
>>>>    1 file changed, 34 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>>>> index dac3cb6aa17d3..6c1956b04f6ba 100644
>>>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>>>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>>>> @@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>>>>    	dest[reg >> 2] |= 0x7 << 8;
>>>>    }
>>>>    
>>>> -static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>>>> +static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
>>>> +{
>>>> +	u32 *dest = ctx->cmdbuf_virt;
>>>> +	union rga_src_info src_info;
>>>> +
>>>> +	src_info.val = dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
>>>> +
>>>> +	if (ctx->vflip)
>>>> +		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
>>>> +
>>>> +	if (ctx->hflip)
>>>> +		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
>>>> +
>>>> +	switch (ctx->rotate) {
>>>> +	case 90:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
>>>> +		break;
>>>> +	case 180:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
>>>> +		break;
>>>> +	case 270:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
>>>> +		break;
>>>> +	default:
>>>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
>>>> +}
>>>> +
>>>> +static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
>>>>    {
>>>>    	struct rockchip_rga *rga = ctx->rga;
>>>>    	u32 *dest = ctx->cmdbuf_virt;
>>>> @@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>>>>    		}
>>>>    	}
>>>>    
>>>> -	if (ctx->vflip)
>>>> -		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
>>>> -
>>>> -	if (ctx->hflip)
>>>> -		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
>>>> -
>>>> -	switch (ctx->rotate) {
>>>> -	case 90:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
>>>> -		break;
>>>> -	case 180:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
>>>> -		break;
>>>> -	case 270:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
>>>> -		break;
>>>> -	default:
>>>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
>>>> -		break;
>>>> -	}
>>>> -
>>>>    	/*
>>>>    	 * Calculate the up/down scaling mode/factor.
>>>>    	 *
>>>> @@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>>>    
>>>>    	rga_cmd_set_src_info(ctx, &src->offset);
>>>>    	rga_cmd_set_dst_info(ctx, &dst->offset);
>>>> -	rga_cmd_set_trans_info(ctx);
>>>> +	rga_cmd_set_format_scale_info(ctx);
>>>> +	rga_cmd_set_flip_rotate_info(ctx);
>>>>    
>>>>    	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
>>>>    

