Return-Path: <linux-media+bounces-64888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id veQ/BEW3L2oeFAUAu9opvQ
	(envelope-from <linux-media+bounces-64888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:26:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037568484E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=PdOQj2g1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64888-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64888-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAB573013AB7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC693C5DA6;
	Mon, 15 Jun 2026 08:26:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C907C3C3BFF;
	Mon, 15 Jun 2026 08:26:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511965; cv=none; b=aGpCz3vSbl2QYCZdu77WjytV8qjsHYJfOxUIFBmXOeTD9QSGB87tTMl6MlYeZyxA5nY8HgxPGwed/B2Z51P5TJv/MPiuMbGzsvmajLxRULF3y69LQKjuo8xKYH0FfN5wLFhf8U4wjrM8GKwGepLi/VZVfWwPGdak+Z/tE+srwiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511965; c=relaxed/simple;
	bh=kAmC+E/8rBpCeZR6wivIKX8D5/vOqrGWaZb2OhFQpCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lS8jT3rj6VaT4GDoXS13YvYMGjYnjHiWBc9Wn1ZRCqZkwCVBYJIXj6Buy82+EX5+wX8XT6r4SswSAj3amhn2IGCjvw7VasN5ih28R+u/Jumom7MlzM+fhsBPF44EdzYfEAYLEoRREobE3bQJI1jI0pfCFnLy2cE9IFdQ+2fYUGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PdOQj2g1; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781511953;
	bh=kAmC+E/8rBpCeZR6wivIKX8D5/vOqrGWaZb2OhFQpCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PdOQj2g1PcKrwOWHwIY18Ry4zrb3hNuk3RhYQ6sthcj12/lfB7x+zAx7clsFsMoO2
	 0eLrpTd/IC+gv7ARznPw6IG/IPvlCUYEWfcrpShYe2LYEhHRgGi+bDpE07eTqbqMx6
	 wnSwMZZg5TWP5Gb7o6lvHLaVxq1kwzcSfGb8pLtGUDMK+Ta0cIpXhZeS57F4IlssVM
	 vgiHDM72D1OAfJNJZlGqcETBQ/fRMQDkSEUYF879iE3U9RHJl9FQi1YIayLB+buehD
	 9Lo8O9Ly5z/QtWFsvCnHpNlZzADswyWydVyAD6RosVtOnWL9jPdX36Ry5NZsjbHvNd
	 dN/9YE7w19J8Q==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7713E17E03CE;
	Mon, 15 Jun 2026 10:25:53 +0200 (CEST)
Message-ID: <cf38fbb9-a17c-4297-a696-2efa199afcbb@collabora.com>
Date: Mon, 15 Jun 2026 10:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: verisilicon: rockchip: bound VPU981 AV1
 tile loop and guard divisor
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
 <20260614155609.3107600-5-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260614155609.3107600-5-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64888-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.intel.com,collabora.com];
	FORGED_SENDER(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,collabora.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6037568484E


Le 14/06/2026 à 17:56, Michael Bommarito a écrit :
> rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
> tile_info->tile_cols and writes one descriptor per tile into the tile_info
> DMA buffer, sized for AV1_MAX_TILES. tile_cols / tile_rows come straight
> from the bitstream; reject a zero column or row count and bound the grid to
> AV1_MAX_TILES so the division is safe and the writes stay in the buffer.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 29 +++++++++++++------
>   1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad373233..71d2ef72c4402 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -578,21 +578,32 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
>   	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
>   	    ctrls->tile_group_entry;
> -	int context_update_y =
> -	    tile_info->context_update_tile_id / tile_info->tile_cols;
> -	int context_update_x =
> -	    tile_info->context_update_tile_id % tile_info->tile_cols;
> -	int context_update_tile_id =
> -	    context_update_x * tile_info->tile_rows + context_update_y;
> +	unsigned int tile_cols, tile_rows;
> +	int context_update_y, context_update_x, context_update_tile_id;
>   	u8 *dst = av1_dec->tile_info.cpu;
>   	struct hantro_dev *vpu = ctx->dev;
>   	int tile0, tile1;
>   
> +	/* Guard the divisor and bound the grid to the tile_info buffer. */
> +	tile_cols = tile_info->tile_cols;
> +	tile_rows = tile_info->tile_rows;
> +	if (!tile_cols || !tile_rows)
> +		return;

NACK
because you completely ignore how these values are used later in this function
to set registers.

> +	if (tile_cols * tile_rows > AV1_MAX_TILES) {
> +		tile_cols = min_t(unsigned int, tile_cols, AV1_MAX_TILES);
> +		tile_rows = min_t(unsigned int, tile_rows,
> +				  AV1_MAX_TILES / tile_cols);
> +	}
> +

It isn't possible to recompute tile_cols and tile_rows like that.
Please add this check in validate_av1_tile_info().

> +	context_update_y = tile_info->context_update_tile_id / tile_cols;
> +	context_update_x = tile_info->context_update_tile_id % tile_cols;
> +	context_update_tile_id = context_update_x * tile_rows + context_update_y;

To fix the possible division by zero: initialize the variable to zero when declare them
and only do the division if tile_cols isn't zero.

Thanks,
Benjamin

> +
>   	memset(dst, 0, av1_dec->tile_info.size);
>   
> -	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
> -		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
> -			int tile_id = tile1 * tile_info->tile_cols + tile0;
> +	for (tile0 = 0; tile0 < tile_cols; tile0++) {
> +		for (tile1 = 0; tile1 < tile_rows; tile1++) {
> +			int tile_id = tile1 * tile_cols + tile0;
>   			u32 start, end;
>   			u32 y0 =
>   			    tile_info->height_in_sbs_minus_1[tile1] + 1;

