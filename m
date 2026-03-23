Return-Path: <linux-media+bounces-56754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHVhLrxpwWnVSwQAu9opvQ
	(envelope-from <linux-media+bounces-56754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:26:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF82F816A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 747E2301D55C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEAE3BA234;
	Mon, 23 Mar 2026 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qyxXvhUG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD83B8BB9
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281722; cv=none; b=fkfLsg1PIaXOaUghehO1SVKlNv+S9y5g49Gsv7oMUHBLzrjCz0k7oHGVti0cULLNbTcrnU7yD7cU97cUE0A5gtZsMEP6QoWmvYycCzt6GB49B06duU3aDhjlnCSthd8Ld4cZri4cdK9kx3vjiUUXAVNAXn0Ekz5V8I2zXfDCgaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281722; c=relaxed/simple;
	bh=Q80F4IDJ1r0n2L0Q9+6XdvwhcZQG8QGMDk49YIXY/m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOlEdkXyjOQuxom+MYBjof/OMrubOdNKHTU9kdg9zlHXf08G+RH8K03c7QdF4n19eIhKeBirYhFcZBBjY1vEz+4L04+98n6MlumzkPzF3Osba4THZtw8wBvuyjOdNEFcO4/zhAtC5V9fz0/R36pxOTkHYf/C9Yv3PBz5oS8nE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qyxXvhUG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b48ac2727so276155f8f.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774281719; x=1774886519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9r64NEBtm+Yyadr3JGFSt+EeJnvvOthTCQXw/+5HKQ=;
        b=qyxXvhUG/jopADYRtuGJlpMBbWMJeXYZUjSLKPAIXeafEzc77NvIeaOVyqCvUkzk+i
         BDxsS6YW2XPCGiqizb+CfCTjeu6aacwgqmoIuMfjf/pX3Gy8XCgQi3IEjPV5LEW9uCLF
         oSIEnD+3iVefm1siZAZ5mKKh998KqhkILIZvpKRHaPAuv15gBsmvdfhgFCSaAE4mXXn5
         OfVe6wyYtpJFs6hj68vu/zgKlOBJ9y9h9fBYfSwDABjBEpJLtZGplEzcJ4DQwGLl3gkJ
         1Eyfmbffqcx/hGv09jh+1wrsd/sjY2i0TKLqEMXEgztmMm2J3e9WRWskrJn6FnNbKBdj
         oYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281719; x=1774886519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9r64NEBtm+Yyadr3JGFSt+EeJnvvOthTCQXw/+5HKQ=;
        b=KtKxr3X7qkwPiSh3pf6+qUPgwZVOaByv/KQPI3mfUbLhYcI24wfns7RvecAd3QUIbW
         SjgdkMf/H9gVBaHg4OwkrRe0dLV3DBrxs9Z6+Q55Gdce6stBrRCRfWpL2QdL5b6JxnMG
         qFNg3oIC/cxkf9iySAlzq1fEETqbvbnszlRhuW50gZ3hiuzmfoXNwU6HNUAzvSQ6zOCt
         zJ0CPxAFhqS/ETRLgVT1BaSlfW19uxJeQYuIFfsPiE7lfQYhHm6ihjsX31yj42hzTUq6
         Xazf9gKOm/xB90RIp9p/LkG6nA8FVFFey+BqVtWK0m1+yJUaVBcJVZnOGGn/PimyCcvc
         RJtA==
X-Forwarded-Encrypted: i=1; AJvYcCXWMiTd4I6NHKNchRsAkzxg5kTkR7sqDlGM1MfXSnuut1PuW8uETolADR+UwksOHRiHleZgidLFZPYBGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwziPYAOoDpeeUUcGuz9UXCh6Q8r+px7XfkuqSOlUuWjpWqDd27
	1+nPfWZpHThVqo+hdQMGIbwRVSDVyydHhJnwbAfNpaaF0J2eCZPwO/trKwrIypTUkYM=
X-Gm-Gg: ATEYQzzF0rINpKu2qHyrxyXA/vTheAVXfaqTMcR7+xKxYrsT97H9zR5twl2wrK/gugQ
	+C8+lZQN+wvp+4ZnklccZk2SyHo/lhbic+S4IFNlY15/1RfwGHu+QfMvun91CSIgDJA2DTrwwzU
	4coFc2+Ha+nx/822Q/McoxaLuUdxUXclavF/DnqnwkZFASP9VP51zAoczoIuMg5JIv+6gvDNmF7
	VlezxDT8bAtE+Lx6v+WaTWXOfWDn19YtA2kUSoi3+oYe23bH53BqlS5PFpr6O5EC0BSXWVG6O5t
	s1JteCH1rUkjssSs+rG23DTfPKv7H4Gh+sQoSbiwP4hLsbkFIB08k0OSvxe9AA1R7b9kgUWqI00
	vqO9d/ZiDe1xAgIrg6sVwXVoZJeuf3YC6YZjxOGB8hy4czHP1Z+9ms9onvbQHrLDO10FfBd8A2m
	apLqF2Ae0hZ87xEG+/w6vI8K4xYvbJ
X-Received: by 2002:a05:6000:290b:b0:439:c67d:9fe8 with SMTP id ffacd0b85a97d-43b6424ef8bmr20394777f8f.22.1774281719032;
        Mon, 23 Mar 2026 09:01:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm26629531f8f.0.2026.03.23.09.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:01:58 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:01:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3] media: atomisp: fix spelling mistake
Message-ID: <acFj89pWfmhLKzQ4@stanley.mountain>
References: <20260323141143.27280-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323141143.27280-1-med08elkadiri@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56754-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,stanley.mountain:mid]
X-Rspamd-Queue-Id: C1AF82F816A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:11:43PM +0100, Mohammed EL Kadiri wrote:
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index 856561e951a5..a6eab5f52b75 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -434,7 +434,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
>  	/*
>  	 * FIX ME:
>  	 *
> -	 * how to destroy the bo when it is stilled MMAPED?
> +	 * how to destroy the bo when it is stilled MAPPED?


MMAPPED was correct.  It means memory mapped.

>  	 *
>  	 * ideally, this will not happened as hmm_bo_release
>  	 * will only be called when kref reaches 0, and in mmap
> @@ -443,7 +443,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
>  	 */
>  	if (bo->status & HMM_BO_MMAPED) {
>  		mutex_unlock(&bdev->rbtree_mutex);
> -		dev_dbg(atomisp_dev, "destroy bo which is MMAPED, do nothing\n");
> +		dev_dbg(atomisp_dev, "destroy bo which is MAPPED, do nothing\n");

Same.

>  		return;
>  	}
>  

(always wait a day between resending a patch in case other people have
feedback).

regards,
dan carpenter


