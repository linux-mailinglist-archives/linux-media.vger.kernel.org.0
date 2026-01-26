Return-Path: <linux-media+bounces-51542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBSJBi9Ad2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:21:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2F686BED
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA4EC302711C
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C54832ED46;
	Mon, 26 Jan 2026 10:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USnd+ZB7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968E321B191;
	Mon, 26 Jan 2026 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422701; cv=none; b=eI+hxwLe+8k+PbknYYmXwUXLAohKV/gcNN8pQbqKbuZqCiczcA1z/w9m8s6ijpW4bS8R2gyIMh+i6JhrcdC+AgDpLHndzrwshJd8SONhAaFrdxh9zGXPYC0kxtVgs3fUDqsS2WisPZdwLgazBh8oO2E+0VkYLceMu1JHpDKW37E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422701; c=relaxed/simple;
	bh=SLn0xfRQuWOUiyd56GYWDPjUlG0vLuaDEWo/7BKo5Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M25h/d2V3vTDAC6z+WgleZhYSxXvGE/kzlyjqMNT/ZzJImTgPBKAR5SE8CcyAAvtCQHjNV1383TMlrU1cI5RdaejJCCiZGfsvmGQUkvB+XB9kbQAO0Dr/lVs1WQ55RUfp9WkBwMDi1DLevdavoIAaJiUY9PcZDQ6iRb/IsCnj1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USnd+ZB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25488C116C6;
	Mon, 26 Jan 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769422701;
	bh=SLn0xfRQuWOUiyd56GYWDPjUlG0vLuaDEWo/7BKo5Eg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=USnd+ZB7rPA2rhPH/Qx2w/FdVCuTD1HaazAXbKPcA//gBJmpPacAgznCOmw72006B
	 3n0+zQ3PgDpvoHxQoEzVOWF10210O4L0WM1EGA1PyodI8ZPTUwgT77FF9WHYHc++aW
	 0AS4J/xt2NMI9GvlMCpGkZhaBH8rbkoGpkdzVskuVtcR60tj/U++6RN3Gj0Amcxez5
	 4FS9wBligaU9wtuo7tFsASjgTbtODijs59gA2Om6jA5MkLD7XCBZEYJiEP5flKeAkT
	 LfgMXpRmXFyxaSGHCFvjY+IVnaJT6pgs4RfGbY7ogj/FUtSB2hP4mQ5SKGn15PjJk9
	 tq3ljtkLUvQBg==
Message-ID: <fe96c6bb-08c9-443b-afa7-ba5e59b9a1cb@kernel.org>
Date: Mon, 26 Jan 2026 11:18:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov02c10: Check for errors in disable_streams
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bryan.odonoghue@linaro.org, bod@kernel.org, vladimir.zapolskiy@linaro.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
 <20260124071751.5885-3-bjsaikiran@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260124071751.5885-3-bjsaikiran@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-51542-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC2F686BED
X-Rspamd-Action: no action

Hi,

On 24-Jan-26 08:17, Saikiran wrote:
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
> lock, permanently locking the camera (see commit 044f54e7c).
> 
> Related-to: commit 7673f757858c ("media: i2c: ov02c10: Fix race condition in remove and relax reset timings")
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/media/i2c/ov02c10.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index b86cae3d2b74..db191dccff75 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -629,10 +629,20 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
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

>  	pm_runtime_put(ov02c10->dev);
>  
> +	/*
> +	 * Return 0 even if cci_write failed. The stream is being stopped,
> +	 * so we must release the PM runtime reference regardless of hardware
> +	 * state. Returning an error here would cause pipeline lock leaks in
> +	 * the camss driver.
> +	 */

And as Brian stated such a big comment is not really necessary. disable_streams()
always returning 0 is normal and at some point we really ought to just make
its return-type "void".

So neither change is necessary here and this patch should be dropped.

Regards,

Hans



