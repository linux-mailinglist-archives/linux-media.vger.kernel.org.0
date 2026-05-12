Return-Path: <linux-media+bounces-61270-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LupFOA8A2oq2AEAu9opvQ
	(envelope-from <linux-media+bounces-61270-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:44:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 56821522D12
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 661A33007A44
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC023A7D6C;
	Tue, 12 May 2026 14:08:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0A53655F3
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594930; cv=none; b=trOuz4aWoqJC2cwrO5WndVFMM64YLMlGvU00TIm05VHitiSxNBufWgzH7erHOOeb3qa6LgOJdf8FTEJGmgmae6mMlSsd82FmrRTDaqwQ2o6yPR2x6K3ZwPY+U6pwvinG4mTyM5rxGM3d06rGqLG98q4+P0V4MXMfkNNtpEdlxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594930; c=relaxed/simple;
	bh=p1G2rnv8yx9OTYnCLJd6Ok3l/PRXTQxiueQazc9A9hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRK675nSwwxnbUtcB74UCm63dtAxJygGpSziLzW6bQjiEoQxQdCacFtz4HfDUSl2VG4iFfbD5puiGb4ywL8MGn39xjG+gru85wHDCB6iZqtooU4QO+pbb0B3HjQv6GTtWf2tLXGHsIUMgjnMLrllF+qHagGSoEXJwjr9mR3aUoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wMnmV-0001ds-N8; Tue, 12 May 2026 16:08:19 +0200
Message-ID: <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
Date: Tue, 12 May 2026 16:08:14 +0200
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
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
 <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Queue-Id: 56821522D12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61270-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Nicolas,

On 5/9/26 12:11 AM, Nicolas Dufresne wrote:
> Le mardi 28 avril 2026 à 11:00 +0200, Sven Püschel a écrit :
>> Split the flip and rotate command configuration into a separate
>> function in preparation of filling the command stream at streamon.
>> As the userspace can change the flipping and rotation controls while
>> streaming, we have to update them with each new frame to prevent the
>> user being unable to change them while streaming.
>>
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> For code point of view, everything seems fine, but the commit message leave me a
> bit wondering. Any rotation that isn't 180 degree will cause the width and
> height to be reversed, and a new stride is needed to present the buffer
> correctly. Meaning the capture format can be affected by this change.

Sorry for missing to properly communicate my intention with this patch.

I've stumbled over the RGA pulling a spin lock on the controls, when 
starting the next job [1]. This made me realize that the driver allows 
changing the controls while streaming, which my change to move the 
command buffer setup to streamon breaks (as a potential rotation isn't 
updated until the next streamon).

This commit is the result of trying to not break the old behavior by 
moving the relevant code parts to be run on every frame instead of being 
only run at streamon. I didn't think about the 90 degree rotation 
problems, which are also present in the current RGA state.

sashiko.dev also pointed out that my simple code move didn't work for 
the mirroring case [2], as the relevant command buffer is ore'd with the 
mirroring flags. Also I've noticed that the rotation mode affects the 
scaling factor. To avoid these footguns, I've got the idea to set a flag 
to raise when the controls change. Then I can fully re-initialize the 
command buffer on the next frame and fully avoid these kind of problems.


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/rockchip/rga/rga.c?id=50897c955902c93ae71c38698abb910525ebdc89#n41

[2] 
https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=16

>
> To stick with the spec, the capture format needs to be updated, and it needs to
> happen in a way user can be able to read it back for the correct frame if
> userspace make use of the queues. I see 3 options, let me know what you think,
> or what is later implemented if you already thought about that.
>
> 1. Synchronously update the capture format width/height, document in the
> respective control this behaviour, leaving to userspace to remember which frames
> the change will apply to.
>
> This works nicely for this type of HW, but would be a bit complicated for a
> deinterlacer, since the buffering might be HW specific. It also make usage of
> queues harder, less independent.
>
> 2. Force a drain/stop/start for any 90 degree rotation
>
> This might impose a longer idle time for the converter core, and is kind of
> opposite of your commit message. But requires no spec work.
>
> 3. Emit SRC_CH, implement the drain procedure typical to decoder resolution
> change.
>
> Typically it means userspace can keep buffering on the OUTPUT queue, and once
> the LAST buffer is met, it can simply read the new format (and new stride, since
> due to alignment, this might be hardware specific) and toggle streamoff/on only
> on capture queue to reactivate the processing.
>
> The 3. is more complex for the driver, but its a proven race-free method for
> decoders already. 2 would be statusquo to get this series in, and we could post-
> poned more advance work for seamless 90degree rorations. 1., I don't really like
> that solution, it not quite generic enough.

I'll go with option 2 for now to keep it simple and improve the status 
quo a bit.

Sincerely
     Sven

> feedback welcome,
> Nicolas
>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++++++++++++-----------
>>   1 file changed, 34 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index dac3cb6aa17d3..6c1956b04f6ba 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>>   	dest[reg >> 2] |= 0x7 << 8;
>>   }
>>   
>> -static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>> +static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
>> +{
>> +	u32 *dest = ctx->cmdbuf_virt;
>> +	union rga_src_info src_info;
>> +
>> +	src_info.val = dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
>> +
>> +	if (ctx->vflip)
>> +		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
>> +
>> +	if (ctx->hflip)
>> +		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
>> +
>> +	switch (ctx->rotate) {
>> +	case 90:
>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
>> +		break;
>> +	case 180:
>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
>> +		break;
>> +	case 270:
>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
>> +		break;
>> +	default:
>> +		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
>> +		break;
>> +	}
>> +
>> +	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] = src_info.val;
>> +}
>> +
>> +static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
>>   {
>>   	struct rockchip_rga *rga = ctx->rga;
>>   	u32 *dest = ctx->cmdbuf_virt;
>> @@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
>>   		}
>>   	}
>>   
>> -	if (ctx->vflip)
>> -		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_X;
>> -
>> -	if (ctx->hflip)
>> -		src_info.data.mir_mode |= RGA_SRC_MIRR_MODE_Y;
>> -
>> -	switch (ctx->rotate) {
>> -	case 90:
>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_90_DEGREE;
>> -		break;
>> -	case 180:
>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_180_DEGREE;
>> -		break;
>> -	case 270:
>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_270_DEGREE;
>> -		break;
>> -	default:
>> -		src_info.data.rot_mode = RGA_SRC_ROT_MODE_0_DEGREE;
>> -		break;
>> -	}
>> -
>>   	/*
>>   	 * Calculate the up/down scaling mode/factor.
>>   	 *
>> @@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>   
>>   	rga_cmd_set_src_info(ctx, &src->offset);
>>   	rga_cmd_set_dst_info(ctx, &dst->offset);
>> -	rga_cmd_set_trans_info(ctx);
>> +	rga_cmd_set_format_scale_info(ctx);
>> +	rga_cmd_set_flip_rotate_info(ctx);
>>   
>>   	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
>>   

