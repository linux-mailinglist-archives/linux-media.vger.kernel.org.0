Return-Path: <linux-media+bounces-51480-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJWvNw0MdmkNLAEAu9opvQ
	(envelope-from <linux-media+bounces-51480-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:26:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67E8087C
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 153533001CE2
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AB031AA87;
	Sun, 25 Jan 2026 12:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdBlZTYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8DF20B80B
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769344002; cv=none; b=LLaUxVgC6+8ZSULHbAr/2DHcovKK0jX1Pl1glzgsdSxJECFQJGsQgkf8EBOMX6wlclNqrQR7f8YH5cOfNZpWbsb5Zhgcr4qbvqfkMoLq/5VSp7Pk/nHFRvBwRiVI9j3acB0CPvKqZeQc82JL1ty2l51UH/YLi6GTIVUz5SRD1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769344002; c=relaxed/simple;
	bh=i8XuVZ1AesJV/+dU5wloujfDPbMZDtyqrw1twBejzHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyO3IsF8H50FQL8WIxktyRNGkY6D8PVSNQh0j5n20CgEdrdXBxS6OI4nbyxdm3QjjEb9zfsO3iKnOLmXdLZuPjVhCQpWtTkXWgyUcIrIHeWf60ug0Vd1ap/eT8FqIwlOKOqB5JKHSwMzwjDOYj5lhtqk2sYnKxFxxlH77oEGZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BdBlZTYn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48049955f7fso30014795e9.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 04:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769343999; x=1769948799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDCitePNW8DbwRGvTAjOr4gcKw/9/Pa6j9Q+g0gBad4=;
        b=BdBlZTYnXL5YZwPMRYQ+9BdlitrGeA+JCvNCsWggTpmzTBFeTVCdJW0hs/3CV+Udml
         +33Ap0mtByN8q0TR82SfjMutJqjSjIhXhjDxIKhR6a38agJtBXY6L0VoozT9a7XDyG8H
         RoqA5krFtupEjpvRGx8BMA+edj9CvkW8Ceb4uF4jlzLaEiA+L+EnKHrDDItrcDqx1/G9
         jZYeO3qN/sIylTzjPkVY11R9mTjkUJpI9187ks4kQM7Tv/KCIveI0fdj85m4uksYdT2O
         GfqLFgqOIh1Lx4auaIwxb5OeKEz6fGfM/JZLx+K9CirfP9FUvD0gbJJkEuV45DwtqlMx
         YavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769343999; x=1769948799;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDCitePNW8DbwRGvTAjOr4gcKw/9/Pa6j9Q+g0gBad4=;
        b=dcimo9ACveFQS0q0e/614Y/D05IPKsAiPGTzG1FSe4un8h3EiN/i814eMSYHwWYZ2e
         QnGTzZt+hZF6Mm7Riooj4/G3hwz6Z99pd9a4MGLK2rN/6g0rFodsqr3dG5xtoQx/KHrG
         LSorXEmOGJz6cl7kwf+fx0M0rx2OiYLl5vkADL1OXjCIzUNSzlzprc67oIiUAdWpQJzr
         kfUa7gG+NLvB76h+vOlXPnQtWfQoaX/N4BXplfT2KfsTdSxF1zuCKFKqadEkuWgYZxdN
         Ui7sSSzpafMUJjMgDKSW01g2bzDv1Xe8ONp6pbhTa0vpmwoYPdeLTMnF3/f6ZaANwwb1
         e+pA==
X-Forwarded-Encrypted: i=1; AJvYcCU96nMFD9EL+jVL+BcmDBseRNzzawIMkJlHifaqu5D6y3kvBDud4KcPBsyStPkYegRXIecpH46VCvn1qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZySyX0GyRtZkuxeFuXHZKhoXLtI4A1a/yE83NT0MRgtT/NIFr
	ddxp/HCio4j8UBJ7fj8oyKAaWuWi/uAxKaU/huk2hZM9lCHNWkXASAFblbsDq6DFVfk=
X-Gm-Gg: AZuq6aJg6rNzPCKDdckJQHODGLreyyi9uXUUtyp/CbgrgE3shF/eJAtrjxBlPjwPp//
	CEcQZQBoXIz/wyu8y1AyLMQkgS/yxpoNJEF0zFDKk3i9n4LivFqwRQUk2t+WSiXsT+7DhwfW936
	hEibUvREGA7CYV/KDb4pPS812phKJ1MVHpTnCWGZW5nNgHmQk1N88kwbWnaug+qs75yzsWJVdm9
	Rn1LiyT5s0fIOpm0ycPDTjUqqX0PhBDVvIJjXcZxQBLBNp76CfmoaxuSy7JLezZnQi1iOdPQfK5
	jIa2NC3F/cdamPiNCVeMLtOQSBngSAnfVQa0vyYicwrOshHCpveSFWiL9HPdiqEQuQFiMEU2ssD
	E4+RjvjLM/ki/hLZbU3pPJWgiEejcHMp1DmmSGPxRcCKZp/n1Sr0tO+ly8OAjUMxy5OWmKQIuBZ
	8LcFCsqgPlzMc/LhAefREPMv0pz6UP5eUDrMv55DvcBmlo4KTgpFrj
X-Received: by 2002:a05:6000:2306:b0:435:97b4:b699 with SMTP id ffacd0b85a97d-435ca39bf18mr2232170f8f.51.1769343998806;
        Sun, 25 Jan 2026 04:26:38 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e715bfsm22908159f8f.22.2026.01.25.04.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 04:26:38 -0800 (PST)
Message-ID: <388c246c-3e7f-4297-a9a1-3895c3312533@linaro.org>
Date: Sun, 25 Jan 2026 12:26:37 +0000
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
 bod@kernel.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
 <20260124071751.5885-3-bjsaikiran@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260124071751.5885-3-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51480-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: CB67E8087C
X-Rspamd-Action: no action

On 24/01/2026 07:17, Saikiran wrote:
> The ov02c10_disable_streams() function ignores the return value from
> cci_write() when stopping the sensor. If the I2C write fails (e.g.,
> due to CCI timeout, power management race, or device removal), the
> error is silently lost.
> 
> While we still need to return 0 and call pm_runtime_put() regardless
> of hardware state (to prevent PM reference leaks and pipeline lock
> issues), we should at least log when the hardware stop fails.

Should we return 0 when disable_streams fails ?

I think the argument for the pm_runtime_put makes some sense.
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

Needs.

- Fixes:
- Cc: stable@vger.kernel.org

See: Documentation/process/submitting-patches.rst

> ---
>   drivers/media/i2c/ov02c10.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index b86cae3d2b74..db191dccff75 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -629,10 +629,20 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
>   				   u32 pad, u64 streams_mask)
>   {
>   	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret;
> +
> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
> +	if (ret)
> +		dev_err(ov02c10->dev, "failed to stop streaming: %d\n", ret);
>   
> -	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
>   	pm_runtime_put(ov02c10->dev);
>   
> +	/*
> +	 * Return 0 even if cci_write failed. The stream is being stopped,
> +	 * so we must release the PM runtime reference regardless of hardware
> +	 * state. Returning an error here would cause pipeline lock leaks in
> +	 * the camss driver.
> +	 */

I don't think the comment is necessary - your commit log will document 
all the detail you need.

>   	return 0;
>   }
>   


