Return-Path: <linux-media+bounces-51544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ9IEXpAd2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:22:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0686C7C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EFA5303AA97
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFC8330313;
	Mon, 26 Jan 2026 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey/JP8N5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD47329E47;
	Mon, 26 Jan 2026 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422874; cv=none; b=YQS0Vu5n59743qxmwj4gzOD359fSm6M+glJVQ3eYigkcMDmIfJjluD2jj1Is6obmvJnqxEUl6wzwuac3p0CjHL1iB26eRz9FpljjWdNXWBjp5x0p2UUilEB20NvPJBwh0eYKswMTL6KjRQ9ByqJfLdHzGRNj2gQlxmSeSlLm7hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422874; c=relaxed/simple;
	bh=rnky48UBvBAciVlhJ/X1U5eXQK9GZPRTNs2YW/Lpd2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ka8fgcmpg3iUzGDtuJjp1gsiBGZjDn/xoXnCrsydUqEmSsozN/kxY2Tl4JEiAzwnGvMM8eczE0Q+UE2KBHdFdTxyG3Rz7iAen56wLZmv51KYe20TQbaevxSrkb3fr4g0+4ab6M7AvO9sFUnvpVCqXBFPDZkjJtToMQk+jBo4+EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey/JP8N5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3300AC116C6;
	Mon, 26 Jan 2026 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769422874;
	bh=rnky48UBvBAciVlhJ/X1U5eXQK9GZPRTNs2YW/Lpd2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ey/JP8N5f6pZJ+i0cVuxyk8IEqlmSl5gjMgUyFM7Wa64r39geA54QmzEg2wDrGBEU
	 1JA+tac/BPVdzOKcVQb6zsemjk+Fj6UOwBNezMiR+qN6P9oiN5Z04eLuUBq/5kyRD9
	 An0LC4/I9b4neUjjpcRfMIbYYXXJupbWj0Nkr5OHJG1hT/AP16FkMnEk9X3erXPnM7
	 2/At0svEiamUdd0rexY+/BdBn18fPj8rb2fDc4CUiYsJygDYhR3laR+PnCfdusGIdF
	 fGpHXXfs4w4EosHGv53lLlbbRJmATF4IKEWIxuyYRGKnD1RA/GtVIr6niBI8cAr/jL
	 JM6kQEJzguERg==
Message-ID: <84361fab-5546-469a-b2b8-c5cb5818326c@kernel.org>
Date: Mon, 26 Jan 2026 11:21:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov02c10: Check for errors in
 disable_streams
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bryan.odonoghue@linaro.org, bod@kernel.org, vladimir.zapolskiy@linaro.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260125171745.484806-3-bjsaikiran@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260125171745.484806-3-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51544-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0C0686C7C
X-Rspamd-Action: no action

Hi,

On 25-Jan-26 18:17, Saikiran wrote:
> The ov02c10_disable_streams() function ignores the return value from
> cci_write() when stopping the sensor. If the I2C write fails (e.g.,
> due to CCI timeout, power management race, or device removal), the
> error is silently lost.
> 
> While we still need to return 0 and call pm_runtime_put() regardless
> of hardware state (to prevent PM reference leaks and pipeline lock
> issues), we should at least log when the hardware stop fails.
> 
> This change:
> 1. Captures the cci_write() return value
> 2. Logs an error if the write fails
> 3. Still returns 0 to ensure proper cleanup
> 
> Returning an error from disable_streams would cause the camss driver's
> video_stop_streaming() to exit early without releasing the pipeline
> lock, permanently locking the camera.
> 
> Fixes: 0e98938b0157 ("media: i2c: add OmniVision OV02C10 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/media/i2c/ov02c10.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index b86cae3d2b74..743d8544ac53 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -629,8 +629,12 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
>  				   u32 pad, u64 streams_mask)
>  {
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret;
> +
> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
> +	if (ret)
> +		dev_err(ov02c10->dev, "failed to stop streaming: %d\n", ret);
>  
> -	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);

cci_write() already logs a message on errors itself, so this is
undesirable as it will lead to duplicate log messages.

NACK, please drop this patch.

Regards,

Hans



