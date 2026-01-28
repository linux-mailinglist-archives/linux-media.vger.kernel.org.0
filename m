Return-Path: <linux-media+bounces-51724-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIcVL43feWm50gEAu9opvQ
	(envelope-from <linux-media+bounces-51724-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 11:06:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6C9F378
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 11:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7143F305532A
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 10:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33D92D73AE;
	Wed, 28 Jan 2026 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="roh3stYg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394BE2D0635
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594639; cv=none; b=UT0tmnFuuIaK+lbiFsFuUhplIENCls4MhfaY+lCqgU9JzennQ26Mfuig7kp7FjoRgGKfIjtrm7QaMUaGP4vjwOGSDYd6grmjdxSJ8SV/e5sgbJLDBKv4l2I5DIhH08xj+M5eTWm5jSo55sIgnd8lSzhjOXEwx12V+ot6VfrzUQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594639; c=relaxed/simple;
	bh=7IqXQL0kARZhWgh+ADsZmT3tBP273iuy0JxeOoxwv+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP6nDUAZISJbS4lLU5anGEpFltHm81ABF2xqJtNT5ST6SCQdASU6P9GXnG1VCfgzpB6rD18irG3VCV/aPBE9q9UQnhiOkuJyrfPc/wLi7ykFg/svYwL24SsLoHYkNyH3ox2beUBFAmnLxU/zphe2uOxhpFzHPNC3eKnP9xZWPI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=roh3stYg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so6748335e9.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 02:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594635; x=1770199435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+DEJwFD4nwvG5rwICA6kanaUNleRNgtCx1iTjYk/aLA=;
        b=roh3stYgOuveoJ9dWq4niTM0it75m8ZLXpzhASILqt8RDP5mUsQXRpbhUSDNCblH6B
         TTLSywuVsGYDhkCG/mziLk8cU2IpeCiMZxFpsZmdTUjlbYLZp19Ds5IXpMFco9CqIn6Z
         QdRpbxp5g8MHFexeYpasYwg8m6RajCc8kx3vDeGmyzM9NkuA81TxVIb9eJgH8zpDKXYM
         snm7+Gq2R7ueUZYOQNl5hWca9FcBhBjuagwaFWERmWUM9Zo2yakhOjO6JntJ0lzb/N+R
         kzJfjhI18RHSaVZODQm9uSO1RIHcPBJUWMRLlJaw/nYDrAaPY7xfkpMU4fs1wX5jaQHg
         KgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594635; x=1770199435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DEJwFD4nwvG5rwICA6kanaUNleRNgtCx1iTjYk/aLA=;
        b=k3z3mYYkiPsE3gdd+3LcmLUz/Y4FR8XbRRtRa+ZPqG5t6bgjwv2S9iTHqvhEZE0edk
         IEz+FDKwZH5hwdR+4avIuMcIrEU2hHAV/m9AuaD4fN2e5BsgpbaKrYuQNGIFQA4xs7uL
         lVxwFMc7vLqmzu7D8+4sdAEd0Jr2IV/CY+f8oXQCk/WmyR7xATUh/gMi9chwuzGNFhiE
         NhcmTmgR/5ajONpi8vp+UlvK4g5XUSVTc2zh7FJuIvbe7tA4wKJR3GOuIZlgucxA57jA
         tM87XnSUys+UHIUiHY/gLneSljsv9qcaaFGhECchhquomv998dyttS6i0SjBUXqgCluB
         UnQA==
X-Forwarded-Encrypted: i=1; AJvYcCU8WNpDfWb14guBLdTFoiHnaRvXY8xM0C9MAH1nH/7OizMcZp0pyI3u6aVlKdgzrYrT/jSP3Kw00HSHcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA42/52pnu80+liRB5DUZaxSz64K4kPBF/iV1N5Y3MAzx4onsk
	v8kl+UY8GHh2MS9Wurri58zaIbGus4Wwdv9DOCK9NoWZStUoR+6Y0RJID7H0IA8YTe8=
X-Gm-Gg: AZuq6aKhrxoH0KYYy89Q2xs/XmRThjeqg4Ig+3gOHavBairP8RerMj+xhLanC6bFKQd
	yLTg+Vn/y6GRLMKM4L2KnoptZH1mEiSi9GV0YSqxtoYjpXHZKzHwI8IxP5Hnl2kfq6IYVdhBV+2
	YZFMpw3GOZyIIReV6hmmyeZo1et3LTauwzDdO0YNedUrmYvt6ICuwdoG6rV2F94QKD4HUUs7lKq
	N4b1JXvmQSMIP5TvxSZ1ftIk/eEcJ3FiIvO/21JrLyyTrjKh6NoeyKGL4IHHnks8eBoQ8PZeler
	v5ie/eQG+vcATr8ctnTrz8Ha3wNimbGrmF52uoFAU06Pedj2VXdO+FjIErVPpUYGvLjVTaMrK6x
	47Jzmal1XU95dWS/80Upy48lLGQVQW+cN37l+87XUOF4C8qAq2OQgVEqtuX2zOrGW3wBwVGhn2u
	ptKu96LPz3IvkX4pX3
X-Received: by 2002:a05:600c:1c1c:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48069e79529mr75631765e9.11.1769594635356;
        Wed, 28 Jan 2026 02:03:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e483asm5753081f8f.3.2026.01.28.02.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:03:54 -0800 (PST)
Date: Wed, 28 Jan 2026 13:03:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer El Idrissi <omer.e.idrissi@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	gregkh@linuxfoudnation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu3: fix function argument alignment
Message-ID: <aXnfBw6gjULv5xW3@stanley.mountain>
References: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125134900.9964-1-omer.e.idrissi@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51724-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: 5CB6C9F378
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 02:49:00PM +0100, Omer El Idrissi wrote:
> Fix alignment of function arguments to match kernel coding
> style as reported by checkpatch.pl
> 
> Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index bdf5a457752b..c34ff01484e1 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -151,7 +151,7 @@ static int imgu_dummybufs_init(struct imgu_device *imgu, unsigned int pipe)
>  
>  /* May be called from atomic context */
>  static struct imgu_css_buffer *imgu_dummybufs_get(struct imgu_device *imgu,
> -						   int queue, unsigned int pipe)
> +						 int queue, unsigned int pipe)

You should have only delete one space character but you accidentally
deleted two.

regards,
dan carpenter

>  {
>  	unsigned int i;
>  	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
> -- 
> 2.51.0
> 

