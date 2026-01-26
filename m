Return-Path: <linux-media+bounces-51540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LDFEy8/d2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:17:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B80CE86A48
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89C92302B819
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE5F330332;
	Mon, 26 Jan 2026 10:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4+VFlbS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2D330668
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422515; cv=none; b=m4ElmwhmDyYr3LeygTWUFi0qpCS4FBD392v9Td498N0b4F4vtc35ZuiZ+uhUbtHcvqdAbYT5yZAgeF6nNs5+81bKJ0uzIQ/4H74pNVB+6YixxdUkUXaQHzfRa+zcnnH6b2FhWMTMWDKVmfUnKjBSEW9VrDZqcIY5cuk1xbC60ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422515; c=relaxed/simple;
	bh=bBJhTzDwzp3zSoMlB5XuYAiq4s4YxDLv1WYsJ1qrCLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4Eouz4sSY1k7XlrgIwrroFMHHKtEMFNYa5Zc0toIrwUHdUJLpbU3JqoMM99OkUAW0vlIT+lpU1Q9QqvxM2+fZkt7fOeaJRlTo9AjwQ4rsI4lvA0yvrHey5eryYavdoiJj/Jf0oLGc8jQnHrJyaK8tFBe9Sa0Y/ez20wqd6ue6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4+VFlbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4889AC2BC9E;
	Mon, 26 Jan 2026 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769422514;
	bh=bBJhTzDwzp3zSoMlB5XuYAiq4s4YxDLv1WYsJ1qrCLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W4+VFlbSA35IvP6aHJkaZeJQHxB0mMp3+Di9LWhnDD6hKzpI5v70h56Em9jlAiJqm
	 S13HUuMN0YDgLdkqr0PPzdgzW8mVKzW6RegN4UqA+NXbrh5CEmri9GM3vd26SHITqt
	 RsTiJrab4hUZx+9STWf/4rTpCx2hojiFsWgQr3NQDFHvY1oWOtGbbZFAvLgb8hmDO3
	 0x/s09odr3hF9ik9EwjRx6lmlE9WFy36IiSuxeMrhkdD3nBWi/oUItfsfRVEeUcffG
	 FIy63s4rrPg1JSSbCFdg6wLDH3t4y/lX57tBiz7gHSflI9yLzEGOM8A+4J59asJ3re
	 ut/98rSGisTmA==
Message-ID: <9d05c8bb-c411-4b26-98cf-5622c7c13d0e@kernel.org>
Date: Mon, 26 Jan 2026 11:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov02c10: Fix incorrect Bayer pattern to
 SGRBG10
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: bod@kernel.org, sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20260124074402.7165-1-bjsaikiran@gmail.com>
 <20260124074402.7165-2-bjsaikiran@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260124074402.7165-2-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51540-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B80CE86A48
X-Rspamd-Action: no action

Hi,

On 24-Jan-26 08:43, Saikiran wrote:
> The OV02C10 driver incorrectly reports SBGGR10 Bayer pattern, but
> the actual sensor hardware outputs SGRBG10 (Green-Red-Blue-Green).
> This mismatch causes severe green color tint in all captured images.
> 
> The correct pattern was determined through:
> 1. Testing on Lenovo Yoga Slim 7x (Snapdragon X Elite)
> 2. Comparison of all four Bayer patterns (SBGGR10, SGBRG10, SGRBG10, SRGGB10)
> 3. Visual verification with libcamera/qcam showing natural colors with SGRBG10
> 
> Without this fix, the camera produces unusable images with overwhelming
> green tint regardless of lighting conditions or camera application used.
> 
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>

this is already fixed, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/i2c/ov02c10.c?id=905120d7470e5ed79d59b61ef6aa13344ffca229

NACK (to avoid this regressing again)

Regards,

Hans




> ---
>  drivers/media/i2c/ov02c10.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index f156f647081f..cf93d36032e1 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -577,7 +577,7 @@ static void ov02c10_update_pad_format(const struct ov02c10_mode *mode,
>  {
>  	fmt->width = mode->width;
>  	fmt->height = mode->height;
> -	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>  	fmt->field = V4L2_FIELD_NONE;
>  }
>  
> @@ -732,7 +732,7 @@ static int ov02c10_enum_mbus_code(struct v4l2_subdev *sd,
>  	if (code->index > 0)
>  		return -EINVAL;
>  
> -	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>  
>  	return 0;
>  }
> @@ -744,7 +744,7 @@ static int ov02c10_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fse->index >= ARRAY_SIZE(supported_modes))
>  		return -EINVAL;
>  
> -	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
> +	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
>  		return -EINVAL;
>  
>  	fse->min_width = supported_modes[fse->index].width;


