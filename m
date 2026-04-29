Return-Path: <linux-media+bounces-59932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEauA/218WmjjwEAu9opvQ
	(envelope-from <linux-media+bounces-59932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:40:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D3A490969
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A52B1303E218
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 084E23A5452;
	Wed, 29 Apr 2026 07:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgTHDlSZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697F23822AF;
	Wed, 29 Apr 2026 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448416; cv=none; b=p50jctLPHG4u0sXSnVNjFgTA1EDOm6k7217e5lI6cz5r1oMJL7AraWXhbRZ09azki9B0uqD1eGSCrowORZ5QT91TLSp41qMwRqfFIKs8bzjCSjviYkygWEy7/i9GzUSmmbLdjAyUk785Q0zIcneEwOreuuiiiZDlj89kUB7Sutk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448416; c=relaxed/simple;
	bh=zmNbVrNp2RW4Zg4aJgDXOMdQjPgGOPwR4cHpP92Taj0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SwJNZLUOVqAYat6fl+/7fDZFGqme9OBhz4HGVcxpqXDT97gOqekWaXJEzConZky5Y0l5ID7mdoF3q1RWGoJChryx0z7FTIOcs670fkqgbh7zSH7on4z1qISKPSYRhdetwOcyaFZDjl0IMM6UQNWCGPejVOTgW3QRhcSm8fYLr2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgTHDlSZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F85C19425;
	Wed, 29 Apr 2026 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777448416;
	bh=zmNbVrNp2RW4Zg4aJgDXOMdQjPgGOPwR4cHpP92Taj0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=sgTHDlSZoF7UMGvIvD3/7l09RbdRsHpyU70n4QkDdJjOKcMQ25lS6J78rYrfIxI67
	 fOL2fy8enHKoK4j1hSeQSU0SeouzUZFEhsiSIsZ2JRpLCjf7Kyb+TT3lwCWZ+I5ZHi
	 YPsNFOweD76DammEHOhyhuYg0OYYbSIJvcw/XqtEdpOKswaYEJdrY7bqgVWIoOHB7V
	 GZxyZfRAUKqcAA68PD29pEp7c+CLTw2vhtYVrM+gR6G0Eu2QN/YIjHSpvWGfz04pI5
	 L+HKSetvgAXjuH9Sb9x3DEj8UXSpGlfdZJmeWb5DUC0iccqVouA2bwYxV6F6Ny4GXV
	 8rp/y60QcNpWg==
Message-ID: <5d6c6af3-06ee-479f-8003-8b0b5cab569b@kernel.org>
Date: Wed, 29 Apr 2026 09:40:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 3/6] media: i2c: adv7604: Add range checks for chip info
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
 <20260428-smatch-7-1-v1-3-46890dffb611@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <20260428-smatch-7-1-v1-3-46890dffb611@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 78D3A490969
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59932-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email]

On 28/04/2026 14:41, Ricardo Ribalda wrote:
> If the driver's chip information is invalid we can end up accessing an
> invalid memory region.
> 
> This fixes the following smatch errors:

"This fixes the following false positive smatch errors:"

> drivers/media/i2c/adv7604.c:3672 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= 4294967294
> drivers/media/i2c/adv7604.c:3673 adv76xx_probe() error: buffer overflow 'state->pads' 7 <= u32max
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

> ---
>  drivers/media/i2c/adv7604.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 67116a4ef134..ae75982fb514 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -3668,6 +3668,12 @@ static int adv76xx_probe(struct i2c_client *client)
>  
>  	state->source_pad = state->info->num_dv_ports
>  			  + (state->info->has_afe ? 2 : 0);
> +	if (WARN_ON(state->source_pad >= ADV76XX_PAD_MAX)) {
> +		err = -EINVAL;
> +		v4l2_err(sd, "invalid chip info\n");
> +		goto err_i2c;
> +	}
> +
>  	for (i = 0; i < state->source_pad; ++i)
>  		state->pads[i].flags = MEDIA_PAD_FL_SINK;
>  	state->pads[state->source_pad].flags = MEDIA_PAD_FL_SOURCE;
> 


